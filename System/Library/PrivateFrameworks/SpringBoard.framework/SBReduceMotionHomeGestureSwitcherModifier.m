@implementation SBReduceMotionHomeGestureSwitcherModifier

- (SBReduceMotionHomeGestureSwitcherModifier)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 startingEnvironmentMode:(int64_t)a5 scrunchInitiated:(BOOL)a6 continuingGesture:(BOOL)a7 lastGestureWasAnArcSwipe:(BOOL)a8
{
  id v15;
  id v16;
  SBReduceMotionHomeGestureSwitcherModifier *v17;
  SBReduceMotionHomeGestureSwitcherModifier *v18;
  SBCoplanarSwitcherModifier *v19;
  SBCoplanarSwitcherModifier *coplanarLayoutModifier;
  SBDismissSiriSwitcherModifier *v21;
  SBDismissSiriSwitcherModifier *dismissSiriModifier;
  void *v24;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  if (self->_startingEnvironmentMode == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBReduceMotionHomeGestureSwitcherModifier.m"), 71, CFSTR("SBReduceMotionHomeGestureSwitcherModifier doesn't gesturing from the app switcher."));

  }
  v25.receiver = self;
  v25.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
  v17 = -[SBGestureSwitcherModifier initWithGestureID:](&v25, sel_initWithGestureID_, v15);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_selectedAppLayout, a4);
    v18->_startingEnvironmentMode = a5;
    v18->_continuingGesture = a7;
    v18->_lastGestureWasAnArcSwipe = a8;
    v18->_scrunchInitiated = a6;
    v19 = -[SBCoplanarSwitcherModifier initWithActiveAppLayout:]([SBCoplanarSwitcherModifier alloc], "initWithActiveAppLayout:", v18->_selectedAppLayout);
    coplanarLayoutModifier = v18->_coplanarLayoutModifier;
    v18->_coplanarLayoutModifier = v19;

    -[SBCoplanarSwitcherModifier setSpacingType:](v18->_coplanarLayoutModifier, "setSpacingType:", 0);
    v21 = objc_alloc_init(SBDismissSiriSwitcherModifier);
    dismissSiriModifier = v18->_dismissSiriModifier;
    v18->_dismissSiriModifier = v21;

    -[SBChainableModifier addChildModifier:](v18, "addChildModifier:", v18->_dismissSiriModifier);
  }

  return v18;
}

