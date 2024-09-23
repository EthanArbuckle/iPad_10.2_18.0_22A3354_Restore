@implementation OADCubicBezierToPathElement

- (OADCubicBezierToPathElement)initWithControlPoint1:(OADAdjustPoint)a3 controlPoint2:(OADAdjustPoint)a4 toPoint:(OADAdjustPoint)a5
{
  OADAdjustCoord y;
  OADAdjustCoord x;
  OADAdjustCoord v7;
  OADAdjustCoord v8;
  OADAdjustCoord v9;
  OADAdjustCoord v10;
  OADCubicBezierToPathElement *result;
  objc_super v12;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)OADCubicBezierToPathElement;
  result = -[OADCubicBezierToPathElement init](&v12, sel_init);
  if (result)
  {
    result->mControlPoint1.x = v10;
    result->mControlPoint1.y = v9;
    result->mControlPoint2.x = v8;
    result->mControlPoint2.y = v7;
    result->mToPoint.x = x;
    result->mToPoint.y = y;
  }
  return result;
}

- (void)setRelative:(BOOL)a3
{
  self->mRelative = a3;
}

- (OADAdjustPoint)toPoint
{
  OADAdjustPoint *p_mToPoint;
  OADAdjustCoord x;
  OADAdjustCoord y;
  OADAdjustPoint result;

  p_mToPoint = &self->mToPoint;
  x = self->mToPoint.x;
  y = p_mToPoint->y;
  result.y = y;
  result.x = x;
  return result;
}

- (OADAdjustPoint)controlPoint1
{
  OADAdjustPoint *p_mControlPoint1;
  OADAdjustCoord x;
  OADAdjustCoord y;
  OADAdjustPoint result;

  p_mControlPoint1 = &self->mControlPoint1;
  x = self->mControlPoint1.x;
  y = p_mControlPoint1->y;
  result.y = y;
  result.x = x;
  return result;
}

- (OADAdjustPoint)controlPoint2
{
  OADAdjustPoint *p_mControlPoint2;
  OADAdjustCoord x;
  OADAdjustCoord y;
  OADAdjustPoint result;

  p_mControlPoint2 = &self->mControlPoint2;
  x = self->mControlPoint2.x;
  y = p_mControlPoint2->y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)relative
{
  return self->mRelative;
}

@end
