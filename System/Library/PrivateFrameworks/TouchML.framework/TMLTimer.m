@implementation TMLTimer

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  double v3;

  return objc_msgSend_isEqualToString_(a3, a2, v3, CFSTR("running")) ^ 1;
}

- (void)tmlDispose
{
  double v2;
  NSTimer *timer;
  objc_super v5;

  objc_msgSend_invalidate(self->_timer, a2, v2);
  timer = self->_timer;
  self->_timer = 0;

  v5.receiver = self;
  v5.super_class = (Class)TMLTimer;
  -[NSObject tmlDispose](&v5, sel_tmlDispose);
}

- (void)setRunning:(BOOL)a3
{
  double v3;
  NSTimer *v5;
  NSTimer *timer;
  const char *v7;
  const char *v8;
  double v9;
  NSString *runLoopMode;
  void *v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;

  if (self->_running != a3)
  {
    if (a3)
    {
      objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x24BDBCF40], a2, self->_interval, self, sel_timerFired_, 0, self->_repeats);
      v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      timer = self->_timer;
      self->_timer = v5;

      objc_msgSend_setTolerance_(self->_timer, v7, self->_tolerance);
      runLoopMode = self->_runLoopMode;
      if (!runLoopMode || (objc_msgSend_isEqualToString_(runLoopMode, v8, v9, *MEMORY[0x24BDBCA90]) & 1) != 0)
        goto LABEL_8;
      objc_msgSend_currentRunLoop(MEMORY[0x24BDBCF18], v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addTimer_forMode_(v11, v12, v13, self->_timer, self->_runLoopMode);
    }
    else
    {
      objc_msgSend_invalidate(self->_timer, a2, v3);
      v11 = self->_timer;
      self->_timer = 0;
    }

LABEL_8:
    objc_msgSend_willChangeValueForKey_(self, v8, v9, CFSTR("running"));
    self->_running = self->_timer != 0;
    objc_msgSend_didChangeValueForKey_(self, v14, v15, CFSTR("running"));
  }
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (void)timerFired:(id)a3
{
  const char *v4;
  double v5;
  void (**block)(void);
  id v7;

  v7 = a3;
  if (!self->_repeats)
    objc_msgSend_stop(self, v4, v5);
  block = (void (**)(void))self->_block;
  if (block)
    block[2]();
  else
    objc_msgSend_emitTMLSignal_withArguments_(self, v4, v5, CFSTR("fired"), 0);

}

- (void)start
{
  double v2;
  NSTimer *timer;

  if (self->_running)
  {
    objc_msgSend_invalidate(self->_timer, a2, v2);
    timer = self->_timer;
    self->_timer = 0;

    self->_running = 0;
  }
  MEMORY[0x24BEDD108](self, sel_setRunning_, v2);
}

- (void)stop
{
  ((void (*)(TMLTimer *, char *))MEMORY[0x24BEDD108])(self, sel_setRunning_);
}

- (void)fire
{
  ((void (*)(NSTimer *, char *))MEMORY[0x24BEDD108])(self->_timer, sel_fire);
}

+ (void)initializeJSContext:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  double v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_22AD4CF5C;
  v7[3] = &unk_24F501180;
  v7[4] = a1;
  v3 = a3;
  v4 = (void *)MEMORY[0x22E2E7E44](v7);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, v6, v4, CFSTR("timer"));

}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)a3
{
  self->_repeats = a3;
}

- (double)interval
{
  return self->_interval;
}

- (double)tolerance
{
  return self->_tolerance;
}

- (void)setTolerance:(double)a3
{
  self->_tolerance = a3;
}

- (BOOL)running
{
  return self->_running;
}

- (NSString)runLoopMode
{
  return self->_runLoopMode;
}

- (void)setRunLoopMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLoopMode, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
