@implementation UIDelayedAction

- (UIDelayedAction)initWithTarget:(id)a3 action:(SEL)a4 userInfo:(id)a5 delay:(double)a6
{
  return -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](self, "initWithTarget:action:userInfo:delay:mode:", a3, a4, a5, *MEMORY[0x1E0C99748], a6);
}

- (void)dealloc
{
  NSTimer *m_timer;
  objc_super v4;

  -[NSTimer invalidate](self->m_timer, "invalidate");
  m_timer = self->m_timer;
  self->m_timer = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIDelayedAction;
  -[UIDelayedAction dealloc](&v4, sel_dealloc);
}

- (UIDelayedAction)initWithTarget:(id)a3 action:(SEL)a4 userInfo:(id)a5 delay:(double)a6 mode:(id)a7
{
  id v13;
  id v14;
  id v15;
  UIDelayedAction *v16;
  UIDelayedAction *v17;
  uint64_t v18;
  NSString *m_runLoopMode;
  objc_super v21;

  v13 = a3;
  v14 = a5;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)UIDelayedAction;
  v16 = -[UIDelayedAction init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong(&v16->m_target, a3);
    v17->m_action = a4;
    objc_storeStrong(&v17->m_userInfo, a5);
    v17->m_delay = a6;
    v18 = objc_msgSend(v15, "copy");
    m_runLoopMode = v17->m_runLoopMode;
    v17->m_runLoopMode = (NSString *)v18;

    -[UIDelayedAction touchWithDelay:](v17, "touchWithDelay:", v17->m_delay);
  }

  return v17;
}

- (void)touchWithDelay:(double)a3
{
  NSDate *v5;
  NSDate *m_startDate;
  uint64_t v7;
  NSTimer *m_timer;
  NSTimer *v9;
  NSTimer *v10;
  void *v11;
  id v12;

  self->m_canceled = 0;
  self->m_delay = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  m_startDate = self->m_startDate;
  self->m_startDate = v5;

  -[NSDate dateByAddingTimeInterval:](self->m_startDate, "dateByAddingTimeInterval:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  m_timer = self->m_timer;
  v12 = (id)v7;
  if (m_timer)
  {
    -[NSTimer setFireDate:](m_timer, "setFireDate:", v7);
  }
  else
  {
    v9 = (NSTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v7, self, sel_timerFired_, self->m_userInfo, 0, a3);
    v10 = self->m_timer;
    self->m_timer = v9;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTimer:forMode:", self->m_timer, self->m_runLoopMode);

  }
}

- (void)cancel
{
  self->m_canceled = 1;
  -[UIDelayedAction unschedule](self, "unschedule");
}

- (void)unschedule
{
  NSTimer *m_timer;

  -[NSTimer invalidate](self->m_timer, "invalidate");
  m_timer = self->m_timer;
  self->m_timer = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_startDate, 0);
  objc_storeStrong((id *)&self->m_runLoopMode, 0);
  objc_storeStrong((id *)&self->m_timer, 0);
  objc_storeStrong(&self->m_userInfo, 0);
  objc_storeStrong(&self->m_target, 0);
}

- (UIDelayedAction)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[UIDelayedAction init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (void)touch
{
  self->m_canceled = 0;
  -[UIDelayedAction touchWithDelay:](self, "touchWithDelay:", self->m_delay);
}

- (BOOL)scheduled
{
  return !self->m_canceled && -[NSTimer isValid](self->m_timer, "isValid");
}

- (double)delay
{
  return self->m_delay;
}

- (void)timerFired:(id)a3
{
  if (!self->m_canceled)
    objc_msgSend(self->m_target, self->m_action, self->m_userInfo);
  -[UIDelayedAction cancel](self, "cancel", a3);
}

- (id)target
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setTarget:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)userInfo
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)_startDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)_canceled
{
  return self->m_canceled;
}

@end
