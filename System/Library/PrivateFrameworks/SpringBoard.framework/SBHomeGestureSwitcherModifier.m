@implementation SBHomeGestureSwitcherModifier

- (SBHomeGestureSwitcherModifier)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 startingEnvironmentMode:(int64_t)a5 multitaskingModifier:(id)a6 scrunchInitiated:(BOOL)a7 continuingGesture:(BOOL)a8 lastGestureWasAnArcSwipe:(BOOL)a9
{
  id v16;
  id v17;
  SBHomeGestureSwitcherModifier *v18;
  SBHomeGestureSwitcherModifier *v19;
  SBCoplanarSwitcherModifier *v20;
  SBCoplanarSwitcherModifier *coplanarLayoutModifier;
  SBDismissSiriSwitcherModifier *v22;
  SBDismissSiriSwitcherModifier *dismissSiriModifier;
  objc_super v25;

  v16 = a4;
  v17 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SBHomeGestureSwitcherModifier;
  v18 = -[SBGestureSwitcherModifier initWithGestureID:](&v25, sel_initWithGestureID_, a3);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_selectedAppLayout, a4);
    v19->_startingEnvironmentMode = a5;
    v19->_scrunchInitiated = a7;
    v19->_continuingGesture = a8;
    v19->_lastGestureWasAnArcSwipe = a9;
    v19->_laysOutNeighboringCards = 0;
    v19->_providesHomeScreenDimmingAlpha = 1;
    objc_storeStrong((id *)&v19->_multitaskingModifier, a6);
    v20 = -[SBCoplanarSwitcherModifier initWithActiveAppLayout:]([SBCoplanarSwitcherModifier alloc], "initWithActiveAppLayout:", v19->_selectedAppLayout);
    coplanarLayoutModifier = v19->_coplanarLayoutModifier;
    v19->_coplanarLayoutModifier = v20;

    -[SBCoplanarSwitcherModifier setUsesContainerViewBoundsAsActiveFrame:](v19->_coplanarLayoutModifier, "setUsesContainerViewBoundsAsActiveFrame:", 1);
    -[SBCoplanarSwitcherModifier setSpacingType:](v19->_coplanarLayoutModifier, "setSpacingType:", 1);
    v22 = objc_alloc_init(SBDismissSiriSwitcherModifier);
    dismissSiriModifier = v19->_dismissSiriModifier;
    v19->_dismissSiriModifier = v22;

    -[SBChainableModifier addChildModifier:](v19, "addChildModifier:", v19->_dismissSiriModifier);
  }

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBChainableModifier dealloc](&v3, sel_dealloc);
}

- (void)didMoveToParentModifier:(id)a3
{
  int v5;
  char v6;
  int64_t startingEnvironmentMode;
  SBHomeScreenSwitcherModifier *v9;
  SBHomeScreenSwitcherModifier *v10;
  SBSwitcherModifier *multitaskingModifier;
  double v12;
  void *v13;
  double v14;
  _BOOL4 v15;
  _BOOL8 v16;
  char v17;
  SBHomeGestureDockSwitcherModifier *v18;
  SBHomeGestureDockSwitcherModifier *dockModifier;
  double v20;
  id v21;
  SBHomeGestureFinalDestinationSwitcherModifier *v22;
  void *v23;
  double v24;
  SBHomeGestureFinalDestinationSwitcherModifier *v25;
  SBHomeGestureFinalDestinationSwitcherModifier *finalDestinationModifier;
  _QWORD v27[5];
  SBHomeScreenSwitcherModifier *v28;
  objc_super v29;
  _QWORD v30[5];
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v31, sel_didMoveToParentModifier_);
  if (!a3)
  {
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    return;
  }
  v5 = -[SBHomeGestureSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled");
  if (v5)
    v6 = -[SBHomeGestureSwitcherModifier prefersStripHiddenAndDisabled](self, "prefersStripHiddenAndDisabled");
  else
    v6 = 1;
  self->_laysOutNeighboringCards = v6;
  startingEnvironmentMode = self->_startingEnvironmentMode;
  if (startingEnvironmentMode != 1 && (startingEnvironmentMode != 3 || v5 == 0))
  {
    v9 = objc_alloc_init(SBHomeScreenSwitcherModifier);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __57__SBHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke_2;
    v27[3] = &unk_1E8E9E820;
    v27[4] = self;
    v28 = v9;
    v10 = v9;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v10, v27);

LABEL_15:
    goto LABEL_16;
  }
  multitaskingModifier = self->_multitaskingModifier;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __57__SBHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke;
  v30[3] = &unk_1E8E9DED8;
  v30[4] = self;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v30);
  if (!self->_providesHomeScreenDimmingAlpha)
  {
    v29.receiver = self;
    v29.super_class = (Class)SBHomeGestureSwitcherModifier;
    -[SBHomeGestureSwitcherModifier homeScreenAlpha](&v29, sel_homeScreenAlpha);
    self->_toHomeScreenAlpha = v12;
    -[SBHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
    v10 = (SBHomeScreenSwitcherModifier *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenSwitcherModifier animationSettings](v10, "animationSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeScreenBlurProgressForMode:", 2);
    self->_toHomeScreenBlurProgress = v14;

    goto LABEL_15;
  }
LABEL_16:
  if (-[SBHomeGestureSwitcherModifier isFloatingDockSupported](self, "isFloatingDockSupported"))
    v15 = !self->_scrunchInitiated;
  else
    v15 = 0;
  v16 = self->_continuingGesture && self->_lastGestureWasAnArcSwipe;
  v17 = !v15;
  if (self->_dockModifier)
    v17 = 1;
  if ((v17 & 1) == 0)
  {
    v18 = -[SBHomeGestureSwitcherModifier _newDockModifierRequiringVerticalSwipeToTrackDock:startingEnvironmentMode:](self, "_newDockModifierRequiringVerticalSwipeToTrackDock:startingEnvironmentMode:", v16, self->_startingEnvironmentMode);
    dockModifier = self->_dockModifier;
    self->_dockModifier = v18;

    -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", self->_dockModifier, 0, 0);
  }
  if (!self->_finalDestinationModifier)
  {
    if (self->_startingEnvironmentMode == 2)
    {
      -[SBHomeGestureSwitcherModifier _distanceYToInSwitcherCardScale](self, "_distanceYToInSwitcherCardScale");
      self->_translationAdjustmentForStartingFromSwitcher.y = -v20;
    }
    if (v15)
      v21 = -[SBHomeGestureSwitcherModifier _newDockModifierRequiringVerticalSwipeToTrackDock:startingEnvironmentMode:](self, "_newDockModifierRequiringVerticalSwipeToTrackDock:startingEnvironmentMode:", v16, self->_startingEnvironmentMode);
    else
      v21 = 0;
    v22 = [SBHomeGestureFinalDestinationSwitcherModifier alloc];
    -[SBHomeGestureSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "minimumYDistanceForHomeOrAppSwitcher");
    v25 = -[SBHomeGestureFinalDestinationSwitcherModifier initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:](v22, "initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:", self, self->_startingEnvironmentMode, self->_continuingGesture, v21, self->_translationAdjustmentForStartingFromSwitcher.x, self->_translationAdjustmentForStartingFromSwitcher.y, v24);
    finalDestinationModifier = self->_finalDestinationModifier;
    self->_finalDestinationModifier = v25;

    -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", self->_finalDestinationModifier, 1, 0);
  }
  -[SBHomeGestureSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
}

uint64_t __57__SBHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "homeScreenAlpha");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456) = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "homeScreenBackdropBlurProgress");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464) = v3;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "homeScreenDimmingAlpha");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472) = v5;
  return result;
}

uint64_t __57__SBHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 40), "homeScreenAlpha");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456) = v2;
  objc_msgSend(*(id *)(a1 + 40), "homeScreenBackdropBlurProgress");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464) = v3;
  result = objc_msgSend(*(id *)(a1 + 40), "homeScreenDimmingAlpha");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472) = v5;
  return result;
}

- (id)_newDockModifierRequiringVerticalSwipeToTrackDock:(BOOL)a3 startingEnvironmentMode:(int64_t)a4
{
  return -[SBHomeGestureDockSwitcherModifier initWithDelegate:startingEnvironmentMode:requireVerticalSwipeToTrackDock:]([SBHomeGestureDockSwitcherModifier alloc], "initWithDelegate:startingEnvironmentMode:requireVerticalSwipeToTrackDock:", self, a4, a3);
}

- (id)handleHomeGestureSettingsChangedEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[SBHomeGestureSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
  v7.receiver = self;
  v7.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBSwitcherModifier handleHomeGestureSettingsChangedEvent:](&v7, sel_handleHomeGestureSettingsChangedEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)handleSwitcherSettingsChangedEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[SBHomeGestureSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
  v7.receiver = self;
  v7.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBSwitcherModifier handleSwitcherSettingsChangedEvent:](&v7, sel_handleSwitcherSettingsChangedEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureSwitcherModifier;
  v4 = a3;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v8, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 >= 2)
    -[SBChainableModifier setState:](self, "setState:", 1);
  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBCompleteGestureSwitcherEventResponse *v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBSwitcherModifier handleRemovalEvent:](&v10, sel_handleRemovalEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phase") == 1)
  {
    objc_msgSend(v4, "appLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBAppLayout isEqual:](self->_selectedAppLayout, "isEqual:", v6))
    {
      v7 = objc_alloc_init(SBCompleteGestureSwitcherEventResponse);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v7, v5);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }

  }
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v12, sel_handleGestureEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v5, "phase"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureSwitcherModifier.m"), 312, CFSTR("Should not be getting PhasePossible"));

      goto LABEL_3;
    case 1:
      -[SBHomeGestureSwitcherModifier _updateForGestureDidBeginWithEvent:](self, "_updateForGestureDidBeginWithEvent:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[SBHomeGestureSwitcherModifier _updateForGestureDidChangeWithEvent:](self, "_updateForGestureDidChangeWithEvent:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[SBHomeGestureSwitcherModifier _updateForGestureDidEndWithEvent:](self, "_updateForGestureDidEndWithEvent:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v9;
      break;
    default:
LABEL_3:
      v8 = 0;
      break;
  }
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_updateForGestureDidBeginWithEvent:(id)a3
{
  id v5;
  SBSwitcherModifierEventResponse *v6;
  double v7;
  double v8;
  double v9;
  CADisplayLink *v10;
  CADisplayLink *displayLink;
  CADisplayLink *v12;
  void *v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;

  v5 = a3;
  if (self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureSwitcherModifier.m"), 329, CFSTR("Can't begin a gesture that has already begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureSwitcherModifier.m"), 330, CFSTR("Can't begin a gesture that has already ended."));

  }
  self->_gestureHasBegun = 1;
  v6 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v7 = CACurrentMediaTime();
  objc_msgSend(v5, "lastTouchTimestamp");
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
  v10 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  displayLink = self->_displayLink;
  self->_displayLink = v10;

  v12 = self->_displayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v12, "addToRunLoop:forMode:", v13, *MEMORY[0x1E0C99860]);

  v14 = self->_startingEnvironmentMode == 2;
  self->_inMultitasking = v14;
  v15 = 0.0;
  if (v14)
    v15 = 1.0;
  self->_stackedProgress = v15;
  -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v5, "locationInContainerView");
  v21 = v20;
  v23 = v22;
  UIRectGetCenter();
  self->_touchOffset.x = v21 - v24;
  self->_touchOffset.y = v23 - v25;
  self->_initialTouchLocation.x = v21;
  self->_initialTouchLocation.y = v23;
  self->_lastTouchLocation.x = v21;
  self->_lastTouchLocation.y = v23;
  if (self->_startingEnvironmentMode == 2)
    self->_initialTouchLocation.y = v19;
  self->_didPlayFlyInHaptic = self->_inMultitasking;
  objc_msgSend(v5, "translationInContainerView");
  v27 = v26;
  objc_msgSend(v5, "hysteresis");
  self->_everTranslatedUpwards = v27 < -v28;
  self->_centroidAdjustment = (CGPoint)*MEMORY[0x1E0C9D538];
  if (self->_scrunchInitiated)
  {
    v29 = v5;
    if (objc_msgSend(v29, "touchType") == 1)
    {
      objc_msgSend(v29, "initialCentroid");
      self->_centroidAdjustment.x = v17 * 0.5 - v30;
      self->_centroidAdjustment.y = v19 * 0.5 - v31;
    }

  }
  -[SBHomeGestureSwitcherModifier _updateGestureTranslationVelocityAndProgressWithEvent:](self, "_updateGestureTranslationVelocityAndProgressWithEvent:", v5);
  -[SBHomeGestureSwitcherModifier _updateShouldResignActiveWithEvent:](self, "_updateShouldResignActiveWithEvent:", v5);
  -[SBHomeGestureSwitcherModifier _updateStackedProgress](self, "_updateStackedProgress");
  -[SBHomeGestureSwitcherModifier _responseForUpdatingLayoutForGestureBegan](self, "_responseForUpdatingLayoutForGestureBegan");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v32);
  -[SBHomeGestureSwitcherModifier _responseForUpdatingIconViewVisibility:](self, "_responseForUpdatingIconViewVisibility:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v33);
  v34 = v7 - v9;
  -[SBHomeGestureSwitcherModifier _responseForStudyLogDidBeginGesture](self, "_responseForStudyLogDidBeginGesture");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v35);
  -[SBHomeGestureSwitcherModifier _responseForSBEventGestureBeganWithTimeDelta:](self, "_responseForSBEventGestureBeganWithTimeDelta:", v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v36);

  return v6;
}

