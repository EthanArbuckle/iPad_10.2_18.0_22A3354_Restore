@implementation _UIRotaryGestureRecognizer

- (_UIRotaryGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIRotaryGestureRecognizer *v4;
  _UIRotaryGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIRotaryGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    -[UIGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", MEMORY[0x1E0C9AA60]);
  return v5;
}

- (_UIRotaryGestureRecognizer)initWithCoder:(id)a3
{
  _UIRotaryGestureRecognizer *v3;
  _UIRotaryGestureRecognizer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIRotaryGestureRecognizer;
  v3 = -[UIGestureRecognizer initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[UIGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", MEMORY[0x1E0C9AA60]);
  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  CGPoint *p_touchBeganPoint;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  double v15;
  NSTimer *v16;
  NSTimer *restingTouchBeginTimer;
  void *v18;

  p_touchBeganPoint = &self->_touchBeganPoint;
  objc_msgSend(a4, "_digitizerLocation", a3);
  p_touchBeganPoint->x = v7;
  p_touchBeganPoint->y = v8;
  -[_UIRotaryGestureRecognizer _invalidateRestingTouchRecoveryTimerIfNecessary](self, "_invalidateRestingTouchRecoveryTimerIfNecessary");
  objc_msgSend(a4, "_digitizerLocation");
  self->_digitizerLocation.x = v9;
  self->_digitizerLocation.y = v10;
  -[_UIRotaryGestureRecognizer _calculateCurrentWheelPosition](self, "_calculateCurrentWheelPosition");
  self->_currentWheelPosition = v11;
  -[_UIRotaryGestureRecognizer setStartRegion:](self, "setStartRegion:", -[_UIRotaryGestureRecognizer _regionForWheelPosition:](self, "_regionForWheelPosition:"));
  if (-[_UIRotaryGestureRecognizer _isTouchFarEnoughFromCenterToActivateRestingTouch:](self, "_isTouchFarEnoughFromCenterToActivateRestingTouch:", p_touchBeganPoint->x, p_touchBeganPoint->y)&& -[_UIRotaryGestureRecognizer _effectiveCanBeginFromRest](self, "_effectiveCanBeginFromRest"))
  {
    -[_UIRotaryGestureRecognizer _invalidateRestingTouchBeginTimerIfNecessary](self, "_invalidateRestingTouchBeginTimerIfNecessary");
    if ((*(_BYTE *)&self->_rotaryGestureRecognizerFlags & 4) != 0)
    {
      -[UIGestureRecognizer delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rotaryGestureRecognizerStartedRestTimer:", self);

    }
    v13 = (void *)MEMORY[0x1E0C99E88];
    v14 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RestingTouchDuration, (uint64_t)CFSTR("B519_RestingTouchDuration"));
    v15 = *(double *)&qword_1EDDA8048;
    if (v14)
      v15 = 0.2;
    objc_msgSend(v13, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__attemptToStartFromRestingTouch_, 0, 0, v15);
    v16 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    restingTouchBeginTimer = self->_restingTouchBeginTimer;
    self->_restingTouchBeginTimer = v16;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addTimer:forMode:", self->_restingTouchBeginTimer, *MEMORY[0x1E0C99860]);

  }
  else if (-[_UIRotaryGestureRecognizer _effectiveMustBeginFromRest](self, "_effectiveMustBeginFromRest"))
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
  if (-[UIGestureRecognizer state](self, "state") != UIGestureRecognizerStateFailed)
    -[_UIRotaryGestureRecognizer _processEvent:](self, "_processEvent:", a4);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_msgSend(a4, "_digitizerLocation", a3);
  if (-[_UIRotaryGestureRecognizer _isTouchInRangeOfInitialTouchForRestingTouchActivation:](self, "_isTouchInRangeOfInitialTouchForRestingTouchActivation:"))
  {
    goto LABEL_4;
  }
  if (-[UIGestureRecognizer state](self, "state")
    || !self->_restingTouchBeginTimer
    || !-[_UIRotaryGestureRecognizer _effectiveMustBeginFromRest](self, "_effectiveMustBeginFromRest"))
  {
    -[_UIRotaryGestureRecognizer _notifyDelegateRestTimerCancelledIfNecessary:](self, "_notifyDelegateRestTimerCancelledIfNecessary:", -[_UIRotaryGestureRecognizer _invalidateRestingTouchBeginTimerIfNecessary](self, "_invalidateRestingTouchBeginTimerIfNecessary"));
LABEL_4:
    -[_UIRotaryGestureRecognizer _processEvent:](self, "_processEvent:", a4);
    return;
  }
  -[UIGestureRecognizer setState:](self, "setState:", 5);
  -[_UIRotaryGestureRecognizer _notifyDelegateRestTimerCancelledIfNecessary:](self, "_notifyDelegateRestTimerCancelledIfNecessary:", -[_UIRotaryGestureRecognizer _invalidateRestingTouchBeginTimerIfNecessary](self, "_invalidateRestingTouchBeginTimerIfNecessary"));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  _BOOL8 v5;

  v5 = -[_UIRotaryGestureRecognizer _invalidateRestingTouchBeginTimerIfNecessary](self, "_invalidateRestingTouchBeginTimerIfNecessary", a3, a4);
  -[_UIRotaryGestureRecognizer setIsActivelyTouching:](self, "setIsActivelyTouching:", 0);
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateBegan
    || -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateChanged)
  {
    -[_UIRotaryGestureRecognizer _enterRecoveryWindowOrEndGestureWithState:](self, "_enterRecoveryWindowOrEndGestureWithState:", 3);
  }
  else
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
    -[_UIRotaryGestureRecognizer _notifyDelegateRestTimerCancelledIfNecessary:](self, "_notifyDelegateRestTimerCancelledIfNecessary:", v5);
    -[_UIRotaryGestureRecognizer _notifyDelegateFailedClassifyingMovement](self, "_notifyDelegateFailedClassifyingMovement");
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  _BOOL8 v5;

  v5 = -[_UIRotaryGestureRecognizer _invalidateRestingTouchBeginTimerIfNecessary](self, "_invalidateRestingTouchBeginTimerIfNecessary", a3, a4);
  -[_UIRotaryGestureRecognizer setIsActivelyTouching:](self, "setIsActivelyTouching:", 0);
  if (-[UIGestureRecognizer state](self, "state"))
  {
    -[_UIRotaryGestureRecognizer _enterRecoveryWindowOrEndGestureWithState:](self, "_enterRecoveryWindowOrEndGestureWithState:", 4);
  }
  else
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
    -[_UIRotaryGestureRecognizer _notifyDelegateRestTimerCancelledIfNecessary:](self, "_notifyDelegateRestTimerCancelledIfNecessary:", v5);
    -[_UIRotaryGestureRecognizer _notifyDelegateFailedClassifyingMovement](self, "_notifyDelegateFailedClassifyingMovement");
  }
}

- (void)reset
{
  NSMutableArray *recentRotaryEvents;
  NSNumber *delegateMustBeginFromRestValue;
  CGPoint v5;
  objc_super v6;

  -[_UIRotaryGestureRecognizer setDelta:](self, "setDelta:", 0.0);
  -[_UIRotaryGestureRecognizer setVelocity:](self, "setVelocity:", 0.0);
  -[_UIRotaryGestureRecognizer setAccumulatedDistance:](self, "setAccumulatedDistance:", 0.0);
  -[_UIRotaryGestureRecognizer setStartRegion:](self, "setStartRegion:", 0);
  -[_UIRotaryGestureRecognizer setBeganMode:](self, "setBeganMode:", 0);
  -[_UIRotaryGestureRecognizer setIsActivelyTouching:](self, "setIsActivelyTouching:", 0);
  self->_currentWheelPosition = 0.0;
  self->_startWheelPosition = 0.0;
  self->_movementClassification = 0;
  recentRotaryEvents = self->_recentRotaryEvents;
  self->_recentRotaryEvents = 0;

  delegateMustBeginFromRestValue = self->_delegateMustBeginFromRestValue;
  self->_delegateMustBeginFromRestValue = 0;

  v5 = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_touchBeganPoint = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_digitizerLocation = v5;
  self->_hasNotifiedDelegateBeganClassifyingMovement = 0;
  -[_UIRotaryGestureRecognizer _resetDeadband](self, "_resetDeadband");
  -[_UIRotaryGestureRecognizer _invalidateRestingTouchBeginTimerIfNecessary](self, "_invalidateRestingTouchBeginTimerIfNecessary");
  -[_UIRotaryGestureRecognizer _invalidateRestingTouchRecoveryTimerIfNecessary](self, "_invalidateRestingTouchRecoveryTimerIfNecessary");
  v6.receiver = self;
  v6.super_class = (Class)_UIRotaryGestureRecognizer;
  -[UIGestureRecognizer reset](&v6, sel_reset);
}

- (void)_enterRecoveryWindowOrEndGestureWithState:(int64_t)a3
{
  int v5;
  double v6;

  v5 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RestingTouchRecoveryWindow, (uint64_t)CFSTR("B519_RestingTouchRecoveryWindow"));
  v6 = *(double *)&qword_1EDDA8058;
  if (v5)
    v6 = 0.2;
  if (v6 == 0.0)
  {
    -[UIGestureRecognizer setState:](self, "setState:", a3);
  }
  else
  {
    -[_UIRotaryGestureRecognizer setDelta:](self, "setDelta:", 0.0);
    -[_UIRotaryGestureRecognizer setVelocity:](self, "setVelocity:", 0.0);
    -[UIGestureRecognizer setState:](self, "setState:", 2);
    -[_UIRotaryGestureRecognizer _activateRestingTouchRecoveryTimer](self, "_activateRestingTouchRecoveryTimer");
  }
}

