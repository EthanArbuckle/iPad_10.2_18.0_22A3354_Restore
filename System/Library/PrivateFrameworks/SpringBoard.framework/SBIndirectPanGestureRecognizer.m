@implementation SBIndirectPanGestureRecognizer

- (SBIndirectPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 edges:(unint64_t)a5
{
  SBIndirectPanGestureRecognizer *v5;
  SBIndirectPanGestureRecognizer *v7;
  SBIndirectPanGestureRecognizer *v8;
  id translationAdjustmentBlock;
  CGPoint v10;
  NSTimer *mouseIdleTimer;
  double v12;
  NSTimer *trackpadIdleTimer;
  double v14;
  SBTouchHistory *v15;
  SBTouchHistory *touchHistory;
  NSValue *gestureStartLocation;
  SBIndirectPanGestureRecognizer *v18;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  objc_super v25;

  v5 = self;
  if (a5)
  {
    v25.receiver = self;
    v25.super_class = (Class)SBIndirectPanGestureRecognizer;
    v7 = -[SBIndirectPanGestureRecognizer initWithTarget:action:](&v25, sel_initWithTarget_action_, a3, a4);
    v8 = v7;
    if (v7)
    {
      v7->_edges = a5;
      v7->_avoidActivatingForExternallyOwnedEdges = 1;
      v7->_shouldCancelAfterMovingAwayFromEdge = 1;
      v7->_shouldInvertXAxis = 0;
      v7->_shouldInvertYAxis = 0;
      v7->_pausedUntilTouchedUpOrMovedAwayFromEdge = 0;
      translationAdjustmentBlock = v7->_translationAdjustmentBlock;
      v7->_translationAdjustmentBlock = 0;

      v8->_shouldActivateWithThreshold = 1;
      v8->_activationRecognitionDistance = 80.0;
      v8->_endReason = 0;
      v8->_currentInputType = 2;
      v10 = (CGPoint)*MEMORY[0x1E0C9D538];
      v8->_origin = (CGPoint)*MEMORY[0x1E0C9D538];
      v8->_lastKnownPoint = v10;
      v8->_activatedEdge = 0;
      mouseIdleTimer = v8->_mouseIdleTimer;
      v8->_mouseIdleTimer = 0;

      BSContinuousMachTimeNow();
      v8->_lastKnownMouseEventTimestamp = v12;
      trackpadIdleTimer = v8->_trackpadIdleTimer;
      v8->_trackpadIdleTimer = 0;

      BSContinuousMachTimeNow();
      v8->_lastKnownTrackpadEventTimestamp = v14;
      objc_storeWeak((id *)&v8->_currentHoverEvent, 0);
      objc_storeWeak((id *)&v8->_currentTouch, 0);
      v15 = objc_alloc_init(SBTouchHistory);
      touchHistory = v8->_touchHistory;
      v8->_touchHistory = v15;

      v8->_shouldRequireGestureToStartAtEdge = 0;
      v8->_trackpadHysteresis = 0.0;
      v8->_mouseHysteresis = 0.0;
      gestureStartLocation = v8->_gestureStartLocation;
      v8->_gestureStartLocation = 0;

      v8->_mouseEnteredNearEdgeRegionTimestamp = -1.79769313e308;
      v8->_gesturePassedThroughScreenCenterRegion = 0;
      v8->_lastMouseActivationTimestamp = -1.79769313e308;
      -[SBIndirectPanGestureRecognizer setAllowedTouchTypes:](v8, "setAllowedTouchTypes:", &unk_1E91CEE00);
    }
    v5 = v8;
    v18 = v5;
  }
  else
  {
    SBLogSystemGesture();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SBIndirectPanGestureRecognizer initWithTarget:action:edges:].cold.1(v20, v21, v22);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("SBIndirectPanGestureRecognizer.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("edges != UIRectEdgeNone"));

    v18 = 0;
  }

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[BSAbsoluteMachTimer invalidate](self->_watchdogTimer, "invalidate");
  -[BSInvalidatable invalidate](self->_logCaptureHandle, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBIndirectPanGestureRecognizer;
  -[SBIndirectPanGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)setState:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBIndirectPanGestureRecognizer;
  -[SBIndirectPanGestureRecognizer setState:](&v5, sel_setState_);
  if ((unint64_t)(a3 - 1) <= 4)
    -[SBIndirectPanGestureRecognizer _resetWatchdogIfNecessary](self, "_resetWatchdogIfNecessary");
}

- (void)reset
{
  objc_super v3;

  _SBIndirectGestureLog(self, CFSTR("Resetting gesture"));
  v3.receiver = self;
  v3.super_class = (Class)SBIndirectPanGestureRecognizer;
  -[SBIndirectPanGestureRecognizer reset](&v3, sel_reset);
  -[SBIndirectPanGestureRecognizer _resetWatchdogIfNecessary](self, "_resetWatchdogIfNecessary");
  -[SBIndirectPanGestureRecognizer _resetTranslationState](self, "_resetTranslationState");
}

- (void)_resetTranslationState
{
  NSTimer *mouseIdleTimer;
  double v4;
  NSTimer *trackpadIdleTimer;
  double v6;
  CGPoint v7;

  self->_endReason = 0;
  -[NSTimer invalidate](self->_mouseIdleTimer, "invalidate");
  mouseIdleTimer = self->_mouseIdleTimer;
  self->_mouseIdleTimer = 0;

  v7 = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_origin = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_lastKnownPoint = v7;
  BSContinuousMachTimeNow();
  self->_lastKnownMouseEventTimestamp = v4;
  -[NSTimer invalidate](self->_trackpadIdleTimer, "invalidate");
  trackpadIdleTimer = self->_trackpadIdleTimer;
  self->_trackpadIdleTimer = 0;

  BSContinuousMachTimeNow();
  self->_lastKnownTrackpadEventTimestamp = v6;
  self->_activatedEdge = 0;
  self->_currentInputType = 2;
  self->_translationWithinHysteresisRange = v7;
  -[SBTouchHistory reset](self->_touchHistory, "reset");
  objc_storeWeak((id *)&self->_currentHoverEvent, 0);
  objc_storeWeak((id *)&self->_currentTouch, 0);
}

- (BOOL)_shouldReceiveEvent:(id)a3
{
  return objc_msgSend(a3, "type") == 11;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  void *v5;
  id WeakRetained;
  id v7;
  BOOL v8;
  BOOL v9;

  -[SBIndirectPanGestureRecognizer containerView](self, "containerView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentTouch);
  v7 = objc_loadWeakRetained((id *)&self->_currentHoverEvent);
  if (v7)
    v8 = WeakRetained == 0;
  else
    v8 = 1;
  if (v8
    || v5
    && (-[SBIndirectPanGestureRecognizer _pointerModelLocation](self, "_pointerModelLocation"),
        (self->_edges & -[SBIndirectPanGestureRecognizer _edgeForPointerModelLocation:inView:inset:](self, "_edgeForPointerModelLocation:inView:inset:", v5)) != 0))
  {
    -[SBIndirectPanGestureRecognizer _startWatchdogTimerIfNecessary](self, "_startWatchdogTimerIfNecessary");
    -[BSAuditHistory addItemWithFormat:](self->_auditHistory, "addItemWithFormat:", CFSTR("ShouldReceiveEvent"));
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_hoverEntered:(id)a3 withEvent:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSValue *v10;
  NSValue *gestureStartLocation;
  id v12;

  v12 = a3;
  v6 = a4;
  -[BSAuditHistory addItemWithFormat:](self->_auditHistory, "addItemWithFormat:", CFSTR("hoverEntered:withEvent:"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentHoverEvent);
  if (!WeakRetained)
  {
    if (objc_msgSend(v12, "count") == 1)
    {
      -[SBIndirectPanGestureRecognizer _resetTranslationState](self, "_resetTranslationState");
      WeakRetained = v6;
      objc_storeWeak((id *)&self->_currentHoverEvent, WeakRetained);
      objc_msgSend(v12, "anyObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_currentTouch, v8);

    }
    else
    {
      WeakRetained = 0;
    }
  }
  objc_msgSend(WeakRetained, "allTouches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIndirectPanGestureRecognizer updateTouchHistoryWithTouches:](self, "updateTouchHistoryWithTouches:", v9);

  if (!self->_gestureStartLocation)
  {
    -[SBIndirectPanGestureRecognizer _pointerModelLocation](self, "_pointerModelLocation");
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:");
    v10 = (NSValue *)objc_claimAutoreleasedReturnValue();
    gestureStartLocation = self->_gestureStartLocation;
    self->_gestureStartLocation = v10;

  }
  -[SBIndirectPanGestureRecognizer _setUpIdleTimersIfNeededForEvent:](self, "_setUpIdleTimersIfNeededForEvent:", v6);

}

- (void)_hoverMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  BOOL v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  NSObject *v28;
  double v29;
  char v30;
  _BOOL4 v31;
  double v32;
  char v33;
  unint64_t v34;
  char v35;
  __CFString *v36;
  SBIndirectPanGestureRecognizer *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  const __CFString *v49;
  double v50;
  void *v51;
  void *v52;
  id v53;
  unsigned int v54;
  unint64_t v55;
  unint64_t v56;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentTouch);
  v7 = objc_loadWeakRetained((id *)&self->_currentHoverEvent);
  v8 = v7;
  if (WeakRetained)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = CFSTR("NOT ");
    if (WeakRetained)
      v11 = CFSTR("NOT ");
    else
      v11 = &stru_1E8EC7EC0;
    if (!v7)
      v10 = &stru_1E8EC7EC0;
    -[BSAuditHistory addItemWithFormat:](self->_auditHistory, "addItemWithFormat:", CFSTR("hoverMoved:withEvent: - currentTouch is %@nil - currentHoverEvent is %@nil"), v11, v10);
  }
  if (objc_msgSend(WeakRetained, "phase") == 6)
  {
    objc_msgSend(v8, "allTouches");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIndirectPanGestureRecognizer updateTouchHistoryWithTouches:](self, "updateTouchHistoryWithTouches:", v12);

    -[SBIndirectPanGestureRecognizer _pointerModelLocation](self, "_pointerModelLocation");
    v14 = v13;
    v16 = v15;
    -[SBIndirectPanGestureRecognizer containerView](self, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((self->_edges & -[SBIndirectPanGestureRecognizer _edgeForPointerModelLocation:inView:inset:](self, "_edgeForPointerModelLocation:inView:inset:", v17, v14, v16, 30.0)) != 0|| (self->_edges & -[SBIndirectPanGestureRecognizer _edgeForPointerModelLocation:inView:inset:](self, "_edgeForPointerModelLocation:inView:inset:", v17, v14, v16, 100.0)) != 0)
    {
      if (self->_mouseEnteredNearEdgeRegionTimestamp == -1.79769313e308)
      {
        BSContinuousMachTimeNow();
        self->_mouseEnteredNearEdgeRegionTimestamp = v18;
      }
    }
    else
    {
      self->_mouseEnteredNearEdgeRegionTimestamp = -1.79769313e308;
      self->_gesturePassedThroughScreenCenterRegion = 1;
    }
    v55 = -[SBIndirectPanGestureRecognizer _edgeForPointerModelLocation:inView:inset:](self, "_edgeForPointerModelLocation:inView:inset:", v17, v14, v16, 1.0);
    v56 = self->_edges & v55;
    if (v56 && self->_avoidActivatingForExternallyOwnedEdges)
    {
      v19 = v17;
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "universalControlServer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "externalProcessActiveOnScreenEdges");

      if ((v55 & ~v22) != 0)
      {
        v23 = 0;
      }
      else
      {
        -[BSAuditHistory addItemWithFormat:](self->_auditHistory, "addItemWithFormat:", CFSTR("hoverMoved:withEvent: - externally controlled edges: %lu contains current edge: %lu"), v22, v55);
        v23 = 1;
      }
      v17 = v19;
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v5, "_hidEvent");
    v24 = (void *)SBPointerHIDSubEventFromEvent();
    if (!v24 || (BKSHIDEventGetPointerAttributes(), (v25 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[BSAuditHistory addItemWithFormat:](self->_auditHistory, "addItemWithFormat:", CFSTR("hoverMoved:withEvent: - bailing because pointer attributes is nil"));
      SBLogSystemGesture();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[SBIndirectPanGestureRecognizer _hoverMoved:withEvent:].cold.1(v24, v28);

      v26 = 0;
      goto LABEL_80;
    }
    v26 = v25;
    v52 = v17;
    v54 = SBPointerEventIsTrackpadEvent(v25);
    if ((v54 & 1) != 0)
    {
      self->_currentInputType = 0;
      v27 = SBPointerEventRepresentsTrackpadTouchUp(v26);
    }
    else
    {
      v27 = 0;
      self->_currentInputType = 1;
    }
    v53 = v5;
    BSContinuousMachTimeNow();
    if (self->_pausedUntilTouchedUpOrMovedAwayFromEdge)
    {
      v30 = v56 ? v27 : 1;
      if ((v30 & 1) != 0 || v29 - self->_lastKnownMouseEventTimestamp >= 0.15)
        self->_pausedUntilTouchedUpOrMovedAwayFromEdge = 0;
    }
    v31 = !SBPointerEventHasMovementOnAxis(v26, 3);
    if (((v54 | v31) & 1) == 0)
    {
      BSContinuousMachTimeNow();
      self->_lastKnownMouseEventTimestamp = v32;
    }
    if (v54)
    {
      -[SBIndirectPanGestureRecognizer _setUpIdleTimersIfNeededForEvent:](self, "_setUpIdleTimersIfNeededForEvent:", v53);
      if (!v56
        && self->_shouldRequireGestureToStartAtEdge
        && !self->_gesturePassedThroughScreenCenterRegion
        && (self->_edges & -[SBIndirectPanGestureRecognizer _edgeForPointerModelLocation:inView:inset:](self, "_edgeForPointerModelLocation:inView:inset:", v52, v14, v16, 100.0)) == 0)
      {
        self->_gesturePassedThroughScreenCenterRegion = 1;
      }
    }
    if (-[SBIndirectPanGestureRecognizer state](self, "state"))
    {
      if (-[SBIndirectPanGestureRecognizer state](self, "state") == 1)
      {
        if (v56)
          v33 = v27;
        else
          v33 = 1;
        if ((v33 & 1) != 0)
        {
          v34 = (v27 & 1) != 0 || self->_pausedUntilTouchedUpOrMovedAwayFromEdge;
          v5 = v53;
          self->_endReason = v34;
          _SBIndirectGestureLog(self, CFSTR("Pointer either moved away from active edge, or got touch up. Moving from Began to Ended"));
LABEL_77:
          v37 = self;
          v38 = 3;
LABEL_78:
          -[SBIndirectPanGestureRecognizer setState:](v37, "setState:", v38);
          goto LABEL_79;
        }
        -[SBIndirectPanGestureRecognizer _updateTranslationWithPointerEventAttributes:activeEdge:](self, "_updateTranslationWithPointerEventAttributes:activeEdge:", v26, v55);
        objc_msgSend(v8, "allTouches");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIndirectPanGestureRecognizer updateTouchHistoryWithTouches:](self, "updateTouchHistoryWithTouches:", v39);

        -[SBIndirectPanGestureRecognizer containerView](self, "containerView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "_fbsDisplayConfiguration");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "hardwareIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        BKSHIDServicesCancelTouchesOnDisplay();
        _SBIndirectGestureLog(self, CFSTR("Pointer is on active edge; moving from state Began to Changed."));
        -[SBIndirectPanGestureRecognizer setState:](self, "setState:", 2);

        goto LABEL_73;
      }
      v5 = v53;
      if (-[SBIndirectPanGestureRecognizer state](self, "state") == 2)
      {
        if (!v27)
        {
          if (v56 || !self->_shouldCancelAfterMovingAwayFromEdge)
          {
            -[SBIndirectPanGestureRecognizer setState:](self, "setState:", 2);
            -[SBIndirectPanGestureRecognizer _updateTranslationWithPointerEventAttributes:activeEdge:](self, "_updateTranslationWithPointerEventAttributes:activeEdge:", v26, v55);
            objc_msgSend(v8, "allTouches");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBIndirectPanGestureRecognizer updateTouchHistoryWithTouches:](self, "updateTouchHistoryWithTouches:", v43);

            if (self->_shouldActivateWithThreshold)
              v44 = v54;
            else
              v44 = 1;
            if ((v44 & 1) == 0)
            {
              v17 = v52;
              -[SBIndirectPanGestureRecognizer translationInView:](self, "translationInView:", v52);
              if (-[SBIndirectPanGestureRecognizer _hasTranslationReachedThreshold:withTranslation:forEdge:](self, "_hasTranslationReachedThreshold:withTranslation:forEdge:", v55, self->_activationRecognitionDistance, v45, v46))
              {
                _SBIndirectGestureLog(self, CFSTR("Moving to state Ended because the mouse threshold was reached"));
                self->_endReason = 3;
                BSContinuousMachTimeNow();
                self->_lastMouseActivationTimestamp = v47;
                -[SBIndirectPanGestureRecognizer setState:](self, "setState:", 3);
                -[SBIndirectPanGestureRecognizer setPausedUntilTouchedUpOrMovedAwayFromEdge:](self, "setPausedUntilTouchedUpOrMovedAwayFromEdge:", 1);
              }
              goto LABEL_80;
            }
            goto LABEL_79;
          }
          _SBIndirectGestureLog(self, CFSTR("Moving to state Cancelled; pointer moved away from active edge"));
          self->_endReason = 2;
          v37 = self;
          v38 = 4;
          goto LABEL_78;
        }
        _SBIndirectGestureLog(self, CFSTR("Moving to state Ended due to touch-up event"));
        self->_endReason = 1;
        goto LABEL_77;
      }
LABEL_79:
      v17 = v52;
LABEL_80:

      goto LABEL_81;
    }
    if (v56)
      v35 = v27;
    else
      v35 = 1;
    if ((v35 & 1) != 0)
    {
      v5 = v53;
      if ((v27 | v54 ^ 1) == 1)
      {
        if (v27)
          v36 = CFSTR("Moving from Possible to Failed because of a touch-up");
        else
          v36 = CFSTR("Moving from Possible to Failed because we're not on the correct edge");
        _SBIndirectGestureLog(self, v36);
        v37 = self;
        v38 = 5;
        goto LABEL_78;
      }
      -[BSAuditHistory addItemWithFormat:](self->_auditHistory, "addItemWithFormat:", CFSTR("hoverMoved:withEvent: - not moving to began/failed because isPointerOnActiveEdge: %d isTouchUp: %d isMouseEvent: %d"), v56 != 0, 0, 0);
      goto LABEL_79;
    }
    if (((v23 | v31) & 1) != 0 || self->_pausedUntilTouchedUpOrMovedAwayFromEdge)
    {
      _SBIndirectGestureLog(self, CFSTR("Pointer event has a zero offset, moving to Failed"));
      -[SBIndirectPanGestureRecognizer setState:](self, "setState:", 5);
LABEL_73:
      v5 = v53;
      goto LABEL_79;
    }
    self->_origin.x = v14;
    self->_origin.y = v16;
    self->_lastKnownPoint.x = v14;
    self->_lastKnownPoint.y = v16;
    -[SBIndirectPanGestureRecognizer _updateTranslationWithPointerEventAttributes:activeEdge:](self, "_updateTranslationWithPointerEventAttributes:activeEdge:", v26, v55);
    objc_msgSend(v8, "allTouches");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIndirectPanGestureRecognizer updateTouchHistoryWithTouches:](self, "updateTouchHistoryWithTouches:", v48);

    v17 = v52;
    v5 = v53;
    if (v52)
    {
      if (self->_shouldRequireGestureToStartAtEdge)
      {
        if (v54)
        {
          -[NSValue pointValue](self->_gestureStartLocation, "pointValue");
          if (-[SBIndirectPanGestureRecognizer _edgeForPointerModelLocation:inView:inset:](self, "_edgeForPointerModelLocation:inView:inset:", v52) != v55)
          {
            v49 = CFSTR("Trackpad gesture did not start near the edge.");
            goto LABEL_103;
          }
          if (self->_gesturePassedThroughScreenCenterRegion)
          {
            v49 = CFSTR("Trackpad gesture started near the edge, but left the region before coming back.");
LABEL_103:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Moving to state Failed; shouldBegin is NO. Reason: %@"),
              v49);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            _SBIndirectGestureLog(self, v51);
            -[SBIndirectPanGestureRecognizer setState:](self, "setState:", 5);

            v5 = v53;
            goto LABEL_80;
          }
        }
        else if (self->_mouseEnteredNearEdgeRegionTimestamp == -1.79769313e308
               || (BSContinuousMachTimeNow(), v50 - self->_mouseEnteredNearEdgeRegionTimestamp <= 0.25))
        {
          v49 = CFSTR("Mouse pointer has not spent enough time on the edge to be considered a second pan.");
          goto LABEL_103;
        }
      }
      self->_activatedEdge = v55;
      _SBIndirectGestureLog(self, CFSTR("Moving to state Began"));
      -[SBIndirectPanGestureRecognizer setState:](self, "setState:", 1);
      goto LABEL_80;
    }
    v49 = CFSTR("System gesture view is nil");
    goto LABEL_103;
  }
  -[BSAuditHistory addItemWithFormat:](self->_auditHistory, "addItemWithFormat:", CFSTR("hoverMoved:withEvent: - bailing because current touch is: %@ with phase: %ld"), WeakRetained, objc_msgSend(WeakRetained, "phase"));
LABEL_81:

}

- (void)_hoverExited:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  -[SBIndirectPanGestureRecognizer _resetTranslationState](self, "_resetTranslationState", a3, a4);
  if (-[SBIndirectPanGestureRecognizer state](self, "state") == 1)
  {
    v5 = 3;
  }
  else if (-[SBIndirectPanGestureRecognizer state](self, "state") == 2)
  {
    v5 = 3;
  }
  else
  {
    v5 = 5;
  }
  -[SBIndirectPanGestureRecognizer setState:](self, "setState:", v5);
}

- (void)_hoverCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  -[SBIndirectPanGestureRecognizer _resetTranslationState](self, "_resetTranslationState", a3, a4);
  if (-[SBIndirectPanGestureRecognizer state](self, "state") == 1)
  {
    v5 = 4;
  }
  else if (-[SBIndirectPanGestureRecognizer state](self, "state") == 2)
  {
    v5 = 4;
  }
  else
  {
    v5 = 5;
  }
  -[SBIndirectPanGestureRecognizer setState:](self, "setState:", v5);
}

- (void)_setUpIdleTimersIfNeededForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id *v7;
  NSTimer *v8;
  NSTimer *trackpadIdleTimer;
  void *v10;
  void *v11;
  NSTimer *v12;
  NSTimer *mouseIdleTimer;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  objc_msgSend(v4, "_hidEvent");
  if (SBPointerHIDSubEventFromEvent())
  {
    BKSHIDEventGetPointerAttributes();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if ((SBPointerEventIsTrackpadEvent(v5) & 1) != 0)
  {
    if (!self->_trackpadIdleTimer)
    {
      _SBIndirectGestureLog(self, CFSTR("Creating a new trackpad idle timer."));
      objc_initWeak(&location, self);
      v6 = (void *)MEMORY[0x1E0C99E88];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __67__SBIndirectPanGestureRecognizer__setUpIdleTimersIfNeededForEvent___block_invoke_2;
      v14[3] = &unk_1E8E9FA90;
      v7 = &v15;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v6, "timerWithTimeInterval:repeats:block:", 1, v14, 0.1);
      v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      trackpadIdleTimer = self->_trackpadIdleTimer;
      self->_trackpadIdleTimer = v8;

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addTimer:forMode:", self->_trackpadIdleTimer, *MEMORY[0x1E0C99860]);
LABEL_9:

      objc_destroyWeak(v7);
      objc_destroyWeak(&location);
    }
  }
  else if (!self->_mouseIdleTimer)
  {
    _SBIndirectGestureLog(self, CFSTR("Creating a new mouse idle timer."));
    objc_initWeak(&location, self);
    v11 = (void *)MEMORY[0x1E0C99E88];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__SBIndirectPanGestureRecognizer__setUpIdleTimersIfNeededForEvent___block_invoke;
    v16[3] = &unk_1E8E9FA90;
    v7 = &v17;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v11, "timerWithTimeInterval:repeats:block:", 1, v16, 0.1);
    v12 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    mouseIdleTimer = self->_mouseIdleTimer;
    self->_mouseIdleTimer = v12;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTimer:forMode:", self->_mouseIdleTimer, *MEMORY[0x1E0C99860]);
    goto LABEL_9;
  }

}