- (id)_updateForGestureDidChangeWithEvent:(id)a3
{
  id v5;
  double v6;
  double v7;
  SBSwitcherModifierEventResponse *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  SBCoplanarSwitcherModifier *coplanarLayoutModifier;
  SBCompleteGestureSwitcherEventResponse *v15;
  _BOOL4 inMultitasking;
  void *v18;
  void *v19;

  v5 = a3;
  if (!self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureSwitcherModifier.m"), 400, CFSTR("Can't update a gesture that has not begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureSwitcherModifier.m"), 401, CFSTR("Can't update a gesture that has already ended."));

  }
  -[SBHomeGestureSwitcherModifier _updateGestureTranslationVelocityAndProgressWithEvent:](self, "_updateGestureTranslationVelocityAndProgressWithEvent:", v5);
  -[SBHomeGestureSwitcherModifier _updateShouldResignActiveWithEvent:](self, "_updateShouldResignActiveWithEvent:", v5);
  -[SBHomeGestureSwitcherModifier _updateStackedProgress](self, "_updateStackedProgress");
  -[SBHomeGestureSwitcherModifier _unadjustedGestureTranslation](self, "_unadjustedGestureTranslation");
  v7 = v6;
  if (-[SBHomeGestureSwitcherModifier _isTranslationPastDistanceThresholdToUnconditionallyGoHome:](self, "_isTranslationPastDistanceThresholdToUnconditionallyGoHome:", v6))
  {
    self->_gestureHoldTimer = 0;
  }
  v8 = objc_alloc_init(SBSwitcherModifierEventResponse);
  objc_msgSend(v5, "locationInContainerView");
  v10 = v9;
  v12 = v11;
  -[SBHomeGestureSwitcherModifier _updateInMultitaskingIfNeededWithEvent:](self, "_updateInMultitaskingIfNeededWithEvent:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    -[SBChainableModifierEventResponse addChildResponse:](v8, "addChildResponse:", v13);
  if ((BSFloatIsZero() & 1) == 0)
    -[SBCoplanarSwitcherModifier setSpacingType:](self->_coplanarLayoutModifier, "setSpacingType:", 0);
  coplanarLayoutModifier = self->_coplanarLayoutModifier;
  -[SBHomeGestureSwitcherModifier _scaleForAdjacentCards](self, "_scaleForAdjacentCards");
  -[SBCoplanarSwitcherModifier setScale:](coplanarLayoutModifier, "setScale:");
  -[SBHomeGestureSwitcherModifier _updateFrameOffsetForXRubberbandingForTranslation:](self, "_updateFrameOffsetForXRubberbandingForTranslation:", self->_translation.x, self->_translation.y);
  self->_lastTouchLocation.x = v10;
  self->_lastTouchLocation.y = v12;
  if (!self->_everTranslatedUpwards)
    self->_everTranslatedUpwards = v7 < 0.0;
  if (self->_startingEnvironmentMode == 1)
  {
    -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v15 = (SBCompleteGestureSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();
    if (-[SBCompleteGestureSwitcherEventResponse count](v15, "count"))
    {
LABEL_17:

      goto LABEL_18;
    }
    inMultitasking = self->_inMultitasking;

    if (inMultitasking)
    {
      self->_cancelledGestureForEmptySwitcher = 1;
      v15 = objc_alloc_init(SBCompleteGestureSwitcherEventResponse);
      -[SBChainableModifierEventResponse addChildResponse:](v8, "addChildResponse:", v15);
      goto LABEL_17;
    }
  }
LABEL_18:

  return v8;
}

- (id)_updateForGestureDidEndWithEvent:(id)a3
{
  id v5;
  CADisplayLink *displayLink;
  CGFloat v7;
  CGFloat v8;
  unint64_t v9;
  __CFString *v10;
  SBSwitcherModifierEventResponse *v11;
  void *v12;
  uint64_t v13;
  SBHapticSwitcherEventResponse *v14;
  SBHapticSwitcherEventResponse *v15;
  int v16;
  char v17;
  UIViewFloatAnimatableProperty *inMultitaskingChangedProperty;
  double v19;
  int64_t startingEnvironmentMode;
  uint64_t v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double a;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  SBInjectVelocitySwitcherEventResponse *v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  SBInjectVelocitySwitcherEventResponse *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  SBInjectVelocitySwitcherEventResponse *v55;
  SBInjectVelocitySwitcherEventResponse *v56;
  void *v57;
  SBActivateHomeButtonSwitcherEventResponse *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  CGAffineTransform v76;
  CATransform3D v77;
  _BYTE buf[24];
  __int128 v79;
  double v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  double v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureSwitcherModifier.m"), 446, CFSTR("Can't end a gesture that has not begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureSwitcherModifier.m"), 447, CFSTR("Can't end a gesture that has already ended."));

  }
  self->_gestureHasEnded = 1;
  -[SBHomeGestureSwitcherModifier _updateGestureTranslationVelocityAndProgressWithEvent:](self, "_updateGestureTranslationVelocityAndProgressWithEvent:", v5);
  -[SBHomeGestureSwitcherModifier _updateShouldResignActiveWithEvent:](self, "_updateShouldResignActiveWithEvent:", v5);
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  self->_gestureLiftOffVelocity = self->_velocity;
  self->_gestureLiftOffTranslation = self->_translation;
  objc_msgSend(v5, "locationInContainerView");
  self->_lastTouchLocation.x = v7;
  self->_lastTouchLocation.y = v8;
  v9 = -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination");
  -[SBHomeGestureFinalDestinationSwitcherModifier finalDestinationReason](self->_finalDestinationModifier, "finalDestinationReason");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(SBSwitcherModifierEventResponse);
  if (v9 == 3 && !self->_didPlayFlyInHaptic)
  {
    -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      self->_didPlayFlyInHaptic = 1;
      v14 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 0, 1);
      -[SBHapticSwitcherEventResponse setHidEventSenderID:](v14, "setHidEventSenderID:", objc_msgSend(v5, "hidEventSenderID"));
      -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v14);

    }
  }
  if (self->_didWarmupFlyInHaptic)
  {
    v15 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 0, 2);
    -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v15);

  }
  v16 = objc_msgSend(v5, "isCanceled");
  v17 = v16;
  if (!v16)
  {
    if (self->_startingEnvironmentMode == 1 && v9 == 4)
    {
      if (!self->_inMultitasking
        || (inMultitaskingChangedProperty = self->_inMultitaskingChangedProperty) != 0
        && (-[UIViewFloatAnimatableProperty presentationValue](inMultitaskingChangedProperty, "presentationValue"),
            v19 <= 0.2))
      {
        v9 = 4;
      }
      else
      {

        v10 = CFSTR("AppSwitcherBecauseStartingFromHomeScreenAndShowingCards");
        v9 = 3;
      }
    }
    v21 = objc_msgSend(v5, "touchType");
    v22 = objc_msgSend(v5, "isPointerTouch");
    if (self->_scrunchInitiated)
      v23 = 1;
    else
      v23 = v22;
    if (v23 != 1 || v21 == 1)
    {
      -[SBHomeGestureSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v9 == 4 && self->_selectedAppLayout && objc_msgSend(v24, "injectGestureVelocityForZoomDown"))
      {
        objc_msgSend(v5, "velocityInContainerView");
        v27 = v26;
        v29 = v28;
        -[SBHomeGestureSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
        v31 = v30;
        -[SBHomeGestureSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHomeGestureSwitcherModifier currentVelocityValueForVisibleAppLayout:key:](self, "currentVelocityValueForVisibleAppLayout:key:", self->_selectedAppLayout, CFSTR("transform"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v33;
        if (v33)
        {
          objc_msgSend(v33, "CATransform3DValue");
          CATransform3DGetAffineTransform(&v76, &v77);
          a = v76.a;
        }
        else
        {
          a = 0.0;
        }
        objc_msgSend(v32, "scaleVelocityPercentOfGestureVelocityYDividedByViewHeight");
        v36 = v29 / v31 * v35;
        v75 = v32;
        if (objc_msgSend(v32, "onlyInjectVelocityForShortFlicks") && fabs(a / v36) >= 0.15)
        {
          v57 = 0;
        }
        else
        {
          v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
          v37 = fabs(v36);
          objc_msgSend(v32, "maximumScaleVelocity");
          if (v37 > v38)
            v37 = v38;
          v39 = MEMORY[0x1E0CD2610];
          if (v36 >= 0.0)
            v40 = *(double *)(MEMORY[0x1E0CD2610] + 120);
          else
            v40 = NAN;
          v41 = [SBInjectVelocitySwitcherEventResponse alloc];
          *(_OWORD *)&buf[8] = *(_OWORD *)(v39 + 8);
          v79 = *(_OWORD *)(v39 + 24);
          *(double *)buf = v37;
          v80 = v37;
          v42 = *(_OWORD *)(v39 + 96);
          v83 = *(_OWORD *)(v39 + 80);
          v84 = v42;
          v85 = *(_QWORD *)(v39 + 112);
          v43 = *(_OWORD *)(v39 + 64);
          v81 = *(_OWORD *)(v39 + 48);
          v82 = v43;
          v86 = v40;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", buf);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -[SBInjectVelocitySwitcherEventResponse initWithVelocity:forKey:appLayout:](v41, "initWithVelocity:forKey:appLayout:", v44, CFSTR("transform"), self->_selectedAppLayout);
          objc_msgSend(v74, "addObject:", v45);

          -[SBHomeGestureSwitcherModifier currentVelocityValueForVisibleAppLayout:key:](self, "currentVelocityValueForVisibleAppLayout:key:", self->_selectedAppLayout, CFSTR("position"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v46;
          if (v46)
          {
            objc_msgSend(v46, "CGPointValue", v46);
          }
          else
          {
            v47 = *MEMORY[0x1E0C9D538];
            v48 = *(double *)(MEMORY[0x1E0C9D538] + 8);
          }
          v49 = fabs(v47);
          if (fabs(v27) < v49)
            v27 = v47;
          if (fabs(v27) >= v49)
            v50 = v29;
          else
            v50 = v48;
          objc_msgSend(v75, "positionVelocityXPercentOfGestureVelocityX", v70);
          v52 = v51 * v27;
          objc_msgSend(v75, "positionVelocityYPercentOfGestureVelocityY");
          v54 = v53 * v50;
          v55 = [SBInjectVelocitySwitcherEventResponse alloc];
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v52, v54);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = -[SBInjectVelocitySwitcherEventResponse initWithVelocity:forKey:appLayout:](v55, "initWithVelocity:forKey:appLayout:", v72, CFSTR("position"), self->_selectedAppLayout);
          v57 = v74;
          objc_msgSend(v74, "addObject:", v56);

        }
        if (objc_msgSend(v57, "count"))
          -[SBChainableModifierEventResponse addChildResponses:](v11, "addChildResponses:", v57);

      }
    }
    if (self->_startingEnvironmentMode != 1 || -[SBAppLayout type](self->_selectedAppLayout, "type") == 2 || v9 != 4)
      goto LABEL_64;
    v58 = objc_alloc_init(SBActivateHomeButtonSwitcherEventResponse);
    -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v58);

LABEL_63:
    v9 = 4;
    goto LABEL_64;
  }
  if (self->_cancelledGestureForEmptySwitcher)
  {

    v10 = CFSTR("CancelledGestureForEmptySwitcher");
LABEL_14:
    v9 = 3;
    goto LABEL_64;
  }
  startingEnvironmentMode = self->_startingEnvironmentMode;
  if (startingEnvironmentMode == 1)
  {

    v10 = CFSTR("CancelledGestureAndStayingHome");
    goto LABEL_63;
  }
  if (startingEnvironmentMode == 2)
  {

    v10 = CFSTR("CancelledGestureAndStayingInSwitcher");
    goto LABEL_14;
  }

  v9 = 0;
  v10 = CFSTR("CancelledGestureAndStayingInApplication");
LABEL_64:
  SBLogSystemGestureAppSwitcher();
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    NSStringFromSBHomeGestureFinalDestination(v9);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v60;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&v79 = v10;
    _os_log_impl(&dword_1D0540000, v59, OS_LOG_TYPE_INFO, "Home Gesture Modifier - Final Response: %@ (%lu), Reason: %@", buf, 0x20u);

  }
  -[SBHomeGestureSwitcherModifier _responseForUpdatingIconViewVisibility:](self, "_responseForUpdatingIconViewVisibility:", 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
    -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v61);
  -[SBHomeGestureSwitcherModifier _responseForActivatingFinalDestination:](self, "_responseForActivatingFinalDestination:", v9);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v62);
  if ((v17 & 1) == 0)
  {
    -[SBHomeGestureSwitcherModifier _responseForActivatingReachabilityIfNeededWithFinalDestination:](self, "_responseForActivatingReachabilityIfNeededWithFinalDestination:", v9);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
      -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v63);

    -[SBHomeGestureSwitcherModifier _responseForCancelingSystemGesturesIfNeededWithFinalDestination:](self, "_responseForCancelingSystemGesturesIfNeededWithFinalDestination:", v9);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
      -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v64);

  }
  -[SBHomeGestureSwitcherModifier _responseForStudyLogDidEndGestureWithEvent:finalDestination:destinationReason:](self, "_responseForStudyLogDidEndGestureWithEvent:finalDestination:destinationReason:", v5, v9, v10);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
    -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v65);
  -[SBHomeGestureSwitcherModifier _responseForSBEventGestureEndWithEvent:finalDestination:](self, "_responseForSBEventGestureEndWithEvent:finalDestination:", v5, v9);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
    -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v66);

  return v11;
}

