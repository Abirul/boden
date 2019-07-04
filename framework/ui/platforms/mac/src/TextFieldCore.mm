#import <Cocoa/Cocoa.h>
#import <bdn/mac/TextFieldCore.hh>

@interface BdnTextFieldDelegate : NSObject <NSTextFieldDelegate>

@property(nonatomic, assign) std::weak_ptr<bdn::ui::mac::TextFieldCore> textFieldCore;
@property(nonatomic, weak) NSTextField *nsTextField;

- (void)controlTextDidChange:(NSNotification *)obj;
- (void)submitted;
- (void)setNsTextField:(NSTextField *)nsTextField;

@end

@implementation BdnTextFieldDelegate

- (void)setNsTextField:(NSTextField *)nsTextField
{
    _nsTextField = nsTextField;
    _nsTextField.delegate = self;
    _nsTextField.target = self;
    _nsTextField.action = @selector(submitted);
}

- (void)controlTextDidChange:(NSNotification *)obj
{
    if (auto core = self.textFieldCore.lock()) {
        NSTextView *textView = [obj.userInfo objectForKey:@"NSFieldEditor"];
        core->text = bdn::fk::nsStringToString(textView.textStorage.string);
    }
}

- (void)submitted
{
    if (auto core = self.textFieldCore.lock()) {
        core->submitCallback.fire();
    }
}

@end

namespace bdn::ui::detail
{
    CORE_REGISTER(TextField, bdn::ui::mac::TextFieldCore, TextField)
}

namespace bdn::ui::mac
{
    NSTextField *TextFieldCore::_createNsTextView()
    {
        NSTextField *textField = [[NSTextField alloc] init];
        textField.allowsEditingTextAttributes = NO; // plain textfield, no attribution/formatting
        textField.cell.wraps = NO;                  // no word wrapping
        textField.cell.scrollable = YES;            // but scroll horizontally instead
        return textField;
    }

    TextFieldCore::TextFieldCore(const std::shared_ptr<ViewCoreFactory> &viewCoreFactory)
        : mac::ViewCore(viewCoreFactory, _createNsTextView())
    {}

    TextFieldCore::~TextFieldCore()
    {
        _delegate.textFieldCore = std::weak_ptr<TextFieldCore>();
        _delegate = nil;
    }

    void TextFieldCore::init()
    {
        mac::ViewCore::init();

        _delegate = [[BdnTextFieldDelegate alloc] init];
        _delegate.textFieldCore = shared_from_this<TextFieldCore>();
        _delegate.nsTextField = (NSTextField *)nsView();

        text.onChange() += [=](auto &property) {
            NSTextField *textField = (NSTextField *)nsView();
            if (fk::nsStringToString(textField.stringValue) != property.get()) {
                textField.stringValue = fk::stringToNSString(property.get());
            }
        };

        font.onChange() += [=](auto &property) { setFont(property.get()); };
    }

    float TextFieldCore::calculateBaseline(Size forSize, bool forIndicator) const
    {
        NSTextField *textField = (NSTextField *)nsView();

        return static_cast<float>(textField.firstBaselineOffsetFromTop + 1);
    }

    void TextFieldCore::setFont(const Font &font)
    {
        NSTextField *textField = (NSTextField *)nsView();

        static NSFont *defaultFont = textField.font;

        float size = defaultFont.pointSize;

        switch (font.size.type) {
        case Font::Size::Type::Inherit:
        case Font::Size::Type::Medium:
            break;
        case Font::Size::Type::Small:
            size *= 0.75;
            break;
        case Font::Size::Type::XSmall:
            size *= 0.5;
            break;
        case Font::Size::Type::XXSmall:
            size *= 0.25;
            break;
        case Font::Size::Type::Large:
            size *= 1.25;
            break;
        case Font::Size::Type::XLarge:
            size *= 1.5;
            break;
        case Font::Size::Type::XXLarge:
            size *= 1.75;
            break;
        case Font::Size::Type::Percent:
            size *= font.size.value;
            break;
        case Font::Size::Type::Points:
        case Font::Size::Type::Pixels:
            size = font.size.value;
            break;
        }

        NSFont *nsFont = nullptr;

        if (font.family.empty()) {
            nsFont = [defaultFont copy];
        } else {
            nsFont = [NSFont fontWithName:fk::stringToNSString(font.family) size:size];
        }

        NSString *fontFamily = nsFont.familyName;

        auto fontManager = [NSFontManager sharedFontManager];

        NSFontTraitMask fontTraits = 0;
        int fontWeight = NSFontWeightRegular;

        if (font.weight == Font::Weight::Inherit) {
            fontWeight = [fontManager weightOfFont:defaultFont];
            fontTraits = [fontManager traitsOfFont:defaultFont];
        } else if (font.weight == Font::Weight::Bold) {
            fontWeight = NSFontWeightBold;
            fontTraits |= NSBoldFontMask;
        } else if (font.weight == Font::Weight::Normal) {
            fontWeight = NSFontWeightRegular;
        } else {
            fontWeight = ((double)font.weight / 1000.0) * 15;
        }

        if (font.style == Font::Style::Italic) {
            fontTraits |= NSItalicFontMask;
        }

        if (font.variant == Font::Variant::SmallCaps) {
            fontTraits |= NSSmallCapsFontMask;
        }

        nsFont = [fontManager fontWithFamily:fontFamily traits:fontTraits weight:fontWeight size:size];

        textField.font = nsFont;
    }
}
