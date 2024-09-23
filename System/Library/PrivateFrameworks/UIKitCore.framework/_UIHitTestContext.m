@implementation _UIHitTestContext

- (_UIHitTestContext)initWithPoint:(CGPoint)a3 radius:(double)a4
{
  CGFloat y;
  CGFloat x;
  _UIHitTestContext *result;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)_UIHitTestContext;
  result = -[_UIHitTestContext init](&v8, sel_init);
  if (result)
  {
    result->_point.x = x;
    result->_point.y = y;
    result->_radius = a4;
  }
  return result;
}

+ (id)contextWithPoint:(CGPoint)a3 radius:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPoint:radius:", a3.x, a3.y, a4);
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

- (double)radius
{
  return self->_radius;
}

@end