- (void)_updateFrameOffsetForXRubberbandingForTranslation:(CGPoint)a3
{
  double v3;
  double v4;

  if (self->_inMultitasking || self->_hasTriggeredCardFlyIn)
  {
    v3 = a3.x - self->_translationXLostToRubberbanding;
  }
  else
  {
    v3 = a3.x
       - self->_lastTranslationXForRubberbanding
       + -(a3.x - self->_lastTranslationXForRubberbanding - (a3.x - self->_lastTranslationXForRubberbanding) * 0.3)
       * fmin(fmax(-self->_velocity.y, 0.0), 6000.0)
       / 6000.0
       + self->_lastFrameOffsetX;
    self->_lastTranslationXForRubberbanding = a3.x;
  }
  v4 = v3 + 0.0;
  self->_lastFrameOffsetX = v4;
  self->_translationXLostToRubberbanding = a3.x - v4;
}

- (void)_updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:(id)a3
{
  id v4;
  double x;
  double v6;
  double v7;
  double v8;
  id *v9;
  uint64_t v10;
  double v11;
  BOOL v12;
  double v13;
  BOOL v14;
  BOOL v15;
  id v16;

  v4 = a3;
  if (!self->_inMultitasking && self->_startingEnvironmentMode == 1)
  {
    x = self->_lastTouchLocation.x;
    v16 = v4;
    objc_msgSend(v4, "locationInContainerView");
    v7 = v6;
    v8 = v6 - x;
    v9 = (id *)MEMORY[0x1E0CEB258];
    v10 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v11 = -v8;
    v12 = v10 == 1;
    v4 = v16;
    if (!v12)
      v11 = v8;
    if (v11 < 0.0)
    {
      v13 = self->_initialTouchLocation.x - self->_translationAdjustmentForStartingFromHomeScreen.x;
      v12 = objc_msgSend(*v9, "userInterfaceLayoutDirection") == 1;
      v4 = v16;
      v14 = !v12 || v7 <= v13;
      if (!v14
        || ((v12 = objc_msgSend(*v9, "userInterfaceLayoutDirection") == 1, v4 = v16, !v12)
          ? (v15 = v7 < v13)
          : (v15 = 0),
            v15))
      {
        self->_translationAdjustmentForStartingFromHomeScreen.x = self->_translationAdjustmentForStartingFromHomeScreen.x
                                                                - v8;
      }
    }
  }

}

- (CGPoint)_unadjustedGestureTranslation
{
  double x;
  double y;
  SBHomeGestureDockSwitcherModifier *dockModifier;
  CGPoint result;

  x = self->_translation.x;
  y = self->_translation.y;
  dockModifier = self->_dockModifier;
  if (dockModifier)
    -[SBHomeGestureDockSwitcherModifier translationForAdjustedTranslation:](dockModifier, "translationForAdjustedTranslation:", x, y);
  result.y = y;
  result.x = x;
  return result;
}

- (void)_updateGestureTranslationVelocityAndProgressWithEvent:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBHomeGestureDockSwitcherModifier *dockModifier;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  CGPoint *p_translationWithoutScale;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  id v33;

  v33 = a3;
  objc_msgSend(v33, "translationInContainerView");
  v5 = v4;
  v7 = v6;
  -[SBHomeGestureSwitcherModifier _updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:](self, "_updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:", v33);
  v8 = self->_translationAdjustmentForStartingFromSwitcher.y + self->_translationAdjustmentForStartingFromHomeScreen.y;
  v9 = v5
     + self->_translationAdjustmentForStartingFromSwitcher.x
     + self->_translationAdjustmentForStartingFromHomeScreen.x;
  v10 = v7 + v8;
  dockModifier = self->_dockModifier;
  if (dockModifier)
  {
    -[SBHomeGestureDockSwitcherModifier adjustedTranslationForTranslation:](dockModifier, "adjustedTranslationForTranslation:", v9, v7 + v8);
    v9 = v12;
    v10 = v13;
  }
  objc_msgSend(v33, "averageTouchVelocityOverTimeDuration:", 0.0416666667);
  v15 = v14;
  v17 = v16;
  -[SBHomeGestureSwitcherModifier _distanceYToInSwitcherCardScale](self, "_distanceYToInSwitcherCardScale");
  v19 = -v10 / v18;
  -[SBHomeGestureSwitcherModifier _gestureProgressToMaxTranslationForTranslation:](self, "_gestureProgressToMaxTranslationForTranslation:", v10);
  self->_translation.x = v9;
  self->_translation.y = v10;
  self->_velocity.x = v15;
  self->_velocity.y = v17;
  self->_progressToInSwitcherCardScale = v19;
  self->_progressToMaxTranslation = v20;
  objc_msgSend(v33, "lastTouchTimestamp");
  self->_lastTouchTimestamp = v21;
  if (self->_scrunchInitiated)
  {
    v22 = v33;
    objc_msgSend(v22, "initialCentroid");
    self->_initialCentroid.x = v23;
    self->_initialCentroid.y = v24;
    objc_msgSend(v22, "centroid");
    self->_centroid.x = v25;
    self->_centroid.y = v26;
    self->_initialCentroid = (CGPoint)vaddq_f64((float64x2_t)self->_initialCentroid, (float64x2_t)self->_centroidAdjustment);
    self->_centroid = (CGPoint)vaddq_f64((float64x2_t)self->_centroid, (float64x2_t)self->_centroidAdjustment);
    objc_msgSend(v22, "absoluteScale");
    self->_absoluteScale = v27;
    p_translationWithoutScale = &self->_translationWithoutScale;
    objc_msgSend(v22, "translationWithoutScale");
    v30 = v29;
    v32 = v31;

    p_translationWithoutScale->x = v30;
    p_translationWithoutScale->y = v32;
  }

}

- (void)_updateStackedProgress
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (self->_startingEnvironmentMode == 2)
  {
    v3 = BSFloatLessThanOrEqualToFloat();
    v4 = self->_progressToInSwitcherCardScale + -1.0;
    if (v3)
      v4 = -v4;
    v5 = v4 / -0.75 + 1.0;
    v6 = fabs(self->_translation.x) * (0.0 - v5);
    -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v8 = fmin(fmax(v5 + v6 / (v7 * 0.25), 0.0), 1.0);
    if (self->_inMultitasking)
      v9 = v8;
    else
      v9 = 0.0;
    if (BSFloatIsZero() && !self->_hasBecomeCoplanarSinceGestureFromSwitcherBegan)
    {
      self->_hasBecomeCoplanarSinceGestureFromSwitcherBegan = 1;
      self->_hasTriggeredCardFlyIn = 1;
      self->_translationYWhenTriggeredCardFlyIn = self->_translation.y;
    }
    if (self->_hasBecomeCoplanarSinceGestureFromSwitcherBegan)
      v10 = 0.0;
    else
      v10 = v9;
    self->_stackedProgress = v10;
  }
}

- (int64_t)currentFinalDestination
{
  return -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination");
}

- (double)unconditionalDistanceThresholdForHome
{
  double result;
  _BOOL4 scrunchInitiated;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (self->_startingEnvironmentMode == 1)
    return 1.79769313e308;
  scrunchInitiated = self->_scrunchInitiated;
  if (self->_scrunchInitiated)
    v5 = 0.4;
  else
    v5 = *(double *)&kHomeGestureNormalizedDistanceYThresholdForUnconditionalHome;
  v6 = kHomeGestureNormalizedDistanceYThresholdRangeForUnconditionalHome;
  -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  result = v5 * v7;
  if (self->_hasTriggeredCardFlyIn)
  {
    v8 = 0.1;
    if (!scrunchInitiated)
      v8 = *(double *)&v6;
    v9 = result - v8 * v7;
    result = result + v8 * v7;
    v10 = 100.0 - self->_translationYWhenTriggeredCardFlyIn;
    if (v9 >= v10)
      v10 = v9;
    if (result > v10)
      result = v10;
    if (!self->_inMultitasking)
      return result + -50.0;
  }
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  __int128 v5;
  SBCoplanarSwitcherModifier *coplanarLayoutModifier;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat *p_x;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  _QWORD v29[7];
  uint64_t v30;
  CGRect *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  CGRect v36;
  CGRect result;

  v30 = 0;
  v31 = (CGRect *)&v30;
  v32 = 0x4010000000;
  v33 = &unk_1D0FA064E;
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v34 = *MEMORY[0x1E0C9D648];
  v35 = v5;
  coplanarLayoutModifier = self->_coplanarLayoutModifier;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __47__SBHomeGestureSwitcherModifier_frameForIndex___block_invoke;
  v29[3] = &unk_1E8E9FD08;
  v29[4] = self;
  v29[5] = &v30;
  v29[6] = a3;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", coplanarLayoutModifier, v29);
  v28.receiver = self;
  v28.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBHomeGestureSwitcherModifier frameForIndex:](&v28, sel_frameForIndex_, a3);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v31[1].origin.y = v9;
  if (BSFloatGreaterThanOrEqualToFloat())
    v31[1].origin.x = v31[1].origin.x + self->_stackedProgress * (v8 - v31[1].origin.x);
  if (-[SBHomeGestureSwitcherModifier _isSelectedAppLayoutAtIndex:](self, "_isSelectedAppLayoutAtIndex:", a3))
  {
    -[SBHomeGestureSwitcherModifier _frameOffsetForTranslation:](self, "_frameOffsetForTranslation:", self->_translation.x, self->_translation.y);
LABEL_8:
    v17 = v15;
    v18 = v16;
    goto LABEL_10;
  }
  v17 = *MEMORY[0x1E0C9D538];
  v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (!self->_laysOutNeighboringCards)
  {
    p_x = &v31->origin.x;
    v31[1].origin.x = v8;
    p_x[5] = v10;
    *((_QWORD *)p_x + 6) = v12;
    *((_QWORD *)p_x + 7) = v14;
    goto LABEL_10;
  }
  if (!-[SBHomeGestureSwitcherModifier _shouldPositionAdjacentCardsOffscreenForFlyIn](self, "_shouldPositionAdjacentCardsOffscreenForFlyIn"))
  {
    -[SBHomeGestureSwitcherModifier _rubberbandedTranslationForAdjacentCards](self, "_rubberbandedTranslationForAdjacentCards");
    -[SBHomeGestureSwitcherModifier _frameOffsetForTranslation:](self, "_frameOffsetForTranslation:");
    goto LABEL_8;
  }
LABEL_10:
  v36 = CGRectOffset(v31[1], v17, v18);
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  v31[1] = v36;
  _Block_object_dispose(&v30, 8);
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

