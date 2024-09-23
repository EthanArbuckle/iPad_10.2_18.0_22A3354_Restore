@implementation UILongPressGestureRecognizer

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 1;
}

- (NSUInteger)numberOfTapsRequired
{
  return -[UITapRecognizer numberOfTapsRequired](self->_imp, "numberOfTapsRequired");
}

- (void)setView:(id)a3
{
  objc_super v5;

  if (!a3)
    -[UILongPressGestureRecognizer clearAllTimers](self, "clearAllTimers");
  v5.receiver = self;
  v5.super_class = (Class)UILongPressGestureRecognizer;
  -[UIGestureRecognizer setView:](&v5, sel_setView_, a3);
}

- (void)set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:(BOOL)a3
{
  self->__prefersNotToBePreventedByCompetingLongPressGestureRecognizers = a3;
}

- (void)_startMultitouchTimer
{
  UIDelayedAction *v3;
  UIDelayedAction *v4;
  UIDelayedAction *multitouchTimer;

  -[UILongPressGestureRecognizer clearAllTimers](self, "clearAllTimers");
  v3 = [UIDelayedAction alloc];
  v4 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v3, "initWithTarget:action:userInfo:delay:mode:", self, sel_tooMuchElapsed_, 0, *MEMORY[0x1E0C99860], self->_allowableElapsedTimeForAllRequiredTouches);
  multitouchTimer = self->_multitouchTimer;
  self->_multitouchTimer = v4;

}

- (UILongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UILongPressGestureRecognizer *v4;
  UILongPressGestureRecognizer *v5;
  UITapRecognizer *v6;
  UITapRecognizer *imp;
  UILongPressGestureRecognizer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UILongPressGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v10, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_numberOfTouchesRequired = 1;
    v4->_minimumPressDuration = 0.5;
    v4->_allowableMovement = 10.0;
    *((_BYTE *)v4 + 432) |= 4u;
    v4->_allowableElapsedTimeForAllRequiredTouches = 0.0;
    v6 = objc_alloc_init(UITapRecognizer);
    imp = v5->_imp;
    v5->_imp = v6;

    -[UITapRecognizer setDelegate:](v5->_imp, "setDelegate:", v5);
    -[UITapRecognizer setNumberOfTapsRequired:](v5->_imp, "setNumberOfTapsRequired:", 0);
    v8 = v5;
  }

  return v5;
}

- (void)setMinimumPressDuration:(NSTimeInterval)minimumPressDuration
{
  self->_minimumPressDuration = minimumPressDuration;
}

- (void)setAllowableMovement:(CGFloat)allowableMovement
{
  self->_allowableMovement = allowableMovement;
}

- (void)setNumberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired
{
  -[UITapRecognizer setNumberOfTouchesRequired:](self->_imp, "setNumberOfTouchesRequired:");
  self->_numberOfTouchesRequired = numberOfTouchesRequired;
}

- (BOOL)_prefersNotToBePreventedByCompetingLongPressGestureRecognizers
{
  return self->__prefersNotToBePreventedByCompetingLongPressGestureRecognizers;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (-[UILongPressGestureRecognizer _buttonType](self, "_buttonType") == -1)
  {
    if (self)
      self->_requiresQuietImpulseForCurrentTouchSequence = 0;
    -[UILongPressGestureRecognizer touches](self, "touches");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_lastCentroidScreen.x = _CentroidOfTouches(v7, 0);
    self->_lastCentroidScreen.y = v8;

    if ((*((_BYTE *)self + 432) & 4) == 0)
    {
      -[UITapRecognizer touchesEnded:withEvent:](self->_imp, "touchesEnded:withEvent:", a3, a4);
      return;
    }
    -[UILongPressGestureRecognizer _locationOfTouches:](self, "_locationOfTouches:", a3);
    v10 = v9;
    v12 = v11;
    objc_msgSend(a4, "timestamp");
    v14 = v13;
    objc_msgSend(a3, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILongPressGestureRecognizer _centroidMovedTo:atTime:physicalTouch:](self, "_centroidMovedTo:atTime:physicalTouch:", v15, v10, v12, v14);

    if (objc_msgSend(a3, "count"))
    {
      -[NSMutableSet minusSet:](self->_activeTouches, "minusSet:", a3);
      if (!-[UILongPressGestureRecognizer _allowsDynamicTouchesList](self, "_allowsDynamicTouchesList")
        || !-[NSMutableSet count](self->_activeTouches, "count"))
      {
        v16 = (void *)MEMORY[0x1E0C99E60];
        -[UILongPressGestureRecognizer touches](self, "touches");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWithArray:", v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILongPressGestureRecognizer _interactionsEndedWithValidTouches:](self, "_interactionsEndedWithValidTouches:", objc_msgSend(v17, "intersectsSet:", a3));

        goto LABEL_13;
      }
      if (-[UILongPressGestureRecognizer _allowsDynamicTouchesList](self, "_allowsDynamicTouchesList"))
      {
        -[NSMutableSet allObjects](self->_activeTouches, "allObjects");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        -[UILongPressGestureRecognizer _changeTouchesListTo:](self, "_changeTouchesListTo:", v18);
LABEL_13:

      }
    }
  }
}

- (NSArray)touches
{
  return self->_touches;
}

