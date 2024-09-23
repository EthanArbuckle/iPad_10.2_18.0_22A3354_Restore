@implementation UICubicTimingParameters

- (int64_t)timingCurveType
{
  if (self->_animationCurve == 6)
    return 1;
  if (self->_springTimingParameters)
    return 3;
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UICubicTimingParameters *v4;
  UICubicTimingParameters *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = self;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  if (-[UICubicTimingParameters timingCurveType](v4, "timingCurveType"))
  {
    v6 = -[UICubicTimingParameters timingCurveType](v5, "timingCurveType");

    if (v6 != 3)
    {
LABEL_4:
      v7 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
      -[UICubicTimingParameters controlPoint1](v5, "controlPoint1");
      v9 = v8;
      v11 = v10;
      -[UICubicTimingParameters controlPoint2](v5, "controlPoint2");
      return (id)objc_msgSend(v7, "initWithControlPoint1:controlPoint2:", v9, v11, v12, v13);
    }
  }
  else
  {

  }
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAnimationCurve:", -[UICubicTimingParameters animationCurve](v5, "animationCurve"));
}

- (UIViewAnimationCurve)animationCurve
{
  return self->_animationCurve;
}

- (UICubicTimingParameters)init
{
  UICubicTimingParameters *v2;
  uint64_t v3;
  _UIViewCubicTimingFunction *timingFunction;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UICubicTimingParameters;
  v2 = -[UICubicTimingParameters init](&v6, sel_init);
  v2->_animationCurve = 5;
  -[UICubicTimingParameters effectiveTimingFunction](v2, "effectiveTimingFunction");
  v3 = objc_claimAutoreleasedReturnValue();
  timingFunction = v2->_timingFunction;
  v2->_timingFunction = (_UIViewCubicTimingFunction *)v3;

  return v2;
}

- (UICubicTimingParameters)initWithAnimationCurve:(UIViewAnimationCurve)curve
{
  UICubicTimingParameters *v4;
  UISpringTimingParameters *v5;
  UISpringTimingParameters *springTimingParameters;
  uint64_t v7;
  _UIViewCubicTimingFunction *timingFunction;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UICubicTimingParameters;
  v4 = -[UICubicTimingParameters init](&v10, sel_init);
  if (curve == (UIViewAnimationCurveLinear|0x4))
  {
    v5 = objc_alloc_init(UISpringTimingParameters);
    springTimingParameters = v4->_springTimingParameters;
    v4->_springTimingParameters = v5;

    if ((dyld_program_sdk_at_least() & 1) == 0)
      -[UISpringTimingParameters setImplicitDuration:](v4->_springTimingParameters, "setImplicitDuration:", 0);
  }
  v4->_animationCurve = curve;
  -[UICubicTimingParameters effectiveTimingFunction](v4, "effectiveTimingFunction");
  v7 = objc_claimAutoreleasedReturnValue();
  timingFunction = v4->_timingFunction;
  v4->_timingFunction = (_UIViewCubicTimingFunction *)v7;

  return v4;
}

- (id)effectiveTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;
  _UIViewCubicTimingFunction *timingFunction;
  _UIViewCubicTimingFunction *v7;
  int64_t animationCurve;
  id *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  float v15;
  float v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  timingFunction = self->_timingFunction;
  if (timingFunction)
  {
    v7 = timingFunction;
  }
  else
  {
    animationCurve = self->_animationCurve;
    v9 = (id *)MEMORY[0x1E0CD3048];
    switch(animationCurve)
    {
      case 0:
        goto LABEL_10;
      case 1:
        v9 = (id *)MEMORY[0x1E0CD3040];
        goto LABEL_10;
      case 2:
        v9 = (id *)MEMORY[0x1E0CD3050];
        goto LABEL_10;
      case 3:
      case 7:
        v9 = (id *)MEMORY[0x1E0CD3058];
        goto LABEL_10;
      case 4:
        LODWORD(v2) = 1059648963;
        LODWORD(v4) = 1051260355;
        LODWORD(v3) = 0;
        LODWORD(v5) = 1.0;
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v2, v3, v4, v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 5:
        v9 = (id *)MEMORY[0x1E0CD3038];
LABEL_10:
        v11 = *v9;
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unknown/Unsupported UIViewAnimationCurve type %ld"), animationCurve);
        v10 = 0;
        break;
    }
    objc_msgSend(v10, "getControlPointAtIndex:values:", 1, &v15);
    v12 = v15;
    v13 = v16;
    objc_msgSend(v10, "getControlPointAtIndex:values:", 2, &v15);
    v7 = -[_UIViewCubicTimingFunction initWithControlPoint1:controlPoint2:]([_UIViewCubicTimingFunction alloc], "initWithControlPoint1:controlPoint2:", v12, v13, v15, v16);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springTimingParameters, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

- (UICubicTimingParameters)initWithControlPoint1:(CGPoint)point1 controlPoint2:(CGPoint)point2
{
  double y;
  double x;
  double v6;
  double v7;
  UICubicTimingParameters *v8;
  _UIViewCubicTimingFunction *v9;
  _UIViewCubicTimingFunction *timingFunction;
  objc_super v12;

  y = point2.y;
  x = point2.x;
  v6 = point1.y;
  v7 = point1.x;
  v12.receiver = self;
  v12.super_class = (Class)UICubicTimingParameters;
  v8 = -[UICubicTimingParameters init](&v12, sel_init);
  v8->_animationCurve = 6;
  v9 = -[_UIViewCubicTimingFunction initWithControlPoint1:controlPoint2:]([_UIViewCubicTimingFunction alloc], "initWithControlPoint1:controlPoint2:", v7, v6, x, y);
  timingFunction = v8->_timingFunction;
  v8->_timingFunction = v9;

  return v8;
}

- (UICubicTimingParameters)initWithCustomCurve:(id)a3
{
  id v4;
  double v5;
  double v6;
  float v8;
  float v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "getControlPointAtIndex:values:", 1, &v8);
  v5 = v8;
  v6 = v9;
  objc_msgSend(v4, "getControlPointAtIndex:values:", 2, &v8);

  return -[UICubicTimingParameters initWithControlPoint1:controlPoint2:](self, "initWithControlPoint1:controlPoint2:", v5, v6, v8, v9);
}

