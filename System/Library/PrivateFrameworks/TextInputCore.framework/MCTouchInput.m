@implementation MCTouchInput

- (MCTouchInput)initWithTouchPoint:(CGPoint)a3 radius:(double)a4 timestamp:(double)a5
{
  CGFloat y;
  CGFloat x;
  MCTouchInput *result;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)MCTouchInput;
  result = -[MCKeyboardInput init](&v10, sel_init);
  if (result)
  {
    result->_touchPoint.x = x;
    result->_touchPoint.y = y;
    result->_radius = a4;
    result->_timestamp = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCTouchInput;
  result = -[MCKeyboardInput copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
  {
    *((_OWORD *)result + 3) = self->_touchPoint;
    *((_QWORD *)result + 4) = *(_QWORD *)&self->_radius;
    *((_QWORD *)result + 5) = *(_QWORD *)&self->_timestamp;
  }
  return result;
}

- (BOOL)canComposeNew:(id)a3
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSPoint v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MCTouchInput touchPoint](self, "touchPoint");
  NSStringFromPoint(v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCTouchInput radius](self, "radius");
  v6 = v5;
  -[MCTouchInput timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("point=%@, radius=%lf, timestamp=%lf"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)shortDescriptionWithLeadingString:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MCTouchInput touchPoint](self, "touchPoint", a3);
  v6 = v5;
  -[MCTouchInput touchPoint](self, "touchPoint");
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("(%.2f, %.2f)"), v6, v7);
}

- (CGPoint)touchPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_touchPoint.x;
  y = self->_touchPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)radius
{
  return self->_radius;
}

- (double)timestamp
{
  return self->_timestamp;
}

@end