- (int64_t)_buttonType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIGestureRecognizer allowedPressTypes](self, "allowedPressTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (CGPoint)_locationOfTouches:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  objc_msgSend(a3, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationInView:", 0);
  objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)_allowsDynamicTouchesList
{
  return (*((unsigned __int8 *)self + 432) >> 4) & 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  int64_t v7;
  id v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  NSMutableSet *v13;
  NSMutableSet *activeTouches;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  double v20;
  uint64_t v21;
  NSMutableSet *v22;
  CGFloat v23;
  CGFloat v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (-[UILongPressGestureRecognizer _buttonType](self, "_buttonType") != -1)
    goto LABEL_2;
  v7 = -[UILongPressGestureRecognizer buttonMaskRequired](self, "buttonMaskRequired");
  v8 = a4;
  if (objc_msgSend(v8, "_buttonMask"))
  {
    v9 = objc_msgSend(v8, "_buttonMask") & v7;

    if (!v9)
      goto LABEL_2;
  }
  else
  {

  }
  if ((*((_BYTE *)self + 432) & 4) == 0)
  {
    -[UITapRecognizer touchesBegan:withEvent:](self->_imp, "touchesBegan:withEvent:", a3, v8);
    return;
  }
  if (self->_tooMuchTimeElapsed)
    -[UILongPressGestureRecognizer clearAllTimers](self, "clearAllTimers");
  if (!-[NSMutableSet count](self->_activeTouches, "count"))
  {
    -[UILongPressGestureRecognizer _locationOfTouches:](self, "_locationOfTouches:", a3);
    self->_lastSceneReferenceLocation.x = v10;
    self->_lastSceneReferenceLocation.y = v11;
    self->_lastUnadjustedSceneReferenceLocation = self->_lastSceneReferenceLocation;
    objc_msgSend(v8, "timestamp");
    self->_lastTouchTime = v12;
  }
  if (objc_msgSend(a3, "count"))
  {
    if (!self->_activeTouches)
    {
      v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      activeTouches = self->_activeTouches;
      self->_activeTouches = v13;

    }
    if ((unint64_t)(self->super._state - 1) <= 2)
    {
      if (-[UILongPressGestureRecognizer _allowsDynamicTouchesList](self, "_allowsDynamicTouchesList"))
      {
        -[NSMutableSet unionSet:](self->_activeTouches, "unionSet:", a3);
        -[NSMutableSet allObjects](self->_activeTouches, "allObjects");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        -[UILongPressGestureRecognizer _changeTouchesListTo:](self, "_changeTouchesListTo:");
LABEL_19:

        return;
      }
      if ((unint64_t)(self->super._state - 1) <= 2)
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v15 = a3;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v27 != v18)
                objc_enumerationMutation(v15);
              -[UIGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), v8);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v17);
        }

        return;
      }
    }
    -[NSMutableSet unionSet:](self->_activeTouches, "unionSet:", a3);
    if ((*((_BYTE *)self + 432) & 1) != 0)
      return;
    -[UILongPressGestureRecognizer _allowableSeparation](self, "_allowableSeparation");
    if (v20 != 1.79769313e308
      && -[UILongPressGestureRecognizer activeTouchesExceedAllowableSeparation](self, "activeTouchesExceedAllowableSeparation"))
    {
LABEL_41:
      -[UILongPressGestureRecognizer clearAllTimers](self, "clearAllTimers");
LABEL_2:
      -[UIGestureRecognizer setState:](self, "setState:", 5);
      return;
    }
    if (-[UILongPressGestureRecognizer numberOfTouchesRequired](self, "numberOfTouchesRequired") >= 2
      && -[NSMutableSet count](self->_activeTouches, "count") < self->_numberOfTouchesRequired
      && self->_allowableElapsedTimeForAllRequiredTouches > 0.0)
    {
      -[UILongPressGestureRecognizer _startMultitouchTimer](self, "_startMultitouchTimer");
      return;
    }
    v21 = -[NSMutableSet count](self->_activeTouches, "count");
    v22 = self->_activeTouches;
    if (v21 == self->_numberOfTouchesRequired)
    {
      -[NSMutableSet allObjects](v22, "allObjects");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[UILongPressGestureRecognizer setTouches:](self, "setTouches:");
      -[UILongPressGestureRecognizer _centroidScreen](self, "_centroidScreen");
      self->_startPointScreen.x = v23;
      self->_startPointScreen.y = v24;
      -[UILongPressGestureRecognizer clearAllTimersAndStartEnoughTimeElapsedTimer](self, "clearAllTimersAndStartEnoughTimeElapsedTimer");
      if (-[UIGestureRecognizer _inForceCapableEnvironment](self))
        self->_requiresQuietImpulseForCurrentTouchSequence = -[UILongPressGestureRecognizer _touchesMayBeRecognizedByForcePreviewingRevealGestureRecognizerWhichShouldDelayTimer:](self, "_touchesMayBeRecognizedByForcePreviewingRevealGestureRecognizerWhichShouldDelayTimer:", v25);
      goto LABEL_19;
    }
    if (-[NSMutableSet count](v22, "count") > self->_numberOfTouchesRequired)
    {
      *((_BYTE *)self + 432) |= 2u;
      goto LABEL_41;
    }
  }
}

- (NSUInteger)numberOfTouchesRequired
{
  return self->_numberOfTouchesRequired;
}

- (int64_t)buttonMaskRequired
{
  return -[UITapRecognizer buttonMaskRequired](self->_imp, "buttonMaskRequired");
}

- (void)_resetGestureRecognizer
{
  objc_super v3;

  -[UITapRecognizer _reset](self->_imp, "_reset");
  if ((unint64_t)(self->super._state - 1) <= 2)
    -[UIGestureRecognizer state](self, "state");
  -[UILongPressGestureRecognizer clearAllTimers](self, "clearAllTimers");
  *((_BYTE *)self + 432) &= ~1u;
  *((_BYTE *)self + 432) &= ~2u;
  *((_BYTE *)self + 432) = *((_BYTE *)self + 432) & 0xFB | (4
                                                          * (-[UITapRecognizer numberOfTapsRequired](self->_imp, "numberOfTapsRequired") == 0));
  -[NSMutableSet removeAllObjects](self->_activeTouches, "removeAllObjects");
  -[UILongPressGestureRecognizer setTouches:](self, "setTouches:", 0);
  self->_lastCentroidScreen = (CGPoint)*MEMORY[0x1E0C9D538];
  -[UILongPressGestureRecognizer _resetVelocitySamples](self, "_resetVelocitySamples");
  self->_requiresQuietImpulseForCurrentTouchSequence = 0;
  v3.receiver = self;
  v3.super_class = (Class)UILongPressGestureRecognizer;
  -[UIGestureRecognizer _resetGestureRecognizer](&v3, sel__resetGestureRecognizer);
}

