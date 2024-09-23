@implementation OADToPointPathElement

- (OADToPointPathElement)initWithToPoint:(OADAdjustPoint)a3
{
  OADAdjustCoord y;
  OADAdjustCoord x;
  OADToPointPathElement *result;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)OADToPointPathElement;
  result = -[OADToPointPathElement init](&v6, sel_init);
  if (result)
  {
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

- (BOOL)relative
{
  return self->mRelative;
}

@end
