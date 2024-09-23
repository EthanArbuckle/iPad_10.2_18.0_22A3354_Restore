@implementation SBHomeGestureFinalDestinationSwitcherModifier

- (SBHomeGestureFinalDestinationSwitcherModifier)initWithDelegate:(id)a3 initialTranslationAdjustment:(CGPoint)a4 minYDistanceForHomeOrSwitcher:(double)a5 startingEnvironmentMode:(int64_t)a6 continuingGesture:(BOOL)a7 dockModifier:(id)a8
{
  CGFloat y;
  CGFloat x;
  id v15;
  id v16;
  SBHomeGestureFinalDestinationSwitcherModifier *v17;
  SBHomeGestureFinalDestinationSwitcherModifier *v18;
  objc_super v20;

  y = a4.y;
  x = a4.x;
  v15 = a3;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)SBHomeGestureFinalDestinationSwitcherModifier;
  v17 = -[SBSwitcherModifier init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_finalDestinationDelegate, v15);
    v18->_initialTranslationAdjustment.x = x;
    v18->_initialTranslationAdjustment.y = y;
    v18->_minYDistanceForHomeOrSwitcher = a5;
    v18->_startingEnvironmentMode = a6;
    v18->_continuingGesture = a7;
    objc_storeStrong((id *)&v18->_dockModifier, a8);
  }

  return v18;
}

- (void)didMoveToParentModifier:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHomeGestureFinalDestinationSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
  {
    -[SBHomeGestureFinalDestinationSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
    if (self->_dockModifier)
      -[SBChainableModifier addChildModifier:](self, "addChildModifier:");
  }
}

- (id)handleHomeGestureSettingsChangedEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[SBHomeGestureFinalDestinationSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
  v7.receiver = self;
  v7.super_class = (Class)SBHomeGestureFinalDestinationSwitcherModifier;
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
  -[SBHomeGestureFinalDestinationSwitcherModifier _applyPrototypeSettings](self, "_applyPrototypeSettings");
  v7.receiver = self;
  v7.super_class = (Class)SBHomeGestureFinalDestinationSwitcherModifier;
  -[SBSwitcherModifier handleSwitcherSettingsChangedEvent:](&v7, sel_handleSwitcherSettingsChangedEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHomeGestureFinalDestinationSwitcherModifier;
  -[SBSwitcherModifier handleGestureEvent:](&v9, sel_handleGestureEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v5, "phase"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFinalDestinationSwitcherModifier.m"), 156, CFSTR("Should not be getting PhasePossible"));

      break;
    case 1:
      -[SBHomeGestureFinalDestinationSwitcherModifier _updateForGestureDidBeginWithEvent:](self, "_updateForGestureDidBeginWithEvent:", v5);
      break;
    case 2:
      -[SBHomeGestureFinalDestinationSwitcherModifier _updateForGestureDidChangeWithEvent:](self, "_updateForGestureDidChangeWithEvent:", v5);
      break;
    case 3:
      -[SBHomeGestureFinalDestinationSwitcherModifier _updateForGestureDidEndWithEvent:](self, "_updateForGestureDidEndWithEvent:", v5);
      break;
    default:
      break;
  }

  return v6;
}

- (void)_updateForGestureDidBeginWithEvent:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFinalDestinationSwitcherModifier.m"), 173, CFSTR("Can't begin a gesture that has already begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFinalDestinationSwitcherModifier.m"), 174, CFSTR("Can't begin a gesture that has already ended."));

  }
  self->_gestureHasBegun = 1;
  self->_numberOfTouchSamples = 0;
  v5 = objc_msgSend(v13, "type");
  self->_scrunchInitiated = v5 == 3;
  *(_QWORD *)&self->_adaptiveMinimumYVelocityForHome = kMinimumYVelocityForHome;
  *(_QWORD *)&self->_adaptivePauseVelocityThresholdForAppSwitcher = kPauseVelocityThresholdForAppSwitcher_0;
  v6 = &kVelocitySlopeThresholdForScrunchArc;
  if (v5 != 3)
    v6 = &kVelocitySlopeThresholdForBottomSwipeUpArc;
  *(_QWORD *)&self->_adaptiveVelocitySlopeThresholdForArc = *v6;
  self->_lastFinalDestination = 0.0;
  objc_msgSend(v13, "averageTouchVelocityOverTimeDuration:", 0.25);
  self->_lastAverageVelocityYForAcceleration = v7;
  objc_msgSend(v13, "locationInContainerView");
  self->_initialTouchLocation.x = v8;
  self->_initialTouchLocation.y = v9;
  self->_lastTouchLocation.x = v8;
  self->_lastTouchLocation.y = v9;
  if (self->_startingEnvironmentMode == 2)
  {
    -[SBHomeGestureFinalDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
    self->_initialTouchLocation.y = v10;
  }
  -[SBHomeGestureFinalDestinationSwitcherModifier _updateGestureTranslationVelocityAndProgressWithEvent:](self, "_updateGestureTranslationVelocityAndProgressWithEvent:", v13);

}