- (void)setTouches:(id)a3
{
  objc_storeStrong((id *)&self->_touches, a3);
}

- (void)_resetVelocitySamples
{
  UILongPressGestureVelocitySample *velocitySample;
  UILongPressGestureVelocitySample *previousVelocitySample;

  velocitySample = self->_velocitySample;
  self->_velocitySample = 0;

  previousVelocitySample = self->_previousVelocitySample;
  self->_previousVelocitySample = 0;

}

- (void)_interactionsEndedWithValidTouches:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v6;

  v3 = a3;
  *((_BYTE *)self + 432) |= 1u;
  -[UILongPressGestureRecognizer clearAllTimers](self, "clearAllTimers");
  if ((unint64_t)(self->super._state - 1) > 2 || !v3)
    v6 = 5;
  else
    v6 = -[UILongPressGestureRecognizer _finalStateForRecognition](self, "_finalStateForRecognition");
  -[UIGestureRecognizer setState:](self, "setState:", v6);
}

- (void)clearAllTimers
{
  UIDelayedAction *tooMuchTimeElapsed;
  UIDelayedAction *v4;
  UIDelayedAction *multitouchTimer;
  UIDelayedAction *v6;

  -[UILongPressGestureRecognizer _clearEnoughTimeElapsedTimer](self, "_clearEnoughTimeElapsedTimer");
  tooMuchTimeElapsed = self->_tooMuchTimeElapsed;
  if (tooMuchTimeElapsed)
  {
    -[UIDelayedAction cancel](tooMuchTimeElapsed, "cancel");
    v4 = self->_tooMuchTimeElapsed;
    self->_tooMuchTimeElapsed = 0;

  }
  multitouchTimer = self->_multitouchTimer;
  if (multitouchTimer)
  {
    -[UIDelayedAction cancel](multitouchTimer, "cancel");
    v6 = self->_multitouchTimer;
    self->_multitouchTimer = 0;

  }
}

- (void)_clearEnoughTimeElapsedTimer
{
  UIHeldAction *enoughTimeElapsed;
  UIHeldAction *v4;
  NSObservation *touchForceObservation;

  enoughTimeElapsed = self->_enoughTimeElapsed;
  if (enoughTimeElapsed)
  {
    -[UIHeldAction cancel](enoughTimeElapsed, "cancel");
    v4 = self->_enoughTimeElapsed;
    self->_enoughTimeElapsed = 0;

    touchForceObservation = self->_touchForceObservation;
    self->_touchForceObservation = 0;

    -[UILongPressGestureRecognizer _resetImpulseQuietness](self, "_resetImpulseQuietness");
  }
}

- (double)_allowableSeparation
{
  double result;

  -[UITapRecognizer allowableSeparation](self->_imp, "allowableSeparation");
  return result;
}

- (void)clearAllTimersAndStartEnoughTimeElapsedTimer
{
  -[UILongPressGestureRecognizer clearAllTimers](self, "clearAllTimers");
  -[UILongPressGestureRecognizer _startEnoughTimeElapsedTimer](self, "_startEnoughTimeElapsedTimer");
}

- (void)_startEnoughTimeElapsedTimer
{
  double v3;
  UIHeldAction *v4;
  UIHeldAction *v5;
  UIHeldAction *enoughTimeElapsed;
  void *v7;
  NSObservation *v8;
  NSObservation *touchForceObservation;
  _QWORD v10[4];
  id v11;
  id location;

  -[UILongPressGestureRecognizer minimumPressDuration](self, "minimumPressDuration");
  if (v3 <= 0.0)
  {
    -[UILongPressGestureRecognizer enoughTimeElapsed:](self, "enoughTimeElapsed:", 0);
  }
  else
  {
    v4 = [UIHeldAction alloc];
    -[UILongPressGestureRecognizer delay](self, "delay");
    v5 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v4, "initWithTarget:action:userInfo:delay:mode:", self, sel_enoughTimeElapsed_, 0, *MEMORY[0x1E0C99860]);
    enoughTimeElapsed = self->_enoughTimeElapsed;
    self->_enoughTimeElapsed = v5;

  }
  if (-[UIGestureRecognizer _inForceCapableEnvironment](self))
  {
    objc_initWeak(&location, self);
    -[UIGestureRecognizer _touchForceObservable](self, "_touchForceObservable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__UILongPressGestureRecognizer__startEnoughTimeElapsedTimer__block_invoke;
    v10[3] = &unk_1E16C9570;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v7, "addObserverBlock:", v10);
    v8 = (NSObservation *)objc_claimAutoreleasedReturnValue();
    touchForceObservation = self->_touchForceObservation;
    self->_touchForceObservation = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (NSTimeInterval)minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (double)delay
{
  return self->_minimumPressDuration;
}

- (void)_resetImpulseQuietness
{
  self->_impulseObservations = 0;
  self->_currentImpulse = 0.0;
  self->_lastForce = 0.0;
  self->_lastForceTimestamp = 0.0;
}

- (CGPoint)_centroidScreen
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CGFloat x;
  double v10;
  CGFloat y;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  CGPoint result;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[UILongPressGestureRecognizer touches](self, "touches", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v7), "window");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          x = self->_lastCentroidScreen.x;
          y = self->_lastCentroidScreen.y;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }

  -[UILongPressGestureRecognizer touches](self, "touches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  x = _CentroidOfTouches(v3, 0);
  y = v10;
LABEL_11:

  v12 = x;
  v13 = y;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)setDelay:(double)a3
{
  self->_minimumPressDuration = a3;
}

