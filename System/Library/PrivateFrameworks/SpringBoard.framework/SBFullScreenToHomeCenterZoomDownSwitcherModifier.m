@implementation SBFullScreenToHomeCenterZoomDownSwitcherModifier

- (SBFullScreenToHomeCenterZoomDownSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 offsetYPercentOfScreenHeight:(double)a5
{
  id v9;
  SBFullScreenToHomeCenterZoomDownSwitcherModifier *v10;
  SBFullScreenToHomeCenterZoomDownSwitcherModifier *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  v10 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v13, sel_initWithTransitionID_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_appLayout, a4);
    v11->_offsetYPercentOfScreenHeight = a5;
  }

  return v11;
}

- (void)didMoveToParentModifier:(id)a3
{
  SBCoplanarSwitcherModifier *v5;
  SBCoplanarSwitcherModifier *coplanarModifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v7, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!-[SBChainableModifier containsChildModifier:](self, "containsChildModifier:", self->_coplanarModifier))
    {
      v5 = -[SBCoplanarSwitcherModifier initWithActiveAppLayout:]([SBCoplanarSwitcherModifier alloc], "initWithActiveAppLayout:", self->_appLayout);
      coplanarModifier = self->_coplanarModifier;
      self->_coplanarModifier = v5;

      -[SBCoplanarSwitcherModifier setUsesContainerViewBoundsAsActiveFrame:](self->_coplanarModifier, "setUsesContainerViewBoundsAsActiveFrame:", 1);
      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_coplanarModifier);
    }
  }
}

- (id)transitionWillBegin
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  CGFloat v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  v21.receiver = self;
  v21.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  -[SBFullScreenToHomeCenterZoomDownSwitcherModifier frameForIndex:](&v21, sel_frameForIndex_);
  x = v5;
  y = v7;
  width = v9;
  height = v11;
  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout")
    && -[SBFullScreenToHomeCenterZoomDownSwitcherModifier _isIndexCenterZoomAppLayout:](self, "_isIndexCenterZoomAppLayout:", a3))
  {
    v13 = *MEMORY[0x1E0C9D538];
    v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[SBFullScreenToHomeCenterZoomDownSwitcherModifier screenScale](self, "screenScale");
    BSFloatRoundForScale();
    v16 = v15;
    v22.origin.x = v13;
    v22.origin.y = v14;
    v22.size.width = width;
    v22.size.height = height;
    v23 = CGRectOffset(v22, 0.0, v16);
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double result;
  objc_super v10;

  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout")
    && -[SBFullScreenToHomeCenterZoomDownSwitcherModifier _isIndexCenterZoomAppLayout:](self, "_isIndexCenterZoomAppLayout:", a3))
  {
    -[SBFullScreenToHomeCenterZoomDownSwitcherModifier switcherSettings](self, "switcherSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerZoomScale");
    v8 = v7;

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
    -[SBFullScreenToHomeCenterZoomDownSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_, a3);
  }
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  BOOL v5;
  double v6;
  double v7;
  objc_super v8;
  CGPoint result;

  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (v5 = -[SBFullScreenToHomeCenterZoomDownSwitcherModifier _isIndexCenterZoomAppLayout:](self, "_isIndexCenterZoomAppLayout:", a3), v6 = 0.5, v7 = 0.5, !v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
    -[SBFullScreenToHomeCenterZoomDownSwitcherModifier anchorPointForIndex:](&v8, sel_anchorPointForIndex_, a3);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v6;

  if (self->_shouldForceDefaultAnchorPointForTransition
    && -[SBFullScreenToHomeCenterZoomDownSwitcherModifier _isIndexCenterZoomAppLayout:](self, "_isIndexCenterZoomAppLayout:", a3))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  return -[SBFullScreenToHomeCenterZoomDownSwitcherModifier shouldPinLayoutRolesToSpace:](&v6, sel_shouldPinLayoutRolesToSpace_, a3);
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v6;

  if (self->_shouldForceDefaultAnchorPointForTransition
    && -[SBFullScreenToHomeCenterZoomDownSwitcherModifier _isIndexCenterZoomAppLayout:](self, "_isIndexCenterZoomAppLayout:", a3))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  return -[SBFullScreenToHomeCenterZoomDownSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v6, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
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
    || (v6 = 0.0, (objc_msgSend(v4, "isEqual:", self->_appLayout) & 1) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
    -[SBFullScreenToHomeCenterZoomDownSwitcherModifier perspectiveAngleForAppLayout:](&v9, sel_perspectiveAngleForAppLayout_, v5);
    v6 = v7;
  }

  return v6;
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
  if (self->_shouldForceDefaultAnchorPointForTransition && objc_msgSend(v9, "isEqual:", self->_appLayout))
  {
    -[SBFullScreenToHomeCenterZoomDownSwitcherModifier appLayouts](self, "appLayouts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFullScreenToHomeCenterZoomDownSwitcherModifier frameForIndex:](self, "frameForIndex:", objc_msgSend(v11, "indexOfObject:", self->_appLayout));
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
    -[SBFullScreenToHomeCenterZoomDownSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v28, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v10, x, y, width, height);
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
    || (v9 = 0.5, v10 = 0.5, (objc_msgSend(v7, "isEqual:", self->_appLayout) & 1) == 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
    -[SBFullScreenToHomeCenterZoomDownSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v15, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v8, x, y);
    v9 = v11;
    v10 = v12;
  }

  v13 = v9;
  v14 = v10;
  result.y = v14;
  result.x = v13;
  return result;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  -[SBFullScreenToHomeCenterZoomDownSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_appLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBFullScreenToHomeCenterZoomDownSwitcherModifier _layoutSettings](self, "_layoutSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v6);

  -[SBFullScreenToHomeCenterZoomDownSwitcherModifier _opacitySettings](self, "_opacitySettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpacitySettings:", v7);

  return v5;
}

- (id)_layoutSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBFullScreenToHomeCenterZoomDownSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerZoomSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_opacitySettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBFullScreenToHomeCenterZoomDownSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerZoomOpacitySettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIRectCornerRadii result;

  -[SBFullScreenToHomeCenterZoomDownSwitcherModifier displayCornerRadius](self, "displayCornerRadius", a3);
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  if (-[SBFullScreenToHomeCenterZoomDownSwitcherModifier hasHomeButton](self, "hasHomeButton"))
    return 1;
  else
    return 3;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBFullScreenToHomeCenterZoomDownSwitcherModifier;
  -[SBFullScreenToHomeCenterZoomDownSwitcherModifier topMostLayoutElements](&v8, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    v6 = objc_msgSend(v5, "indexOfObject:", self->_appLayout);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "insertObject:atIndex:", self->_appLayout, 0);
    else
      objc_msgSend(v5, "exchangeObjectAtIndex:withObjectAtIndex:", v6, 0);
  }
  else
  {
    v9[0] = self->_appLayout;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return 0;
}

- (BOOL)_isIndexCenterZoomAppLayout:(unint64_t)a3
{
  SBFullScreenToHomeCenterZoomDownSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBFullScreenToHomeCenterZoomDownSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_appLayout);
  return (char)v4;
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
  objc_storeStrong((id *)&self->_coplanarModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
