@implementation OADVectorArcPathElement

- (OADVectorArcPathElement)initWithLeft:(OADAdjustCoord)a3 top:(OADAdjustCoord)a4 right:(OADAdjustCoord)a5 bottom:(OADAdjustCoord)a6 startVector:(OADAdjustPoint)a7 endVector:(OADAdjustPoint)a8 clockwise:(BOOL)a9 connectedToPrevious:(BOOL)a10
{
  OADAdjustCoord y;
  OADAdjustCoord x;
  OADVectorArcPathElement *result;
  objc_super v17;

  y = a7.y;
  x = a7.x;
  v17.receiver = self;
  v17.super_class = (Class)OADVectorArcPathElement;
  result = -[OADVectorArcPathElement init](&v17, sel_init);
  if (result)
  {
    result->mLeft = a3;
    result->mTop = a4;
    result->mRight = a5;
    result->mBottom = a6;
    result->mStartVector.x = x;
    result->mStartVector.y = y;
    result->mEndVector = a8;
    result->mClockwise = a9;
    result->mConnectedToPrevious = a10;
  }
  return result;
}

- (OADAdjustCoord)left
{
  return self->mLeft;
}

- (OADAdjustCoord)top
{
  return self->mTop;
}

- (OADAdjustCoord)right
{
  return self->mRight;
}

- (OADAdjustCoord)bottom
{
  return self->mBottom;
}

- (OADAdjustPoint)startVector
{
  OADAdjustPoint *p_mStartVector;
  OADAdjustCoord x;
  OADAdjustCoord y;
  OADAdjustPoint result;

  p_mStartVector = &self->mStartVector;
  x = self->mStartVector.x;
  y = p_mStartVector->y;
  result.y = y;
  result.x = x;
  return result;
}

- (OADAdjustPoint)endVector
{
  OADAdjustPoint *p_mEndVector;
  OADAdjustCoord x;
  OADAdjustCoord y;
  OADAdjustPoint result;

  p_mEndVector = &self->mEndVector;
  x = self->mEndVector.x;
  y = p_mEndVector->y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)clockwise
{
  return self->mClockwise;
}

- (BOOL)connectedToPrevious
{
  return self->mConnectedToPrevious;
}

@end
