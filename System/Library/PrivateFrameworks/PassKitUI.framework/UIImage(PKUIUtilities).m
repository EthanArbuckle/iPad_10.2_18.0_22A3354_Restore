@implementation UIImage(PKUIUtilities)

- (uint64_t)pkui_resizableImageByTilingCenterPixel
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  objc_msgSend(a1, "alignmentRectInsets");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "scale");
  v11 = 1.0 / v10;
  objc_msgSend(a1, "size");
  v13 = v12 - (v5 + v9);
  v15 = v14 - (v3 + v7);
  v16 = floor((v13 - v11) * 0.5);
  v17 = floor((v15 - v11) * 0.5);
  return objc_msgSend(a1, "resizableImageWithCapInsets:", v3 + v17, v5 + v16, v7 + v15 - (v11 + v17), v9 + v13 - (v11 + v16));
}

- (uint64_t)pkui_resizableImageByTilingHorizontally
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  objc_msgSend(a1, "alignmentRectInsets");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "scale");
  v11 = 1.0 / v10;
  objc_msgSend(a1, "size");
  v13 = v12 - (v3 + v7);
  v14 = floor((v13 - v11) * 0.5);
  return objc_msgSend(a1, "resizableImageWithCapInsets:", v3 + v14, v5, v7 + v13 - (v11 + v14), v9);
}

+ (id)imageWithPKImage:()PKUIUtilities
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "orientation") - 1;
    if (v5 >= 8)
      v5 = 0;
    v6 = _UIImageOrientationForPKImageOrientation___orientationMapping[v5];
    v7 = objc_alloc(MEMORY[0x1E0DC3870]);
    v8 = objc_retainAutorelease(v4);
    v9 = objc_msgSend(v8, "imageRef");
    objc_msgSend(v8, "scale");
    v10 = (void *)objc_msgSend(v7, "initWithCGImage:scale:orientation:", v9, v6);
    if (objc_msgSend(v8, "tiles"))
    {
      objc_msgSend(v8, "capInsets");
      objc_msgSend(v10, "resizableImageWithCapInsets:");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v12 = (void *)v11;

      v10 = v12;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "stretches"))
    {
      objc_msgSend(v8, "capInsets");
      objc_msgSend(v10, "_stretchableImageWithCapInsets:");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_10:

  return v10;
}

- (id)pkui_imageWithAlpha:()PKUIUtilities
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[6];

  objc_msgSend(a1, "size");
  v5 = v4;
  v7 = v6;
  v8 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(a1, "imageRendererFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithSize:format:", v9, v5, v7);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__UIImage_PKUIUtilities__pkui_imageWithAlpha___block_invoke;
  v15[3] = &unk_1E3E662B0;
  v15[4] = a1;
  *(double *)&v15[5] = a2;
  objc_msgSend(v10, "imageWithActions:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "alignmentRectInsets");
  objc_msgSend(v11, "imageWithAlignmentRectInsets:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageWithRenderingMode:", objc_msgSend(a1, "renderingMode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)pkui_imageWithColor:()PKUIUtilities
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = qword_1ED06C668;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&qword_1ED06C668, &__block_literal_global_204);
  objc_msgSend(a1, "pkui_imageWithColor:scale:", v5, *(double *)&qword_1ED06C660);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)pkui_imageWithColor:()PKUIUtilities scale:
{
  id v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v5 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a1 <= 0.0)
    v6 = 1.0;
  else
    v6 = 1.0 / a1;
  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v9 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithBounds:format:", v10, v7, v8, v6, v6);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__UIImage_PKUIUtilities__pkui_imageWithColor_scale___block_invoke;
  v16[3] = &unk_1E3E66288;
  v17 = v5;
  v18 = v7;
  v19 = v8;
  v20 = v6;
  v21 = v6;
  v12 = v5;
  objc_msgSend(v11, "imageWithActions:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pkui_resizableImageByTilingCenterPixel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (uint64_t)pkui_resizableImageByTilingVertically
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  objc_msgSend(a1, "alignmentRectInsets");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "scale");
  v11 = 1.0 / v10;
  objc_msgSend(a1, "size");
  v13 = v12 - (v5 + v9);
  v14 = floor((v13 - v11) * 0.5);
  return objc_msgSend(a1, "resizableImageWithCapInsets:", v3, v5 + v14, v7, v9 + v13 - (v11 + v14));
}

