@implementation UISpringTimingParameters

- (UISpringTimingParameters)init
{
  UISpringTimingParameters *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UISpringTimingParameters;
  v2 = -[UISpringTimingParameters init](&v10, sel_init);
  v2->_implicitDuration = 1;
  _UILoadDefaultSpringParameters();
  v3 = _UIViewDefaultSpringStiffness;
  *(_QWORD *)&v2->_mass = _UIViewDefaultSpringMass;
  *(_QWORD *)&v2->_stiffness = v3;
  *(_QWORD *)&v2->_damping = _UIViewDefaultSpringDamping;
  v2->_initialVelocity.dx = 0.0;
  v2->_initialVelocity.dy = 0.0;
  -[UISpringTimingParameters mass](v2, "mass");
  v5 = v4;
  -[UISpringTimingParameters stiffness](v2, "stiffness");
  v7 = v6;
  -[UISpringTimingParameters damping](v2, "damping");
  +[UISpringTimingParameters _convertMass:stiffness:damping:toDampingRatio:response:](UISpringTimingParameters, "_convertMass:stiffness:damping:toDampingRatio:response:", &v2->_dampingRatio, 0, v5, v7, v8);
  return v2;
}

- (BOOL)implicitDuration
{
  return self->_implicitDuration;
}

- (int64_t)timingCurveType
{
  return 2;
}

- (UISpringTimingParameters)initWithMass:(CGFloat)mass stiffness:(CGFloat)stiffness damping:(CGFloat)damping initialVelocity:(CGVector)velocity
{
  CGFloat dy;
  CGFloat dx;
  UISpringTimingParameters *v11;
  objc_super v13;

  dy = velocity.dy;
  dx = velocity.dx;
  v13.receiver = self;
  v13.super_class = (Class)UISpringTimingParameters;
  v11 = -[UISpringTimingParameters init](&v13, sel_init);
  v11->_implicitDuration = 1;
  -[UISpringTimingParameters setMass:](v11, "setMass:", mass);
  -[UISpringTimingParameters setStiffness:](v11, "setStiffness:", stiffness);
  -[UISpringTimingParameters setDamping:](v11, "setDamping:", damping);
  v11->_initialVelocity.dx = dx;
  v11->_initialVelocity.dy = dy;
  +[UISpringTimingParameters _convertMass:stiffness:damping:toDampingRatio:response:](UISpringTimingParameters, "_convertMass:stiffness:damping:toDampingRatio:response:", &v11->_dampingRatio, 0, mass, stiffness, damping);
  return v11;
}

+ (void)_convertMass:(double)a3 stiffness:(double)a4 damping:(double)a5 toDampingRatio:(double *)a6 response:(double *)a7
{
  double v7;

  if (a6)
  {
    v7 = sqrt(a3 * a4);
    *a6 = a5 / (v7 + v7);
  }
  if (a7)
    *a7 = 6.28318531 / sqrt(a4 / a3);
}

- (void)setStiffness:(double)a3
{
  self->_stiffness = a3;
}

- (void)setMass:(double)a3
{
  self->_mass = a3;
}

- (void)setDamping:(double)a3
{
  self->_damping = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL4 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;

  v5 = -[UISpringTimingParameters implicitDuration](self, "implicitDuration");
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (v5)
  {
    -[UISpringTimingParameters mass](self, "mass");
    v8 = v7;
    -[UISpringTimingParameters stiffness](self, "stiffness");
    v10 = v9;
    -[UISpringTimingParameters damping](self, "damping");
    v12 = v11;
    -[UISpringTimingParameters initialVelocity](self, "initialVelocity");
    return (id)objc_msgSend(v6, "initWithMass:stiffness:damping:initialVelocity:", v8, v10, v12, v13, v14);
  }
  else
  {
    -[UISpringTimingParameters dampingRatio](self, "dampingRatio");
    v17 = v16;
    -[UISpringTimingParameters initialVelocity](self, "initialVelocity");
    return (id)objc_msgSend(v6, "initWithDampingRatio:initialVelocity:", v17, v18, v19);
  }
}

