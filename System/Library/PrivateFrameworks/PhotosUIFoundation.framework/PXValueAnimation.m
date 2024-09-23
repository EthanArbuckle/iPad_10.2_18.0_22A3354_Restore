@implementation PXValueAnimation

- (PXValueAnimation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXValueAnimation.m"), 20, CFSTR("invalid initializer"));

  abort();
}

- (PXValueAnimation)initWithDuration:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5
{
  PXValueAnimation *result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXValueAnimation;
  result = -[PXValueAnimation init](&v12, sel_init);
  if (result)
  {
    result->_startTime = a4;
    result->_currentMediaTime = a4;
    result->_duration = a3;
    v9 = *(_OWORD *)&a5->type;
    v10 = *(_OWORD *)&a5->curve;
    v11 = *(_OWORD *)&a5->stiffness;
    result->_spec.initialVelocity = a5->initialVelocity;
    *(_OWORD *)&result->_spec.curve = v10;
    *(_OWORD *)&result->_spec.stiffness = v11;
    *(_OWORD *)&result->_spec.type = v9;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXValueAnimation currentValue](self, "currentValue");
  v7 = v6;
  -[PXValueAnimation duration](self, "duration");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; currentValue:%.2f duration:%.2f>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)elapsedTime
{
  double v3;

  -[PXValueAnimation currentMediaTime](self, "currentMediaTime");
  return v3 - self->_startTime;
}

- (double)remainingTime
{
  double v3;
  double v4;
  double v5;

  -[PXValueAnimation duration](self, "duration");
  v4 = v3;
  -[PXValueAnimation elapsedTime](self, "elapsedTime");
  return fmax(v4 - v5, 0.0);
}

- (double)currentValue
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXValueAnimation.m"), 48, CFSTR("concrete subclass must implement"));

  abort();
}

- (double)approximateVelocity
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[PXValueAnimation currentMediaTime](self, "currentMediaTime");
  v4 = v3;
  -[PXValueAnimation currentValue](self, "currentValue");
  v6 = v5;
  -[PXValueAnimation setCurrentMediaTime:](self, "setCurrentMediaTime:", v4 + 0.00833333333);
  -[PXValueAnimation currentValue](self, "currentValue");
  v8 = v7;
  -[PXValueAnimation setCurrentMediaTime:](self, "setCurrentMediaTime:", v4);
  return (v8 - v6) / (v4 + 0.00833333333 - v4);
}

- (BOOL)completed
{
  double v3;
  double v4;
  double v5;

  -[PXValueAnimation elapsedTime](self, "elapsedTime");
  v4 = v3;
  -[PXValueAnimation duration](self, "duration");
  return v4 > v5;
}

- (double)valueForProgress:(double)a3
{
  double v5;
  double v6;
  double v7;
  double result;

  -[PXValueAnimation duration](self, "duration");
  v6 = a3 / v5;
  -[PXValueAnimation startTime](self, "startTime");
  -[PXValueAnimation setCurrentMediaTime:](self, "setCurrentMediaTime:", v7 + v6);
  -[PXValueAnimation currentValue](self, "currentValue");
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (PXValueAnimationSpec)spec
{
  __int128 v3;

  v3 = *(_OWORD *)&self->initialVelocity;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self->stiffness;
  *(_OWORD *)&retstr->curve = v3;
  *(_OWORD *)&retstr->stiffness = *(_OWORD *)&self[1].duration;
  retstr->initialVelocity = self[1].epsilon;
  return self;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)currentMediaTime
{
  return self->_currentMediaTime;
}

- (void)setCurrentMediaTime:(double)a3
{
  self->_currentMediaTime = a3;
}

@end