- (void)didMoveToParentModifier:(id)a3
{
  _BOOL4 v5;
  _BOOL8 v6;
  char v7;
  SBHomeGestureDockSwitcherModifier *v8;
  SBHomeGestureDockSwitcherModifier *dockModifier;
  id v10;
  SBHomeGestureFinalDestinationSwitcherModifier *v11;
  void *v12;
  double v13;
  SBHomeGestureFinalDestinationSwitcherModifier *v14;
  SBHomeGestureFinalDestinationSwitcherModifier *finalDestinationModifier;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v16, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (-[SBReduceMotionHomeGestureSwitcherModifier isFloatingDockSupported](self, "isFloatingDockSupported"))v5 = !self->_scrunchInitiated;
    else
      v5 = 0;
    v6 = self->_continuingGesture && self->_lastGestureWasAnArcSwipe;
    v7 = !v5;
    if (self->_dockModifier)
      v7 = 1;
    if ((v7 & 1) == 0)
    {
      v8 = -[SBReduceMotionHomeGestureSwitcherModifier _newDockModifierRequiringVerticalSwipeToTrackDock:startingEnvironmentMode:](self, "_newDockModifierRequiringVerticalSwipeToTrackDock:startingEnvironmentMode:", v6, self->_startingEnvironmentMode);
      dockModifier = self->_dockModifier;
      self->_dockModifier = v8;

      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_dockModifier);
    }
    if (!self->_finalDestinationModifier)
    {
      if (v5)
        v10 = -[SBReduceMotionHomeGestureSwitcherModifier _newDockModifierRequiringVerticalSwipeToTrackDock:startingEnvironmentMode:](self, "_newDockModifierRequiringVerticalSwipeToTrackDock:startingEnvironmentMode:", v6, self->_startingEnvironmentMode);
      else
        v10 = 0;
      v11 = [SBHomeGestureFinalDestinationSwitcherModifier alloc];
      -[SBReduceMotionHomeGestureSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "minimumYDistanceForHomeOrAppSwitcher");
      v14 = -[SBHomeGestureFinalDestinationSwitcherModifier initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:](v11, "initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:", self, self->_startingEnvironmentMode, self->_continuingGesture, v10, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v13);
      finalDestinationModifier = self->_finalDestinationModifier;
      self->_finalDestinationModifier = v14;

      -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_finalDestinationModifier);
    }
    -[SBReduceMotionHomeGestureSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
  }
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
  -[SBReduceMotionHomeGestureSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
  v7.receiver = self;
  v7.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
  -[SBSwitcherModifier handleHomeGestureSettingsChangedEvent:](&v7, sel_handleHomeGestureSettingsChangedEvent_, v4);
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
  v8.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
  v4 = a3;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v8, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 >= 2)
    -[SBChainableModifier setState:](self, "setState:", 1);
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
  v12.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v12, sel_handleGestureEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v5, "phase"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBReduceMotionHomeGestureSwitcherModifier.m"), 151, CFSTR("Should not be getting PhasePossible"));

      goto LABEL_3;
    case 1:
      -[SBReduceMotionHomeGestureSwitcherModifier _updateForGestureDidBeginWithEvent:](self, "_updateForGestureDidBeginWithEvent:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[SBReduceMotionHomeGestureSwitcherModifier _updateForGestureDidChangeWithEvent:](self, "_updateForGestureDidChangeWithEvent:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[SBReduceMotionHomeGestureSwitcherModifier _updateForGestureDidEndWithEvent:](self, "_updateForGestureDidEndWithEvent:", v5);
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
  CGFloat v6;
  CGFloat v7;
  SBSwitcherModifierEventResponse *v8;
  void *v9;
  void *v11;
  void *v12;

  v5 = a3;
  if (self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBReduceMotionHomeGestureSwitcherModifier.m"), 168, CFSTR("Can't begin a gesture that has already begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBReduceMotionHomeGestureSwitcherModifier.m"), 169, CFSTR("Can't begin a gesture that has already ended."));

  }
  self->_gestureHasBegun = 1;
  self->_reduceMotionAxis = 0;
  objc_msgSend(v5, "locationInContainerView");
  self->_initialTouchLocation.x = v6;
  self->_initialTouchLocation.y = v7;
  self->_lastTouchLocation.x = v6;
  self->_lastTouchLocation.y = v7;
  v8 = objc_alloc_init(SBSwitcherModifierEventResponse);
  -[SBReduceMotionHomeGestureSwitcherModifier _updateGestureTranslationAndVelocityWithEvent:](self, "_updateGestureTranslationAndVelocityWithEvent:", v5);
  -[SBReduceMotionHomeGestureSwitcherModifier _updateReduceMotionAxisIfNecessaryWithEvent:](self, "_updateReduceMotionAxisIfNecessaryWithEvent:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[SBChainableModifierEventResponse addChildResponse:](v8, "addChildResponse:", v9);

  return v8;
}

- (id)_updateForGestureDidChangeWithEvent:(id)a3
{
  id v5;
  SBSwitcherModifierEventResponse *v6;
  void *v7;
  int64_t v8;
  int v9;
  int v10;
  SBCompleteGestureSwitcherEventResponse *v12;
  void *v14;
  void *v15;

  v5 = a3;
  if (!self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBReduceMotionHomeGestureSwitcherModifier.m"), 191, CFSTR("Can't update a gesture that has not begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBReduceMotionHomeGestureSwitcherModifier.m"), 192, CFSTR("Can't update a gesture that has already ended."));

  }
  -[SBReduceMotionHomeGestureSwitcherModifier _updateGestureTranslationAndVelocityWithEvent:](self, "_updateGestureTranslationAndVelocityWithEvent:", v5);
  v6 = objc_alloc_init(SBSwitcherModifierEventResponse);
  -[SBReduceMotionHomeGestureSwitcherModifier _updateReduceMotionAxisIfNecessaryWithEvent:](self, "_updateReduceMotionAxisIfNecessaryWithEvent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v7);
  if (self->_reduceMotionAxis == 2)
  {
    v8 = -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination");
    v9 = BSFloatLessThanFloat();
    v10 = v9 | -[SBHomeGestureFinalDestinationSwitcherModifier hasSeenAccelerationDipForAppSwitcher](self->_finalDestinationModifier, "hasSeenAccelerationDipForAppSwitcher");
    if (v8 == 3 && v10 != 0)
    {
      self->_endingGestureForAppSwitcher = 1;
      v12 = objc_alloc_init(SBCompleteGestureSwitcherEventResponse);
      -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v12);

    }
  }

  return v6;
}

- (id)_updateForGestureDidEndWithEvent:(id)a3
{
  id v5;
  SBSwitcherModifierEventResponse *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  unint64_t reduceMotionAxis;
  const __CFString *v11;
  SBActivateHomeButtonSwitcherEventResponse *v12;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  SBHapticSwitcherEventResponse *v21;
  SBHapticSwitcherEventResponse *v22;
  SBHapticSwitcherEventResponse *v23;
  void *v24;
  SBHapticSwitcherEventResponse *v25;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[3];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBReduceMotionHomeGestureSwitcherModifier.m"), 222, CFSTR("Can't end a gesture that has not begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBReduceMotionHomeGestureSwitcherModifier.m"), 223, CFSTR("Can't end a gesture that has already ended."));

  }
  self->_gestureHasEnded = 1;
  v6 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v7 = -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination");
  -[SBHomeGestureFinalDestinationSwitcherModifier finalDestinationReason](self->_finalDestinationModifier, "finalDestinationReason");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  reduceMotionAxis = self->_reduceMotionAxis;
  if (reduceMotionAxis == 1)
  {
    if (v7 - 3 > 1)
      goto LABEL_12;
    v11 = CFSTR("CurrentLayoutBecauseLockedHorizontallyAndTriedToGoHomeOrAppSwitcher");
    goto LABEL_11;
  }
  if (reduceMotionAxis == 2 && v7 - 1 < 2)
  {
    v11 = CFSTR("CurrentLayoutBecauseLockedVerticallyAndTriedToArc");
LABEL_11:

    v7 = 0;
    v9 = (__CFString *)v11;
  }
LABEL_12:
  if (objc_msgSend(v5, "isCanceled"))
  {
    if (!self->_endingGestureForAppSwitcher)
      goto LABEL_23;
    v12 = (SBActivateHomeButtonSwitcherEventResponse *)v9;
    v9 = CFSTR("EndedGestureForAppSwitcher");
    v7 = 3;
    goto LABEL_22;
  }
  if (self->_startingEnvironmentMode == 1 && -[SBAppLayout type](self->_selectedAppLayout, "type") != 2 && v7 == 4)
  {
    v12 = objc_alloc_init(SBActivateHomeButtonSwitcherEventResponse);
    -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v12);
    v7 = 4;
LABEL_22:

  }
