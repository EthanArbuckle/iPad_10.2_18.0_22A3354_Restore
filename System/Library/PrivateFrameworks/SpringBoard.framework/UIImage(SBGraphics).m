@implementation UIImage(SBGraphics)

- (uint64_t)sbs_hasAlpha
{
  CGImageAlphaInfo AlphaInfo;

  AlphaInfo = CGImageGetAlphaInfo((CGImageRef)objc_msgSend(objc_retainAutorelease(a1), "CGImage"));
  return (AlphaInfo > kCGImageAlphaNoneSkipFirst) | (0x1Eu >> AlphaInfo) & 1;
}

- (double)pixelSize
{
  CGImage *v1;
  CGImage *v2;
  double Width;

  v1 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  if (!v1)
    return *MEMORY[0x1E0C9D820];
  v2 = v1;
  Width = (double)CGImageGetWidth(v1);
  CGImageGetHeight(v2);
  return Width;
}

- (BOOL)isAnimated
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "images");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (id)sbg_squareImage
{
  double v2;
  double v3;
  id v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGSize v9;

  objc_msgSend(a1, "size");
  if (v2 == v3)
  {
    v4 = a1;
  }
  else
  {
    if (v2 <= v3)
      v5 = v2;
    else
      v5 = v3;
    objc_msgSend(a1, "scale");
    v7 = v6;
    v9.width = v5;
    v9.height = v5;
    UIGraphicsBeginImageContextWithOptions(v9, 0, v7);
    objc_msgSend(a1, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    UIGraphicsGetImageFromCurrentImageContext();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  return v4;
}

- (CGImageSourceRef)_newSource
{
  CGImage *v1;
  CGDataProviderRef DataProvider;
  CGDataProvider *v3;
  const __CFDictionary *v4;
  CGImageSourceRef v5;

  v1 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  if (!v1)
    return 0;
  DataProvider = CGImageGetDataProvider(v1);
  if (!DataProvider)
    return 0;
  v3 = DataProvider;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = CGImageSourceCreateWithDataProvider(v3, v4);

  return v5;
}

- (id)_thumbnailFitToSize:()SBGraphics
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  CGImage *v12;
  uint64_t v13;
  const void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  if (a2 >= a3)
    v9 = a2;
  else
    v9 = a3;
  v10 = v9 * v8;
  UIImageJPEGRepresentation(a1, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    && (v12 = -[UIImage _newThumbnailWithJPEG:forMaxPixelDimension:](a1, "_newThumbnailWithJPEG:forMaxPixelDimension:", v11, v10)) != 0|| (v13 = -[UIImage _newSource](a1, "_newSource")) != 0&& (v14 = (const void *)v13, v12 = -[UIImage _newThumbnailWithImageSource:forMaxPixelDimension:](a1, "_newThumbnailWithImageSource:forMaxPixelDimension:", v13, v10), CFRelease(v14), v12))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", v12, -[UIImage imageOrientation](a1, "imageOrientation"), v8);
    CFRelease(v12);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (CGImageRef)_newThumbnailWithImageSource:()SBGraphics forMaxPixelDimension:
{
  void *v6;
  void *v7;
  double v8;
  void *v9;
  CGImageRef ThumbnailAtIndex;

  if (!a4)
    return 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, *MEMORY[0x1E0CBD178]);

  *(float *)&v8 = a1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, *MEMORY[0x1E0CBD2A0]);

  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a4, 0, (CFDictionaryRef)v6);
  return ThumbnailAtIndex;
}

- (uint64_t)_newThumbnailWithJPEG:()SBGraphics forMaxPixelDimension:
{
  objc_class *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v11;

  v11 = 0;
  if (!a4)
    return 0;
  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", 1);
  *(float *)&v8 = a1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, *MEMORY[0x1E0CBD2A0]);

  LODWORD(v9) = MEMORY[0x1D17E2FA0](v6, v7, &v11);
  if ((_DWORD)v9)
    v11 = 0;

  return v11;
}

@end
