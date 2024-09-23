@implementation SPCCurvePoint

- (SPCCurvePoint)initWithX:(double)a3 y:(double)a4
{
  SPCCurvePoint *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SPCCurvePoint;
  result = -[SPCCurvePoint init](&v7, sel_init);
  if (result)
  {
    result->_x = a3;
    result->_y = a4;
  }
  return result;
}

- (void)setCGPoint:(CGPoint)a3
{
  *(CGPoint *)&self->_x = a3;
}

- (CGPoint)CGPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_x;
  y = self->_y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (CGPoint)leftTangentPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_leftTangentPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setLeftTangentPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_leftTangentPoint, &v3, 16, 1, 0);
}

- (CGPoint)rightTangentPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_rightTangentPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setRightTangentPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_rightTangentPoint, &v3, 16, 1, 0);
}

- (double)roundness
{
  return self->_roundness;
}

- (void)setRoundness:(double)a3
{
  self->_roundness = a3;
}

- (double)smoothness
{
  return self->_smoothness;
}

- (void)setSmoothness:(double)a3
{
  self->_smoothness = a3;
}

+ (id)pointWithX:(double)a3 y:(double)a4
{
  return -[SPCCurvePoint initWithX:y:]([SPCCurvePoint alloc], "initWithX:y:", a3, a4);
}

@end
