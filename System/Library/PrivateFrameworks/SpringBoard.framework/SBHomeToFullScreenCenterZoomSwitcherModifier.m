@implementation SBHomeToFullScreenCenterZoomSwitcherModifier

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIRectCornerRadii result;

  -[SBHomeToFullScreenCenterZoomSwitcherModifier displayCornerRadius](self, "displayCornerRadius", a3);
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (double)homeScreenScale
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase");
  -[SBHomeToFullScreenCenterZoomSwitcherModifier switcherSettings](self, "switcherSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 1.0;
  if (v3 >= 2)
  {
    objc_msgSend(v5, "crossblurDosidoSmallScale");
    v6 = v7;
  }

  return v6;
}

- (int64_t)homeScreenBackdropBlurType
{
  if (!-[SBHomeToFullScreenCenterZoomSwitcherModifier hasHomeButton](self, "hasHomeButton"))
    return 3;
  if (-[SBHomeToFullScreenCenterZoomSwitcherModifier isDevicePad](self, "isDevicePad"))
    return 1;
  return 3;
}

- (id)topMostLayoutElements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_toAppLayout;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = v9;
  if (self->_shouldForceDefaultAnchorPointForTransition
    && objc_msgSend(v9, "isEqual:", self->_toAppLayout))
  {
    -[SBHomeToFullScreenCenterZoomSwitcherModifier appLayouts](self, "appLayouts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeToFullScreenCenterZoomSwitcherModifier frameForIndex:](self, "frameForIndex:", objc_msgSend(v11, "indexOfObject:", self->_toAppLayout));
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
    -[SBHomeToFullScreenCenterZoomSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v28, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v10, x, y, width, height);
    v13 = v20;
    v15 = v21;
    v17 = v22;
    v19 = v23;
  }

  v24 = v13;
  v25 = v15;
  v26 = v17;
  v27 = v19;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (v9 = 0.5, v10 = 0.5, (objc_msgSend(v7, "isEqual:", self->_toAppLayout) & 1) == 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
    -[SBHomeToFullScreenCenterZoomSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v15, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v8, x, y);
    v9 = v11;
    v10 = v12;
  }

  v13 = v9;
  v14 = v10;
  result.y = v14;
  result.x = v13;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBHomeToFullScreenCenterZoomSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  -[SBHomeToFullScreenCenterZoomSwitcherModifier _opacitySettings](self, "_opacitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpacitySettings:", v7);

  return v5;
}

