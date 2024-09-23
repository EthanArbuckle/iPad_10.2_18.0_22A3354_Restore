@implementation SBItemResizeGestureRootSwitcherModifier

- (SBItemResizeGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 selectedLayoutRole:(int64_t)a4
{
  SBItemResizeGestureRootSwitcherModifier *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBItemResizeGestureRootSwitcherModifier;
  result = -[SBGestureRootSwitcherModifier initWithStartingEnvironmentMode:](&v6, sel_initWithStartingEnvironmentMode_, a3);
  if (result)
    result->_selectedLayoutRole = a4;
  return result;
}

- (int64_t)gestureType
{
  return 9;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v4;
  SBItemResizeGestureSwitcherModifier *v5;
  void *v6;
  SBItemResizeGestureSwitcherModifier *v7;

  v4 = a3;
  v5 = [SBItemResizeGestureSwitcherModifier alloc];
  objc_msgSend(v4, "gestureID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBItemResizeGestureSwitcherModifier initWithGestureID:](v5, "initWithGestureID:", v6);
  return v7;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  SBItemResizeTransitionSwitcherModifier *v9;
  void *v10;
  void *v11;
  SBItemResizeTransitionSwitcherModifier *v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_class();
  SBSafeCast(v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [SBItemResizeTransitionSwitcherModifier alloc];
  objc_msgSend(v6, "transitionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "selectedAppLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBItemResizeTransitionSwitcherModifier initWithTransitionID:selectedAppLayout:](v9, "initWithTransitionID:selectedAppLayout:", v10, v11);

  return v12;
}

- (id)appLayoutsToResignActive
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (int64_t)selectedLayoutRole
{
  return self->_selectedLayoutRole;
}

@end