uint64_t __47__SBHomeGestureSwitcherModifier_frameForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 496), "frameForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;
  objc_super v11;

  if (-[SBHomeGestureSwitcherModifier _isSelectedAppLayoutAtIndex:](self, "_isSelectedAppLayoutAtIndex:"))
  {
    -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
    v6 = v5;
    if ((BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
      return v6;
    goto LABEL_9;
  }
  if (self->_laysOutNeighboringCards)
  {
    -[SBHomeGestureSwitcherModifier _scaleForAdjacentCards](self, "_scaleForAdjacentCards");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBHomeGestureSwitcherModifier;
    -[SBHomeGestureSwitcherModifier scaleForIndex:](&v11, sel_scaleForIndex_, a3);
  }
  v6 = v7;
  if ((BSFloatGreaterThanOrEqualToFloat() & 1) != 0 && self->_laysOutNeighboringCards)
  {
LABEL_9:
    v10.receiver = self;
    v10.super_class = (Class)SBHomeGestureSwitcherModifier;
    -[SBHomeGestureSwitcherModifier scaleForIndex:](&v10, sel_scaleForIndex_, a3);
    -[SBHomeGestureSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
    BSFloatByLinearlyInterpolatingFloats();
    return v8;
  }
  return v6;
}

- (id)visibleAppLayouts
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  double v39;
  CGAffineTransform v40;
  objc_super v41;
  CGRect v42;

  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInSetupMode");

  if (v4)
  {
    if (self->_selectedAppLayout)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", 0);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41.receiver = self;
    v41.super_class = (Class)SBHomeGestureSwitcherModifier;
    -[SBHomeGestureSwitcherModifier visibleAppLayouts](&v41, sel_visibleAppLayouts);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if (self->_selectedAppLayout)
      objc_msgSend(v6, "addObject:");
    v7 = -[SBHomeGestureSwitcherModifier _selectedAppLayoutIndex](self, "_selectedAppLayoutIndex");
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = v7;
    -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((!-[SBHomeGestureDockSwitcherModifier isCurrentlyTrackingDock](self->_dockModifier, "isCurrentlyTrackingDock")
       || self->_shouldResignActive
       || self->_hasTriggeredCardFlyIn
       || self->_startingEnvironmentMode == 2)
      && objc_msgSend(v9, "count"))
    {
      if (self->_hasTriggeredCardFlyIn || (v10 = self->_startingEnvironmentMode != 1, (BSFloatIsZero() & 1) == 0))
      {
        -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
        v13 = v12;
        v39 = v12;
        -[SBHomeGestureSwitcherModifier _rubberbandedTranslationForAdjacentCards](self, "_rubberbandedTranslationForAdjacentCards");
        -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:");
        v15 = v14;
        -[SBHomeGestureSwitcherModifier _coplanarSpacing](self, "_coplanarSpacing");
        v17 = v15 * v16;
        v18 = v15 * v16 + v13 * v15;
        -[SBHomeGestureSwitcherModifier frameForIndex:](self, "frameForIndex:", v8);
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;
        UIRectGetCenter();
        -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
        CGAffineTransformMakeScale(&v40, v27, v27);
        v42.origin.x = v20;
        v42.origin.y = v22;
        v42.size.width = v24;
        v42.size.height = v26;
        CGRectApplyAffineTransform(v42, &v40);
        SBUnintegralizedRectCenteredAboutPoint();
        v29 = v28 - v17;
        v31 = v39 - (v28 + v30) - v17;
        if (-[SBHomeGestureSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
          v32 = v31;
        else
          v32 = v29;
        v10 = vcvtpd_s64_f64(v32 / v18);
        if (-[SBHomeGestureSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
          v33 = v29;
        else
          v33 = v31;
        v11 = vcvtpd_s64_f64(v33 / v18);
        if (v11 <= 1)
          v11 = 1;
        if (v10 <= 1)
          v10 = 1;
      }
      else
      {
        v11 = 1;
      }
      v34 = (v8 - v11) & ~((uint64_t)(v8 - v11) >> 63);
      v35 = v10 + v8;
      v36 = objc_msgSend(v9, "count");
      if (v35 >= v36 - 1)
        v35 = v36 - 1;
      if (v34 < objc_msgSend(v9, "count") && (v35 & 0x8000000000000000) == 0)
      {
        objc_msgSend(v9, "subarrayWithRange:", v34, v35 - v34 + 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v37);

      }
    }

  }
  return v6;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v11, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "switcherLayoutElementType"))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v5, "layoutSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeGestureSwitcherModifier _layoutSettingsForAppLayout:layoutSettings:](self, "_layoutSettingsForAppLayout:layoutSettings:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutSettings:", v8);

    -[SBHomeGestureSwitcherModifier _cornerRadiusSettings](self, "_cornerRadiusSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadiusSettings:", v9);

    v5 = v6;
  }

  return v5;
}

- (id)_cornerRadiusSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appToSwitcherCornerRadiusSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_layoutSettingsForAppLayout:(id)a3 layoutSettings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CAFrameRateRange v25;
  CAFrameRateRange v26;

  v6 = a4;
  if (-[SBAppLayout isEqual:](self->_selectedAppLayout, "isEqual:", a3))
    goto LABEL_20;
  if (self->_inMultitaskingChangedProperty)
  {
    -[SBHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "animationSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cardFlyInSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0DA9E08]);
    objc_msgSend(v9, "setDefaultValues");
    if (self->_inMultitasking)
    {
      -[UIViewFloatAnimatableProperty presentationValue](self->_inMultitaskingChangedProperty, "presentationValue");
      v13 = v12;
      v14 = fabs(self->_translation.x);
      -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v16 = fmax(v14 / v15 + 0.0, 0.0);
      if (v16 >= 1.0)
        v17 = 0.0;
      else
        v17 = 1.0 - v16;
      v18 = fmin(fmax(1.0 - (1.0 - v13) * v17, 0.0), 1.0);
    }
    else
    {
      v18 = 0.0;
    }
    objc_msgSend(v6, "trackingResponse");
    v20 = v19;
    objc_msgSend(v7, "response");
    v22 = v18 * (v20 - v21);
    objc_msgSend(v7, "response");
    objc_msgSend(v9, "setTrackingResponse:", v23 + v22);
    objc_msgSend(v6, "dampingRatio");
    objc_msgSend(v9, "setTrackingDampingRatio:");
    v26 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v26.minimum, *(double *)&v26.maximum, *(double *)&v26.preferred);
    goto LABEL_16;
  }
  if (self->_inMultitasking)
  {
LABEL_20:
    if (self->_startingEnvironmentMode == 2 && BSFloatGreaterThanFloat())
    {
      -[SBHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "animationSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stackedSwitcherTrackingSettings");
      v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
      goto LABEL_17;
    }
    v9 = v6;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DA9E08]);
    objc_msgSend(v9, "setDefaultValues");
    objc_msgSend(v9, "setTrackingResponse:", 0.0);
    v25 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v25.minimum, *(double *)&v25.maximum, *(double *)&v25.preferred);
  }
LABEL_17:

  return v9;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isOrContainsAppLayout:", self->_selectedAppLayout) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBHomeGestureSwitcherModifier;
    v7 = -[SBHomeGestureSwitcherModifier shouldPinLayoutRolesToSpace:](&v9, sel_shouldPinLayoutRolesToSpace_, a3);
  }

  return v7;
}

- (CGPoint)_frameOffsetForTranslation:(CGPoint)a3
{
  double y;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double x;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v29;
  double v30;
  double v31;
  double progressToInSwitcherCardScale;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGPoint result;

  y = a3.y;
  v5 = (double *)MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (self->_startingEnvironmentMode == 1)
  {
    if (+[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported", a3.x))
    {
      -[SBHomeGestureSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
      v6 = v7 * -0.5;
      if (self->_scrunchInitiated)
      {
        v8 = (v6 * 0.25 - v6) * self->_centroid.y;
        -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
        v6 = v6 + v8 / v9;
      }
    }
  }
  v10 = *v5;
  if (self->_scrunchInitiated)
  {
    if (self->_startingEnvironmentMode != 1)
    {
      -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v12 = v11;
      x = self->_initialCentroid.x;
      v14 = self->_centroid.x;
      v15 = x - v14;
      v17 = (self->_initialCentroid.y - self->_centroid.y) * (vabdd_f64(x, v14) / (v16 * -0.8) + 1.0);
      v18 = v6 - v17;
      UIRectGetCenter();
      v20 = v19;
      v22 = v21;
      -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", v15, v17);
      v24 = v23;
      v10 = v10 - (v20 - self->_initialCentroid.x) * (1.0 - v23);
      v6 = v18 - (v22 - self->_initialCentroid.y) * (1.0 - v23);
      v25 = v12 * ((1.0 - v23) * 0.5);
      -[SBHomeGestureSwitcherModifier _centerYOffsetDuringGesture](self, "_centerYOffsetDuringGesture");
      v27 = v24 / 0.4 * v26;
      if (v6 > v25 || v6 < v27)
      {
        BSUIConstrainValueToIntervalWithRubberBand();
        v6 = v29;
      }
    }
  }
  else
  {
    -[SBHomeGestureSwitcherModifier _gestureProgressToMaxTranslationForTranslation:](self, "_gestureProgressToMaxTranslationForTranslation:", y);
    v31 = v30;
    if (self->_startingEnvironmentMode == 2 && v30 < 0.0)
    {
      progressToInSwitcherCardScale = self->_progressToInSwitcherCardScale;
      -[SBHomeGestureSwitcherModifier _inSwitcherCenterYOffsetWhenPresented](self, "_inSwitcherCenterYOffsetWhenPresented");
      v34 = progressToInSwitcherCardScale * (0.0 - v33);
      -[SBHomeGestureSwitcherModifier _inSwitcherCenterYOffsetWhenPresented](self, "_inSwitcherCenterYOffsetWhenPresented");
      v6 = v6 - (v35 + v34);
    }
    else
    {
      -[SBHomeGestureSwitcherModifier _centerYOffsetDuringGesture](self, "_centerYOffsetDuringGesture");
      v6 = v6 + v31 * v36 + 0.0;
    }
    if (self->_startingEnvironmentMode != 1)
    {
      -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
      v38 = v37;
      -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v40 = v39;
      v41 = 1.0;
      if (self->_startingEnvironmentMode == 2)
        -[SBHomeGestureSwitcherModifier _switcherCardScale](self, "_switcherCardScale", 1.0);
      v10 = v10 + (v40 * v41 - v40 * v38) * 0.5 * (self->_touchOffset.x / (v40 * 0.5));
    }
  }
  v42 = v10 + self->_lastFrameOffsetX;
  v43 = v6;
  result.y = v43;
  result.x = v42;
  return result;
}

- (double)_scaleForTranslation:(CGPoint)a3
{
  double x;
  double y;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t startingEnvironmentMode;
  double v13;
  double v14;
  int64_t v15;
  double progressToInSwitcherCardScale;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;

  if (self->_scrunchInitiated)
  {
    x = self->_translationWithoutScale.x;
    y = self->_translationWithoutScale.y;
    -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds", a3.x, a3.y);
    v8 = self->_initialCentroid.y;
    if (v8 < v7 * 0.5)
      v8 = v7 * 0.5;
    v9 = (fabs(x) / (v6 * -0.8) + 1.0) * (y * (v7 / v8));
  }
  else
  {
    v9 = a3.y;
  }
  -[SBHomeGestureSwitcherModifier _gestureProgressToMaxTranslationForTranslation:](self, "_gestureProgressToMaxTranslationForTranslation:", v9);
  v11 = v10;
  startingEnvironmentMode = self->_startingEnvironmentMode;
  if (startingEnvironmentMode == 1)
  {
    -[SBHomeGestureSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
    v14 = v13;
  }
  else
  {
    v14 = 0.4;
  }
  v15 = self->_startingEnvironmentMode;
  if (v15 == 2 && v11 < 0.0)
  {
    progressToInSwitcherCardScale = self->_progressToInSwitcherCardScale;
    -[SBHomeGestureSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
    v18 = progressToInSwitcherCardScale * (v17 + -1.0) + 1.0;
  }
  else
  {
    v19 = 1.0;
    if (v15 == 2)
      -[SBHomeGestureSwitcherModifier _switcherCardScale](self, "_switcherCardScale", 1.0);
    v20 = v19 + v11 * (0.0 - v19);
    if (v20 >= 0.0)
      v18 = v20;
    else
      v18 = 0.0;
  }
  if (self->_scrunchInitiated)
    v18 = v18 * self->_absoluteScale;
  if (v18 >= v14)
  {
    if (v18 > 1.0)
    {
      BSUIConstrainValueWithRubberBand();
      v18 = v22 + 1.0;
    }
  }
  else
  {
    BSUIConstrainValueWithRubberBand();
    v18 = v14 - v21;
  }
  if (startingEnvironmentMode == 1)
  {
    if (+[SBFloatingDockController isFloatingDockSupported](SBFloatingDockController, "isFloatingDockSupported"))
    {
      -[SBHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "offscreenCardScaleForFlyIn");

    }
    BSUIConstrainValueToIntervalWithRubberBand();
    return v24;
  }
  return v18;
}

- (double)_scaleForAdjacentCards
{
  double result;

  if (-[SBHomeGestureSwitcherModifier _shouldPositionAdjacentCardsOffscreenForFlyIn](self, "_shouldPositionAdjacentCardsOffscreenForFlyIn"))
  {
    -[SBHomeGestureSwitcherModifier _scaleForOffscreenAdjacentCardsForFlyIn](self, "_scaleForOffscreenAdjacentCardsForFlyIn");
  }
  else
  {
    -[SBHomeGestureSwitcherModifier _rubberbandedTranslationForAdjacentCards](self, "_rubberbandedTranslationForAdjacentCards");
    -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:");
  }
  return result;
}

- (double)_scaleForOffscreenAdjacentCardsForFlyIn
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SBHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "offscreenCardScaleForFlyIn");
  v5 = v4;
  -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
  v7 = v6;

  if (v5 >= v7)
    return v5;
  else
    return v7;
}

- (CGPoint)_rubberbandedTranslationForAdjacentCards
{
  double x;
  double y;
  double v5;
  double translationYWhenTriggeredCardFlyIn;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  x = self->_translation.x;
  y = self->_translation.y;
  if (self->_startingEnvironmentMode != 1)
  {
    -[SBHomeGestureSwitcherModifier unconditionalDistanceThresholdForHome](self, "unconditionalDistanceThresholdForHome");
    translationYWhenTriggeredCardFlyIn = self->_translationYWhenTriggeredCardFlyIn;
    if (translationYWhenTriggeredCardFlyIn > 100.0 - v5)
      translationYWhenTriggeredCardFlyIn = 100.0 - v5;
    v7 = y;
    if (y < translationYWhenTriggeredCardFlyIn)
      v7 = translationYWhenTriggeredCardFlyIn
         + (1.0
          - ((translationYWhenTriggeredCardFlyIn - y) / (v5 + translationYWhenTriggeredCardFlyIn) * 2.0 + -1.0)
          * ((translationYWhenTriggeredCardFlyIn - y) / (v5 + translationYWhenTriggeredCardFlyIn) * 2.0 + -1.0))
         * -0.25
         * (v5 + translationYWhenTriggeredCardFlyIn);
    -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    y = v7 + (y - v7) * fmin(fmax(fabs(x) / (v8 * 0.25) + 0.0, 0.0), 1.0);
  }
  v9 = x;
  v10 = y;
  result.y = v10;
  result.x = v9;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBHomeGestureSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v8, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, a4);
  v6 = v5;
  if (BSFloatIsZero())
    return v6 * self->_stackedProgress + 0.0;
  return v6;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  double stackedProgress;
  double v4;
  objc_super v6;

  stackedProgress = self->_stackedProgress;
  v6.receiver = self;
  v6.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBHomeGestureSwitcherModifier wallpaperOverlayAlphaForIndex:](&v6, sel_wallpaperOverlayAlphaForIndex_, a3);
  return stackedProgress * v4 + 0.0;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  double stackedProgress;
  double v4;
  objc_super v6;

  stackedProgress = self->_stackedProgress;
  v6.receiver = self;
  v6.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBHomeGestureSwitcherModifier lighteningAlphaForIndex:](&v6, sel_lighteningAlphaForIndex_, a3);
  return stackedProgress * v4 + 0.0;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  objc_super v4;

  if (self->_laysOutNeighboringCards)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBHomeGestureSwitcherModifier;
  return -[SBHomeGestureSwitcherModifier headerStyleForIndex:](&v4, sel_headerStyleForIndex_, a3);
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  double result;
  objc_super v4;

  result = 0.0;
  if (!self->_laysOutNeighboringCards)
  {
    v4.receiver = self;
    v4.super_class = (Class)SBHomeGestureSwitcherModifier;
    -[SBHomeGestureSwitcherModifier titleAndIconOpacityForIndex:](&v4, sel_titleAndIconOpacityForIndex_, a3, 0.0);
  }
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double result;
  objc_super v5;

  result = 1.0;
  if (!self->_inMultitasking)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBHomeGestureSwitcherModifier;
    -[SBHomeGestureSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v5, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4, 1.0);
  }
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v3;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  SBSwitcherModifier *multitaskingModifier;
  int v16;
  char v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _QWORD v35[7];
  uint64_t v36;
  double *v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v40;
  UIRectCornerRadii result;

  -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqual:", self->_selectedAppLayout) & 1) != 0 || self->_laysOutNeighboringCards)
  {
    v36 = 0;
    v37 = (double *)&v36;
    v38 = 0x2020000000;
    v39 = 0;
    -[SBHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeGestureSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
    v10 = v9;
    objc_msgSend(v8, "deckSwitcherPageScale");
    v12 = v11;
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2)
        v13 = 15.0;
      else
        v13 = 5.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "userInterfaceIdiom") == 1)
        v13 = 15.0;
      else
        v13 = 5.0;

    }
    if (!BSFloatIsZero())
      v13 = v10 * v12;
    if (self->_startingEnvironmentMode == 1)
    {
      multitaskingModifier = self->_multitaskingModifier;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __53__SBHomeGestureSwitcherModifier_cornerRadiiForIndex___block_invoke;
      v35[3] = &unk_1E8EA6DB0;
      v35[4] = &v36;
      *(double *)&v35[5] = v13;
      *(double *)&v35[6] = v12;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", multitaskingModifier, v35);
LABEL_29:
      SBRectCornerRadiiForRadius();
      v20 = v27;
      v22 = v28;
      v24 = v29;
      v26 = v30;

      _Block_object_dispose(&v36, 8);
      goto LABEL_30;
    }
    v16 = __sb__runningInSpringBoard();
    v17 = v16;
    if (v16)
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_28;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "userInterfaceIdiom") != 1)
        goto LABEL_27;
    }
    -[SBHomeGestureSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
    if (BSFloatIsZero() && objc_msgSend(v8, "shouldRoundCornersDuringSwipeUp"))
    {
      v18 = -[SBHomeGestureSwitcherModifier isContentStatusBarVisibleForIndex:](self, "isContentStatusBarVisibleForIndex:", a3);
      if ((v17 & 1) == 0)

      if (!v18)
      {
        v37[3] = v13;
        goto LABEL_29;
      }
LABEL_28:
      v37[3] = v10;
      goto LABEL_29;
    }
    if ((v17 & 1) != 0)
      goto LABEL_28;
LABEL_27:

    goto LABEL_28;
  }
  v40.receiver = self;
  v40.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBHomeGestureSwitcherModifier cornerRadiiForIndex:](&v40, sel_cornerRadiiForIndex_, a3);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
