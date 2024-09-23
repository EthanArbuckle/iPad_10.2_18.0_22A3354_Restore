@implementation VisionCoreSparseOpticalFlowResultPoint

- (VisionCoreSparseOpticalFlowResultPoint)initWithX:(double)a3 Y:(double)a4 inlier:(BOOL)a5 reprojError:(float)a6
{
  VisionCoreSparseOpticalFlowResultPoint *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VisionCoreSparseOpticalFlowResultPoint;
  result = -[VisionCoreSparseOpticalFlowResultPoint init](&v11, sel_init);
  if (result)
  {
    result->_reprojError = a6;
    result->_point.x = a3;
    result->_point.y = a4;
    result->_isInlier = a5;
  }
  return result;
}

- (float)reprojError
{
  return self->_reprojError;
}

- (BOOL)isInlier
{
  return self->_isInlier;
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

@end
