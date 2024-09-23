@implementation _TVProductBannerBlurImageDecorator

- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5
{
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGImage *v14;
  double Width;
  void *v16;

  v6 = (void *)MEMORY[0x24BDF6D38];
  v7 = a3;
  objc_msgSend(v6, "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  v13 = objc_retainAutorelease(v7);
  v14 = (CGImage *)objc_msgSend(v13, "CGImage");
  Width = (double)CGImageGetWidth(v14);
  -[_TVProductBannerBlurImageDecorator blurImageWithImage:targetSize:scaleSize:](self, "blurImageWithImage:targetSize:scaleSize:", v13, v10, v12, 2800.0, dbl_222E77050[Width / (double)CGImageGetHeight(v14) > 0.99]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)blurImageWithImage:(id)a3 targetSize:(CGSize)a4 scaleSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  CGImage *v10;
  double v11;
  size_t v12;
  CGImageRef v13;
  void *v14;
  _UIBackdropViewSettings *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  const void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  CGRect v26;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v10 = (CGImage *)objc_msgSend(objc_retainAutorelease(a3), "CGImage");
  v11 = (double)CGImageGetWidth(v10);
  v12 = CGImageGetHeight(v10);
  v26.size.width = v8 / width * v11;
  v26.size.height = v7 / height * (double)v12;
  v26.origin.x = (v11 - v26.size.width) * 0.5;
  v26.origin.y = ((double)v12 - v26.size.height) * 0.5;
  v13 = CGImageCreateWithImageInRect(v10, v26);
  -[_TVProductBannerBlurImageDecorator resizeImage:targetSize:shouldDither:](self, "resizeImage:targetSize:shouldDither:", v13, 0, v8, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    CFRelease(v13);
  v15 = self->_backdropSettings;
  if (!v15)
  {
    if (self->_lightStyle)
      v16 = 2010;
    else
      v16 = 2030;
    objc_msgSend(MEMORY[0x24BDF7020], "settingsForPrivateStyle:", v16);
    v15 = (_UIBackdropViewSettings *)objc_claimAutoreleasedReturnValue();
  }
  -[_UIBackdropViewSettings setBlurRadius:](v15, "setBlurRadius:", 150.0);
  objc_msgSend(v14, "_applyBackdropViewSettings:includeTints:includeBlur:allowImageResizing:", v15, 1, 1, 0);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (!objc_msgSend(v17, "CGImage") || (v18 = v17) == 0)
  {
    if (objc_msgSend(v17, "ioSurface")
      && (objc_msgSend(v17, "ioSurface"), (v19 = _UICreateCGImageFromIOSurfaceWithOptions()) != 0))
    {
      v20 = (const void *)v19;
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v19);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      CFRelease(v20);
    }
    else
    {
      v18 = 0;
    }
  }
  v21 = objc_retainAutorelease(v18);
  -[_TVProductBannerBlurImageDecorator resizeImage:targetSize:shouldDither:](self, "resizeImage:targetSize:shouldDither:", objc_msgSend(v21, "CGImage"), 1, v8, v7);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (objc_msgSend(v22, "CGImage"))
  {
    v23 = v22;

    v21 = v23;
  }
  v24 = v21;

  return v24;
}

- (id)resizeImage:(CGImage *)a3 targetSize:(CGSize)a4 shouldDither:(BOOL)a5
{
  _BOOL4 v5;
  size_t v7;
  size_t v8;
  CGColorSpace *DeviceRGB;
  CGContext *v10;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  id v15;
  uint64_t v16;
  CGImage *v17;
  CGImageRef Image;
  CGImageRef v19;
  void *v20;
  CGRect ClipBoundingBox;
  CGRect v23;

  if (a3
    && (v5 = a5,
        v7 = (unint64_t)a4.width,
        v8 = (unint64_t)a4.height,
        DeviceRGB = CGColorSpaceCreateDeviceRGB(),
        v10 = CGBitmapContextCreate(0, v7, v8, 8uLL, 0, DeviceRGB, 0x2006u),
        CFRelease(DeviceRGB),
        v10))
  {
    CGContextSetBlendMode(v10, kCGBlendModeCopy);
    ClipBoundingBox = CGContextGetClipBoundingBox(v10);
    x = ClipBoundingBox.origin.x;
    y = ClipBoundingBox.origin.y;
    width = ClipBoundingBox.size.width;
    height = ClipBoundingBox.size.height;
    CGContextDrawImage(v10, ClipBoundingBox, a3);
    if (v5)
    {
      _TVNoiseImageOfSize(1, width, height);
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = objc_msgSend(v15, "CGImage");
      if (v16)
      {
        v17 = (CGImage *)v16;
        CGContextSetBlendMode(v10, kCGBlendModeNormal);
        CGContextSetAlpha(v10, 0.03);
        v23.origin.x = x;
        v23.origin.y = y;
        v23.size.width = width;
        v23.size.height = height;
        CGContextDrawImage(v10, v23, v17);
      }

    }
    Image = CGBitmapContextCreateImage(v10);
    if (Image)
    {
      v19 = Image;
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", Image, 0, 1.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v19);
    }
    else
    {
      v20 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (BOOL)lightStyle
{
  return self->_lightStyle;
}

- (void)setLightStyle:(BOOL)a3
{
  self->_lightStyle = a3;
}

- (_UIBackdropViewSettings)backdropSettings
{
  return self->_backdropSettings;
}

- (void)setBackdropSettings:(id)a3
{
  objc_storeStrong((id *)&self->_backdropSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropSettings, 0);
}

@end
