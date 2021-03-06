#pragma once

#include <bdn/platform/Hooks.h>

namespace bdn
{
    namespace platform
    {
        class MacHooks : public Hooks
        {
          public:
            static void init();

          public:
            void debuggerPrint(const std::string &text) override;
            bool debuggerPrintGoesToStdErr() override;
        };
    }
}
