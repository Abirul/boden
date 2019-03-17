set(_source_files
    ${_source_dir}/AnimatableLayers/LOTCompositionContainer.h
    ${_source_dir}/AnimatableLayers/LOTCompositionContainer.m
    ${_source_dir}/AnimatableLayers/LOTLayerContainer.h
    ${_source_dir}/AnimatableLayers/LOTLayerContainer.m
    ${_source_dir}/AnimatableLayers/LOTMaskContainer.h
    ${_source_dir}/AnimatableLayers/LOTMaskContainer.m
    ${_source_dir}/AnimatableProperties/LOTBezierData.h
    ${_source_dir}/AnimatableProperties/LOTBezierData.m
    ${_source_dir}/AnimatableProperties/LOTKeyframe.h
    ${_source_dir}/AnimatableProperties/LOTKeyframe.m
    ${_source_dir}/Extensions/CGGeometry+LOTAdditions.h
    ${_source_dir}/Extensions/CGGeometry+LOTAdditions.m
    ${_source_dir}/Extensions/LOTBezierPath.h
    ${_source_dir}/Extensions/LOTBezierPath.m
    ${_source_dir}/Extensions/LOTHelpers.h
    ${_source_dir}/Extensions/LOTRadialGradientLayer.h
    ${_source_dir}/Extensions/LOTRadialGradientLayer.m
    ${_source_dir}/Extensions/UIColor+Expanded.h
    ${_source_dir}/Extensions/UIColor+Expanded.m
    ${_source_dir}/MacCompatibility/CALayer+Compat.h
    ${_source_dir}/MacCompatibility/CALayer+Compat.m
    ${_source_dir}/MacCompatibility/LOTPlatformCompat.h
    ${_source_dir}/MacCompatibility/NSValue+Compat.h
    ${_source_dir}/MacCompatibility/NSValue+Compat.m
    ${_source_dir}/MacCompatibility/UIBezierPath.h
    ${_source_dir}/MacCompatibility/UIBezierPath.m
    ${_source_dir}/MacCompatibility/UIColor.h
    ${_source_dir}/MacCompatibility/UIColor.m
    ${_source_dir}/Models/LOTAsset.h
    ${_source_dir}/Models/LOTAsset.m
    ${_source_dir}/Models/LOTAssetGroup.h
    ${_source_dir}/Models/LOTAssetGroup.m
    ${_source_dir}/Models/LOTLayer.h
    ${_source_dir}/Models/LOTLayer.m
    ${_source_dir}/Models/LOTLayerGroup.h
    ${_source_dir}/Models/LOTLayerGroup.m
    ${_source_dir}/Models/LOTMask.h
    ${_source_dir}/Models/LOTMask.m
    ${_source_dir}/Models/LOTModels.h
    ${_source_dir}/Models/LOTShapeCircle.h
    ${_source_dir}/Models/LOTShapeCircle.m
    ${_source_dir}/Models/LOTShapeFill.h
    ${_source_dir}/Models/LOTShapeFill.m
    ${_source_dir}/Models/LOTShapeGradientFill.h
    ${_source_dir}/Models/LOTShapeGradientFill.m
    ${_source_dir}/Models/LOTShapeGroup.h
    ${_source_dir}/Models/LOTShapeGroup.m
    ${_source_dir}/Models/LOTShapePath.h
    ${_source_dir}/Models/LOTShapePath.m
    ${_source_dir}/Models/LOTShapeRectangle.h
    ${_source_dir}/Models/LOTShapeRectangle.m
    ${_source_dir}/Models/LOTShapeRepeater.h
    ${_source_dir}/Models/LOTShapeRepeater.m
    ${_source_dir}/Models/LOTShapeStar.h
    ${_source_dir}/Models/LOTShapeStar.m
    ${_source_dir}/Models/LOTShapeStroke.h
    ${_source_dir}/Models/LOTShapeStroke.m
    ${_source_dir}/Models/LOTShapeTransform.h
    ${_source_dir}/Models/LOTShapeTransform.m
    ${_source_dir}/Models/LOTShapeTrimPath.h
    ${_source_dir}/Models/LOTShapeTrimPath.m
    ${_source_dir}/Private/LOTAnimationCache.m
    ${_source_dir}/Private/LOTAnimationView.m
    ${_source_dir}/Private/LOTAnimationView_Internal.h
    ${_source_dir}/Private/LOTBlockCallback.m
    ${_source_dir}/Private/LOTComposition.m
    ${_source_dir}/Private/LOTInterpolatorCallback.m
    ${_source_dir}/Private/LOTKeypath.m
    ${_source_dir}/Private/LOTValueCallback.m
    ${_source_dir}/PublicHeaders/LOTAnimatedControl.h
    ${_source_dir}/PublicHeaders/LOTAnimationCache.h
    ${_source_dir}/PublicHeaders/LOTAnimationView.h
    ${_source_dir}/PublicHeaders/LOTAnimationView_Compat.h
    ${_source_dir}/PublicHeaders/LOTBlockCallback.h
    ${_source_dir}/PublicHeaders/LOTCacheProvider.h
    ${_source_dir}/PublicHeaders/LOTComposition.h
    ${_source_dir}/PublicHeaders/LOTInterpolatorCallback.h
    ${_source_dir}/PublicHeaders/LOTKeypath.h
    ${_source_dir}/PublicHeaders/Lottie.h
    ${_source_dir}/PublicHeaders/LOTValueCallback.h
    ${_source_dir}/PublicHeaders/LOTValueDelegate.h
    ${_source_dir}/RenderSystem/AnimatorNodes/LOTCircleAnimator.h
    ${_source_dir}/RenderSystem/AnimatorNodes/LOTCircleAnimator.m
    ${_source_dir}/RenderSystem/AnimatorNodes/LOTPathAnimator.h
    ${_source_dir}/RenderSystem/AnimatorNodes/LOTPathAnimator.m
    ${_source_dir}/RenderSystem/AnimatorNodes/LOTPolygonAnimator.h
    ${_source_dir}/RenderSystem/AnimatorNodes/LOTPolygonAnimator.m
    ${_source_dir}/RenderSystem/AnimatorNodes/LOTPolystarAnimator.h
    ${_source_dir}/RenderSystem/AnimatorNodes/LOTPolystarAnimator.m
    ${_source_dir}/RenderSystem/AnimatorNodes/LOTRoundedRectAnimator.h
    ${_source_dir}/RenderSystem/AnimatorNodes/LOTRoundedRectAnimator.m
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTArrayInterpolator.h
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTArrayInterpolator.m
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTColorInterpolator.h
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTColorInterpolator.m
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTNumberInterpolator.h
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTNumberInterpolator.m
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTPathInterpolator.h
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTPathInterpolator.m
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTPointInterpolator.h
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTPointInterpolator.m
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTSizeInterpolator.h
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTSizeInterpolator.m
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTTransformInterpolator.h
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTTransformInterpolator.m
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTValueInterpolator.h
    ${_source_dir}/RenderSystem/InterpolatorNodes/LOTValueInterpolator.m
    ${_source_dir}/RenderSystem/LOTAnimatorNode.h
    ${_source_dir}/RenderSystem/LOTAnimatorNode.m
    ${_source_dir}/RenderSystem/LOTRenderNode.h
    ${_source_dir}/RenderSystem/LOTRenderNode.m
    ${_source_dir}/RenderSystem/ManipulatorNodes/LOTTrimPathNode.h
    ${_source_dir}/RenderSystem/ManipulatorNodes/LOTTrimPathNode.m
    ${_source_dir}/RenderSystem/RenderNodes/LOTFillRenderer.h
    ${_source_dir}/RenderSystem/RenderNodes/LOTFillRenderer.m
    ${_source_dir}/RenderSystem/RenderNodes/LOTGradientFillRender.h
    ${_source_dir}/RenderSystem/RenderNodes/LOTGradientFillRender.m
    ${_source_dir}/RenderSystem/RenderNodes/LOTRenderGroup.h
    ${_source_dir}/RenderSystem/RenderNodes/LOTRenderGroup.m
    ${_source_dir}/RenderSystem/RenderNodes/LOTRepeaterRenderer.h
    ${_source_dir}/RenderSystem/RenderNodes/LOTRepeaterRenderer.m
    ${_source_dir}/RenderSystem/RenderNodes/LOTStrokeRenderer.h
    ${_source_dir}/RenderSystem/RenderNodes/LOTStrokeRenderer.m
    )