void __67__SBIndirectPanGestureRecognizer__setUpIdleTimersIfNeededForEvent___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_mouseIdleTimerFired:", v3);

}

void __67__SBIndirectPanGestureRecognizer__setUpIdleTimersIfNeededForEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_trackpadIdleTimerFired:", v3);

}

- (void)_mouseIdleTimerFired:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  long double v8;
  double v9;
  long double v10;
  double v11;

  BSContinuousMachTimeNow();
  v5 = v4 - self->_lastKnownMouseEventTimestamp;
  -[SBIndirectPanGestureRecognizer containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIndirectPanGestureRecognizer velocityInView:](self, "velocityInView:", v6);
  v8 = v7;
  v10 = v9;

  v11 = fabs(hypot(v8, v10));
  if (v5 >= 0.15 && v11 < 50.0)
    -[SBIndirectPanGestureRecognizer _mouseIdleTimerElapsed](self, "_mouseIdleTimerElapsed", v11);
  else
    -[BSAuditHistory addItemWithFormat:](self->_auditHistory, "addItemWithFormat:", CFSTR("Not firing mouse idle timer because timeSinceLastMouseEvent: %f, magnitude: %f"), *(_QWORD *)&v5, *(_QWORD *)&v11);
}

- (void)_mouseIdleTimerElapsed
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  NSTimer *mouseIdleTimer;

  _SBIndirectGestureLog(self, CFSTR("Mouse idle timer has elapsed"));
  v3 = -[SBIndirectPanGestureRecognizer state](self, "state");
  if ((unint64_t)(v3 - 1) < 2)
  {
    v4 = 4;
    self->_endReason = 4;
    v5 = CFSTR("Mouse idle timer: moving from Began or Changed to Cancelled");
LABEL_5:
    _SBIndirectGestureLog(self, v5);
    -[SBIndirectPanGestureRecognizer setState:](self, "setState:", v4);
    goto LABEL_6;
  }
  if (!v3)
  {
    v5 = CFSTR("Mouse idle timer: moving from Possible to Failed");
    v4 = 5;
    goto LABEL_5;
  }