LABEL_30:

  v31 = v20;
  v32 = v22;
  v33 = v24;
  v34 = v26;
  result.topRight = v34;
  result.bottomRight = v33;
  result.bottomLeft = v32;
  result.topLeft = v31;
  return result;
}

double __53__SBHomeGestureSwitcherModifier_cornerRadiiForIndex___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40) / *(double *)(a1 + 48);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (double)homeScreenAlpha
{
  double result;
  double progressToMaxTranslation;
  double toHomeScreenAlpha;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  if (self->_startingEnvironmentMode == 1)
  {
    if (!self->_inMultitasking)
    {
      v11.receiver = self;
      v11.super_class = (Class)SBHomeGestureSwitcherModifier;
      -[SBHomeGestureSwitcherModifier homeScreenAlpha](&v11, sel_homeScreenAlpha);
      return result;
    }
  }
  else if (!-[SBHomeGestureSwitcherModifier homeScreenHasOpenFolder](self, "homeScreenHasOpenFolder")
         || -[SBHomeGestureSwitcherModifier homeScreenBackdropBlurType](self, "homeScreenBackdropBlurType") == 3)
  {
    progressToMaxTranslation = self->_progressToMaxTranslation;
    toHomeScreenAlpha = self->_toHomeScreenAlpha;
    v10.receiver = self;
    v10.super_class = (Class)SBHomeGestureSwitcherModifier;
    -[SBHomeGestureSwitcherModifier homeScreenAlpha](&v10, sel_homeScreenAlpha);
    v7 = progressToMaxTranslation * (toHomeScreenAlpha - v6);
    v9.receiver = self;
    v9.super_class = (Class)SBHomeGestureSwitcherModifier;
    -[SBHomeGestureSwitcherModifier homeScreenAlpha](&v9, sel_homeScreenAlpha);
    return v7 + v8;
  }
  return self->_toHomeScreenAlpha;
}

- (double)homeScreenScale
{
  double v3;
  double y;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBHomeGestureSwitcherModifier homeScreenScale](&v9, sel_homeScreenScale);
  if (self->_startingEnvironmentMode == 1)
  {
    y = self->_translation.y;
    -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    if (y / (v5 * 0.5) + 1.0 >= 1.0)
    {
      BSUIConstrainValueWithRubberBand();
      v3 = v7 + 1.0;
    }
    else
    {
      BSUIConstrainValueWithRubberBand();
      v3 = 1.0 - v6;
    }
  }
  return fmin(fmax(v3, 0.0), 1.1);
}

- (double)wallpaperScale
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHomeGestureSwitcherModifier;
  -[SBHomeGestureSwitcherModifier wallpaperScale](&v9, sel_wallpaperScale);
  v4 = v3;
  if (self->_startingEnvironmentMode == 1 && self->_inMultitasking)
  {
    -[SBHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wallpaperScaleInSwitcher");
    v4 = v7;

  }
  return v4;
}

- (double)homeScreenDimmingAlpha
{
  double result;
  double progressToMaxTranslation;
  double toHomeScreenDimmingAlpha;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  objc_super v10;
  objc_super v11;
  objc_super v12;

  if (self->_providesHomeScreenDimmingAlpha)
  {
    if (self->_startingEnvironmentMode == 1)
    {
      if (self->_inMultitasking)
      {
        return self->_toHomeScreenDimmingAlpha;
      }
      else
      {
        v12.receiver = self;
        v12.super_class = (Class)SBHomeGestureSwitcherModifier;
        -[SBHomeGestureSwitcherModifier homeScreenDimmingAlpha](&v12, sel_homeScreenDimmingAlpha, v9.receiver, v9.super_class);
      }
    }
    else
    {
      progressToMaxTranslation = self->_progressToMaxTranslation;
      toHomeScreenDimmingAlpha = self->_toHomeScreenDimmingAlpha;
      v11.receiver = self;
      v11.super_class = (Class)SBHomeGestureSwitcherModifier;
      -[SBHomeGestureSwitcherModifier homeScreenDimmingAlpha](&v11, sel_homeScreenDimmingAlpha);
      v7 = progressToMaxTranslation * (toHomeScreenDimmingAlpha - v6);
      v10.receiver = self;
      v10.super_class = (Class)SBHomeGestureSwitcherModifier;
      -[SBHomeGestureSwitcherModifier homeScreenDimmingAlpha](&v10, sel_homeScreenDimmingAlpha);
      result = v7 + v8;
      if (result < 0.2)
        return 0.2;
    }
  }
  else
  {
    -[SBHomeGestureSwitcherModifier homeScreenDimmingAlpha](&v9, sel_homeScreenDimmingAlpha, self, SBHomeGestureSwitcherModifier);
  }
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  if (self->_startingEnvironmentMode == 1
    || !-[SBHomeGestureSwitcherModifier homeScreenHasOpenFolder](self, "homeScreenHasOpenFolder")
    || SBFEffectiveHomeButtonType() == 2)
  {
    return 3;
  }
  else
  {
    return 2;
  }
}

