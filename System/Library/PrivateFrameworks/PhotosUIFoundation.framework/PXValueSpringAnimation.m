@implementation PXValueSpringAnimation

- (PXValueSpringAnimation)initWithDuration:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a5, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXValueAnimation.m"), 148, CFSTR("invalid initializer"));

  abort();
}

- (PXValueSpringAnimation)initWithFromValue:(double)a3 currentMediaTime:(double)a4 spec:(PXValueAnimationSpec *)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v15;
  double stiffness;
  double initialVelocity;
  __int128 v18;
  PXValueSpringAnimation *result;
  objc_super v20;
  _BYTE buf[32];
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = sqrt(a5->stiffness);
  v10 = (v9 + v9) * a5->dampingRatio;
  objc_msgSend((id)objc_opt_class(), "durationOfSpringAnimationWithMass:stiffness:damping:velocity:epsilon:", 1.0, a5->stiffness, v10, a5->initialVelocity, a5->epsilon);
  v12 = v11;
  v13 = fabs(v11);
  if (v12 > 10.0 || v13 == INFINITY)
  {
    PFUIGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      stiffness = a5->stiffness;
      initialVelocity = a5->initialVelocity;
      *(_DWORD *)buf = 134219008;
      *(double *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0x3FF0000000000000;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = stiffness;
      *(_WORD *)v22 = 2048;
      *(double *)&v22[2] = v10;
      *(_WORD *)&v22[10] = 2048;
      *(double *)&v22[12] = initialVelocity;
      _os_log_impl(&dword_24430E000, v15, OS_LOG_TYPE_DEFAULT, "Got invalid duration:%.2f for spring with mass:%.3f stiffness:%.3f damping:%.3f velocity:%.3f", buf, 0x34u);
    }

    v12 = 1.0;
  }
  v20.receiver = self;
  v20.super_class = (Class)PXValueSpringAnimation;
  v18 = *(_OWORD *)&a5->curve;
  *(_OWORD *)buf = *(_OWORD *)&a5->type;
  *(_OWORD *)&buf[16] = v18;
  *(_OWORD *)v22 = *(_OWORD *)&a5->stiffness;
  *(double *)&v22[16] = a5->initialVelocity;
  result = -[PXValueAnimation initWithDuration:currentMediaTime:spec:](&v20, sel_initWithDuration_currentMediaTime_spec_, buf, v12, a4);
  if (result)
  {
    result->_omega0 = sqrt(a5->stiffness);
    result->_A = a3;
    result->_B = a5->initialVelocity + result->_omega0 * a3;
  }
  return result;
}

- (double)currentValue
{
  double v3;
  double v4;
  long double v5;
  double v7;

  -[PXValueAnimation elapsedTime](self, "elapsedTime");
  v4 = self->_A + self->_B * v3;
  v5 = v4 * exp(-(self->_omega0 * v3));
  -[PXValueAnimation spec](self, "spec");
  return v7 * floor(v5 / v7);
}

- (double)approximateVelocity
{
  double v3;
  double v4;
  double B;
  double omega0;
  long double v7;

  -[PXValueAnimation elapsedTime](self, "elapsedTime");
  v4 = v3;
  B = self->_B;
  omega0 = self->_omega0;
  v7 = exp(-(omega0 * v3));
  return v7 * -(omega0 * (self->_A + B * v4)) + B * v7;
}

+ (double)durationOfSpringAnimationWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 velocity:(double)a6 epsilon:(double)a7
{
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  long double v15;
  double v16;

  v8 = sqrt(a3 * a4);
  v9 = a5 / (v8 + v8);
  if (v9 >= 0.0)
    v10 = v9;
  else
    v10 = 0.0;
  if (fmin(v10, 1.0) == 0.0)
    return INFINITY;
  v12 = sqrt(a4 / a3);
  if (v10 >= 1.0)
  {
    v10 = v12 - a6;
    v15 = exp(-v12 / (v12 - a6));
    v16 = -1.0 - log(fabs(v12 * v15 * a7 / v10));
    v14 = -(v12
          + v10
          * (-1.0
           - v16
           + (-1.0 / (sqrt(v16 * 0.5) * 0.3361 / (v16 * -0.0042 * exp(sqrt(v16) * -0.0201) + 1.0) + 1.0) + 1.0)
           * -5.95060994));
    return v14 / (v12 * v10);
  }
  v13 = fabs(-(a6 - v10 * v12) / (v12 * sqrt(1.0 - v10 * v10)));
  if (v13 < 0.00000011920929)
  {
    v14 = log(1.0 / a7);
    return v14 / (v12 * v10);
  }
  return fmax(-log(a7 / (v13 + 1.0)) / (v12 * v10), 0.0);
}

@end
