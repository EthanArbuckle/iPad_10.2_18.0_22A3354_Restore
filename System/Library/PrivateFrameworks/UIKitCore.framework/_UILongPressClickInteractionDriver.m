@implementation _UILongPressClickInteractionDriver

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[_UILongPressClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
    goto LABEL_2;
  objc_msgSend(v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    objc_msgSend(v6, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
      v9 = 1;
    else
      v9 = objc_msgSend(v13, "isDescendantOfView:", v14);

    goto LABEL_10;
  }
  if (self->_delegateImplements.shouldDelayGesture)
  {
    -[_UILongPressClickInteractionDriver delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v13, "clickDriver:shouldDelayGestureRecognizer:", self, v7);
LABEL_10:

    goto LABEL_11;
  }
LABEL_2:
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  char v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[_UILongPressClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v7)
  {
LABEL_2:
    v9 = 0;
    goto LABEL_3;
  }
  v11 = objc_msgSend(v6, "_isGestureType:", 2);
  v9 = 1;
  if ((objc_msgSend(v6, "_isGestureType:", 4) & 1) == 0 && (v11 & 1) == 0)
  {
    if (self->_delegateImplements.shouldBeDelayedByGesture)
    {
      -[_UILongPressClickInteractionDriver delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "clickDriver:shouldBeDelayedByGestureRecognizer:", self, v6);

      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:

  return v9;
}

- (_UITouchDurationObservingGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (_UIClickInteractionDriverDelegate)delegate
{
  return (_UIClickInteractionDriverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t behavior;
  int v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  behavior = self->_behavior;
  if (behavior == 2)
  {
    LOBYTE(v10) = objc_msgSend(v7, "_originatesFromPointerEvent");
  }
  else if (behavior == 1)
  {
    v10 = objc_msgSend(v7, "_originatesFromPointerEvent") ^ 1;
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  handleEvent(stateMachineSpec_0, self->_currentState, 3, (uint64_t)self, (uint64_t *)&self->_currentState);
}

- (void)setView:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    -[_UILongPressClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeGestureRecognizer:", v6);

    v8 = objc_storeWeak((id *)&self->_view, obj);
    if (obj)
    {
      self->_currentState = 1;
      v9 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v9, "addGestureRecognizer:", v6);

    }
    v5 = obj;
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateImplements.didUpdateHighlightProgress = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldDelayGesture = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldBeDelayedByGesture = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setAllowableMovement:(double)a3
{
  id v4;

  -[_UILongPressClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowableMovement:", a3);

}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (_UILongPressClickInteractionDriver)init
{
  _UILongPressClickInteractionDriver *v2;
  _UITouchDurationObservingGestureRecognizer *v3;
  int v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UILongPressClickInteractionDriver;
  v2 = -[_UILongPressClickInteractionDriver init](&v7, sel_init);
  if (v2)
  {
    v3 = -[_UITouchDurationObservingGestureRecognizer initWithTarget:action:]([_UITouchDurationObservingGestureRecognizer alloc], "initWithTarget:action:", v2, sel__handleGestureRecognizer_);
    -[UIGestureRecognizer setAllowedTouchTypes:](v3, "setAllowedTouchTypes:", &unk_1E1A930E0);
    -[UIGestureRecognizer setName:](v3, "setName:", CFSTR("com.apple.UIKit.longPressClickDriverPrimary"));
    v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_LongPressClickInteractionDriverClickMinimumTouchDuration, (uint64_t)CFSTR("LongPressClickInteractionDriverClickMinimumTouchDuration"));
    v5 = *(double *)&qword_1ECD75FA0;
    if (v4)
      v5 = 0.15;
    -[_UITouchDurationObservingGestureRecognizer setMinimumDurationRequired:](v3, "setMinimumDurationRequired:", v5);
    -[UIGestureRecognizer setCancelsTouchesInView:](v3, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelegate:](v3, "setDelegate:", v2);
    -[_UILongPressClickInteractionDriver setGestureRecognizer:](v2, "setGestureRecognizer:", v3);
    -[_UILongPressClickInteractionDriver setCancelsTouchesInView:](v2, "setCancelsTouchesInView:", 1);

  }
  return v2;
}

- (void)setCancelsTouchesInView:(BOOL)a3
{
  self->_cancelsTouchesInView = a3;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (void)setBehavior:(unint64_t)a3
{
  self->_behavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

- (double)allowableMovement
{
  void *v2;
  double v3;
  double v4;

  -[_UILongPressClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allowableMovement");
  v4 = v3;

  return v4;
}

- (BOOL)clicksUpAutomaticallyAfterTimeout
{
  return 0;
}

- (NSString)description
{
  unint64_t v3;
  __CFString *v4;

  v3 = -[_UILongPressClickInteractionDriver behavior](self, "behavior");
  if (v3 > 2)
    v4 = 0;
  else
    v4 = off_1E16C01F8[v3];
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; behavior = %@>"),
                       objc_opt_class(),
                       self,
                       v4);
}

+ (BOOL)requiresForceCapability
{
  return 0;
}

+ (BOOL)prefersCancelsTouchesInView
{
  return 1;
}

- (double)maximumEffectProgress
{
  double v3;
  double v4;
  double v5;

  -[_UILongPressClickInteractionDriver clickTimeoutDuration](self, "clickTimeoutDuration");
  v4 = v3;
  -[_UILongPressClickInteractionDriver clickDownDuration](self, "clickDownDuration");
  return v4 / v5;
}

- (double)touchDuration
{
  void *v2;
  double v3;
  double v4;

  -[_UILongPressClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "touchDuration");
  v4 = v3;

  return v4;
}

- (BOOL)hasExceededAllowableMovement
{
  void *v2;
  char v3;

  -[_UILongPressClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasExceededAllowableMovement");

  return v3;
}

- (void)cancelInteraction
{
  void *v3;
  id v4;

  -[_UILongPressClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[_UILongPressClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
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

  v4 = a3;
  -[_UILongPressClickInteractionDriver view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UILongPressClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v5);
    v8 = v7;
    v10 = v9;

    objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v4, v8, v10);
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D538];
    v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (unint64_t)inputPrecision
{
  _QWORD *v2;
  unint64_t v3;

  -[_UILongPressClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[23];
  else
    v3 = 0;

  return v3;
}

- (BOOL)allowsFeedback
{
  return 1;
}

- (double)clickDownDuration
{
  int v3;
  int v4;
  double result;
  BOOL v6;
  double v7;
  int v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;

  v3 = _AXSForceTouchTimeDuration();
  if (v3 == 2)
  {
    v8 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD75FE8, (uint64_t)CFSTR("LongPressClickInteractionDriverClickDownDurationShortAX"));
    result = *(double *)&qword_1ECD75FF0;
    v6 = v8 == 0;
    v7 = 0.3;
  }
  else if (v3)
  {
    if (!self)
      goto LABEL_11;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v10 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "traitCollection");
    else
      +[UIDevice currentDevice](UIDevice, "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == 1)
    {
      v13 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD75FB8, (uint64_t)CFSTR("LongPressClickInteractionDriverClickDownDurationPad"));
      result = *(double *)&qword_1ECD75FC0;
      v6 = v13 == 0;
      v7 = 0.325;
    }
    else
    {
LABEL_11:
      v14 = _UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_903, (uint64_t)CFSTR("LongPressClickInteractionDriverClickDownDuration"));
      result = *(double *)&qword_1ECD75FB0;
      v6 = v14 == 0;
      v7 = 0.4;
    }
  }
  else
  {
    v4 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD75FD8, (uint64_t)CFSTR("LongPressClickInteractionDriverClickDownDurationAX"));
    result = *(double *)&qword_1ECD75FE0;
    v6 = v4 == 0;
    v7 = 0.5;
  }
  if (!v6)
    return v7;
  return result;
}

- (double)clickTimeoutDuration
{
  int v2;
  double result;
  int v4;
  BOOL v5;
  double v6;
  int v7;
  int v8;

  v2 = _AXSForceTouchTimeDuration();
  if (v2)
  {
    if (v2 == 1)
    {
      v8 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD75FC8, (uint64_t)CFSTR("LongPressClickInteractionDriverClickTimeoutDuration"));
      result = *(double *)&qword_1ECD75FD0;
      v5 = v8 == 0;
      v6 = 0.725;
    }
    else
    {
      if (v2 != 2)
        return result;
      v4 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76008, (uint64_t)CFSTR("LongPressClickInteractionDriverClickTimeoutDurationShortAX"));
      result = *(double *)&qword_1ECD76010;
      v5 = v4 == 0;
      v6 = 0.3;
    }
  }
  else
  {
    v7 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD75FF8, (uint64_t)CFSTR("LongPressClickInteractionDriverClickTimeoutDurationAX"));
    result = *(double *)&qword_1ECD76000;
    v5 = v7 == 0;
    v6 = 1.1;
  }
  if (!v5)
    return v6;
  return result;
}

- (void)_handleGestureRecognizer:(id)a3
{
  id v4;
  unint64_t currentState;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  currentState = self->_currentState;
  -[_UILongPressClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "state");

  if ((unint64_t)(v7 - 4) >= 2)
  {
    if (v7 == 1)
    {
      objc_initWeak(&location, self);
      -[_UILongPressClickInteractionDriver delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __63___UILongPressClickInteractionDriver__handleGestureRecognizer___block_invoke;
      v9[3] = &unk_1E16C01D8;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v8, "clickDriver:shouldBegin:", self, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
      goto LABEL_9;
    }
    if (v7 != 3)
    {
      -[_UILongPressClickInteractionDriver _updateForActiveGestureRecognizer](self, "_updateForActiveGestureRecognizer");
      goto LABEL_9;
    }
    if (currentState == 3)
      handleEvent(stateMachineSpec_0, self->_currentState, 2, (uint64_t)self, (uint64_t *)&self->_currentState);
  }
  handleEvent(stateMachineSpec_0, self->_currentState, 3, (uint64_t)self, (uint64_t *)&self->_currentState);
LABEL_9:

}

- (void)_asyncGestureBegan
{
  -[_UILongPressClickInteractionDriver setReachedClickDownThreshold:](self, "setReachedClickDownThreshold:", 0);
  -[_UILongPressClickInteractionDriver setForceMultiplier:](self, "setForceMultiplier:", 1.0);
  handleEvent(stateMachineSpec_0, self->_currentState, 0, (uint64_t)self, (uint64_t *)&self->_currentState);
  -[_UILongPressClickInteractionDriver _updateForActiveGestureRecognizer](self, "_updateForActiveGestureRecognizer");
}

- (void)_updateForActiveGestureRecognizer
{
  void *v3;
  void *v4;
  unint64_t currentState;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  int v16;
  int v17;
  double v18;
  _BOOL8 v19;
  int v20;
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
  _BOOL4 v32;
  _BOOL4 v33;
  void *v34;

  -[_UILongPressClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  currentState = self->_currentState;
  if (currentState == 1)
    goto LABEL_26;
  v34 = v3;
  v6 = objc_msgSend(v3, "state");
  v4 = v34;
  if (v6 != 2)
    goto LABEL_26;
  objc_msgSend(v34, "touchDuration");
  v8 = v7;
  objc_msgSend(v34, "touchForce");
  v10 = v9;
  objc_msgSend(v34, "_allActiveTouches");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_isPointerTouch");

  if (!v13)
  {
    v17 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76058, (uint64_t)CFSTR("ClickAutoTriggerForceThreshold"));
    v18 = *(double *)&qword_1ECD76060;
    if (v17)
      v18 = 4.0;
    if (v10 >= v18)
    {
      v20 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76068, (uint64_t)CFSTR("ClickAutoTriggerMinPressDuration"));
      v21 = *(double *)&qword_1ECD76070;
      if (v20)
        v21 = 0.05;
      v19 = v8 >= v21;
    }
    else
    {
      v19 = 0;
    }
    -[_UILongPressClickInteractionDriver setReachedClickDownThreshold:](self, "setReachedClickDownThreshold:", v19);
    -[_UILongPressClickInteractionDriver forceMultiplier](self, "forceMultiplier");
    v15 = v22;
    v16 = 0;
    goto LABEL_14;
  }
  -[_UILongPressClickInteractionDriver setReachedClickDownThreshold:](self, "setReachedClickDownThreshold:", 0);
  if (_os_feature_enabled_impl())
  {
    -[_UILongPressClickInteractionDriver forceMultiplier](self, "forceMultiplier");
    v15 = v14;
    v16 = 1;
LABEL_14:
    _forceMultiplierFromForce(v16);
    if (v15 >= v23)
      v23 = v15;
    -[_UILongPressClickInteractionDriver setForceMultiplier:](self, "setForceMultiplier:", v23);
  }
  -[_UILongPressClickInteractionDriver clickDownDuration](self, "clickDownDuration");
  v25 = v24;
  -[_UILongPressClickInteractionDriver forceMultiplier](self, "forceMultiplier");
  v27 = v8 / (v25 / v26);
  -[_UILongPressClickInteractionDriver _notifyDelegateOfUpdatedClickDownProgress:forceAdjustedClickDownDuration:](self, "_notifyDelegateOfUpdatedClickDownProgress:forceAdjustedClickDownDuration:", v27);
  -[_UILongPressClickInteractionDriver clickTimeoutDuration](self, "clickTimeoutDuration");
  v29 = v28;
  -[_UILongPressClickInteractionDriver forceMultiplier](self, "forceMultiplier");
  v31 = v30;
  v32 = -[_UILongPressClickInteractionDriver clicksUpAutomaticallyAfterTimeout](self, "clicksUpAutomaticallyAfterTimeout");
  if (currentState == 3 && v32 && v8 > v29 / v31)
  {
    handleEvent(stateMachineSpec_0, self->_currentState, 2, (uint64_t)self, (uint64_t *)&self->_currentState);
    -[_UILongPressClickInteractionDriver _updateTimeoutDebugUI:](self, "_updateTimeoutDebugUI:", v8);
LABEL_25:
    v4 = v34;
    goto LABEL_26;
  }
  v4 = v34;
  if (currentState <= 2)
  {
    if (v27 >= 1.0
      || (v33 = -[_UILongPressClickInteractionDriver reachedClickDownThreshold](self, "reachedClickDownThreshold"),
          v4 = v34,
          v33))
    {
      handleEvent(stateMachineSpec_0, self->_currentState, 1, (uint64_t)self, (uint64_t *)&self->_currentState);
      goto LABEL_25;
    }
  }
LABEL_26:

}

- (void)_notifyDelegateOfUpdatedClickDownProgress:(double)a3 forceAdjustedClickDownDuration:(double)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  if (self->_delegateImplements.didUpdateHighlightProgress)
  {
    if (-[_UILongPressClickInteractionDriver clicksUpAutomaticallyAfterTimeout](self, "clicksUpAutomaticallyAfterTimeout"))
    {
      -[_UILongPressClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "minimumDurationRequired");
      v9 = v8;

      v10 = a3 + -1.0;
      v11 = fmax(fmin((a3 - v9 / a4) / (1.0 - v9 / a4), 1.0), 0.0);
      if (a3 + -1.0 < 0.0)
        v10 = 0.0;
      v12 = v10 + v11;
    }
    else
    {
      v12 = fmax(fmin(a3 / (pow(1.0 - a3, 3.4000001) + a3), 1.0), 0.0);
    }
    -[_UILongPressClickInteractionDriver delegate](self, "delegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clickDriver:didUpdateHighlightProgress:", self, v12);

  }
}

- (BOOL)_gestureRecognizer:(id)a3 canCancelGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_updateTimeoutDebugUI:(double)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showMenuPressDuration");

  if (v6)
  {
    if (!_updateTimeoutDebugUI____triggerTime)
    {
      v7 = objc_opt_new();
      v8 = (void *)_updateTimeoutDebugUI____triggerTime;
      _updateTimeoutDebugUI____triggerTime = v7;

      objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "setTextAlignment:", 1);
      +[UIColor redColor](UIColor, "redColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "setBackgroundColor:", v9);

      objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "setCenter:", 20.0, 50.0);
      objc_msgSend(off_1E167A828, "monospacedDigitSystemFontOfSize:weight:", 40.0, *(double *)off_1E167DC68);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "setFont:", v10);

      objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCornerRadius:", 13.0);

      v12 = *MEMORY[0x1E0CD2A68];
      objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCornerCurve:", v12);

      +[UIColor whiteColor](UIColor, "whiteColor");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = objc_msgSend(v14, "CGColor");
      objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBorderColor:", v15);

      objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBorderWidth:", 2.0);

      objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "setClipsToBounds:", 1);
      -[_UILongPressClickInteractionDriver view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSubview:", _updateTimeoutDebugUI____triggerTime);

    }
    v20 = &unk_186678000;
    LODWORD(v20) = llround(a3 * 1000.0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ims"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "setText:", v21);

    objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "sizeToFit");
    objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "bounds");
    objc_msgSend((id)_updateTimeoutDebugUI____triggerTime, "setBounds:");
  }
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (BOOL)cancelsTouchesInView
{
  return self->_cancelsTouchesInView;
}

- (void)setClickDownDuration:(double)a3
{
  self->_clickDownDuration = a3;
}

- (double)forceMultiplier
{
  return self->_forceMultiplier;
}

- (void)setForceMultiplier:(double)a3
{
  self->_forceMultiplier = a3;
}

- (BOOL)reachedClickDownThreshold
{
  return self->_reachedClickDownThreshold;
}

- (void)setReachedClickDownThreshold:(BOOL)a3
{
  self->_reachedClickDownThreshold = a3;
}

@end
