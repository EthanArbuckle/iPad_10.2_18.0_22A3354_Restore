@implementation UIImage(IMAdditions)

- (uint64_t)imageWithSize:()IMAdditions
{
  return objc_msgSend(a1, "imageWithSize:resizeOptions:", 1);
}

- (id)imageWithSize:()IMAdditions resizeOptions:
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v36;
  CGImage *v37;
  CGContext *CurrentContext;
  CGImage *Image;
  void *v40;
  double v41;
  CGSize v43;
  CGSize v44;
  CGSize v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  if (a5)
  {
    objc_msgSend(a1, "size");
    v10 = v9;
    objc_msgSend(a1, "size");
    v12 = a2 / a3 - v10 / v11;
    if (v12 < 0.0)
      v12 = -v12;
    if (v12 > 0.00000011920929)
    {
      objc_msgSend(a1, "size");
      v14 = a2 / v13;
      objc_msgSend(a1, "size");
      v16 = a3 / v15;
      if (a5 == 1)
      {
        if (v14 >= v16)
          v17 = a3 / v15;
        else
          v17 = v14;
      }
      else
      {
        v17 = 1.0;
        if (a5 == 2)
        {
          if (v14 >= v16)
            v17 = v14;
          else
            v17 = v16;
        }
      }
      objc_msgSend(a1, "size");
      a2 = v17 * v18;
      objc_msgSend(a1, "size");
      a3 = v17 * v19;
    }
  }
  if (IMAdjustToScale_onceToken_0 != -1)
    dispatch_once(&IMAdjustToScale_onceToken_0, &__block_literal_global_14);
  v20 = ceil(a2 * *(double *)&IMAdjustToScale___s_0) / *(double *)&IMAdjustToScale___s_0;
  v21 = ceil(a2);
  if (*(double *)&IMAdjustToScale___s_0 == 1.0)
    v22 = v21;
  else
    v22 = v20;
  v23 = ceil(a3 * *(double *)&IMAdjustToScale___s_0) / *(double *)&IMAdjustToScale___s_0;
  v24 = ceil(a3);
  if (*(double *)&IMAdjustToScale___s_0 == 1.0)
    v25 = v24;
  else
    v25 = v23;
  objc_msgSend(a1, "size");
  if (v22 <= v26 && (objc_msgSend(a1, "size"), v25 <= v27))
  {
    v46.origin.x = 0.0;
    v46.origin.y = 0.0;
    v46.size.width = v22;
    v46.size.height = v25;
    v47 = CGRectIntegral(v46);
    x = v47.origin.x;
    y = v47.origin.y;
    width = v47.size.width;
    height = v47.size.height;
    v36 = objc_retainAutorelease(a1);
    v37 = (CGImage *)objc_msgSend(v36, "CGImage");
    v45.width = v22;
    v45.height = v25;
    UIGraphicsBeginImageContextWithOptions(v45, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(CurrentContext, 0.0, v25);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    CGContextDrawImage(CurrentContext, v48, v37);
    Image = CGBitmapContextCreateImage(CurrentContext);
    v40 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v36, "scale");
    objc_msgSend(v40, "imageWithCGImage:scale:orientation:", Image, objc_msgSend(v36, "imageOrientation"), v41);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    CGImageRelease(Image);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7F1C8], "sharedLogger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "size");
    NSStringFromCGSize(v43);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44.width = v22;
    v44.height = v25;
    NSStringFromCGSize(v44);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Extensions/UIKit/UIImage+IMAdditions.m", 58, CFSTR("Ignoring attempt to upscale image (from %@ to %@)"), v29, v30);

    v31 = a1;
  }
  return v31;
}

- (uint64_t)imageWithMaxBounds:()IMAdditions
{
  return objc_msgSend(a1, "imageWithSize:resizeOptions:", 1);
}

- (uint64_t)imageWithWidth:()IMAdditions leftCapWidth:
{
  return objc_msgSend(a1, "imageWithWidth:leftCapWidth:rightCapWidth:", a3, a3);
}