LABEL_6:
  _SBIndirectGestureLog(self, CFSTR("Invalidating the mouse idle timer"));
  -[NSTimer invalidate](self->_mouseIdleTimer, "invalidate");
  mouseIdleTimer = self->_mouseIdleTimer;
  self->_mouseIdleTimer = 0;

  self->_gesturePassedThroughScreenCenterRegion = 0;
}

- (void)_trackpadIdleTimerFired:(id)a3
{
  double v4;
  double v5;

  BSContinuousMachTimeNow();
  v5 = v4 - self->_lastKnownTrackpadEventTimestamp;
  if (v5 >= 0.15)
    -[SBIndirectPanGestureRecognizer _trackpadIdleTimerElapsed](self, "_trackpadIdleTimerElapsed");
  else
    -[BSAuditHistory addItemWithFormat:](self->_auditHistory, "addItemWithFormat:", CFSTR("Not firing trackpad idle timer because timeSinceLastTrackpadEvent: %f"), *(_QWORD *)&v5);
}

- (void)_trackpadIdleTimerElapsed
{
  uint64_t v3;
  __CFString *v4;
  uint64_t v5;
  NSTimer *trackpadIdleTimer;

  _SBIndirectGestureLog(self, CFSTR("Trackpad idle timer has elapsed"));
  v3 = -[SBIndirectPanGestureRecognizer state](self, "state");
  if ((unint64_t)(v3 - 1) < 2)
  {
    self->_endReason = 5;
    v4 = CFSTR("Trackpad idle timer: moving from Began or Changed to Cancelled");
    v5 = 4;
LABEL_5:
    _SBIndirectGestureLog(self, v4);
    -[SBIndirectPanGestureRecognizer setState:](self, "setState:", v5);
    goto LABEL_6;
  }
  if (!v3)
  {
    v4 = CFSTR("Trackpad idle timer: moving from Possible to Failed");
    v5 = 5;
    goto LABEL_5;
  }
LABEL_6:
  _SBIndirectGestureLog(self, CFSTR("Invalidating the trackpad idle timer"));
  -[NSTimer invalidate](self->_trackpadIdleTimer, "invalidate");
  trackpadIdleTimer = self->_trackpadIdleTimer;
  self->_trackpadIdleTimer = 0;

  self->_gesturePassedThroughScreenCenterRegion = 0;
}

