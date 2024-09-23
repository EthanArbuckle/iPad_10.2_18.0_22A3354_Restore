@implementation _UIViewCubicTimingFunction

- (_UIViewCubicTimingFunction)initWithControlPoint1:(CGPoint)a3 controlPoint2:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  _UIViewCubicTimingFunction *result;
  objc_super v9;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewCubicTimingFunction;
  result = -[_UIViewCubicTimingFunction init](&v9, sel_init);
  result->_point1.x = v7;
  result->_point1.y = v6;
  result->_point2.x = x;
  result->_point2.y = y;
  return result;
}

- (_UIViewCubicTimingFunction)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UIViewCubicTimingFunction init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (CGPoint)controlPoint1
{
  double x;
  double y;
  CGPoint result;

  x = self->_point1.x;
  y = self->_point1.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)controlPoint2
{
  double x;
  double y;
  CGPoint result;

  x = self->_point2.x;
  y = self->_point2.y;
  result.y = y;
  result.x = x;
  return result;
}

- (id)_mediaTimingFunction
{
  CGFloat x;
  CGFloat y;
  CGFloat v4;
  CGFloat v5;

  x = self->_point1.x;
  y = self->_point1.y;
  *(float *)&x = x;
  *(float *)&y = y;
  v4 = self->_point2.x;
  v5 = self->_point2.y;
  *(float *)&v4 = v4;
  *(float *)&v5 = v5;
  return (id)objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", x, y, v4, v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithControlPoint1:controlPoint2:", self->_point1.x, self->_point1.y, self->_point2.x, self->_point2.y);
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
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_UIViewCubicTimingFunction controlPoint1](self, "controlPoint1");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v5, "controlPoint1");
    if (v7 == v11 && v9 == v10)
    {
      -[_UIViewCubicTimingFunction controlPoint2](self, "controlPoint2");
      v15 = v14;
      v17 = v16;
      objc_msgSend(v5, "controlPoint2");
      v13 = v17 == v19 && v15 == v18;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  double x;
  double y;
  id v6;

  x = self->_point1.x;
  y = self->_point1.y;
  v6 = a3;
  objc_msgSend(v6, "encodeCGPoint:forKey:", CFSTR("point1"), x, y);
  objc_msgSend(v6, "encodeCGPoint:forKey:", CFSTR("point2"), self->_point2.x, self->_point2.y);

}

- (_UIViewCubicTimingFunction)initWithCoder:(id)a3
{
  id v4;
  _UIViewCubicTimingFunction *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _UIViewCubicTimingFunction *v12;
  objc_super v14;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIViewCubicTimingFunction;
    v5 = -[_UIViewCubicTimingFunction init](&v14, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("point1"));
      v7 = v6;
      v9 = v8;
      objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("point2"));
      v5->_point1.x = v7;
      v5->_point1.y = v9;
      v5->_point2.x = v10;
      v5->_point2.y = v11;
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

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_point1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_point2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ point1 = %@ point2 = %@>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
