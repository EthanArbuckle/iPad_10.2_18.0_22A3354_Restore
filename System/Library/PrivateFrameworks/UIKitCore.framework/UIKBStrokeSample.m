@implementation UIKBStrokeSample

- (UIKBStrokeSample)initWithPoint:(CGPoint)a3 timestamp:(double)a4
{
  double y;
  double x;
  UIKBStrokeSample *v7;
  UIKBStrokeSample *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)UIKBStrokeSample;
  v7 = -[UIKBStrokeSample init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[UIKBStrokeSample setPoint:](v7, "setPoint:", x, y);
    -[UIKBStrokeSample setTimestamp:](v8, "setTimestamp:", a4);
  }
  return v8;
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->_point.x;
  y = self->_point.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->_point = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end