- (id)imageWithWidth:()IMAdditions leftCapWidth:rightCapWidth:
{
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  CGSize v26;
  CGSize v27;

  if (a5 | a4)
  {
    v9 = a2 - (double)(a5 + a4);
    if (v9 >= 0.0)
    {
      objc_msgSend(a1, "size");
      v13 = v12;
      v14 = v11;
      v15 = (double)a4;
      v16 = (double)a5;
      if (v12 >= a2)
      {
        v22 = v9 + v15;
        objc_msgSend(a1, "imageWithCropRect:", 0.0, 0.0, v22, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "imageWithCropRect:", v13 - v16, 0.0, v16, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "scale");
        v24 = v23;
        v27.width = a2;
        v27.height = v14;
        IMGraphicsBeginImageContextWithOptions(v27, 0, v24);
        objc_msgSend(v17, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
        objc_msgSend(v18, "drawAtPoint:", v22, 0.0);
        UIGraphicsGetImageFromCurrentImageContext();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
      }
      else
      {
        objc_msgSend(a1, "imageWithCropRect:", 0.0, 0.0, (double)a4, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "imageWithCropRect:", (double)a4, 0.0, v13 - v15 - v16, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "imageWithCropRect:", v13 - v16, 0.0, v16, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "scale");
        v21 = v20;
        v26.width = a2;
        v26.height = v14;
        IMGraphicsBeginImageContextWithOptions(v26, 0, v21);
        objc_msgSend(v17, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
        objc_msgSend(v18, "drawAsPatternInRect:", v15, 0.0, v9, v14);
        objc_msgSend(v19, "drawAtPoint:", a2 - v16, 0.0);
        UIGraphicsGetImageFromCurrentImageContext();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();

      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = a1;
  }
  return v10;
}

- (id)imageWithCropRect:()IMAdditions
{
  void *v5;
  double v6;
  double v7;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  id v15;
  CGImage *v16;
  CGImage *v17;
  CGRect v19;

  v5 = 0;
  if (a4 != 0.0)
  {
    v6 = a5;
    if (a5 != 0.0)
    {
      v7 = a4;
      objc_msgSend(a1, "scale");
      v12 = v11;
      v13 = v11 == 1.0;
      v14 = a2 * v11;
      if (v12 != 1.0)
        a2 = v14;
      if (!v13)
      {
        a3 = a3 * v12;
        v7 = v7 * v12;
        v6 = v6 * v12;
      }
      v15 = objc_retainAutorelease(a1);
      v16 = (CGImage *)objc_msgSend(v15, "CGImage");
      v19.origin.x = a2;
      v19.origin.y = a3;
      v19.size.width = v7;
      v19.size.height = v6;
      v17 = CGImageCreateWithImageInRect(v16, v19);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v17, objc_msgSend(v15, "imageOrientation"), v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v17);
    }
  }
  return v5;
}

- (id)squareImage
{
  double v2;
  double v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  int v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  CGSize v15;
  CGRect v16;

  objc_msgSend(a1, "size");
  if (v2 == v3)
  {
    v13 = a1;
  }
  else
  {
    v4 = v2;
    v5 = v3;
    if (v2 >= v3)
      v6 = v2;
    else
      v6 = v3;
    v7 = objc_msgSend(a1, "colorAtPixelX:y:", (unint64_t)(v2 + -1.0), 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (float)((float)BYTE2(v7) / 255.0), (float)((float)BYTE1(v7) / 255.0), (float)((float)v7 / 255.0), (float)((float)HIBYTE(v7) / 255.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(a1, "scale");
    v12 = v11;
    v15.width = v6;
    v15.height = v6;
    UIGraphicsBeginImageContextWithOptions(v15, 1, v12);
    objc_msgSend(v8, "set");
    v16.origin.x = v9;
    v16.origin.y = v10;
    v16.size.width = v6;
    v16.size.height = v6;
    UIRectFill(v16);
    objc_msgSend(a1, "drawInRect:blendMode:alpha:", 0, CGRectCenterRectInRect(v9, v10, v4, v5, v9, v10, v6, v6));
    UIGraphicsGetImageFromCurrentImageContext();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  return v13;
}

- (id)imageWithTint:()IMAdditions
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGSize v17;
  CGRect v18;

  v4 = a3;
  objc_msgSend(a1, "size");
  v6 = v5;
  objc_msgSend(a1, "size");
  v8 = v7;
  objc_msgSend(a1, "size");
  v10 = v9;
  v12 = v11;
  objc_msgSend(a1, "scale");
  v14 = v13;
  v17.width = v10;
  v17.height = v12;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v14);
  objc_msgSend(v4, "set");

  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = v6;
  v18.size.height = v8;
  UIRectFill(v18);
  objc_msgSend(a1, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v6, v8, 1.0);
  objc_msgSend(a1, "drawInRect:blendMode:alpha:", 1, 0.0, 0.0, v6, v8, 1.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v15;
}

- (id)imageMaskWithColor:()IMAdditions
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGContext *CurrentContext;
  double v16;
  CGImage *v17;
  id v18;
  CGColor *v19;
  void *v20;
  CGSize v22;
  CGRect v23;
  CGRect v24;

  v4 = a3;
  objc_msgSend(a1, "size");
  v6 = v5;
  objc_msgSend(a1, "size");
  v8 = v7;
  objc_msgSend(a1, "size");
  v10 = v9;
  v12 = v11;
  objc_msgSend(a1, "scale");
  v14 = v13;
  v22.width = v10;
  v22.height = v12;
  UIGraphicsBeginImageContextWithOptions(v22, 0, v14);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  objc_msgSend(a1, "size");
  CGContextTranslateCTM(CurrentContext, 0.0, -v16);
  CGContextSaveGState(CurrentContext);
  v17 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = v6;
  v23.size.height = v8;
  CGContextClipToMask(CurrentContext, v23, v17);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeMultiply);
  v18 = objc_retainAutorelease(v4);
  v19 = (CGColor *)objc_msgSend(v18, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v19);
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = v6;
  v24.size.height = v8;
  CGContextFillRect(CurrentContext, v24);
  CGContextRestoreGState(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v20;
}

+ (id)image:()IMAdditions inRect:withBacking:
{
  id v13;
  id v14;
  CGContext *CurrentContext;
  id v16;
  CGColor *v17;
  double MidX;
  double v19;
  CGFloat v20;
  double MidY;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  id v28;
  CGImage *v29;
  void *v30;
  CGSize v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v13 = a8;
  v14 = a7;
  v32.width = a3;
  v32.height = a4;
  UIGraphicsBeginImageContextWithOptions(v32, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -a4);
  CGContextSaveGState(CurrentContext);
  v16 = objc_retainAutorelease(v13);
  v17 = (CGColor *)objc_msgSend(v16, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v17);
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v33.size.width = a3;
  v33.size.height = a4;
  CGContextFillRect(CurrentContext, v33);
  v34.origin.x = a1;
  v34.origin.y = a2;
  v34.size.width = a3;
  v34.size.height = a4;
  MidX = CGRectGetMidX(v34);
  objc_msgSend(v14, "size");
  v20 = round(MidX - v19 * 0.5);
  v35.origin.x = a1;
  v35.origin.y = a2;
  v35.size.width = a3;
  v35.size.height = a4;
  MidY = CGRectGetMidY(v35);
  objc_msgSend(v14, "size");
  v23 = round(MidY - v22 * 0.5);
  objc_msgSend(v14, "size");
  v25 = v24;
  v27 = v26;
  v28 = objc_retainAutorelease(v14);
  v29 = (CGImage *)objc_msgSend(v28, "CGImage");

  v36.origin.x = v20;
  v36.origin.y = v23;
  v36.size.width = v25;
  v36.size.height = v27;
  CGContextDrawImage(CurrentContext, v36, v29);
  CGContextRestoreGState(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v30;
}

+ (id)image:()IMAdditions inRect:withBacking:opaque:scale:
{
  id v17;
  id v18;
  CGContext *CurrentContext;
  id v20;
  CGColor *v21;
  double MidX;
  double v23;
  CGFloat v24;
  double MidY;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  id v32;
  CGImage *v33;
  void *v34;
  CGSize v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v17 = a9;
  v18 = a8;
  v36.width = a3;
  v36.height = a4;
  UIGraphicsBeginImageContextWithOptions(v36, a10, a5);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -a4);
  CGContextSaveGState(CurrentContext);
  v20 = objc_retainAutorelease(v17);
  v21 = (CGColor *)objc_msgSend(v20, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v21);
  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  v37.size.width = a3;
  v37.size.height = a4;
  CGContextFillRect(CurrentContext, v37);
  v38.origin.x = a1;
  v38.origin.y = a2;
  v38.size.width = a3;
  v38.size.height = a4;
  MidX = CGRectGetMidX(v38);
  objc_msgSend(v18, "size");
  v24 = round(MidX - v23 * 0.5);
  v39.origin.x = a1;
  v39.origin.y = a2;
  v39.size.width = a3;
  v39.size.height = a4;
  MidY = CGRectGetMidY(v39);
  objc_msgSend(v18, "size");
  v27 = round(MidY - v26 * 0.5);
  objc_msgSend(v18, "size");
  v29 = v28;
  v31 = v30;
  v32 = objc_retainAutorelease(v18);
  v33 = (CGImage *)objc_msgSend(v32, "CGImage");

  v40.origin.x = v24;
  v40.origin.y = v27;
  v40.size.width = v29;
  v40.size.height = v31;
  CGContextDrawImage(CurrentContext, v40, v33);
  CGContextRestoreGState(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v34;
}

+ (id)imageWithSolidColor:()IMAdditions atSize:
{
  id v7;
  CGContext *CurrentContext;
  id v9;
  CGColor *v10;
  void *v11;
  CGSize v13;
  CGRect v14;

  v7 = a5;
  v13.width = a1;
  v13.height = a2;
  UIGraphicsBeginImageContext(v13);
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = objc_retainAutorelease(v7);
  v10 = (CGColor *)objc_msgSend(v9, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v10);
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = a1;
  v14.size.height = a2;
  CGContextFillRect(CurrentContext, v14);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v11;
}

- (id)imageWithGradientAngle:()IMAdditions startColor:endColor:
{
  id v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGContext *CurrentContext;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGColorSpace *DeviceRGB;
  id v26;
  const CGFloat *v27;
  id v28;
  CGColor *v29;
  size_t NumberOfComponents;
  double v31;
  id v32;
  const CGFloat *v33;
  id v34;
  CGColor *v35;
  size_t v36;
  CGGradient *v37;
  id v38;
  CGImage *v39;
  CGImage *v40;
  void *v41;
  __int128 v43;
  CGFloat components[2];
  uint64_t v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  CGSize v52;
  CGPoint v53;
  CGPoint v54;
  CGRect v55;
  CGRect v56;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "size");
  v11 = v10;
  objc_msgSend(a1, "size");
  v13 = v12;
  objc_msgSend(a1, "size");
  UIGraphicsBeginImageContext(v52);
  CurrentContext = UIGraphicsGetCurrentContext();
  v15 = 1.0;
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  objc_msgSend(a1, "size");
  CGContextTranslateCTM(CurrentContext, 0.0, -v16);
  CGRectEdgePointAtAngle(0.0, 0.0, v11, v13, a2);
  v18 = v17;
  v20 = v19;
  CGRectEdgePointAtAngle(0.0, 0.0, v11, v13, a2 + 3.14159265);
  v22 = v21;
  v24 = v23;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v26 = objc_retainAutorelease(v9);
  v27 = CGColorGetComponents((CGColorRef)objc_msgSend(v26, "CGColor"));
  v28 = objc_retainAutorelease(v26);
  v29 = (CGColor *)objc_msgSend(v28, "CGColor");

  NumberOfComponents = CGColorGetNumberOfComponents(v29);
  *(_OWORD *)components = *(_OWORD *)v27;
  v45 = *((_QWORD *)v27 + 2);
  v31 = 1.0;
  if (NumberOfComponents == 4)
    v31 = v27[3];
  v46 = v31;
  v32 = objc_retainAutorelease(v8);
  v33 = CGColorGetComponents((CGColorRef)objc_msgSend(v32, "CGColor"));
  v34 = objc_retainAutorelease(v32);
  v35 = (CGColor *)objc_msgSend(v34, "CGColor");

  v36 = CGColorGetNumberOfComponents(v35);
  v47 = *(_QWORD *)v33;
  v48 = *((_QWORD *)v33 + 1);
  v49 = *((_QWORD *)v33 + 2);
  if (v36 == 4)
    v15 = v27[3];
  v50 = v15;
  v43 = xmmword_1DA677270;
  v37 = CGGradientCreateWithColorComponents(DeviceRGB, components, (const CGFloat *)&v43, 2uLL);
  CGContextSaveGState(CurrentContext);
  v38 = objc_retainAutorelease(a1);
  v39 = (CGImage *)objc_msgSend(v38, "CGImage");
  v55.origin.x = 0.0;
  v55.origin.y = 0.0;
  v55.size.width = v11;
  v55.size.height = v13;
  CGContextClipToMask(CurrentContext, v55, v39);
  v40 = (CGImage *)objc_msgSend(objc_retainAutorelease(v38), "CGImage");
  v56.origin.x = 0.0;
  v56.origin.y = 0.0;
  v56.size.width = v11;
  v56.size.height = v13;
  CGContextDrawImage(CurrentContext, v56, v40);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeMultiply);
  v53.x = v18;
  v53.y = v20;
  v54.x = v22;
  v54.y = v24;
  CGContextDrawLinearGradient(CurrentContext, v37, v53, v54, 3u);
  CGContextRestoreGState(CurrentContext);
  CGGradientRelease(v37);
  CGColorSpaceRelease(DeviceRGB);
  UIGraphicsGetImageFromCurrentImageContext();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v41;
}

- (id)im_imageWithBackgroundColor:()IMAdditions
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CGSize v18;
  CGRect v19;

  v4 = a3;
  objc_msgSend(a1, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(a1, "scale");
  v10 = v9;
  v18.width = v6;
  v18.height = v8;
  UIGraphicsBeginImageContextWithOptions(v18, 1, v10);
  objc_msgSend(v4, "set");

  v11 = objc_msgSend(a1, "size");
  v12 = *MEMORY[0x1E0C9D538];
  v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v19.origin.x = CGRectMakeWithOriginSize(v11, *MEMORY[0x1E0C9D538], v13, v14, v15);
  UIRectFill(v19);
  objc_msgSend(a1, "drawAtPoint:", v12, v13);
  UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v16;
}

- (id)imageWithComposite:()IMAdditions blendMode:
{
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a1, "size");
  v8 = v7;
  objc_msgSend(a1, "size");
  objc_msgSend(a1, "imageWithComposite:blendMode:dstRect:", v6, a4, 0.0, 0.0, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)imageWithComposite:()IMAdditions blendMode:dstRect:
{
  id v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGContext *CurrentContext;
  double v20;
  double Height;
  CGFloat v22;
  CGImage *v23;
  id v24;
  CGImage *v25;
  void *v26;
  CGSize v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v14 = a7;
  objc_msgSend(a1, "size");
  v16 = v15;
  objc_msgSend(a1, "size");
  v18 = v17;
  objc_msgSend(a1, "size");
  UIGraphicsBeginImageContextWithOptions(v28, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  objc_msgSend(a1, "size");
  CGContextTranslateCTM(CurrentContext, 0.0, -v20);
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.width = v16;
  v29.size.height = v18;
  Height = CGRectGetHeight(v29);
  v30.origin.x = a2;
  v30.origin.y = a3;
  v30.size.width = a4;
  v30.size.height = a5;
  v22 = Height - CGRectGetMaxY(v30);
  CGContextSaveGState(CurrentContext);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeNormal);
  v23 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.width = v16;
  v31.size.height = v18;
  CGContextDrawImage(CurrentContext, v31, v23);
  CGContextSetBlendMode(CurrentContext, a8);
  v24 = objc_retainAutorelease(v14);
  v25 = (CGImage *)objc_msgSend(v24, "CGImage");

  v32.origin.x = a2;
  v32.origin.y = v22;
  v32.size.width = a4;
  v32.size.height = a5;
  CGContextDrawImage(CurrentContext, v32, v25);
  CGContextRestoreGState(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v26;
}

- (id)imageByRemovingPath:()IMAdditions
{
  id v4;
  id v5;
  CGImage *v6;
  double Width;
  double Height;
  CGColorSpace *DeviceRGB;
  CGContext *v10;
  CGContext *v11;
  double v12;
  CGFloat v13;
  CGImage *Image;
  void *v15;
  CGAffineTransform v17;
  CGRect v18;

  v4 = a3;
  v5 = objc_retainAutorelease(a1);
  v6 = (CGImage *)objc_msgSend(v5, "CGImage");
  Width = (double)CGImageGetWidth(v6);
  Height = (double)CGImageGetHeight(v6);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v10 = CGBitmapContextCreate(0, (unint64_t)Width, (unint64_t)Height, 8uLL, vcvtd_n_u64_f64(Width, 2uLL), DeviceRGB, 0x2002u);
  if (v10)
  {
    v11 = v10;
    CGContextSaveGState(v10);
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.width = Width;
    v18.size.height = Height;
    CGContextDrawImage(v11, v18, v6);
    objc_msgSend(v5, "scale");
    v13 = v12;
    CGContextScaleCTM(v11, 1.0, -1.0);
    CGContextTranslateCTM(v11, 0.0, -Height);
    CGAffineTransformMakeScale(&v17, v13, v13);
    objc_msgSend(v4, "applyTransform:", &v17);
    CGContextAddPath(v11, (CGPathRef)objc_msgSend(objc_retainAutorelease(v4), "CGPath"));
    CGContextSetBlendMode(v11, kCGBlendModeClear);
    CGContextFillPath(v11);
    CGContextRestoreGState(v11);
    Image = CGBitmapContextCreateImage(v11);
    CGContextRelease(v11);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:scale:orientation:", Image, objc_msgSend(v5, "imageOrientation"), v13);
    CGImageRelease(Image);
  }
  else
  {
    v15 = 0;
  }
  CGColorSpaceRelease(DeviceRGB);

  return v15;
}

- (id)stretchableMirroredImage
{
  void *v2;
  double v3;
  void *v4;

  objc_msgSend(a1, "mirroredImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "size");
  objc_msgSend(v2, "stretchableImageWithLeftCapWidth:topCapHeight:", (uint64_t)v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mirroredImage
{
  double v2;
  double v3;
  double height;
  CGFloat width;
  CGContext *CurrentContext;
  void *v7;
  CGSize v9;

  objc_msgSend(a1, "size");
  v3 = v2;
  height = v9.height;
  v9.width = v2 + v2;
  width = v9.width;
  IMGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
  objc_msgSend(a1, "drawInRect:", 0.0, 0.0, v3, height);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, -1.0, 1.0);
  objc_msgSend(a1, "drawInRect:", -width, 0.0, v3, height);
  UIGraphicsGetImageFromCurrentImageContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v7;
}

- (uint64_t)colorAtPixelX:()IMAdditions y:
{
  double v7;
  double v8;
  CGImage *v9;
  CGImageRef v10;
  CGImage *v11;
  CGColorSpace *DeviceRGB;
  CGContext *v13;
  unsigned int data;
  CGRect v16;
  CGRect v17;

  objc_msgSend(a1, "scale");
  v8 = v7;
  v9 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  v16.origin.x = v8 * (double)a3;
  v16.origin.y = v8 * (double)a4;
  v16.size.width = 1.0;
  v16.size.height = 1.0;
  v10 = CGImageCreateWithImageInRect(v9, v16);
  if (!v10)
    return -1;
  v11 = v10;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v13 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 4uLL, DeviceRGB, 0x4002u);
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = 1.0;
  v17.size.height = 1.0;
  CGContextDrawImage(v13, v17, v11);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v13);
  CGImageRelease(v11);
  return bswap32(data);
}

- (void)debugShowInKeyWindow
{
  void *v1;
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", a1);
  NSLog(CFSTR("imageView: %@\n call (void)[%p removeFromSuperview]"), v3, v3);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "center");
  objc_msgSend(v3, "setCenter:");
  objc_msgSend(v2, "addSubview:", v3);

}

- (void)dumpAsPNGToCachesNamed:()IMAdditions
{
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("png"));

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("png"));
    v6 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v6;
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "applicationCacheDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  UIImagePNGRepresentation(a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeToFile:atomically:", v8, 0);

}