- (void)trackpadDidTouchUpWithEvent:(id)a3
{
  NSValue *gestureStartLocation;

  _SBIndirectGestureLog(self, CFSTR("Touch-up from the lifecycle monitor: Setting _gestureStartLocation to nil"));
  self->_pausedUntilTouchedUpOrMovedAwayFromEdge = 0;
  gestureStartLocation = self->_gestureStartLocation;
  self->_gestureStartLocation = 0;

  self->_gesturePassedThroughScreenCenterRegion = 0;
}

- (void)_startWatchdogTimerIfNecessary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BSAbsoluteMachTimer *v7;
  BSAbsoluteMachTimer *watchdogTimer;
  BSAbsoluteMachTimer *v9;
  double v10;
  double v11;
  uint64_t v12;
  id v13;
  BSAuditHistory *v14;
  BSAuditHistory *auditHistory;
  void *v16;
  void *v17;
  void *v18;
  BSInvalidatable *v19;
  BSInvalidatable *logCaptureHandle;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  if (!self->_watchdogTimer)
  {
    if (-[SBIndirectPanGestureRecognizer _wantsWatchdogEnabled](self, "_wantsWatchdogEnabled"))
    {
      v3 = objc_alloc(MEMORY[0x1E0D01690]);
      v4 = (void *)MEMORY[0x1E0CB3940];
      -[SBIndirectPanGestureRecognizer name](self, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("Watchdog - %@"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (BSAbsoluteMachTimer *)objc_msgSend(v3, "initWithIdentifier:", v6);
      watchdogTimer = self->_watchdogTimer;
      self->_watchdogTimer = v7;

      objc_initWeak(&location, self);
      v9 = self->_watchdogTimer;
      -[SBIndirectPanGestureRecognizer _watchdogTimeoutInSeconds](self, "_watchdogTimeoutInSeconds");
      v11 = v10;
      v12 = MEMORY[0x1E0C80D38];
      v13 = MEMORY[0x1E0C80D38];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __64__SBIndirectPanGestureRecognizer__startWatchdogTimerIfNecessary__block_invoke;
      v22[3] = &unk_1E8E9EEC8;
      objc_copyWeak(&v23, &location);
      -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v9, "scheduleWithFireInterval:leewayInterval:queue:handler:", v12, v22, v11, 0.0);

      v14 = (BSAuditHistory *)objc_alloc_init(MEMORY[0x1E0D016C8]);
      auditHistory = self->_auditHistory;
      self->_auditHistory = v14;

      v16 = (void *)MEMORY[0x1E0CB3940];
      -[SBIndirectPanGestureRecognizer name](self, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("SpringBoard - SBIndirectPanGestureRecognizer - %p - %@"), self, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_copyWeak(&v21, &location);
      BSLogAddStateCaptureBlockWithTitle();
      v19 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      logCaptureHandle = self->_logCaptureHandle;
      self->_logCaptureHandle = v19;

      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
}

void __64__SBIndirectPanGestureRecognizer__startWatchdogTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_watchdogFired");

}

__CFString *__64__SBIndirectPanGestureRecognizer__startWatchdogTimerIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "debugDescription");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E8EC7EC0;
  }

  return v3;
}