- (BOOL)_isTouchFarEnoughFromCenterToActivateRestingTouch:(CGPoint)a3
{
  double v4;

  -[_UIRotaryGestureRecognizer _restingTouchRangeForCurrentTouchLocation](self, "_restingTouchRangeForCurrentTouchLocation", a3.x, a3.y);
  return !-[_UIRotaryGestureRecognizer _isPoint:inRangeOfCenter:](self, "_isPoint:inRangeOfCenter:", self->_touchBeganPoint.x, self->_touchBeganPoint.y, v4);
}

- (BOOL)_isTouchInRangeOfInitialTouchForRestingTouchActivation:(CGPoint)a3
{
  double v3;
  int v4;
  double v5;

  v3 = sqrt((a3.x - self->_touchBeganPoint.x) * (a3.x - self->_touchBeganPoint.x)+ (a3.y - self->_touchBeganPoint.y) * (a3.y - self->_touchBeganPoint.y));
  v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RestingTouchMovementAllowance, (uint64_t)CFSTR("B519_RestingTouchMovementAllowance"));
  v5 = *(double *)&qword_1EDDA8068;
  if (v4)
    v5 = 0.05;
  return v3 <= v5;
}

- (void)_activateRestingTouchRecoveryTimer
{
  void *v3;
  int v4;
  double v5;
  NSTimer *v6;
  NSTimer *restingTouchRecoveryTimer;
  id v8;

  -[_UIRotaryGestureRecognizer _invalidateRestingTouchRecoveryTimerIfNecessary](self, "_invalidateRestingTouchRecoveryTimerIfNecessary");
  v3 = (void *)MEMORY[0x1E0C99E88];
  v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RestingTouchRecoveryWindow, (uint64_t)CFSTR("B519_RestingTouchRecoveryWindow"));
  v5 = *(double *)&qword_1EDDA8058;
  if (v4)
    v5 = 0.2;
  objc_msgSend(v3, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__endGestureFromRestingTouchRecovery_, 0, 0, v5);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  restingTouchRecoveryTimer = self->_restingTouchRecoveryTimer;
  self->_restingTouchRecoveryTimer = v6;

  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTimer:forMode:", self->_restingTouchRecoveryTimer, *MEMORY[0x1E0C99860]);

}

