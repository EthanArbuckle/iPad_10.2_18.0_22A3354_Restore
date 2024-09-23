@implementation SBContinuousExposeHomeGestureSwitcherModifier

- (SBContinuousExposeHomeGestureSwitcherModifier)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 startingEnvironmentMode:(int64_t)a5 scrunchInitiated:(BOOL)a6 continuingGesture:(BOOL)a7 lastGestureWasAnArcSwipe:(BOOL)a8
{
  id v15;
  SBContinuousExposeHomeGestureSwitcherModifier *v16;
  SBContinuousExposeHomeGestureSwitcherModifier *v17;
  SBAppSwitcherContinuousExposeSwitcherModifier *v18;
  SBAppSwitcherContinuousExposeSwitcherModifier *appSwitcherModifier;
  SBDismissSiriSwitcherModifier *v20;
  SBDismissSiriSwitcherModifier *dismissSiriModifier;
  objc_super v23;

  v15 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  v16 = -[SBGestureSwitcherModifier initWithGestureID:](&v23, sel_initWithGestureID_, a3);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_selectedAppLayout, a4);
    v17->_startingEnvironmentMode = a5;
    v17->_scrunchInitiated = a6;
    v17->_continuingGesture = a7;
    v17->_lastGestureWasAnArcSwipe = a8;
    v17->_providesHomeScreenDimmingAlpha = 1;
    v18 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
    appSwitcherModifier = v17->_appSwitcherModifier;
    v17->_appSwitcherModifier = v18;

    -[SBAppSwitcherContinuousExposeSwitcherModifier setHandlesTapAppLayoutHeaderEvents:](v17->_appSwitcherModifier, "setHandlesTapAppLayoutHeaderEvents:", 0);
    -[SBAppSwitcherContinuousExposeSwitcherModifier setShowsActiveAppLayoutInSwitcher:](v17->_appSwitcherModifier, "setShowsActiveAppLayoutInSwitcher:", 0);
    -[SBAppSwitcherContinuousExposeSwitcherModifier setHandlesTapAppLayoutEvents:](v17->_appSwitcherModifier, "setHandlesTapAppLayoutEvents:", 0);
    v20 = objc_alloc_init(SBDismissSiriSwitcherModifier);
    dismissSiriModifier = v17->_dismissSiriModifier;
    v17->_dismissSiriModifier = v20;

    -[SBChainableModifier addChildModifier:](v17, "addChildModifier:", v17->_dismissSiriModifier);
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  -[SBChainableModifier dealloc](&v3, sel_dealloc);
}

- (void)didMoveToParentModifier:(id)a3
{
  int64_t startingEnvironmentMode;
  void *v6;
  void *v7;
  char v8;
  SBHomeScreenSwitcherModifier *v9;
  SBHomeScreenSwitcherModifier *v10;
  SBAppSwitcherContinuousExposeSwitcherModifier *appSwitcherModifier;
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
  void *v24;
  double v25;
  SBHomeGestureFinalDestinationSwitcherModifier *v26;
  SBHomeGestureFinalDestinationSwitcherModifier *finalDestinationModifier;
  _QWORD v28[5];
  SBHomeScreenSwitcherModifier *v29;
  objc_super v30;
  _QWORD v31[5];
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v32, sel_didMoveToParentModifier_);
  if (!a3)
  {
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    return;
  }
  startingEnvironmentMode = self->_startingEnvironmentMode;
  if (startingEnvironmentMode != 1)
  {
    if (startingEnvironmentMode != 3
      || (-[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "chamoisSettings"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "blurWallpaperInApps"),
          v7,
          v6,
          (v8 & 1) != 0))
    {
      v9 = objc_alloc_init(SBHomeScreenSwitcherModifier);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __73__SBContinuousExposeHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke_2;
      v28[3] = &unk_1E8E9E820;
      v28[4] = self;
      v29 = v9;
      v10 = v9;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", v10, v28);

LABEL_9:
      goto LABEL_10;
    }
  }
  appSwitcherModifier = self->_appSwitcherModifier;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __73__SBContinuousExposeHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke;
  v31[3] = &unk_1E8E9DED8;
  v31[4] = self;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appSwitcherModifier, v31);
  if (!self->_providesHomeScreenDimmingAlpha)
  {
    v30.receiver = self;
    v30.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier homeScreenAlpha](&v30, sel_homeScreenAlpha);
    self->_toHomeScreenAlpha = v12;
    -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
    v10 = (SBHomeScreenSwitcherModifier *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenSwitcherModifier animationSettings](v10, "animationSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeScreenBlurProgressForMode:", 2);
    self->_toHomeScreenBlurProgress = v14;

    goto LABEL_9;
  }
LABEL_10:
  if (-[SBContinuousExposeHomeGestureSwitcherModifier isFloatingDockSupported](self, "isFloatingDockSupported"))v15 = !self->_scrunchInitiated;
  else
    v15 = 0;
  v16 = self->_continuingGesture && self->_lastGestureWasAnArcSwipe;
  v17 = !v15;
  if (self->_dockModifier)
    v17 = 1;
  if ((v17 & 1) == 0)
  {
    v18 = -[SBContinuousExposeHomeGestureSwitcherModifier _newDockModifierRequiringVerticalSwipeToTrackDock:startingEnvironmentMode:](self, "_newDockModifierRequiringVerticalSwipeToTrackDock:startingEnvironmentMode:", v16, self->_startingEnvironmentMode);
    dockModifier = self->_dockModifier;
    self->_dockModifier = v18;

    -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", self->_dockModifier, 0, 0);
  }
  if (!self->_finalDestinationModifier)
  {
    if (self->_startingEnvironmentMode == 2)
    {
      -[SBContinuousExposeHomeGestureSwitcherModifier _distanceYToInSwitcherCardScale](self, "_distanceYToInSwitcherCardScale");
      self->_translationAdjustmentForStartingFromSwitcher.y = -v20;
    }
    if (v15)
      v21 = -[SBContinuousExposeHomeGestureSwitcherModifier _newDockModifierRequiringVerticalSwipeToTrackDock:startingEnvironmentMode:](self, "_newDockModifierRequiringVerticalSwipeToTrackDock:startingEnvironmentMode:", v16, self->_startingEnvironmentMode);
    else
      v21 = 0;
    v22 = [SBHomeGestureFinalDestinationSwitcherModifier alloc];
    -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "chamoisSettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "homeGestureMinimumYDistanceForHomeOrAppSwitcher");
    v26 = -[SBHomeGestureFinalDestinationSwitcherModifier initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:](v22, "initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:", self, self->_startingEnvironmentMode, self->_continuingGesture, v21, self->_translationAdjustmentForStartingFromSwitcher.x, self->_translationAdjustmentForStartingFromSwitcher.y, v25);
    finalDestinationModifier = self->_finalDestinationModifier;
    self->_finalDestinationModifier = v26;

    -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", self->_finalDestinationModifier, 1, 0);
  }
  -[SBContinuousExposeHomeGestureSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
}

uint64_t __73__SBContinuousExposeHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "homeScreenAlpha");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432) = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "homeScreenBackdropBlurProgress");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440) = v3;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "homeScreenDimmingAlpha");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448) = v5;
  return result;
}