- (double)settlingDuration
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v3 = 0.0;
  if (!-[UISpringTimingParameters implicitDuration](self, "implicitDuration"))
    return v3;
  -[UISpringTimingParameters initialVelocity](self, "initialVelocity");
  v5 = v4;
  -[UISpringTimingParameters initialVelocity](self, "initialVelocity");
  v7 = v6;
  -[UISpringTimingParameters mass](self, "mass");
  v9 = v8;
  -[UISpringTimingParameters stiffness](self, "stiffness");
  v11 = v10;
  -[UISpringTimingParameters damping](self, "damping");
  v13 = v12;
  objc_opt_self();
  _durationOfSpringAnimation(v9, v11, v13, v7);
  v3 = v14;
  if (v5 == v7)
    return v3;
  -[UISpringTimingParameters mass](self, "mass");
  v16 = v15;
  -[UISpringTimingParameters stiffness](self, "stiffness");
  v18 = v17;
  -[UISpringTimingParameters damping](self, "damping");
  v20 = v19;
  objc_opt_self();
  _durationOfSpringAnimation(v16, v18, v20, v5);
  return fmax(v3, v21);
}

- (CGVector)initialVelocity
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_initialVelocity.dx;
  dy = self->_initialVelocity.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (double)stiffness
{
  return self->_stiffness;
}

- (double)mass
{
  return self->_mass;
}

- (double)damping
{
  return self->_damping;
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (UISpringTimingParameters)initWithDampingRatio:(CGFloat)ratio initialVelocity:(CGVector)velocity
{
  CGFloat dy;
  CGFloat dx;
  UISpringTimingParameters *result;
  objc_super v8;

  dy = velocity.dy;
  dx = velocity.dx;
  v8.receiver = self;
  v8.super_class = (Class)UISpringTimingParameters;
  result = -[UISpringTimingParameters init](&v8, sel_init);
  result->_implicitDuration = 0;
  result->_dampingRatio = ratio;
  result->_initialVelocity.dx = dx;
  result->_initialVelocity.dy = dy;
  result->_mass = 1.0;
  return result;
}

- (void)setImplicitDuration:(BOOL)a3
{
  self->_implicitDuration = a3;
}

- (UISpringTimingParameters)initWithDampingRatio:(CGFloat)ratio
{
  return -[UISpringTimingParameters initWithDampingRatio:initialVelocity:](self, "initWithDampingRatio:initialVelocity:", ratio, 0.0, 0.0);
}

+ (void)_convertDampingRatio:(double)a3 response:(double)a4 toMass:(double *)a5 stiffness:(double *)a6 damping:(double *)a7
{
  double v7;
  double v8;
  double v9;

  v7 = 6.28318531 / a4;
  if (a5)
    *a5 = 1.0;
  v8 = v7 * v7;
  if (a6)
    *a6 = v8;
  if (a7)
  {
    v9 = sqrt(v8);
    *a7 = (v9 + v9) * a3;
  }
}

- (id)_mediaTimingFunction
{
  return 0;
}

- (id)effectiveTimingFunction
{
  return 0;
}

- (id)description
{
  _BOOL4 v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;

  v3 = -[UISpringTimingParameters implicitDuration](self, "implicitDuration");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UISpringTimingParameters mass](self, "mass");
    v8 = v7;
    -[UISpringTimingParameters stiffness](self, "stiffness");
    v10 = v9;
    -[UISpringTimingParameters damping](self, "damping");
    v12 = v11;
    -[UISpringTimingParameters initialVelocity](self, "initialVelocity");
    v14 = v13;
    -[UISpringTimingParameters initialVelocity](self, "initialVelocity");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ (%p) mass=%.3f, stiffness=%.3f, damping=%.3f, velocity=(%.3f,%.3f)>"), v6, self, v8, v10, v12, v14, v15);
  }
  else
  {
    -[UISpringTimingParameters dampingRatio](self, "dampingRatio");
    v17 = v16;
    -[UISpringTimingParameters initialVelocity](self, "initialVelocity");
    v19 = v18;
    -[UISpringTimingParameters initialVelocity](self, "initialVelocity");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ (%p) dampingRatio=%.3f, velocity=(%.3f,%.3f)>"), v6, self, v17, v19, v20, v23, v24);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (UISpringTimingParameters)initWithVelocity:(CGVector)a3
{
  CGFloat dy;
  CGFloat dx;
  UISpringTimingParameters *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  dy = a3.dy;
  dx = a3.dx;
  v13.receiver = self;
  v13.super_class = (Class)UISpringTimingParameters;
  v5 = -[UISpringTimingParameters init](&v13, sel_init);
  v5->_implicitDuration = 1;
  _UILoadDefaultSpringParameters();
  v6 = _UIViewDefaultSpringStiffness;
  *(_QWORD *)&v5->_mass = _UIViewDefaultSpringMass;
  *(_QWORD *)&v5->_stiffness = v6;
  *(_QWORD *)&v5->_damping = _UIViewDefaultSpringDamping;
  v5->_initialVelocity.dx = dx;
  v5->_initialVelocity.dy = dy;
  -[UISpringTimingParameters mass](v5, "mass");
  v8 = v7;
  -[UISpringTimingParameters stiffness](v5, "stiffness");
  v10 = v9;
  -[UISpringTimingParameters damping](v5, "damping");
  +[UISpringTimingParameters _convertMass:stiffness:damping:toDampingRatio:response:](UISpringTimingParameters, "_convertMass:stiffness:damping:toDampingRatio:response:", &v5->_dampingRatio, 0, v8, v10, v11);
  return v5;
}

- (UISpringTimingParameters)initWithDampingRatio:(double)a3 response:(double)a4 initialVelocity:(CGVector)a5
{
  double dy;
  double dx;
  double v9;
  double v10;
  double v11;

  dy = a5.dy;
  dx = a5.dx;
  v10 = 0.0;
  v11 = 0.0;
  v9 = 0.0;
  +[UISpringTimingParameters _convertDampingRatio:response:toMass:stiffness:damping:](UISpringTimingParameters, "_convertDampingRatio:response:toMass:stiffness:damping:", &v11, &v10, &v9, a3, a4);
  return -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:](self, "initWithMass:stiffness:damping:initialVelocity:", v11, v10, v9, dx, dy);
}

