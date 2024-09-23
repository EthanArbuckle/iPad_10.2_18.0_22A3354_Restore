@implementation SBRevealContinuousExposeStripOverflowRootSwitcherModifier

- (SBRevealContinuousExposeStripOverflowRootSwitcherModifier)initWithInitialAppLayout:(id)a3
{
  id v5;
  SBRevealContinuousExposeStripOverflowRootSwitcherModifier *v6;
  SBRevealContinuousExposeStripOverflowRootSwitcherModifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRevealContinuousExposeStripOverflowRootSwitcherModifier;
  v6 = -[SBGestureRootSwitcherModifier initWithStartingEnvironmentMode:](&v9, sel_initWithStartingEnvironmentMode_, 3);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_initialAppLayout, a3);

  return v7;
}

- (int64_t)gestureType
{
  return 11;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5;
  SBRevealContinuousExposeStripOverflowGestureModifier *v6;
  void *v7;
  SBRevealContinuousExposeStripOverflowGestureModifier *v8;

  v5 = a3;
  v6 = [SBRevealContinuousExposeStripOverflowGestureModifier alloc];
  objc_msgSend(v5, "gestureID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBRevealContinuousExposeStripOverflowGestureModifier initWithGestureID:initialAppLayout:](v6, "initWithGestureID:initialAppLayout:", v7, self->_initialAppLayout);
  return v8;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v4;
  SBContinuousExposeSwitcherToAppModifier *v5;
  void *v6;
  SBAppSwitcherContinuousExposeSwitcherModifier *v7;
  SBContinuousExposeSwitcherToAppModifier *v8;

  v4 = a3;
  v5 = [SBContinuousExposeSwitcherToAppModifier alloc];
  objc_msgSend(v4, "transitionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
  v8 = -[SBContinuousExposeSwitcherToAppModifier initWithTransitionID:direction:multitaskingModifier:](v5, "initWithTransitionID:direction:multitaskingModifier:", v6, 1, v7);

  return v8;
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