- (void)_endGestureFromRestingTouchRecovery:(id)a3
{
  -[_UIRotaryGestureRecognizer _invalidateRestingTouchRecoveryTimerIfNecessary](self, "_invalidateRestingTouchRecoveryTimerIfNecessary", a3);
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateBegan
    || -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateChanged)
  {
    -[UIGestureRecognizer setState:](self, "setState:", 3);
  }
}

- (BOOL)_invalidateRestingTouchBeginTimerIfNecessary
{
  NSTimer *restingTouchBeginTimer;
  NSTimer *v4;

  restingTouchBeginTimer = self->_restingTouchBeginTimer;
  if (restingTouchBeginTimer)
  {
    -[NSTimer invalidate](self->_restingTouchBeginTimer, "invalidate");
    v4 = self->_restingTouchBeginTimer;
    self->_restingTouchBeginTimer = 0;

  }
  return restingTouchBeginTimer != 0;
}

- (void)_invalidateRestingTouchRecoveryTimerIfNecessary
{
  NSTimer *restingTouchRecoveryTimer;
  NSTimer *v4;

  restingTouchRecoveryTimer = self->_restingTouchRecoveryTimer;
  if (restingTouchRecoveryTimer)
  {
    -[NSTimer invalidate](restingTouchRecoveryTimer, "invalidate");
    v4 = self->_restingTouchRecoveryTimer;
    self->_restingTouchRecoveryTimer = 0;

  }
}

- (void)_attemptToStartFromRestingTouch:(id)a3
{
  double v4;

  -[_UIRotaryGestureRecognizer _invalidateRestingTouchBeginTimerIfNecessary](self, "_invalidateRestingTouchBeginTimerIfNecessary", a3);
  if (-[_UIRotaryGestureRecognizer _isTouchInRangeOfInitialTouchForRestingTouchActivation:](self, "_isTouchInRangeOfInitialTouchForRestingTouchActivation:", self->_digitizerLocation.x, self->_digitizerLocation.y))
  {
    if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
    {
      -[_UIRotaryGestureRecognizer _calculateCurrentWheelPosition](self, "_calculateCurrentWheelPosition");
      self->_currentWheelPosition = v4;
      -[_UIRotaryGestureRecognizer setStartRegion:](self, "setStartRegion:", -[_UIRotaryGestureRecognizer _regionForWheelPosition:](self, "_regionForWheelPosition:"));
      if (-[_UIRotaryGestureRecognizer _effectiveCanBeginFromRest](self, "_effectiveCanBeginFromRest"))
      {
        -[_UIRotaryGestureRecognizer setBeganMode:](self, "setBeganMode:", 1);
        if (-[_UIRotaryGestureRecognizer _effectiveMustBeginFromRest](self, "_effectiveMustBeginFromRest"))
        {
          self->_touchBeganPoint = self->_digitizerLocation;
          self->_movementClassification = 0;
        }
        -[_UIRotaryGestureRecognizer _notifyDelegateBeganClassifyingMovementIfNecessary](self, "_notifyDelegateBeganClassifyingMovementIfNecessary");
      }
    }
  }
}

- (BOOL)_effectiveCanBeginFromRest
{
  _UIRotaryGestureRecognizer *v3;
  void *v4;

  if ((*(_BYTE *)&self->_rotaryGestureRecognizerFlags & 1) == 0)
    return 1;
  v3 = self;
  -[UIGestureRecognizer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "rotaryGestureRecognizerCanBeginFromRest:", v3);

  return (char)v3;
}

- (int64_t)_regionForTouchLocation:(CGPoint)a3
{
  -[_UIRotaryGestureRecognizer _calculateWheelPositionForTouchLocation:](self, "_calculateWheelPositionForTouchLocation:", a3.x, a3.y);
  return -[_UIRotaryGestureRecognizer _regionForWheelPosition:](self, "_regionForWheelPosition:");
}

- (int64_t)_regionForWheelPosition:(double)a3
{
  if (a3 >= 0.0 && a3 <= 0.125)
    return 1;
  if (a3 >= 0.875 && a3 <= 1.0)
    return 1;
  if (a3 > 0.125 && a3 < 0.375)
    return 4;
  if (a3 >= 0.375 && a3 <= 0.625)
    return 2;
  if (a3 >= 0.875 || a3 <= 0.625)
    return 0;
  else
    return 3;
}

- (double)_calculateCurrentWheelPosition
{
  double result;

  -[_UIRotaryGestureRecognizer _calculateWheelPositionForTouchLocation:](self, "_calculateWheelPositionForTouchLocation:", self->_digitizerLocation.x, self->_digitizerLocation.y);
  return result;
}