uint64_t __73__SBContinuousExposeHomeGestureSwitcherModifier_didMoveToParentModifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 40), "homeScreenAlpha");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432) = v2;
  objc_msgSend(*(id *)(a1 + 40), "homeScreenBackdropBlurProgress");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440) = v3;
  result = objc_msgSend(*(id *)(a1 + 40), "homeScreenDimmingAlpha");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448) = v5;
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
  -[SBContinuousExposeHomeGestureSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
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
  -[SBContinuousExposeHomeGestureSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
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
  v8.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
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
  v10.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
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
  v12.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v12, sel_handleGestureEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v5, "phase"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuousExposeHomeGestureSwitcherModifier.m"), 308, CFSTR("Should not be getting PhasePossible"));

      goto LABEL_3;
    case 1:
      -[SBContinuousExposeHomeGestureSwitcherModifier _updateForGestureDidBeginWithEvent:](self, "_updateForGestureDidBeginWithEvent:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[SBContinuousExposeHomeGestureSwitcherModifier _updateForGestureDidChangeWithEvent:](self, "_updateForGestureDidChangeWithEvent:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[SBContinuousExposeHomeGestureSwitcherModifier _updateForGestureDidEndWithEvent:](self, "_updateForGestureDidEndWithEvent:", v5);
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
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuousExposeHomeGestureSwitcherModifier.m"), 325, CFSTR("Can't begin a gesture that has already begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuousExposeHomeGestureSwitcherModifier.m"), 326, CFSTR("Can't begin a gesture that has already ended."));

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
  -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
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
  -[SBContinuousExposeHomeGestureSwitcherModifier _updateGestureTranslationVelocityAndProgressWithEvent:](self, "_updateGestureTranslationVelocityAndProgressWithEvent:", v5);
  -[SBContinuousExposeHomeGestureSwitcherModifier _updateShouldResignActiveWithEvent:](self, "_updateShouldResignActiveWithEvent:", v5);
  -[SBContinuousExposeHomeGestureSwitcherModifier _updateStackedProgress](self, "_updateStackedProgress");
  -[SBContinuousExposeHomeGestureSwitcherModifier _responseForUpdatingLayoutForGestureBegan](self, "_responseForUpdatingLayoutForGestureBegan");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v32);
  -[SBContinuousExposeHomeGestureSwitcherModifier _responseForUpdatingIconViewVisibility:](self, "_responseForUpdatingIconViewVisibility:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v33);
  v34 = v7 - v9;
  -[SBContinuousExposeHomeGestureSwitcherModifier _responseForStudyLogDidBeginGesture](self, "_responseForStudyLogDidBeginGesture");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v35);
  -[SBContinuousExposeHomeGestureSwitcherModifier _responseForSBEventGestureBeganWithTimeDelta:](self, "_responseForSBEventGestureBeganWithTimeDelta:", v34);
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
  SBCompleteGestureSwitcherEventResponse *v14;
  _BOOL4 inMultitasking;
  void *v17;
  void *v18;

  v5 = a3;
  if (!self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuousExposeHomeGestureSwitcherModifier.m"), 396, CFSTR("Can't update a gesture that has not begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuousExposeHomeGestureSwitcherModifier.m"), 397, CFSTR("Can't update a gesture that has already ended."));

  }
  -[SBContinuousExposeHomeGestureSwitcherModifier _updateGestureTranslationVelocityAndProgressWithEvent:](self, "_updateGestureTranslationVelocityAndProgressWithEvent:", v5);
  -[SBContinuousExposeHomeGestureSwitcherModifier _updateShouldResignActiveWithEvent:](self, "_updateShouldResignActiveWithEvent:", v5);
  -[SBContinuousExposeHomeGestureSwitcherModifier _updateStackedProgress](self, "_updateStackedProgress");
  -[SBContinuousExposeHomeGestureSwitcherModifier _unadjustedGestureTranslation](self, "_unadjustedGestureTranslation");
  v7 = v6;
  if (-[SBContinuousExposeHomeGestureSwitcherModifier _isTranslationPastDistanceThresholdToUnconditionallyGoHome:](self, "_isTranslationPastDistanceThresholdToUnconditionallyGoHome:", v6))
  {
    self->_gestureHoldTimer = 0;
  }
  v8 = objc_alloc_init(SBSwitcherModifierEventResponse);
  objc_msgSend(v5, "locationInContainerView");
  v10 = v9;
  v12 = v11;
  -[SBContinuousExposeHomeGestureSwitcherModifier _updateInMultitaskingIfNeededWithEvent:](self, "_updateInMultitaskingIfNeededWithEvent:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    -[SBChainableModifierEventResponse addChildResponse:](v8, "addChildResponse:", v13);
  self->_lastTouchLocation.x = v10;
  self->_lastTouchLocation.y = v12;
  if (!self->_everTranslatedUpwards)
    self->_everTranslatedUpwards = v7 < 0.0;
  if (self->_startingEnvironmentMode == 1)
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v14 = (SBCompleteGestureSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();
    if (-[SBCompleteGestureSwitcherEventResponse count](v14, "count"))
    {
LABEL_15:

      goto LABEL_16;
    }
    inMultitasking = self->_inMultitasking;

    if (inMultitasking)
    {
      self->_cancelledGestureForEmptySwitcher = 1;
      v14 = objc_alloc_init(SBCompleteGestureSwitcherEventResponse);
      -[SBChainableModifierEventResponse addChildResponse:](v8, "addChildResponse:", v14);
      goto LABEL_15;
    }
  }
LABEL_16:

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
    objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuousExposeHomeGestureSwitcherModifier.m"), 434, CFSTR("Can't end a gesture that has not begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuousExposeHomeGestureSwitcherModifier.m"), 435, CFSTR("Can't end a gesture that has already ended."));

  }
  self->_gestureHasEnded = 1;
  -[SBContinuousExposeHomeGestureSwitcherModifier _updateGestureTranslationVelocityAndProgressWithEvent:](self, "_updateGestureTranslationVelocityAndProgressWithEvent:", v5);
  -[SBContinuousExposeHomeGestureSwitcherModifier _updateShouldResignActiveWithEvent:](self, "_updateShouldResignActiveWithEvent:", v5);
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
    -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
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
      -[SBContinuousExposeHomeGestureSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v9 == 4 && self->_selectedAppLayout && objc_msgSend(v24, "injectGestureVelocityForZoomDown"))
      {
        objc_msgSend(v5, "velocityInContainerView");
        v27 = v26;
        v29 = v28;
        -[SBContinuousExposeHomeGestureSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
        v31 = v30;
        -[SBContinuousExposeHomeGestureSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBContinuousExposeHomeGestureSwitcherModifier currentVelocityValueForVisibleAppLayout:key:](self, "currentVelocityValueForVisibleAppLayout:key:", self->_selectedAppLayout, CFSTR("transform"));
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

          -[SBContinuousExposeHomeGestureSwitcherModifier currentVelocityValueForVisibleAppLayout:key:](self, "currentVelocityValueForVisibleAppLayout:key:", self->_selectedAppLayout, CFSTR("position"));
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
  -[SBContinuousExposeHomeGestureSwitcherModifier _responseForUpdatingIconViewVisibility:](self, "_responseForUpdatingIconViewVisibility:", 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
    -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v61);
  -[SBContinuousExposeHomeGestureSwitcherModifier _responseForActivatingFinalDestination:](self, "_responseForActivatingFinalDestination:", v9);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v62);
  if ((v17 & 1) == 0)
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier _responseForActivatingReachabilityIfNeededWithFinalDestination:](self, "_responseForActivatingReachabilityIfNeededWithFinalDestination:", v9);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
      -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v63);

    -[SBContinuousExposeHomeGestureSwitcherModifier _responseForCancelingSystemGesturesIfNeededWithFinalDestination:](self, "_responseForCancelingSystemGesturesIfNeededWithFinalDestination:", v9);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
      -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v64);

  }
  -[SBContinuousExposeHomeGestureSwitcherModifier _responseForStudyLogDidEndGestureWithEvent:finalDestination:destinationReason:](self, "_responseForStudyLogDidEndGestureWithEvent:finalDestination:destinationReason:", v5, v9, v10);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
    -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v65);
  -[SBContinuousExposeHomeGestureSwitcherModifier _responseForSBEventGestureEndWithEvent:finalDestination:](self, "_responseForSBEventGestureEndWithEvent:finalDestination:", v5, v9);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
    -[SBChainableModifierEventResponse addChildResponse:](v11, "addChildResponse:", v66);

  return v11;
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
  -[SBContinuousExposeHomeGestureSwitcherModifier _updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:](self, "_updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:", v33);
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
  -[SBContinuousExposeHomeGestureSwitcherModifier _distanceYToInSwitcherCardScale](self, "_distanceYToInSwitcherCardScale");
  v19 = -v10 / v18;
  -[SBContinuousExposeHomeGestureSwitcherModifier _gestureProgressToMaxTranslationForTranslation:](self, "_gestureProgressToMaxTranslationForTranslation:", v10);
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
    v6 = 0.0;
    v7 = fabs(self->_translation.x) * (0.0 - v5);
    -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v9 = fmin(fmax(v5 + v7 / (v8 * 0.25), 0.0), 1.0);
    if (self->_inMultitasking)
      v10 = v9;
    else
      v10 = 0.0;
    if (BSFloatIsZero())
    {
      if (!self->_hasBecomeCoplanarSinceGestureFromSwitcherBegan)
      {
        self->_hasBecomeCoplanarSinceGestureFromSwitcherBegan = 1;
        self->_translationYWhenTriggeredMultitasking = self->_translation.y;
      }
    }
    else if (!self->_hasBecomeCoplanarSinceGestureFromSwitcherBegan)
    {
      v6 = v10;
    }
    self->_stackedProgress = v6;
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
    v5 = *(double *)&kHomeGestureNormalizedDistanceYThresholdForUnconditionalHome_1;
  v6 = kHomeGestureNormalizedDistanceYThresholdRangeForUnconditionalHome_1;
  -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  result = v5 * v7;
  if (self->_inMultitasking)
  {
    v8 = 0.1;
    if (!scrunchInitiated)
      v8 = *(double *)&v6;
    v9 = result - v8 * v7;
    result = result + v8 * v7;
    v10 = 100.0 - self->_translationYWhenTriggeredMultitasking;
    if (v9 >= v10)
      v10 = v9;
    if (result > v10)
      return v10;
  }
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id *v13;
  uint64_t v14;
  double x;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  SBAppSwitcherContinuousExposeSwitcherModifier *appSwitcherModifier;
  id *v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double *v30;
  SBAppLayout *arcSwipePulledStripAppLayout;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _QWORD v49[8];
  _QWORD v50[8];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  CGRect result;

  v56 = 0;
  v57 = &v56;
  v58 = 0x4010000000;
  v59 = &unk_1D0FA064E;
  v60 = 0u;
  v61 = 0u;
  v55.receiver = self;
  v55.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  -[SBContinuousExposeHomeGestureSwitcherModifier frameForIndex:](&v55, sel_frameForIndex_);
  *(_QWORD *)&v60 = v5;
  *((_QWORD *)&v60 + 1) = v6;
  *(_QWORD *)&v61 = v7;
  *((_QWORD *)&v61 + 1) = v8;
  if (-[SBContinuousExposeHomeGestureSwitcherModifier _isSelectedAppLayoutAtIndex:](self, "_isSelectedAppLayoutAtIndex:", a3))
  {
    UIRectGetCenter();
    -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v10 = v9;
    -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeHomeGestureSwitcherModifier _rangeForPerspectiveAngleProgressOfAppLayout:outMin:outMax:](self, "_rangeForPerspectiveAngleProgressOfAppLayout:outMin:outMax:", v12, 0.0, v10);

    v13 = (id *)MEMORY[0x1E0CEB258];
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v14 = objc_msgSend(*v13, "userInterfaceLayoutDirection");
    x = self->_translation.x;
    v16 = v57[4];
    v17 = v57[5];
    v18 = v57[6];
    v19 = v57[7];
    if (v14 == 1)
    {
      if (x >= 0.0)
      {
        CGRectGetMaxX(*(CGRect *)&v16);
        -[SBContinuousExposeHomeGestureSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
      }
      else
      {
        CGRectGetMinX(*(CGRect *)&v16);
      }
      v53 = 0u;
      v54 = 0u;
      BYTE8(v53) = 1;
      BYTE8(v54) = 1;
      BSUIConstrainValueToIntervalWithRubberBand();
    }
    else
    {
      if (x <= 0.0)
      {
        CGRectGetMinX(*(CGRect *)&v16);
        -[SBContinuousExposeHomeGestureSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
      }
      else
      {
        CGRectGetMaxX(*(CGRect *)&v16);
      }
      v51 = 0u;
      v52 = 0u;
      BYTE8(v51) = 1;
      BYTE8(v52) = 1;
      BSUIConstrainValueToIntervalWithRubberBand();
    }
    SBUnintegralizedRectCenteredAboutPoint();
    goto LABEL_18;
  }
  if (self->_inMultitasking)
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier _rubberbandedTranslationForAdjacentCards](self, "_rubberbandedTranslationForAdjacentCards");
    -[SBContinuousExposeHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:");
    v50[4] = 0x3FE3333333333333;
    v50[6] = 0x3FF0000000000000;
    v50[5] = 1;
    v50[7] = 1;
    BSUIConstrainValueToIntervalWithRubberBand();
    v21 = v20;
    -[SBAppSwitcherContinuousExposeSwitcherModifier setScaleFactor:](self->_appSwitcherModifier, "setScaleFactor:");
    -[SBAppSwitcherContinuousExposeSwitcherModifier setHorizontalEdgeSpacingScaleFactor:](self->_appSwitcherModifier, "setHorizontalEdgeSpacingScaleFactor:", 0.75 / v21);
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x2020000000;
    appSwitcherModifier = self->_appSwitcherModifier;
    v50[3] = 0;
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __63__SBContinuousExposeHomeGestureSwitcherModifier_frameForIndex___block_invoke;
    v49[3] = &unk_1E8EABA88;
    v49[4] = self;
    v49[5] = &v56;
    v49[6] = v50;
    v49[7] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appSwitcherModifier, v49);
    UIRectGetCenter();
    v23 = (id *)MEMORY[0x1E0CEB258];
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") != 1)
    {
      -[SBContinuousExposeHomeGestureSwitcherModifier scrollViewAttributes](self, "scrollViewAttributes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "contentSize");

    }
    -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    objc_msgSend(*v23, "userInterfaceLayoutDirection");
    -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    SBUnintegralizedRectCenteredAboutPoint();
    v25 = v57;
    v57[4] = v26;
    v25[5] = v27;
    v25[6] = v28;
    v25[7] = v29;
    _Block_object_dispose(v50, 8);
    v30 = (double *)v57;
  }
  else
  {
    arcSwipePulledStripAppLayout = self->_arcSwipePulledStripAppLayout;
    -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndex:", a3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(arcSwipePulledStripAppLayout) = -[SBAppLayout isEqual:](arcSwipePulledStripAppLayout, "isEqual:", v33);

    v30 = (double *)v57;
    if ((_DWORD)arcSwipePulledStripAppLayout)
    {
      UIRectGetCenter();
      -[SBContinuousExposeHomeGestureSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stripWidth");
      v36 = v35 / 1.2;

      -[SBContinuousExposeHomeGestureSwitcherModifier _rangeForPerspectiveAngleProgressOfAppLayout:outMin:outMax:](self, "_rangeForPerspectiveAngleProgressOfAppLayout:outMin:outMax:", self->_arcSwipePulledStripAppLayout, 0.0, v36);
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      BSUIConstrainValueToIntervalWithRubberBand();
      SBUnintegralizedRectCenteredAboutPoint();
LABEL_18:
      v30 = (double *)v57;
      v57[4] = v37;
      *((_QWORD *)v30 + 5) = v38;
      *((_QWORD *)v30 + 6) = v39;
      *((_QWORD *)v30 + 7) = v40;
    }
  }
  v41 = v30[4];
  v42 = v30[5];
  v43 = v30[6];
  v44 = v30[7];
  _Block_object_dispose(&v56, 8);
  v45 = v41;
  v46 = v42;
  v47 = v43;
  v48 = v44;
  result.size.height = v48;
  result.size.width = v47;
  result.origin.y = v46;
  result.origin.x = v45;
  return result;
}

