@implementation _PUImageRequesterResult

- (void)setGainMapImage:(CGImage *)a3
{
  CGImage *gainMapImage;

  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    CGImageRelease(gainMapImage);
    self->_gainMapImage = CGImageRetain(a3);
  }
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_gainMapImage);
  v3.receiver = self;
  v3.super_class = (Class)_PUImageRequesterResult;
  -[_PUImageRequesterResult dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_class *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  float v13;
  double v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  id v21;
  void *v22;
  CGSize v23;
  CGSize v24;

  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUImageRequesterResult asset](self, "asset");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUImageRequesterResult asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUImageRequesterResult targetSize](self, "targetSize");
  NSStringFromCGSize(v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUImageRequesterResult image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  NSStringFromCGSize(v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_PUImageRequesterResult gainMapImage](self, "gainMapImage"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = v11;
  -[_PUImageRequesterResult gainMapValue](self, "gainMapValue");
  v14 = v13;
  if (-[_PUImageRequesterResult imageIsFullQuality](self, "imageIsFullQuality"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v16 = v15;
  -[_PUImageRequesterResult timeIntervalSinceRequest](self, "timeIntervalSinceRequest");
  v18 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("<%@ %p>:\n\tAsset: %@ %@\n\tTargetSize: %@\n\tImageSize: %@\n\tGainMapImage: %@\n\tGainMapValue: %f\n\tFullQuality: %@\n\tLatency: %.3f"), v20, self, v5, v7, v8, v10, v12, *(_QWORD *)&v14, v16, v17);

  return v18;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (void)setGainMapValue:(float)a3
{
  self->_gainMapValue = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)imageIsFullQuality
{
  return self->_imageIsFullQuality;
}

- (void)setImageIsFullQuality:(BOOL)a3
{
  self->_imageIsFullQuality = a3;
}

- (double)timeIntervalSinceRequest
{
  return self->_timeIntervalSinceRequest;
}

- (void)setTimeIntervalSinceRequest:(double)a3
{
  self->_timeIntervalSinceRequest = a3;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