- (double)_calculateWheelPositionForTouchLocation:(CGPoint)a3
{
  double v3;

  -[_UIRotaryGestureRecognizer _calculateAngleForTouchLocation:](self, "_calculateAngleForTouchLocation:", a3.x, a3.y);
  return v3 / 360.0;
}

- (void)_processEvent:(id)a3
{
  CGPoint *p_digitizerLocation;
  double x;
  double y;
  CGFloat v8;
  CGFloat v9;
  int64_t movementClassification;
  UIGestureRecognizerState v11;
  int64_t v12;
  NSMutableArray *v13;
  NSMutableArray *recentRotaryEvents;
  double v15;
  BOOL v16;
  double currentWheelPosition;
  double v18;
  double v19;
  char v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *v24;
  void *v25;
  _UIRotaryGestureRecognizer *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  int v40;
  double v41;
  NSMutableArray *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];

  p_digitizerLocation = &self->_digitizerLocation;
  x = self->_digitizerLocation.x;
  y = self->_digitizerLocation.y;
  objc_msgSend(a3, "_digitizerLocation");
  p_digitizerLocation->x = v8;
  p_digitizerLocation->y = v9;
  if (-[_UIRotaryGestureRecognizer _effectiveMustBeginFromRest](self, "_effectiveMustBeginFromRest")
    && -[_UIRotaryGestureRecognizer beganMode](self, "beganMode") != 1)
  {
    return;
  }
  movementClassification = self->_movementClassification;
  v11 = -[UIGestureRecognizer state](self, "state");
  if (!(v11 | movementClassification))
    -[_UIRotaryGestureRecognizer _attemptToClassifyWithPreviousLocation:newLocation:](self, "_attemptToClassifyWithPreviousLocation:newLocation:", x, y, p_digitizerLocation->x, p_digitizerLocation->y);
  v12 = self->_movementClassification;
  if (v12 == 1)
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
    -[_UIRotaryGestureRecognizer _notifyDelegateFailedClassifyingMovement](self, "_notifyDelegateFailedClassifyingMovement");
    return;
  }
  if (v12 == 2)
  {
    if (!self->_recentRotaryEvents)
    {
      v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      recentRotaryEvents = self->_recentRotaryEvents;
      self->_recentRotaryEvents = v13;

    }
    -[_UIRotaryGestureRecognizer _deadzoneRangeForCurrentTouchLocation](self, "_deadzoneRangeForCurrentTouchLocation");
    v16 = -[_UIRotaryGestureRecognizer _isPoint:inRangeOfCenter:](self, "_isPoint:inRangeOfCenter:", p_digitizerLocation->x, p_digitizerLocation->y, v15);
    currentWheelPosition = self->_currentWheelPosition;
    -[_UIRotaryGestureRecognizer _calculateCurrentWheelPosition](self, "_calculateCurrentWheelPosition");
    self->_currentWheelPosition = v18;
    if (movementClassification)
    {
      if (-[_UIRotaryGestureRecognizer isActivelyTouching](self, "isActivelyTouching"))
      {
        v19 = self->_currentWheelPosition;
        v20 = currentWheelPosition == v19 || v16;
        if ((v20 & 1) != 0)
        {
          if (!v16)
            -[NSMutableArray removeAllObjects](self->_recentRotaryEvents, "removeAllObjects");
          -[_UIRotaryGestureRecognizer setDelta:](self, "setDelta:", 0.0);
          -[_UIRotaryGestureRecognizer setVelocity:](self, "setVelocity:", 0.0);
          -[UIGestureRecognizer setState:](self, "setState:", 2);
          return;
        }
        v33 = v19 - currentWheelPosition;
        v34 = vabdd_f64(v19, currentWheelPosition);
        v35 = v33 + 1.0;
        if (v33 > 0.0)
          v35 = v33 + -1.0;
        if (v34 > 0.5)
          v36 = v35;
        else
          v36 = v33;
        objc_msgSend(a3, "timestamp");
        v38 = v37;
        v39 = (double)(unint64_t)-[NSMutableArray count](self->_recentRotaryEvents, "count");
        v40 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RotaryVelocityFilterSamples, (uint64_t)CFSTR("B519_RotaryVelocityFilterSamples"));
        v41 = *(double *)&qword_1EDDA8088;
        if (v40)
          v41 = 5.0;
        if (v41 < v39)
          -[NSMutableArray removeObjectAtIndex:](self->_recentRotaryEvents, "removeObjectAtIndex:", 0);
        v42 = self->_recentRotaryEvents;
        v47[0] = v38;
        *(double *)&v47[1] = v36;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v47, "{UIRotaryEventInfo=dd}");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v42, "addObject:", v43);

        -[_UIRotaryGestureRecognizer _deltaForEventInfos:](self, "_deltaForEventInfos:", self->_recentRotaryEvents);
        -[_UIRotaryGestureRecognizer _applyDistanceWeightToValue:](self, "_applyDistanceWeightToValue:");
        -[_UIRotaryGestureRecognizer _applyDeadbandToValue:](self, "_applyDeadbandToValue:");
        v45 = v44;
        -[_UIRotaryGestureRecognizer accumulatedDistance](self, "accumulatedDistance");
        -[_UIRotaryGestureRecognizer setAccumulatedDistance:](self, "setAccumulatedDistance:", v45 + v46);
        -[_UIRotaryGestureRecognizer setDelta:](self, "setDelta:", v45);
        -[_UIRotaryGestureRecognizer _velocityForEventInfos:](self, "_velocityForEventInfos:", self->_recentRotaryEvents);
        -[_UIRotaryGestureRecognizer _applyDistanceWeightToValue:](self, "_applyDistanceWeightToValue:");
      }
      else
      {
        objc_msgSend(a3, "timestamp");
        v29 = v28;
        -[NSMutableArray removeAllObjects](self->_recentRotaryEvents, "removeAllObjects");
        v30 = self->_recentRotaryEvents;
        v48[0] = v29;
        v48[1] = 0;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v48, "{UIRotaryEventInfo=dd}");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v30, "addObject:", v31);

        -[_UIRotaryGestureRecognizer setDelta:](self, "setDelta:", 0.0);
        -[_UIRotaryGestureRecognizer setIsActivelyTouching:](self, "setIsActivelyTouching:", 1);
        v32 = 0.0;
      }
      -[_UIRotaryGestureRecognizer setVelocity:](self, "setVelocity:", v32);
      v26 = self;
      v27 = 2;
    }
    else
    {
      objc_msgSend(a3, "timestamp");
      v23 = v22;
      -[NSMutableArray removeAllObjects](self->_recentRotaryEvents, "removeAllObjects");
      v24 = self->_recentRotaryEvents;
      v49[0] = v23;
      v49[1] = 0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v49, "{UIRotaryEventInfo=dd}");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v24, "addObject:", v25);

      -[_UIRotaryGestureRecognizer setAccumulatedDistance:](self, "setAccumulatedDistance:", 0.0);
      -[_UIRotaryGestureRecognizer setDelta:](self, "setDelta:", 0.0);
      -[_UIRotaryGestureRecognizer setStartRegion:](self, "setStartRegion:", -[_UIRotaryGestureRecognizer _regionForWheelPosition:](self, "_regionForWheelPosition:", self->_currentWheelPosition));
      -[_UIRotaryGestureRecognizer setIsActivelyTouching:](self, "setIsActivelyTouching:", 1);
      if (!-[_UIRotaryGestureRecognizer beganMode](self, "beganMode"))
        -[_UIRotaryGestureRecognizer setBeganMode:](self, "setBeganMode:", 2);
      self->_startWheelPosition = self->_currentWheelPosition;
      -[_UIRotaryGestureRecognizer _resetDeadband](self, "_resetDeadband");
      v26 = self;
      v27 = 1;
    }
    -[UIGestureRecognizer setState:](v26, "setState:", v27);
    return;
  }
  if (v11 == UIGestureRecognizerStatePossible)
  {
    -[_UIRotaryGestureRecognizer _calculateCurrentWheelPosition](self, "_calculateCurrentWheelPosition");
    self->_currentWheelPosition = v21;
    -[_UIRotaryGestureRecognizer setAccumulatedDistance:](self, "setAccumulatedDistance:", 0.0);
    -[_UIRotaryGestureRecognizer setDelta:](self, "setDelta:", 0.0);
    -[_UIRotaryGestureRecognizer setStartRegion:](self, "setStartRegion:", -[_UIRotaryGestureRecognizer _regionForWheelPosition:](self, "_regionForWheelPosition:", self->_currentWheelPosition));
    -[_UIRotaryGestureRecognizer setIsActivelyTouching:](self, "setIsActivelyTouching:", 1);
    if (!self->_restingTouchBeginTimer)
    {
      if (self->_hasNotifiedDelegateBeganClassifyingMovement)
        -[_UIRotaryGestureRecognizer _notifyDelegateUpdatedClassifyingMovement](self, "_notifyDelegateUpdatedClassifyingMovement");
      else
        -[_UIRotaryGestureRecognizer _notifyDelegateBeganClassifyingMovementIfNecessary](self, "_notifyDelegateBeganClassifyingMovementIfNecessary");
    }
  }
}