- (void)_updateForGestureDidChangeWithEvent:(id)a3
{
  double lastTouchTimestamp;
  void *v6;
  void *v7;
  double v8;
  double v9;
  unint64_t numberOfTouchSamples;
  double v11;
  double v12;
  double v13;
  double lastAverageVelocityYForAcceleration;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  if (!self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFinalDestinationSwitcherModifier.m"), 201, CFSTR("Can't update a gesture that has not begun."));

  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFinalDestinationSwitcherModifier.m"), 202, CFSTR("Can't update a gesture that has already ended."));

  }
  lastTouchTimestamp = self->_lastTouchTimestamp;
  -[SBHomeGestureFinalDestinationSwitcherModifier _updateGestureTranslationVelocityAndProgressWithEvent:](self, "_updateGestureTranslationVelocityAndProgressWithEvent:", v25);
  if (-[SBHomeGestureFinalDestinationSwitcherModifier _isTranslationPastDistanceThresholdToUnconditionallyGoHome:](self, "_isTranslationPastDistanceThresholdToUnconditionallyGoHome:", self->_translation.y))
  {
    self->_hasSeenAccelerationDipForAppSwitcher = 0;
    self->_lastAverageVelocityYForAcceleration = 0.0;
  }
  -[SBHomeGestureFinalDestinationSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "averageTouchVelocityOverTimeDuration:", 0.25);
  v9 = v8;
  numberOfTouchSamples = self->_numberOfTouchSamples;
  if (numberOfTouchSamples > objc_msgSend(v7, "minimumTouchSamplesForAccelerationDip")
    && (BSFloatEqualToFloat() & 1) == 0)
  {
    -[SBHomeGestureFinalDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v12 = v11;
    objc_msgSend(v25, "locationInContainerView");
    if (v13 <= v12 - *(double *)&kMinimumYDistanceToConsiderAccelerationDip)
    {
      lastAverageVelocityYForAcceleration = self->_lastAverageVelocityYForAcceleration;
      v15 = self->_lastTouchTimestamp;
      objc_msgSend(v7, "cardFlyInAccelerationDipThreshold");
      if (!self->_hasSeenAccelerationDipForAppSwitcher
        && (v9 - lastAverageVelocityYForAcceleration) / (v15 - lastTouchTimestamp) > v16)
      {
        self->_hasSeenAccelerationDipForAppSwitcher = 1;
      }
    }
  }
  self->_lastAverageVelocityYForAcceleration = v9;
  v17 = -[SBHomeGestureFinalDestinationSwitcherModifier currentFinalDestination](self, "currentFinalDestination");
  self->_updateEdgeRegionSampleCounter = 1;
  self->_lastFinalDestination = (double)v17;
  -[SBHomeGestureFinalDestinationSwitcherModifier _updateAdaptiveThresholdsForCurrentFinalDestination:velocityAverage:](self, "_updateAdaptiveThresholdsForCurrentFinalDestination:velocityAverage:", v17, self->_velocity.x, self->_velocity.y);
  self->_updateEdgeRegionSampleCounter = 0;
  objc_msgSend(v25, "locationInContainerView");
  v19 = v18;
  v21 = v20;
  -[SBHomeGestureFinalDestinationSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  v22 = v19 > self->_lastTouchLocation.x;
  if (self->_movingTowardsNextLayoutState != v22)
  {
    self->_movingTowardsNextLayoutState = v22;
    self->_directionSwitchLocation.x = v19;
    self->_directionSwitchLocation.y = v21;
  }
  self->_lastTouchLocation.x = v19;
  self->_lastTouchLocation.y = v21;

}

- (void)_updateForGestureDidEndWithEvent:(id)a3
{
  id v5;
  CGPoint *p_lastTouchLocation;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (!self->_gestureHasBegun)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFinalDestinationSwitcherModifier.m"), 252, CFSTR("Can't end a gesture that has not begun."));

    v5 = v11;
  }
  if (self->_gestureHasEnded)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHomeGestureFinalDestinationSwitcherModifier.m"), 253, CFSTR("Can't end a gesture that has already ended."));

    v5 = v11;
  }
  self->_gestureHasEnded = 1;
  -[SBHomeGestureFinalDestinationSwitcherModifier _updateGestureTranslationVelocityAndProgressWithEvent:](self, "_updateGestureTranslationVelocityAndProgressWithEvent:", v5);
  p_lastTouchLocation = &self->_lastTouchLocation;
  objc_msgSend(v11, "locationInContainerView");
  p_lastTouchLocation->x = v7;
  p_lastTouchLocation->y = v8;

}

