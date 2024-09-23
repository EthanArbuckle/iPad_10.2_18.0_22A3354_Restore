@implementation CardAnimation

- (CardAnimation)initWithDuration:(double)a3 curve:(int64_t)a4 delay:(double)a5
{
  CardAnimation *v8;
  CardAnimation *v9;
  CardAnimation *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CardAnimation;
  v8 = -[CardAnimation init](&v12, "init");
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

- (CardAnimation)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7
{
  return -[CardAnimation initWithMass:stiffness:damping:initialVelocity:delay:calculateCoordinatedAnimation:](self, "initWithMass:stiffness:damping:initialVelocity:delay:calculateCoordinatedAnimation:", 1, a3, a4, a5, a6, a7);
}

- (CardAnimation)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7 calculateCoordinatedAnimation:(BOOL)a8
{
  _BOOL4 v8;
  CardAnimation *v14;
  CardAnimation *v15;
  SpringInfo *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double v24;
  CardAnimation *v25;
  double v26;
  double v27;
  CardAnimation *v28;
  CardAnimation *coordinatedUnitAnimation;
  CardAnimation *v30;
  objc_super v32;

  v8 = a8;
  v32.receiver = self;
  v32.super_class = (Class)CardAnimation;
  v14 = -[CardAnimation init](&v32, "init");
  v15 = v14;
  if (v14)
  {
    v14->_type = 1;
    v14->_typeParameters.spring.mass = a3;
    v14->_typeParameters.spring.stiffness = a4;
    v14->_typeParameters.spring.damping = a5;
    v14->_typeParameters.spring.initialVelocity = a6;
    v16 = -[SpringInfo initWithMass:stiffness:damping:initialVelocity:]([SpringInfo alloc], "initWithMass:stiffness:damping:initialVelocity:", a3, a4, a5, a6);
    -[SpringInfo settlingTime](v16, "settlingTime");
    v15->_duration = v17;
    v15->_delay = a7;
    if (v8)
    {
      -[SpringInfo undershootTime](v16, "undershootTime");
      v19 = v18;
      -[SpringInfo overshootTime](v16, "overshootTime");
      v21 = v20;
      if (v19 <= 0.0)
      {
        v23 = 0;
      }
      else
      {
        -[SpringInfo valueAtTime:](v16, "valueAtTime:", v19);
        v23 = v22 > 1.005;
      }
      if (v21 > 0.0)
      {
        -[SpringInfo valueAtTime:](v16, "valueAtTime:", v21);
        if (v24 < -0.005)
        {
          v25 = [CardAnimation alloc];
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
          v28 = -[CardAnimation initWithDuration:curve:delay:](v25, "initWithDuration:curve:delay:", 5, v26, v27);
          goto LABEL_14;
        }
      }
      if (v23)
      {
        v28 = -[CardAnimation initWithMass:stiffness:damping:initialVelocity:delay:calculateCoordinatedAnimation:]([CardAnimation alloc], "initWithMass:stiffness:damping:initialVelocity:delay:calculateCoordinatedAnimation:", 0, a3, a4, a5, 0.0, v19 + a7);
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
  CardAnimation *v6;
  CardAnimation *v7;
  CardAnimation *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CardAnimation;
  v6 = -[CardAnimation init](&v10, "init");
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

+ (CardAnimation)animationWithDuration:(double)a3 curve:(int64_t)a4 delay:(double)a5
{
  return (CardAnimation *)objc_msgSend(objc_alloc((Class)a1), "initWithDuration:curve:delay:", a4, a3, a5);
}

+ (CardAnimation)animationWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7
{
  return (CardAnimation *)objc_msgSend(objc_alloc((Class)a1), "initWithMass:stiffness:damping:initialVelocity:delay:", a3, a4, a5, a6, a7);
}

+ (id)animationUsingDefaultSpringWithInitialVelocity:(double)a3 delay:(double)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initUsingDefaultSpringWithInitialVelocity:delay:", a3, a4);
}

- (CardAnimation)coordinatedUnitAnimation
{
  if (self->_coordinatedUnitAnimation)
    self = self->_coordinatedUnitAnimation;
  return self;
}

- (void)applyWithAnimations:(id)a3 completion:(id)a4
{
  id v6;
  int64_t type;
  id v8;

  v8 = a3;
  v6 = a4;
  type = self->_type;
  switch(type)
  {
    case 2:
      +[UIView _animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:](UIView, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 2, v8, v6, self->_delay, self->_typeParameters.spring.mass);
      break;
    case 1:
      +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v8, v6, self->_duration, self->_delay, self->_typeParameters.spring.mass, self->_typeParameters.spring.stiffness, self->_typeParameters.spring.damping, self->_typeParameters.spring.initialVelocity);
      break;
    case 0:
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", (self->_typeParameters.basic.curve << 16) | 2, v8, v6, self->_duration, self->_delay);
      break;
  }

}

- (id)description
{
  int64_t type;
  NSString *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  type = self->_type;
  switch(type)
  {
    case 2:
      v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<DefaultSpringAnimation duration: %g, delay: %g, initialVelocity: %g>"), *(_QWORD *)&self->_duration, *(_QWORD *)&self->_delay, self->_typeParameters.basic.curve, v5, v6, v7);
      goto LABEL_7;
    case 1:
      v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<SpringAnimation duration: %g, delay: %g, mass: %g, stiffness: %g, damping: %g, initialVelocity: %g>"), *(_QWORD *)&self->_duration, *(_QWORD *)&self->_delay, self->_typeParameters.basic.curve, *(_QWORD *)&self->_typeParameters.spring.stiffness, *(_QWORD *)&self->_typeParameters.spring.damping, *(_QWORD *)&self->_typeParameters.spring.initialVelocity);
      goto LABEL_7;
    case 0:
      v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<BasicAnimation duration: %g, delay: %g, curve: %ld>"), *(_QWORD *)&self->_duration, *(_QWORD *)&self->_delay, self->_typeParameters.basic.curve, v5, v6, v7);
LABEL_7:
      a2 = (SEL)objc_claimAutoreleasedReturnValue(v3);
      break;
  }
  return (id)(id)a2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinatedUnitAnimation, 0);
}

@end
