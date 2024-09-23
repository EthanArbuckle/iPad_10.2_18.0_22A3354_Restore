@implementation VKQuickDynamicAnimation

- (double)lastTimestamp
{
  return self->super._lastTimestamp;
}

- (void)setLastTimestamp:(double)a3
{
  self->super._lastTimestamp = a3;
  self->super._resuming = 0;
}

- (void)onTimerFired:(double)a3
{
  int64_t state;
  double lastTimestamp;
  unsigned int (**dynamicStepHandler)(id, SEL);

  state = self->super.super._state;
  if (state == 3)
    goto LABEL_10;
  if (state == 1)
  {
    if (self->super._resuming)
    {
      self->super._resuming = 0;
      lastTimestamp = a3;
    }
    else
    {
      lastTimestamp = self->super._lastTimestamp;
    }
    self->super._lastTimestamp = a3;
    dynamicStepHandler = (unsigned int (**)(id, SEL))self->super._dynamicStepHandler;
    if (dynamicStepHandler)
    {
      if (fmax(lastTimestamp, a3) - lastTimestamp > 0.0 && dynamicStepHandler[2](dynamicStepHandler, a2))
      {
        self->super.super._state = 3;
LABEL_10:
        -[VKDynamicAnimation stopAnimation:](self, "stopAnimation:", 1);
      }
    }
  }
}

@end
