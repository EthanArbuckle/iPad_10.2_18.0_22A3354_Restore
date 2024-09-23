@implementation SBRevealContinuousExposeStripsRootSwitcherModifier

- (SBRevealContinuousExposeStripsRootSwitcherModifier)initWithInitialAppLayout:(id)a3
{
  id v5;
  SBRevealContinuousExposeStripsRootSwitcherModifier *v6;
  SBRevealContinuousExposeStripsRootSwitcherModifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRevealContinuousExposeStripsRootSwitcherModifier;
  v6 = -[SBGestureRootSwitcherModifier initWithStartingEnvironmentMode:](&v9, sel_initWithStartingEnvironmentMode_, 3);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_initialAppLayout, a3);

  return v7;
}

- (int64_t)gestureType
{
  return 10;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5;
  SBRevealContinuousExposeStripsGestureModifier *v6;
  void *v7;
  SBRevealContinuousExposeStripsGestureModifier *v8;

  v5 = a3;
  v6 = [SBRevealContinuousExposeStripsGestureModifier alloc];
  objc_msgSend(v5, "gestureID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBRevealContinuousExposeStripsGestureModifier initWithGestureID:initialAppLayout:](v6, "initWithGestureID:initialAppLayout:", v7, self->_initialAppLayout);
  return v8;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v5;
  SBContinuousExposeAppToAppModifier *v6;
  void *v7;
  SBAppLayout *initialAppLayout;
  uint64_t v9;
  SBAppLayout *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  SBContinuousExposeAppToAppModifier *v14;

  v5 = a3;
  v6 = [SBContinuousExposeAppToAppModifier alloc];
  objc_msgSend(v5, "transitionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  initialAppLayout = self->_initialAppLayout;
  v9 = objc_msgSend(v5, "fromInterfaceOrientation");
  v10 = self->_initialAppLayout;
  v11 = objc_msgSend(v5, "toInterfaceOrientation");
  objc_msgSend(v5, "fromDisplayItemLayoutAttributesMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toDisplayItemLayoutAttributesMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SBContinuousExposeAppToAppModifier initWithTransitionID:fromAppLayout:fromInterfaceOrientation:toAppLayout:toInterfaceOrientation:fromDisplayItemLayoutAttributesMap:toDisplayItemLayoutAttributesMap:](v6, "initWithTransitionID:fromAppLayout:fromInterfaceOrientation:toAppLayout:toInterfaceOrientation:fromDisplayItemLayoutAttributesMap:toDisplayItemLayoutAttributesMap:", v7, initialAppLayout, v9, v10, v11, v12, v13);
  return v14;
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
