@implementation PXValueDefaultAnimation

- (PXValueDefaultAnimation)initWithDuration:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a5, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXValueAnimation.m"), 82, CFSTR("%s is not available as initializer"), "-[PXValueDefaultAnimation initWithDuration:currentMediaTime:spec:]");

  abort();
}

- (PXValueDefaultAnimation)initWithFromValue:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5
{
  __int128 v7;
  __int128 v8;
  double duration;
  PXValueDefaultAnimation *result;
  _OWORD v11[3];
  double initialVelocity;
  objc_super v13;

  v7 = *(_OWORD *)&a5->curve;
  v8 = *(_OWORD *)&a5->stiffness;
  v11[0] = *(_OWORD *)&a5->type;
  v11[1] = v7;
  duration = a5->duration;
  v13.receiver = self;
  v13.super_class = (Class)PXValueDefaultAnimation;
  v11[2] = v8;
  initialVelocity = a5->initialVelocity;
  result = -[PXValueAnimation initWithDuration:currentMediaTime:spec:](&v13, sel_initWithDuration_currentMediaTime_spec_, v11, duration, a4);
  if (result)
  {
    result->_initialValue = a3;
    result->_curve = a5->curve;
  }
  return result;
}

- (double)currentValue
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v9;

  -[PXValueAnimation elapsedTime](self, "elapsedTime");
  v5 = v4;
  -[PXValueAnimation duration](self, "duration");
  v7 = fmax(fmin(v5 / v6, 1.0), 0.0);
  switch(self->_curve)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", 1.0, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXValueAnimation.m"), 98, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 2:
      v7 = v7 * v7;
      break;
    case 3:
      v7 = v7 * (2.0 - v7);
      break;
    case 4:
      if (v7 >= 0.5)
        v7 = (v7 * -2.0 + 4.0) * v7 + -1.0;
      else
        v7 = v7 * (v7 + v7);
      break;
    default:
      return (1.0 - v7) * self->_initialValue;
  }
  return (1.0 - v7) * self->_initialValue;
}

- (double)approximateVelocity
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;

  -[PXValueAnimation duration](self, "duration");
  v5 = v4;
  -[PXValueAnimation elapsedTime](self, "elapsedTime");
  v6 = 0.0;
  v8 = fmax(fmin(v7 / v5, 1.0), 0.0);
  switch(self->_curve)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXValueAnimation.m"), 122, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      v6 = 1.0;
      return -(v6 * self->_initialValue) / v5;
    case 2:
      goto LABEL_4;
    case 3:
      v8 = 1.0 - v8;
LABEL_4:
      v6 = v8 + v8;
      break;
    case 4:
      if (v8 >= 0.5)
        v8 = 1.0 - v8;
      v6 = v8 * 4.0;
      break;
    default:
      return -(v6 * self->_initialValue) / v5;
  }
  return -(v6 * self->_initialValue) / v5;
}

@end