- (id)_opacitySettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHomeToFullScreenCenterZoomSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "crossblurDosidoSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_layoutSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHomeToFullScreenCenterZoomSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "crossblurDosidoSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)transitionWillBegin
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBBlurItemContainerParameters *v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  SBBlurItemContainerParameters *v16;
  SBBlurItemContainerSwitcherEventResponse *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v20, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBBlurItemContainerParameters defaultCrossblurBlurParameters](SBBlurItemContainerParameters, "defaultCrossblurBlurParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeToFullScreenCenterZoomSwitcherModifier switcherSettings](self, "switcherSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [SBBlurItemContainerParameters alloc];
  objc_msgSend(v8, "homeScreenCenterZoomInitialBlur");
  v11 = v10;
  v12 = objc_msgSend(v6, "shouldRasterize");
  objc_msgSend(v6, "rasterizationScale");
  v14 = v13;
  objc_msgSend(v6, "blurAnimationSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBBlurItemContainerParameters initWithBlurRadius:shouldRasterize:rasterizationScale:inputQuality:inputIntermediateBitDepth:blurAnimationSettings:](v9, "initWithBlurRadius:shouldRasterize:rasterizationScale:inputQuality:inputIntermediateBitDepth:blurAnimationSettings:", v12, 1, 1, v15, v11, v14);

  v17 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:blurParameters:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:blurParameters:animationUpdateMode:", self->_toAppLayout, 1, v16, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v17, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)transitionWillUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBBlurItemContainerParameters *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  SBBlurItemContainerParameters *v16;
  SBBlurItemContainerSwitcherEventResponse *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v20, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBBlurItemContainerParameters defaultCrossblurBlurParameters](SBBlurItemContainerParameters, "defaultCrossblurBlurParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeToFullScreenCenterZoomSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "homeScreenCenterZoomInitialBlur");
  v8 = v7;
  objc_msgSend(v6, "homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete");
  v10 = v8 * (v9 + -1.0) / v9;
  v11 = [SBBlurItemContainerParameters alloc];
  v12 = objc_msgSend(v4, "shouldRasterize");
  objc_msgSend(v4, "rasterizationScale");
  v14 = v13;
  objc_msgSend(v4, "blurAnimationSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBBlurItemContainerParameters initWithBlurRadius:shouldRasterize:rasterizationScale:inputQuality:inputIntermediateBitDepth:blurAnimationSettings:](v11, "initWithBlurRadius:shouldRasterize:rasterizationScale:inputQuality:inputIntermediateBitDepth:blurAnimationSettings:", v12, 1, 1, v15, v10, v14);

  v17 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:blurParameters:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:blurParameters:animationUpdateMode:", self->_toAppLayout, 1, v16, 3);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v17, v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  float v12;

  -[SBHomeToFullScreenCenterZoomSwitcherModifier switcherSettings](self, "switcherSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "disableAsyncRenderingTransitionPercentage");
  v8 = v7;

  -[SBHomeToFullScreenCenterZoomSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "settlingDuration");
  v11 = v8 * v10;
  UIAnimationDragCoefficient();
  *a3 = v11 * v12;

  return 1;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  BOOL v5;
  double v6;
  double v7;
  objc_super v8;
  CGPoint result;

  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (v5 = -[SBHomeToFullScreenCenterZoomSwitcherModifier _isToAppLayoutAtIndex:](self, "_isToAppLayoutAtIndex:", a3),
        v6 = 0.5,
        v7 = 0.5,
        !v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
    -[SBHomeToFullScreenCenterZoomSwitcherModifier anchorPointForIndex:](&v8, sel_anchorPointForIndex_, a3);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v6;

  if (self->_shouldForceDefaultAnchorPointForTransition
    && -[SBHomeToFullScreenCenterZoomSwitcherModifier _isToAppLayoutAtIndex:](self, "_isToAppLayoutAtIndex:", a3))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  return -[SBHomeToFullScreenCenterZoomSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v6, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v6;

  if (self->_shouldForceDefaultAnchorPointForTransition
    && -[SBHomeToFullScreenCenterZoomSwitcherModifier _isToAppLayoutAtIndex:](self, "_isToAppLayoutAtIndex:", a3))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  return -[SBHomeToFullScreenCenterZoomSwitcherModifier shouldPinLayoutRolesToSpace:](&v6, sel_shouldPinLayoutRolesToSpace_, a3);
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v5 = v4;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (v6 = 0.0, (objc_msgSend(v4, "isEqual:", self->_toAppLayout) & 1) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
    -[SBHomeToFullScreenCenterZoomSwitcherModifier perspectiveAngleForAppLayout:](&v9, sel_perspectiveAngleForAppLayout_, v5);
    v6 = v7;
  }

  return v6;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  -[SBHomeToFullScreenCenterZoomSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_toAppLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)homeScreenBackdropBlurProgress
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") <= 1
    && !-[SBHomeToFullScreenCenterZoomSwitcherModifier isDevicePad](self, "isDevicePad"))
  {
    return 0.0;
  }
  -[SBHomeToFullScreenCenterZoomSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeScreenBlurProgressForMode:", 3);
  v6 = v5;

  return v6;
}

- (double)scaleForIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  objc_super v11;

  v5 = -[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase");
  -[SBHomeToFullScreenCenterZoomSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SBHomeToFullScreenCenterZoomSwitcherModifier _isToAppLayoutAtIndex:](self, "_isToAppLayoutAtIndex:", a3))
  {
    v11.receiver = self;
    v11.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
    -[SBHomeToFullScreenCenterZoomSwitcherModifier scaleForIndex:](&v11, sel_scaleForIndex_, a3);
    goto LABEL_5;
  }
  v8 = 1.0;
  if (v5 <= 1)
  {
    objc_msgSend(v7, "homeScreenCenterZoomInitialScale");
LABEL_5:
    v8 = v9;
  }

  return v8;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect result;

  if (!-[SBHomeToFullScreenCenterZoomSwitcherModifier _isToAppLayoutAtIndex:](self, "_isToAppLayoutAtIndex:"))
  {
    v24.receiver = self;
    v24.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
    -[SBHomeToFullScreenCenterZoomSwitcherModifier frameForIndex:](&v24, sel_frameForIndex_, a3);
LABEL_6:
    v9 = v16;
    v11 = v17;
    v13 = v18;
    v15 = v19;
    goto LABEL_7;
  }
  if (!-[SBHomeToFullScreenCenterZoomSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))
  {
    -[SBHomeToFullScreenCenterZoomSwitcherModifier containerViewBounds](self, "containerViewBounds");
    goto LABEL_6;
  }
  -[SBHomeToFullScreenCenterZoomSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "boundingBox");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

LABEL_7:
  v20 = v9;
  v21 = v11;
  v22 = v13;
  v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)_isToAppLayoutAtIndex:(unint64_t)a3
{
  SBHomeToFullScreenCenterZoomSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBHomeToFullScreenCenterZoomSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_toAppLayout);
  return (char)v4;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  objc_super v15;

  v8 = a4;
  -[SBHomeToFullScreenCenterZoomSwitcherModifier switcherSettings](self, "switcherSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "animationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHomeToFullScreenCenterZoomSwitcherModifier appLayouts](self, "appLayouts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "indexOfObject:", self->_toAppLayout) != a5)
  {
    v15.receiver = self;
    v15.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
    -[SBHomeToFullScreenCenterZoomSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v15, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    goto LABEL_5;
  }
  v12 = 1.0;
  if (-[SBTransitionSwitcherModifier transitionPhase](self, "transitionPhase") <= 1)
  {
    objc_msgSend(v10, "homeScreenCenterZoomInitialOpacity");
LABEL_5:
    v12 = v13;
  }

  return v12;
}

- (SBHomeToFullScreenCenterZoomSwitcherModifier)initWithTransitionID:(id)a3 toAppLayout:(id)a4
{
  id v7;
  id v8;
  SBHomeToFullScreenCenterZoomSwitcherModifier *v9;
  SBHomeToFullScreenCenterZoomSwitcherModifier *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeToFullScreenCenterZoomSwitcherModifier.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toAppLayout"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  v9 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v13, sel_initWithTransitionID_, v7);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_toAppLayout, a4);

  return v10;
}

- (id)transitionDidEnd
{
  void *v3;
  SBBlurItemContainerSwitcherEventResponse *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionDidEnd](&v7, sel_transitionDidEnd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:animationUpdateMode:", self->_toAppLayout, 0, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)handleResizeProgressEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBBlurItemContainerSwitcherEventResponse *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleResizeProgressEvent:](&v11, sel_handleResizeProgressEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "progress", v11.receiver, v11.super_class);

  -[SBHomeToFullScreenCenterZoomSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete");
  if (BSFloatGreaterThanOrEqualToFloat())
  {
    v8 = -[SBBlurItemContainerSwitcherEventResponse initWithAppLayout:shouldBlur:animationUpdateMode:]([SBBlurItemContainerSwitcherEventResponse alloc], "initWithAppLayout:shouldBlur:animationUpdateMode:", self->_toAppLayout, 0, 2);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }

  return v5;
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)SBHomeToFullScreenCenterZoomSwitcherModifier;
  -[SBHomeToFullScreenCenterZoomSwitcherModifier resizeProgressNotificationsForLayoutRole:inAppLayout:](&v15, sel_resizeProgressNotificationsForLayoutRole_inAppLayout_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeToFullScreenCenterZoomSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete");
  v9 = v8;
  objc_msgSend(v7, "homeScreenCenterZoomInitialScale");
  v16[0] = &unk_1E91CF628;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v9 - v10) / (1.0 - v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  v16[2] = &unk_1E91CF638;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  int v4;

  v4 = -[SBHomeToFullScreenCenterZoomSwitcherModifier isShowingSpotlightOrTodayView](self, "isShowingSpotlightOrTodayView", a3);
  if (v4)
    LOBYTE(v4) = -[SBHomeToFullScreenCenterZoomSwitcherModifier isDevicePad](self, "isDevicePad") ^ 1;
  return v4;
}

- (BOOL)shouldForceDefaultAnchorPointForTransition
{
  return self->_shouldForceDefaultAnchorPointForTransition;
}

- (void)setShouldForceDefaultAnchorPointForTransition:(BOOL)a3
{
  self->_shouldForceDefaultAnchorPointForTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
}

@end
