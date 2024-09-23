@implementation WFDrawerAnimation

- (WFDrawerAnimation)initWithDuration:(double)a3 curve:(int64_t)a4 delay:(double)a5
{
  WFDrawerAnimation *v8;
  WFDrawerAnimation *v9;
  WFDrawerAnimation *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFDrawerAnimation;
  v8 = -[WFDrawerAnimation init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = 0;
    v8->_typeParameters.basic.curve = a4;
    v8->_duration = a3;
    v8->_delay = a5;
    v10 = v8;
  }

  return v9;
}

- (WFDrawerAnimation)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7
{
  return -[WFDrawerAnimation initWithMass:stiffness:damping:initialVelocity:delay:calculateCoordinatedAnimation:](self, "initWithMass:stiffness:damping:initialVelocity:delay:calculateCoordinatedAnimation:", 1, a3, a4, a5, a6, a7);
}

- (WFDrawerAnimation)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7 calculateCoordinatedAnimation:(BOOL)a8
{
  _BOOL4 v8;
  WFDrawerAnimation *v14;
  WFDrawerAnimation *v15;
  WFDrawerSpringInfo *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double v24;
  WFDrawerAnimation *v25;
  double v26;
  double v27;
  WFDrawerAnimation *v28;
  WFDrawerAnimation *coordinatedUnitAnimation;
  WFDrawerAnimation *v30;
  objc_super v32;

  v8 = a8;
  v32.receiver = self;
  v32.super_class = (Class)WFDrawerAnimation;
  v14 = -[WFDrawerAnimation init](&v32, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = 1;
    v14->_typeParameters.spring.mass = a3;
    v14->_typeParameters.spring.stiffness = a4;
    v14->_typeParameters.spring.damping = a5;
    v14->_typeParameters.spring.initialVelocity = a6;
    v16 = -[WFDrawerSpringInfo initWithMass:stiffness:damping:initialVelocity:]([WFDrawerSpringInfo alloc], "initWithMass:stiffness:damping:initialVelocity:", a3, a4, a5, a6);
    -[WFDrawerSpringInfo settlingTime](v16, "settlingTime");
    v15->_duration = v17;
    v15->_delay = a7;
    if (v8)
    {
      -[WFDrawerSpringInfo undershootTime](v16, "undershootTime");
      v19 = v18;
      -[WFDrawerSpringInfo overshootTime](v16, "overshootTime");
      v21 = v20;
      if (v19 <= 0.0)
      {
        v23 = 0;
      }
      else
      {
        -[WFDrawerSpringInfo valueAtTime:](v16, "valueAtTime:", v19);
        v23 = v22 > 1.005;
      }
      if (v21 > 0.0)
      {
        -[WFDrawerSpringInfo valueAtTime:](v16, "valueAtTime:", v21);
        if (v24 < -0.005)
        {
          v25 = [WFDrawerAnimation alloc];
          if (v23)
          {
            v26 = v21 - v19;
            v27 = v19 + a7;
          }
          else
          {
            v26 = v21;
            v27 = a7;
          }
          v28 = -[WFDrawerAnimation initWithDuration:curve:delay:](v25, "initWithDuration:curve:delay:", 5, v26, v27);
          goto LABEL_14;
        }
      }
      if (v23)
      {
        v28 = -[WFDrawerAnimation initWithMass:stiffness:damping:initialVelocity:delay:calculateCoordinatedAnimation:]([WFDrawerAnimation alloc], "initWithMass:stiffness:damping:initialVelocity:delay:calculateCoordinatedAnimation:", 0, a3, a4, a5, 0.0, v19 + a7);
LABEL_14:
        coordinatedUnitAnimation = v15->_coordinatedUnitAnimation;
        v15->_coordinatedUnitAnimation = v28;

      }
    }
    v30 = v15;

  }
  return v15;
}

- (id)initUsingDefaultSpringWithInitialVelocity:(double)a3 delay:(double)a4
{
  WFDrawerAnimation *v6;
  WFDrawerAnimation *v7;
  WFDrawerAnimation *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFDrawerAnimation;
  v6 = -[WFDrawerAnimation init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    v6->_typeParameters.spring.mass = a3;
    v6->_delay = a4;
    v8 = v6;
  }

  return v7;
}

- (WFDrawerAnimation)coordinatedUnitAnimation
{
  if (self->_coordinatedUnitAnimation)
    self = self->_coordinatedUnitAnimation;
  return self;
}

