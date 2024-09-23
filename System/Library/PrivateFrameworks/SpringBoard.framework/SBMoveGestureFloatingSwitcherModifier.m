@implementation SBMoveGestureFloatingSwitcherModifier

- (SBMoveGestureFloatingSwitcherModifier)initWithGestureID:(id)a3 initialFloatingConfiguration:(int64_t)a4 interfaceOrientation:(int64_t)a5
{
  SBMoveGestureFloatingSwitcherModifier *v7;
  _BOOL4 IsValid;
  int64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
  v7 = -[SBGestureSwitcherModifier initWithGestureID:](&v11, sel_initWithGestureID_, a3);
  if (v7)
  {
    IsValid = SBFloatingConfigurationIsValid(a4);
    v9 = 4;
    if (IsValid)
      v9 = a4;
    v7->_initialFloatingConfiguration = v9;
    v7->_interfaceOrientation = a5;
  }
  return v7;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
  v4 = a3;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v8, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 >= 2)
    -[SBChainableModifier setState:](self, "setState:", 1);
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v12, sel_handleGestureEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v5, "phase"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMoveGestureFloatingSwitcherModifier.m"), 64, CFSTR("Should not be getting PhasePossible"));

      goto LABEL_3;
    case 1:
      -[SBMoveGestureFloatingSwitcherModifier _updateForGestureDidBeginWithEvent:](self, "_updateForGestureDidBeginWithEvent:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[SBMoveGestureFloatingSwitcherModifier _updateForGestureDidChangeWithEvent:](self, "_updateForGestureDidChangeWithEvent:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[SBMoveGestureFloatingSwitcherModifier _updateForGestureDidEndWithEvent:](self, "_updateForGestureDidEndWithEvent:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v9;
      break;
    default:
LABEL_3:
      v8 = 0;
      break;
  }
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_updateForGestureDidBeginWithEvent:(id)a3
{
  self->_translation = (CGPoint)*MEMORY[0x1E0C9D538];
  return -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 10, 2);
}

- (id)_updateForGestureDidChangeWithEvent:(id)a3
{
  CGPoint *p_translation;
  CGFloat v4;
  CGFloat v5;

  p_translation = &self->_translation;
  objc_msgSend(a3, "translationInContainerView");
  p_translation->x = v4;
  p_translation->y = v5;
  return 0;
}

