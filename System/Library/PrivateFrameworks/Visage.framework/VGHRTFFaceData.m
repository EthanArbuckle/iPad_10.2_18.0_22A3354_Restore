@implementation VGHRTFFaceData

- (int64_t)trackedId
{
  return self->_trackedId;
}

- (void)setTrackedId:(int64_t)a3
{
  self->_trackedId = a3;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBox = a3;
}

- (NSNumber)rollAngle
{
  return self->_rollAngle;
}

- (void)setRollAngle:(id)a3
{
  objc_storeStrong((id *)&self->_rollAngle, a3);
}

- (NSNumber)yawAngle
{
  return self->_yawAngle;
}

- (void)setYawAngle:(id)a3
{
  objc_storeStrong((id *)&self->_yawAngle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yawAngle, 0);
  objc_storeStrong((id *)&self->_rollAngle, 0);
}

@end