- (UISpringTimingParameters)initWithDampingRatio:(double)a3 response:(double)a4
{
  return -[UISpringTimingParameters initWithDampingRatio:response:initialVelocity:](self, "initWithDampingRatio:response:initialVelocity:", a3, a4, 0.0, 0.0);
}

- (UISpringTimingParameters)initWithDuration:(NSTimeInterval)duration bounce:(CGFloat)bounce initialVelocity:(CGVector)velocity
{
  CGFloat dy;
  CGFloat dx;
  UISpringTimingParameters *v9;
  double v11;
  objc_super v12;

  dy = velocity.dy;
  dx = velocity.dx;
  v12.receiver = self;
  v12.super_class = (Class)UISpringTimingParameters;
  v9 = -[UISpringTimingParameters init](&v12, sel_init);
  v11 = 0.0;
  +[UISpringTimingParameters _convertBounce:toDampingRatio:](UISpringTimingParameters, "_convertBounce:toDampingRatio:", &v11, bounce);
  +[UISpringTimingParameters _convertDampingRatio:response:toMass:stiffness:damping:](UISpringTimingParameters, "_convertDampingRatio:response:toMass:stiffness:damping:", &v9->_mass, &v9->_stiffness, &v9->_damping, v11, duration);
  v9->_implicitDuration = 1;
  v9->_initialVelocity.dx = dx;
  v9->_initialVelocity.dy = dy;
  return v9;
}

- (UISpringTimingParameters)initWithDuration:(NSTimeInterval)duration bounce:(CGFloat)bounce
{
  return -[UISpringTimingParameters initWithDuration:bounce:initialVelocity:](self, "initWithDuration:bounce:initialVelocity:", duration, bounce, 0.0, 0.0);
}

- (UISpringTimingParameters)initWithParameters:(id)a3 initialVelocity:(CGVector)a4
{
  double dy;
  double dx;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;

  dy = a4.dy;
  dx = a4.dx;
  v7 = a3;
  objc_msgSend(v7, "_dampingRatio");
  v9 = v8;
  objc_msgSend(v7, "_response");
  v11 = v10;

  return -[UISpringTimingParameters initWithDampingRatio:response:initialVelocity:](self, "initWithDampingRatio:response:initialVelocity:", v9, v11, dx, dy);
}

