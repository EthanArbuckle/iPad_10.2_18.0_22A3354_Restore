@implementation SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier

- (SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier)initWithAppLayout:(id)a3 behindAppLayout:(id)a4 generationCount:(unint64_t)a5
{
  id v10;
  id v11;
  SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
  v12 = -[SBSwitcherModifier init](&v16, sel_init);
  if (v12)
  {
    if (v10)
    {
      if (v11)
      {
LABEL_4:
        objc_storeStrong((id *)&v12->_appLayout, a3);
        objc_storeStrong((id *)&v12->_behindAppLayout, a4);
        v12->_generationCount = a5;
        v12->_initialGenerationCount = a5;
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

      if (v11)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("behindAppLayout"));

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

- (id)visibleAppLayouts
{
  void *v3;
  SBAppLayout *behindAppLayout;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
  -[SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier visibleAppLayouts](&v8, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  behindAppLayout = self->_behindAppLayout;
  v9[0] = self->_appLayout;
  v9[1] = behindAppLayout;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  objc_super v12;

  v8 = a4;
  v9 = 0.0;
  if ((objc_msgSend(v8, "isEqual:", self->_appLayout) & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
    -[SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v12, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
    v9 = v10;
  }

  return v9;
}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
  -[SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier appLayoutsForContinuousExposeIdentifier:](&v10, sel_appLayoutsForContinuousExposeIdentifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") >= 2
    && (-[SBAppLayout continuousExposeIdentifier](self->_appLayout, "continuousExposeIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", v4),
        v6,
        v7)
    && !-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", self->_behindAppLayout))
  {
    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    if (objc_msgSend(v8, "containsObject:", self->_appLayout)
      && objc_msgSend(v8, "containsObject:", self->_behindAppLayout))
    {
      objc_msgSend(v8, "removeObject:", self->_appLayout);
    }

  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  SBAppLayout *appLayoutToOrderFront;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "appLayoutsWithRemovalContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", self->_appLayoutToOrderFront);

  if (v6)
  {
    appLayoutToOrderFront = self->_appLayoutToOrderFront;
    self->_appLayoutToOrderFront = 0;

  }
  v10.receiver = self;
  v10.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v10, sel_handleTransitionEvent_, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)handleContinuousExposeIdentifiersChangedEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  SBTimerEventSwitcherEventResponse *v7;
  void *v8;
  SBTimerEventSwitcherEventResponse *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  SBAppLayout *v15;
  SBAppLayout *appLayoutToOrderFront;
  void *v17;
  char v18;
  SBAppLayout *v19;
  void *v20;
  uint64_t v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
  -[SBSwitcherModifier handleContinuousExposeIdentifiersChangedEvent:](&v23, sel_handleContinuousExposeIdentifiersChangedEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isAnimated"))
  {
    v6 = -[SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier continuousExposeIdentifiersGenerationCount](self, "continuousExposeIdentifiersGenerationCount");
    self->_generationCount = v6;
    if (v6 == self->_initialGenerationCount)
    {
      v7 = [SBTimerEventSwitcherEventResponse alloc];
      -[SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier _timeoutReason](self, "_timeoutReason");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v7, "initWithDelay:validator:reason:", 0, v8, 1.5);

      SBAppendSwitcherModifierResponse(v9, v5);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
    }
    objc_msgSend(v4, "transitioningToAppLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "continuousExposeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppLayout continuousExposeIdentifier](self->_appLayout, "continuousExposeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (v14)
    {
      objc_msgSend(v4, "transitioningToAppLayout");
      v15 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
      appLayoutToOrderFront = self->_appLayoutToOrderFront;
      self->_appLayoutToOrderFront = v15;

      if (!-[SBAppLayout isEqual:](self->_appLayout, "isEqual:", self->_behindAppLayout))
      {
        objc_msgSend(v4, "transitioningToAppLayout");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqual:", self->_behindAppLayout);

        if ((v18 & 1) == 0)
          goto LABEL_10;
      }
    }
    else
    {
      v19 = self->_appLayoutToOrderFront;
      self->_appLayoutToOrderFront = 0;

    }
    -[SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier _completeIfNeededIgnoringHover:](self, "_completeIfNeededIgnoringHover:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SBAppendSwitcherModifierResponse(v20, v5);
    v21 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v21;
  }
LABEL_10:

  return v5;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleTimerEvent:](&v13, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v13.receiver, v13.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier _timeoutReason](self, "_timeoutReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    -[SBAppLayout continuousExposeIdentifier](self->_appLayout, "continuousExposeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isDelayingCompletionForHover = -[SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier anyHighlightedAppLayoutsForContinuousExposeIdentifier:](self, "anyHighlightedAppLayoutsForContinuousExposeIdentifier:", v9);

    -[SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier _completeIfNeeded](self, "_completeIfNeeded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SBAppendSwitcherModifierResponse(v10, v5);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  return v5;
}

- (id)handleHighlightEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleHighlightEvent:](&v10, sel_handleHighlightEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isHoverEvent", v10.receiver, v10.super_class);

  if (v6 && self->_isDelayingCompletionForHover)
  {
    -[SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier _completeIfNeeded](self, "_completeIfNeeded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  return v5;
}

- (id)_completeIfNeeded
{
  return -[SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier _completeIfNeededIgnoringHover:](self, "_completeIfNeededIgnoringHover:", 0);
}

- (id)_completeIfNeededIgnoringHover:(BOOL)a3
{
  void *v5;
  char v6;
  void *v7;
  SBPerformTransitionSwitcherEventResponse *v8;
  void *v9;
  SBPerformTransitionSwitcherEventResponse *v10;

  if (-[SBChainableModifier state](self, "state") == 1
    || self->_isDelayingCompletionForHover
    && !a3
    && (-[SBAppLayout continuousExposeIdentifier](self->_appLayout, "continuousExposeIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = -[SBCycleContinuousExposeGroupAppLayoutsSwitcherModifier anyHighlightedAppLayoutsForContinuousExposeIdentifier:](self, "anyHighlightedAppLayoutsForContinuousExposeIdentifier:", v5), v5, (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    self->_isDelayingCompletionForHover = 0;
    if (self->_generationCount == self->_initialGenerationCount && self->_appLayoutToOrderFront)
    {
      v8 = [SBPerformTransitionSwitcherEventResponse alloc];
      +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", self->_appLayoutToOrderFront);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:](v8, "initWithTransitionRequest:gestureInitiated:", v9, 0);

      SBAppendSwitcherModifierResponse(v10, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    -[SBChainableModifier setState:](self, "setState:", 1);
  }
  return v7;
}

- (id)_timeoutReason
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%ld"), v5, self->_initialGenerationCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (SBAppLayout)behindAppLayout
{
  return self->_behindAppLayout;
}

- (unint64_t)generationCount
{
  return self->_generationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behindAppLayout, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_appLayoutToOrderFront, 0);
}

@end
