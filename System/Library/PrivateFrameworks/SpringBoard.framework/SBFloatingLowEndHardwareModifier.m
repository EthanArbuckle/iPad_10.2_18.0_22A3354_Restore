@implementation SBFloatingLowEndHardwareModifier

- (SBFloatingLowEndHardwareModifier)initWithOptions:(unint64_t)a3
{
  SBFloatingLowEndHardwareModifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFloatingLowEndHardwareModifier;
  result = -[SBSwitcherModifier init](&v5, sel_init);
  if (result)
    result->_options = a3;
  return result;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  objc_msgSend(v4, "toFloatingAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "toFloatingSwitcherVisible");
  v7 = objc_msgSend(v4, "toEnvironmentMode");
  objc_msgSend(v4, "toAppLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_floatingSwitcherVisible = v6;
  self->_floatingConfiguration = objc_msgSend(v4, "toFloatingConfiguration");
  if (v5)
    v9 = 1;
  else
    v9 = v6;
  if (v7 == 3 && (v9 & 1) != 0)
  {
    objc_msgSend(v8, "allItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_floatingAppVisibleOverSplitView = (unint64_t)objc_msgSend(v10, "count") > 1;

    v11 = objc_msgSend(v4, "toAppLayoutWantsExclusiveForeground");
  }
  else
  {
    v11 = 0;
    self->_floatingAppVisibleOverSplitView = 0;
  }
  self->_floatingAppVisibleOverExclusiveForegroundApp = v11;
  if ((unint64_t)objc_msgSend(v4, "phase") >= 2)
    self->_shouldDimAndBlockTouches = -[SBFloatingLowEndHardwareModifier _shouldDimAndBlockTouchesToAppsUnderFloating](self, "_shouldDimAndBlockTouchesToAppsUnderFloating");
  v14.receiver = self;
  v14.super_class = (Class)SBFloatingLowEndHardwareModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v14, sel_handleTransitionEvent_, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  SBPerformTransitionSwitcherEventResponse *v7;
  void *v8;
  SBPerformTransitionSwitcherEventResponse *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBFloatingLowEndHardwareModifier;
  -[SBSwitcherModifier handleTapOutsideToDismissEvent:](&v16, sel_handleTapOutsideToDismissEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isHandled") & 1) == 0
    && -[SBFloatingLowEndHardwareModifier _shouldDimAndBlockTouchesToAppsUnderFloating](self, "_shouldDimAndBlockTouchesToAppsUnderFloating")&& !self->_floatingSwitcherVisible)
  {
    v6 = -[SBFloatingLowEndHardwareModifier _stashedFloatingConfigurationForFloatingConfiguration:](self, "_stashedFloatingConfigurationForFloatingConfiguration:", self->_floatingConfiguration);
    v7 = [SBPerformTransitionSwitcherEventResponse alloc];
    +[SBSwitcherTransitionRequest requestForStashingFloatingApplicationWithFloatingConfiguration:](SBSwitcherTransitionRequest, "requestForStashingFloatingApplicationWithFloatingConfiguration:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:](v7, "initWithTransitionRequest:gestureInitiated:", v8, 0);

    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v9, v5);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ handling tap outside by dismissing floating app."), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleWithReason:", v14);

    v5 = (void *)v10;
  }

  return v5;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 1;
}

- (double)switcherDimmingAlpha
{
  double result;
  objc_super v3;

  result = 0.5;
  if (!self->_shouldDimAndBlockTouches)
  {
    v3.receiver = self;
    v3.super_class = (Class)SBFloatingLowEndHardwareModifier;
    -[SBFloatingLowEndHardwareModifier homeScreenDimmingAlpha](&v3, sel_homeScreenDimmingAlpha, 0.5);
  }
  return result;
}

- (BOOL)switcherDimmingViewBlocksTouches
{
  objc_super v3;

  if (self->_shouldDimAndBlockTouches)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)SBFloatingLowEndHardwareModifier;
  return -[SBFloatingLowEndHardwareModifier switcherDimmingViewBlocksTouches](&v3, sel_switcherDimmingViewBlocksTouches);
}

- (BOOL)_shouldDimAndBlockTouchesToAppsUnderFloating
{
  if (self->_floatingAppVisibleOverExclusiveForegroundApp)
    return 1;
  else
    return self->_floatingAppVisibleOverSplitView & self->_options;
}

- (int64_t)_stashedFloatingConfigurationForFloatingConfiguration:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 3;
  else
    return qword_1D0E8A720[a3];
}

@end