void __63__SBContinuousExposeHomeGestureSwitcherModifier_frameForIndex___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1[4] + 464), "frameForIndex:", a1[7]);
  v2 = *(_QWORD **)(a1[5] + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  objc_msgSend(*(id *)(a1[4] + 464), "scrollViewAttributes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentSize");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v7;

}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double *v21;
  SBAppSwitcherContinuousExposeSwitcherModifier *appSwitcherModifier;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  int64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = v11;
  v36 = 0;
  v37 = (double *)&v36;
  v38 = 0x4010000000;
  v39 = &unk_1D0FA064E;
  v40 = 0u;
  v41 = 0u;
  if (self->_inMultitasking && (objc_msgSend(v11, "isEqual:", self->_selectedAppLayout) & 1) == 0)
  {
    appSwitcherModifier = self->_appSwitcherModifier;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __91__SBContinuousExposeHomeGestureSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
    v28[3] = &unk_1E8E9FD58;
    v30 = &v36;
    v31 = a3;
    v28[4] = self;
    v29 = v12;
    v32 = x;
    v33 = y;
    v34 = width;
    v35 = height;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appSwitcherModifier, v28);

    v14 = v37[4];
    v16 = v37[5];
    v18 = v37[6];
    v20 = v37[7];
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v27, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v12, x, y, width, height);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = v37;
    v37[4] = v13;
    v21[5] = v15;
    v21[6] = v17;
    v21[7] = v19;
  }
  _Block_object_dispose(&v36, 8);

  v23 = v14;
  v24 = v16;
  v25 = v18;
  v26 = v20;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

uint64_t __91__SBContinuousExposeHomeGestureSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "frameForLayoutRole:inAppLayout:withBounds:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
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
  double *v9;
  SBAppSwitcherContinuousExposeSwitcherModifier *appSwitcherModifier;
  uint64_t v11;
  SBAppLayout *arcSwipePulledStripAppLayout;
  void *v13;
  void *v14;
  double v15;
  double v16;
  objc_super v18;
  _QWORD v19[7];
  uint64_t v20;
  double *v21;
  uint64_t v22;
  uint64_t v23;

  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (-[SBContinuousExposeHomeGestureSwitcherModifier _isSelectedAppLayoutAtIndex:](self, "_isSelectedAppLayoutAtIndex:"))
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
    v6 = v5;
    -[SBContinuousExposeHomeGestureSwitcherModifier _rangeForPerspectiveAngleProgressOfAppLayout:outMin:outMax:](self, "_rangeForPerspectiveAngleProgressOfAppLayout:outMin:outMax:", self->_selectedAppLayout, 1.0, 0.5);
    v8 = v6 * v7;
    v9 = v21;
  }
  else
  {
    if (self->_inMultitasking)
    {
      appSwitcherModifier = self->_appSwitcherModifier;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __63__SBContinuousExposeHomeGestureSwitcherModifier_scaleForIndex___block_invoke;
      v19[3] = &unk_1E8E9FD08;
      v19[4] = self;
      v19[5] = &v20;
      v19[6] = a3;
      -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appSwitcherModifier, v19);
      goto LABEL_8;
    }
    v18.receiver = self;
    v18.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier scaleForIndex:](&v18, sel_scaleForIndex_, a3);
    *((_QWORD *)v21 + 3) = v11;
    arcSwipePulledStripAppLayout = self->_arcSwipePulledStripAppLayout;
    -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(arcSwipePulledStripAppLayout) = -[SBAppLayout isEqual:](arcSwipePulledStripAppLayout, "isEqual:", v14);

    if (!(_DWORD)arcSwipePulledStripAppLayout)
      goto LABEL_8;
    -[SBContinuousExposeHomeGestureSwitcherModifier _rangeForPerspectiveAngleProgressOfAppLayout:outMin:outMax:](self, "_rangeForPerspectiveAngleProgressOfAppLayout:outMin:outMax:", self->_arcSwipePulledStripAppLayout, 1.0, 1.6);
    v9 = v21;
    v8 = v15 * v21[3];
  }
  v9[3] = v8;
LABEL_8:
  v16 = v21[3];
  _Block_object_dispose(&v20, 8);
  return v16;
}

uint64_t __63__SBContinuousExposeHomeGestureSwitcherModifier_scaleForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1[4] + 464), "scaleForIndex:", a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v8;
  double x;
  id *v10;
  uint64_t v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", self->_selectedAppLayout))
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    -[SBContinuousExposeHomeGestureSwitcherModifier _maxPerspectiveAngleForSelectedAppLayout](self, "_maxPerspectiveAngleForSelectedAppLayout");
    BSDegreesToRadians();
    v6 = v5;
  }
  else
  {
    v6 = 0.0;
    if (!self->_inMultitasking)
    {
      v28.receiver = self;
      v28.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      -[SBContinuousExposeHomeGestureSwitcherModifier perspectiveAngleForAppLayout:](&v28, sel_perspectiveAngleForAppLayout_, v4);
      v6 = v8;
      x = self->_translation.x;
      if (x != 0.0)
      {
        v10 = (id *)MEMORY[0x1E0CEB258];
        v11 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
        v12 = -x;
        if (v11 != 1)
          v12 = x;
        if (v12 <= 0.0)
          -[SBContinuousExposeHomeGestureSwitcherModifier _previousRecentAppLayout](self, "_previousRecentAppLayout");
        else
          -[SBContinuousExposeHomeGestureSwitcherModifier _nextRecentAppLayout](self, "_nextRecentAppLayout");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_arcSwipePulledStripAppLayout, v13);

        if (-[SBAppLayout isEqual:](self->_arcSwipePulledStripAppLayout, "isEqual:", v4))
        {
          BSRadiansToDegrees();
          v15 = v14;
          -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
          v17 = fabs(self->_translation.x) - v16 / 6.0;
          v18 = 0.0;
          if (v17 > 0.0)
            v18 = fmin(fmax(v17 / (v16 - v16 / 6.0) + 0.0, 0.0), 1.0);
          v19 = objc_msgSend(*v10, "userInterfaceLayoutDirection");
          v20 = 1.0;
          if (v19 == 1)
            v20 = -1.0;
          v21 = v15 + v18 * -(v15 - v20 * 25.0);
          BSDegreesToRadians();
          v6 = v22;
          if (fabs(v21) >= fabs(v15))
            v23 = 0;
          else
            v23 = v4;
          v24 = v23;
          if ((BSEqualObjects() & 1) == 0)
          {
            -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "animationSettings");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "arcSwipeSwitcherGlancingSettings");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            -[SBContinuousExposeHomeGestureSwitcherModifier _beginAnimatingArcSwipePullingPropertyWithMode:settings:](self, "_beginAnimatingArcSwipePullingPropertyWithMode:settings:", 3, v27);
            objc_storeStrong((id *)&self->_arcSwipePulledStripAppLayout, v23);

          }
        }
      }
    }
  }

  return v6;
}

