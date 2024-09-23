@implementation SBRevealContinuousExposeStripsGestureModifier

- (SBRevealContinuousExposeStripsGestureModifier)initWithGestureID:(id)a3 initialAppLayout:(id)a4
{
  id v8;
  SBRevealContinuousExposeStripsGestureModifier *v9;
  void *v11;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBRevealContinuousExposeStripsGestureModifier;
  v9 = -[SBGestureSwitcherModifier initWithGestureID:](&v12, sel_initWithGestureID_, a3);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBRevealContinuousExposeStripsGestureModifier.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialAppLayout"));

    }
    objc_storeStrong((id *)&v9->_initialAppLayout, a4);
  }

  return v9;
}

- (double)continuousExposeStripProgress
{
  return self->_progress;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
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
  objc_super v21;
  UIRectCornerRadii result;

  -[SBRevealContinuousExposeStripsGestureModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqual:", self->_initialAppLayout))
  {
    -[SBRevealContinuousExposeStripsGestureModifier displayCornerRadius](self, "displayCornerRadius");
    if (v7 == 0.0)
    {
      -[SBRevealContinuousExposeStripsGestureModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stageCornerRadii");

    }
    -[SBRevealContinuousExposeStripsGestureModifier scaleForIndex:](self, "scaleForIndex:", a3);
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SBRevealContinuousExposeStripsGestureModifier;
    -[SBRevealContinuousExposeStripsGestureModifier cornerRadiiForIndex:](&v21, sel_cornerRadiiForIndex_, a3);
  }
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;

  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  result.topRight = v20;
  result.bottomRight = v19;
  result.bottomLeft = v18;
  result.topLeft = v17;
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SBRevealContinuousExposeStripsGestureModifier;
  -[SBRevealContinuousExposeStripsGestureModifier shadowOpacityForLayoutRole:atIndex:](&v19, sel_shadowOpacityForLayoutRole_atIndex_, a3);
  v7 = v6;
  -[SBRevealContinuousExposeStripsGestureModifier appLayouts](self, "appLayouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqual:", self->_initialAppLayout))
  {
    v18.receiver = self;
    v18.super_class = (Class)SBRevealContinuousExposeStripsGestureModifier;
    -[SBRevealContinuousExposeStripsGestureModifier frameForIndex:](&v18, sel_frameForIndex_, a4);
    v11 = v10;
    v13 = v12;
    -[SBRevealContinuousExposeStripsGestureModifier containerViewBounds](self, "containerViewBounds");
    if (v11 == v15 && v13 == v14)
      v7 = fmin(fmax(v7 * self->_progress + 0.0, 0.0), 1.0);
  }

  return v7;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;
  CAFrameRateRange v10;

  v9.receiver = self;
  v9.super_class = (Class)SBRevealContinuousExposeStripsGestureModifier;
  v3 = a3;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy", v9.receiver, v9.super_class);

  v6 = objc_msgSend(v3, "switcherLayoutElementType");
  if (!v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
    objc_msgSend(v7, "setTrackingResponse:", 0.15);
    objc_msgSend(v7, "setTrackingDampingRatio:", 0.85);
    v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v7, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v10.minimum, *(double *)&v10.maximum, *(double *)&v10.preferred);
    objc_msgSend(v5, "setLayoutSettings:", v7);
    objc_msgSend(v5, "setPositionSettings:", v7);
    objc_msgSend(v5, "setOpacitySettings:", v7);
    objc_msgSend(v5, "setUpdateMode:", 5);

  }
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  uint64_t v9;
  SBUpdateContinuousExposeStripsPresentationResponse *v10;
  uint64_t v11;
  uint64_t v12;
  SBUpdateContinuousExposeStripsPresentationResponse *v13;
  void *v14;
  SBUpdateLayoutSwitcherEventResponse *v15;
  void *v16;
  void *v17;
  SBPerformTransitionSwitcherEventResponse *v18;
  __int128 v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBRevealContinuousExposeStripsGestureModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v21, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isIndirectPanGestureEvent");
  -[SBRevealContinuousExposeStripsGestureModifier isRTLEnabled](self, "isRTLEnabled");
  objc_msgSend(v4, "translationInContainerView");
  -[SBRevealContinuousExposeStripsGestureModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stripWidth");

  v20 = 0u;
  BYTE8(v20) = 1;
  BSUIConstrainValueToIntervalWithRubberBand();
  self->_progress = v8;
  if (objc_msgSend(v4, "phase", 0, *((_QWORD *)&v20 + 1), 0x3FF0000000000000, 1) == 3)
  {
    if (v6)
    {
      v9 = objc_msgSend(v4, "indirectPanEndReason");
      if (objc_msgSend(v4, "isCanceled"))
      {
        if (v9 != 5)
        {
LABEL_12:
          v10 = [SBUpdateContinuousExposeStripsPresentationResponse alloc];
          v11 = 0;
          v12 = 1;
          goto LABEL_13;
        }
      }
      else if (v9 != 3 && (BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
      {
        goto LABEL_12;
      }
    }
    else if ((objc_msgSend(v4, "isCanceled") & 1) != 0 || !BSFloatGreaterThanOrEqualToFloat())
    {
      goto LABEL_12;
    }
    v10 = [SBUpdateContinuousExposeStripsPresentationResponse alloc];
    v11 = 1;
    v12 = 0;
LABEL_13:
    v13 = -[SBUpdateContinuousExposeStripsPresentationResponse initWithPresentationOptions:dismissalOptions:](v10, "initWithPresentationOptions:dismissalOptions:", v11, v12);
    SBAppendSwitcherModifierResponse(v13, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 12, 3);
    SBAppendSwitcherModifierResponse(v15, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", self->_initialAppLayout);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v17, 1);
    SBAppendSwitcherModifierResponse(v18, v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBRevealContinuousExposeStripsGestureModifier;
  v4 = a3;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v8, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 >= 2)
    -[SBChainableModifier setState:](self, "setState:", 1);
  return v5;
}

- (SBAppLayout)initialAppLayout
{
  return self->_initialAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialAppLayout, 0);
}

@end