+ (id)uncachedImageNamed:()IMAdditions
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v5, "length"))
    v7 = v5;
  else
    v7 = CFSTR("png");
  objc_msgSend(v6, "pathForResource:ofType:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithContentsOfFile:", v8);
  return v9;
}

+ (CGContext)makeDottedLineImageinRect:()IMAdditions
{
  CGColorSpace *DeviceRGB;
  CGContext *v9;
  id v10;
  CGImage *Image;
  CGImage *v12;
  __int128 v14;
  uint64_t v15;
  CGRect v16;

  v15 = *MEMORY[0x1E0C80C00];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v9 = CGBitmapContextCreate(0, (int)a3, (int)a4, 8uLL, 0, DeviceRGB, 2u);
  CGColorSpaceRelease(DeviceRGB);
  if (v9)
  {
    UIGraphicsPushContext(v9);
    CGContextSaveGState(v9);
    CGContextSetLineWidth(v9, 1.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(v9, (CGColorRef)objc_msgSend(v10, "CGColor"));

    v14 = xmmword_1DA677280;
    CGContextSetLineDash(v9, 1.0, (const CGFloat *)&v14, 2uLL);
    CGContextMoveToPoint(v9, a1, a2);
    CGContextAddLineToPoint(v9, a3, a4);
    CGContextStrokePath(v9);
    CGContextRestoreGState(v9);
    UIGraphicsPopContext();
    Image = CGBitmapContextCreateImage(v9);
    CGContextRelease(v9);
    v16.origin.x = a1;
    v16.origin.y = a2;
    v16.size.width = a3;
    v16.size.height = a4;
    v12 = CGImageCreateWithImageInRect(Image, v16);
    CGImageRelease(Image);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v12);
    v9 = (CGContext *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v12);
  }
  return v9;
}