- (void)setButtonMaskRequired:(int64_t)a3
{
  void *v6;

  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UILongPressGestureRecognizer.m"), 219, CFSTR("buttonMaskRequired must be greater than 0"));

  }
  -[UITapRecognizer setButtonMaskRequired:](self->_imp, "setButtonMaskRequired:", a3);
}

- (void)_centroidMovedTo:(CGPoint)a3 atTime:(double)a4 physicalTouch:(id)a5
{
  CGFloat y;
  CGFloat x;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double lastTouchTime;
  UILongPressGestureVelocitySample *v14;
  void *v15;
  char *v16;

  y = a3.y;
  x = a3.x;
  -[UILongPressGestureRecognizer _adjustSceneReferenceLocation:](self, "_adjustSceneReferenceLocation:", a5);
  v10 = v9;
  v12 = v11;
  lastTouchTime = self->_lastTouchTime;
  v14 = self->_previousVelocitySample;
  objc_storeStrong((id *)&self->_previousVelocitySample, self->_velocitySample);
  v15 = v14;
  if (!v14)
    v15 = (void *)objc_opt_new();
  objc_storeStrong((id *)&self->_velocitySample, v15);
  v16 = v15;
  if (!v14)

  *(CGPoint *)(v16 + 8) = self->_lastSceneReferenceLocation;
  *((CGFloat *)v16 + 3) = v10;
  *((CGFloat *)v16 + 4) = v12;
  *((double *)v16 + 5) = a4 - lastTouchTime;

  self->_lastUnadjustedSceneReferenceLocation.x = x;
  self->_lastUnadjustedSceneReferenceLocation.y = y;
  self->_lastSceneReferenceLocation.x = v10;
  self->_lastSceneReferenceLocation.y = v12;
  self->_lastTouchTime = a4;
}

- (CGPoint)_adjustSceneReferenceLocation:(CGPoint)result
{
  if (self->_lastSceneReferenceLocation.x != self->_lastUnadjustedSceneReferenceLocation.x
    || self->_lastSceneReferenceLocation.y != self->_lastUnadjustedSceneReferenceLocation.y)
  {
    -[UILongPressGestureRecognizer _shiftPanLocationToNewSceneReferenceLocation:](self, "_shiftPanLocationToNewSceneReferenceLocation:", result.x, result.y);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchForceObservation, 0);
  objc_storeStrong((id *)&self->_previousVelocitySample, 0);
  objc_storeStrong((id *)&self->_velocitySample, 0);
  objc_storeStrong((id *)&self->_imp, 0);
  objc_storeStrong((id *)&self->_multitouchTimer, 0);
  objc_storeStrong((id *)&self->_tooMuchTimeElapsed, 0);
  objc_storeStrong((id *)&self->_enoughTimeElapsed, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
  objc_storeStrong((id *)&self->_touches, 0);
}

- (void)set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:(BOOL)a3
{
  self->__prefersToBeExclusiveWithCompetingLongPressGestureRecognizers = a3;
}

- (void)_setRequiresQuietImpulse:(BOOL)a3
{
  self->_requiresQuietImpulse = a3;
}

- (void)setNumberOfTapsRequired:(NSUInteger)numberOfTapsRequired
{
  *((_BYTE *)self + 432) = *((_BYTE *)self + 432) & 0xFB | (4 * (numberOfTapsRequired == 0));
  -[UITapRecognizer setNumberOfTapsRequired:](self->_imp, "setNumberOfTapsRequired:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UILongPressGestureRecognizer)initWithCoder:(id)a3
{
  UILongPressGestureRecognizer *v4;
  UILongPressGestureRecognizer *v5;
  uint64_t v6;
  UITapRecognizer *imp;
  float v8;
  float v9;
  UILongPressGestureRecognizer *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UILongPressGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithCoder:](&v12, sel_initWithCoder_);
  v5 = v4;
  if (v4)
  {
    v4->_numberOfTouchesRequired = 1;
    v4->_minimumPressDuration = 0.5;
    v4->_allowableMovement = 10.0;
    *((_BYTE *)v4 + 432) |= 4u;
    v4->_allowableElapsedTimeForAllRequiredTouches = 0.0;
    objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UILongPressGestureRecognizer._imp"));
    v6 = objc_claimAutoreleasedReturnValue();
    imp = v5->_imp;
    v5->_imp = (UITapRecognizer *)v6;

    -[UITapRecognizer setDelegate:](v5->_imp, "setDelegate:", v5);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UILongPressGestureRecognizer.numberOfTouchesRequired")))v5->_numberOfTouchesRequired = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("UILongPressGestureRecognizer.numberOfTouchesRequired"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UILongPressGestureRecognizer.minimumPressDuration")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("UILongPressGestureRecognizer.minimumPressDuration"));
      v5->_minimumPressDuration = v8;
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UILongPressGestureRecognizer.allowableMovement")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("UILongPressGestureRecognizer.allowableMovement"));
      v5->_allowableMovement = v9;
    }
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t numberOfTouchesRequired;
  double minimumPressDuration;
  double allowableMovement;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UILongPressGestureRecognizer;
  -[UIGestureRecognizer encodeWithCoder:](&v8, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_imp, CFSTR("UILongPressGestureRecognizer._imp"));
  numberOfTouchesRequired = self->_numberOfTouchesRequired;
  if (numberOfTouchesRequired != 1)
    objc_msgSend(a3, "encodeInteger:forKey:", numberOfTouchesRequired, CFSTR("UILongPressGestureRecognizer.numberOfTouchesRequired"));
  minimumPressDuration = self->_minimumPressDuration;
  if (minimumPressDuration != 0.5)
  {
    *(float *)&minimumPressDuration = minimumPressDuration;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("UILongPressGestureRecognizer.minimumPressDuration"), minimumPressDuration);
  }
  allowableMovement = self->_allowableMovement;
  if (allowableMovement != 10.0)
  {
    *(float *)&allowableMovement = allowableMovement;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("UILongPressGestureRecognizer.allowableMovement"), allowableMovement);
  }
}