- (void)_updateGestureTranslationVelocityAndProgressWithEvent:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  char v12;

  v4 = a3;
  objc_msgSend(v4, "translationInContainerView");
  v6 = v5 + self->_initialTranslationAdjustment.x;
  v8 = v7 + self->_initialTranslationAdjustment.y;
  objc_msgSend(v4, "averageTouchVelocityOverTimeDuration:", 0.0416666667);
  self->_translation.x = v6;
  self->_translation.y = v8;
  self->_velocity.x = v9;
  self->_velocity.y = v10;
  objc_msgSend(v4, "lastTouchTimestamp");
  self->_lastTouchTimestamp = v11;
  ++self->_numberOfTouchSamples;
  self->_touchType = objc_msgSend(v4, "touchType");
  v12 = objc_msgSend(v4, "isMouseEvent");

  self->_isMouseEvent = v12;
}

- (int64_t)currentFinalDestination
{
  double v3;
  double v4;
  double v5;
  double x;
  double y;
  CGPoint *p_initialTouchLocation;
  double v9;
  double v10;
  uint64_t v11;
  double adaptiveMinimumYVelocityForHome;
  _BOOL4 v13;
  double v14;
  double v15;
  CGPoint *p_velocity;
  _BOOL4 v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  uint64_t *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double adaptivePauseVelocityThresholdForAppSwitcher;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;
  double v33;
  char v34;
  NSString *finalDestinationReason;
  __CFString *v36;
  uint64_t v37;
  _BOOL4 isMouseEvent;
  BOOL v39;
  NSString *v40;
  int64_t startingEnvironmentMode;
  NSString *v42;
  SBHomeGestureDockSwitcherModifier *dockModifier;
  uint64_t v44;
  uint64_t v45;
  NSString *v46;
  double v47;
  char v48;
  NSString *v49;
  int64_t v50;
  void *v51;
  int v52;
  NSString *v53;
  int v56;
  double v57;
  int v58;
  double v59;
  __CFString *v60;
  _BOOL4 v61;
  __CFString *v62;
  int v63;
  double v64;
  __CFString *v65;
  __CFString *v66;
  __CFString *v67;
  double v68;

  -[SBHomeGestureFinalDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v68 = v3;
  v5 = v4;
  x = self->_translation.x;
  y = self->_translation.y;
  p_initialTouchLocation = &self->_initialTouchLocation;
  v10 = self->_initialTouchLocation.x;
  v9 = self->_initialTouchLocation.y;
  v11 = -[SBHomeGestureFinalDestinationSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
  adaptiveMinimumYVelocityForHome = self->_adaptiveMinimumYVelocityForHome;
  if (self->_scrunchInitiated)
  {
    v13 = 0;
    v14 = self->_velocity.y;
  }
  else
  {
    if (adaptiveMinimumYVelocityForHome <= *(double *)&kVelocityYThresholdForUnconditionalHome)
      v15 = self->_adaptiveMinimumYVelocityForHome;
    else
      v15 = *(double *)&kVelocityYThresholdForUnconditionalHome;
    v14 = self->_velocity.y;
    v13 = v14 < v15;
  }
  p_velocity = &self->_velocity;
  v17 = v14 < adaptiveMinimumYVelocityForHome
     && v14 < -(self->_adaptiveVelocitySlopeThresholdForArc * fabs(p_velocity->x));
  v18 = -[SBHomeGestureFinalDestinationSwitcherModifier _isTranslationPastDistanceThresholdToUnconditionallyGoHome:](self, "_isTranslationPastDistanceThresholdToUnconditionallyGoHome:", y);
  v19 = self->_velocity.y;
  v20 = fabs(p_velocity->x);
  v21 = fabs(v19);
  v22 = v20 > *(double *)&kVelocityXThresholdForUnconditionalArcSwipe_0
     && v21 < v20 * self->_adaptiveVelocitySlopeThresholdForArc;
  if ((unint64_t)(v11 - 3) >= 2)
    v23 = &kMinimumXDistanceToTriggerArcByDistancePortrait;
  else
    v23 = &kMinimumXDistanceToTriggerArcByDistanceLandscape;
  v24 = *(double *)v23;
  v25 = fabs(y);
  v26 = *(double *)&kMaximumYDistanceToTriggerArcByDistance;
  v27 = fabs(x);
  adaptivePauseVelocityThresholdForAppSwitcher = self->_adaptivePauseVelocityThresholdForAppSwitcher;
  v29 = v27 > *(double *)v23 && v25 < *(double *)&kMaximumYDistanceToTriggerArcByDistance;
  v30 = v20 < adaptivePauseVelocityThresholdForAppSwitcher;
  if (v21 >= adaptivePauseVelocityThresholdForAppSwitcher)
    v30 = 0;
  if (v19 <= adaptivePauseVelocityThresholdForAppSwitcher)
  {
    v31 = 0;
  }
  else
  {
    v31 = v27 < v24;
    if (v20 * *(double *)&kVelocitySlopeThresholdForCurrentLayout > v21)
      v31 = 0;
  }
  v32 = self->_touchType != 1 || self->_scrunchInitiated;
  v33 = v9 + y;
  if (!v13 && !v17)
  {
    if (v18)
    {
      v34 = 0;
      finalDestinationReason = self->_finalDestinationReason;
      v36 = CFSTR("HomeByDistanceThreshold");
      goto LABEL_33;
    }
    if (v22 && v32)
    {
      if ((-[SBHomeGestureFinalDestinationSwitcherModifier isDevicePad](self, "isDevicePad") & 1) == 0
        && v33 + v19 * 0.15 <= v5 - *(double *)&kMaximumYDistanceToTriggerArcByFlick
        && v25 >= v26)
      {
        v34 = 0;
        finalDestinationReason = self->_finalDestinationReason;
        v65 = CFSTR("AppSwitcherByHorizontalMotion");
LABEL_97:
        self->_finalDestinationReason = &v65->isa;
        v37 = 3;
        goto LABEL_34;
      }
      v56 = -[SBHomeGestureFinalDestinationSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
      v57 = p_velocity->x;
      if (v56)
      {
        if (p_velocity->x <= 0.0)
        {
LABEL_67:
          v58 = -[SBHomeGestureFinalDestinationSwitcherModifier isRTLEnabled](self, "isRTLEnabled", v57);
          v59 = self->_directionSwitchLocation.x - p_initialTouchLocation->x;
          if (v58)
            v59 = -v59;
          finalDestinationReason = self->_finalDestinationReason;
          if (v59 < v68 * -0.25)
          {
            v37 = 0;
            v60 = CFSTR("CurrentLayoutByRetractingFromBottomSwipeToNextLayout");
LABEL_84:
            self->_finalDestinationReason = &v60->isa;
            v34 = 1;
            goto LABEL_34;
          }
          v66 = CFSTR("NextLayoutByFastBottomSwipe");
LABEL_90:
          self->_finalDestinationReason = &v66->isa;
          v34 = 1;
          v37 = 2;
          goto LABEL_34;
        }
      }
      else if (p_velocity->x >= 0.0)
      {
        goto LABEL_67;
      }
      v63 = -[SBHomeGestureFinalDestinationSwitcherModifier isRTLEnabled](self, "isRTLEnabled", v57);
      v64 = self->_directionSwitchLocation.x - p_initialTouchLocation->x;
      if (v63)
        v64 = -v64;
      finalDestinationReason = self->_finalDestinationReason;
      if (v64 > v68 * 0.25)
      {
        v37 = 0;
        v60 = CFSTR("CurrentLayoutByRetractingFromBottomSwipeToPreviousLayout");
        goto LABEL_84;
      }
      v62 = CFSTR("PreviousLayoutByFastBottomSwipe");
LABEL_92:
      self->_finalDestinationReason = &v62->isa;
      v37 = 1;
      v34 = 1;
      goto LABEL_34;
    }
    if (v29 && v32)
    {
      if (-[SBHomeGestureFinalDestinationSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
        v61 = x > 0.0;
      else
        v61 = x < 0.0;
      finalDestinationReason = self->_finalDestinationReason;
      if (!v61)
      {
        v66 = CFSTR("NextLayoutByLowArcOrBottomSwipePastXDistanceThreshold");
        goto LABEL_90;
      }
      v62 = CFSTR("PreviousLayoutByLowArcOrBottomSwipePastXDistanceThreshold");
      goto LABEL_92;
    }
    if (v30)
    {
      v34 = 0;
      finalDestinationReason = self->_finalDestinationReason;
      v65 = CFSTR("AppSwitcherByPausing");
      goto LABEL_97;
    }
    if (v31)
    {
      v37 = 0;
      finalDestinationReason = self->_finalDestinationReason;
      v67 = CFSTR("CurrentLayoutByMovingDownwardWithinSlope");
LABEL_88:
      self->_finalDestinationReason = &v67->isa;
      v34 = 1;
      goto LABEL_34;
    }
    if (!v32
      || v19 <= *(double *)&kMinimumYVelocityForArcSwipe && v25 >= *(double *)&kMaximumYDistanceToTriggerArcByFlick)
    {
      v34 = 0;
      finalDestinationReason = self->_finalDestinationReason;
      v65 = CFSTR("AppSwitcherByNotFulfillingArcThresholds");
      goto LABEL_97;
    }
    if (v27 < *(double *)&kMinimumXDistanceForFirstArcSwipe && !self->_continuingGesture)
    {
      v37 = 0;
      finalDestinationReason = self->_finalDestinationReason;
      v67 = CFSTR("CurrentLayoutInsteadOfArcBecauseAtLeastOneGestureNotCompleted?");
      goto LABEL_88;
    }
    if (-[SBHomeGestureFinalDestinationSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    {
      if (p_velocity->x <= 0.0)
      {
LABEL_102:
        finalDestinationReason = self->_finalDestinationReason;
        self->_finalDestinationReason = (NSString *)CFSTR("NextLayoutByArc");
        v34 = 1;
        v37 = 2;
        goto LABEL_34;
      }
    }
    else if (p_velocity->x >= 0.0)
    {
      goto LABEL_102;
    }
    finalDestinationReason = self->_finalDestinationReason;
    self->_finalDestinationReason = (NSString *)CFSTR("PreviousLayoutByArc");
    v34 = 1;
    v37 = 1;
    goto LABEL_34;
  }
  v34 = 0;
  finalDestinationReason = self->_finalDestinationReason;
  v36 = CFSTR("HomeByUnconditionalOrVerticalMotionVelocityThreshold");
LABEL_33:
  self->_finalDestinationReason = &v36->isa;
  v37 = 4;
LABEL_34:

  isMouseEvent = self->_isMouseEvent;
  v39 = -[SBHomeGestureFinalDestinationSwitcherModifier _hasTraveledSufficientDistanceForHomeOrAppSwitcherForMouseEvent:](self, "_hasTraveledSufficientDistanceForHomeOrAppSwitcherForMouseEvent:", self->_isMouseEvent);
  if ((v34 & 1) == 0 && !v39)
  {
    v40 = self->_finalDestinationReason;
    self->_finalDestinationReason = (NSString *)CFSTR("CurrentLayoutByNotTravelingSufficientYDistance");

    v37 = 0;
  }
  if (isMouseEvent)
  {
    startingEnvironmentMode = self->_startingEnvironmentMode;
    if (v37 == 3 && startingEnvironmentMode != 1)
    {
      v42 = self->_finalDestinationReason;
      self->_finalDestinationReason = (NSString *)CFSTR("HomeByIndirectMousePanGesture");
      v37 = 4;
LABEL_44:

      goto LABEL_45;
    }
    if (v37 == 4 && startingEnvironmentMode == 1)
    {
      v42 = self->_finalDestinationReason;
      self->_finalDestinationReason = (NSString *)CFSTR("AppSwitcherByIndirectMousePanGestureOnHomeScreen");
      v37 = 3;
      goto LABEL_44;
    }
  }
LABEL_45:
  dockModifier = self->_dockModifier;
  if (dockModifier)
  {
    v44 = -[SBHomeGestureDockSwitcherModifier adjustedFinalDestinationForDestination:withTranslation:velocity:](dockModifier, "adjustedFinalDestinationForDestination:withTranslation:velocity:", v37, x, y, self->_velocity.x, self->_velocity.y);
    if (v37 != v44)
    {
      v45 = v44;
      v46 = self->_finalDestinationReason;
      self->_finalDestinationReason = (NSString *)CFSTR("CurrentLayoutByNotTravelingSufficientYDistanceForDock");

      v37 = v45;
    }
  }
  v47 = x + v10;
  v48 = self->_startingEnvironmentMode != 2 || v29;
  if ((unint64_t)(v37 - 3) >= 0xFFFFFFFFFFFFFFFELL && (v48 & 1) == 0)
  {
    v49 = self->_finalDestinationReason;
    self->_finalDestinationReason = (NSString *)CFSTR("AppSwitcherBecauseAlreadyInAppSwitcher");

    v37 = 3;
  }
  v50 = -[SBHomeGestureFinalDestinationSwitcherModifier _adjustedFinalDestinationAccountingForEdgeDataDistortion:location:](self, "_adjustedFinalDestinationAccountingForEdgeDataDistortion:location:", v37, v47, v33);
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "isInSetupMode");

  if (v52 && v50 != 4)
  {
    v53 = self->_finalDestinationReason;
    self->_finalDestinationReason = (NSString *)CFSTR("CurrentLayoutInBuddyBecauseHomeFailed");

    return 0;
  }
  return v50;
}

- (id)studyLogData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_adaptiveMinimumYVelocityForHome);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("adaptiveMinimumYVelocityForHome"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_adaptivePauseVelocityThresholdForAppSwitcher);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("adaptiveVelocityAbsForAppSwitcher"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_adaptiveVelocitySlopeThresholdForArc);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("adaptiveVelocitySlopeThresholdForArc"));

  return v3;
}

- (id)debugDescription
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
  SBHomeGestureFinalDestinationSwitcherModifier *v13;

  -[SBChainableModifier descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", &stru_1E8EC7EC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendSuper");
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __65__SBHomeGestureFinalDestinationSwitcherModifier_debugDescription__block_invoke;
  v11 = &unk_1E8E9E820;
  v12 = v3;
  v13 = self;
  v5 = v3;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, CFSTR("\t"), &v8);
  objc_msgSend(v5, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __65__SBHomeGestureFinalDestinationSwitcherModifier_debugDescription__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
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

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("initialTranslationAdjustment"), *(double *)(*(_QWORD *)(a1 + 40) + 96), *(double *)(*(_QWORD *)(a1 + 40) + 104));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("translation"), *(double *)(*(_QWORD *)(a1 + 40) + 120), *(double *)(*(_QWORD *)(a1 + 40) + 128));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("velocity"), *(double *)(*(_QWORD *)(a1 + 40) + 136), *(double *)(*(_QWORD *)(a1 + 40) + 144));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("lastTouchTimestamp"), *(double *)(*(_QWORD *)(a1 + 40) + 152));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("lastAverageVelocityYForAcceleration"), *(double *)(*(_QWORD *)(a1 + 40) + 160));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("initialTouchLocation"), *(double *)(*(_QWORD *)(a1 + 40) + 168), *(double *)(*(_QWORD *)(a1 + 40) + 176));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("lastTouchLocation"), *(double *)(*(_QWORD *)(a1 + 40) + 184), *(double *)(*(_QWORD *)(a1 + 40) + 192));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("directionSwitchLocation"), *(double *)(*(_QWORD *)(a1 + 40) + 200), *(double *)(*(_QWORD *)(a1 + 40) + 208));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 216), CFSTR("movingTowardsNextLayoutState"));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("adaptiveMinimumYVelocityForHome"), *(double *)(*(_QWORD *)(a1 + 40) + 224));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("adaptivePauseVelocityThresholdForAppSwitcher"), *(double *)(*(_QWORD *)(a1 + 40) + 232));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("adaptiveVelocitySlopeThresholdForArc"), *(double *)(*(_QWORD *)(a1 + 40) + 240));
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("lastFinalDestination"), *(double *)(*(_QWORD *)(a1 + 40) + 248));
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 256), CFSTR("edgeRegionSampleCounter"));
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 264), CFSTR("updateEdgeRegionSampleCounter"));
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 296), CFSTR("scrunchInitiated"));
  v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 288) == 2, CFSTR("startingInAppSwitcher"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 297), CFSTR("continuingGesture"));
}

