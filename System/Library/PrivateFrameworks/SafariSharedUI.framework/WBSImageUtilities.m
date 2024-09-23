@implementation WBSImageUtilities

+ (NSSet)safari_CGImageTypes
{
  if (+[WBSImageUtilities safari_CGImageTypes]::once != -1)
    dispatch_once(&+[WBSImageUtilities safari_CGImageTypes]::once, &__block_literal_global_19);
  return (NSSet *)(id)+[WBSImageUtilities safari_CGImageTypes]::supportedImageTypes;
}

void __40__WBSImageUtilities_safari_CGImageTypes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  CFArrayRef v3;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v3 = CGImageSourceCopyTypeIdentifiers();
  objc_msgSend(v0, "setWithArray:");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[WBSImageUtilities safari_CGImageTypes]::supportedImageTypes;
  +[WBSImageUtilities safari_CGImageTypes]::supportedImageTypes = v1;

}

+ (BOOL)saveCGImage:(CGImage *)a3 toFile:(id)a4 options:(id)a5
{
  const __CFURL *v7;
  const __CFDictionary *v8;
  __CFString *v9;
  CGImageDestination *v10;
  BOOL v11;

  v7 = (const __CFURL *)a4;
  v8 = (const __CFDictionary *)a5;
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = CGImageDestinationCreateWithURL(v7, v9, 1uLL, 0);

  if (v10)
  {
    CGImageDestinationAddImage(v10, a3, v8);
    v11 = CGImageDestinationFinalize(v10);
    CFRelease(v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)squareThumbnailImageFromImage:(id)a3 thumbnailWidthInPixels:(double)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  CGColorSpace *DeviceRGB;
  double Width;
  CGFloat Height;
  CGContext *v12;
  CGFloat v13;
  void *v14;
  void *v15;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0D8A0C0];
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "imageWithCGImage:", objc_msgSend(v7, "CGImage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageGetWidth((CGImageRef)objc_msgSend(v8, "CGImage"));
  CGImageGetHeight((CGImageRef)objc_msgSend(v8, "CGImage"));
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = a4;
  v17.size.height = a4;
  Width = CGRectGetWidth(v17);
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = a4;
  v18.size.height = a4;
  Height = CGRectGetHeight(v18);
  v12 = CGBitmapContextCreate(0, (unint64_t)Width, (unint64_t)Height, 8uLL, 0, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = a4;
  v19.size.height = a4;
  v13 = CGRectGetWidth(v19);
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = a4;
  v20.size.height = a4;
  v21.size.height = CGRectGetHeight(v20);
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v13;
  CGContextClearRect(v12, v21);
  CGContextSetBlendMode(v12, kCGBlendModeCopy);
  objc_msgSend(v8, "CGImage");
  CGContextDrawImageFromRect();
  objc_msgSend(MEMORY[0x1E0D8A0C0], "imageByAdoptingCGImage:", CGBitmapContextCreateImage(v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CGContextRelease(v12);
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", objc_msgSend(v14, "CGImage"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)flatImage:(id)a3 withColor:(id)a4
{
  objc_msgSend(a3, "_flatImageWithColor:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_pixelDataForImage:(id)a3
{
  CGDataProvider *DataProvider;

  DataProvider = CGImageGetDataProvider((CGImageRef)objc_msgSend(objc_retainAutorelease(a3), "CGImage"));
  return CGDataProviderCopyData(DataProvider);
}

+ (BOOL)image:(id)a3 isEqualToImage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a4;
  objc_msgSend(a1, "_pixelDataForImage:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pixelDataForImage:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToData:", v8);

  return v9;
}

+ (CGSize)imageSizeScalingSize:(CGSize)result proportionallyToFitSize:(CGSize)a4
{
  double v5;
  double v6;
  double v7;

  if (result.width > a4.width || result.height > a4.height)
  {
    v5 = a4.width / result.width;
    v6 = a4.height / result.height;
    if (v5 >= v6)
      v7 = v6;
    else
      v7 = v5;
    result.width = result.width * v7;
    result.height = result.height * v7;
  }
  return result;
}

+ (id)resizedImage:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  id v10;
  uint64_t v11;
  CGSize v13;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  objc_msgSend(v6, "size");
  if (v8 == width && v7 == height)
  {
    v10 = v6;
  }
  else
  {
    v13.width = width;
    v13.height = height;
    UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
    objc_msgSend(v6, "drawInRect:", 0.0, 0.0, width, height);
    UIGraphicsGetImageFromCurrentImageContext();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    if (objc_msgSend(v6, "renderingMode"))
    {
      objc_msgSend(v10, "imageWithRenderingMode:", objc_msgSend(v6, "renderingMode"));
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v11;
    }
  }

  return v10;
}

+ (id)handoffIconForDeviceType:(id)a3
{
  __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;

  v3 = (__CFString *)a3;
  if (-[__CFString length](v3, "length"))
  {
    if (UTTypeConformsTo(v3, CFSTR("com.apple.mac.laptop")))
    {
      v4 = CFSTR("HandoffMacBookTemplate");
    }
    else if (UTTypeConformsTo(v3, CFSTR("com.apple.mac")))
    {
      v4 = CFSTR("HandoffMacTemplate");
    }
    else if (UTTypeConformsTo(v3, CFSTR("com.apple.watch")))
    {
      v4 = CFSTR("HandoffWatchTemplate");
    }
    else if (UTTypeConformsTo(v3, CFSTR("com.apple.iphone")) || UTTypeConformsTo(v3, CFSTR("com.apple.ipod")))
    {
      v4 = CFSTR("HandoffIphoneTemplate");
    }
    else if (UTTypeConformsTo(v3, CFSTR("com.apple.ipad")))
    {
      v4 = CFSTR("HandoffIpadTemplate");
    }
    else
    {
      UTTypeConformsTo(v3, CFSTR("public.device"));
      v4 = CFSTR("HandoffGenericTemplate");
    }
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("HandoffGenericTemplate"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

@end
