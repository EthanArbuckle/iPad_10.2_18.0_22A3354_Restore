@implementation _PreloadedImageResult

- (_PreloadedImageResult)initWithPreloadedImage:(id)a3
{
  id v5;
  _PreloadedImageResult *v6;
  _PreloadedImageResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PreloadedImageResult;
  v6 = -[_PreloadedImageResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_image, a3);

  return v7;
}

- (PUDisplayAsset)asset
{
  return 0;
}

- (CGImage)gainMapImage
{
  return 0;
}

- (float)gainMapValue
{
  return 0.0;
}

- (BOOL)imageIsFullQuality
{
  return 0;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PreloadedImageResult image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; image = %@>"), v5, self, v6);

  return v7;
}

- (double)timeIntervalSinceRequest
{
  return 0.0;
}

- (CGSize)targetSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