- (double)homeScreenBackdropBlurProgress
{
  double toHomeScreenBlurProgress;
  double progressToMaxTranslation;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;
  objc_super v12;
  objc_super v13;

  if (self->_startingEnvironmentMode == 1)
  {
    if (self->_inMultitasking)
    {
      toHomeScreenBlurProgress = self->_toHomeScreenBlurProgress;
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)SBHomeGestureSwitcherModifier;
      -[SBHomeGestureSwitcherModifier homeScreenBackdropBlurProgress](&v13, sel_homeScreenBackdropBlurProgress);
      toHomeScreenBlurProgress = v9;
    }
  }
  else
  {
    if (-[SBHomeGestureSwitcherModifier homeScreenHasOpenFolder](self, "homeScreenHasOpenFolder")
      && -[SBHomeGestureSwitcherModifier homeScreenBackdropBlurType](self, "homeScreenBackdropBlurType") != 3)
    {
      toHomeScreenBlurProgress = self->_toHomeScreenBlurProgress;
    }
    else
    {
      progressToMaxTranslation = self->_progressToMaxTranslation;
      v5 = self->_toHomeScreenBlurProgress;
      v12.receiver = self;
      v12.super_class = (Class)SBHomeGestureSwitcherModifier;
      -[SBHomeGestureSwitcherModifier homeScreenBackdropBlurProgress](&v12, sel_homeScreenBackdropBlurProgress);
      v7 = progressToMaxTranslation * (v5 - v6);
      v11.receiver = self;
      v11.super_class = (Class)SBHomeGestureSwitcherModifier;
      -[SBHomeGestureSwitcherModifier homeScreenBackdropBlurProgress](&v11, sel_homeScreenBackdropBlurProgress);
      toHomeScreenBlurProgress = v7 + v8;
    }
    if ((!-[SBHomeGestureSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled")|| self->_startingEnvironmentMode != 3)&& toHomeScreenBlurProgress < 0.5)
    {
      toHomeScreenBlurProgress = 0.5;
    }
  }
  return fmin(fmax(toHomeScreenBlurProgress, 0.0), 1.0);
}

- (BOOL)isContainerStatusBarVisible
{
  void *v2;
  BOOL v3;
  objc_super v5;

  if (self->_startingEnvironmentMode == 1)
  {
    if (self->_inMultitasking)
    {
      -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "count") == 0;

    }
    else
    {
      return 1;
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBHomeGestureSwitcherModifier;
    return -[SBHomeGestureSwitcherModifier isContainerStatusBarVisible](&v5, sel_isContainerStatusBarVisible);
  }
  return v3;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return !-[SBHomeGestureSwitcherModifier _shouldResignActiveBasedOnCardScale](self, "_shouldResignActiveBasedOnCardScale", a3);
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (id)appLayoutsToCacheSnapshots
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if (self->_selectedAppLayout)
    {
      v4 = objc_msgSend(v3, "indexOfObject:");
      if (v4 == 0x7FFFFFFFFFFFFFFFLL)
        v5 = 0;
      else
        v5 = v4;
    }
    else
    {
      v5 = 0;
    }
    -[SBHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfSnapshotsToAlwaysKeepAround");
    if (!v8)
      v8 = objc_msgSend(v7, "numberOfSnapshotsToCacheInSwitcher");
    -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", v5, 1, v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  void *v3;
  void *v4;
  NSUInteger v5;
  NSUInteger v6;
  NSRange v7;
  void *v8;
  NSRange v10;
  NSRange v11;

  -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_selectedAppLayout)
  {
    -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfObject:", self->_selectedAppLayout);

    if (!v5)
    {
      v6 = 2;
      goto LABEL_7;
    }
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      --v5;
      v6 = 3;
      goto LABEL_7;
    }
  }
  v5 = 0;
  v6 = 1;
LABEL_7:
  v11.length = objc_msgSend(v3, "count");
  v10.location = v5;
  v10.length = v6;
  v11.location = 0;
  v7 = NSIntersectionRange(v10, v11);
  objc_msgSend(v3, "subarrayWithRange:", v7.location, v7.length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)appLayoutsToResignActive
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_shouldResignActive)
  {
    v2 = (void *)MEMORY[0x1E0C99D80];
    v3 = (void *)MEMORY[0x1E0C99E60];
    -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dictionaryWithObject:forKey:", v5, &unk_1E91D0740);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SBHomeGestureSwitcherModifier;
    -[SBHomeGestureSwitcherModifier appLayoutsToResignActive](&v21, sel_appLayoutsToResignActive);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v8, "allValues", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "allObjects");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObjectsFromArray:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v9, &unk_1E91D0740);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    return v16;
  }
}

- (id)keyboardSuppressionMode
{
  void *v2;
  objc_super v4;

  if (self->_shouldResignActive)
  {
    +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes](SBSwitcherKeyboardSuppressionMode, "suppressionModeForAllScenes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBHomeGestureSwitcherModifier;
    -[SBHomeGestureSwitcherModifier keyboardSuppressionMode](&v4, sel_keyboardSuppressionMode);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  unsigned int v3;
  objc_super v5;

  if (self->_shouldResignActive)
  {
    v3 = 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBHomeGestureSwitcherModifier;
    v3 = -[SBHomeGestureSwitcherModifier asyncRenderingAttributesForAppLayout:](&v5, sel_asyncRenderingAttributesForAppLayout_, a3) & 1;
  }
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(v3, 1);
}

- (BOOL)isHitTestBlockingViewVisible
{
  return self->_shouldResignActive;
}

- (CGPoint)liftOffVelocityForGestureEnd
{
  double x;
  double y;
  CGPoint result;

  x = self->_gestureLiftOffVelocity.x;
  y = self->_gestureLiftOffVelocity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)liftOffTranslationForGestureEnd
{
  double x;
  double y;
  CGPoint result;

  x = self->_gestureLiftOffTranslation.x;
  y = self->_gestureLiftOffTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isShowingOrAnimatingCardsForFlyIn
{
  return self->_inMultitasking || self->_inMultitaskingChangedProperty != 0;
}

- (id)selectedAppLayout
{
  return self->_selectedAppLayout;
}

- (NSString)debugDescription
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  SBHomeGestureSwitcherModifier *v13;

  -[SBGestureSwitcherModifier descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", &stru_1E8EC7EC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendSuper");
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __49__SBHomeGestureSwitcherModifier_debugDescription__block_invoke;
  v11 = &unk_1E8E9E820;
  v12 = v3;
  v13 = self;
  v5 = v3;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, CFSTR("\t"), &v8);
  objc_msgSend(v5, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

id __49__SBHomeGestureSwitcherModifier_debugDescription__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 120), CFSTR("inMultitasking"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), CFSTR("inMultitaskingChangedProperty"));
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 128);
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "presentationValue");
    v7 = (id)objc_msgSend(v6, "appendFloat:withName:", CFSTR("inMultitaskingChangedProperty.presentationValue"));
    v4 = *(_QWORD *)(a1 + 40);
  }
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("touchOffset"), *(double *)(v4 + 136), *(double *)(v4 + 144));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("lastFrameOffsetX"), *(double *)(*(_QWORD *)(a1 + 40) + 152));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("lastTranslationXForRubberbanding"), *(double *)(*(_QWORD *)(a1 + 40) + 160));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("translationXLostToRubberbanding"), *(double *)(*(_QWORD *)(a1 + 40) + 168));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 176), CFSTR("hasTriggeredCardFlyIn"));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("translationYWhenTriggeredCardFlyIn"), *(double *)(*(_QWORD *)(a1 + 40) + 184));
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 192), CFSTR("hasBecomeCoplanarSinceGestureFromSwitcherBegan"));
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("gestureLiftOffVelocity"), *(double *)(*(_QWORD *)(a1 + 40) + 200), *(double *)(*(_QWORD *)(a1 + 40) + 208));
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("gestureLiftOffTranslation"), *(double *)(*(_QWORD *)(a1 + 40) + 216), *(double *)(*(_QWORD *)(a1 + 40) + 224));
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("translationAdjustmentForStartingFromSwitcher"), *(double *)(*(_QWORD *)(a1 + 40) + 232), *(double *)(*(_QWORD *)(a1 + 40) + 240));
  v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("translationAdjustmentForStartingFromHomeScreen"), *(double *)(*(_QWORD *)(a1 + 40) + 248), *(double *)(*(_QWORD *)(a1 + 40) + 256));
  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("progressToInSwitcherCardScale"), *(double *)(*(_QWORD *)(a1 + 40) + 264));
  v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("progressToMaxTranslation"), *(double *)(*(_QWORD *)(a1 + 40) + 272));
  v21 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("translation"), *(double *)(*(_QWORD *)(a1 + 40) + 280), *(double *)(*(_QWORD *)(a1 + 40) + 288));
  v22 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("velocity"), *(double *)(*(_QWORD *)(a1 + 40) + 296), *(double *)(*(_QWORD *)(a1 + 40) + 304));
  v23 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("stackedProgress"), *(double *)(*(_QWORD *)(a1 + 40) + 312));
  v24 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("initialCentroid"), *(double *)(*(_QWORD *)(a1 + 40) + 320), *(double *)(*(_QWORD *)(a1 + 40) + 328));
  v25 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("centroid"), *(double *)(*(_QWORD *)(a1 + 40) + 336), *(double *)(*(_QWORD *)(a1 + 40) + 344));
  v26 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("absoluteScale"), *(double *)(*(_QWORD *)(a1 + 40) + 368));
  v27 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("translationWithoutScale"), *(double *)(*(_QWORD *)(a1 + 40) + 376), *(double *)(*(_QWORD *)(a1 + 40) + 384));
  v28 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("lastTouchTimestamp"), *(double *)(*(_QWORD *)(a1 + 40) + 400));
  v29 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 408), CFSTR("gestureHoldTimer"));
  v30 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("initialTouchLocation"), *(double *)(*(_QWORD *)(a1 + 40) + 416), *(double *)(*(_QWORD *)(a1 + 40) + 424));
  v31 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("lastTouchLocation"), *(double *)(*(_QWORD *)(a1 + 40) + 432), *(double *)(*(_QWORD *)(a1 + 40) + 440));
  v32 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 448), CFSTR("everTranslatedUpwards"));
  v33 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 449), CFSTR("cancelledGestureForEmptySwitcher"));
  v34 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("toHomeScreenAlpha"), *(double *)(*(_QWORD *)(a1 + 40) + 456));
  v35 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("toHomeScreenBlurProgress"), *(double *)(*(_QWORD *)(a1 + 40) + 464));
  v36 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("toHomeScreenDimmingAlpha"), *(double *)(*(_QWORD *)(a1 + 40) + 472));
  v37 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 480), CFSTR("didWarmupFlyInHaptic"));
  v38 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 481), CFSTR("didPlayFlyInHaptic"));
  v39 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 528), CFSTR("selectedAppLayout"));
  v40 = *(void **)(a1 + 32);
  SBStringForUnlockedEnvironmentMode(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 536));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "appendString:withName:", v41, CFSTR("startingEnvironmentMode"));

  v42 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 544), CFSTR("scrunchInitiated"));
  v43 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 545), CFSTR("continuingGesture"));
  v44 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 546), CFSTR("lastGestureWasAnArcSwipe"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 547), CFSTR("shouldResignActive"));
}

- (void)_updateShouldResignActiveWithEvent:(id)a3
{
  SBHomeGestureDockSwitcherModifier *dockModifier;
  BOOL v5;

  if ((unint64_t)objc_msgSend(a3, "phase") < 2 || !self->_shouldResignActive)
  {
    if (-[SBAppLayout type](self->_selectedAppLayout, "type"))
    {
      self->_shouldResignActive = 1;
    }
    else
    {
      if (self->_gestureHasEnded)
        self->_shouldResignActive = -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination") != 0;
      dockModifier = self->_dockModifier;
      v5 = dockModifier
        && !-[SBHomeGestureDockSwitcherModifier isCurrentlyTrackingDock](dockModifier, "isCurrentlyTrackingDock")
        || -[SBHomeGestureSwitcherModifier _shouldResignActiveBasedOnCardScale](self, "_shouldResignActiveBasedOnCardScale");
      self->_shouldResignActive = v5;
    }
  }
}

- (BOOL)_shouldResignActiveBasedOnCardScale
{
  double v4;
  double v5;

  -[SBHomeGestureSwitcherModifier _scaleForAdjacentCards](self, "_scaleForAdjacentCards");
  if ((BSFloatLessThanOrEqualToFloat() & 1) != 0)
    return 1;
  v4 = fabs(self->_translation.x);
  -[SBHomeGestureSwitcherModifier _coplanarSpacing](self, "_coplanarSpacing");
  return v4 > v5;
}

- (id)_responseForUpdatingLayoutForGestureBegan
{
  SBSwitcherModifierEventResponse *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  int64_t startingEnvironmentMode;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  SBUpdateLayoutSwitcherEventResponse *v10;
  uint64_t v11;
  SBUpdateLayoutSwitcherEventResponse *v12;

  v3 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  -[SBChainableModifierEventResponse addChildResponse:](v3, "addChildResponse:", v4);

  startingEnvironmentMode = self->_startingEnvironmentMode;
  v7 = !self->_continuingGesture && startingEnvironmentMode == 3;
  if (startingEnvironmentMode == 2)
  {
    v8 = 0;
    v9 = 0;
  }
  else
  {
    v9 = -[SBAppLayout type](self->_selectedAppLayout, "type") == 2;
    v8 = self->_startingEnvironmentMode == 1;
  }
  if (v7 || v9 || v8)
  {
    v10 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 2);
    -[SBChainableModifierEventResponse addChildResponse:](v3, "addChildResponse:", v10);

    if (v8 || v9 && !self->_continuingGesture)
      v11 = 2;
    else
      v11 = 4;
    v12 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 4, v11);
    -[SBChainableModifierEventResponse addChildResponse:](v3, "addChildResponse:", v12);

  }
  return v3;
}