- (BOOL)cancelPastAllowableMovement
{
  return (*((unsigned __int8 *)self + 432) >> 3) & 1;
}

- (void)setCancelPastAllowableMovement:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 432) = *((_BYTE *)self + 432) & 0xF7 | v3;
}

- (void)_setAllowsDynamicTouchesList:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 432) = *((_BYTE *)self + 432) & 0xEF | v3;
}

- (void)_setAllowableSeparation:(double)a3
{
  -[UITapRecognizer setAllowableSeparation:](self->_imp, "setAllowableSeparation:", a3);
}

- (void)_setAllowableTouchTimeSeparation:(double)a3
{
  -[UITapRecognizer setAllowableTouchTimeSeparation:](self->_imp, "setAllowableTouchTimeSeparation:", a3);
}

- (double)_allowableTouchTimeSeparation
{
  double result;

  -[UITapRecognizer allowableTouchTimeSeparation](self->_imp, "allowableTouchTimeSeparation");
  return result;
}

- (void)_setAllowableElapsedTimeForAllRequiredTouches:(double)a3
{
  self->_allowableElapsedTimeForAllRequiredTouches = fmax(a3, 0.0);
}

- (BOOL)activeTouchesExceedAllowableSeparation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = _BoundingRectForTouches(self->_activeTouches, 0);
  v5 = v4;
  v7 = v6;
  -[UILongPressGestureRecognizer _allowableSeparation](self, "_allowableSeparation", v3);
  v9 = v8;
  -[UILongPressGestureRecognizer _touchSloppinessFactor](self, "_touchSloppinessFactor");
  return v9 * v10 < sqrt(v5 * v5 + v7 * v7);
}

- (void)enoughTimeElapsed:(id)a3
{
  if ((*((_BYTE *)self + 432) & 1) == 0
    && (*((_BYTE *)self + 432) & 2) == 0
    && -[UIGestureRecognizer state](self, "state", a3) == UIGestureRecognizerStatePossible
    && (-[NSMutableSet count](self->_activeTouches, "count") == self->_numberOfTouchesRequired
     || -[UILongPressGestureRecognizer _buttonType](self, "_buttonType") != -1))
  {
    -[UIGestureRecognizer setState:](self, "setState:", 1);
  }
}

- (void)tooMuchElapsed:(id)a3
{
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (BOOL)_touchesMayBeRecognizedByForcePreviewingRevealGestureRecognizerWhichShouldDelayTimer:(id)a3
{
  double v5;
  BOOL v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[UILongPressGestureRecognizer _isGestureType:](self, "_isGestureType:", 15))
    return 0;
  -[UILongPressGestureRecognizer minimumPressDuration](self, "minimumPressDuration");
  if (v5 < 0.15)
    return 0;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "_gestureRecognizers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __117__UILongPressGestureRecognizer__touchesMayBeRecognizedByForcePreviewingRevealGestureRecognizerWhichShouldDelayTimer___block_invoke;
  v14[3] = &unk_1E16C9548;
  v14[4] = &v15;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);
  v6 = *((_BYTE *)v16 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  return v6;
}

uint64_t __117__UILongPressGestureRecognizer__touchesMayBeRecognizedByForcePreviewingRevealGestureRecognizerWhichShouldDelayTimer___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "_isGestureType:", 11);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __60__UILongPressGestureRecognizer__startEnoughTimeElapsedTimer__block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v4;
  char v5;
  int v6;
  int v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "_incorporateTouchForceMessageIntoImpulseQuietness:", a2);
    v5 = objc_msgSend(v8, "_requiresQuietImpulse");
    v4 = v8;
    if ((v5 & 1) != 0 || *((_BYTE *)v8 + 434))
    {
      v6 = objc_msgSend(v8, "_impulseQuietEnough");
      v7 = objc_msgSend(v8[43], "isHolding");
      if (v6)
      {
        v4 = v8;
        if (v7)
        {
          objc_msgSend(v8[43], "resume");
LABEL_9:
          v4 = v8;
        }
      }
      else
      {
        v4 = v8;
        if ((v7 & 1) == 0)
        {
          objc_msgSend(v8[43], "hold");
          goto LABEL_9;
        }
      }
    }
  }

}

- (void)_startTapFinishedTimer
{
  UIDelayedAction *v3;
  UIDelayedAction *v4;
  UIDelayedAction *tooMuchTimeElapsed;

  -[UILongPressGestureRecognizer clearAllTimers](self, "clearAllTimers");
  v3 = [UIDelayedAction alloc];
  -[UITapRecognizer maximumIntervalBetweenSuccessiveTaps](self->_imp, "maximumIntervalBetweenSuccessiveTaps");
  v4 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v3, "initWithTarget:action:userInfo:delay:mode:", self, sel_tooMuchElapsed_, 0, *MEMORY[0x1E0C99860]);
  tooMuchTimeElapsed = self->_tooMuchTimeElapsed;
  self->_tooMuchTimeElapsed = v4;

}