- (int64_t)_adjustedFinalDestinationAccountingForEdgeDataDistortion:(int64_t)a3 location:(CGPoint)a4
{
  double x;
  BOOL v7;
  double v8;
  NSString *finalDestinationReason;

  x = a4.x;
  -[SBHomeGestureFinalDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds", a4.x, a4.y);
  v7 = x >= *(double *)&kEdgeDistanceToCorrectGestureFinalDestination;
  if (vabdd_f64(v8, x) < *(double *)&kEdgeDistanceToCorrectGestureFinalDestination)
    v7 = 0;
  if ((unint64_t)(a3 - 1) < 2 || v7 || self->_lastFinalDestination != 3.0 || self->_edgeRegionSampleCounter > 10)
  {
    if (self->_updateEdgeRegionSampleCounter)
      self->_edgeRegionSampleCounter = 0;
  }
  else
  {
    finalDestinationReason = self->_finalDestinationReason;
    self->_finalDestinationReason = (NSString *)CFSTR("AppSwitcherBecauseLatchedByEdgeDistortionCompensation");

    if (self->_updateEdgeRegionSampleCounter)
      ++self->_edgeRegionSampleCounter;
    return 3;
  }
  return a3;
}

- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcherForMouseEvent:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  uint64_t *v6;

  v3 = a3;
  -[SBHomeGestureFinalDestinationSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v6 = &kMinimumYDistanceForHomeOrAppSwitcherForMouseEvent;
  if (!v3)
    v6 = &kMinimumYDistanceForHomeOrAppSwitcher_0;
  return self->_lastTouchLocation.y <= v5 - *(double *)v6;
}

- (void)_updateAdaptiveThresholdsForCurrentFinalDestination:(int64_t)a3 velocityAverage:(CGPoint)a4
{
  double v5;

  -[SBHomeGestureDockSwitcherModifier isCurrentlyTrackingDock](self->_dockModifier, "isCurrentlyTrackingDock");
  BSFloatByLinearlyInterpolatingFloats();
  self->_adaptiveMinimumYVelocityForHome = v5;
  self->_adaptivePauseVelocityThresholdForAppSwitcher = fabs(v5);
}

- (BOOL)_isTranslationPastDistanceThresholdToUnconditionallyGoHome:(double)a3
{
  double v3;
  double v4;

  v3 = -a3;
  -[SBHomeGestureFinalDestinationSwitcherModifier _unconditionalDistanceThresholdForHome](self, "_unconditionalDistanceThresholdForHome");
  return v4 < v3;
}

- (double)_unconditionalDistanceThresholdForHome
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_finalDestinationDelegate);
  objc_msgSend(WeakRetained, "unconditionalDistanceThresholdForHome");
  v4 = v3;

  return v4;
}