LABEL_23:
  SBLogSystemGestureAppSwitcher();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    NSStringFromSBHomeGestureFinalDestination(v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v33 = v15;
    v34 = 2048;
    v35 = v7;
    v36 = 2112;
    v37 = v9;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "Reduce Motion Home Gesture Modifier - Final Response: %@ (%lu), Reason: %@", buf, 0x20u);

  }
  -[SBReduceMotionHomeGestureSwitcherModifier _responseForActivatingFinalDestination:](self, "_responseForActivatingFinalDestination:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v16);
  if (v7 - 3 <= 1)
  {
    objc_initWeak((id *)buf, self);
    -[SBReduceMotionHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "animationSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reduceMotionTriggerDelay");
    v20 = v19;

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __78__SBReduceMotionHomeGestureSwitcherModifier__updateForGestureDidEndWithEvent___block_invoke;
    v29[3] = &unk_1E8EA3468;
    objc_copyWeak(&v30, (id *)buf);
    objc_msgSend(v16, "setDelay:withValidator:", v29, v20);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  if (v7 == 4)
  {
    v21 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 2, 1);
    -[SBHapticSwitcherEventResponse setHidEventSenderID:](v21, "setHidEventSenderID:", objc_msgSend(v5, "hidEventSenderID"));
    -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v21);
  }
  else
  {
    if (v7 != 3)
      goto LABEL_32;
    v21 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 0, 0);
    v22 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 0, 1);
    -[SBHapticSwitcherEventResponse setHidEventSenderID:](v22, "setHidEventSenderID:", objc_msgSend(v5, "hidEventSenderID"));
    v23 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 0, 2);
    v31[0] = v21;
    v31[1] = v22;
    v31[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBChainableModifierEventResponse addChildResponses:](v6, "addChildResponses:", v24);

  }
