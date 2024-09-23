@implementation VGHRTFFaceCaptureProcessedData

- (id)initEmpty
{
  VGHRTFFaceCaptureProcessedData *v2;
  VGHRTFFaceCaptureProcessedData *v3;
  VGHRTFFaceCaptureProcessedData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VGHRTFFaceCaptureProcessedData;
  v2 = -[VGHRTFFaceCaptureProcessedData init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (IOSurface)rectifiedColorBuffer
{
  return self->_rectifiedColorBuffer;
}

- (void)setRectifiedColorBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_rectifiedColorBuffer, a3);
}

- (IOSurface)rectifiedDepthBuffer
{
  return self->_rectifiedDepthBuffer;
}

- (void)setRectifiedDepthBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_rectifiedDepthBuffer, a3);
}

- (NSNumber)yawAngle
{
  return self->_yawAngle;
}

- (void)setYawAngle:(id)a3
{
  objc_storeStrong((id *)&self->_yawAngle, a3);
}

- (NSNumber)pitchAngle
{
  return self->_pitchAngle;
}

- (void)setPitchAngle:(id)a3
{
  objc_storeStrong((id *)&self->_pitchAngle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pitchAngle, 0);
  objc_storeStrong((id *)&self->_yawAngle, 0);
  objc_storeStrong((id *)&self->_rectifiedDepthBuffer, 0);
  objc_storeStrong((id *)&self->_rectifiedColorBuffer, 0);
}

@end
