@implementation ACMUIImageUtilities

+ (int)imageResolutionFactor
{
  double v2;
  int v3;
  float v4;
  double v5;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
  if (v2 <= 1.00999999)
    v3 = 1;
  else
    v3 = 2;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "systemVersion"), "floatValue");
  if (v4 >= 8.0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
    if (v5 > 2.00999999)
      return 3;
  }
  return v3;
}

+ (id)transparentImageWithSize:(CGSize)a3
{
  UIImage *ImageFromCurrentImageContext;

  UIGraphicsBeginImageContextWithOptions(a3, 0, 0.0);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return ImageFromCurrentImageContext;
}

+ (id)cropServerImage:(id)a3 bySize:(CGSize)a4
{
  double height;
  double width;
  int v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGImage *v16;
  CGImage *v17;
  void *v18;
  CGRect v20;

  height = a4.height;
  width = a4.width;
  v7 = objc_msgSend(a1, "imageResolutionFactor");
  v8 = width * (double)v7;
  v9 = height * (double)v7;
  objc_msgSend(a3, "size");
  v10 = v8 + 0.0;
  v11 = v9 + 0.0;
  v13 = v12 + v8 * -2.0;
  v15 = v14 + v9 * -2.0;
  v16 = (CGImage *)objc_msgSend(a3, "CGImage");
  v20.origin.x = v10;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  v17 = CGImageCreateWithImageInRect(v16, v20);
  v18 = (void *)objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v17);
  CGImageRelease(v17);
  return v18;
}

+ (id)cropLocalImage:(id)a3 bySize:(CGSize)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGImage *v17;
  CGImage *v18;
  void *v19;
  CGRect v21;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "size");
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(a1, "imageResolutionFactor");
  v13 = (double)v12 * width + 0.0;
  v14 = (double)v12 * height + 0.0;
  v15 = (v9 + width * -2.0) * (double)v12;
  v16 = (v11 + height * -2.0) * (double)v12;
  v17 = (CGImage *)objc_msgSend(a3, "CGImage");
  v21.origin.x = v13;
  v21.origin.y = v14;
  v21.size.width = v15;
  v21.size.height = v16;
  v18 = CGImageCreateWithImageInRect(v17, v21);
  v19 = (void *)objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v18);
  CGImageRelease(v18);
  return v19;
}

@end