- (void)_resetWatchdogIfNecessary
{
  BSAbsoluteMachTimer *watchdogTimer;
  BSAbsoluteMachTimer *v4;
  BSAuditHistory *auditHistory;
  BSInvalidatable *logCaptureHandle;

  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
  {
    -[BSAbsoluteMachTimer invalidate](watchdogTimer, "invalidate");
    v4 = self->_watchdogTimer;
    self->_watchdogTimer = 0;

    auditHistory = self->_auditHistory;
    self->_auditHistory = 0;

    -[BSInvalidatable invalidate](self->_logCaptureHandle, "invalidate");
    logCaptureHandle = self->_logCaptureHandle;
    self->_logCaptureHandle = 0;

  }
}

- (void)_watchdogFired
{
  void *v6;
  void *v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint8_t v11[14];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sb_stringForState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "descriptionWithMultilinePrefix:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_19();
  v12 = v7;
  v13 = v9;
  v14 = v10;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "SBIndirectPanGestureRecognizer (%@, %@) – watchdog fired!! - %@", v11, 0x20u);

  OUTLINED_FUNCTION_7();
}

- (BOOL)_wantsWatchdogEnabled
{
  void *v3;
  char v4;
  void *v5;

  -[SBIndirectPanGestureRecognizer name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("indirectPresentCoverSheetGestureRecognizer")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[SBIndirectPanGestureRecognizer name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("indirectPresentControlCenterGestureRecognizer"));

  }
  return v4;
}

- (double)_watchdogTimeoutInSeconds
{
  return 2.0;
}

