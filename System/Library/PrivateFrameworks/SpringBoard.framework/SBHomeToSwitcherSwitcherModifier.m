@implementation SBHomeToSwitcherSwitcherModifier

- (SBHomeToSwitcherSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 multitaskingModifier:(id)a5
{
  id v9;
  SBHomeToSwitcherSwitcherModifier *v10;
  SBHomeToSwitcherSwitcherModifier *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SBHomeToSwitcherSwitcherModifier;
  v10 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v13, sel_initWithTransitionID_, a3);
  v11 = v10;
  if (v10)
  {
    v10->_direction = a4;
    objc_storeStrong((id *)&v10->_multitaskingModifier, a5);
  }

  return v11;
}

- (double)containerStatusBarAnimationDuration
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  double v8;

  -[SBHomeToSwitcherSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 0.35;
  -[SBHomeToSwitcherSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_direction == 1)
    objc_msgSend(v7, "statusBarToApexBounceAnimationDuration");
  else
    objc_msgSend(v7, "statusBarFromApexBounceAnimationDuration");
  v5 = v8;

  return v5;
}

- (id)transitionWillBegin
{
  void *v3;
  SBSwitcherModifierEventResponse *v4;
  void *v5;
  SBScrollToAppLayoutSwitcherEventResponse *v6;
  int64_t direction;
  SBUpdateLayoutSwitcherEventResponse *v8;
  uint64_t v9;
  SBUpdateLayoutSwitcherEventResponse *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBHomeToSwitcherSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v13, sel_transitionWillBegin);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  -[SBHomeToSwitcherSwitcherModifier appLayoutToScrollToDuringTransition](self, "appLayoutToScrollToDuringTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v5, 0, 0);
    -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v6);

  }
  direction = self->_direction;
  v8 = [SBUpdateLayoutSwitcherEventResponse alloc];
  if (direction == 1)
    v9 = 30;
  else
    v9 = 2;
  v10 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:](v8, "initWithOptions:updateMode:", v9, 2);
  -[SBChainableModifierEventResponse addChildResponse:](v4, "addChildResponse:", v10);

  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v4, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)transitionWillUpdate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  SBTimerEventSwitcherEventResponse *v10;
  void *v11;
  SBTimerEventSwitcherEventResponse *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBHomeToSwitcherSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillUpdate](&v15, sel_transitionWillUpdate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_direction == 1)
  {
    -[SBHomeToSwitcherSwitcherModifier appLayouts](self, "appLayouts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
    {
      -[SBHomeToSwitcherSwitcherModifier switcherSettings](self, "switcherSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "animationSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "emptySwitcherDismissDelay");
      v9 = v8;

      v10 = [SBTimerEventSwitcherEventResponse alloc];
      -[SBHomeToSwitcherSwitcherModifier _dismissForEmptySwitcherResponseName](self, "_dismissForEmptySwitcherResponseName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SBTimerEventSwitcherEventResponse initWithDelay:validator:reason:](v10, "initWithDelay:validator:reason:", 0, v11, v9);

      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v12, v3);
      v13 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v13;
    }
  }
  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  id v4;
  void *v5;
  SBDismissForEmptySwitcherSwitcherEventResponse *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHomeToSwitcherSwitcherModifier;
  v4 = a3;
  -[SBTransitionSwitcherModifier handleTimerEvent:](&v11, sel_handleTimerEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason", v11.receiver, v11.super_class);
  v6 = (SBDismissForEmptySwitcherSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();

  -[SBHomeToSwitcherSwitcherModifier _dismissForEmptySwitcherResponseName](self, "_dismissForEmptySwitcherResponseName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBDismissForEmptySwitcherSwitcherEventResponse isEqualToString:](v6, "isEqualToString:", v7))
    goto LABEL_4;
  -[SBHomeToSwitcherSwitcherModifier appLayouts](self, "appLayouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    v6 = objc_alloc_init(SBDismissForEmptySwitcherSwitcherEventResponse);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v5);
    v7 = v5;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  }
  return v5;
}

- (BOOL)isEffectivelyHome
{
  BOOL v3;
  BOOL v4;

  if (-[SBTransitionSwitcherModifier isPreparingLayout](self, "isPreparingLayout"))
    v3 = -[SBHomeToSwitcherSwitcherModifier direction](self, "direction") == 1;
  else
    v3 = 0;
  if (-[SBTransitionSwitcherModifier isUpdatingLayout](self, "isUpdatingLayout"))
    v4 = -[SBHomeToSwitcherSwitcherModifier direction](self, "direction") == 0;
  else
    v4 = 0;
  return v3 || v4;
}

- (id)appLayoutToScrollToDuringTransition
{
  return 0;
}

- (id)_dismissForEmptySwitcherResponseName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DismissForEmptySwitcher-%p"), self);
}

- (int64_t)direction
{
  return self->_direction;
}

- (SBSwitcherModifier)multitaskingModifier
{
  return self->_multitaskingModifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
}

@end
