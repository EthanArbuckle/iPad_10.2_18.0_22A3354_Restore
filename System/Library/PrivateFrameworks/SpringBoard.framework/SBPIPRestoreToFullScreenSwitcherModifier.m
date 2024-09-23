@implementation SBPIPRestoreToFullScreenSwitcherModifier

- (SBPIPRestoreToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 transitionModifier:(id)a4 fromAppLayout:(id)a5 toAppLayout:(id)a6 toLayoutRole:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  SBPIPRestoreToFullScreenSwitcherModifier *v15;
  SBPIPRestoreToFullScreenSwitcherModifier *v16;
  objc_super v18;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
  v15 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v18, sel_initWithTransitionID_, a3);
  v16 = v15;
  if (v15)
  {
    v15->_toLayoutRole = a7;
    objc_storeStrong((id *)&v15->_fromAppLayout, a5);
    objc_storeStrong((id *)&v16->_toAppLayout, a6);
    -[SBChainableModifier addChildModifier:](v16, "addChildModifier:", v12);
  }

  return v16;
}

- (BOOL)completesWhenChildrenComplete
{
  return 1;
}

- (id)transitionWillBegin
{
  void *v3;
  SBSwitcherModifierEventResponse *v4;
  SBInvalidateAdjustedAppLayoutsSwitcherEventResponse *v5;
  SBUpdateLayoutSwitcherEventResponse *v6;
  CGRect *p_toAppLayoutBoundingBox;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  SBSetupPIPMorphingSwitcherEventResponse *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v16, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v5 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v5);

  v6 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v6);

  p_toAppLayoutBoundingBox = &self->_toAppLayoutBoundingBox;
  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_toAppLayout);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boundingBox");
  p_toAppLayoutBoundingBox->origin.x = v9;
  p_toAppLayoutBoundingBox->origin.y = v10;
  p_toAppLayoutBoundingBox->size.width = v11;
  p_toAppLayoutBoundingBox->size.height = v12;

  v13 = objc_alloc_init(SBSetupPIPMorphingSwitcherEventResponse);
  -[SBSetupPIPMorphingSwitcherEventResponse setAppLayoutBoundingBox:](v13, "setAppLayoutBoundingBox:", p_toAppLayoutBoundingBox->origin.x, p_toAppLayoutBoundingBox->origin.y, p_toAppLayoutBoundingBox->size.width, p_toAppLayoutBoundingBox->size.height);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v13);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect result;

  if (-[SBPIPRestoreToFullScreenSwitcherModifier _isFromAppLayoutIndex:](self, "_isFromAppLayoutIndex:"))
  {
    -[SBPIPRestoreToFullScreenSwitcherModifier containerViewBounds](self, "containerViewBounds");
  }
  else if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout")
         && -[SBPIPRestoreToFullScreenSwitcherModifier _isToAppLayoutIndex:](self, "_isToAppLayoutIndex:", a3))
  {
    SBRectWithSize();
    -[SBPIPRestoreToFullScreenSwitcherModifier morphToPIPTargetCenter](self, "morphToPIPTargetCenter");
    SBUnintegralizedRectCenteredAboutPoint();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    -[SBPIPRestoreToFullScreenSwitcherModifier frameForIndex:](&v9, sel_frameForIndex_, a3);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)clippingFrameForIndex:(unint64_t)a3 withBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  objc_super v15;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout")
    && -[SBPIPRestoreToFullScreenSwitcherModifier _isToAppLayoutIndex:](self, "_isToAppLayoutIndex:", a3))
  {
    -[SBPIPRestoreToFullScreenSwitcherModifier morphToPIPClippingFrame](self, "morphToPIPClippingFrame");
  }
  else if (-[SBPIPRestoreToFullScreenSwitcherModifier _isToAppLayoutIndex:](self, "_isToAppLayoutIndex:", a3))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    -[SBPIPRestoreToFullScreenSwitcherModifier clippingFrameForIndex:withBounds:](&v15, sel_clippingFrameForIndex_withBounds_, a3, x, y, width, height);
    SBRectWithSize();
    if (self->_shouldClippingTakeShadowIntoAccount)
      -[SBPIPRestoreToFullScreenSwitcherModifier _insetFrameForDiffuseShadowRadius:](self, "_insetFrameForDiffuseShadowRadius:");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    -[SBPIPRestoreToFullScreenSwitcherModifier clippingFrameForIndex:withBounds:](&v14, sel_clippingFrameForIndex_withBounds_, a3, x, y, width, height);
  }
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)clippingFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5 withBounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a4;
  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout")
    && -[SBPIPRestoreToFullScreenSwitcherModifier _isToAppLayout:](self, "_isToAppLayout:", v13))
  {
    -[SBPIPRestoreToFullScreenSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", a3, v13, x, y, width, height);
    v15 = v14;
    v17 = v16;
    -[SBPIPRestoreToFullScreenSwitcherModifier morphToPIPClippingFrame](self, "morphToPIPClippingFrame");
    v32 = CGRectOffset(v31, -v15, -v17);
LABEL_8:
    v22 = v32.origin.x;
    v23 = v32.origin.y;
    v24 = v32.size.width;
    v25 = v32.size.height;
    goto LABEL_9;
  }
  if (!-[SBPIPRestoreToFullScreenSwitcherModifier _isToAppLayout:](self, "_isToAppLayout:", v13))
  {
    v30.receiver = self;
    v30.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    -[SBPIPRestoreToFullScreenSwitcherModifier clippingFrameForLayoutRole:inAppLayout:atIndex:withBounds:](&v30, sel_clippingFrameForLayoutRole_inAppLayout_atIndex_withBounds_, a3, v13, a5, x, y, width, height);
    goto LABEL_8;
  }
  -[SBPIPRestoreToFullScreenSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", a3, v13, x, y, width, height);
  SBRectWithSize();
  v22 = v18;
  v23 = v19;
  v24 = v20;
  v25 = v21;
  if (self->_shouldClippingTakeShadowIntoAccount)
  {
    -[SBPIPRestoreToFullScreenSwitcherModifier _insetFrameForDiffuseShadowRadius:](self, "_insetFrameForDiffuseShadowRadius:", v18, v19, v20, v21);
    goto LABEL_8;
  }
LABEL_9:

  v26 = v22;
  v27 = v23;
  v28 = v24;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)_insetFrameForDiffuseShadowRadius:(CGRect)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  CGRect v7;

  -[SBPIPRestoreToFullScreenSwitcherModifier switcherSettings](self, "switcherSettings", a3.origin.x, a3.origin.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chamoisSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "diffuseShadowRadius");
  v6 = v5;

  SBRectWithSize();
  return CGRectInset(v7, v6 * -2.8, v6 * -2.8);
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  BOOL v7;
  double result;
  _BOOL4 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
  -[SBPIPRestoreToFullScreenSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_);
  v6 = v5;
  v7 = -[SBPIPRestoreToFullScreenSwitcherModifier _isFromAppLayoutIndex:](self, "_isFromAppLayoutIndex:", a3);
  result = 1.0;
  if (!v7)
  {
    if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout", 1.0))
    {
      v9 = -[SBPIPRestoreToFullScreenSwitcherModifier _isToAppLayoutIndex:](self, "_isToAppLayoutIndex:", a3);
      result = v6;
      if (v9)
        -[SBPIPRestoreToFullScreenSwitcherModifier morphToPIPTargetScale](self, "morphToPIPTargetScale", v6);
    }
    else
    {
      return v6;
    }
  }
  return result;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
  -[SBPIPRestoreToFullScreenSwitcherModifier visibleAppLayouts](&v6, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_fromAppLayout)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  BOOL v5;
  double v6;
  double v7;
  objc_super v8;
  CGPoint result;

  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (v5 = -[SBPIPRestoreToFullScreenSwitcherModifier _isToOrFromAppLayoutIndex:](self, "_isToOrFromAppLayoutIndex:", a3), v6 = 0.5, v7 = 0.5, !v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    -[SBPIPRestoreToFullScreenSwitcherModifier anchorPointForIndex:](&v8, sel_anchorPointForIndex_, a3);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v6;

  if (self->_shouldForceDefaultAnchorPointForTransition
    && -[SBPIPRestoreToFullScreenSwitcherModifier _isToOrFromAppLayoutIndex:](self, "_isToOrFromAppLayoutIndex:", a3))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
  return -[SBPIPRestoreToFullScreenSwitcherModifier shouldPinLayoutRolesToSpace:](&v6, sel_shouldPinLayoutRolesToSpace_, a3);
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v6;

  if (self->_shouldForceDefaultAnchorPointForTransition
    && -[SBPIPRestoreToFullScreenSwitcherModifier _isToOrFromAppLayoutIndex:](self, "_isToOrFromAppLayoutIndex:", a3))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
  return -[SBPIPRestoreToFullScreenSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v6, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v8;

  v4 = a3;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (v5 = 0.0, !-[SBPIPRestoreToFullScreenSwitcherModifier _isToOrFromAppLayout:](self, "_isToOrFromAppLayout:", v4)))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    -[SBPIPRestoreToFullScreenSwitcherModifier perspectiveAngleForAppLayout:](&v8, sel_perspectiveAngleForAppLayout_, v4);
    v5 = v6;
  }

  return v5;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
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
  double v24;
  double v25;
  double v26;
  objc_super v27;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if (self->_shouldForceDefaultAnchorPointForTransition
    && -[SBPIPRestoreToFullScreenSwitcherModifier _isToOrFromAppLayout:](self, "_isToOrFromAppLayout:", v9))
  {
    -[SBPIPRestoreToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPRestoreToFullScreenSwitcherModifier frameForIndex:](self, "frameForIndex:", objc_msgSend(v10, "indexOfObject:", v9));
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    -[SBPIPRestoreToFullScreenSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v27, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
    v12 = v19;
    v14 = v20;
    v16 = v21;
    v18 = v22;
  }

  v23 = v12;
  v24 = v14;
  v25 = v16;
  v26 = v18;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!self->_shouldForceDefaultAnchorPointForTransition
    || (v8 = 0.5,
        v9 = 0.5,
        !-[SBPIPRestoreToFullScreenSwitcherModifier _isToOrFromAppLayout:](self, "_isToOrFromAppLayout:", v7)))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    -[SBPIPRestoreToFullScreenSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v14, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v7, x, y);
    v8 = v10;
    v9 = v11;
  }

  v12 = v8;
  v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v7, sel_animationAttributesForLayoutElement_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "layoutSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClippingSettings:", v5);

  return v4;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
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
  UIRectCornerRadii result;

  -[SBPIPRestoreToFullScreenSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
  SBRectCornerRadiiForRadius();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout")
    && -[SBPIPRestoreToFullScreenSwitcherModifier _isToAppLayoutIndex:](self, "_isToAppLayoutIndex:", a3))
  {
    -[SBPIPRestoreToFullScreenSwitcherModifier morphToPIPClippingCornerRadius](self, "morphToPIPClippingCornerRadius");
    v6 = v13;
    v8 = v13;
    v10 = v13;
    v12 = v13;
  }
  v14 = v6;
  v15 = v8;
  v16 = v10;
  v17 = v12;
  result.topRight = v17;
  result.bottomRight = v16;
  result.bottomLeft = v15;
  result.topLeft = v14;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = a4;
  v9 = 1.0;
  if (!-[SBPIPRestoreToFullScreenSwitcherModifier _isToOrFromAppLayoutIndex:](self, "_isToOrFromAppLayoutIndex:", a5))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBPIPRestoreToFullScreenSwitcherModifier;
    -[SBPIPRestoreToFullScreenSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v9 = v10;
  }

  return v9;
}

