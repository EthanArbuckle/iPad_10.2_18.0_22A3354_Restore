@implementation UIImage(PaperBoardUtilities)

+ (id)pbui_thumbnailImageForImage:()PaperBoardUtilities
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGRect v32;
  CGRect v33;

  v3 = a3;
  objc_msgSend(v3, "scale");
  v5 = v4;
  v6 = objc_msgSend(v3, "size");
  v8 = 0;
  if (v9 > 0.0 && v7 > 0.0)
  {
    v10 = (void *)MEMORY[0x1BCCA57C8](v6);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = v12;

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_referenceBounds");
    v16 = v15;
    v18 = v17;

    v19 = v13 * v16;
    v20 = v13 * v18;
    +[PBUIWallpaperParallaxSettings minimumWallpaperSizeForCurrentDevice](PBUIWallpaperParallaxSettings, "minimumWallpaperSizeForCurrentDevice");
    UIRectCenteredIntegralRect();
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    CGAffineTransformMakeScale(&v30, v13, v13);
    CGAffineTransformInvert(&v31, &v30);
    v32.origin.x = v22;
    v32.origin.y = v24;
    v32.size.width = v26;
    v32.size.height = v28;
    v33 = CGRectApplyAffineTransform(v32, &v31);
    objc_msgSend(v3, "pbui_cropImageWithRect:outputSize:preservingAspectRatio:", 0, v33.origin.x, v33.origin.y, v33.size.width, v33.size.height, v13 / v5 * 206.0 / v13, v13 / v5 * round(v20 * (206.0 / v19)) / v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v10);
  }

  return v8;
}

- (uint64_t)pbui_CGImageBackedImageWithMaximumBitsPerComponent:()PaperBoardUtilities
{
  return objc_msgSend(a1, "pui_CGImageBackedImageWithMaximumBitsPerComponent:skipCIF10FitsInSRGBCheck:", a3, 0);
}

- (uint64_t)pbui_cropImageWithRect:()PaperBoardUtilities outputSize:
{
  return objc_msgSend(a1, "pui_cropImageWithRect:outputSize:canUseIOSurface:", 1);
}

- (uint64_t)pbui_scaleImage:()PaperBoardUtilities
{
  return objc_msgSend(a1, "pui_scaleImage:canUseIOSurface:", 1);
}

- (CGImage)pbui_colorSpace
{
  CGImage *result;

  result = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  if (result)
    return CGImageGetColorSpace(result);
  return result;
}

- (id)pbui_resizedImageForCurrentMagnifyMode
{
  void *v2;
  double v3;
  BOOL v4;
  float v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  CGAffineTransform v14;

  +[PBUIMagnifyMode currentMagnifyMode](PBUIMagnifyMode, "currentMagnifyMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoomFactor");
  *(float *)&v3 = fabsf(*(float *)&v3 + -1.0);
  if (v2)
    v4 = *(float *)&v3 < 2.2204e-16;
  else
    v4 = 1;
  if (v4)
  {
    v11 = a1;
  }
  else
  {
    objc_msgSend(v2, "zoomFactor", v3);
    v6 = 1.0 / v5;
    objc_msgSend(a1, "size");
    v8 = v7;
    v10 = v9;
    CGAffineTransformMakeScale(&v14, v6, v6);
    objc_msgSend(a1, "pui_resizeImageToSize:", v10 * v14.c + v14.a * v8, v10 * v14.d + v14.b * v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (uint64_t)pbui_EXIFOrientation
{
  objc_msgSend(a1, "imageOrientation");
  return _EXIFOrientationForUIImageOrientation();
}

@end
