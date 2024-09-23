@implementation VGHRTFEarFrameData

- (id)initEmpty
{
  VGHRTFEarFrameData *v2;
  VGHRTFEarFrameData *v3;
  VGHRTFEarFrameData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VGHRTFEarFrameData;
  v2 = -[VGHRTFEarFrameData init](&v6, sel_init);
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

- (__n128)earBox
{
  return a1[2];
}

- (void)setEarBox:(VGHRTFEarFrameData *)self
{
  __int128 v2;

  *(_OWORD *)self->_earBox = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthImage, 0);
  objc_storeStrong((id *)&self->_rgbImage, 0);
}

@end