- (BOOL)_isFromAppLayoutIndex:(unint64_t)a3
{
  SBPIPRestoreToFullScreenSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBPIPRestoreToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_fromAppLayout);
  return (char)v4;
}

- (BOOL)_isToAppLayoutIndex:(unint64_t)a3
{
  SBPIPRestoreToFullScreenSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBPIPRestoreToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_toAppLayout);
  return (char)v4;
}

- (BOOL)_isToAppLayout:(id)a3
{
  return objc_msgSend(a3, "isEqual:", self->_toAppLayout);
}

- (BOOL)_isToOrFromAppLayout:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", self->_fromAppLayout) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqual:", self->_toAppLayout);

  return v5;
}

- (BOOL)_isToOrFromAppLayoutIndex:(unint64_t)a3
{
  SBPIPRestoreToFullScreenSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBPIPRestoreToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = -[SBPIPRestoreToFullScreenSwitcherModifier _isToOrFromAppLayout:](v4, "_isToOrFromAppLayout:", v6);
  return (char)v4;
}

- (BOOL)shouldClippingTakeShadowIntoAccount
{
  return self->_shouldClippingTakeShadowIntoAccount;
}

- (void)setShouldClippingTakeShadowIntoAccount:(BOOL)a3
{
  self->_shouldClippingTakeShadowIntoAccount = a3;
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
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end