- (void)_changeTouchesListTo:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;

  -[UILongPressGestureRecognizer _centroidScreen](self, "_centroidScreen");
  v6 = v5;
  v8 = v7;
  v9 = _CentroidOfTouches(a3, 1);
  v11 = v10 - v8 + self->_startPointScreen.y;
  self->_startPointScreen.x = self->_startPointScreen.x + v9 - v6;
  self->_startPointScreen.y = v11;
  -[UILongPressGestureRecognizer setTouches:](self, "setTouches:", a3);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  UILongPressGestureRecognizer *v16;
  uint64_t v17;
  double allowableMovement;
  double v20;
  double v21;

  if (-[UILongPressGestureRecognizer _buttonType](self, "_buttonType") != -1)
    return;
  if ((*((_BYTE *)self + 432) & 4) == 0)
  {
    -[UITapRecognizer touchesMoved:withEvent:](self->_imp, "touchesMoved:withEvent:", a3, a4);
    return;
  }
  -[UILongPressGestureRecognizer _locationOfTouches:](self, "_locationOfTouches:", a3);
  v8 = v7;
  v10 = v9;
  objc_msgSend(a4, "timestamp");
  v12 = v11;
  objc_msgSend(a3, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILongPressGestureRecognizer _centroidMovedTo:atTime:physicalTouch:](self, "_centroidMovedTo:atTime:physicalTouch:", v13, v8, v10, v12);

  if ((unint64_t)(self->super._state - 1) <= 2
    && -[NSMutableSet intersectsSet:](self->_activeTouches, "intersectsSet:", a3))
  {
    if ((*((_BYTE *)self + 432) & 8) == 0)
      return;
    -[UILongPressGestureRecognizer _centroidScreen](self, "_centroidScreen");
    if (sqrt((self->_startPointScreen.x - v14) * (self->_startPointScreen.x - v14)+ (self->_startPointScreen.y - v15) * (self->_startPointScreen.y - v15)) <= self->_allowableMovement)return;
    v16 = self;
    v17 = 4;
LABEL_17:
    -[UIGestureRecognizer setState:](v16, "setState:", v17);
    return;
  }
  if (-[NSMutableSet count](self->_activeTouches, "count") == self->_numberOfTouchesRequired)
  {
    allowableMovement = self->_allowableMovement;
    if (allowableMovement >= 0.0 && allowableMovement != 1.79769313e308)
    {
      -[UILongPressGestureRecognizer _centroidScreen](self, "_centroidScreen");
      if (sqrt((self->_startPointScreen.x - v20) * (self->_startPointScreen.x - v20)+ (self->_startPointScreen.y - v21) * (self->_startPointScreen.y - v21)) > self->_allowableMovement)
      {
        -[UILongPressGestureRecognizer clearAllTimers](self, "clearAllTimers");
        v16 = self;
        v17 = 5;
        goto LABEL_17;
      }
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (-[UILongPressGestureRecognizer _buttonType](self, "_buttonType", a3, a4) == -1)
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  if (self)
    self->_requiresQuietImpulseForCurrentTouchSequence = 0;
}

- (BOOL)_impulseQuietEnough
{
  return self->_impulseObservations >= 2 && self->_currentImpulse < 3.33333;
}

- (void)_incorporateTouchForceMessageIntoImpulseQuietness:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __82__UILongPressGestureRecognizer__incorporateTouchForceMessageIntoImpulseQuietness___block_invoke;
  v4[3] = &unk_1E16C9598;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __82__UILongPressGestureRecognizer__incorporateTouchForceMessageIntoImpulseQuietness___block_invoke_2;
  v3[3] = &unk_1E16B1B28;
  objc_msgSend(a3, "ifObservation:ifReset:", v4, v3);
}

uint64_t __82__UILongPressGestureRecognizer__incorporateTouchForceMessageIntoImpulseQuietness___block_invoke(uint64_t a1, void *a2)
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  if ((uint64_t)++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 400) >= 2)
  {
    objc_msgSend(a2, "touchForce");
    v5 = v4 - *(double *)(*(_QWORD *)(a1 + 32) + 416);
    objc_msgSend(a2, "timestamp");
    *(double *)(*(_QWORD *)(a1 + 32) + 408) = fabs(v5 / (v6 - *(double *)(*(_QWORD *)(a1 + 32) + 424)));
  }
  objc_msgSend(a2, "touchForce");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416) = v7;
  result = objc_msgSend(a2, "timestamp");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424) = v9;
  return result;
}

uint64_t __82__UILongPressGestureRecognizer__incorporateTouchForceMessageIntoImpulseQuietness___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetImpulseQuietness");
}

- (int64_t)_finalStateForRecognition
{
  return 3;
}

- (void)_appendSubclassDescription:(id)a3
{
  double v5;
  uint64_t v6;

  if (-[UITapRecognizer numberOfTapsRequired](self->_imp, "numberOfTapsRequired") != 1)
    objc_msgSend(a3, "appendFormat:", CFSTR("; numberOfTapsRequired = %ld"),
      -[UITapRecognizer numberOfTapsRequired](self->_imp, "numberOfTapsRequired"));
  if (-[UITapRecognizer numberOfTouchesRequired](self->_imp, "numberOfTouchesRequired") != 1)
    objc_msgSend(a3, "appendFormat:", CFSTR("; numberOfTouchesRequired = %ld"),
      -[UITapRecognizer numberOfTouchesRequired](self->_imp, "numberOfTouchesRequired"));
  -[UILongPressGestureRecognizer minimumPressDuration](self, "minimumPressDuration");
  if (v5 > 0.0)
  {
    -[UILongPressGestureRecognizer minimumPressDuration](self, "minimumPressDuration");
    objc_msgSend(a3, "appendFormat:", CFSTR("; minimumPressDuration = %2g"), v6);
  }
  if (-[UITapRecognizer buttonMaskRequired](self->_imp, "buttonMaskRequired") != 1)
    objc_msgSend(a3, "appendFormat:", CFSTR("; buttonMaskRequired = %ld"),
      -[UITapRecognizer buttonMaskRequired](self->_imp, "buttonMaskRequired"));
}

