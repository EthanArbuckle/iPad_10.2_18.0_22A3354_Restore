@implementation VKSpringAnimation

- (VKSpringAnimation)initWithTension:(float)a3 friction:(float)a4 name:(id)a5
{
  VKSpringAnimation *v7;
  VKSpringAnimation *v8;
  VKSpringAnimation *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VKSpringAnimation;
  v7 = -[VKAnimation initWithName:](&v11, sel_initWithName_, a5);
  v8 = v7;
  if (v7)
  {
    v7->_tension = a3;
    v7->_friction = a4;
    v9 = v7;
  }

  return v8;
}

- (void)stopAnimation:(BOOL)a3
{
  id stepHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKSpringAnimation;
  -[VKAnimation stopAnimation:](&v5, sel_stopAnimation_, a3);
  stepHandler = self->_stepHandler;
  self->_stepHandler = 0;

}

- (void)pause
{
  objc_super v2;

  self->_resuming = 0;
  v2.receiver = self;
  v2.super_class = (Class)VKSpringAnimation;
  -[VKAnimation pause](&v2, sel_pause);
}

- (void)resume
{
  objc_super v2;

  self->_resuming = 1;
  v2.receiver = self;
  v2.super_class = (Class)VKSpringAnimation;
  -[VKAnimation resume](&v2, sel_resume);
}

- (BOOL)_calculateFractionForTimeElapsed:(double)a3 result:(float *)a4
{
  float v6;
  float lastVelocity;
  float friction;
  float tension;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  __double2 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  long double v24;
  double v25;
  double v26;
  long double v27;
  long double v28;
  double v29;
  double v30;
  long double v31;
  double v32;
  double v33;
  float v34;
  float v35;
  float v36;
  double v37;
  double v38;
  double v39;

  v6 = self->_lastFraction + -1.0;
  lastVelocity = self->_lastVelocity;
  friction = self->_friction;
  tension = self->_tension;
  if ((float)(fabsf((float)(friction * lastVelocity) / tension) + fabsf(v6)) < 0.001)
  {
    *a4 = 1.0;
    return 1;
  }
  v12 = sqrtf(tension);
  v13 = friction * 0.5;
  if ((float)(friction * 0.5) >= v12)
  {
    if ((float)(friction * 0.5) <= v12)
    {
      v30 = (float)-v13;
      v31 = exp(v30 * a3);
      v32 = (float)(lastVelocity + (float)(v13 * v6));
      v33 = v6 + v32 * a3;
      v20 = v33 * v31;
      v29 = (v32 + v33 * v30) * v31;
      goto LABEL_9;
    }
    v16 = sqrtf(-(float)(tension - (float)(v13 * v13)));
    v39 = (float)-v13;
    v15 = exp(v39 * a3);
    v23 = v6;
    v24 = v16 * a3;
    v25 = cosh(v24);
    v37 = v25 * v6;
    v26 = (float)(lastVelocity + (float)(v13 * v6)) / v16;
    v27 = sinh(v24);
    v28 = v37 + v27 * v26;
    v20 = v28 * v15;
    v21 = v25 * v26 + v27 * v23;
    v22 = v28 * v39;
  }
  else
  {
    v14 = sqrtf(tension - (float)(v13 * v13));
    v38 = (float)-v13;
    v15 = exp(v38 * a3);
    v16 = v14;
    v17 = __sincos_stret(v14 * a3);
    v18 = (float)((float)(lastVelocity + (float)(v13 * v6)) / v14);
    v19 = v17.__sinval * v18 + v17.__cosval * v6;
    v20 = v19 * v15;
    v21 = -(v17.__sinval * v6 - v17.__cosval * v18);
    v22 = v19 * v38;
  }
  v29 = (v22 + v21 * v16) * v15;
LABEL_9:
  v34 = v20;
  v35 = v34 + 1.0;
  self->_lastFraction = v35;
  v36 = v29;
  self->_lastVelocity = v36;
  *a4 = v35;
  return (float)(fabsf((float)(self->_friction * self->_lastVelocity) / self->_tension)
               + fabsf(self->_lastFraction + -1.0)) < 0.001;
}

- (void)onTimerFired:(double)a3
{
  double lastTimestamp;
  _BOOL4 v6;
  void (**stepHandler)(float);
  float v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VKSpringAnimation;
  -[VKAnimation onTimerFired:](&v9, sel_onTimerFired_);
  if (self->_startTimestampSet)
  {
    lastTimestamp = self->_lastTimestamp;
  }
  else
  {
    self->_startTimestampSet = 1;
    self->_startTimestamp = a3;
    self->_lastTimestamp = a3;
    lastTimestamp = a3;
  }
  if (self->_resuming)
  {
    self->_startTimestamp = a3 - lastTimestamp + self->_startTimestamp;
    self->_resuming = 0;
    lastTimestamp = a3;
  }
  self->_lastTimestamp = a3;
  v8 = 0.0;
  v6 = -[VKSpringAnimation _calculateFractionForTimeElapsed:result:](self, "_calculateFractionForTimeElapsed:result:", &v8, a3 - lastTimestamp);
  stepHandler = (void (**)(float))self->_stepHandler;
  if (stepHandler)
    stepHandler[2](v8);
  if (v6)
    self->super._state = 3;
}

- (float)tension
{
  return self->_tension;
}

- (float)friction
{
  return self->_friction;
}

- (id)stepHandler
{
  return self->_stepHandler;
}

- (void)setStepHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stepHandler, 0);
}

@end