LABEL_32:
  if (self->_didWarmupReduceMotionHaptic)
  {
    self->_didWarmupReduceMotionHaptic = 0;
    v25 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 2, 2);
    -[SBChainableModifierEventResponse addChildResponse:](v6, "addChildResponse:", v25);

  }
  return v6;
}

BOOL __78__SBReduceMotionHomeGestureSwitcherModifier__updateForGestureDidEndWithEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BOOL8 v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "parentModifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_updateGestureTranslationAndVelocityWithEvent:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  SBHomeGestureDockSwitcherModifier *dockModifier;
  CGFloat v11;
  CGFloat v12;
  CGPoint *p_lastTouchLocation;
  CGFloat v14;
  CGFloat v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "translationInContainerView");
  v5 = v4;
  v7 = v6;
  -[SBReduceMotionHomeGestureSwitcherModifier _updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:](self, "_updateTranslationAdjustmentForGestureFromHomeScreenIfNeededWithEvent:", v16);
  v8 = v5 + self->_translationAdjustmentForStartingFromHomeScreen.x;
  v9 = v7 + self->_translationAdjustmentForStartingFromHomeScreen.y;
  dockModifier = self->_dockModifier;
  if (dockModifier)
    -[SBHomeGestureDockSwitcherModifier adjustedTranslationForTranslation:](dockModifier, "adjustedTranslationForTranslation:", v8, v9);
  self->_translation.x = v8;
  self->_translation.y = v9;
  objc_msgSend(v16, "averageTouchVelocityOverTimeDuration:", 0.0416666667);
  self->_velocity.x = v11;
  self->_velocity.y = v12;
  p_lastTouchLocation = &self->_lastTouchLocation;
  objc_msgSend(v16, "locationInContainerView");
  p_lastTouchLocation->x = v14;
  p_lastTouchLocation->y = v15;

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
  if (self->_reduceMotionAxis != 2 && self->_startingEnvironmentMode == 1)
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

- (int64_t)currentFinalDestination
{
  return -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self->_finalDestinationModifier, "currentFinalDestination");
}

- (double)unconditionalDistanceThresholdForHome
{
  return 1.79769313e308;
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
  SBAppLayout *v15;
  uint64_t v16;
  SBMutableSwitcherTransitionRequest *v17;
  SBPerformTransitionSwitcherEventResponse *v18;

  -[SBReduceMotionHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  switch(a3)
  {
    case 0:
      v7 = self->_selectedAppLayout;
      goto LABEL_20;
    case 1:
      v8 = objc_msgSend(v5, "indexOfObject:", self->_selectedAppLayout);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_16;
      v9 = v8;
      if (!objc_msgSend(v6, "count"))
        goto LABEL_16;
      if (v9 <= 1)
        v10 = 1;
      else
        v10 = v9;
      v11 = v10 - 1;
      goto LABEL_15;
    case 2:
      if (self->_selectedAppLayout)
      {
        v12 = objc_msgSend(v5, "indexOfObject:");
        if (v12 == 0x7FFFFFFFFFFFFFFFLL || (v13 = v12, !objc_msgSend(v6, "count")))
        {
LABEL_16:
          v15 = 0;
          goto LABEL_21;
        }
        v14 = objc_msgSend(v6, "count");
        if (v13 + 1 < v14 - 1)
          v11 = v13 + 1;
        else
          v11 = v14 - 1;
LABEL_15:
        objc_msgSend(v6, "objectAtIndex:", v11);
        v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v5, "firstObject");
        v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
      }
LABEL_20:
      v15 = v7;
LABEL_21:
      v16 = 0;
LABEL_22:
      v17 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      -[SBSwitcherTransitionRequest setAppLayout:](v17, "setAppLayout:", v15);
      -[SBSwitcherTransitionRequest setUnlockedEnvironmentMode:](v17, "setUnlockedEnvironmentMode:", v16);
      v18 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v17, 1);

      return v18;
    case 3:
      v15 = 0;
      v16 = 2;
      goto LABEL_22;
    case 4:
      +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
      v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    default:
      goto LABEL_16;
  }
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  __int128 v4;
  SBCoplanarSwitcherModifier *coplanarLayoutModifier;
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[7];
  uint64_t v16;
  double *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  CGRect result;

  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x4010000000;
  v19 = &unk_1D0FA064E;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v20 = *MEMORY[0x1E0C9D648];
  v21 = v4;
  coplanarLayoutModifier = self->_coplanarLayoutModifier;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__SBReduceMotionHomeGestureSwitcherModifier_frameForIndex___block_invoke;
  v15[3] = &unk_1E8E9FD08;
  v15[4] = self;
  v15[5] = &v16;
  v15[6] = a3;
  -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", coplanarLayoutModifier, v15);
  v6 = v17;
  if (self->_reduceMotionAxis == 1)
  {
    v7 = self->_translation.x + v17[4];
    v17[4] = v7;
  }
  else
  {
    v7 = v17[4];
  }
  v8 = v6[5];
  v9 = v6[6];
  v10 = v6[7];
  _Block_object_dispose(&v16, 8);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

