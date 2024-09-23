@implementation OADArcToPathElement

- (OADArcToPathElement)initWithSemiaxes:(OADAdjustPoint)a3 startAngle:(OADAdjustCoord)a4 angleLength:(OADAdjustCoord)a5
{
  OADAdjustCoord y;
  OADAdjustCoord x;
  OADArcToPathElement *result;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)OADArcToPathElement;
  result = -[OADArcToPathElement init](&v10, sel_init);
  if (result)
  {
    result->mSemiaxes.x = x;
    result->mSemiaxes.y = y;
    result->mStartAngle = a4;
    result->mAngleLength = a5;
  }
  return result;
}

- (OADAdjustPoint)semiaxes
{
  OADAdjustPoint *p_mSemiaxes;
  OADAdjustCoord x;
  OADAdjustCoord y;
  OADAdjustPoint result;

  p_mSemiaxes = &self->mSemiaxes;
  x = self->mSemiaxes.x;
  y = p_mSemiaxes->y;
  result.y = y;
  result.x = x;
  return result;
}

- (OADAdjustCoord)startAngle
{
  return self->mStartAngle;
}

- (OADAdjustCoord)angleLength
{
  return self->mAngleLength;
}

@end