- (void)_notifyDelegateRestTimerCancelledIfNecessary:(BOOL)a3
{
  id v6;

  if (self->_movementClassification != 2 && a3 && (*(_BYTE *)&self->_rotaryGestureRecognizerFlags & 8) != 0)
  {
    -[UIGestureRecognizer delegate](self, "delegate", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rotaryGestureRecognizerCancelledRestTimer:", self);

  }
}

- (void)_notifyDelegateBeganClassifyingMovementIfNecessary
{
  id v3;

  if (!self->_hasNotifiedDelegateBeganClassifyingMovement
    && (*(_BYTE *)&self->_rotaryGestureRecognizerFlags & 0x10) != 0)
  {
    self->_hasNotifiedDelegateBeganClassifyingMovement = 1;
    -[UIGestureRecognizer delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rotaryGestureRecognizerBeganClassifyingMovement:", self);

  }
}

- (void)_notifyDelegateUpdatedClassifyingMovement
{
  id v3;

  if (self->_hasNotifiedDelegateBeganClassifyingMovement
    && (*(_BYTE *)&self->_rotaryGestureRecognizerFlags & 0x20) != 0)
  {
    -[UIGestureRecognizer delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rotaryGestureRecognizerUpdatedClassifyingMovement:", self);

  }
}

- (void)_notifyDelegateFailedClassifyingMovement
{
  id v3;

  if (self->_hasNotifiedDelegateBeganClassifyingMovement
    && (*(_BYTE *)&self->_rotaryGestureRecognizerFlags & 0x40) != 0)
  {
    -[UIGestureRecognizer delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rotaryGestureRecognizerFailedClassifyingMovement:", self);

  }
}

- (BOOL)_effectiveMustBeginFromRest
{
  uint64_t v2;
  NSNumber *delegateMustBeginFromRestValue;
  void *v6;
  NSNumber *v7;
  NSNumber *v8;

  if (self->_restingTouchRecoveryTimer)
    goto LABEL_2;
  delegateMustBeginFromRestValue = self->_delegateMustBeginFromRestValue;
  if (!delegateMustBeginFromRestValue)
  {
    if ((*(_BYTE *)&self->_rotaryGestureRecognizerFlags & 2) != 0)
    {
      -[UIGestureRecognizer delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_msgSend(v6, "rotaryGestureRecognizerMustBeginFromRest:", self);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
      v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v8 = self->_delegateMustBeginFromRestValue;
      self->_delegateMustBeginFromRestValue = v7;

      return v2;
    }
LABEL_2:
    LOBYTE(v2) = 0;
    return v2;
  }
  return -[NSNumber BOOLValue](delegateMustBeginFromRestValue, "BOOLValue");
}

- (void)_attemptToClassifyWithPreviousLocation:(CGPoint)a3 newLocation:(CGPoint)a4
{
  double y;
  double x;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  uint64_t v22;
  BOOL v23;
  double v24;
  int v25;
  double v26;
  int v27;
  uint64_t v28;
  BOOL v29;
  double v30;
  int v31;
  double v32;
  double v33;
  int64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  BOOL v40;

  y = a4.y;
  x = a4.x;
  -[_UIRotaryGestureRecognizer _calculateRadialDistance:](self, "_calculateRadialDistance:", a4.x, a4.y);
  v8 = v7;
  v9 = -[_UIRotaryGestureRecognizer _regionForTouchLocation:](self, "_regionForTouchLocation:", x, y);
  -[_UIRotaryGestureRecognizer _calculateAngleForTouchLocation:](self, "_calculateAngleForTouchLocation:", x, y);
  if (!self->_movementClassification)
  {
    v11 = v10;
    -[_UIRotaryGestureRecognizer _calculateRadialDistance:](self, "_calculateRadialDistance:", self->_touchBeganPoint.x, self->_touchBeganPoint.y);
    v13 = v12;
    -[_UIRotaryGestureRecognizer _calculateAngleForTouchLocation:](self, "_calculateAngleForTouchLocation:", self->_touchBeganPoint.x, self->_touchBeganPoint.y);
    if (v11 <= 270.0 || v14 >= 90.0)
    {
      if (v14 > 270.0 && v11 < 90.0)
        v15 = v11 - v14 + 360.0;
      else
        v15 = v11 - v14;
    }
    else
    {
      v15 = -(v14 - v11 + 360.0);
    }
    -[_UIRotaryGestureRecognizer _movementClassificationAngleThresholdNumerator](self, "_movementClassificationAngleThresholdNumerator");
    v18 = v17;
    -[_UIRotaryGestureRecognizer _directionalMovementClassificationDistanceThreshold](self, "_directionalMovementClassificationDistanceThreshold");
    v20 = v19;
    if (-[_UIRotaryGestureRecognizer startRegion](self, "startRegion") == 1)
    {
      v21 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD764B8, (uint64_t)CFSTR("B519_DistanceFromCenterTopQuadrantThreshold"));
      v22 = qword_1ECD764C0;
      v23 = v21 == 0;
      v24 = 0.2;
    }
    else
    {
      v25 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD764C8, (uint64_t)CFSTR("B519_DistanceFromCenterThreshold"));
      v22 = qword_1ECD764D0;
      v23 = v25 == 0;
      v24 = 0.23;
    }
    if (v23)
      v26 = *(double *)&v22;
    else
      v26 = v24;
    if (v9 == 1)
    {
      v27 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD764B8, (uint64_t)CFSTR("B519_DistanceFromCenterTopQuadrantThreshold"));
      v28 = qword_1ECD764C0;
      v29 = v27 == 0;
      v30 = 0.2;
    }
    else
    {
      v31 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD764C8, (uint64_t)CFSTR("B519_DistanceFromCenterThreshold"));
      v28 = qword_1ECD764D0;
      v29 = v31 == 0;
      v30 = 0.23;
    }
    if (v29)
      v32 = *(double *)&v28;
    else
      v32 = v30;
    if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD764D8, (uint64_t)CFSTR("B519_DistanceFromCenterMinimumThreshold")))v33 = 0.18;
    else
      v33 = *(double *)&qword_1ECD764E0;
    v34 = 1;
    if (v13 < v26)
      goto LABEL_41;
    v35 = vabdd_f64(v8, v13);
    v36 = fmax(fmin(v35 / v20, 1.0), 0.0);
    if (v8 < (1.0 - v36) * v32 + v36 * v33)
      goto LABEL_41;
    v37 = fabs(v15);
    v38 = fmax(fmin(v18 / v8, 179.0), 1.0);
    if (v37 > v38 && v35 > v20)
    {
      v34 = 2;
      if (v37 / v38 <= v35 / v20)
        v34 = 1;
LABEL_41:
      self->_movementClassification = v34;
      return;
    }
    v34 = 2;
    if (v37 > v38)
    {
      v40 = 0;
    }
    else
    {
      v34 = 1;
      v40 = v35 <= v20;
    }
    if (!v40)
      goto LABEL_41;
  }
}