- (double)_rangeForPerspectiveAngleProgressOfAppLayout:(id)a3 outMin:(double)a4 outMax:(double)a5
{
  id v8;
  double v9;
  double v10;
  char v11;
  double v12;
  id *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;

  v8 = a3;
  -[SBContinuousExposeHomeGestureSwitcherModifier perspectiveAngleForAppLayout:](self, "perspectiveAngleForAppLayout:", v8);
  BSRadiansToDegrees();
  v10 = v9;
  v11 = objc_msgSend(v8, "isEqual:", self->_selectedAppLayout);
  v12 = 0.0;
  v13 = (id *)MEMORY[0x1E0CEB258];
  if ((v11 & 1) == 0)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    -[SBContinuousExposeHomeGestureSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stripTiltAngle");
    BSRadiansToDegrees();
    v12 = v15;

  }
  if (objc_msgSend(v8, "isEqual:", self->_selectedAppLayout))
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier _maxPerspectiveAngleForSelectedAppLayout](self, "_maxPerspectiveAngleForSelectedAppLayout");
  }
  else
  {
    v17 = objc_msgSend(*v13, "userInterfaceLayoutDirection");
    v16 = 25.0;
    if (v17 == 1)
      v16 = -25.0;
  }
  v18 = (a5 - a4) * (v10 - v12) / (v16 - v12) + a4;

  return v18;
}

- (double)_maxPerspectiveAngleForSelectedAppLayout
{
  id *v3;
  uint64_t v4;
  double x;
  uint64_t v6;
  double v7;
  BOOL v8;
  double result;

  v3 = (id *)MEMORY[0x1E0CEB258];
  v4 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  x = self->_translation.x;
  v6 = objc_msgSend(*v3, "userInterfaceLayoutDirection");
  v7 = -x;
  if (v6 != 1)
    v7 = x;
  v8 = v7 <= 0.0;
  result = 45.0;
  if (v8)
    result = 23.0;
  if (v4 == 1)
    return -result;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double *v9;
  SBAppSwitcherContinuousExposeSwitcherModifier *appSwitcherModifier;
  double v11;
  double v12;
  objc_super v13;
  _QWORD v14[7];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  CGPoint result;

  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x3010000000;
  v19 = 0;
  v20 = 0;
  v18 = &unk_1D0FA064E;
  if (self->_inMultitasking
    && !-[SBContinuousExposeHomeGestureSwitcherModifier _isSelectedAppLayoutAtIndex:](self, "_isSelectedAppLayoutAtIndex:", a3))
  {
    appSwitcherModifier = self->_appSwitcherModifier;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__SBContinuousExposeHomeGestureSwitcherModifier_anchorPointForIndex___block_invoke;
    v14[3] = &unk_1E8E9FD08;
    v14[4] = self;
    v14[5] = &v15;
    v14[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appSwitcherModifier, v14);
    v6 = v16[4];
    v8 = v16[5];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier anchorPointForIndex:](&v13, sel_anchorPointForIndex_, a3);
    v6 = v5;
    v8 = v7;
    v9 = v16;
    v16[4] = v5;
    v9[5] = v7;
  }
  _Block_object_dispose(&v15, 8);
  v11 = v6;
  v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

uint64_t __69__SBContinuousExposeHomeGestureSwitcherModifier_anchorPointForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1[4] + 464), "anchorPointForIndex:", a1[6]);
  v3 = *(_QWORD *)(a1[5] + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  objc_super v11;

  -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBContinuousExposeHomeGestureSwitcherModifier selectedAppLayout](self, "selectedAppLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isOrContainsAppLayout:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    v9 = -[SBContinuousExposeHomeGestureSwitcherModifier shouldPinLayoutRolesToSpace:](&v11, sel_shouldPinLayoutRolesToSpace_, a3);
  }

  return v9;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  objc_super v11;

  -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBContinuousExposeHomeGestureSwitcherModifier selectedAppLayout](self, "selectedAppLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isOrContainsAppLayout:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = 1;
  }
  else if (self->_gestureHasEnded || !self->_inMultitasking)
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    v9 = -[SBContinuousExposeHomeGestureSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v11, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double *v12;
  SBAppSwitcherContinuousExposeSwitcherModifier *appSwitcherModifier;
  double v14;
  double v15;
  objc_super v16;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  double v20;
  double v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v22 = 0;
  v23 = (double *)&v22;
  v24 = 0x3010000000;
  v26 = 0;
  v27 = 0;
  v25 = &unk_1D0FA064E;
  if (self->_inMultitasking && !-[SBAppLayout isEqual:](self->_selectedAppLayout, "isEqual:", v7))
  {
    appSwitcherModifier = self->_appSwitcherModifier;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __100__SBContinuousExposeHomeGestureSwitcherModifier_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout___block_invoke;
    v17[3] = &unk_1E8E9FDA8;
    v19 = &v22;
    v17[4] = self;
    v20 = x;
    v21 = y;
    v18 = v7;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appSwitcherModifier, v17);

    v9 = v23[4];
    v11 = v23[5];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v16, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v7, x, y);
    v9 = v8;
    v11 = v10;
    v12 = v23;
    v23[4] = v8;
    v12[5] = v10;
  }
  _Block_object_dispose(&v22, 8);

  v14 = v9;
  v15 = v11;
  result.y = v15;
  result.x = v14;
  return result;
}

uint64_t __100__SBContinuousExposeHomeGestureSwitcherModifier_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (id)continuousExposeIdentifiersInSwitcher
{
  SBAppSwitcherContinuousExposeSwitcherModifier *appSwitcherModifier;
  id v4;
  _QWORD v6[6];
  objc_super v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__99;
  v12 = __Block_byref_object_dispose__99;
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  -[SBContinuousExposeHomeGestureSwitcherModifier continuousExposeIdentifiersInSwitcher](&v7, sel_continuousExposeIdentifiersInSwitcher);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_inMultitasking && self->_selectedAppLayout)
  {
    appSwitcherModifier = self->_appSwitcherModifier;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86__SBContinuousExposeHomeGestureSwitcherModifier_continuousExposeIdentifiersInSwitcher__block_invoke;
    v6[3] = &unk_1E8E9DFA0;
    v6[4] = self;
    v6[5] = &v8;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appSwitcherModifier, v6);
  }
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __86__SBContinuousExposeHomeGestureSwitcherModifier_continuousExposeIdentifiersInSwitcher__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[58];
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v2, "continuousExposeIdentifiersInStrip");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustedContinuousExposeIdentifiersInSwitcherFromPreviousIdentifiersInSwitcher:identifiersInStrip:", v4, v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  -[SBContinuousExposeHomeGestureSwitcherModifier appLayoutsForContinuousExposeIdentifier:](&v11, sel_appLayoutsForContinuousExposeIdentifier_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_inMultitasking && (unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    -[SBAppLayout continuousExposeIdentifier](self->_selectedAppLayout, "continuousExposeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v4);

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", self->_selectedAppLayout);
      objc_msgSend(v9, "addObject:", self->_selectedAppLayout);

      v6 = v9;
    }
  }

  return v6;
}

- (id)topMostLayoutElements
{
  SBAppSwitcherContinuousExposeSwitcherModifier *appSwitcherModifier;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  SBAppLayout *selectedAppLayout;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__99;
  v29 = __Block_byref_object_dispose__99;
  v30 = 0;
  if (-[SBContinuousExposeHomeGestureSwitcherModifier isShowingOrAnimatingCardsForFlyIn](self, "isShowingOrAnimatingCardsForFlyIn"))
  {
    appSwitcherModifier = self->_appSwitcherModifier;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __70__SBContinuousExposeHomeGestureSwitcherModifier_topMostLayoutElements__block_invoke;
    v24[3] = &unk_1E8E9DFA0;
    v24[4] = self;
    v24[5] = &v25;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appSwitcherModifier, v24);
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    v23.receiver = self;
    v23.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier topMostLayoutElements](&v23, sel_topMostLayoutElements);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v26[5];
    v26[5] = v6;

  }
  if (self->_arcSwipePulledStripAppLayout || self->_arcSwipePullingChangedProperty)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = (id)v26[5];
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v13 = objc_opt_class();
          SBSafeCast(v13, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14 && objc_msgSend(v14, "isEqual:", self->_arcSwipePulledStripAppLayout, (_QWORD)v19))
          {
            objc_msgSend((id)v26[5], "removeObject:", v15);
            objc_msgSend((id)v26[5], "insertObject:atIndex:", v15, 0);

            goto LABEL_17;
          }

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_17:

  }
  selectedAppLayout = self->_selectedAppLayout;
  if (selectedAppLayout)
    objc_msgSend((id)v26[5], "insertObject:atIndex:", selectedAppLayout, 0);
  v17 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v17;
}

void __70__SBContinuousExposeHomeGestureSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "topMostLayoutElements");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SBAppSwitcherContinuousExposeSwitcherModifier *appSwitcherModifier;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  _QWORD v28[7];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  UIRectCornerRadii result;

  v29 = 0;
  v30 = &v29;
  v31 = 0x4010000000;
  v32 = &unk_1D0FA064E;
  v33 = 0u;
  v34 = 0u;
  if (-[SBContinuousExposeHomeGestureSwitcherModifier _isSelectedAppLayoutAtIndex:](self, "_isSelectedAppLayoutAtIndex:"))
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeHomeGestureSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeHomeGestureSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
    objc_msgSend(v6, "stageCornerRadii");
    objc_msgSend(v5, "chamoisSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "switcherCornerRadius");

    if (self->_startingEnvironmentMode != 1
      && -[SBContinuousExposeHomeGestureSwitcherModifier appLayoutContainsAnUnoccludedMaximizedDisplayItem:](self, "appLayoutContainsAnUnoccludedMaximizedDisplayItem:", self->_selectedAppLayout))
    {
      BSFloatIsZero();
    }
    -[SBContinuousExposeHomeGestureSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
    SBRectCornerRadiiForRadius();
    v8 = v30;
    v30[4] = v9;
    v8[5] = v10;
    v8[6] = v11;
    v8[7] = v12;

  }
  else if (self->_inMultitasking)
  {
    appSwitcherModifier = self->_appSwitcherModifier;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __69__SBContinuousExposeHomeGestureSwitcherModifier_cornerRadiiForIndex___block_invoke;
    v28[3] = &unk_1E8E9FD08;
    v28[4] = self;
    v28[5] = &v29;
    v28[6] = a3;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", appSwitcherModifier, v28);
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier cornerRadiiForIndex:](&v27, sel_cornerRadiiForIndex_, a3);
    v14 = v30;
    v30[4] = v15;
    v14[5] = v16;
    v14[6] = v17;
    v14[7] = v18;
  }
  v19 = *((double *)v30 + 4);
  v20 = *((double *)v30 + 5);
  v21 = *((double *)v30 + 6);
  v22 = *((double *)v30 + 7);
  _Block_object_dispose(&v29, 8);
  v23 = v19;
  v24 = v20;
  v25 = v21;
  v26 = v22;
  result.topRight = v26;
  result.bottomRight = v25;
  result.bottomLeft = v24;
  result.topLeft = v23;
  return result;
}

uint64_t __69__SBContinuousExposeHomeGestureSwitcherModifier_cornerRadiiForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 464), "cornerRadiiForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 5;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v10;
  SBSwitcherWallpaperGradientAttributes result;

  if (-[SBContinuousExposeHomeGestureSwitcherModifier _isSelectedAppLayoutAtIndex:](self, "_isSelectedAppLayoutAtIndex:")|| (v6 = 0.0, v5 = 0.0, !self->_inMultitasking))
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", self->_arcSwipePulledStripAppLayout);

    v6 = 0.0;
    v5 = 0.0;
    if ((v9 & 1) == 0)
    {
      v10.receiver = self;
      v10.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      -[SBContinuousExposeHomeGestureSwitcherModifier wallpaperGradientAttributesForIndex:](&v10, sel_wallpaperGradientAttributesForIndex_, a3, 0.0, 0.0);
    }
  }
  result.trailingAlpha = v6;
  result.leadingAlpha = v5;
  return result;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  objc_super v10;

  v6 = a4;
  if ((objc_msgSend(v6, "isEqual:", self->_selectedAppLayout) & 1) != 0 || (v7 = 0.0, !self->_inMultitasking))
  {
    v7 = 0.0;
    if ((objc_msgSend(v6, "isEqual:", self->_arcSwipePulledStripAppLayout) & 1) == 0)
    {
      v10.receiver = self;
      v10.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      -[SBContinuousExposeHomeGestureSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v10, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
      v7 = v8;
      if (BSFloatIsZero())
        v7 = v7 * self->_stackedProgress + 0.0;
    }
  }

  return v7;
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
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  double v40;
  CGAffineTransform v41;
  objc_super v42;
  CGRect v43;

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
    v42.receiver = self;
    v42.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier visibleAppLayouts](&v42, sel_visibleAppLayouts);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if (self->_selectedAppLayout)
      objc_msgSend(v6, "addObject:");
    v7 = -[SBContinuousExposeHomeGestureSwitcherModifier _selectedAppLayoutIndex](self, "_selectedAppLayoutIndex");
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = v7;
    -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((self->_shouldResignActive || self->_inMultitasking || self->_startingEnvironmentMode == 2)
      && objc_msgSend(v9, "count"))
    {
      if (self->_inMultitasking || (v11 = self->_startingEnvironmentMode != 1, (BSFloatIsZero() & 1) == 0))
      {
        -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
        v14 = v13;
        v40 = v13;
        -[SBContinuousExposeHomeGestureSwitcherModifier _rubberbandedTranslationForAdjacentCards](self, "_rubberbandedTranslationForAdjacentCards");
        -[SBContinuousExposeHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:");
        v16 = v15;
        -[SBContinuousExposeHomeGestureSwitcherModifier _coplanarSpacing](self, "_coplanarSpacing");
        v18 = v16 * v17;
        v19 = v16 * v17 + v14 * v16;
        -[SBContinuousExposeHomeGestureSwitcherModifier frameForIndex:](self, "frameForIndex:", v8);
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        UIRectGetCenter();
        -[SBContinuousExposeHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
        CGAffineTransformMakeScale(&v41, v28, v28);
        v43.origin.x = v21;
        v43.origin.y = v23;
        v43.size.width = v25;
        v43.size.height = v27;
        CGRectApplyAffineTransform(v43, &v41);
        SBUnintegralizedRectCenteredAboutPoint();
        v30 = v29 - v18;
        v32 = v40 - (v29 + v31) - v18;
        if (-[SBContinuousExposeHomeGestureSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
          v33 = v32;
        else
          v33 = v30;
        v11 = vcvtpd_s64_f64(v33 / v19);
        if (-[SBContinuousExposeHomeGestureSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
          v34 = v30;
        else
          v34 = v32;
        v12 = vcvtpd_s64_f64(v34 / v19);
        if (v12 <= 1)
          v12 = 1;
        if (v11 <= 1)
          v11 = 1;
      }
      else
      {
        v12 = 1;
      }
      v35 = (v8 - v12) & ~((uint64_t)(v8 - v12) >> 63);
      v36 = v11 + v8;
      v37 = objc_msgSend(v10, "count");
      if (v36 >= v37 - 1)
        v36 = v37 - 1;
      if (v35 < objc_msgSend(v10, "count") && (v36 & 0x8000000000000000) == 0)
      {
        objc_msgSend(v10, "subarrayWithRange:", v35, v36 - v35 + 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v38);

      }
    }

  }
  return v6;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  return 0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v12, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "switcherLayoutElementType"))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v5, "layoutSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeHomeGestureSwitcherModifier _layoutSettingsForAppLayout:layoutSettings:](self, "_layoutSettingsForAppLayout:layoutSettings:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutSettings:", v8);

    objc_msgSend(v6, "opacitySettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOpacitySettings:", v9);

    -[SBContinuousExposeHomeGestureSwitcherModifier _cornerRadiusSettings](self, "_cornerRadiusSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadiusSettings:", v10);

    v5 = v6;
  }

  return v5;
}

- (id)_cornerRadiusSettings
{
  void *v2;
  void *v3;
  void *v4;

  -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
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
  id v7;
  id v8;
  void *v9;
  void *v10;
  CAFrameRateRange v12;

  v6 = a3;
  v7 = a4;
  if (-[SBAppLayout isEqual:](self->_selectedAppLayout, "isEqual:", v6))
  {
    v8 = v7;
  }
  else if (-[SBContinuousExposeHomeGestureSwitcherModifier isShowingOrAnimatingCardsForFlyIn](self, "isShowingOrAnimatingCardsForFlyIn")|| self->_arcSwipePullingChangedProperty|| objc_msgSend(v6, "isEqual:", self->_arcSwipePulledStripAppLayout))
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arcSwipeSwitcherGlancingSettings");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DA9E08]);
    objc_msgSend(v8, "setDefaultValues");
    objc_msgSend(v8, "setTrackingResponse:", 0.0);
    v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v8, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v12.minimum, *(double *)&v12.maximum, *(double *)&v12.preferred);
  }

  return v8;
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
    -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds", a3.x, a3.y);
    v8 = self->_initialCentroid.y;
    if (v8 < v7 * 0.5)
      v8 = v7 * 0.5;
    v9 = (fabs(x) / (v6 * -0.8) + 1.0) * (y * (v7 / v8));
  }
  else
  {
    v9 = a3.y;
  }
  -[SBContinuousExposeHomeGestureSwitcherModifier _gestureProgressToMaxTranslationForTranslation:](self, "_gestureProgressToMaxTranslationForTranslation:", v9);
  v11 = v10;
  startingEnvironmentMode = self->_startingEnvironmentMode;
  if (startingEnvironmentMode == 1)
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
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
    -[SBContinuousExposeHomeGestureSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
    v18 = progressToInSwitcherCardScale * (v17 + -1.0) + 1.0;
  }
  else
  {
    v19 = 1.0;
    if (v15 == 2)
      -[SBContinuousExposeHomeGestureSwitcherModifier _switcherCardScale](self, "_switcherCardScale", 1.0);
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
      -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "offscreenCardScaleForFlyIn");

    }
    BSUIConstrainValueToIntervalWithRubberBand();
    return v24;
  }
  return v18;
}