- (void)_applyPrototypeSettings
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  id v26;

  v3 = SBMainScreenPointsPerMillimeter();
  -[SBHomeGestureFinalDestinationSwitcherModifier homeGestureSettings](self, "homeGestureSettings");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "pauseVelocityThresholdForAppSwitcher");
  *(double *)&kPauseVelocityThresholdForAppSwitcher_0 = v3 * v4;
  objc_msgSend(v26, "velocityXThresholdForUnconditionalArcSwipe");
  *(double *)&kVelocityXThresholdForUnconditionalArcSwipe_0 = v3 * v5;
  objc_msgSend(v26, "maximumYDistanceToTriggerArcByDistance");
  *(double *)&kMaximumYDistanceToTriggerArcByDistance = v3 * v6;
  *(double *)&kMinimumYDistanceForHomeOrAppSwitcher_0 = v3 * self->_minYDistanceForHomeOrSwitcher;
  objc_msgSend(v26, "minimumYDistanceForHomeOrAppSwitcher");
  *(double *)&kMinimumYDistanceForHomeOrAppSwitcherForMouseEvent = v3 * v7;
  objc_msgSend(v26, "minimumYDistanceToConsiderAccelerationDip");
  *(double *)&kMinimumYDistanceToConsiderAccelerationDip = v3 * v8;
  objc_msgSend(v26, "minimumXDistanceForFirstArcSwipe");
  *(double *)&kMinimumXDistanceForFirstArcSwipe = v3 * v9;
  objc_msgSend(v26, "minimumXDistanceToTriggerArcByDistancePortrait");
  *(double *)&kMinimumXDistanceToTriggerArcByDistancePortrait = v3 * v10;
  objc_msgSend(v26, "minimumXDistanceToTriggerArcByDistanceLandscape");
  *(double *)&kMinimumXDistanceToTriggerArcByDistanceLandscape = v3 * v11;
  objc_msgSend(v26, "maximumYDistanceToTriggerArcByFlick");
  *(double *)&kMaximumYDistanceToTriggerArcByFlick = v3 * v12;
  objc_msgSend(v26, "velocityYThresholdForUnconditionalHome");
  *(double *)&kVelocityYThresholdForUnconditionalHome = v3 * v13;
  objc_msgSend(v26, "minimumYVelocityForHome");
  *(double *)&kMinimumYVelocityForHome = v3 * v14;
  objc_msgSend(v26, "minimumYVelocityForArcSwipe");
  *(double *)&kMinimumYVelocityForArcSwipe = v3 * v15;
  objc_msgSend(v26, "pauseVelocityThresholdForDefiniteAppSwitcher");
  *(double *)&kPauseVelocityThresholdForDefiniteAppSwitcher = v3 * v16;
  objc_msgSend(v26, "maximumAdaptivePauseVelocityThresholdForAppSwitcher");
  *(double *)&kMaximumAdaptivePauseVelocityThresholdForAppSwitcher = v3 * v17;
  kSnapToMaxVelocityThresholdAfterAccelerationDip = objc_msgSend(v26, "snapToMaxVelocityThresholdAfterAccelerationDip");
  objc_msgSend(v26, "maximumAdaptiveVelocityThresholdForDock");
  *(double *)&kMaximumAdaptiveVelocityThresholdForDock = v3 * v18;
  objc_msgSend(v26, "appSwitcherVelocityThresholdIncreasingRateFraction");
  kAppSwitcherVelocityThresholdIncreasingRateFraction = v19;
  objc_msgSend(v26, "dockVelocityThresholdIncreasingRateFraction");
  kDockVelocityThresholdIncreasingRateFraction = v20;
  objc_msgSend(v26, "adaptiveThresholdsDecreasingRateFraction");
  kAdaptiveThresholdsDecreasingRateFraction = v21;
  objc_msgSend(v26, "velocitySlopeThresholdForBottomSwipeUpArc");
  kVelocitySlopeThresholdForBottomSwipeUpArc = v22;
  objc_msgSend(v26, "velocitySlopeThresholdForScrunchArc");
  kVelocitySlopeThresholdForScrunchArc = v23;
  objc_msgSend(v26, "velocitySlopeThresholdForCurrentLayout");
  kVelocitySlopeThresholdForCurrentLayout = v24;
  objc_msgSend(v26, "edgeDistanceToCorrectGestureFinalDestination");
  *(double *)&kEdgeDistanceToCorrectGestureFinalDestination = v3 * v25;

}

- (NSString)finalDestinationReason
{
  return self->_finalDestinationReason;
}

- (BOOL)hasSeenAccelerationDipForAppSwitcher
{
  return self->_hasSeenAccelerationDipForAppSwitcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalDestinationReason, 0);
  objc_destroyWeak((id *)&self->_finalDestinationDelegate);
  objc_storeStrong((id *)&self->_dockModifier, 0);
}

@end