uint64_t __59__SBReduceMotionHomeGestureSwitcherModifier_frameForIndex___block_invoke(_QWORD *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1[4] + 120), "frameForIndex:", a1[6]);
  v3 = *(_QWORD **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double result;
  objc_super v4;

  result = 1.0;
  if (!self->_laysOutNeighboringCards)
  {
    v4.receiver = self;
    v4.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
    -[SBReduceMotionHomeGestureSwitcherModifier scaleForIndex:](&v4, sel_scaleForIndex_, a3, 1.0);
  }
  return result;
}

- (id)visibleAppLayouts
{
  id v3;
  SBAppLayout *selectedAppLayout;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v14;
  objc_super v15;

  if (self->_reduceMotionAxis == 1)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    selectedAppLayout = self->_selectedAppLayout;
    -[SBReduceMotionHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (selectedAppLayout)
    {
      v7 = objc_msgSend(v5, "indexOfObject:", self->_selectedAppLayout);
      v8 = v7;
      if (v7 <= 1)
        v9 = 1;
      else
        v9 = v7;
      v10 = v7 + 1;
      v11 = objc_msgSend(v6, "count") - 1;
      if (v10 < v11)
        v11 = v8 + 1;
      objc_msgSend(v6, "subarrayWithRange:", v9 - 1, v11 - v9 + 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v12);

    }
    else
    {
      objc_msgSend(v5, "firstObject");
      v14 = objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(v3, "addObject:", v14);
      v6 = (void *)v14;
    }

    return v3;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
    -[SBReduceMotionHomeGestureSwitcherModifier visibleAppLayouts](&v15, sel_visibleAppLayouts);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIRectCornerRadii result;

  if (self->_laysOutNeighboringCards)
  {
    -[SBReduceMotionHomeGestureSwitcherModifier displayCornerRadius](self, "displayCornerRadius", a3);
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
    -[SBReduceMotionHomeGestureSwitcherModifier cornerRadiiForIndex:](&v7, sel_cornerRadiiForIndex_, a3);
  }
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  objc_super v3;

  if (self->_shouldProvideBlur)
  {
    if (self->_reduceMotionAxis == 1)
      return 2;
    else
      return 1;
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
    return -[SBReduceMotionHomeGestureSwitcherModifier homeScreenBackdropBlurType](&v3, sel_homeScreenBackdropBlurType);
  }
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
  return self->_reduceMotionAxis == 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (id)appLayoutsToCacheSnapshots
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[SBReduceMotionHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if (self->_selectedAppLayout)
    {
      -[SBReduceMotionHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "indexOfObject:", self->_selectedAppLayout);

    }
    else
    {
      v5 = 0;
    }
    -[SBReduceMotionHomeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
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

  -[SBReduceMotionHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_selectedAppLayout)
  {
    -[SBReduceMotionHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfObject:", self->_selectedAppLayout);

    if (v5)
    {
      --v5;
      v6 = 3;
    }
    else
    {
      v6 = 2;
    }
  }
  else
  {
    v5 = 0;
    v6 = 1;
  }
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
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[SBHomeGestureDockSwitcherModifier isCurrentlyTrackingDock](self->_dockModifier, "isCurrentlyTrackingDock"))
  {
    v20.receiver = self;
    v20.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
    -[SBReduceMotionHomeGestureSwitcherModifier appLayoutsToResignActive](&v20, sel_appLayoutsToResignActive);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v3, "allValues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "allObjects");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, &unk_1E91D1C28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = (void *)MEMORY[0x1E0C99E60];
    -[SBReduceMotionHomeGestureSwitcherModifier appLayouts](self, "appLayouts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryWithObject:forKey:", v14, &unk_1E91D1C28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)keyboardSuppressionMode
{
  void *v3;
  objc_super v5;

  if (-[SBHomeGestureDockSwitcherModifier isCurrentlyTrackingDock](self->_dockModifier, "isCurrentlyTrackingDock"))
  {
    v5.receiver = self;
    v5.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
    -[SBReduceMotionHomeGestureSwitcherModifier keyboardSuppressionMode](&v5, sel_keyboardSuppressionMode);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes](SBSwitcherKeyboardSuppressionMode, "suppressionModeForAllScenes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  unsigned __int8 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBReduceMotionHomeGestureSwitcherModifier;
  v4 = -[SBReduceMotionHomeGestureSwitcherModifier asyncRenderingAttributesForAppLayout:](&v6, sel_asyncRenderingAttributesForAppLayout_, a3);
  if (-[SBHomeGestureDockSwitcherModifier isCurrentlyTrackingDock](self->_dockModifier, "isCurrentlyTrackingDock"))
    return (SBSwitcherAsyncRenderingAttributes)257;
  else
    return (SBSwitcherAsyncRenderingAttributes)(v4 | 0x100);
}

- (BOOL)shouldRubberbandFullScreenHomeGrabberView
{
  return !self->_dockModifier && self->_reduceMotionAxis == 2;
}

- (id)_updateReduceMotionAxisIfNecessaryWithEvent:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  unint64_t v9;
  SBHapticSwitcherEventResponse *v10;

  if (self->_reduceMotionAxis)
    goto LABEL_11;
  objc_msgSend(a3, "velocityInContainerView");
  v6 = v5;
  v7 = v4;
  v8 = v5 == *MEMORY[0x1E0C9D538] && v4 == *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v8
    || -[SBHomeGestureDockSwitcherModifier isCurrentlyTrackingDock](self->_dockModifier, "isCurrentlyTrackingDock"))
  {
    goto LABEL_11;
  }
  v9 = 2;
  if (fabs(v7 / v6) < 0.5)
    v9 = 1;
  self->_reduceMotionAxis = v9;
  self->_endingGestureForAppSwitcher = 0;
  if (self->_reduceMotionAxis != 2)
  {
LABEL_11:
    v10 = 0;
  }
  else
  {
    self->_didWarmupReduceMotionHaptic = 1;
    v10 = -[SBHapticSwitcherEventResponse initWithHapticType:phase:]([SBHapticSwitcherEventResponse alloc], "initWithHapticType:phase:", 2, 0);
  }
  return v10;
}

- (void)_applyPrototypeSettings
{
  double v3;
  double v4;
  id v5;

  v3 = SBMainScreenPointsPerMillimeter();
  -[SBReduceMotionHomeGestureSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardFlyInMaximumVelocityThreshold");
  *(double *)&kEndGestureForAppSwitcherMaximumVelocityThreshold = v3 * v4;

}

- (BOOL)shouldProvideBlur
{
  return self->_shouldProvideBlur;
}

- (void)setShouldProvideBlur:(BOOL)a3
{
  self->_shouldProvideBlur = a3;
}

- (BOOL)laysOutNeighboringCards
{
  return self->_laysOutNeighboringCards;
}

- (void)setLaysOutNeighboringCards:(BOOL)a3
{
  self->_laysOutNeighboringCards = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_dismissSiriModifier, 0);
  objc_storeStrong((id *)&self->_finalDestinationModifier, 0);
  objc_storeStrong((id *)&self->_dockModifier, 0);
  objc_storeStrong((id *)&self->_coplanarLayoutModifier, 0);
}

@end
