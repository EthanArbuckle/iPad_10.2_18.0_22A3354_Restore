@implementation SBMoveGestureRootFloatingSwitcherModifier

- (SBMoveGestureRootFloatingSwitcherModifier)initWithInitialFloatingConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4
{
  SBMoveGestureRootFloatingSwitcherModifier *v6;
  _BOOL4 IsValid;
  int64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBMoveGestureRootFloatingSwitcherModifier;
  v6 = -[SBGestureRootSwitcherModifier initWithStartingEnvironmentMode:](&v10, sel_initWithStartingEnvironmentMode_, 3);
  if (v6)
  {
    IsValid = SBFloatingConfigurationIsValid(a3);
    v8 = 4;
    if (IsValid)
      v8 = a3;
    v6->_currentFloatingConfiguration = v8;
    v6->_interfaceOrientation = a4;
  }
  return v6;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "phase") == 1)
    self->_currentFloatingConfiguration = objc_msgSend(v4, "toFloatingConfiguration");
  v7.receiver = self;
  v7.super_class = (Class)SBMoveGestureRootFloatingSwitcherModifier;
  -[SBGestureRootSwitcherModifier handleTransitionEvent:](&v7, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)gestureType
{
  return 4;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5;
  SBMoveGestureFloatingSwitcherModifier *v6;
  void *v7;
  SBMoveGestureFloatingSwitcherModifier *v8;

  v5 = a3;
  v6 = [SBMoveGestureFloatingSwitcherModifier alloc];
  objc_msgSend(v5, "gestureID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBMoveGestureFloatingSwitcherModifier initWithGestureID:initialFloatingConfiguration:interfaceOrientation:](v6, "initWithGestureID:initialFloatingConfiguration:interfaceOrientation:", v7, self->_currentFloatingConfiguration, self->_interfaceOrientation);
  return v8;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v4;
  void *v5;
  SBMoveFloatingConfigurationFloatingSwitcherModifier *v6;
  uint64_t v7;
  uint64_t v8;
  SBMoveFloatingConfigurationFloatingSwitcherModifier *v9;

  v4 = a3;
  objc_msgSend(v4, "transitionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [SBMoveFloatingConfigurationFloatingSwitcherModifier alloc];
  v7 = objc_msgSend(v4, "fromFloatingConfiguration");
  v8 = objc_msgSend(v4, "toFloatingConfiguration");

  v9 = -[SBMoveFloatingConfigurationFloatingSwitcherModifier initWithTransitionID:fromFloatingConfiguration:toFloatingConfiguration:](v6, "initWithTransitionID:fromFloatingConfiguration:toFloatingConfiguration:", v5, v7, v8);
  return v9;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (int64_t)currentFloatingConfiguration
{
  return self->_currentFloatingConfiguration;
}

- (void)setCurrentFloatingConfiguration:(int64_t)a3
{
  self->_currentFloatingConfiguration = a3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

@end