- (id)pkui_imageOverlaidWithColor:()PKUIUtilities
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGContext *CurrentContext;
  void *v12;
  CGSize v14;
  CGRect v15;

  v4 = a3;
  objc_msgSend(a1, "size");
  v6 = v5;
  objc_msgSend(a1, "size");
  v8 = v7;
  objc_msgSend(a1, "scale");
  v10 = v9;
  v14.width = v6;
  v14.height = v8;
  UIGraphicsBeginImageContextWithOptions(v14, 0, v10);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(a1, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceAtop);
  objc_msgSend(v4, "setFill");

  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = v6;
  v15.size.height = v8;
  CGContextFillRect(CurrentContext, v15);
  UIGraphicsGetImageFromCurrentImageContext();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v12;
}

- (double)pkui_alignmentSize
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "size");
  v3 = v2;
  objc_msgSend(a1, "alignmentRectInsets");
  return v3 - (v4 + v5);
}

- (uint64_t)pkui_alignmentSizeThatFits:()PKUIUtilities
{
  return objc_msgSend(a1, "pkui_alignmentSizeThatFits:maximumScale:", a3, a4, 1.79769313e308);
}

- (double)pkui_alignmentSizeThatFits:()PKUIUtilities maximumScale:
{
  double v6;
  double v7;
  double v8;
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
  double result;
  double v22;

  objc_msgSend(a1, "alignmentRectInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(a1, "size");
  v15 = v14 - (v9 + v13);
  v22 = v7;
  v17 = v16 - (v7 + v11);
  PKSizeScaleAspectFit();
  v20 = fmin(v18 / v15, v19 / v17);
  if (v20 > a3)
  {
    v20 = 1.0;
    v18 = v15 * a3;
    v19 = v17 * a3;
    if (a3 == 1.0)
    {
      v18 = v15;
      v19 = v17;
    }
    else
    {
      v20 = a3;
    }
  }
  *a2 = v18;
  a2[1] = v19;
  result = -(v22 * v20);
  a2[2] = result;
  a2[3] = -(v9 * v20);
  a2[4] = -(v11 * v20);
  a2[5] = -(v13 * v20);
  a2[6] = v20;
  return result;
}

- (uint64_t)pkui_alignmentSizeThatFills:()PKUIUtilities
{
  return objc_msgSend(a1, "pkui_alignmentSizeThatFills:maximumScale:", a3, a4, 1.79769313e308);
}

- (double)pkui_alignmentSizeThatFills:()PKUIUtilities maximumScale:
{
  double v6;
  double v7;
  double v8;
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
  double result;
  double v22;

  objc_msgSend(a1, "alignmentRectInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(a1, "size");
  v15 = v14 - (v9 + v13);
  v22 = v7;
  v17 = v16 - (v7 + v11);
  PKSizeAspectFill();
  v20 = fmin(v18 / v15, v19 / v17);
  if (v20 > a3)
  {
    v20 = 1.0;
    v18 = v15 * a3;
    v19 = v17 * a3;
    if (a3 == 1.0)
    {
      v18 = v15;
      v19 = v17;
    }
    else
    {
      v20 = a3;
    }
  }
  *a2 = v18;
  a2[1] = v19;
  result = -(v22 * v20);
  a2[2] = result;
  a2[3] = -(v9 * v20);
  a2[4] = -(v11 * v20);
  a2[5] = -(v13 * v20);
  a2[6] = v20;
  return result;
}

- (id)pkui_firstPixelColor
{
  CGImage *v1;
  size_t Width;
  size_t Height;
  CGColorSpace *DeviceRGB;
  CGContext *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int data;
  CGRect v12;

  v1 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  Width = CGImageGetWidth(v1);
  Height = CGImageGetHeight(v1);
  data = 0;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v5 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 4uLL, DeviceRGB, 0x4001u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetBlendMode(v5, kCGBlendModeCopy);
  v12.size.width = (double)Width;
  v12.size.height = (double)Height;
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  CGContextDrawImage(v5, v12, v1);
  CGContextRelease(v5);
  LOBYTE(v7) = BYTE1(data);
  LOBYTE(v6) = data;
  LOBYTE(v9) = HIBYTE(data);
  LOBYTE(v8) = BYTE2(data);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)v6 / 255.0, (double)v7 / 255.0, (double)v8 / 255.0, (double)v9 / 255.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