- (CGPoint)locationInView:(id)a3
{
  CGPoint *p_origin;
  id v5;
  void *v6;
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
  CGPoint result;

  p_origin = &self->_origin;
  v5 = a3;
  -[SBIndirectPanGestureRecognizer containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIndirectPanGestureRecognizer _convertPoint:fromView:toView:](self, "_convertPoint:fromView:toView:", v6, v5, p_origin->x, p_origin->y);
  v8 = v7;
  v10 = v9;

  -[SBIndirectPanGestureRecognizer translationInView:](self, "translationInView:", v5);
  v12 = v11;
  v14 = v13;

  v15 = v8 + v12;
  v16 = v10 + v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  CGPoint *p_origin;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  p_origin = &self->_origin;
  v5 = a3;
  -[SBIndirectPanGestureRecognizer containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIndirectPanGestureRecognizer _convertPoint:fromView:toView:](self, "_convertPoint:fromView:toView:", v6, v5, p_origin->x, p_origin->y);
  v8 = v7;
  v10 = v9;

  -[SBIndirectPanGestureRecognizer containerView](self, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIndirectPanGestureRecognizer _convertPoint:fromView:toView:](self, "_convertPoint:fromView:toView:", v11, v5, self->_lastKnownPoint.x, self->_lastKnownPoint.y);
  v13 = v12;
  v15 = v14;

  v16 = v13 - v8;
  v17 = v15 - v10;
  if (self->_shouldInvertXAxis)
    v16 = -(v13 - v8);
  if (self->_shouldInvertYAxis)
    v17 = -v17;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 fromView:(id)a4 toView:(id)a5
{
  double y;
  double x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v8 = a5;
  objc_msgSend(a4, "convertPoint:toView:", 0, x, y);
  objc_msgSend(v8, "convertPoint:fromView:", 0);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (id)containerView
{
  void *v3;
  void *v4;

  -[SBIndirectPanGestureRecognizer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewForSystemGestureRecognizer:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setHysteresis:(double)a3 forInputType:(unint64_t)a4
{
  NSObject *v4;
  uint64_t v5;

  if (a3 >= 0.0)
  {
    if (a4 == 1)
    {
      v5 = 424;
    }
    else
    {
      if (a4)
        return;
      v5 = 416;
    }
    *(double *)((char *)&self->super.super.isa + v5) = a3;
  }
  else
  {
    SBLogSystemGesture();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SBIndirectPanGestureRecognizer setHysteresis:forInputType:].cold.1(v4);

  }
}

- (double)hysteresisForInputType:(unint64_t)a3
{
  double result;
  int *v4;

  if (a3)
  {
    result = 0.0;
    if (a3 != 1)
      return result;
    v4 = &OBJC_IVAR___SBIndirectPanGestureRecognizer__mouseHysteresis;
  }
  else
  {
    v4 = &OBJC_IVAR___SBIndirectPanGestureRecognizer__trackpadHysteresis;
  }
  return *(double *)((char *)&self->super.super.isa + *v4);
}

- (void)_updateTranslationWithPointerEventAttributes:(id)a3 activeEdge:(unint64_t)a4
{
  id v7;
  unsigned int v8;
  objc_class *v9;
  int *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unint64_t v28;
  double v29;
  CGPoint *p_y;
  void *v31;
  CGPoint *p_lastKnownPoint;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;

  if (a3)
  {
    v7 = a3;
    v8 = SBPointerEventIsTrackpadEvent(v7);
    BSContinuousMachTimeNow();
    v10 = &OBJC_IVAR___SBIndirectPanGestureRecognizer__lastKnownMouseEventTimestamp;
    if (v8)
      v10 = &OBJC_IVAR___SBIndirectPanGestureRecognizer__lastKnownTrackpadEventTimestamp;
    *(Class *)((char *)&self->super.super.isa + *v10) = v9;
    -[SBIndirectPanGestureRecognizer containerView](self, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_screen");
    v41 = (id)objc_claimAutoreleasedReturnValue();

    v12 = SBPointerEventAcceleratedRelativePositionForOrientation(v7, -[SBIndirectPanGestureRecognizer _effectiveOrientation](self, "_effectiveOrientation"), v41);
    v14 = v13;

    v15 = v12 * 0.3;
    v16 = v14 * 0.3;
    if (self->_translationAdjustmentBlock && -[SBIndirectPanGestureRecognizer state](self, "state") >= 1)
    {
      -[SBIndirectPanGestureRecognizer containerView](self, "containerView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIndirectPanGestureRecognizer translationInView:](self, "translationInView:", v17);
      v19 = v18;
      v21 = v20;

      -[SBIndirectPanGestureRecognizer containerView](self, "containerView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIndirectPanGestureRecognizer locationInView:](self, "locationInView:", v22);
      v24 = v23;
      v26 = v25;

      v15 = (*((double (**)(double, double, double, double, double, double))self->_translationAdjustmentBlock
             + 2))(v15, v16, v19, v21, v24, v26);
      v16 = v27;
    }
    v28 = -[SBIndirectPanGestureRecognizer _axisForEdge:](self, "_axisForEdge:", a4);
    if (v28 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIndirectPanGestureRecognizer.m"), 833, CFSTR("Received an invalid active edge."));

      -[SBIndirectPanGestureRecognizer hysteresisForInputType:](self, "hysteresisForInputType:", self->_currentInputType);
    }
    else
    {
      -[SBIndirectPanGestureRecognizer hysteresisForInputType:](self, "hysteresisForInputType:", self->_currentInputType);
      if (v28 == 2)
      {
        p_y = (CGPoint *)&self->_translationWithinHysteresisRange.y;
LABEL_13:
        if (v29 > 0.0 && fabs(p_y->x) <= v29)
        {
          v33 = v15 + self->_translationWithinHysteresisRange.x;
          v34 = v16 + self->_translationWithinHysteresisRange.y;
          self->_translationWithinHysteresisRange.x = v33;
          self->_translationWithinHysteresisRange.y = v34;
          if (v28 == 2)
          {
            v35 = fabs(v34);
            v36 = fabs(v29);
            if (v35 <= v36)
              goto LABEL_17;
            v37 = v35 - v36;
            if (v16 >= 0.0)
              v16 = v37;
            else
              v16 = -v37;
            p_lastKnownPoint = (CGPoint *)&self->_lastKnownPoint.y;
          }
          else
          {
            if (v28 != 1)
              goto LABEL_17;
            v38 = fabs(v33);
            v39 = fabs(v29);
            if (v38 <= v39)
              goto LABEL_17;
            v40 = v38 - v39;
            if (v15 >= 0.0)
              v16 = v40;
            else
              v16 = -v40;
            p_lastKnownPoint = &self->_lastKnownPoint;
          }
        }
        else
        {
          self->_lastKnownPoint.x = v15 + self->_lastKnownPoint.x;
          p_lastKnownPoint = (CGPoint *)&self->_lastKnownPoint.y;
        }
        p_lastKnownPoint->x = v16 + p_lastKnownPoint->x;
LABEL_17:

        return;
      }
    }
    p_y = &self->_translationWithinHysteresisRange;
    goto LABEL_13;
  }
}

- (CGPoint)_pointerModelLocation
{
  id WeakRetained;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_currentTouch);
  v4 = objc_loadWeakRetained((id *)&self->_orientationProvider);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "indirectPanEffectiveInterfaceOrientation");
    v6 = _SBOrientedPointerLocation(self, WeakRetained);
    v8 = v7;
  }
  else
  {
    -[SBIndirectPanGestureRecognizer containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UISystemGestureLocationForTouchInView();
    v6 = v10;
    v8 = v11;

  }
  v12 = v6;
  v13 = v8;
  result.y = v13;
  result.x = v12;
  return result;
}

- (int64_t)_effectiveOrientation
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  int64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_orientationProvider);
  v3 = WeakRetained;
  if (WeakRetained)
    v4 = objc_msgSend(WeakRetained, "indirectPanEffectiveInterfaceOrientation");
  else
    v4 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
  v5 = v4;

  return v5;
}

- (void)updateTouchHistoryWithTouches:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  SBTouchHistory *touchHistory;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        -[SBIndirectPanGestureRecognizer containerView](self, "containerView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIndirectPanGestureRecognizer locationInView:](self, "locationInView:", v10);
        v12 = v11;
        v14 = v13;

        touchHistory = self->_touchHistory;
        objc_msgSend(v9, "timestamp");
        -[SBTouchHistory updateWithLocation:timestamp:](touchHistory, "updateWithLocation:timestamp:", v12, v14, v16);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[SBTouchHistory averageTouchVelocityOverTimeDuration:](self->_touchHistory, "averageTouchVelocityOverTimeDuration:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)averageTouchPathAngleOverTimeDuration:(double)a3
{
  double result;

  -[SBTouchHistory averageTouchPathAngleOverTimeDuration:](self->_touchHistory, "averageTouchPathAngleOverTimeDuration:", a3);
  return result;
}

- (double)peakSpeed
{
  double result;

  -[SBTouchHistory peakSpeed](self->_touchHistory, "peakSpeed");
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[SBIndirectPanGestureRecognizer averageTouchVelocityOverTimeDuration:](self, "averageTouchVelocityOverTimeDuration:", a3, 0.0416666667);
  result.y = v4;
  result.x = v3;
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)-[SBIndirectPanGestureRecognizer descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIndirectPanGestureRecognizer descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  BSAuditHistory *auditHistory;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  SBIndirectPanGestureRecognizer *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  SBIndirectPanGestureRecognizer *v22;

  v4 = a3;
  -[SBIndirectPanGestureRecognizer succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__SBIndirectPanGestureRecognizer_descriptionBuilderWithMultilinePrefix___block_invoke;
  v20[3] = &unk_1E8E9E820;
  v7 = v5;
  v21 = v7;
  v22 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("configuration"), v4, v20);
  v14 = v6;
  v15 = 3221225472;
  v16 = __72__SBIndirectPanGestureRecognizer_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v17 = &unk_1E8E9E820;
  v18 = self;
  v8 = v7;
  v19 = v8;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("state"), v4, &v14);

  auditHistory = self->_auditHistory;
  if (auditHistory)
  {
    -[BSAuditHistory items](auditHistory, "items", v14, v15, v16, v17, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendArraySection:withName:skipIfEmpty:", v10, CFSTR("AuditHistory"), 0);

  }
  v11 = v19;
  v12 = v8;

  return v12;
}

void __72__SBIndirectPanGestureRecognizer_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id WeakRetained;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 280), CFSTR("edges"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 278), CFSTR("shouldRequireGestureToStartAtEdge"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 274), CFSTR("shouldInvertXAxis"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 275), CFSTR("shouldInvertYAxis"));
  v6 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 328));
  v7 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", WeakRetained, CFSTR("orientationProvider"), 1);

}