- (double)_scaleForOffscreenAdjacentCardsForFlyIn
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "offscreenCardScaleForFlyIn");
  v5 = v4;
  -[SBContinuousExposeHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
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
  double translationYWhenTriggeredMultitasking;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  x = self->_translation.x;
  y = self->_translation.y;
  if (self->_startingEnvironmentMode != 1)
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier unconditionalDistanceThresholdForHome](self, "unconditionalDistanceThresholdForHome");
    translationYWhenTriggeredMultitasking = self->_translationYWhenTriggeredMultitasking;
    if (translationYWhenTriggeredMultitasking > 100.0 - v5)
      translationYWhenTriggeredMultitasking = 100.0 - v5;
    v7 = y;
    if (y < translationYWhenTriggeredMultitasking)
      v7 = translationYWhenTriggeredMultitasking
         + (1.0
          - ((translationYWhenTriggeredMultitasking - y) / (v5 + translationYWhenTriggeredMultitasking) * 2.0 + -1.0)
          * ((translationYWhenTriggeredMultitasking - y) / (v5 + translationYWhenTriggeredMultitasking) * 2.0 + -1.0))
         * -0.25
         * (v5 + translationYWhenTriggeredMultitasking);
    -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    y = v7 + (y - v7) * fmin(fmax(fabs(x) / (v8 * 0.25) + 0.0, 0.0), 1.0);
  }
  v9 = x;
  v10 = y;
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)isHomeAffordanceSupportedForAppLayout:(id)a3
{
  return 0;
}

- (id)visibleHomeAffordanceLayoutElements
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  double stackedProgress;
  double v4;
  objc_super v6;

  stackedProgress = self->_stackedProgress;
  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  -[SBContinuousExposeHomeGestureSwitcherModifier wallpaperOverlayAlphaForIndex:](&v6, sel_wallpaperOverlayAlphaForIndex_, a3);
  return stackedProgress * v4 + 0.0;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  double stackedProgress;
  double v4;
  objc_super v6;

  stackedProgress = self->_stackedProgress;
  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  -[SBContinuousExposeHomeGestureSwitcherModifier lighteningAlphaForIndex:](&v6, sel_lighteningAlphaForIndex_, a3);
  return stackedProgress * v4 + 0.0;
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
    v5.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v5, sel_shadowOpacityForLayoutRole_atIndex_, a3, a4, 1.0);
  }
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
      v11.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      -[SBContinuousExposeHomeGestureSwitcherModifier homeScreenAlpha](&v11, sel_homeScreenAlpha);
      return result;
    }
  }
  else if (!-[SBContinuousExposeHomeGestureSwitcherModifier homeScreenHasOpenFolder](self, "homeScreenHasOpenFolder")|| -[SBContinuousExposeHomeGestureSwitcherModifier homeScreenBackdropBlurType](self, "homeScreenBackdropBlurType") == 3)
  {
    progressToMaxTranslation = self->_progressToMaxTranslation;
    toHomeScreenAlpha = self->_toHomeScreenAlpha;
    v10.receiver = self;
    v10.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier homeScreenAlpha](&v10, sel_homeScreenAlpha);
    v7 = progressToMaxTranslation * (toHomeScreenAlpha - v6);
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier homeScreenAlpha](&v9, sel_homeScreenAlpha);
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
  v9.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  -[SBContinuousExposeHomeGestureSwitcherModifier homeScreenScale](&v9, sel_homeScreenScale);
  if (self->_startingEnvironmentMode == 1)
  {
    y = self->_translation.y;
    -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
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
  v9.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
  -[SBContinuousExposeHomeGestureSwitcherModifier wallpaperScale](&v9, sel_wallpaperScale);
  v4 = v3;
  if (self->_startingEnvironmentMode == 1 && self->_inMultitasking)
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
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
        v12.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
        -[SBContinuousExposeHomeGestureSwitcherModifier homeScreenDimmingAlpha](&v12, sel_homeScreenDimmingAlpha, v9.receiver, v9.super_class);
      }
    }
    else
    {
      progressToMaxTranslation = self->_progressToMaxTranslation;
      toHomeScreenDimmingAlpha = self->_toHomeScreenDimmingAlpha;
      v11.receiver = self;
      v11.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      -[SBContinuousExposeHomeGestureSwitcherModifier homeScreenDimmingAlpha](&v11, sel_homeScreenDimmingAlpha);
      v7 = progressToMaxTranslation * (toHomeScreenDimmingAlpha - v6);
      v10.receiver = self;
      v10.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      -[SBContinuousExposeHomeGestureSwitcherModifier homeScreenDimmingAlpha](&v10, sel_homeScreenDimmingAlpha);
      result = v7 + v8;
      if (result < 0.2)
        return 0.2;
    }
  }
  else
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier homeScreenDimmingAlpha](&v9, sel_homeScreenDimmingAlpha, self, SBContinuousExposeHomeGestureSwitcherModifier);
  }
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  if (self->_startingEnvironmentMode == 1
    || !-[SBContinuousExposeHomeGestureSwitcherModifier homeScreenHasOpenFolder](self, "homeScreenHasOpenFolder")|| SBFEffectiveHomeButtonType() == 2)
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
  void *v10;
  void *v11;
  int64_t startingEnvironmentMode;
  objc_super v14;
  objc_super v15;
  objc_super v16;

  if (self->_startingEnvironmentMode == 1)
  {
    if (self->_inMultitasking)
    {
      toHomeScreenBlurProgress = self->_toHomeScreenBlurProgress;
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      -[SBContinuousExposeHomeGestureSwitcherModifier homeScreenBackdropBlurProgress](&v16, sel_homeScreenBackdropBlurProgress);
      toHomeScreenBlurProgress = v9;
    }
  }
  else
  {
    if (-[SBContinuousExposeHomeGestureSwitcherModifier homeScreenHasOpenFolder](self, "homeScreenHasOpenFolder")&& -[SBContinuousExposeHomeGestureSwitcherModifier homeScreenBackdropBlurType](self, "homeScreenBackdropBlurType") != 3)
    {
      toHomeScreenBlurProgress = self->_toHomeScreenBlurProgress;
    }
    else
    {
      progressToMaxTranslation = self->_progressToMaxTranslation;
      v5 = self->_toHomeScreenBlurProgress;
      v15.receiver = self;
      v15.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      -[SBContinuousExposeHomeGestureSwitcherModifier homeScreenBackdropBlurProgress](&v15, sel_homeScreenBackdropBlurProgress);
      v7 = progressToMaxTranslation * (v5 - v6);
      v14.receiver = self;
      v14.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
      -[SBContinuousExposeHomeGestureSwitcherModifier homeScreenBackdropBlurProgress](&v14, sel_homeScreenBackdropBlurProgress);
      toHomeScreenBlurProgress = v7 + v8;
    }
    -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "chamoisSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "blurWallpaperInApps"))
    {
      startingEnvironmentMode = self->_startingEnvironmentMode;

      if (startingEnvironmentMode == 3 && toHomeScreenBlurProgress < 0.5)
        toHomeScreenBlurProgress = 0.5;
    }
    else
    {

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
      -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
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
    v5.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    return -[SBContinuousExposeHomeGestureSwitcherModifier isContainerStatusBarVisible](&v5, sel_isContainerStatusBarVisible);
  }
  return v3;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return !-[SBContinuousExposeHomeGestureSwitcherModifier _shouldResignActiveBasedOnCardScale](self, "_shouldResignActiveBasedOnCardScale", a3);
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

  -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
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
    -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
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

  -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_selectedAppLayout)
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
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
    -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dictionaryWithObject:forKey:", v5, &unk_1E91D1E68);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier appLayoutsToResignActive](&v21, sel_appLayoutsToResignActive);
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

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v9, &unk_1E91D1E68);
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
    v4.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    -[SBContinuousExposeHomeGestureSwitcherModifier keyboardSuppressionMode](&v4, sel_keyboardSuppressionMode);
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
    v5.super_class = (Class)SBContinuousExposeHomeGestureSwitcherModifier;
    v3 = -[SBContinuousExposeHomeGestureSwitcherModifier asyncRenderingAttributesForAppLayout:](&v5, sel_asyncRenderingAttributesForAppLayout_, a3) & 1;
  }
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(v3, 1);
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
  SBContinuousExposeHomeGestureSwitcherModifier *v13;

  -[SBGestureSwitcherModifier descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", &stru_1E8EC7EC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendSuper");
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __65__SBContinuousExposeHomeGestureSwitcherModifier_debugDescription__block_invoke;
  v11 = &unk_1E8E9E820;
  v12 = v3;
  v13 = self;
  v5 = v3;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, CFSTR("\t"), &v8);
  objc_msgSend(v5, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

id __65__SBContinuousExposeHomeGestureSwitcherModifier_debugDescription__block_invoke(uint64_t a1)
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
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;

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
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("touchOffset"), *(double *)(v4 + 144), *(double *)(v4 + 152));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 504), CFSTR("arcSwipePulledStripAppLayout"), 1);
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("translationYWhenTriggeredCardFlyIn"), *(double *)(*(_QWORD *)(a1 + 40) + 160));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 168), CFSTR("hasBecomeCoplanarSinceGestureFromSwitcherBegan"));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("gestureLiftOffVelocity"), *(double *)(*(_QWORD *)(a1 + 40) + 176), *(double *)(*(_QWORD *)(a1 + 40) + 184));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("gestureLiftOffTranslation"), *(double *)(*(_QWORD *)(a1 + 40) + 192), *(double *)(*(_QWORD *)(a1 + 40) + 200));
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("translationAdjustmentForStartingFromSwitcher"), *(double *)(*(_QWORD *)(a1 + 40) + 208), *(double *)(*(_QWORD *)(a1 + 40) + 216));
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("translationAdjustmentForStartingFromHomeScreen"), *(double *)(*(_QWORD *)(a1 + 40) + 224), *(double *)(*(_QWORD *)(a1 + 40) + 232));
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("progressToInSwitcherCardScale"), *(double *)(*(_QWORD *)(a1 + 40) + 240));
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("progressToMaxTranslation"), *(double *)(*(_QWORD *)(a1 + 40) + 248));
  v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("translation"), *(double *)(*(_QWORD *)(a1 + 40) + 256), *(double *)(*(_QWORD *)(a1 + 40) + 264));
  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("velocity"), *(double *)(*(_QWORD *)(a1 + 40) + 272), *(double *)(*(_QWORD *)(a1 + 40) + 280));
  v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("stackedProgress"), *(double *)(*(_QWORD *)(a1 + 40) + 288));
  v21 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("initialCentroid"), *(double *)(*(_QWORD *)(a1 + 40) + 296), *(double *)(*(_QWORD *)(a1 + 40) + 304));
  v22 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("centroid"), *(double *)(*(_QWORD *)(a1 + 40) + 312), *(double *)(*(_QWORD *)(a1 + 40) + 320));
  v23 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("absoluteScale"), *(double *)(*(_QWORD *)(a1 + 40) + 344));
  v24 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("translationWithoutScale"), *(double *)(*(_QWORD *)(a1 + 40) + 352), *(double *)(*(_QWORD *)(a1 + 40) + 360));
  v25 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("lastTouchTimestamp"), *(double *)(*(_QWORD *)(a1 + 40) + 376));
  v26 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 384), CFSTR("gestureHoldTimer"));
  v27 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("initialTouchLocation"), *(double *)(*(_QWORD *)(a1 + 40) + 392), *(double *)(*(_QWORD *)(a1 + 40) + 400));
  v28 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("lastTouchLocation"), *(double *)(*(_QWORD *)(a1 + 40) + 408), *(double *)(*(_QWORD *)(a1 + 40) + 416));
  v29 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 424), CFSTR("everTranslatedUpwards"));
  v30 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 425), CFSTR("cancelledGestureForEmptySwitcher"));
  v31 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("toHomeScreenAlpha"), *(double *)(*(_QWORD *)(a1 + 40) + 432));
  v32 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("toHomeScreenBlurProgress"), *(double *)(*(_QWORD *)(a1 + 40) + 440));
  v33 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("toHomeScreenDimmingAlpha"), *(double *)(*(_QWORD *)(a1 + 40) + 448));
  v34 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 456), CFSTR("didWarmupFlyInHaptic"));
  v35 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 457), CFSTR("didPlayFlyInHaptic"));
  v36 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 496), CFSTR("selectedAppLayout"));
  v37 = *(void **)(a1 + 32);
  SBStringForUnlockedEnvironmentMode(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 512));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "appendString:withName:", v38, CFSTR("startingEnvironmentMode"));

  v39 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 520), CFSTR("scrunchInitiated"));
  v40 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 521), CFSTR("continuingGesture"));
  v41 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 522), CFSTR("lastGestureWasAnArcSwipe"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 523), CFSTR("shouldResignActive"));
}