- (void)applyWithAnimations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t type;
  void *v9;
  double v10;
  double v11;
  int64_t v12;
  id *v13;
  void *v14;
  double delay;
  int64_t curve;
  double duration;
  double v18;
  int64_t v19;
  double stiffness;
  double damping;
  double initialVelocity;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  type = self->_type;
  switch(type)
  {
    case 2uLL:
      v14 = (void *)MEMORY[0x24BEBDB00];
      delay = self->_delay;
      curve = self->_typeParameters.basic.curve;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __52__WFDrawerAnimation_applyWithAnimations_completion___block_invoke_3;
      v24[3] = &unk_24EE251C8;
      v13 = &v25;
      v25 = v6;
      objc_msgSend(v14, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 2, v24, v7, delay, *(double *)&curve);
      goto LABEL_7;
    case 1uLL:
      duration = self->_duration;
      v18 = self->_delay;
      v19 = self->_typeParameters.basic.curve;
      stiffness = self->_typeParameters.spring.stiffness;
      damping = self->_typeParameters.spring.damping;
      initialVelocity = self->_typeParameters.spring.initialVelocity;
      v26[0] = MEMORY[0x24BDAC760];
      v23 = (void *)MEMORY[0x24BEBDB00];
      v26[2] = __52__WFDrawerAnimation_applyWithAnimations_completion___block_invoke_2;
      v26[3] = &unk_24EE251C8;
      v13 = &v27;
      v26[1] = 3221225472;
      v27 = v6;
      objc_msgSend(v23, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v26, v7, duration, v18, *(double *)&v19, stiffness, damping, initialVelocity);
      goto LABEL_7;
    case 0uLL:
      v9 = (void *)MEMORY[0x24BEBDB00];
      v10 = self->_duration;
      v11 = self->_delay;
      v12 = (self->_typeParameters.basic.curve << 16) | 2;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __52__WFDrawerAnimation_applyWithAnimations_completion___block_invoke;
      v28[3] = &unk_24EE251C8;
      v13 = &v29;
      v29 = v6;
      objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", v12, v28, v7, v10, v11);
LABEL_7:

      break;
  }

}

- (id)description
{
  unint64_t type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  type = self->_type;
  switch(type)
  {
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<DefaultSpringAnimation duration: %g, delay: %g, initialVelocity: %g>"), *(_QWORD *)&self->_duration, *(_QWORD *)&self->_delay, self->_typeParameters.basic.curve, v4, v5, v6);
      goto LABEL_7;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<SpringAnimation duration: %g, delay: %g, mass: %g, stiffness: %g, damping: %g, initialVelocity: %g>"), *(_QWORD *)&self->_duration, *(_QWORD *)&self->_delay, self->_typeParameters.basic.curve, *(_QWORD *)&self->_typeParameters.spring.stiffness, *(_QWORD *)&self->_typeParameters.spring.damping, *(_QWORD *)&self->_typeParameters.spring.initialVelocity);
      goto LABEL_7;
    case 0uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<BasicAnimation duration: %g, delay: %g, curve: %ld>"), *(_QWORD *)&self->_duration, *(_QWORD *)&self->_delay, self->_typeParameters.basic.curve, v4, v5, v6);
LABEL_7:
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      break;
  }
  return (id)(id)a2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinatedUnitAnimation, 0);
}

uint64_t __52__WFDrawerAnimation_applyWithAnimations_completion___block_invoke(uint64_t a1)
{
  void *v2;
  CAFrameRateRange v4;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835009, *(_QWORD *)(a1 + 32), *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __52__WFDrawerAnimation_applyWithAnimations_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  CAFrameRateRange v4;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835009, *(_QWORD *)(a1 + 32), *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __52__WFDrawerAnimation_applyWithAnimations_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  CAFrameRateRange v4;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835009, *(_QWORD *)(a1 + 32), *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

+ (id)animationWithDuration:(double)a3 curve:(int64_t)a4 delay:(double)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDuration:curve:delay:", a4, a3, a5);
}

+ (id)animationWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMass:stiffness:damping:initialVelocity:delay:", a3, a4, a5, a6, a7);
}

+ (id)animationUsingDefaultSpringWithInitialVelocity:(double)a3 delay:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initUsingDefaultSpringWithInitialVelocity:delay:", a3, a4);
}

+ (id)drawerReleaseAnimationWithInitialVelocity:(double)a3
{
  return (id)objc_msgSend(a1, "animationWithMass:stiffness:damping:initialVelocity:delay:", 1.0, dbl_2268AB3A0[a3 > 4.0], dbl_2268AB3B0[a3 > 4.0]);
}

@end
