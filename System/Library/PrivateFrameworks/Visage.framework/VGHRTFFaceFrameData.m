@implementation VGHRTFFaceFrameData

- (id)initEmpty
{
  VGHRTFFaceFrameData *v2;
  VGHRTFFaceFrameData *v3;
  VGHRTFFaceFrameData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VGHRTFFaceFrameData;
  v2 = -[VGHRTFFaceFrameData init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (IOSurface)rgbImage
{
  return self->_rgbImage;
}

- (void)setRgbImage:(id)a3
{
  objc_storeStrong((id *)&self->_rgbImage, a3);
}

- (IOSurface)depthImage
{
  return self->_depthImage;
}

- (void)setDepthImage:(id)a3
{
  objc_storeStrong((id *)&self->_depthImage, a3);
}

- (__n128)depthIntrinsics
{
  return a1[2];
}

- (__n128)setDepthIntrinsics:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  return result;
}

- (NSArray)landmarks
{
  return self->_landmarks;
}

- (void)setLandmarks:(id)a3
{
  objc_storeStrong((id *)&self->_landmarks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landmarks, 0);
  objc_storeStrong((id *)&self->_depthImage, 0);
  objc_storeStrong((id *)&self->_rgbImage, 0);
}

@end