- (id)_responseForUpdatingIconViewVisibility:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  SBIconViewVisibilitySwitcherEventResponse *v8;
  SBIconViewVisibilitySwitcherEventResponse *v9;
  SBAppLayout *selectedAppLayout;
  void *v11;

  if (self->_selectedAppLayout && self->_startingEnvironmentMode == 3)
  {
    v4 = a3;
    if (a3)
    {
      -[SBHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "animationSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "iconFadeInSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    v9 = [SBIconViewVisibilitySwitcherEventResponse alloc];
    selectedAppLayout = self->_selectedAppLayout;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DAA998], CFSTR("SBIconLocationFloatingDockSuggestions"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBIconViewVisibilitySwitcherEventResponse initWithAppLayout:visible:animationSettings:excludedIconLocations:](v9, "initWithAppLayout:visible:animationSettings:excludedIconLocations:", selectedAppLayout, v4, v7, v11);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_responseForActivatingFinalDestination:(int64_t)a3
{
  void *v5;
  void *v6;
  SBAppLayout *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SBMutableSwitcherTransitionRequest *v18;
  SBPerformTransitionSwitcherEventResponse *v19;

  -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  switch(a3)
  {
    case 0:
      v7 = self->_selectedAppLayout;
      v8 = -[SBHomeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
      goto LABEL_21;
    case 1:
      v9 = objc_msgSend(v5, "indexOfObject:", self->_selectedAppLayout);
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_16;
      v10 = v9;
      if (!objc_msgSend(v6, "count"))
        goto LABEL_16;
      if (v10 <= 1)
        v11 = 1;
      else
        v11 = v10;
      v12 = v11 - 1;
      goto LABEL_15;
    case 2:
      if (self->_selectedAppLayout)
      {
        v13 = objc_msgSend(v5, "indexOfObject:");
        if (v13 == 0x7FFFFFFFFFFFFFFFLL || (v14 = v13, !objc_msgSend(v6, "count")))
        {
LABEL_16:
          v8 = 0;
          v7 = 0;
          goto LABEL_21;
        }
        v15 = objc_msgSend(v6, "count");
        if (v14 + 1 < v15 - 1)
          v12 = v14 + 1;
        else
          v12 = v15 - 1;
LABEL_15:
        objc_msgSend(v6, "objectAtIndex:", v12);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v5, "firstObject");
        v16 = objc_claimAutoreleasedReturnValue();
      }
LABEL_20:
      v7 = (SBAppLayout *)v16;
      v8 = 0;
LABEL_21:
      v17 = 0;
LABEL_22:
      v18 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      -[SBSwitcherTransitionRequest setAppLayout:](v18, "setAppLayout:", v7);
      -[SBSwitcherTransitionRequest setUnlockedEnvironmentMode:](v18, "setUnlockedEnvironmentMode:", v17);
      -[SBSwitcherTransitionRequest setPreferredInterfaceOrientation:](v18, "setPreferredInterfaceOrientation:", v8);
      v19 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v18, 1);

      return v19;
    case 3:
      v8 = -[SBHomeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
      v7 = 0;
      v17 = 2;
      goto LABEL_22;
    case 4:
      +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    default:
      goto LABEL_16;
  }
}

- (id)_responseForStudyLogDidBeginGesture
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint *p_lastTouchLocation;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SBEmitStudyLogSwitcherEventResponse *v22;
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  if (-[SBHomeGestureSwitcherModifier isStudyLogEnabled](self, "isStudyLogEnabled"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v26[0] = CFSTR("x");
    p_lastTouchLocation = &self->_lastTouchLocation;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastTouchLocation.x);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = CFSTR("y");
    v27[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_lastTouchLocation->y);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("locationInView"));
    v24[0] = CFSTR("x");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v16;
    v24[1] = CFSTR("y");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v17;
    v24[2] = CFSTR("width");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v18;
    v24[3] = CFSTR("height");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("switcherViewBounds"));

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v3);
    v22 = -[SBEmitStudyLogSwitcherEventResponse initWithStudyLogWithName:payload:]([SBEmitStudyLogSwitcherEventResponse alloc], "initWithStudyLogWithName:payload:", CFSTR("[SBDeckSwitcherPanGestureWorkspaceTransresponse _beginWithGesture:]"), v21);

  }
  else
  {
    v22 = 0;
  }
  return v22;
}

- (id)_responseForStudyLogDidEndGestureWithEvent:(id)a3 finalDestination:(int64_t)a4 destinationReason:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  SBHomeGestureDockSwitcherModifier *dockModifier;
  void *v29;
  void *v30;
  void *v31;
  SBEmitStudyLogSwitcherEventResponse *v32;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a5;
  if (-[SBHomeGestureSwitcherModifier isStudyLogEnabled](self, "isStudyLogEnabled"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "averageTouchPathAngleOverTimeDuration:", 0.0416666667);
    v12 = v11;
    objc_msgSend(v8, "velocityInContainerView");
    v14 = v13;
    v16 = v15;
    v36[0] = CFSTR("x");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastTouchLocation.x);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = CFSTR("y");
    v37[0] = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastTouchLocation.y);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("location"));

    v34[0] = CFSTR("x");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = CFSTR("y");
    v35[0] = v20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("velocity"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("touchPathAngleAverage"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, CFSTR("finalDestination"));

    NSStringFromSBHomeGestureFinalDestination(a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, CFSTR("finalDestinationString"));

    if (v9)
      v26 = v9;
    else
      v26 = &stru_1E8EC7EC0;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v26, CFSTR("finalDestinationReason"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBHomeGestureSwitcherModifier _hasPausedEnoughForFlyIn](self, "_hasPausedEnoughForFlyIn"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, CFSTR("hasPausedEnoughForCardFlyIn"));

    dockModifier = self->_dockModifier;
    if (dockModifier)
    {
      -[SBHomeGestureDockSwitcherModifier studyLogData](dockModifier, "studyLogData");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addEntriesFromDictionary:", v29);

    }
    -[SBHomeGestureFinalDestinationSwitcherModifier studyLogData](self->_finalDestinationModifier, "studyLogData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addEntriesFromDictionary:", v30);

    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v10);
    v32 = -[SBEmitStudyLogSwitcherEventResponse initWithStudyLogWithName:payload:]([SBEmitStudyLogSwitcherEventResponse alloc], "initWithStudyLogWithName:payload:", CFSTR("[SBDeckSwitcherPanGestureWorkspaceTransresponse _finishWithGesture:]"), v31);

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (id)_responseForSBEventGestureBeganWithTimeDelta:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBEmitSBEventSwitcherEventResponse *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0DABF10];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_initialTouchLocation.x);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = *MEMORY[0x1E0DABF18];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_initialTouchLocation.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = *MEMORY[0x1E0DABEF8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SBHomeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = *MEMORY[0x1E0DABF08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SBEmitSBEventSwitcherEventResponse initWithSBEventWithEventType:payload:]([SBEmitSBEventSwitcherEventResponse alloc], "initWithSBEventWithEventType:payload:", 33, v9);
  return v10;
}

- (id)_responseForSBEventGestureEndWithEvent:(id)a3 finalDestination:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  CGPoint *p_velocity;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SBEmitSBEventSwitcherEventResponse *v20;
  _QWORD v22[7];
  _QWORD v23[8];

  v23[7] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "averageTouchPathAngleOverTimeDuration:", 0.0416666667);
  v8 = fmin(fmax(v7, 2.22507386e-308), 1.79769313e308);
  objc_msgSend(v6, "peakSpeed");
  v10 = v9;

  v22[0] = *MEMORY[0x1E0DABED8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  v22[1] = *MEMORY[0x1E0DABF10];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastTouchLocation.x);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  v22[2] = *MEMORY[0x1E0DABF18];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastTouchLocation.y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v13;
  v22[3] = *MEMORY[0x1E0DABEE8];
  p_velocity = &self->_velocity;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_velocity.x);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v15;
  v22[4] = *MEMORY[0x1E0DABEF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_velocity->y);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v16;
  v22[5] = *MEMORY[0x1E0DABEE0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v17;
  v22[6] = *MEMORY[0x1E0DABF00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmin(fmax(v10, 2.22507386e-308), 1.79769313e308));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[SBEmitSBEventSwitcherEventResponse initWithSBEventWithEventType:payload:]([SBEmitSBEventSwitcherEventResponse alloc], "initWithSBEventWithEventType:payload:", 34, v19);
  return v20;
}

- (id)_responseForActivatingReachabilityIfNeededWithFinalDestination:(int64_t)a3
{
  SBActivateReachabilitySwitcherEventResponse *v4;
  CGPoint lastTouchLocation;
  CGPoint translation;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL everTranslatedUpwards;
  _OWORD v18[3];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  BOOL v24;
  int v25;
  __int16 v26;
  CGPoint v27;
  CGPoint v28;
  CGPoint velocity;

  v4 = 0;
  if (!a3 && self->_startingEnvironmentMode != 2)
  {
    v26 = 0;
    lastTouchLocation = self->_lastTouchLocation;
    v25 = 0;
    translation = self->_translation;
    v27 = lastTouchLocation;
    v28 = translation;
    velocity = self->_velocity;
    -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = -[SBHomeGestureSwitcherModifier isLocationInSafeArea:](self, "isLocationInSafeArea:", self->_initialTouchLocation.x, self->_initialTouchLocation.y);
    everTranslatedUpwards = self->_everTranslatedUpwards;
    v18[0] = v27;
    v18[1] = v28;
    v18[2] = velocity;
    v19 = v8;
    v20 = v10;
    v21 = v12;
    v22 = v14;
    v23 = v15;
    v24 = everTranslatedUpwards;
    v4 = -[SBActivateReachabilitySwitcherEventResponse initWithReachabilityContext:]([SBActivateReachabilitySwitcherEventResponse alloc], "initWithReachabilityContext:", v18);
  }
  return v4;
}

- (id)_responseForCancelingSystemGesturesIfNeededWithFinalDestination:(int64_t)a3
{
  void *v3;
  SBCancelSystemGesturesSwitcherEventResponse *v4;

  if (a3
    && -[SBHomeGestureSwitcherModifier isSystemAssistantExperienceEnabled](self, "isSystemAssistantExperienceEnabled"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E91D0758, &unk_1E91D0770, 0);
    v4 = -[SBCancelSystemGesturesSwitcherEventResponse initWithSystemGestureTypes:]([SBCancelSystemGesturesSwitcherEventResponse alloc], "initWithSystemGestureTypes:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_updateInMultitaskingIfNeededWithEvent:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  SBSwitcherModifierEventResponse *v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  int inMultitasking;
  SBHapticSwitcherEventResponse *v14;
  BOOL v15;
  SBHapticSwitcherEventResponse *v16;
  double v17;
  double v18;
  int v19;
  uint64_t v20;
  SBHapticSwitcherEventResponse *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  objc_msgSend(v4, "locationInContainerView");
  v6 = v5;
  v8 = v7;
  v9 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v10 = -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination");
  -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  inMultitasking = self->_inMultitasking;
  if (v10 == 3)
  {
    if (!self->_didWarmupFlyInHaptic)
    {
      v14 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 0, 0);
      -[SBChainableModifierEventResponse addChildResponse:](v9, "addChildResponse:", v14);
      self->_didWarmupFlyInHaptic = 1;

    }
    if (inMultitasking)
    {
      v15 = self->_didPlayFlyInHaptic || v12 == 0;
      if (!v15
        && fabs(self->_velocity.x) < *(double *)&kPauseVelocityThresholdForAppSwitcher
        && fabs(self->_velocity.y) < *(double *)&kPauseVelocityThresholdForAppSwitcher)
      {
        v16 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 0, 1);
        -[SBHapticSwitcherEventResponse setHidEventSenderID:](v16, "setHidEventSenderID:", objc_msgSend(v4, "hidEventSenderID"));
        -[SBChainableModifierEventResponse addChildResponse:](v9, "addChildResponse:", v16);
        self->_didPlayFlyInHaptic = 1;

      }
    }
  }
  -[SBHomeGestureSwitcherModifier _unadjustedGestureTranslation](self, "_unadjustedGestureTranslation");
  v19 = -[SBHomeGestureSwitcherModifier _inMultitaskingForLocation:translation:](self, "_inMultitaskingForLocation:translation:", v6, v8, v17, v18);
  self->_inMultitasking = v19;
  if (inMultitasking != v19)
  {
    if ((v19 & 1) != 0)
    {
      v20 = 0;
      self->_hasTriggeredCardFlyIn = 1;
      self->_translationYWhenTriggeredCardFlyIn = self->_translation.y;
    }
    else
    {
      self->_didPlayFlyInHaptic = 0;
      v20 = 1;
    }
    -[SBCoplanarSwitcherModifier setSpacingType:](self->_coplanarLayoutModifier, "setSpacingType:", v20);
    if (!-[SBHomeGestureSwitcherModifier _preventPositioningCardsOffscreenForFlatBottomEdgeSwipe](self, "_preventPositioningCardsOffscreenForFlatBottomEdgeSwipe"))
    {
      if (self->_inMultitasking
        && !self->_didPlayFlyInHaptic
        && v12
        && fabs(self->_velocity.x) < *(double *)&kVelocityXThresholdForUnconditionalArcSwipe)
      {
        v21 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 0, 1);
        -[SBHapticSwitcherEventResponse setHidEventSenderID:](v21, "setHidEventSenderID:", objc_msgSend(v4, "hidEventSenderID"));
        -[SBChainableModifierEventResponse addChildResponse:](v9, "addChildResponse:", v21);
        self->_didPlayFlyInHaptic = 1;

      }
      -[SBHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "animationSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layoutSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHomeGestureSwitcherModifier _beginAnimatingMultitaskingPropertyWithMode:settings:](self, "_beginAnimatingMultitaskingPropertyWithMode:settings:", 3, v24);

    }
  }

  return v9;
}

