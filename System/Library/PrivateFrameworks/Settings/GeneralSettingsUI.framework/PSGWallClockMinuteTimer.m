@implementation PSGWallClockMinuteTimer

- (PSGWallClockMinuteTimer)initWithTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  PSGWallClockMinuteTimer *v7;
  PSGWallClockMinuteTimer *v8;
  NSTimer *timer;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSGWallClockMinuteTimer;
  v7 = -[PSGWallClockMinuteTimer init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    timer = v8->_timer;
    v8->_action = a4;
    v8->_timer = 0;

  }
  return v8;
}

- (void)startTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  unint64_t v8;
  double v9;
  long double v10;
  long double v11;
  NSTimer *v12;
  NSTimer *timer;

  -[PSGWallClockMinuteTimer invalidate](self, "invalidate");
  v3 = (void *)MEMORY[0x24BDBCF40];
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 128, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (double)objc_msgSend(v6, "second");

  objc_msgSend(v4, "rangeOfUnit:inUnit:forDate:", 128, 64, v5);
  v9 = (double)v8 - v7;
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v11 = v9 - fmod(v10, 1.0);

  objc_msgSend(v3, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__fireAction, 0, 0, (double)v11);
  v12 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  timer = self->_timer;
  self->_timer = v12;

}

- (void)invalidate
{
  NSTimer *timer;

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (void)_fireAction
{
  id WeakRetained;

  -[PSGWallClockMinuteTimer startTimer](self, "startTimer");
  WeakRetained = objc_loadWeakRetained(&self->_target);
  objc_msgSend(WeakRetained, "performSelector:withObject:afterDelay:", self->_action, 0, 0.0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak(&self->_target);
}

@end
