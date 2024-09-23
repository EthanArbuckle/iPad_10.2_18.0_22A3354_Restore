@implementation VILazyImage

- (VILazyImage)initWithImageLoader:(id)a3 imageSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  VILazyImage *v8;
  VILazyImage *v9;
  uint64_t v10;
  id loader;
  objc_super v13;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VILazyImage;
  v8 = -[VILazyImage init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_msgSend(v7, "copy");
    loader = v9->_loader;
    v9->_loader = (id)v10;

    v9->_knownImageSize.width = width;
    v9->_knownImageSize.height = height;
  }

  return v9;
}

- (VILazyImage)initWithImageLoader:(id)a3
{
  return -[VILazyImage initWithImageLoader:imageSize:](self, "initWithImageLoader:imageSize:", a3, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  id loader;
  VIImage *image;
  objc_super v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  loader = self->_loader;
  self->_loader = 0;

  image = self->_image;
  self->_image = 0;

  os_unfair_lock_unlock(p_lock);
  v6.receiver = self;
  v6.super_class = (Class)VILazyImage;
  -[VILazyImage dealloc](&v6, sel_dealloc);
}

- (__CVBuffer)pixelBuffer
{
  void *v2;
  __CVBuffer *v3;

  -[VILazyImage _image](self, "_image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__CVBuffer *)objc_msgSend(v2, "pixelBuffer");

  return v3;
}

- (unsigned)orientation
{
  void *v2;
  unsigned int v3;

  -[VILazyImage _image](self, "_image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  return v3;
}

- (BOOL)isLoaded
{
  VILazyImage *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_image != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (CGSize)imageSize
{
  os_unfair_lock_s *p_lock;
  double width;
  double height;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  width = self->_knownImageSize.width;
  height = self->_knownImageSize.height;
  v6 = width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v6 || self->_image)
  {
    -[VILazyImage _loadImageIfPossible](self, "_loadImageIfPossible");
    -[VIImage imageSize](self->_image, "imageSize");
    width = v7;
    height = v8;
  }
  os_unfair_lock_unlock(p_lock);
  v9 = width;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)_image
{
  os_unfair_lock_s *p_lock;
  VIImage *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[VILazyImage _loadImageIfPossible](self, "_loadImageIfPossible");
  v4 = self->_image;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_loadImageIfPossible
{
  void (**loader)(id, SEL);
  VIImage *v4;
  VIImage *image;
  id v6;

  if (!self->_image)
  {
    loader = (void (**)(id, SEL))self->_loader;
    if (loader)
    {
      loader[2](loader, a2);
      v4 = (VIImage *)objc_claimAutoreleasedReturnValue();
      image = self->_image;
      self->_image = v4;

      v6 = self->_loader;
      self->_loader = 0;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loader, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
