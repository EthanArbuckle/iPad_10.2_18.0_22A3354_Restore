@implementation UIImage(SSImageSurface)

+ (id)ss_imageFromImageSurface:()SSImageSurface
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;

  v3 = (objc_class *)MEMORY[0x24BDF6AC8];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = objc_msgSend(v4, "backingSurface");
  objc_msgSend(v4, "scale");
  v8 = v7;
  v9 = objc_msgSend(v4, "orientation");

  return (id)objc_msgSend(v5, "_initWithIOSurface:scale:orientation:", v6, v9, v8);
}

- (SSImageSurface)ss_imageSurfaceFromImage
{
  SSImageSurface *v2;
  uint64_t v3;
  const void *v4;
  NSObject *v5;

  v2 = objc_alloc_init(SSImageSurface);
  v3 = objc_msgSend(a1, "ioSurface");
  if (v3)
  {
    -[SSImageSurface setBackingSurface:](v2, "setBackingSurface:", v3);
  }
  else
  {
    v4 = (const void *)objc_msgSend(a1, "_copyIOSurface");
    -[SSImageSurface setBackingSurface:](v2, "setBackingSurface:", v4);
    if (v4)
    {
      CFRelease(v4);
    }
    else
    {
      v5 = os_log_create("com.apple.screenshotservices", "Image");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[UIImage(SSImageSurface) ss_imageSurfaceFromImage].cold.1((uint64_t)a1, v5);

    }
  }
  objc_msgSend(a1, "scale");
  -[SSImageSurface setScale:](v2, "setScale:");
  -[SSImageSurface setOrientation:](v2, "setOrientation:", objc_msgSend(a1, "imageOrientation"));
  return v2;
}

+ (id)ss_cgImageBackedImageFromImageSurface:()SSImageSurface
{
  id v3;
  CGImage *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "backingSurface");
  v4 = (CGImage *)_UICreateCGImageFromIOSurfaceWithOptions();
  v5 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(v3, "scale");
  v7 = v6;
  v8 = objc_msgSend(v3, "orientation");

  objc_msgSend(v5, "imageWithCGImage:scale:orientation:", v4, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v4);
  return v9;
}

- (void)ss_imageSurfaceFromImage
{
  int v2;
  uint64_t v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 1024;
  v5 = 1;
  _os_log_fault_impl(&dword_213892000, a2, OS_LOG_TYPE_FAULT, "unexpected NULL backing surface for image %@ (copied:%d)", (uint8_t *)&v2, 0x12u);
}

@end
