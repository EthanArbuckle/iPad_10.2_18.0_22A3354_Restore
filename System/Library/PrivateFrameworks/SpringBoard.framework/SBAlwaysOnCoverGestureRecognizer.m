@implementation SBAlwaysOnCoverGestureRecognizer

- (SBAlwaysOnCoverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  SBAlwaysOnCoverGestureRecognizer *v7;
  SBAlwaysOnCoverGestureRecognizer *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBAlwaysOnCoverGestureRecognizer;
  v7 = -[SBAlwaysOnCoverGestureRecognizer init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    v8->_maximumCoverDuration = 10.0;
    v8->_minimumScreenCoverage = 0.0;
    v8->_action = a4;
    v8->_state = 0;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[BSContinuousMachTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBAlwaysOnCoverGestureRecognizer;
  -[SBAlwaysOnCoverGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (void)processHIDEvent:(__IOHIDEvent *)a3
{
  char Phase;
  char v6;
  float v7;
  float minimumScreenCoverage;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (IOHIDEventGetType() != 1
    || IOHIDEventGetIntegerValue() != 65280
    || IOHIDEventGetIntegerValue() != 89)
  {
    return;
  }
  Phase = IOHIDEventGetPhase();
  v6 = Phase;
  if ((Phase & 1) != 0)
  {
    v7 = 1.0;
    if ((unint64_t)IOHIDEventGetIntegerValue() >= 4)
      v7 = *(float *)IOHIDEventGetDataValue();
    minimumScreenCoverage = self->_minimumScreenCoverage;
    SBLogCoverGesture();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7 >= minimumScreenCoverage)
    {
      if (v10)
      {
        v13 = 134217984;
        v14 = v7;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Cover gesture began with coverage %f", (uint8_t *)&v13, 0xCu);
      }

      -[SBAlwaysOnCoverGestureRecognizer _gestureBeganWithEvent:](self, "_gestureBeganWithEvent:", a3);
      if ((v6 & 4) != 0)
        goto LABEL_18;
    }
    else
    {
      if (v10)
      {
        v13 = 134217984;
        v14 = v7;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Cover gesture rejected. Coverage %f below threshold.", (uint8_t *)&v13, 0xCu);
      }

      if ((v6 & 4) != 0)
        goto LABEL_18;
    }
LABEL_6:
    if ((v6 & 8) == 0)
      return;
    goto LABEL_21;
  }
  if ((Phase & 4) == 0)
    goto LABEL_6;
LABEL_18:
  SBLogCoverGesture();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Cover gesture ended.", (uint8_t *)&v13, 2u);
  }

  -[SBAlwaysOnCoverGestureRecognizer _gestureEndedWithEvent:](self, "_gestureEndedWithEvent:", a3);
  if ((v6 & 8) != 0)
  {
LABEL_21:
    SBLogCoverGesture();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Cover gesture canceled.", (uint8_t *)&v13, 2u);
    }

    -[SBAlwaysOnCoverGestureRecognizer _gestureCanceledWithEvent:](self, "_gestureCanceledWithEvent:", a3);
  }
}

- (void)_gestureBeganWithEvent:(__IOHIDEvent *)a3
{
  double v4;
  double v5;
  id v6;
  objc_class *v7;
  void *v8;
  BSContinuousMachTimer *v9;
  BSContinuousMachTimer *timer;
  BSContinuousMachTimer *v11;
  SBAlwaysOnCoverGestureRecognizer *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[8];
  _QWORD v16[5];

  IOHIDEventGetTimeStampOfType();
  mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  v5 = self->_maximumCoverDuration - v4;
  if (v5 <= 0.0)
  {
    SBLogCoverGesture();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Cover gesture failed because event too old.", v15, 2u);
    }

    v12 = self;
    v13 = 3;
  }
  else
  {
    -[BSContinuousMachTimer invalidate](self->_timer, "invalidate");
    v6 = objc_alloc(MEMORY[0x1E0D01720]);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (BSContinuousMachTimer *)objc_msgSend(v6, "initWithIdentifier:", v8);
    timer = self->_timer;
    self->_timer = v9;

    v11 = self->_timer;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__SBAlwaysOnCoverGestureRecognizer__gestureBeganWithEvent___block_invoke;
    v16[3] = &unk_1E8EA20A8;
    v16[4] = self;
    -[BSContinuousMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v11, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v16, v5, 0.1);
    v12 = self;
    v13 = 1;
  }
  -[SBAlwaysOnCoverGestureRecognizer _setState:](v12, "_setState:", v13);
}

uint64_t __59__SBAlwaysOnCoverGestureRecognizer__gestureBeganWithEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SBLogCoverGesture();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Cover gesture timed out.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_setState:", 3);
}

- (void)_gestureEndedWithEvent:(__IOHIDEvent *)a3
{
  -[SBAlwaysOnCoverGestureRecognizer _setState:](self, "_setState:", 2);
}

- (void)_gestureCanceledWithEvent:(__IOHIDEvent *)a3
{
  -[SBAlwaysOnCoverGestureRecognizer _setState:](self, "_setState:", 3);
}

- (void)_setState:(int64_t)a3
{
  BSContinuousMachTimer *v4;
  void *v5;
  SEL action;
  id WeakRetained;
  void *v8;
  BSContinuousMachTimer *timer;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    self->_state = a3;
    if (a3 == 3)
    {
      -[BSContinuousMachTimer invalidate](self->_timer, "invalidate");
      timer = self->_timer;
      self->_timer = 0;

    }
    else if (a3 == 2)
    {
      -[BSContinuousMachTimer invalidate](self->_timer, "invalidate");
      v4 = self->_timer;
      self->_timer = 0;

      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      action = self->_action;
      WeakRetained = objc_loadWeakRetained(&self->_target);
      v10[0] = *MEMORY[0x1E0C99860];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "performSelector:target:argument:order:modes:", action, WeakRetained, self, 0, v8);

    }
    if ((self->_state & 0xFFFFFFFFFFFFFFFELL) == 2)
      self->_state = 0;
  }
}

- (double)maximumCoverDuration
{
  return self->_maximumCoverDuration;
}

- (void)setMaximumCoverDuration:(double)a3
{
  self->_maximumCoverDuration = a3;
}

- (float)minimumScreenCoverage
{
  return self->_minimumScreenCoverage;
}

- (void)setMinimumScreenCoverage:(float)a3
{
  self->_minimumScreenCoverage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak(&self->_target);
}

@end