- (double)_velocityForEventInfos:(id)a3
{
  unint64_t v4;
  int v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  void *v12;
  void *v13;
  double v15[2];
  double v16;

  v4 = objc_msgSend(a3, "count");
  v5 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RotaryVelocityFilterSamples, (uint64_t)CFSTR("B519_RotaryVelocityFilterSamples"));
  v6 = 0.0;
  if (v4 >= 2)
  {
    v7 = *(double *)&qword_1EDDA8088;
    if (v5)
      v7 = 5.0;
    v8 = fmax(v7, 1.0);
    if (v4 >= (unint64_t)v8)
      v9 = (unint64_t)v8;
    else
      v9 = v4;
    if (v4 <= (unint64_t)v8)
      v10 = 1;
    else
      v10 = v4 - v9;
    if (v10 <= v4 - 1)
    {
      v11 = (double)v9;
      do
      {
        objc_msgSend(a3, "objectAtIndex:", v10 - 1, 0, 0, 0, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "getValue:", &v16);

        objc_msgSend(a3, "objectAtIndex:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "getValue:", v15);

        v6 = v6 + v15[1] / fmax(v15[0] - v16, 0.0151515152) / v11;
        ++v10;
      }
      while (v4 != v10);
    }
  }
  return v6;
}

- (double)_applyDeadbandToValue:(double)result
{
  double rotaryDeadBand;
  double v4;
  double v5;
  double v6;

  rotaryDeadBand = self->_rotaryDeadBand;
  if (rotaryDeadBand > 0.0)
  {
    v4 = fabs(result);
    v5 = rotaryDeadBand - v4;
    v6 = 0.0;
    if (v5 <= 0.0)
    {
      v6 = result / v4 * fabs(v5);
      v5 = 0.0;
    }
    self->_rotaryDeadBand = v5;
    return v6;
  }
  return result;
}

