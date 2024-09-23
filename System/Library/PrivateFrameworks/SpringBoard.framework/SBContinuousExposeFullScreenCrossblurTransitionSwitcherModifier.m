@implementation SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier

- (SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier)initWithTransitionID:(id)a3 toAppLayout:(id)a4 fromAppLayout:(id)a5
{
  id v9;
  id v10;
  SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *v11;
  SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *timerReason;
  objc_super v19;

  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
  v11 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v19, sel_initWithTransitionID_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_toAppLayout, a4);
    objc_storeStrong((id *)&v12->_fromAppLayout, a5);
    v12->_animationPhase = 0;
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifierTimerEventReason"), v15);
    v16 = objc_claimAutoreleasedReturnValue();
    timerReason = v12->_timerReason;
    v12->_timerReason = (NSString *)v16;

  }
  return v12;
}

- (void)didMoveToParentModifier:(id)a3
{
  void *v6;
  uint64_t v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;
  objc_super v19;
  objc_super v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v21, sel_didMoveToParentModifier_);
  if (a3)
  {
    -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier appLayouts](self, "appLayouts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", self->_toAppLayout);

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier.m"), 89, CFSTR("We must know about _toAppLayout"));

    }
    v20.receiver = self;
    v20.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier frameForIndex:](&v20, sel_frameForIndex_, v7);
    self->_toAppLayoutInitialFrame.origin.x = v8;
    self->_toAppLayoutInitialFrame.origin.y = v9;
    self->_toAppLayoutInitialFrame.size.width = v10;
    self->_toAppLayoutInitialFrame.size.height = v11;
    v19.receiver = self;
    v19.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier scaleForIndex:](&v19, sel_scaleForIndex_, v7);
    self->_toAppLayoutInitialScale = v12;
    v18.receiver = self;
    v18.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier cornerRadiiForIndex:](&v18, sel_cornerRadiiForIndex_, v7);
    self->_toAppLayoutInitialCornerRadius.topLeft = v13;
    self->_toAppLayoutInitialCornerRadius.bottomLeft = v14;
    self->_toAppLayoutInitialCornerRadius.bottomRight = v15;
    self->_toAppLayoutInitialCornerRadius.topRight = v16;
  }
}

- (id)transitionWillUpdate
{
  void *v3;
  SBTimerEventSwitcherEventResponse *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v7, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_animationPhase)
  {
    v4 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, self->_timerReason, 0.045);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  SBTimerEventSwitcherEventResponse *v8;
  void *v9;
  SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v14, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v14.receiver, v14.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", self->_timerReason);
  if ((_DWORD)v4)
  {
    switch(self->_animationPhase)
    {
      case 0:
        v7 = 1;
        goto LABEL_6;
      case 1:
        self->_animationPhase = 2;
        v8 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, self->_timerReason, 0.25);
        +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = self;
        v11 = 3;
        goto LABEL_7;
      case 2:
        v7 = 3;
LABEL_6:
        self->_animationPhase = v7;
        v8 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, self->_timerReason, 0.01);
        +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = self;
        v11 = 2;
LABEL_7:
        -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier _updateLayoutWithAnimationUpdateMode:appendResponse:](v10, "_updateLayoutWithAnimationUpdateMode:appendResponse:", v11, v9);
        v12 = objc_claimAutoreleasedReturnValue();

        v5 = v8;
        goto LABEL_9;
      case 3:
        self->_animationPhase = 4;
        -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier _updateLayoutWithAnimationUpdateMode:appendResponse:](self, "_updateLayoutWithAnimationUpdateMode:appendResponse:", 3, v5);
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:

        v5 = (void *)v12;
        break;
      default:
        return v5;
    }
  }
  return v5;
}

- (id)_updateLayoutWithAnimationUpdateMode:(int64_t)a3 appendResponse:(id)a4
{
  id v5;
  SBUpdateLayoutSwitcherEventResponse *v6;
  void *v7;

  v5 = a4;
  v6 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 12, a3);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat x;
  double v10;
  CGFloat y;
  double v12;
  CGFloat width;
  double v14;
  CGFloat height;
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

  -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppLayout isEqual:](self->_fromAppLayout, "isEqual:", v6) && self->_animationPhase <= 2)
  {
    -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "boundingBox");
    x = v8;
    y = v10;
    width = v12;
    height = v14;

  }
  else if (-[SBAppLayout isEqual:](self->_toAppLayout, "isEqual:", v6) && !self->_animationPhase)
  {
    x = self->_toAppLayoutInitialFrame.origin.x;
    y = self->_toAppLayoutInitialFrame.origin.y;
    width = self->_toAppLayoutInitialFrame.size.width;
    height = self->_toAppLayoutInitialFrame.size.height;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier frameForIndex:](&v24, sel_frameForIndex_, a3);
    x = v16;
    y = v17;
    width = v18;
    height = v19;
  }

  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  int64_t animationPhase;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double toAppLayoutInitialScale;
  int64_t v13;
  double v14;
  objc_super v16;
  objc_super v17;

  -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SBAppLayout isEqual:](self->_fromAppLayout, "isEqual:", v6))
    goto LABEL_8;
  animationPhase = self->_animationPhase;
  if (animationPhase <= 2)
  {
    -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier switcherSettings](self, "switcherSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "crossblurDosidoLargeScale");
LABEL_12:
    toAppLayoutInitialScale = v10;

    goto LABEL_13;
  }
  if (animationPhase == 3)
  {
    v17.receiver = self;
    v17.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier scaleForIndex:](&v17, sel_scaleForIndex_, a3);
    toAppLayoutInitialScale = v11 + -0.02;
  }
  else
  {
LABEL_8:
    if (!-[SBAppLayout isEqual:](self->_toAppLayout, "isEqual:", v6))
      goto LABEL_10;
    v13 = self->_animationPhase;
    if (v13 == 1)
    {
      -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier switcherSettings](self, "switcherSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "animationSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "crossblurDosidoSmallScale");
      goto LABEL_12;
    }
    if (v13)
    {
LABEL_10:
      v16.receiver = self;
      v16.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
      -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier scaleForIndex:](&v16, sel_scaleForIndex_, a3);
      toAppLayoutInitialScale = v14;
    }
    else
    {
      toAppLayoutInitialScale = self->_toAppLayoutInitialScale;
    }
  }
