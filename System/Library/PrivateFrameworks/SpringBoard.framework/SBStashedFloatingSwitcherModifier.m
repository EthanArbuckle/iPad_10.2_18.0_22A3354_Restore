@implementation SBStashedFloatingSwitcherModifier

- (SBStashedFloatingSwitcherModifier)initWithFloatingConfiguration:(int64_t)a3 environmentMode:(int64_t)a4
{
  SBStashedFloatingSwitcherModifier *v6;
  SBActiveAppLayoutFloatingSwitcherModifier *v7;
  SBActiveAppLayoutFloatingSwitcherModifier *activeModifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBStashedFloatingSwitcherModifier;
  v6 = -[SBSwitcherModifier init](&v10, sel_init);
  if (v6)
  {
    v7 = -[SBActiveAppLayoutFloatingSwitcherModifier initWithActiveAppLayout:floatingConfiguration:environmentMode:]([SBActiveAppLayoutFloatingSwitcherModifier alloc], "initWithActiveAppLayout:floatingConfiguration:environmentMode:", 0, a3, a4);
    activeModifier = v6->_activeModifier;
    v6->_activeModifier = v7;

    -[SBChainableModifier addChildModifier:](v6, "addChildModifier:", v6->_activeModifier);
  }
  return v6;
}

- (id)handleTapSlideOverTongueEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBPerformTransitionSwitcherEventResponse *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  -[SBStashedFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setSource:", 60);
  v9 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v8, 0);
  v13.receiver = self;
  v13.super_class = (Class)SBStashedFloatingSwitcherModifier;
  -[SBSwitcherModifier handleTapSlideOverTongueEvent:](&v13, sel_handleTapSlideOverTongueEvent_, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  SBAppendSwitcherModifierResponse(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)visibleAppLayouts
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 0.0;
}

- (BOOL)isSwitcherWindowVisible
{
  return 0;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeModifier, 0);
}

@end
