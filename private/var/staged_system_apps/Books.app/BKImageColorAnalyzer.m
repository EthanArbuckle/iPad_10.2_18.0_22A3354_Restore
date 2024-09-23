@implementation BKImageColorAnalyzer

+ (id)analyzeColor:(id)a3
{
  CGImage *v3;
  size_t Width;
  size_t Height;
  void *v6;
  CGColorSpace *v7;
  CGImageRef CopyWithColorSpace;
  CGImage *v9;
  CGContext *v10;
  double v12[38];
  CGRect v13;

  v3 = (CGImage *)objc_msgSend(objc_retainAutorelease(a3), "CGImage");
  Width = CGImageGetWidth(v3);
  Height = CGImageGetHeight(v3);
  v6 = 0;
  if (Width && Height)
  {
    v7 = (CGColorSpace *)sub_1000C3308();
    if (v7)
    {
      CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v3, v7);
      v9 = CopyWithColorSpace;
      if (CopyWithColorSpace)
        v3 = CopyWithColorSpace;
    }
    else
    {
      v9 = 0;
    }
    v10 = (CGContext *)TSDBitmapContextCreate(3, 22.0, 22.0);
    CGContextSetInterpolationQuality(v10, kCGInterpolationHigh);
    if (v10)
    {
      v13.origin.x = CGPointZero.x;
      v13.origin.y = CGPointZero.y;
      v13.size.width = 22.0;
      v13.size.height = 22.0;
      CGContextDrawImage(v10, v13, v3);
    }
    if (v9)
      CGImageRelease(v9);
    sub_10012D688(v12);
    if (sub_10013BC24((_BOOL8)v10, (uint64_t)v12))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v12[0], v12[1], v12[2], v12[3]));
      if (!v10)
        return v6;
      goto LABEL_16;
    }
    v6 = 0;
    if (v10)
LABEL_16:
      CGContextRelease(v10);
  }
  return v6;
}

+ (BOOL)isDarkColor:(CGColor *)a3
{
  double v4[4];

  sub_10007F80C((int)v4, a3);
  return sub_10013BDAC(v4[0], v4[1], v4[2], v4[3]);
}

+ (double)colorLuminance:(CGColor *)a3
{
  double result;
  __int128 v4[2];

  sub_10007F80C((int)v4, a3);
  sub_10007FB30(v4);
  return result;
}

@end
