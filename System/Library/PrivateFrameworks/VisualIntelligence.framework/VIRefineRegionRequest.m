@implementation VIRefineRegionRequest

- (VIRefineRegionRequest)initWithImage:(id)a3 regionOfInterest:(CGRect)a4 imageType:(int64_t)a5 preferredMetalDevice:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  VIRefineRegionRequest *v16;
  VIRefineRegionRequest *v17;
  objc_super v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)VIRefineRegionRequest;
  v16 = -[VIRefineRegionRequest init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_image, a3);
    v17->_regionOfInterest.origin.x = x;
    v17->_regionOfInterest.origin.y = y;
    v17->_regionOfInterest.size.width = width;
    v17->_regionOfInterest.size.height = height;
    v17->_imageType = a5;
    objc_storeStrong((id *)&v17->_preferredMetalDevice, a6);
  }

  return v17;
}

- (VIImageContent)image
{
  return self->_image;
}

- (CGRect)regionOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_regionOfInterest.origin.x;
  y = self->_regionOfInterest.origin.y;
  width = self->_regionOfInterest.size.width;
  height = self->_regionOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)imageType
{
  return self->_imageType;
}

- (MTLDevice)preferredMetalDevice
{
  return self->_preferredMetalDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
