@implementation VGHRTFEarCaptureDetectionData

- (id)initEmpty
{
  VGHRTFEarCaptureDetectionData *v2;
  VGHRTFEarCaptureDetectionData *v3;
  VGHRTFEarCaptureDetectionData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VGHRTFEarCaptureDetectionData;
  v2 = -[VGHRTFEarCaptureDetectionData init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (unint64_t)earSide
{
  return self->_earSide;
}

- (void)setEarSide:(unint64_t)a3
{
  self->_earSide = a3;
}

- (double)yawAngle
{
  return self->_yawAngle;
}

- (void)setYawAngle:(double)a3
{
  self->_yawAngle = a3;
}

- (double)pitchAngle
{
  return self->_pitchAngle;
}

- (void)setPitchAngle:(double)a3
{
  self->_pitchAngle = a3;
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

- (NSArray)landmarkPoints
{
  return self->_landmarkPoints;
}

- (void)setLandmarkPoints:(id)a3
{
  objc_storeStrong((id *)&self->_landmarkPoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landmarkPoints, 0);
}

@end
