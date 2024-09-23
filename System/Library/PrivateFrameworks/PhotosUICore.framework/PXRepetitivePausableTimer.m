@implementation PXRepetitivePausableTimer

- (PXRepetitivePausableTimer)initWithRepeatedInterval:(double)a3 initialTrigger:(BOOL)a4 target:(id)a5
{
  id v7;
  PXRepetitivePausableTimer *v8;
  PXRepetitivePausableTimer *v9;
  void *v10;
  id callBlock;
  id v12;
  objc_super v14;

  v7 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXRepetitivePausableTimer;
  v8 = -[PXRepetitivePausableTimer init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_repetitiveInterval = a3;
    v10 = _Block_copy(v7);
    callBlock = v9->_callBlock;
    v9->_callBlock = v10;

    v9->_reasonsToPause = 0;
    v12 = (id)objc_msgSend(MEMORY[0x1E0C99E88], "px_scheduledTimerWithTimeInterval:weakTarget:selector:userInfo:repeats:", v9, sel__handleTimer_, 0, 0, 0.0);
    -[PXRepetitivePausableTimer _startTimer](v9, "_startTimer");
  }

  return v9;
}

- (void)_stopTimer
{
  NSTimer *timer;
  NSTimer *v4;

  timer = self->_timer;
  if (timer)
  {
    -[NSTimer invalidate](timer, "invalidate");
    v4 = self->_timer;
    self->_timer = 0;

  }
}

- (void)_startTimer
{
  NSTimer *v3;
  NSTimer *timer;

  objc_msgSend(MEMORY[0x1E0C99E88], "px_scheduledTimerWithTimeInterval:weakTarget:selector:userInfo:repeats:", self, sel__handleTimer_, 0, 1, self->_repetitiveInterval);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  timer = self->_timer;
  self->_timer = v3;

}

- (void)_handleTimer:(id)a3
{
  (*((void (**)(void))self->_callBlock + 2))();
}

- (void)_pauseWithReasons:(int)a3
{
  self->_reasonsToPause += a3;
}

- (void)pause
{
  -[PXRepetitivePausableTimer _stopTimer](self, "_stopTimer");
  -[PXRepetitivePausableTimer _pauseWithReasons:](self, "_pauseWithReasons:", 1);
}

- (void)_unpauseWithReasons:(int)a3
{
  int v3;

  v3 = self->_reasonsToPause - a3;
  self->_reasonsToPause = v3;
  if (!v3)
    -[PXRepetitivePausableTimer _startTimer](self, "_startTimer");
}

- (void)unpause
{
  -[PXRepetitivePausableTimer _unpauseWithReasons:](self, "_unpauseWithReasons:", 1);
}

- (void)reset
{
  -[PXRepetitivePausableTimer _stopTimer](self, "_stopTimer");
  -[PXRepetitivePausableTimer _startTimer](self, "_startTimer");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_callBlock, 0);
}

@end