- (CGPoint)_centroidInView:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  if (a3)
  {
    objc_msgSend(a3, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILongPressGestureRecognizer _centroidScreen](self, "_centroidScreen");
    objc_msgSend(v5, "_convertPointFromSceneReferenceSpace:");
    v7 = v6;
    v9 = v8;

    objc_msgSend(a3, "convertPoint:fromView:", 0, v7, v9);
  }
  else
  {
    -[UILongPressGestureRecognizer _centroidScreen](self, "_centroidScreen");
  }
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)centroid
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[UIGestureRecognizer view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILongPressGestureRecognizer _centroidInView:](self, "_centroidInView:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)_startPointInView:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  objc_msgSend(a3, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_convertPointFromSceneReferenceSpace:", self->_startPointScreen.x, self->_startPointScreen.y);
  v7 = v6;
  v9 = v8;

  objc_msgSend(a3, "convertPoint:fromView:", 0, v7, v9);
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)startPoint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[UIGestureRecognizer view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILongPressGestureRecognizer _startPointInView:](self, "_startPointInView:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)_translationInView:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[UILongPressGestureRecognizer _centroidInView:](self, "_centroidInView:");
  v6 = v5;
  v8 = v7;
  -[UILongPressGestureRecognizer _startPointInView:](self, "_startPointInView:", a3);
  v10 = v6 - v9;
  v12 = v8 - v11;
  result.y = v12;
  result.x = v10;
  return result;
}

- (void)_setTranslation:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;

  y = a3.y;
  x = a3.x;
  -[UILongPressGestureRecognizer _centroidInView:](self, "_centroidInView:");
  v9 = x + v8;
  v11 = y + v10;
  objc_msgSend(a4, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a4, "convertPoint:toView:", v12, v9, v11);
  v14 = v13;
  v16 = v15;

  objc_msgSend(a4, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_convertPointToSceneReferenceSpace:", v14, v16);
  v19 = v18;
  v21 = v20;

  self->_startPointScreen.x = v19;
  self->_startPointScreen.y = v21;
}

- (void)_setButtonType:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[UILongPressGestureRecognizer _buttonType](self, "_buttonType") != a3)
  {
    -[UIGestureRecognizer view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UILongPressGestureRecognizer.m"), 768, CFSTR("_buttonType can't be changed after a gesture recognizer is added to a view"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureRecognizer setAllowedPressTypes:](self, "setAllowedPressTypes:", v8);

  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  if (-[UILongPressGestureRecognizer _shouldFailInResponseToPresses:withEvent:](self, "_shouldFailInResponseToPresses:withEvent:"))
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
  else if ((*((_BYTE *)self + 432) & 4) != 0)
  {
    if (self->_tooMuchTimeElapsed)
      -[UILongPressGestureRecognizer clearAllTimers](self, "clearAllTimers");
    if ((*((_BYTE *)self + 432) & 1) == 0)
      -[UILongPressGestureRecognizer clearAllTimersAndStartEnoughTimeElapsedTimer](self, "clearAllTimersAndStartEnoughTimeElapsedTimer");
  }
  else
  {
    -[UITapRecognizer pressesBegan:withEvent:](self->_imp, "pressesBegan:withEvent:", a3, a4);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  if ((*((_BYTE *)self + 432) & 4) != 0)
    -[UILongPressGestureRecognizer _interactionsEndedWithValidTouches:](self, "_interactionsEndedWithValidTouches:", 1, a4);
  else
    -[UITapRecognizer pressesEnded:withEvent:](self->_imp, "pressesEnded:withEvent:", a3, a4);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 5, a4);
}

- (BOOL)_shouldReceivePress:(id)a3
{
  BOOL v5;
  int64_t v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UILongPressGestureRecognizer;
  if (-[UIGestureRecognizer _shouldReceivePress:](&v10, sel__shouldReceivePress_))
  {
    v5 = 1;
  }
  else
  {
    v6 = -[UILongPressGestureRecognizer _buttonType](self, "_buttonType");
    v5 = v6 == objc_msgSend(a3, "type");
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UILongPressGestureRecognizer _shouldFailInResponseToPresses:withEvent:](self, "_shouldFailInResponseToPresses:withEvent:", v7, 0);

  return v5 || v8;
}

- (BOOL)_shouldFailInResponseToPresses:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)tapIsPossibleForTapRecognizer:(id)a3
{
  return -[UIGestureRecognizer state](self, "state", a3) == UIGestureRecognizerStatePossible;
}

- (void)tapRecognizerRecognizedTap:(id)a3
{
  *((_BYTE *)self + 432) |= 4u;
  -[UILongPressGestureRecognizer _startTapFinishedTimer](self, "_startTapFinishedTimer", a3);
  -[UITapRecognizer _reset](self->_imp, "_reset");
}