void __72__SBIndirectPanGestureRecognizer_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  _BOOL8 v12;
  id v13;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 352));
  v2 = *(void **)(a1 + 40);
  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 344));
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("currentHoverEvent"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "appendPointer:withName:", WeakRetained, CFSTR("currentTouch"));
  if (WeakRetained)
    v6 = (id)objc_msgSend(*(id *)(a1 + 40), "appendInteger:withName:", objc_msgSend(WeakRetained, "phase"), CFSTR("currentTouch.phase"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendPoint:withName:", CFSTR("lastKnownPoint"), *(double *)(*(_QWORD *)(a1 + 32) + 480), *(double *)(*(_QWORD *)(a1 + 32) + 488));
  v8 = (id)objc_msgSend(*(id *)(a1 + 40), "appendTimeInterval:withName:decomposeUnits:", CFSTR("lastKnownMouseEventTimestamp"), 1, *(double *)(*(_QWORD *)(a1 + 32) + 360));
  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "appendTimeInterval:withName:decomposeUnits:", CFSTR("lastKnownTrackpadEventTimestamp"), 1, *(double *)(*(_QWORD *)(a1 + 32) + 376));
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  if (v10)
  {
    objc_msgSend(v10, "timeRemaining");
    v12 = v11 == 0.0;
  }
  else
  {
    v12 = 0;
  }
  v13 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", v12, CFSTR("watchdogFired"), 1);

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIndirectPanGestureRecognizer succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIndirectPanGestureRecognizer name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("name"));

  -[UIGestureRecognizer sb_stringForState](self, "sb_stringForState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("state"));

  return v3;
}

- (unint64_t)_edgeForPointerModelLocation:(CGPoint)a3 inView:(id)a4 inset:(double)a5
{
  double y;
  double x;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a4, "frame");
  if (y >= v10 - a5)
    return 4;
  if (y <= a5)
    return 1;
  if (x <= a5)
    return 2;
  if (x >= v9 - a5)
    return 8;
  return -[SBIndirectPanGestureRecognizer _isPointerOnTopScreenCorner:radius:](self, "_isPointerOnTopScreenCorner:radius:", x, y, SBScreenDisplayCornerRadius());
}

- (BOOL)_hasTranslationReachedThreshold:(double)a3 withTranslation:(CGPoint)a4 forEdge:(unint64_t)a5
{
  BOOL result;
  _BOOL4 shouldInvertYAxis;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;

  result = 0;
  switch(a5)
  {
    case 1uLL:
      shouldInvertYAxis = self->_shouldInvertYAxis;
      v8 = a4.y >= a3;
      v9 = a4.y > -a3;
      goto LABEL_4;
    case 2uLL:
      shouldInvertYAxis = self->_shouldInvertXAxis;
      v8 = a4.x >= a3;
      v9 = a4.x > -a3;
LABEL_4:
      v10 = !v9;
      goto LABEL_12;
    case 4uLL:
      shouldInvertYAxis = self->_shouldInvertYAxis;
      v8 = a4.y <= -a3;
      v11 = a4.y < a3;
      goto LABEL_9;
    case 8uLL:
      shouldInvertYAxis = self->_shouldInvertXAxis;
      v8 = a4.x <= -a3;
      v11 = a4.x < a3;
LABEL_9:
      v10 = !v11;
LABEL_12:
      if (shouldInvertYAxis)
        result = v8;
      else
        result = v10;
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)_axisForEdge:(unint64_t)a3
{
  unint64_t result;

  result = 1;
  if ((uint64_t)a3 <= 3)
  {
    if (!a3)
      return 0;
    if (a3 != 1)
      return result;
    return 2;
  }
  if (a3 == 15)
    return 3;
  if (a3 == 4)
    return 2;
  return result;
}

- (BOOL)_isPointerOnTopScreenCorner:(CGPoint)a3 radius:(double)a4
{
  BOOL v4;
  double y;
  double x;
  void *v9;
  double Width;
  uint64_t v11;
  CGRect v14;

  if (a4 != 0.0)
  {
    y = a3.y;
    x = a3.x;
    -[SBIndirectPanGestureRecognizer containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    Width = CGRectGetWidth(v14);
    if (x > a4 || y > a4)
    {
      if (x < Width - a4 || y > a4)
      {
        v4 = 0;
LABEL_13:

        return v4;
      }
      v11 = 2;
    }
    else
    {
      v11 = 1;
    }
    v4 = -[SBIndirectPanGestureRecognizer _isPointOnRoundedCorner:corner:radius:inView:](self, "_isPointOnRoundedCorner:corner:radius:inView:", v11, v9, x, y, a4);
    goto LABEL_13;
  }
  return 0;
}

- (BOOL)_isPointOnRoundedCorner:(CGPoint)a3 corner:(unint64_t)a4 radius:(double)a5 inView:(id)a6
{
  double y;
  double x;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  -[SBIndirectPanGestureRecognizer _centerOfCircleForRoundedCorner:radius:inView:](self, "_centerOfCircleForRoundedCorner:radius:inView:", a4, a6, a5);
  return vabdd_f64(hypot(x - v9, y - v10), a5) <= 4.0;
}

- (CGPoint)_centerOfCircleForRoundedCorner:(unint64_t)a3 radius:(double)a4 inView:(id)a5
{
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double Height;
  double v17;
  double v18;
  CGPoint result;
  CGRect v20;

  objc_msgSend(a5, "bounds");
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = a4;
  switch(a3)
  {
    case 1uLL:
      break;
    case 2uLL:
      v15 = CGRectGetWidth(*(CGRect *)&v7) - a4;
      break;
    case 4uLL:
      Height = CGRectGetHeight(*(CGRect *)&v7);
      v15 = a4;
      goto LABEL_6;
    case 8uLL:
      v15 = CGRectGetWidth(*(CGRect *)&v7) - a4;
      v20.origin.x = v11;
      v20.origin.y = v12;
      v20.size.width = v13;
      v20.size.height = v14;
      Height = CGRectGetHeight(v20);
LABEL_6:
      a4 = Height - a4;
      break;
    default:
      v15 = *MEMORY[0x1E0C9D538];
      a4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      break;
  }
  v17 = v15;
  v18 = a4;
  result.y = v18;
  result.x = v17;
  return result;
}

- (BOOL)avoidActivatingForExternallyOwnedEdges
{
  return self->_avoidActivatingForExternallyOwnedEdges;
}

- (void)setAvoidActivatingForExternallyOwnedEdges:(BOOL)a3
{
  self->_avoidActivatingForExternallyOwnedEdges = a3;
}

- (unint64_t)edges
{
  return self->_edges;
}

- (void)setEdges:(unint64_t)a3
{
  self->_edges = a3;
}

- (unint64_t)activatedEdge
{
  return self->_activatedEdge;
}

- (void)setActivatedEdge:(unint64_t)a3
{
  self->_activatedEdge = a3;
}

- (BOOL)shouldCancelAfterMovingAwayFromEdge
{
  return self->_shouldCancelAfterMovingAwayFromEdge;
}

- (void)setShouldCancelAfterMovingAwayFromEdge:(BOOL)a3
{
  self->_shouldCancelAfterMovingAwayFromEdge = a3;
}

- (BOOL)shouldInvertXAxis
{
  return self->_shouldInvertXAxis;
}

- (void)setShouldInvertXAxis:(BOOL)a3
{
  self->_shouldInvertXAxis = a3;
}

- (BOOL)shouldInvertYAxis
{
  return self->_shouldInvertYAxis;
}

- (void)setShouldInvertYAxis:(BOOL)a3
{
  self->_shouldInvertYAxis = a3;
}

- (BOOL)pausedUntilTouchedUpOrMovedAwayFromEdge
{
  return self->_pausedUntilTouchedUpOrMovedAwayFromEdge;
}

- (void)setPausedUntilTouchedUpOrMovedAwayFromEdge:(BOOL)a3
{
  self->_pausedUntilTouchedUpOrMovedAwayFromEdge = a3;
}

- (id)translationAdjustmentBlock
{
  return self->_translationAdjustmentBlock;
}

- (void)setTranslationAdjustmentBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (BOOL)shouldActivateWithThreshold
{
  return self->_shouldActivateWithThreshold;
}

- (void)setShouldActivateWithThreshold:(BOOL)a3
{
  self->_shouldActivateWithThreshold = a3;
}

- (double)activationRecognitionDistance
{
  return self->_activationRecognitionDistance;
}

- (void)setActivationRecognitionDistance:(double)a3
{
  self->_activationRecognitionDistance = a3;
}

- (BOOL)shouldRequireGestureToStartAtEdge
{
  return self->_shouldRequireGestureToStartAtEdge;
}

- (void)setShouldRequireGestureToStartAtEdge:(BOOL)a3
{
  self->_shouldRequireGestureToStartAtEdge = a3;
}

- (unint64_t)endReason
{
  return self->_endReason;
}

- (unint64_t)currentInputType
{
  return self->_currentInputType;
}

- (SBIndirectPanGestureRecognizerOrientationProviding)orientationProvider
{
  return (SBIndirectPanGestureRecognizerOrientationProviding *)objc_loadWeakRetained((id *)&self->_orientationProvider);
}

- (void)setOrientationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_orientationProvider, a3);
}