- (void)_updateShouldResignActiveWithEvent:(id)a3
{
  BOOL v4;

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
      if (-[SBHomeGestureDockSwitcherModifier isCurrentlyTrackingDock](self->_dockModifier, "isCurrentlyTrackingDock"))
        v4 = -[SBContinuousExposeHomeGestureSwitcherModifier _shouldResignActiveBasedOnCardScale](self, "_shouldResignActiveBasedOnCardScale");
      else
        v4 = 1;
      self->_shouldResignActive = v4;
    }
  }
}

- (BOOL)_shouldResignActiveBasedOnCardScale
{
  double v4;
  double v5;

  -[SBContinuousExposeHomeGestureSwitcherModifier _rubberbandedTranslationForAdjacentCards](self, "_rubberbandedTranslationForAdjacentCards");
  -[SBContinuousExposeHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:");
  if ((BSFloatLessThanOrEqualToFloat() & 1) != 0)
    return 1;
  v4 = fabs(self->_translation.x);
  -[SBContinuousExposeHomeGestureSwitcherModifier _coplanarSpacing](self, "_coplanarSpacing");
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
      -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
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
  SBAppLayout *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SBMutableSwitcherTransitionRequest *v8;
  SBPerformTransitionSwitcherEventResponse *v9;

  switch(a3)
  {
    case 0:
      v4 = self->_selectedAppLayout;
      v5 = -[SBContinuousExposeHomeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
      break;
    case 1:
      -[SBContinuousExposeHomeGestureSwitcherModifier _previousRecentAppLayout](self, "_previousRecentAppLayout");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      -[SBContinuousExposeHomeGestureSwitcherModifier _nextRecentAppLayout](self, "_nextRecentAppLayout");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      v5 = -[SBContinuousExposeHomeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
      v4 = 0;
      v7 = 2;
      goto LABEL_10;
    case 4:
      +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v4 = (SBAppLayout *)v6;
      v5 = 0;
      break;
    default:
      v5 = 0;
      v4 = 0;
      break;
  }
  v7 = 0;
LABEL_10:
  v8 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
  -[SBSwitcherTransitionRequest setAppLayout:](v8, "setAppLayout:", v4);
  -[SBSwitcherTransitionRequest setUnlockedEnvironmentMode:](v8, "setUnlockedEnvironmentMode:", v7);
  -[SBSwitcherTransitionRequest setPreferredInterfaceOrientation:](v8, "setPreferredInterfaceOrientation:", v5);
  v9 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v8, 1);

  return v9;
}

- (id)_nextRecentAppLayout
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_selectedAppLayout)
  {
    objc_msgSend(v3, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v10 = (void *)v9;
    goto LABEL_11;
  }
  v5 = objc_msgSend(v3, "indexOfObject:");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    if (objc_msgSend(v4, "count"))
    {
      v7 = objc_msgSend(v4, "count");
      if (v6 + 1 < v7 - 1)
        v8 = v6 + 1;
      else
        v8 = v7 - 1;
      objc_msgSend(v4, "objectAtIndex:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)_previousRecentAppLayout
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", self->_selectedAppLayout);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (v5 = v4, !objc_msgSend(v3, "count")))
  {
    v7 = 0;
  }
  else
  {
    if (v5 <= 1)
      v6 = 1;
    else
      v6 = v5;
    objc_msgSend(v3, "objectAtIndex:", v6 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
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
  if (-[SBContinuousExposeHomeGestureSwitcherModifier isStudyLogEnabled](self, "isStudyLogEnabled"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
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
  if (-[SBContinuousExposeHomeGestureSwitcherModifier isStudyLogEnabled](self, "isStudyLogEnabled"))
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SBContinuousExposeHomeGestureSwitcherModifier _hasPausedEnoughForFlyIn](self, "_hasPausedEnoughForFlyIn"));
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SBContinuousExposeHomeGestureSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"));
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
    -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = -[SBContinuousExposeHomeGestureSwitcherModifier isLocationInSafeArea:](self, "isLocationInSafeArea:", self->_initialTouchLocation.x, self->_initialTouchLocation.y);
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
    && -[SBContinuousExposeHomeGestureSwitcherModifier isSystemAssistantExperienceEnabled](self, "isSystemAssistantExperienceEnabled"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E91D1E80, &unk_1E91D1E98, 0);
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
  SBSwitcherModifierEventResponse *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  int inMultitasking;
  _BOOL4 v10;
  SBHapticSwitcherEventResponse *v11;
  BOOL v12;
  SBHapticSwitcherEventResponse *v13;
  int64_t v14;
  int v15;
  BOOL v16;
  SBHapticSwitcherEventResponse *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SBScrollToAppLayoutSwitcherEventResponse *v26;

  v4 = a3;
  v5 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v6 = -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination");
  -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  inMultitasking = self->_inMultitasking;
  v10 = inMultitasking;
  if (v6 == 3)
  {
    if (!self->_didWarmupFlyInHaptic)
    {
      v11 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 0, 0);
      -[SBChainableModifierEventResponse addChildResponse:](v5, "addChildResponse:", v11);
      self->_didWarmupFlyInHaptic = 1;

    }
    if (inMultitasking)
    {
      v12 = self->_didPlayFlyInHaptic || v8 == 0;
      if (!v12
        && fabs(self->_velocity.x) < *(double *)&kPauseVelocityThresholdForAppSwitcher_1
        && fabs(self->_velocity.y) < *(double *)&kPauseVelocityThresholdForAppSwitcher_1)
      {
        v13 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 0, 1);
        -[SBHapticSwitcherEventResponse setHidEventSenderID:](v13, "setHidEventSenderID:", objc_msgSend(v4, "hidEventSenderID"));
        -[SBChainableModifierEventResponse addChildResponse:](v5, "addChildResponse:", v13);
        self->_didPlayFlyInHaptic = 1;

      }
    }
  }
  v14 = -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination");
  v15 = v14 == 3;
  self->_inMultitasking = v15;
  if (inMultitasking != v15)
  {
    if (v14 == 3)
    {
      self->_translationYWhenTriggeredMultitasking = self->_translation.y;
    }
    else
    {
      self->_didPlayFlyInHaptic = 0;
      if (!self->_inMultitasking)
      {
LABEL_22:
        -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "animationSettings");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "arcSwipeSwitcherGlancingSettings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBContinuousExposeHomeGestureSwitcherModifier _beginAnimatingMultitaskingPropertyWithMode:settings:](self, "_beginAnimatingMultitaskingPropertyWithMode:settings:", 3, v20);
        v10 = self->_inMultitasking;
        goto LABEL_23;
      }
    }
    v16 = self->_didPlayFlyInHaptic || v8 == 0;
    if (!v16 && fabs(self->_velocity.x) < *(double *)&kVelocityXThresholdForUnconditionalArcSwipe_1)
    {
      v17 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 0, 1);
      -[SBHapticSwitcherEventResponse setHidEventSenderID:](v17, "setHidEventSenderID:", objc_msgSend(v4, "hidEventSenderID"));
      -[SBChainableModifierEventResponse addChildResponse:](v5, "addChildResponse:", v17);
      self->_didPlayFlyInHaptic = 1;

    }
    goto LABEL_22;
  }
LABEL_23:
  if (inMultitasking)
    v21 = 1;
  else
    v21 = !v10;
  if (!v21 && self->_startingEnvironmentMode != 1)
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier continuousExposeIdentifiersInSwitcher](self, "continuousExposeIdentifiersInSwitcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBContinuousExposeHomeGestureSwitcherModifier appLayoutsForContinuousExposeIdentifier:](self, "appLayoutsForContinuousExposeIdentifier:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v26 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", v25, 0, 0);
        -[SBChainableModifierEventResponse addChildResponse:](v5, "addChildResponse:", v26);

      }
    }

  }
  return v5;
}