- (void)tapRecognizerFailedToRecognizeTap:(id)a3
{
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (double)_touchSloppinessFactor
{
  void *v2;
  double v3;
  double v4;

  -[UIGestureRecognizer view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_touchSloppinessFactor");
  v4 = v3;

  return v4;
}

- (CGPoint)locationInView:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  if (-[NSArray count](self->_touches, "count"))
  {
    -[UILongPressGestureRecognizer _centroidInView:](self, "_centroidInView:", a3);
  }
  else
  {
    -[UITapRecognizer locationInViewNotTrackingTouches:](self->_imp, "locationInViewNotTrackingTouches:", a3);
    v7 = v5;
    v8 = v6;
    if (a3)
    {
      objc_msgSend(a3, "_window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_convertPointFromSceneReferenceSpace:", v7, v8);
      objc_msgSend(a3, "convertPoint:fromView:", 0);
      v11 = v10;
      v13 = v12;

      v5 = v11;
      v6 = v13;
    }
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (unint64_t)numberOfTouches
{
  return -[NSArray count](self->_touches, "count");
}

- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  CGPoint result;

  if (-[NSArray count](self->_touches, "count") <= a3)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("-[%@ %@]"), v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%@: index (%ld) beyond bounds (%ld)."), v8, a3, -[NSArray count](self->_touches, "count"));
    v10 = *MEMORY[0x1E0C9D538];
    v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[NSArray objectAtIndex:](self->_touches, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInView:", a4);
    v10 = v9;
    v12 = v11;
  }

  v17 = v10;
  v18 = v12;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGPoint)_convertVelocitySample:(id)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  double v5;
  double v6;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  if (a3 && *((double *)a3 + 5) >= 0.001)
  {
    -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a4, *((double *)a3 + 1), *((double *)a3 + 2));
    v10 = v9;
    v12 = v11;
    -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a4, *((double *)a3 + 3), *((double *)a3 + 4));
    v14 = *((double *)a3 + 5);
    v5 = (v13 - v10) / v14;
    v6 = (v15 - v12) / v14;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D538];
    v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  UILongPressGestureVelocitySample *previousVelocitySample;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[UILongPressGestureRecognizer _convertVelocitySample:fromSceneReferenceCoordinatesToView:](self, "_convertVelocitySample:fromSceneReferenceCoordinatesToView:", self->_velocitySample, a3);
  v5 = v4;
  v7 = v6;
  previousVelocitySample = self->_previousVelocitySample;
  if (previousVelocitySample && previousVelocitySample->dt > 0.00000011920929)
  {
    -[UILongPressGestureRecognizer _convertVelocitySample:fromSceneReferenceCoordinatesToView:](self, "_convertVelocitySample:fromSceneReferenceCoordinatesToView:");
    v5 = v5 * 0.25 + v9 * 0.75;
    v7 = v7 * 0.25 + v10 * 0.75;
  }
  v11 = v5;
  v12 = v7;
  result.y = v12;
  result.x = v11;
  return result;
}

- (UIOffset)_offsetInViewFromSceneReferenceLocation:(CGPoint)a3 toSceneReferenceLocation:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIOffset result;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[UIGestureRecognizer view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v9, v7, v6);
  v11 = v10;
  v13 = v12;

  -[UIGestureRecognizer view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v14, x, y);
  v16 = v15;
  v18 = v17;

  v19 = v16 - v11;
  v20 = v18 - v13;
  result.vertical = v20;
  result.horizontal = v19;
  return result;
}

- (CGPoint)_shiftPanLocationToNewSceneReferenceLocation:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  -[UILongPressGestureRecognizer _offsetInViewFromSceneReferenceLocation:toSceneReferenceLocation:](self, "_offsetInViewFromSceneReferenceLocation:toSceneReferenceLocation:", self->_lastUnadjustedSceneReferenceLocation.x, self->_lastUnadjustedSceneReferenceLocation.y, a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  -[UIGestureRecognizer view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v8, self->_lastSceneReferenceLocation.x, self->_lastSceneReferenceLocation.y);
  v10 = v9;
  v12 = v11;

  -[UIGestureRecognizer view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](self, "_convertPoint:toSceneReferenceCoordinatesFromView:", v13, v5 + v10, v7 + v12);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;

  if (objc_msgSend(a3, "_isGestureType:", 1))
  {
    v5 = a3;
    v6 = objc_msgSend(v5, "numberOfTouchesRequired");
    if (v6 == -[UILongPressGestureRecognizer numberOfTouchesRequired](self, "numberOfTouchesRequired")
      && (v7 = objc_msgSend(v5, "buttonMaskRequired"),
          v7 == -[UILongPressGestureRecognizer buttonMaskRequired](self, "buttonMaskRequired")))
    {
      v8 = objc_msgSend(v5, "numberOfTapsRequired");
      v9 = v8 > -[UILongPressGestureRecognizer numberOfTapsRequired](self, "numberOfTapsRequired");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  return !v9;
}

- (CGFloat)allowableMovement
{
  return self->_allowableMovement;
}

- (BOOL)_requiresQuietImpulse
{
  return self->_requiresQuietImpulse;
}

- (double)_allowableElapsedTimeForAllRequiredTouches
{
  return self->_allowableElapsedTimeForAllRequiredTouches;
}

- (CGPoint)lastSceneReferenceLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastSceneReferenceLocation.x;
  y = self->_lastSceneReferenceLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastSceneReferenceLocation:(CGPoint)a3
{
  self->_lastSceneReferenceLocation = a3;
}

- (CGPoint)lastUnadjustedSceneReferenceLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastUnadjustedSceneReferenceLocation.x;
  y = self->_lastUnadjustedSceneReferenceLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastUnadjustedSceneReferenceLocation:(CGPoint)a3
{
  self->_lastUnadjustedSceneReferenceLocation = a3;
}

- (double)lastTouchTime
{
  return self->_lastTouchTime;
}

- (void)setLastTouchTime:(double)a3
{
  self->_lastTouchTime = a3;
}

- (BOOL)_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers
{
  return self->__prefersToBeExclusiveWithCompetingLongPressGestureRecognizers;
}

- (BOOL)_shouldAlwaysEnableMultitouchTimerAtTouchesBegin
{
  return self->__shouldAlwaysEnableMultitouchTimerAtTouchesBegin;
}

- (void)_setShouldAlwaysEnableMultitouchTimerAtTouchesBegin:(BOOL)a3
{
  self->__shouldAlwaysEnableMultitouchTimerAtTouchesBegin = a3;
}

@end
