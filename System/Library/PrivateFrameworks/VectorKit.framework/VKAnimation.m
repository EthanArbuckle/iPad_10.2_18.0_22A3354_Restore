@implementation VKAnimation

- (BOOL)running
{
  return (self->_state & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_runner);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)onTimerFired:(double)a3
{
  if (self->_state == 3)
    -[VKAnimation stopAnimation:](self, "stopAnimation:", 1, a3);
}

- (BOOL)runsForever
{
  return self->_runsForever;
}

- (void)stopAnimation:(BOOL)a3
{
  int64_t state;
  _BOOL8 v4;
  VKAnimation *v6;
  void (**completionHandler)(id, _BOOL8);
  id v8;
  id WeakRetained;

  state = self->_state;
  if (state)
    v4 = a3;
  else
    v4 = 0;
  if (state != 4)
  {
    self->_state = 4;
    v6 = objc_retainAutorelease(self);
    completionHandler = (void (**)(id, _BOOL8))v6->_completionHandler;
    if (completionHandler)
    {
      completionHandler[2](completionHandler, v4);
      v8 = v6->_completionHandler;
    }
    else
    {
      v8 = 0;
    }
    v6->_completionHandler = 0;

    self->_state = 0;
    WeakRetained = objc_loadWeakRetained((id *)&v6->_runner);
    objc_msgSend(WeakRetained, "animationDidStop:", v6);

    objc_storeWeak((id *)&v6->_runner, 0);
  }
}

- (void)stop
{
  -[VKAnimation stopAnimation:](self, "stopAnimation:", self->_state == 3);
}

- (void)startWithRunner:(id)a3
{
  if (self->_state != 4)
  {
    objc_storeWeak((id *)&self->_runner, a3);
    self->_state = 1;
  }
}

- (int64_t)priority
{
  return self->_priority;
}

- (double)duration
{
  return 0.0;
}

- (BOOL)hasFrequency
{
  return self->_frequency != 0.0;
}

- (BOOL)timed
{
  return 0;
}

- (VKAnimation)initWithName:(id)a3
{
  id v4;
  VKAnimation *v5;
  uint64_t v6;
  NSString *name;

  v4 = a3;
  v5 = -[VKAnimation init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (VKAnimation)initWithPriority:(int64_t)a3 name:(id)a4
{
  VKAnimation *result;

  result = -[VKAnimation initWithName:](self, "initWithName:", a4);
  if (result)
    result->_priority = a3;
  return result;
}

- (VKAnimation)initWithPriority:(int64_t)a3
{
  VKAnimation *result;

  result = -[VKAnimation init](self, "init");
  if (result)
    result->_priority = a3;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)VKAnimation;
  -[VKAnimation description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ state: %ld, name: %@"), v4, self->_state, self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)transferToRunner:(id)a3
{
  objc_storeWeak((id *)&self->_runner, a3);
}

- (void)pause
{
  self->_state = 2;
}

- (void)resume
{
  VKAnimationRunner **p_runner;
  id WeakRetained;
  id v5;

  p_runner = &self->_runner;
  WeakRetained = objc_loadWeakRetained((id *)&self->_runner);

  if (WeakRetained)
  {
    self->_state = 1;
    v5 = objc_loadWeakRetained((id *)p_runner);
    objc_msgSend(v5, "animationDidResume:", self);

  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setRunsForever:(BOOL)a3
{
  self->_runsForever = a3;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)state
{
  return self->_state;
}

- (float)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(float)a3
{
  self->_frequency = a3;
}

@end
