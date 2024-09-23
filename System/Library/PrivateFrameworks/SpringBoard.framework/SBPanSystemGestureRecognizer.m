@implementation SBPanSystemGestureRecognizer

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPanSystemGestureRecognizer;
  -[SBPanSystemGestureRecognizer reset](&v3, sel_reset);
  -[SBPanSystemGestureRecognizer invalidateNoHysterisisCancellationTimer](self, "invalidateNoHysterisisCancellationTimer");
  self->_initialTouchReceived = 0;
}

- (void)invalidateNoHysterisisCancellationTimer
{
  NSTimer *noHysterisisCancellationTimer;
  NSTimer *v4;

  noHysterisisCancellationTimer = self->_noHysterisisCancellationTimer;
  if (noHysterisisCancellationTimer)
  {
    -[NSTimer invalidate](noHysterisisCancellationTimer, "invalidate");
    v4 = self->_noHysterisisCancellationTimer;
    self->_noHysterisisCancellationTimer = 0;

  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBPanSystemGestureRecognizer;
  -[SBPanSystemGestureRecognizer touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, v6, a4);
  if (!self->_initialTouchReceived)
  {
    self->_initialTouchReceived = 1;
    BSContinuousMachTimeNow();
    self->_initialTouchReceivedTime = v7;
    -[SBPanSystemGestureRecognizer setupNoHysterisisCancellationTimerIfNeeded](self, "setupNoHysterisisCancellationTimerIfNeeded");
    -[SBPanSystemGestureRecognizer delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "panSystemGestureRecognizer:didReceiveInitialTouch:", self, v9);

    }
  }

}

- (void)setupNoHysterisisCancellationTimerIfNeeded
{
  void *v3;
  double v4;
  double v5;
  NSTimer *v6;
  NSTimer *noHysterisisCancellationTimer;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  if (-[SBPanSystemGestureRecognizer failsPastMaximumPressDurationWithoutHysteresis](self, "failsPastMaximumPressDurationWithoutHysteresis"))
  {
    -[SBPanSystemGestureRecognizer invalidateNoHysterisisCancellationTimer](self, "invalidateNoHysterisisCancellationTimer");
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0C99E88];
    -[SBPanSystemGestureRecognizer maximumPressDuration](self, "maximumPressDuration");
    v5 = v4;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__SBPanSystemGestureRecognizer_setupNoHysterisisCancellationTimerIfNeeded__block_invoke;
    v9[3] = &unk_1E8EA3218;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    objc_msgSend(v3, "timerWithTimeInterval:repeats:block:", 0, v9, v5);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    noHysterisisCancellationTimer = self->_noHysterisisCancellationTimer;
    self->_noHysterisisCancellationTimer = v6;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTimer:forMode:", self->_noHysterisisCancellationTimer, *MEMORY[0x1E0C99860]);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)setState:(int64_t)a3
{
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  NSTimer *noHysterisisCancellationTimer;
  NSTimer *v10;
  objc_super v11;

  v5 = -[SBPanSystemGestureRecognizer failsPastMaximumPressDurationWithoutHysteresis](self, "failsPastMaximumPressDurationWithoutHysteresis");
  if (a3 == 1 && v5)
  {
    BSContinuousMachTimeNow();
    v7 = v6 - self->_initialTouchReceivedTime;
    -[SBPanSystemGestureRecognizer maximumPressDuration](self, "maximumPressDuration");
    if (v7 >= v8)
      a3 = 5;
    else
      a3 = 1;
  }
  noHysterisisCancellationTimer = self->_noHysterisisCancellationTimer;
  if (noHysterisisCancellationTimer)
  {
    -[NSTimer invalidate](noHysterisisCancellationTimer, "invalidate");
    v10 = self->_noHysterisisCancellationTimer;
    self->_noHysterisisCancellationTimer = 0;

  }
  v11.receiver = self;
  v11.super_class = (Class)SBPanSystemGestureRecognizer;
  -[SBPanSystemGestureRecognizer setState:](&v11, sel_setState_, a3);
}

- (BOOL)failsPastMaximumPressDurationWithoutHysteresis
{
  return self->_failsPastMaximumPressDurationWithoutHysteresis;
}

- (SBPanSystemGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SBPanSystemGestureRecognizer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPanSystemGestureRecognizer;
  result = -[SBPanSystemGestureRecognizer initWithTarget:action:](&v5, sel_initWithTarget_action_, a3, a4);
  if (result)
  {
    result->_failsPastMaximumPressDurationWithoutHysteresis = 0;
    result->_maximumPressDuration = 2.0;
    result->_initialTouchReceivedTime = -1.79769313e308;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[SBPanSystemGestureRecognizer invalidateNoHysterisisCancellationTimer](self, "invalidateNoHysterisisCancellationTimer");
  v3.receiver = self;
  v3.super_class = (Class)SBPanSystemGestureRecognizer;
  -[SBPanSystemGestureRecognizer dealloc](&v3, sel_dealloc);
}

void __74__SBPanSystemGestureRecognizer_setupNoHysterisisCancellationTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(*(id *)(a1 + 32), "state");
    WeakRetained = v4;
    if (!v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
      WeakRetained = v4;
    }
  }

}

- (void)setFailsPastMaximumPressDurationWithoutHysteresis:(BOOL)a3
{
  self->_failsPastMaximumPressDurationWithoutHysteresis = a3;
}

- (double)maximumPressDuration
{
  return self->_maximumPressDuration;
}

- (void)setMaximumPressDuration:(double)a3
{
  self->_maximumPressDuration = a3;
}

- (NSTimer)noHysterisisCancellationTimer
{
  return self->_noHysterisisCancellationTimer;
}

- (void)setNoHysterisisCancellationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_noHysterisisCancellationTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noHysterisisCancellationTimer, 0);
}

@end