- (CGPoint)origin
{
  double x;
  double y;
  CGPoint result;

  x = self->_origin.x;
  y = self->_origin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  self->_origin = a3;
}

- (CGPoint)lastKnownPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastKnownPoint.x;
  y = self->_lastKnownPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastKnownPoint:(CGPoint)a3
{
  self->_lastKnownPoint = a3;
}

- (SBTouchHistory)touchHistory
{
  return self->_touchHistory;
}

- (void)setTouchHistory:(id)a3
{
  objc_storeStrong((id *)&self->_touchHistory, a3);
}

- (UIEvent)currentHoverEvent
{
  return (UIEvent *)objc_loadWeakRetained((id *)&self->_currentHoverEvent);
}

- (void)setCurrentHoverEvent:(id)a3
{
  objc_storeWeak((id *)&self->_currentHoverEvent, a3);
}

- (UITouch)currentTouch
{
  return (UITouch *)objc_loadWeakRetained((id *)&self->_currentTouch);
}

- (void)setCurrentTouch:(id)a3
{
  objc_storeWeak((id *)&self->_currentTouch, a3);
}

- (double)lastKnownMouseEventTimestamp
{
  return self->_lastKnownMouseEventTimestamp;
}

- (void)setLastKnownMouseEventTimestamp:(double)a3
{
  self->_lastKnownMouseEventTimestamp = a3;
}

- (NSTimer)mouseIdleTimer
{
  return self->_mouseIdleTimer;
}

- (void)setMouseIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_mouseIdleTimer, a3);
}

- (double)lastKnownTrackpadEventTimestamp
{
  return self->_lastKnownTrackpadEventTimestamp;
}

- (void)setLastKnownTrackpadEventTimestamp:(double)a3
{
  self->_lastKnownTrackpadEventTimestamp = a3;
}

- (NSTimer)trackpadIdleTimer
{
  return self->_trackpadIdleTimer;
}

- (void)setTrackpadIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_trackpadIdleTimer, a3);
}

- (NSValue)gestureStartLocation
{
  return self->_gestureStartLocation;
}

- (void)setGestureStartLocation:(id)a3
{
  objc_storeStrong((id *)&self->_gestureStartLocation, a3);
}

- (double)mouseEnteredNearEdgeRegionTimestamp
{
  return self->_mouseEnteredNearEdgeRegionTimestamp;
}

- (void)setMouseEnteredNearEdgeRegionTimestamp:(double)a3
{
  self->_mouseEnteredNearEdgeRegionTimestamp = a3;
}

- (BOOL)gesturePassedThroughScreenCenterRegion
{
  return self->_gesturePassedThroughScreenCenterRegion;
}

- (void)setGesturePassedThroughScreenCenterRegion:(BOOL)a3
{
  self->_gesturePassedThroughScreenCenterRegion = a3;
}

- (double)lastMouseActivationTimestamp
{
  return self->_lastMouseActivationTimestamp;
}

- (void)setLastMouseActivationTimestamp:(double)a3
{
  self->_lastMouseActivationTimestamp = a3;
}

- (double)trackpadHysteresis
{
  return self->_trackpadHysteresis;
}

- (void)setTrackpadHysteresis:(double)a3
{
  self->_trackpadHysteresis = a3;
}

- (double)mouseHysteresis
{
  return self->_mouseHysteresis;
}

- (void)setMouseHysteresis:(double)a3
{
  self->_mouseHysteresis = a3;
}

- (CGPoint)translationWithinHysteresisRange
{
  double x;
  double y;
  CGPoint result;

  x = self->_translationWithinHysteresisRange.x;
  y = self->_translationWithinHysteresisRange.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTranslationWithinHysteresisRange:(CGPoint)a3
{
  self->_translationWithinHysteresisRange = a3;
}

- (unint64_t)activatingEdge
{
  return self->_activatingEdge;
}

- (void)setActivatingEdge:(unint64_t)a3
{
  self->_activatingEdge = a3;
}

- (BSAbsoluteMachTimer)watchdogTimer
{
  return self->_watchdogTimer;
}

- (void)setWatchdogTimer:(id)a3
{
  objc_storeStrong((id *)&self->_watchdogTimer, a3);
}

- (BSAuditHistory)auditHistory
{
  return self->_auditHistory;
}

- (void)setAuditHistory:(id)a3
{
  objc_storeStrong((id *)&self->_auditHistory, a3);
}

- (BSInvalidatable)logCaptureHandle
{
  return self->_logCaptureHandle;
}

- (void)setLogCaptureHandle:(id)a3
{
  objc_storeStrong((id *)&self->_logCaptureHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logCaptureHandle, 0);
  objc_storeStrong((id *)&self->_auditHistory, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_gestureStartLocation, 0);
  objc_storeStrong((id *)&self->_trackpadIdleTimer, 0);
  objc_storeStrong((id *)&self->_mouseIdleTimer, 0);
  objc_destroyWeak((id *)&self->_currentTouch);
  objc_destroyWeak((id *)&self->_currentHoverEvent);
  objc_storeStrong((id *)&self->_touchHistory, 0);
  objc_destroyWeak((id *)&self->_orientationProvider);
  objc_storeStrong(&self->_translationAdjustmentBlock, 0);
}

- (void)initWithTarget:(NSObject *)a1 action:(uint64_t)a2 edges:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[SBIndirectPanGestureRecognizer initWithTarget:action:edges:]";
}

- (void)_hoverMoved:(void *)a1 withEvent:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = 136315138;
  v6 = objc_msgSend(v3, "UTF8String");
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "Indirect pan gesture received hoverMoved with no pointerAttributes! HIDEvent: %s", (uint8_t *)&v5);

}

- (void)setHysteresis:(os_log_t)log forInputType:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "SBIndirectGestureRecognizer hysteresis must be greater than or equal to 0.", v1, 2u);
}

@end