- (UISpringTimingParameters)springTimingParameters
{
  return self->_springTimingParameters;
}

- (CGPoint)controlPoint1
{
  double v2;
  double v3;
  CGPoint result;

  -[_UIViewCubicTimingFunction controlPoint1](self->_timingFunction, "controlPoint1");
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)controlPoint2
{
  double v2;
  double v3;
  CGPoint result;

  -[_UIViewCubicTimingFunction controlPoint2](self->_timingFunction, "controlPoint2");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_setAnimationCurve:(int64_t)a3
{
  self->_animationCurve = a3;
}

- (id)_mediaTimingFunction
{
  return -[_UIViewCubicTimingFunction _mediaTimingFunction](self->_timingFunction, "_mediaTimingFunction");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  UIViewAnimationCurve v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[UICubicTimingParameters timingCurveType](self, "timingCurveType") == 1)
    {
      -[UICubicTimingParameters timingFunction](self, "timingFunction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timingFunction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v9 = -[UICubicTimingParameters animationCurve](self, "animationCurve");
      v8 = v9 == objc_msgSend(v5, "animationCurve");
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[UICubicTimingParameters timingCurveType](self, "timingCurveType"), CFSTR("curveType"));
  if (-[UICubicTimingParameters timingCurveType](self, "timingCurveType") == 1)
  {
    -[UICubicTimingParameters timingFunction](self, "timingFunction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("timingFunction"));

  }
  else
  {
    objc_msgSend(v5, "encodeInteger:forKey:", -[UICubicTimingParameters animationCurve](self, "animationCurve"), CFSTR("animationCurve"));
  }

}

- (UICubicTimingParameters)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UICubicTimingParameters *v5;
  uint64_t v6;
  _UIViewCubicTimingFunction *timingFunction;
  UICubicTimingParameters *v8;
  uint64_t v9;
  _UIViewCubicTimingFunction *v10;
  uint64_t v11;
  _UIViewCubicTimingFunction *v12;
  objc_super v14;

  v4 = coder;
  if (-[NSCoder allowsKeyedCoding](v4, "allowsKeyedCoding"))
  {
    v14.receiver = self;
    v14.super_class = (Class)UICubicTimingParameters;
    v5 = -[UICubicTimingParameters init](&v14, sel_init);
    if (v5)
    {
      if (-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("curveType")) == 1)
      {
        -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("timingFunction"));
        v6 = objc_claimAutoreleasedReturnValue();
        timingFunction = v5->_timingFunction;
        v5->_timingFunction = (_UIViewCubicTimingFunction *)v6;

        v5->_animationCurve = 6;
      }
      else
      {
        v9 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("animationCurve"));
        v10 = v5->_timingFunction;
        v5->_timingFunction = 0;
        v5->_animationCurve = v9;

        -[UICubicTimingParameters effectiveTimingFunction](v5, "effectiveTimingFunction");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v5->_timingFunction;
        v5->_timingFunction = (_UIViewCubicTimingFunction *)v11;

      }
    }
    self = v5;
    v8 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ only supports keyed coding."), objc_opt_class());
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  int64_t v3;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  UIViewAnimationCurve v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  uint64_t v15;

  if (!-[UICubicTimingParameters timingCurveType](self, "timingCurveType"))
  {
    v8 = -[UICubicTimingParameters animationCurve](self, "animationCurve");
    if ((unint64_t)v8 > 5)
      v9 = CFSTR("unknown");
    else
      v9 = off_1E16B47C8[v8];
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@ (%p) builtin type = %@>"), v7, self, v9);
    goto LABEL_9;
  }
  v3 = -[UICubicTimingParameters timingCurveType](self, "timingCurveType");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3 == 3)
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ (%p) builtin type = smooth>"), v6, self, v15);
LABEL_9:
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[UICubicTimingParameters timingFunction](self, "timingFunction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ (%p) timing function = %@>"), v7, self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v11;
}

- (_UIViewCubicTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setSpringTimingParameters:(id)a3
{
  objc_storeStrong((id *)&self->_springTimingParameters, a3);
}

@end
