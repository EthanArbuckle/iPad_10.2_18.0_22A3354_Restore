@implementation SBGridSwipeUpGestureRootSwitcherModifier

- (SBGridSwipeUpGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 multitaskingModifier:(id)a4
{
  id v8;
  SBGridSwipeUpGestureRootSwitcherModifier *v9;
  void *v11;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBGridSwipeUpGestureRootSwitcherModifier;
  v9 = -[SBGestureRootSwitcherModifier initWithStartingEnvironmentMode:](&v12, sel_initWithStartingEnvironmentMode_, a3);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBGridSwipeUpGestureRootSwitcherModifier.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("multitaskingModifier"));

    }
    objc_storeStrong((id *)&v9->_multitaskingModifier, a4);
  }

  return v9;
}

- (int64_t)gestureType
{
  return 2;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v4;
  SBGridSwipeUpGestureSwitcherModifier *v5;
  void *v6;
  SBGridSwipeUpGestureSwitcherModifier *v7;

  v4 = a3;
  v5 = [SBGridSwipeUpGestureSwitcherModifier alloc];
  objc_msgSend(v4, "gestureID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBGridSwipeUpGestureSwitcherModifier initWithGestureID:delayCompletionUntilTransitionBegins:](v5, "initWithGestureID:delayCompletionUntilTransitionBegins:", v6, 1);
  return v7;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  SBContinuousExposeToHomeSwitcherModifier *v9;
  void *v10;
  SBContinuousExposeToHomeSwitcherModifier *v11;

  v5 = a3;
  if (objc_msgSend(v5, "fromEnvironmentMode") == 2 && objc_msgSend(v5, "toEnvironmentMode") == 1)
  {
    v6 = objc_opt_class();
    v7 = -[SBGridSwipeUpGestureRootSwitcherModifier _newMultitaskingModifier](self, "_newMultitaskingModifier");
    SBSafeCast(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [SBContinuousExposeToHomeSwitcherModifier alloc];
      objc_msgSend(v5, "transitionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SBContinuousExposeToHomeSwitcherModifier initWithTransitionID:direction:continuousExposeModifier:](v9, "initWithTransitionID:direction:continuousExposeModifier:", v10, 0, v8);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_newMultitaskingModifier
{
  return (id)-[SBSwitcherModifier copy](self->_multitaskingModifier, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
}

@end
