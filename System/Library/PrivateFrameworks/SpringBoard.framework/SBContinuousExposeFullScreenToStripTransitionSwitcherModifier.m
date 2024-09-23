@implementation SBContinuousExposeFullScreenToStripTransitionSwitcherModifier

- (SBContinuousExposeFullScreenToStripTransitionSwitcherModifier)initWithTransitionID:(id)a3 outgoingAppLayout:(id)a4
{
  id v7;
  SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *v8;
  SBContinuousExposeFullScreenToStripTransitionSwitcherModifier *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *timerReason;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
  v8 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v16, sel_initWithTransitionID_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_outgoingAppLayout, a4);
    v9->_animationPhase = 0;
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("SBContinuousExposeFullScreenToStripTransitionSwitcherModifierTimerEventReason"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    timerReason = v9->_timerReason;
    v9->_timerReason = (NSString *)v13;

  }
  return v9;
}

- (id)transitionWillBegin
{
  void *v3;
  SBTimerEventSwitcherEventResponse *v4;
  void *v5;
  SBTimerEventSwitcherEventResponse *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v8, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_animationPhase)
  {
    v4 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, self->_timerReason, 0.14);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:]([SBTimerEventSwitcherEventResponse alloc], "initWithDelay:validator:reason:", 0, self->_timerReason, 0.14);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t animationPhase;
  uint64_t v8;
  int64_t v9;
  SBUpdateLayoutSwitcherEventResponse *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v13, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v13.receiver, v13.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", self->_timerReason);
  if ((_DWORD)v4)
  {
    animationPhase = self->_animationPhase;
    if (!animationPhase)
    {
      v8 = 2;
      v9 = 1;
      goto LABEL_6;
    }
    if (animationPhase == 1)
    {
      v8 = 3;
      v9 = 2;
LABEL_6:
      self->_animationPhase = v9;
      v10 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, v8);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v10, v5);
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v11;
    }
  }
  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  int64_t animationPhase;
  void *v8;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  objc_super v30;
  CGRect result;

  -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SBAppLayout isEqual:](self->_outgoingAppLayout, "isEqual:", v6))
    goto LABEL_5;
  animationPhase = self->_animationPhase;
  if (animationPhase == 1)
  {
    v30.receiver = self;
    v30.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier frameForIndex:](&v30, sel_frameForIndex_, a3);
    v14 = v21;
    v16 = v22;
    v10 = v23 * 0.1;
    v12 = v24 * 1.065;
    goto LABEL_7;
  }
  if (animationPhase)
  {
LABEL_5:
    v29.receiver = self;
    v29.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier frameForIndex:](&v29, sel_frameForIndex_, a3);
    v10 = v17;
    v12 = v18;
    v14 = v19;
    v16 = v20;
  }
  else
  {
    -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "boundingBox");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

  }
LABEL_7:

  v25 = v10;
  v26 = v12;
  v27 = v14;
  v28 = v16;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)frameForIconOverlayInAppLayout:(id)a3
{
  SBAppLayout *outgoingAppLayout;
  id v5;
  void *v6;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect result;

  outgoingAppLayout = self->_outgoingAppLayout;
  v5 = a3;
  if (-[SBAppLayout isEqual:](outgoingAppLayout, "isEqual:", v5))
  {
    -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "boundingBox");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier frameForIconOverlayInAppLayout:](&v23, sel_frameForIconOverlayInAppLayout_, v5);
    v8 = v15;
    v10 = v16;
    v12 = v17;
    v14 = v18;

  }
  v19 = v8;
  v20 = v10;
  v21 = v12;
  v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
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

  -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppLayout isEqual:](self->_outgoingAppLayout, "isEqual:", v6) && !self->_animationPhase)
  {
    -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stageCornerRadii");
    -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
    SBRectCornerRadiiForRadius();
    v8 = v16;
    v10 = v17;
    v12 = v18;
    v14 = v19;

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier cornerRadiiForIndex:](&v24, sel_cornerRadiiForIndex_, a3);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }

  v20 = v8;
  v21 = v10;
  v22 = v12;
  v23 = v14;
  result.topRight = v23;
  result.bottomRight = v22;
  result.bottomLeft = v21;
  result.topLeft = v20;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGPoint result;

  -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SBAppLayout isEqual:](self->_outgoingAppLayout, "isEqual:", v6)
    || (v7 = 0.5, v8 = 0.5, self->_animationPhase >= 2))
  {
    v13.receiver = self;
    v13.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier anchorPointForIndex:](&v13, sel_anchorPointForIndex_, a3);
    v7 = v9;
    v8 = v10;
  }

  v11 = v7;
  v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v8;

  v4 = a3;
  if (-[SBAppLayout isEqual:](self->_outgoingAppLayout, "isEqual:", v4) && !self->_animationPhase)
  {
    v6 = 0.0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier perspectiveAngleForAppLayout:](&v8, sel_perspectiveAngleForAppLayout_, v4);
    v6 = v5;
  }

  return v6;
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
  double v12;
  objc_super v14;

  -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SBAppLayout isEqual:](self->_outgoingAppLayout, "isEqual:", v6))
    goto LABEL_5;
  animationPhase = self->_animationPhase;
  if (animationPhase == 1)
  {
    v11 = 0.32;
    goto LABEL_7;
  }
  if (animationPhase)
  {
LABEL_5:
    v14.receiver = self;
    v14.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier scaleForIndex:](&v14, sel_scaleForIndex_, a3);
    v11 = v12;
  }
  else
  {
    -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier switcherSettings](self, "switcherSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "crossblurDosidoSmallScale");
    v11 = v10;

  }
LABEL_7:

  return v11;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = a4;
  if (!-[SBAppLayout isEqual:](self->_outgoingAppLayout, "isEqual:", v8) || (v9 = 0.0, self->_animationPhase >= 2))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v9 = v10;
  }

  return v9;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SBAppLayout isEqual:](self->_outgoingAppLayout, "isEqual:", v6) || (v7 = 0.0, self->_animationPhase >= 2))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier titleAndIconOpacityForIndex:](&v10, sel_titleAndIconOpacityForIndex_, a3);
    v7 = v8;
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
    v5 = -[SBAppLayout isEqual:](self->_outgoingAppLayout, "isEqual:", v4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
    v5 = -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier shouldAllowGroupOpacityForAppLayout:](&v8, sel_shouldAllowGroupOpacityForAppLayout_, v4);
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBContinuousExposeFullScreenToStripTransitionSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v15, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "crossblurDosidoSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v9, "setResponse:", 0.4);
  objc_msgSend(v9, "setDampingRatio:", 1.0);
  objc_msgSend(v5, "setLayoutUpdateMode:", 3);
  objc_msgSend(v5, "setLayoutSettings:", v9);
  -[SBContinuousExposeFullScreenToStripTransitionSwitcherModifier switcherSettings](self, "switcherSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "animationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "crossblurDosidoSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  objc_msgSend(v13, "setResponse:", 0.15);
  objc_msgSend(v5, "setOpacitySettings:", v13);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerReason, 0);
  objc_storeStrong((id *)&self->_outgoingAppLayout, 0);
}

@end
