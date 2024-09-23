@implementation PXFloatingCardAnimation

- (PXFloatingCardAnimation)initWithDuration:(double)a3 curve:(int64_t)a4 delay:(double)a5
{
  PXFloatingCardAnimation *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXFloatingCardAnimation;
  result = -[PXFloatingCardAnimation init](&v9, sel_init);
  if (result)
  {
    result->_type = 0;
    result->_typeParameters.basic.curve = a4;
    result->_duration = a3;
    result->_delay = a5;
  }
  return result;
}

- (PXFloatingCardAnimation)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7
{
  return -[PXFloatingCardAnimation initWithMass:stiffness:damping:initialVelocity:delay:calculateCoordinatedAnimation:](self, "initWithMass:stiffness:damping:initialVelocity:delay:calculateCoordinatedAnimation:", 1, a3, a4, a5, a6, a7);
}

- (PXFloatingCardAnimation)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(double)a6 delay:(double)a7 calculateCoordinatedAnimation:(BOOL)a8
{
  _BOOL4 v8;
  PXFloatingCardAnimation *v14;
  PXFloatingCardAnimation *v15;
  PXFloatingCardSpringInfo *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double v24;
  PXFloatingCardAnimation *v25;
  double v26;
  double v27;
  PXFloatingCardAnimation *v28;
  PXFloatingCardAnimation *coordinatedUnitAnimation;
  objc_super v31;

  v8 = a8;
  v31.receiver = self;
  v31.super_class = (Class)PXFloatingCardAnimation;
  v14 = -[PXFloatingCardAnimation init](&v31, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = 1;
    v14->_typeParameters.spring.mass = a3;
    v14->_typeParameters.spring.stiffness = a4;
    v14->_typeParameters.spring.damping = a5;
    v14->_typeParameters.spring.initialVelocity = a6;
    v16 = -[PXFloatingCardSpringInfo initWithMass:stiffness:damping:initialVelocity:]([PXFloatingCardSpringInfo alloc], "initWithMass:stiffness:damping:initialVelocity:", a3, a4, a5, a6);
    -[PXFloatingCardSpringInfo settlingTime](v16, "settlingTime");
    v15->_duration = v17;
    v15->_delay = a7;
    if (v8)
    {
      -[PXFloatingCardSpringInfo undershootTime](v16, "undershootTime");
      v19 = v18;
      -[PXFloatingCardSpringInfo overshootTime](v16, "overshootTime");
      v21 = v20;
      if (v19 <= 0.0)
      {
        v23 = 0;
      }
      else
      {
        -[PXFloatingCardSpringInfo valueAtTime:](v16, "valueAtTime:", v19);
        v23 = v22 > 1.005;
      }
      if (v21 > 0.0)
      {
        -[PXFloatingCardSpringInfo valueAtTime:](v16, "valueAtTime:", v21);
        if (v24 < -0.005)
        {
          v25 = [PXFloatingCardAnimation alloc];
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
          v28 = -[PXFloatingCardAnimation initWithDuration:curve:delay:](v25, "initWithDuration:curve:delay:", 5, v26, v27);
          goto LABEL_14;
        }
      }
      if (v23)
      {
        v28 = -[PXFloatingCardAnimation initWithMass:stiffness:damping:initialVelocity:delay:calculateCoordinatedAnimation:]([PXFloatingCardAnimation alloc], "initWithMass:stiffness:damping:initialVelocity:delay:calculateCoordinatedAnimation:", 0, a3, a4, a5, 0.0, v19 + a7);
LABEL_14:
        coordinatedUnitAnimation = v15->_coordinatedUnitAnimation;
        v15->_coordinatedUnitAnimation = v28;

      }
    }

  }
  return v15;
}

- (id)initUsingDefaultSpringWithInitialVelocity:(double)a3 delay:(double)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXFloatingCardAnimation;
  result = -[PXFloatingCardAnimation init](&v7, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = 2;
    *((double *)result + 2) = a3;
    *((double *)result + 7) = a4;
  }
  return result;
}

- (PXFloatingCardAnimation)coordinatedUnitAnimation
{
  if (self->_coordinatedUnitAnimation)
    self = self->_coordinatedUnitAnimation;
  return self;
}

- (void)applyAnimations:(id)a3 completion:(id)a4
{
  id v6;
  unint64_t type;
  unint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  type = self->_type;
  switch(type)
  {
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 2, v10, v6, self->_delay, self->_typeParameters.spring.mass);
      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v10, v6, self->_duration, self->_delay, self->_typeParameters.spring.mass, self->_typeParameters.spring.stiffness, self->_typeParameters.spring.damping, self->_typeParameters.spring.initialVelocity);
      break;
    case 0uLL:
      v8 = self->_typeParameters.basic.curve - 1;
      if (v8 >= 3)
        v9 = 2;
      else
        v9 = (v8 << 16) + 65538;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", v9, v10, v6, self->_duration, self->_delay);
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<DefaultSpringAnimation duration: %g, delay: %g, initialVelocity: %g>"), *(_QWORD *)&self->_duration, *(_QWORD *)&self->_delay, self->_typeParameters.basic.curve, v4, v5, v6);
      goto LABEL_7;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<SpringAnimation duration: %g, delay: %g, mass: %g, stiffness: %g, damping: %g, initialVelocity: %g>"), *(_QWORD *)&self->_duration, *(_QWORD *)&self->_delay, self->_typeParameters.basic.curve, *(_QWORD *)&self->_typeParameters.spring.stiffness, *(_QWORD *)&self->_typeParameters.spring.damping, *(_QWORD *)&self->_typeParameters.spring.initialVelocity);
      goto LABEL_7;
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<BasicAnimation duration: %g, delay: %g, curve: %ld>"), *(_QWORD *)&self->_duration, *(_QWORD *)&self->_delay, self->_typeParameters.basic.curve, v4, v5, v6);
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
  return (id)objc_msgSend(a1, "animationWithMass:stiffness:damping:initialVelocity:delay:", 1.0, dbl_1A7C0C230[a3 > 4.0], dbl_1A7C0C240[a3 > 4.0]);
}

@end
