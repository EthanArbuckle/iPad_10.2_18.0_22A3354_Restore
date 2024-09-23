@implementation OADQuadBezierControlPointPathElement

- (OADQuadBezierControlPointPathElement)initWithControlPoint:(OADAdjustPoint)a3
{
  OADAdjustCoord y;
  OADAdjustCoord x;
  OADQuadBezierControlPointPathElement *result;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)OADQuadBezierControlPointPathElement;
  result = -[OADQuadBezierControlPointPathElement init](&v6, sel_init);
  if (result)
  {
    result->mControlPoint.x = x;
    result->mControlPoint.y = y;
  }
  return result;
}

- (OADAdjustPoint)controlPoint
{
  OADAdjustPoint *p_mControlPoint;
  OADAdjustCoord x;
  OADAdjustCoord y;
  OADAdjustPoint result;

  p_mControlPoint = &self->mControlPoint;
  x = self->mControlPoint.x;
  y = p_mControlPoint->y;
  result.y = y;
  result.x = x;
  return result;
}

@end
