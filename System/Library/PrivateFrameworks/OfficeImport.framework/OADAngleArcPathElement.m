@implementation OADAngleArcPathElement

- (OADAngleArcPathElement)initWithCenter:(OADAdjustPoint)a3 semiaxes:(OADAdjustPoint)a4 startAngle:(OADAdjustCoord)a5 angleLength:(OADAdjustCoord)a6 connectedToPrevious:(BOOL)a7
{
  OADAdjustCoord y;
  OADAdjustCoord x;
  OADAdjustCoord v11;
  OADAdjustCoord v12;
  OADAngleArcPathElement *result;
  objc_super v14;

  y = a4.y;
  x = a4.x;
  v11 = a3.y;
  v12 = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)OADAngleArcPathElement;
  result = -[OADAngleArcPathElement init](&v14, sel_init);
  if (result)
  {
    result->mCenter.x = v12;
    result->mCenter.y = v11;
    result->mSemiaxes.x = x;
    result->mSemiaxes.y = y;
    result->mStartAngle = a5;
    result->mAngleLength = a6;
    result->mConnectedToPrevious = a7;
  }
  return result;
}

- (OADAdjustPoint)center
{
  OADAdjustPoint *p_mCenter;
  OADAdjustCoord x;
  OADAdjustCoord y;
  OADAdjustPoint result;

  p_mCenter = &self->mCenter;
  x = self->mCenter.x;
  y = p_mCenter->y;
  result.y = y;
  result.x = x;
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

- (BOOL)connectedToPrevious
{
  return self->mConnectedToPrevious;
}

@end
