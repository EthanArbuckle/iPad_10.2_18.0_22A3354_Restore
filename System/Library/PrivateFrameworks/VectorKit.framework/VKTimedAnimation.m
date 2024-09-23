@implementation VKTimedAnimation

- (void)setTimingFunction:(id)a3
{
  void *v4;
  id timingFunction;
  id v6;

  v6 = a3;
  v4 = (void *)objc_msgSend(v6, "copy");
  timingFunction = self->_timingFunction;
  self->_timingFunction = v4;

}

- (void)setStepHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (VKTimedAnimation)initWithDuration:(double)a3
{
  VKTimedAnimation *v4;
  VKTimedAnimation *v5;
  uint64_t v6;
  id timingFunction;
  VKTimedAnimation *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VKTimedAnimation;
  v4 = -[VKTimedAnimation init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    -[VKTimedAnimation setDuration:](v4, "setDuration:", a3);
    v6 = objc_msgSend(VKAnimationCurveEaseInOut, "copy");
    timingFunction = v5->_timingFunction;
    v5->_timingFunction = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)setDuration:(double)a3
{
  float v5;
  float v6;
  double v7;
  id v8;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animationTimeMultiplier");
  v6 = v5;
  if (sDragCoefficientGetter)
    v7 = (*(float (**)(void))(sDragCoefficientGetter + 16))();
  else
    v7 = 1.0;
  self->_duration = v6 * (a3 * v7);

}

+ (void)setDragCoefficientGetter:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)sDragCoefficientGetter;
  sDragCoefficientGetter = v3;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timingFunction, 0);
  objc_storeStrong(&self->_stepHandler, 0);
}

- (void)onTimerFired:(double)a3
{
  double duration;
  float v6;
  float v7;
  void (**stepHandler)(void);
  float v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VKTimedAnimation;
  -[VKAnimation onTimerFired:](&v10, sel_onTimerFired_);
  if (!self->_startTimestampSet)
  {
    self->_startTimestampSet = 1;
    self->_startTimestamp = a3;
    self->_lastTimestamp = a3;
  }
  if (self->_resuming)
  {
    self->_startTimestamp = a3 - self->_lastTimestamp + self->_startTimestamp;
    self->_resuming = 0;
  }
  self->_lastTimestamp = a3;
  duration = self->_duration;
  v6 = 1.0;
  v7 = 1.0;
  if (duration > 0.0)
  {
    v7 = (a3 - self->_startTimestamp) / duration;
    v6 = modff(v7, &v9);
    if (v7 >= 1.0 && !-[VKAnimation runsForever](self, "runsForever"))
      v6 = 1.0;
  }
  (*((void (**)(float))self->_timingFunction + 2))(fminf(fmaxf(v6, 0.0), 1.0));
  stepHandler = (void (**)(void))self->_stepHandler;
  if (stepHandler)
    stepHandler[2]();
  if (v7 >= 1.0 && !-[VKAnimation runsForever](self, "runsForever"))
    self->super._state = 3;
}

- (void)stopAnimation:(BOOL)a3
{
  id stepHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKTimedAnimation;
  -[VKAnimation stopAnimation:](&v5, sel_stopAnimation_, a3);
  stepHandler = self->_stepHandler;
  self->_stepHandler = 0;

  self->_startTimestampSet = 0;
  self->_resuming = 0;
}

- (BOOL)timed
{
  return 1;
}

- (double)duration
{
  return self->_duration;
}

- (VKTimedAnimation)initWithDuration:(double)a3 priority:(int64_t)a4 name:(id)a5
{
  VKTimedAnimation *result;

  result = -[VKTimedAnimation initWithDuration:name:](self, "initWithDuration:name:", a5, a3);
  if (result)
    result->super._priority = a4;
  return result;
}

- (VKTimedAnimation)init
{
  return -[VKTimedAnimation initWithDuration:](self, "initWithDuration:", 0.2);
}

- (VKTimedAnimation)initWithDuration:(double)a3 name:(id)a4
{
  id v6;
  VKTimedAnimation *v7;
  uint64_t v8;
  NSString *name;

  v6 = a4;
  v7 = -[VKTimedAnimation initWithDuration:](self, "initWithDuration:", a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    name = v7->super._name;
    v7->super._name = (NSString *)v8;

  }
  return v7;
}

- (VKTimedAnimation)initWithName:(id)a3
{
  id v4;
  VKTimedAnimation *v5;
  uint64_t v6;
  NSString *name;

  v4 = a3;
  v5 = -[VKTimedAnimation init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->super._name;
    v5->super._name = (NSString *)v6;

  }
  return v5;
}

- (void)pause
{
  objc_super v2;

  self->_resuming = 0;
  v2.receiver = self;
  v2.super_class = (Class)VKTimedAnimation;
  -[VKAnimation pause](&v2, sel_pause);
}

- (void)resume
{
  objc_super v2;

  self->_resuming = 1;
  v2.receiver = self;
  v2.super_class = (Class)VKTimedAnimation;
  -[VKAnimation resume](&v2, sel_resume);
}

- (id)timingFunction
{
  return self->_timingFunction;
}

- (id)stepHandler
{
  return self->_stepHandler;
}

@end