- (double)_deltaForEventInfos:(id)a3
{
  unint64_t v4;
  int v5;
  double v6;
  double v7;
  unint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v14;
  double v15;

  v4 = objc_msgSend(a3, "count");
  v5 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RotaryVelocityFilterSamples, (uint64_t)CFSTR("B519_RotaryVelocityFilterSamples"));
  v6 = 0.0;
  if (v4)
  {
    v7 = *(double *)&qword_1EDDA8088;
    if (v5)
      v7 = 5.0;
    v8 = (unint64_t)fmax(v7, 1.0);
    if (v4 < v8)
      v8 = v4;
    if (v4 - v8 <= v4 - 1)
    {
      v9 = (double)v8;
      v10 = -(uint64_t)v8;
      do
      {
        v15 = 0.0;
        objc_msgSend(a3, "objectAtIndex:", v4 + v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "getValue:", &v14);

        v6 = v6 + v15 / v9;
      }
      while (!__CFADD__(v10++, 1));
    }
  }
  return v6;
}

- (double)_applyDistanceWeightToValue:(double)a3
{
  float64x2_t v8;
  double v9;
  int v10;
  double v11;

  __asm { FMOV            V2.2D, #0.5 }
  v8 = vsubq_f64(_Q2, (float64x2_t)self->_digitizerLocation);
  v9 = sqrt(vaddvq_f64(vmulq_f64(v8, v8))) * a3;
  v10 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_DeweightedDistanceFromCenterFactor, (uint64_t)CFSTR("B519_DeweightedDistanceFromCenterFactor"));
  v11 = 1.0 / *(double *)&qword_1EDDA8098;
  if (v10)
    v11 = 2.5;
  return v11 * v9;
}

- (double)_applyScaleFactor:(double)a3 toValue:(double)a4 fromAngle:(double)a5 toAngle:(double)a6
{
  double v10;
  BOOL v11;
  double v12;

  -[_UIRotaryGestureRecognizer _calculateAngleForTouchLocation:](self, "_calculateAngleForTouchLocation:", self->_digitizerLocation.x, self->_digitizerLocation.y);
  v11 = v10 >= a6 || v10 <= a5;
  v12 = 1.0;
  if (!v11)
    v12 = a3;
  return v12 * a4;
}

- (double)_deadzoneRangeForCurrentTouchLocation
{
  double v3;
  int v4;
  double v5;
  double result;

  if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76458, (uint64_t)CFSTR("B519_RestingTouchMinimumDistanceFromCenterTopTouchFactor")))v3 = 0.8333;
  else
    v3 = *(double *)&qword_1ECD76460;
  v4 = _UIInternalPreferenceUsesDefault_1((int *)algn_1ECD76468, (uint64_t)CFSTR("B519_RotaryCenterDeadzone"));
  v5 = 0.2;
  if (!v4)
    v5 = *(double *)&qword_1ECD76470;
  -[_UIRotaryGestureRecognizer _applyScaleFactor:toValue:fromAngle:toAngle:](self, "_applyScaleFactor:toValue:fromAngle:toAngle:", v3, v5, 45.0, 135.0);
  return result;
}

- (double)_restingTouchRangeForCurrentTouchLocation
{
  double v3;
  int v4;
  double v5;
  double result;

  if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76458, (uint64_t)CFSTR("B519_RestingTouchMinimumDistanceFromCenterTopTouchFactor")))v3 = 0.8333;
  else
    v3 = *(double *)&qword_1ECD76460;
  v4 = _UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_11_0, (uint64_t)CFSTR("B519_RestingTouchMinimumDistanceFromCenter"));
  v5 = 0.3;
  if (!v4)
    v5 = *(double *)&qword_1ECD76450;
  -[_UIRotaryGestureRecognizer _applyScaleFactor:toValue:fromAngle:toAngle:](self, "_applyScaleFactor:toValue:fromAngle:toAngle:", v3, v5, 45.0, 135.0);
  return result;
}

- (BOOL)_isPoint:(CGPoint)a3 inRangeOfCenter:(double)a4
{
  return sqrt((0.5 - a3.x) * (0.5 - a3.x) + (0.5 - a3.y) * (0.5 - a3.y)) < a4;
}