- (id)im_flatImageWithColor:()IMAdditions
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGSize v13;
  CGRect v14;

  v4 = a3;
  objc_msgSend(a1, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(a1, "scale");
  v10 = v9;
  v13.width = v6;
  v13.height = v8;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v10);
  if (UIGraphicsGetCurrentContext())
  {
    objc_msgSend(v4, "set");
    v14.origin.x = 0.0;
    v14.origin.y = 0.0;
    v14.size.width = v6;
    v14.size.height = v8;
    UIRectFill(v14);
    objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 22, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 1.0);
    UIGraphicsGetImageFromCurrentImageContext();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    NSLog(CFSTR("_flatImageWithColor: cannot draw into NULL context"));
    v11 = 0;
  }

  return v11;
}

+ (id)scaledImageWithData:()IMAdditions
{
  void *v0;
  void *v1;
  double v2;
  double v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "scale");
    v3 = v2;
    if (v2 > 1.0)
    {
      v4 = (void *)MEMORY[0x1E0DC3870];
      v5 = objc_retainAutorelease(v0);
      objc_msgSend(v4, "imageWithCGImage:scale:orientation:", objc_msgSend(v5, "CGImage"), objc_msgSend(v5, "imageOrientation"), v3);
      v0 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v0;
}

+ (id)colorSliceImageWithColor:()IMAdditions height:
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  void *v10;
  CGSize v12;
  CGRect v13;

  v5 = (void *)MEMORY[0x1E0DC3BF8];
  v6 = a4;
  objc_msgSend(v5, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;
  v12.width = 1.0;
  v12.height = a1;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v9);

  objc_msgSend(v6, "setFill");
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = 1.0;
  v13.size.height = a1;
  UIRectFillUsingBlendMode(v13, kCGBlendModeNormal);
  UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v10;
}

+ (id)roundedCornerRectangleWithColor:()IMAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGSize v9;

  v3 = a3;
  v9.width = 11.0;
  v9.height = 11.0;
  UIGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
  objc_msgSend(v3, "set");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 11.0, 11.0, 3.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v5, "resizableImageWithCapInsets:", 5.0, 5.0, 5.0, 5.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)roundedCornerRectangleWithColorNoTemplate:()IMAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CGSize v8;

  v3 = a3;
  v8.width = 11.0;
  v8.height = 11.0;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  objc_msgSend(v3, "set");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 11.0, 11.0, 3.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v5, "resizableImageWithCapInsets:", 5.0, 5.0, 5.0, 5.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