- (UISpringTimingParameters)initWithParameters:(id)a3
{
  return -[UISpringTimingParameters initWithParameters:initialVelocity:](self, "initWithParameters:initialVelocity:", a3, 0.0, 0.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[UISpringTimingParameters implicitDuration](self, "implicitDuration"))
    {
      -[UISpringTimingParameters mass](self, "mass");
      v7 = v6;
      objc_msgSend(v5, "mass");
      if (v7 != v8)
        goto LABEL_11;
      -[UISpringTimingParameters stiffness](self, "stiffness");
      v10 = v9;
      objc_msgSend(v5, "stiffness");
      if (v10 != v11)
        goto LABEL_11;
      -[UISpringTimingParameters damping](self, "damping");
      v13 = v12;
      objc_msgSend(v5, "damping");
    }
    else
    {
      -[UISpringTimingParameters dampingRatio](self, "dampingRatio");
      v13 = v16;
      objc_msgSend(v5, "dampingRatio");
    }
    if (v13 == v14)
    {
      -[UISpringTimingParameters initialVelocity](self, "initialVelocity");
      v18 = v17;
      objc_msgSend(v5, "initialVelocity");
      if (v18 == v19)
      {
        -[UISpringTimingParameters initialVelocity](self, "initialVelocity");
        v21 = v20;
        objc_msgSend(v5, "initialVelocity");
        v15 = v21 == v22;
LABEL_12:

        goto LABEL_13;
      }
    }
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (UICubicTimingParameters)cubicTimingParameters
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  const __CFString *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[UISpringTimingParameters implicitDuration](self, "implicitDuration"), CFSTR("implicitDuration"));
  if (-[UISpringTimingParameters implicitDuration](self, "implicitDuration"))
  {
    -[UISpringTimingParameters mass](self, "mass");
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("mass"));
    -[UISpringTimingParameters stiffness](self, "stiffness");
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("stiffness"));
    -[UISpringTimingParameters damping](self, "damping");
    v4 = CFSTR("damping");
  }
  else
  {
    -[UISpringTimingParameters dampingRatio](self, "dampingRatio");
    v4 = CFSTR("dampingRatio");
  }
  objc_msgSend(v5, "encodeDouble:forKey:", v4);
  -[UISpringTimingParameters initialVelocity](self, "initialVelocity");
  objc_msgSend(v5, "encodeCGVector:forKey:", CFSTR("velocity"));

}

- (UISpringTimingParameters)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UISpringTimingParameters *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UISpringTimingParameters *v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v17;

  v4 = coder;
  if (-[NSCoder allowsKeyedCoding](v4, "allowsKeyedCoding"))
  {
    v17.receiver = self;
    v17.super_class = (Class)UISpringTimingParameters;
    v5 = -[UISpringTimingParameters init](&v17, sel_init);
    if (v5)
    {
      v6 = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("implicitDuration"));
      v5->_implicitDuration = v6;
      if (v6)
      {
        -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("mass"));
        -[UISpringTimingParameters setMass:](v5, "setMass:");
        -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("stiffness"));
        -[UISpringTimingParameters setStiffness:](v5, "setStiffness:");
        -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("damping"));
        -[UISpringTimingParameters setDamping:](v5, "setDamping:");
        -[UISpringTimingParameters mass](v5, "mass");
        v8 = v7;
        -[UISpringTimingParameters stiffness](v5, "stiffness");
        v10 = v9;
        -[UISpringTimingParameters damping](v5, "damping");
        +[UISpringTimingParameters _convertMass:stiffness:damping:toDampingRatio:response:](UISpringTimingParameters, "_convertMass:stiffness:damping:toDampingRatio:response:", &v5->_dampingRatio, 0, v8, v10, v11);
      }
      else
      {
        -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("dampingRatio"));
        v5->_dampingRatio = v13;
      }
      -[NSCoder decodeCGVectorForKey:](v4, "decodeCGVectorForKey:", CFSTR("velocity"));
      v5->_initialVelocity.dx = v14;
      v5->_initialVelocity.dy = v15;
    }
    self = v5;
    v12 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ only supports keyed coding."), objc_opt_class());
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)_convertBounce:(double)a3 toDampingRatio:(double *)a4
{
  double v4;

  if (a4)
  {
    if (a3 >= 0.0)
      v4 = 1.0 - a3;
    else
      v4 = 1.0 / (a3 + 1.0);
    *a4 = v4;
  }
}

@end