- (double)_calculateRadialDistance:(CGPoint)a3
{
  return fmax(sqrt((0.5 - a3.x) * (0.5 - a3.x) + (0.5 - a3.y) * (0.5 - a3.y)), 0.000001);
}

- (double)_calculateAngleForTouchLocation:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;

  y = a3.y;
  x = a3.x;
  -[_UIRotaryGestureRecognizer _calculateRadialDistance:](self, "_calculateRadialDistance:");
  *(float *)&v5 = (x + -0.5) / v5;
  v6 = acosf(*(float *)&v5) * 57.2957795;
  if (y > 0.5)
    v6 = 360.0 - v6;
  return fmod(360.0 - v6 + 90.0, 360.0);
}

- (void)_resetDeadband
{
  int v3;
  double v4;

  v3 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_B519_RotaryDeadbandSize, (uint64_t)CFSTR("B519_RotaryDeadbandSize"));
  v4 = *(double *)&qword_1EDDA8078;
  if (v3)
    v4 = 0.0;
  self->_rotaryDeadBand = v4;
}

- (double)_directionalMovementClassificationDistanceThreshold
{
  int v2;
  double result;
  BOOL v4;
  double v5;
  int v6;

  if (-[_UIRotaryGestureRecognizer beganMode](self, "beganMode") == 1)
  {
    v2 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76498, (uint64_t)CFSTR("B519_RestDirectionalMovementClassificationDistanceThreshold"));
    result = *(double *)&qword_1ECD764A0;
    v4 = v2 == 0;
    v5 = 0.1;
  }
  else
  {
    v6 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76478, (uint64_t)CFSTR("B519_StrictDirectionalMovementClassificationDistanceThreshold"));
    result = *(double *)&qword_1ECD76480;
    v4 = v6 == 0;
    v5 = 0.15;
  }
  if (!v4)
    return v5;
  return result;
}

- (double)_movementClassificationAngleThresholdNumerator
{
  int v2;
  double result;
  BOOL v4;
  double v5;
  int v6;

  if (-[_UIRotaryGestureRecognizer beganMode](self, "beganMode") == 1)
  {
    v2 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD764A8, (uint64_t)CFSTR("B519_RestMovementClassificationAngleThresholdNumerator"));
    result = *(double *)&qword_1ECD764B0;
    v4 = v2 == 0;
    v5 = 6.0;
  }
  else
  {
    v6 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76488, (uint64_t)CFSTR("B519_StrictMovementClassificationAngleThresholdNumerator"));
    result = *(double *)&qword_1ECD76490;
    v4 = v6 == 0;
    v5 = 15.0;
  }
  if (!v4)
    return v5;
  return result;
}

- (double)position
{
  return self->_currentWheelPosition;
}

- (void)setDelegate:(id)a3
{
  id v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  objc_super v12;

  -[UIGestureRecognizer delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != a3 || !a3 && (*(_BYTE *)&self->_rotaryGestureRecognizerFlags & 0x80000000) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIRotaryGestureRecognizer;
    -[UIGestureRecognizer setDelegate:](&v12, sel_setDelegate_, a3);
    *(_BYTE *)&self->_rotaryGestureRecognizerFlags = *(_BYTE *)&self->_rotaryGestureRecognizerFlags & 0x7F | ((a3 != 0) << 7);
    *(_BYTE *)&self->_rotaryGestureRecognizerFlags = *(_BYTE *)&self->_rotaryGestureRecognizerFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_BYTE *)&self->_rotaryGestureRecognizerFlags = *(_BYTE *)&self->_rotaryGestureRecognizerFlags & 0xFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *(_BYTE *)&self->_rotaryGestureRecognizerFlags = *(_BYTE *)&self->_rotaryGestureRecognizerFlags & 0xFB | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_BYTE *)&self->_rotaryGestureRecognizerFlags = *(_BYTE *)&self->_rotaryGestureRecognizerFlags & 0xF7 | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 16;
    else
      v9 = 0;
    *(_BYTE *)&self->_rotaryGestureRecognizerFlags = *(_BYTE *)&self->_rotaryGestureRecognizerFlags & 0xEF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 32;
    else
      v10 = 0;
    *(_BYTE *)&self->_rotaryGestureRecognizerFlags = *(_BYTE *)&self->_rotaryGestureRecognizerFlags & 0xDF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 64;
    else
      v11 = 0;
    *(_BYTE *)&self->_rotaryGestureRecognizerFlags = *(_BYTE *)&self->_rotaryGestureRecognizerFlags & 0xBF | v11;
  }

}

- (double)accumulatedDistance
{
  return self->_accumulatedDistance;
}

- (void)setAccumulatedDistance:(double)a3
{
  self->_accumulatedDistance = a3;
}

- (double)delta
{
  return self->_delta;
}

- (void)setDelta:(double)a3
{
  self->_delta = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (BOOL)isActivelyTouching
{
  return self->_isActivelyTouching;
}

- (void)setIsActivelyTouching:(BOOL)a3
{
  self->_isActivelyTouching = a3;
}

- (int64_t)startRegion
{
  return self->_startRegion;
}

- (void)setStartRegion:(int64_t)a3
{
  self->_startRegion = a3;
}

- (int64_t)beganMode
{
  return self->_beganMode;
}

- (void)setBeganMode:(int64_t)a3
{
  self->_beganMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restingTouchRecoveryTimer, 0);
  objc_storeStrong((id *)&self->_restingTouchBeginTimer, 0);
  objc_storeStrong((id *)&self->_delegateMustBeginFromRestValue, 0);
  objc_storeStrong((id *)&self->_recentRotaryEvents, 0);
}

@end
