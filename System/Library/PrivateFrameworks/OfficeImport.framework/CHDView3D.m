@implementation CHDView3D

- (CHDView3D)init
{
  CHDView3D *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDView3D;
  result = -[CHDView3D init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->mRotationX = xmmword_22A4C1950;
    *(_QWORD *)&result->mHeightPercent = 0x1EFFFFFFFFLL;
    *(_WORD *)&result->mRightAngleAxes = 256;
    result->mAutoscale = 1;
  }
  return result;
}

- (void)setRotationX:(int)a3
{
  self->mRotationX = a3;
}

- (void)setRotationY:(int)a3
{
  self->mRotationY = a3;
}

- (void)setPerspective:(int)a3
{
  self->mPerspective = a3;
}

- (void)setRightAngleAxes:(BOOL)a3
{
  self->mRightAngleAxes = a3;
}

- (void)setDepthPercent:(int)a3
{
  self->mDepthPercent = a3;
}

- (void)setGapDepthPercent:(int)a3
{
  self->mGapDepthPercent = a3;
}

- (void)setHeightPercent:(int)a3
{
  self->mHeightPercent = a3;
}

- (void)setAutoscale:(BOOL)a3
{
  self->mAutoscale = a3;
}

- (void)setCluster:(BOOL)a3
{
  self->mCluster = a3;
}

- (int)rotationY
{
  return self->mRotationY;
}

- (int)rotationX
{
  return self->mRotationX;
}

- (int)depthPercent
{
  return self->mDepthPercent;
}

- (int)gapDepthPercent
{
  return self->mGapDepthPercent;
}

- (int)heightPercent
{
  return self->mHeightPercent;
}

- (int)perspective
{
  return self->mPerspective;
}

- (BOOL)isRightAngleAxes
{
  return self->mRightAngleAxes;
}

- (BOOL)isCluster
{
  return self->mCluster;
}

- (BOOL)isAutoscale
{
  return self->mAutoscale;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDView3D;
  -[CHDView3D description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