- (id)_updateForGestureDidEndWithEvent:(id)a3
{
  id v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  int64_t initialFloatingConfiguration;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double Width;
  double MidX;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  BOOL v27;
  SBMutableSwitcherTransitionRequest *v29;
  void *v30;
  void *v31;
  SBPerformTransitionSwitcherEventResponse *v32;
  CGFloat v34;
  double v35;
  CGRect v36;
  CGRect v37;

  v4 = a3;
  objc_msgSend(v4, "velocityInContainerView");
  v35 = v5;
  -[SBMoveGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  initialFloatingConfiguration = self->_initialFloatingConfiguration;
  -[SBMoveGestureFloatingSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v34 = v21;
  v36.origin.x = v7;
  v36.origin.y = v9;
  v36.size.width = v11;
  v36.size.height = v13;
  Width = CGRectGetWidth(v36);
  v37.origin.x = v7;
  v37.origin.y = v9;
  v37.size.width = v11;
  v37.size.height = v13;
  MidX = CGRectGetMidX(v37);
  -[SBMoveGestureFloatingSwitcherModifier medusaSettings](self, "medusaSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = SBFloatingConfigurationForMovingFloatingApplication(initialFloatingConfiguration, v24, v35, v16, v18, v20, v34, Width, MidX);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "indirectPanEndReason") == 3)
  {
    v26 = self->_initialFloatingConfiguration - 1;
    if (v26 <= 3)
      v25 = qword_1D0E8B558[v26];
  }
  if (objc_msgSend(v4, "touchType", *(_QWORD *)&v34) == 1
    && (self->_initialFloatingConfiguration == 4 ? (v27 = v25 == 1) : (v27 = 0), v27))
  {
    v25 = 1;
  }
  else if (objc_msgSend(v4, "touchType") == 1 && v25 == 2 && self->_initialFloatingConfiguration == 3)
  {
    v25 = 2;
  }
  v29 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
  if (!SBFloatingConfigurationIsStashed(v25))
  {
    -[SBMoveGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherTransitionRequest setAppLayout:](v29, "setAppLayout:", v31);

  }
  -[SBSwitcherTransitionRequest setFloatingConfiguration:](v29, "setFloatingConfiguration:", v25);
  -[SBSwitcherTransitionRequest setPreferredInterfaceOrientation:](v29, "setPreferredInterfaceOrientation:", -[SBMoveGestureFloatingSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"));
  v32 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v29, 1);

  return v32;
}

- (CGRect)containerViewBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double MaxX;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGRect v20;
  CGRect result;

  v19.receiver = self;
  v19.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
  -[SBMoveGestureFloatingSwitcherModifier containerViewBounds](&v19, sel_containerViewBounds);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = fmin(v3, 0.0);
  -[SBMoveGestureFloatingSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  MaxX = CGRectGetMaxX(v20);
  if (-[SBMoveGestureFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
  {
    v11 = v11 - v8;
    if (self->_initialFloatingConfiguration == 4)
      v13 = v8;
    else
      v13 = 0.0;
    MaxX = MaxX - v13;
  }
  if (v11 >= v4)
    v14 = v11;
  else
    v14 = v4;
  if (MaxX <= v14)
    v14 = MaxX;
  v15 = v14 + self->_translation.x;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)visibleAppLayouts
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  if (SBFloatingConfigurationIsStashed(self->_initialFloatingConfiguration))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[SBMoveGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      if (objc_msgSend(v4, "count") == 1)
        v5 = 1;
      else
        v5 = 2;
      objc_msgSend(v4, "subarrayWithRange:", 0, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v6);

    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
    -[SBMoveGestureFloatingSwitcherModifier visibleAppLayouts](&v8, sel_visibleAppLayouts);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBMoveGestureFloatingSwitcherModifier medusaSettings](self, "medusaSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "medusaAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v7);

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double MidX;
  char v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v15;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  -[SBMoveGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds", a3);
  MidX = CGRectGetMidX(v17);
  v7 = -[SBMoveGestureFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  -[SBMoveGestureFloatingSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v8 = CGRectGetMidX(v18);
  if ((v7 & 1) != 0)
  {
    if (MidX <= v8)
    {
LABEL_3:
      v9 = 4;
      v10 = 2;
      goto LABEL_6;
    }
  }
  else if (MidX > v8)
  {
    goto LABEL_3;
  }
  v9 = 3;
  v10 = 1;
LABEL_6:
  -[SBMoveGestureFloatingSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", self->_interfaceOrientation, v10);
  v11 = CGRectGetMidX(v19);
  -[SBMoveGestureFloatingSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", self->_interfaceOrientation, v9);
  v12 = fmin(fmax(1.0 - (MidX - v11) / (CGRectGetMidX(v20) - v11), 0.0), 1.0);
  if (a4)
    v13 = 0.25;
  else
    v13 = 1.0;
  if (-[SBGestureSwitcherModifier gesturePhase](self, "gesturePhase") >= 2 || a4 == 0)
    v15 = v13;
  else
    v15 = 0.0;
  return v12 * v15;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  double MidX;
  double v5;
  CGRect v7;
  CGRect v8;
  CGRect v9;

  -[SBMoveGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds", a3);
  MidX = CGRectGetMidX(v7);
  -[SBMoveGestureFloatingSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", self->_interfaceOrientation, 1);
  v5 = CGRectGetMidX(v8);
  -[SBMoveGestureFloatingSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", self->_interfaceOrientation, 2);
  return fmin(fmax((MidX - v5 + MidX - v5) / (CGRectGetMidX(v9) - v5) + -1.0, -1.0), 1.0);
}

- (id)appLayoutsToCacheSnapshots
{
  void *v3;
  NSRange v4;
  void *v5;
  objc_super v7;
  NSRange v8;
  NSRange v9;

  if (SBFloatingConfigurationIsStashed(self->_initialFloatingConfiguration))
  {
    -[SBMoveGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9.length = objc_msgSend(v3, "count");
    v8.location = 0;
    v8.length = 1;
    v9.location = 0;
    v4 = NSIntersectionRange(v8, v9);
    objc_msgSend(v3, "subarrayWithRange:", v4.location, v4.length);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
    -[SBMoveGestureFloatingSwitcherModifier appLayoutsToCacheSnapshots](&v7, sel_appLayoutsToCacheSnapshots);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)slideOverTongueState
{
  unint64_t result;
  uint64_t v4;
  uint64_t v5;
  char v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;

  if (!SBFloatingConfigurationIsStashed(self->_initialFloatingConfiguration)
    || self->_hideSlideOverTongueForDragFromStashedConfiguration)
  {
    return 0;
  }
  if (self->_initialFloatingConfiguration == 4)
    v4 = 2;
  else
    v4 = 1;
  if (self->_initialFloatingConfiguration == 4)
    v5 = 4;
  else
    v5 = 3;
  -[SBMoveGestureFloatingSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", self->_interfaceOrientation, v5);
  CGRectGetMidX(v7);
  -[SBMoveGestureFloatingSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", self->_interfaceOrientation, v4);
  CGRectGetMidX(v8);
  -[SBMoveGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  CGRectGetMidX(v9);
  v6 = self->_hideSlideOverTongueForDragFromStashedConfiguration | BSFloatIsOne();
  result = v6 == 0;
  self->_hideSlideOverTongueForDragFromStashedConfiguration = v6;
  return result;
}

- (unint64_t)slideOverTongueDirection
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[SBMoveGestureFloatingSwitcherModifier containerViewBounds](self, "containerViewBounds");
  UIRectGetCenter();
  v4 = v3;
  -[SBMoveGestureFloatingSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  v6 = v5;
  if ((-[SBMoveGestureFloatingSwitcherModifier isRTLEnabled](self, "isRTLEnabled") & 1) != 0)
  {
    if (v4 <= v6 * 0.5)
      return 1;
  }
  else if (v4 > v6 * 0.5)
  {
    return 1;
  }
  return 2;
}

- (id)appLayoutToAttachSlideOverTongue
{
  void *v2;
  void *v3;

  -[SBMoveGestureFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unsigned __int16 v7;
  SBSwitcherAsyncRenderingAttributes v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sbf_isLowEndForSlideOverMoveGesture");

  if (v6)
  {
    v7 = SBSwitcherAsyncRenderingAttributesMake(1u, 0);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBMoveGestureFloatingSwitcherModifier;
    v7 = (unsigned __int16)-[SBMoveGestureFloatingSwitcherModifier asyncRenderingAttributesForAppLayout:](&v10, sel_asyncRenderingAttributesForAppLayout_, v4);
  }
  v8 = (SBSwitcherAsyncRenderingAttributes)v7;

  return v8;
}

- (int64_t)initialFloatingConfiguration
{
  return self->_initialFloatingConfiguration;
}

- (void)setInitialFloatingConfiguration:(int64_t)a3
{
  self->_initialFloatingConfiguration = a3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (CGPoint)translation
{
  double x;
  double y;
  CGPoint result;

  x = self->_translation.x;
  y = self->_translation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTranslation:(CGPoint)a3
{
  self->_translation = a3;
}

- (BOOL)hideSlideOverTongueForDragFromStashedConfiguration
{
  return self->_hideSlideOverTongueForDragFromStashedConfiguration;
}

- (void)setHideSlideOverTongueForDragFromStashedConfiguration:(BOOL)a3
{
  self->_hideSlideOverTongueForDragFromStashedConfiguration = a3;
}

@end