LABEL_13:

  return toAppLayoutInitialScale;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  int64_t animationPhase;
  double v11;
  objc_super v13;

  v8 = a4;
  if (!-[SBAppLayout isEqual:](self->_fromAppLayout, "isEqual:", v8) || (v9 = 0.0, self->_animationPhase >= 4))
  {
    if (!-[SBAppLayout isEqual:](self->_toAppLayout, "isEqual:", v8))
      goto LABEL_7;
    animationPhase = self->_animationPhase;
    if (!animationPhase)
    {
      v9 = 0.0;
      goto LABEL_9;
    }
    if (animationPhase == 1)
    {
      v9 = 0.1;
    }
    else
    {
LABEL_7:
      v13.receiver = self;
      v13.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
      -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v13, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
      v9 = v11;
    }
  }
LABEL_9:

  return v9;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v8;
  void *v9;
  double v10;
  objc_super v11;

  v4 = a3;
  if (!-[SBAppLayout isEqual:](self->_fromAppLayout, "isEqual:", v4) || (v5 = 0.0, self->_animationPhase >= 3))
  {
    if (-[SBAppLayout isEqual:](self->_toAppLayout, "isEqual:", v4) && !self->_animationPhase)
    {
      v8 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stripTiltAngle");
      v5 = v10;
      if (v8 == 1)
        v5 = -v10;

    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
      -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier perspectiveAngleForAppLayout:](&v11, sel_perspectiveAngleForAppLayout_, v4);
      v5 = v6;
    }
  }

  return v5;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  objc_super v14;
  CGPoint result;

  -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SBAppLayout isEqual:](self->_fromAppLayout, "isEqual:", v6)
    || (v7 = 0.5, v8 = 0.5, self->_animationPhase >= 3))
  {
    if (-[SBAppLayout isEqual:](self->_toAppLayout, "isEqual:", v6) && !self->_animationPhase)
    {
      v11 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      if (v11 == 1)
        v8 = 0.0;
      else
        v8 = 0.5;
      if (v11 == 1)
        v7 = 0.5;
      else
        v7 = 0.0;
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
      -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier anchorPointForIndex:](&v14, sel_anchorPointForIndex_, a3);
      v7 = v9;
      v8 = v10;
    }
  }

  v12 = v7;
  v13 = v8;
  result.y = v13;
  result.x = v12;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double topLeft;
  double v10;
  double bottomLeft;
  double v12;
  double bottomRight;
  double v14;
  double topRight;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  UIRectCornerRadii result;

  -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppLayout isEqual:](self->_fromAppLayout, "isEqual:", v6) && self->_animationPhase <= 2)
  {
    -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stageCornerRadii");
    -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
    SBRectCornerRadiiForRadius();
    topLeft = v8;
    bottomLeft = v10;
    bottomRight = v12;
    topRight = v14;

  }
  else if (-[SBAppLayout isEqual:](self->_toAppLayout, "isEqual:", v6) && !self->_animationPhase)
  {
    topLeft = self->_toAppLayoutInitialCornerRadius.topLeft;
    bottomLeft = self->_toAppLayoutInitialCornerRadius.bottomLeft;
    bottomRight = self->_toAppLayoutInitialCornerRadius.bottomRight;
    topRight = self->_toAppLayoutInitialCornerRadius.topRight;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier cornerRadiiForIndex:](&v24, sel_cornerRadiiForIndex_, a3);
    topLeft = v16;
    bottomLeft = v17;
    bottomRight = v18;
    topRight = v19;
  }

  v20 = topLeft;
  v21 = bottomLeft;
  v22 = bottomRight;
  v23 = topRight;
  result.topRight = v23;
  result.bottomRight = v22;
  result.bottomLeft = v21;
  result.topLeft = v20;
  return result;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SBAppLayout isEqual:](self->_fromAppLayout, "isEqual:", v6) || (v7 = 0.0, self->_animationPhase >= 3))
  {
    if (!-[SBAppLayout isEqual:](self->_toAppLayout, "isEqual:", v6) || (v7 = 0.0, self->_animationPhase >= 2))
    {
      v10.receiver = self;
      v10.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
      -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier titleAndIconOpacityForIndex:](&v10, sel_titleAndIconOpacityForIndex_, a3);
      v7 = v8;
    }
  }

  return v7;
}

- (BOOL)shouldAllowGroupOpacityForAppLayout:(id)a3
{
  id v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  if (SBFIsChamoisFullScreenToStripGroupOpacityAvailable())
  {
    v5 = objc_msgSend(v4, "isEqual:", self->_fromAppLayout);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
    v5 = -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier shouldAllowGroupOpacityForAppLayout:](&v8, sel_shouldAllowGroupOpacityForAppLayout_, v4);
  }
  v6 = v5;

  return v6;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v11, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBContinuousExposeFullScreenCrossblurTransitionSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "crossblurDosidoSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v9, "setResponse:", 0.45);
  objc_msgSend(v9, "setDampingRatio:", 0.92);
  objc_msgSend(v5, "setLayoutUpdateMode:", 3);
  objc_msgSend(v5, "setLayoutSettings:", v9);
  objc_msgSend(v5, "setOpacitySettings:", v9);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerReason, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
}

@end