- (BOOL)_preventPositioningCardsOffscreenForFlatBottomEdgeSwipe
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SBContinuousExposeHomeGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
  v4 = v3;
  -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v6 = (1.0 - v4) * v5;
  -[SBContinuousExposeHomeGestureSwitcherModifier _coplanarSpacing](self, "_coplanarSpacing");
  return v6 < v7 * 0.75;
}

- (BOOL)_hasPausedEnoughForFlyIn
{
  double v4;

  if (-[SBHomeGestureFinalDestinationSwitcherModifier hasSeenAccelerationDipForAppSwitcher](self->_finalDestinationModifier, "hasSeenAccelerationDipForAppSwitcher"))
  {
    return 1;
  }
  v4 = *(double *)&kCardFlyInDelayAfterEnteringAppSwitcher_1;
  return self->_gestureHoldTimer > (unint64_t)(v4 * SBScreenMaximumFramesPerSecond());
}

- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcher
{
  double v3;

  -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  return self->_lastTouchLocation.y <= v3 - *(double *)&kMinimumYDistanceForHomeOrAppSwitcher_3;
}

- (void)_displayLinkFired:(id)a3
{
  int64_t v4;
  BOOL v5;

  if (-[SBGestureSwitcherModifier gesturePhase](self, "gesturePhase", a3) == 2
    && -[SBChainableModifier state](self, "state") != 1)
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier gestureHandlingModifier:averageVelocityOverDuration:](self, "gestureHandlingModifier:averageVelocityOverDuration:", self, 0.0416666667);
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
      if (-[SBContinuousExposeHomeGestureSwitcherModifier _hasPausedEnoughForFlyIn](self, "_hasPausedEnoughForFlyIn"))
        -[SBContinuousExposeHomeGestureSwitcherModifier gestureHandlingModifierRequestsUpdate:](self, "gestureHandlingModifierRequestsUpdate:", self);
    }
  }
}

- (BOOL)_shouldPositionAdjacentCardsOffscreenForFlyIn
{
  BOOL v3;

  v3 = -[SBContinuousExposeHomeGestureSwitcherModifier _preventPositioningCardsOffscreenForFlatBottomEdgeSwipe](self, "_preventPositioningCardsOffscreenForFlatBottomEdgeSwipe");
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
  v22[2] = __102__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke;
  v22[3] = &unk_1E8E9DED8;
  v22[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __102__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke_2;
  v19[3] = &unk_1E8EA6DD8;
  objc_copyWeak(&v21, &location);
  v18 = v16;
  v20 = v18;
  objc_msgSend(v17, "sb_animateWithSettings:mode:animations:completion:", v15, a3, v22, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

uint64_t __102__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setValue:", 1.0);
}

void __102__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke_2(uint64_t a1)
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

- (void)_beginAnimatingArcSwipePullingPropertyWithMode:(int64_t)a3 settings:(id)a4
{
  id v6;
  UIViewFloatAnimatableProperty *arcSwipePullingChangedProperty;
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
  arcSwipePullingChangedProperty = self->_arcSwipePullingChangedProperty;
  if (arcSwipePullingChangedProperty)
  {
    -[UIViewFloatAnimatableProperty invalidate](arcSwipePullingChangedProperty, "invalidate");
    v8 = self->_arcSwipePullingChangedProperty;
    self->_arcSwipePullingChangedProperty = 0;

  }
  v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  v10 = self->_arcSwipePullingChangedProperty;
  self->_arcSwipePullingChangedProperty = v9;

  -[UIViewFloatAnimatableProperty setValue:](self->_arcSwipePullingChangedProperty, "setValue:", 0.0);
  v11 = (void *)objc_msgSend(v6, "copy");
  LODWORD(v12) = *MEMORY[0x1E0CD23C0];
  LODWORD(v13) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 4);
  LODWORD(v14) = *(_DWORD *)(MEMORY[0x1E0CD23C0] + 8);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 0, v12, v13, v14);
  v15 = v11;

  objc_initWeak(&location, self);
  v16 = self->_arcSwipePullingChangedProperty;
  v17 = (void *)MEMORY[0x1E0CEABB0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __105__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingArcSwipePullingPropertyWithMode_settings___block_invoke;
  v22[3] = &unk_1E8E9DED8;
  v22[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __105__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingArcSwipePullingPropertyWithMode_settings___block_invoke_2;
  v19[3] = &unk_1E8EA6DD8;
  objc_copyWeak(&v21, &location);
  v18 = v16;
  v20 = v18;
  objc_msgSend(v17, "sb_animateWithSettings:mode:animations:completion:", v15, a3, v22, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

uint64_t __105__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingArcSwipePullingPropertyWithMode_settings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setValue:", 1.0);
}

void __105__SBContinuousExposeHomeGestureSwitcherModifier__beginAnimatingArcSwipePullingPropertyWithMode_settings___block_invoke_2(uint64_t a1)
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
    v3 = WeakRetained[17];
    v4 = v3;
    if (v3 && v3 == *(id *)(a1 + 32))
    {
      v5 = v6[17];
      v6[17] = 0;

    }
    WeakRetained = v6;
  }

}

- (BOOL)_isTranslationPastDistanceThresholdToUnconditionallyGoHome:(double)a3
{
  double v3;
  double v4;

  v3 = -a3;
  -[SBContinuousExposeHomeGestureSwitcherModifier unconditionalDistanceThresholdForHome](self, "unconditionalDistanceThresholdForHome");
  return v4 < v3;
}

- (double)_gestureProgressToMaxTranslationForTranslation:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[SBContinuousExposeHomeGestureSwitcherModifier _distanceYToMaxTranslation](self, "_distanceYToMaxTranslation");
  v6 = v5;
  if (self->_startingEnvironmentMode == 2 && !self->_scrunchInitiated)
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier _distanceYToInSwitcherCardScale](self, "_distanceYToInSwitcherCardScale");
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

  -[SBContinuousExposeHomeGestureSwitcherModifier _switcherCardScale](self, "_switcherCardScale");
  v4 = v3;
  -[SBContinuousExposeHomeGestureSwitcherModifier _inSwitcherCenterYOffsetWhenPresented](self, "_inSwitcherCenterYOffsetWhenPresented");
  v6 = v5;
  -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  return (1.0 - v4) * v7 * 0.5 - v6;
}

- (double)_distanceYToMaxTranslation
{
  double v3;
  double v4;
  double v5;

  -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v4 = v3;
  -[SBContinuousExposeHomeGestureSwitcherModifier _centerYOffsetDuringGesture](self, "_centerYOffsetDuringGesture");
  return v4 * 0.5 - v5;
}

- (double)_inSwitcherCenterYOffsetWhenPresented
{
  void *v3;
  double result;

  -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherCenterYOffsetPercentOfScreenHeight");

  -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  -[SBContinuousExposeHomeGestureSwitcherModifier screenScale](self, "screenScale");
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
    -[SBContinuousExposeHomeGestureSwitcherModifier _inSwitcherCenterYOffsetWhenPresented](self, "_inSwitcherCenterYOffsetWhenPresented");
  }
  else
  {
    -[SBContinuousExposeHomeGestureSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeGestureCenterZoomDownCenterYOffsetFactor");
    -[SBContinuousExposeHomeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
    -[SBContinuousExposeHomeGestureSwitcherModifier screenScale](self, "screenScale");
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

  -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
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

  -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
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
  SBContinuousExposeHomeGestureSwitcherModifier *v4;
  void *v5;
  void *v6;

  v4 = self;
  -[SBContinuousExposeHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
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

  -[SBContinuousExposeHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBContinuousExposeHomeGestureSwitcherModifier isDevicePad](self, "isDevicePad"))
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
  -[SBContinuousExposeHomeGestureSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "normalizedDistanceYThresholdForUnconditionalHome");
  kHomeGestureNormalizedDistanceYThresholdForUnconditionalHome_1 = v4;
  objc_msgSend(v11, "normalizedDistanceYThresholdRangeForUnconditionalHome");
  kHomeGestureNormalizedDistanceYThresholdRangeForUnconditionalHome_1 = v5;
  objc_msgSend(v11, "pauseVelocityThresholdForAppSwitcher");
  *(double *)&kPauseVelocityThresholdForAppSwitcher_1 = v3 * v6;
  objc_msgSend(v11, "velocityXThresholdForUnconditionalArcSwipe");
  *(double *)&kVelocityXThresholdForUnconditionalArcSwipe_1 = v3 * v7;
  objc_msgSend(v11, "minimumYDistanceForHomeOrAppSwitcher");
  *(double *)&kMinimumYDistanceForHomeOrAppSwitcher_3 = v3 * v8;
  objc_msgSend(v11, "cardFlyInMaximumVelocityThreshold");
  *(double *)&kCardFlyInMaximumVelocityThreshold_1 = v3 * v9;
  objc_msgSend(v11, "cardFlyInDelayAfterEnteringAppSwitcher");
  kCardFlyInDelayAfterEnteringAppSwitcher_1 = v10;

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
  objc_storeStrong((id *)&self->_arcSwipePulledStripAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_dismissSiriModifier, 0);
  objc_storeStrong((id *)&self->_finalDestinationModifier, 0);
  objc_storeStrong((id *)&self->_dockModifier, 0);
  objc_storeStrong((id *)&self->_appSwitcherModifier, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_arcSwipePullingChangedProperty, 0);
  objc_storeStrong((id *)&self->_inMultitaskingChangedProperty, 0);
}

@end