- (BOOL)_preventPositioningCardsOffscreenForFlatBottomEdgeSwipe
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SBHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
  v4 = v3;
  -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v6 = (1.0 - v4) * v5;
  -[SBHomeGestureSwitcherModifier _coplanarSpacing](self, "_coplanarSpacing");
  return v6 < v7 * 0.75;
}

- (BOOL)_hasPausedEnoughForFlyIn
{
  double v4;

  if (-[SBHomeGestureFinalDestinationSwitcherModifier hasSeenAccelerationDipForAppSwitcher](self->_finalDestinationModifier, "hasSeenAccelerationDipForAppSwitcher"))
  {
    return 1;
  }
  v4 = *(double *)&kCardFlyInDelayAfterEnteringAppSwitcher;
  return self->_gestureHoldTimer > (unint64_t)(v4 * SBScreenMaximumFramesPerSecond());
}

- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcher
{
  double v3;

  -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  return self->_lastTouchLocation.y <= v3 - *(double *)&kMinimumYDistanceForHomeOrAppSwitcher;
}

- (void)_displayLinkFired:(id)a3
{
  int64_t v4;
  BOOL v5;

  if (-[SBGestureSwitcherModifier gesturePhase](self, "gesturePhase", a3) == 2
    && -[SBChainableModifier state](self, "state") != 1)
  {
    -[SBHomeGestureSwitcherModifier gestureHandlingModifier:averageVelocityOverDuration:](self, "gestureHandlingModifier:averageVelocityOverDuration:", self, 0.0416666667);
    v4 = -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination");
    if (v4)
      v5 = v4 == 4;
    else
      v5 = 1;
    if (v5)
    {
      self->_gestureHoldTimer = 0;
    }
    else if (v4 == 3 && BSFloatLessThanFloat())
    {
      ++self->_gestureHoldTimer;
    }
    if (!self->_inMultitasking)
    {
      if (-[SBHomeGestureSwitcherModifier _hasPausedEnoughForFlyIn](self, "_hasPausedEnoughForFlyIn"))
        -[SBHomeGestureSwitcherModifier gestureHandlingModifierRequestsUpdate:](self, "gestureHandlingModifierRequestsUpdate:", self);
    }
  }
}

- (BOOL)_shouldPositionAdjacentCardsOffscreenForFlyIn
{
  BOOL v3;

  v3 = -[SBHomeGestureSwitcherModifier _preventPositioningCardsOffscreenForFlatBottomEdgeSwipe](self, "_preventPositioningCardsOffscreenForFlatBottomEdgeSwipe");
  if (self->_inMultitasking)
    return 0;
  if (self->_startingEnvironmentMode == 1)
    return 1;
  return !v3;
}

- (void)_beginAnimatingMultitaskingPropertyWithMode:(int64_t)a3 settings:(id)a4
{
  id v6;
  UIViewFloatAnimatableProperty *inMultitaskingChangedProperty;
  UIViewFloatAnimatableProperty *v8;
  UIViewFloatAnimatableProperty *v9;
  UIViewFloatAnimatableProperty *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  UIViewFloatAnimatableProperty *v16;
  void *v17;
  UIViewFloatAnimatableProperty *v18;
  _QWORD v19[4];
  UIViewFloatAnimatableProperty *v20;
  id v21;
  _QWORD v22[5];
  id location;

  v6 = a4;
  inMultitaskingChangedProperty = self->_inMultitaskingChangedProperty;
  if (inMultitaskingChangedProperty)
  {
    -[UIViewFloatAnimatableProperty invalidate](inMultitaskingChangedProperty, "invalidate");
    v8 = self->_inMultitaskingChangedProperty;
    self->_inMultitaskingChangedProperty = 0;

  }
  v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  v10 = self->_inMultitaskingChangedProperty;
  self->_inMultitaskingChangedProperty = v9;

  -[UIViewFloatAnimatableProperty setValue:](self->_inMultitaskingChangedProperty, "setValue:", 0.0);
  v11 = (void *)objc_msgSend(v6, "copy");
  LODWORD(v12) = *MEMORY[0x1E0CD23C0];
  LODWORD(v13) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 4);
  LODWORD(v14) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 8);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 0, v12, v13, v14);
  v15 = v11;

  objc_initWeak(&location, self);
  v16 = self->_inMultitaskingChangedProperty;
  v17 = (void *)MEMORY[0x1E0CEABB0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86__SBHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke;
  v22[3] = &unk_1E8E9DED8;
  v22[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__SBHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke_2;
  v19[3] = &unk_1E8EA6DD8;
  objc_copyWeak(&v21, &location);
  v18 = v16;
  v20 = v18;
  objc_msgSend(v17, "sb_animateWithSettings:mode:animations:completion:", v15, a3, v22, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

uint64_t __86__SBHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setValue:", 1.0);
}

void __86__SBHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = WeakRetained[16];
    v4 = v3;
    if (v3 && v3 == *(id *)(a1 + 32))
    {
      v5 = v6[16];
      v6[16] = 0;

    }
    WeakRetained = v6;
  }

}

- (BOOL)_inMultitaskingForLocation:(CGPoint)a3 translation:(CGPoint)a4
{
  double y;
  double x;
  _BOOL4 inMultitasking;
  int64_t startingEnvironmentMode;
  void *v9;
  char v10;
  char v11;
  int64_t v12;
  int v14;
  double v15;
  double v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  double v20;
  _BOOL4 v22;
  char v23;
  BOOL v24;
  BOOL v25;
  int v26;
  double v27;

  y = a4.y;
  x = a4.x;
  inMultitasking = self->_inMultitasking;
  startingEnvironmentMode = self->_startingEnvironmentMode;
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance", a3.x, a3.y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isInSetupMode");

  if ((v10 & 1) != 0)
    return 0;
  v12 = -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination");
  v14 = inMultitasking || (unint64_t)(v12 - 1) < 2;
  -[SBHomeGestureSwitcherModifier _coplanarSpacing](self, "_coplanarSpacing");
  v16 = v15;
  if (self->_selectedAppLayout)
    v17 = -[SBHomeGestureSwitcherModifier _selectedAppLayoutIndex](self, "_selectedAppLayoutIndex");
  else
    v17 = 0;
  -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    -[SBHomeGestureSwitcherModifier scaleForIndex:](self, "scaleForIndex:", v17);
    if (fabs(x) > v16 / v20 && v12 != 4)
      v14 = 1;
  }
  if (-[SBHomeGestureSwitcherModifier _hasPausedEnoughForFlyIn](self, "_hasPausedEnoughForFlyIn"))
    v14 |= !-[SBHomeGestureDockSwitcherModifier isCurrentlyTrackingDock](self->_dockModifier, "isCurrentlyTrackingDock");
  v22 = -[SBHomeGestureSwitcherModifier _isTranslationPastDistanceThresholdToUnconditionallyGoHome:](self, "_isTranslationPastDistanceThresholdToUnconditionallyGoHome:", y);
  if (startingEnvironmentMode == 1)
    v23 = v14;
  else
    v23 = 0;
  if (v22)
    v11 = v23;
  else
    v11 = v14;
  v24 = -[SBHomeGestureSwitcherModifier _hasTraveledSufficientDistanceForHomeOrAppSwitcher](self, "_hasTraveledSufficientDistanceForHomeOrAppSwitcher");
  if (startingEnvironmentMode == 1)
  {
    v25 = v24;
    v26 = -[SBHomeGestureSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
    v27 = -x;
    if (!v26)
      v27 = x;
    if (v27 < v16)
      return v25 & v11;
  }
  return v11;
}

- (BOOL)_isTranslationPastDistanceThresholdToUnconditionallyGoHome:(double)a3
{
  double v3;
  double v4;

  v3 = -a3;
  -[SBHomeGestureSwitcherModifier unconditionalDistanceThresholdForHome](self, "unconditionalDistanceThresholdForHome");
  return v4 < v3;
}

- (double)_gestureProgressToMaxTranslationForTranslation:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[SBHomeGestureSwitcherModifier _distanceYToMaxTranslation](self, "_distanceYToMaxTranslation");
  v6 = v5;
  if (self->_startingEnvironmentMode == 2 && !self->_scrunchInitiated)
  {
    -[SBHomeGestureSwitcherModifier _distanceYToInSwitcherCardScale](self, "_distanceYToInSwitcherCardScale");
    a3 = v7 + a3;
    v6 = v6 - v7;
  }
  return -a3 / v6;
}

- (double)_distanceYToInSwitcherCardScale
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SBHomeGestureSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
  v4 = v3;
  -[SBHomeGestureSwitcherModifier _inSwitcherCenterYOffsetWhenPresented](self, "_inSwitcherCenterYOffsetWhenPresented");
  v6 = v5;
  -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  return (1.0 - v4) * v7 * 0.5 - v6;
}

- (double)_distanceYToMaxTranslation
{
  double v3;
  double v4;
  double v5;

  -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v4 = v3;
  -[SBHomeGestureSwitcherModifier _centerYOffsetDuringGesture](self, "_centerYOffsetDuringGesture");
  return v4 * 0.5 - v5;
}

- (double)_inSwitcherCenterYOffsetWhenPresented
{
  void *v3;
  double result;

  -[SBHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherCenterYOffsetPercentOfScreenHeight");

  -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  -[SBHomeGestureSwitcherModifier screenScale](self, "screenScale");
  BSFloatRoundForScale();
  return result;
}

- (double)_centerYOffsetDuringGesture
{
  double result;
  void *v4;
  double v5;
  double v6;

  if (self->_startingEnvironmentMode == 1)
  {
    -[SBHomeGestureSwitcherModifier _inSwitcherCenterYOffsetWhenPresented](self, "_inSwitcherCenterYOffsetWhenPresented");
  }
  else
  {
    -[SBHomeGestureSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeGestureCenterZoomDownCenterYOffsetFactor");
    -[SBHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    -[SBHomeGestureSwitcherModifier screenScale](self, "screenScale");
    BSFloatRoundForScale();
    v6 = v5;

    return v6;
  }
  return result;
}

- (double)_switcherCardScale
{
  void *v2;
  double v3;
  double v4;

  -[SBHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deckSwitcherPageScale");
  v4 = v3;

  return v4;
}

- (unint64_t)_selectedAppLayoutIndex
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && self->_selectedAppLayout)
    v5 = objc_msgSend(v3, "indexOfObject:");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (BOOL)_isSelectedAppLayoutAtIndex:(unint64_t)a3
{
  SBHomeGestureSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqual:", v4->_selectedAppLayout);
  return (char)v4;
}

- (double)_coplanarSpacing
{
  void *v3;
  double v4;
  double v5;

  -[SBHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBHomeGestureSwitcherModifier isDevicePad](self, "isDevicePad"))
    objc_msgSend(v3, "coplanarSpacingPad");
  else
    objc_msgSend(v3, "coplanarSpacingPhone");
  v5 = v4;

  return v5;
}

- (void)_applyPrototypeSettings
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;

  v3 = SBMainScreenPointsPerMillimeter();
  -[SBHomeGestureSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "normalizedDistanceYThresholdForUnconditionalHome");
  kHomeGestureNormalizedDistanceYThresholdForUnconditionalHome = v4;
  objc_msgSend(v11, "normalizedDistanceYThresholdRangeForUnconditionalHome");
  kHomeGestureNormalizedDistanceYThresholdRangeForUnconditionalHome = v5;
  objc_msgSend(v11, "pauseVelocityThresholdForAppSwitcher");
  *(double *)&kPauseVelocityThresholdForAppSwitcher = v3 * v6;
  objc_msgSend(v11, "velocityXThresholdForUnconditionalArcSwipe");
  *(double *)&kVelocityXThresholdForUnconditionalArcSwipe = v3 * v7;
  objc_msgSend(v11, "minimumYDistanceForHomeOrAppSwitcher");
  *(double *)&kMinimumYDistanceForHomeOrAppSwitcher = v3 * v8;
  objc_msgSend(v11, "cardFlyInMaximumVelocityThreshold");
  *(double *)&kCardFlyInMaximumVelocityThreshold = v3 * v9;
  objc_msgSend(v11, "cardFlyInDelayAfterEnteringAppSwitcher");
  kCardFlyInDelayAfterEnteringAppSwitcher = v10;

}

- (BOOL)laysOutNeighboringCards
{
  return self->_laysOutNeighboringCards;
}

- (void)setLaysOutNeighboringCards:(BOOL)a3
{
  self->_laysOutNeighboringCards = a3;
}

- (BOOL)providesHomeScreenDimmingAlpha
{
  return self->_providesHomeScreenDimmingAlpha;
}

- (void)setProvidesHomeScreenDimmingAlpha:(BOOL)a3
{
  self->_providesHomeScreenDimmingAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_dismissSiriModifier, 0);
  objc_storeStrong((id *)&self->_finalDestinationModifier, 0);
  objc_storeStrong((id *)&self->_dockModifier, 0);
  objc_storeStrong((id *)&self->_coplanarLayoutModifier, 0);
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_inMultitaskingChangedProperty, 0);
}

@end
