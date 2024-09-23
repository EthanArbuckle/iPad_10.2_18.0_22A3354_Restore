@implementation VKDynamicAnimation

- (BOOL)runsForever
{
  return 0;
}

- (VKDynamicAnimation)init
{
  VKDynamicAnimation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKDynamicAnimation;
  result = -[VKDynamicAnimation init](&v3, sel_init);
  if (result)
  {
    result->_resuming = 1;
    result->super._state = 0;
  }
  return result;
}

- (void)stopAnimation:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKDynamicAnimation;
  -[VKAnimation stopAnimation:](&v4, sel_stopAnimation_, a3);
  self->_resuming = 0;
}

- (void)pause
{
  self->_resuming = 0;
}

- (void)resume
{
  self->_resuming = 1;
}

- (void)onTimerFired:(double)a3
{
  int64_t state;
  double lastTimestamp;
  unsigned int (**dynamicStepHandler)(id, SEL);

  state = self->super._state;
  if (state == 1)
  {
    if (self->_resuming)
    {
      self->_resuming = 0;
      lastTimestamp = a3;
    }
    else
    {
      lastTimestamp = self->_lastTimestamp;
    }
    self->_lastTimestamp = a3;
    dynamicStepHandler = (unsigned int (**)(id, SEL))self->_dynamicStepHandler;
    if (dynamicStepHandler
      && fmax(lastTimestamp, a3) - lastTimestamp > 0.0
      && dynamicStepHandler[2](dynamicStepHandler, a2))
    {
      self->super._state = 3;
    }
  }
  else if (state == 3)
  {
    -[VKDynamicAnimation stopAnimation:](self, "stopAnimation:", 1, a3);
  }
}

- (id)dynamicStepHandler
{
  return self->_dynamicStepHandler;
}

- (void)setDynamicStepHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dynamicStepHandler, 0);
}

@end
