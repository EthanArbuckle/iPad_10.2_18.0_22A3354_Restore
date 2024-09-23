@implementation UIImage(SearchToShare)

- (id)sts_imageWithScalingFactor:()SearchToShare
{
  double v2;
  id v3;
  CGImage *v4;
  float v5;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  CGColorSpace *ColorSpace;
  CGContext *v9;
  CGImage *Image;
  void *v11;
  void *v12;
  CGRect v14;

  if (a2 <= 0.0)
  {
    v12 = 0;
  }
  else
  {
    v2 = a2;
    v3 = objc_retainAutorelease(a1);
    v4 = (CGImage *)objc_msgSend(v3, "CGImage");
    v5 = (double)CGImageGetWidth(v4) * v2;
    *(float *)&v2 = (double)CGImageGetHeight(v4) * v2;
    BitsPerComponent = CGImageGetBitsPerComponent(v4);
    BytesPerRow = CGImageGetBytesPerRow(v4);
    ColorSpace = CGImageGetColorSpace(v4);
    v9 = CGBitmapContextCreate(0, (unint64_t)v5, (unint64_t)*(float *)&v2, BitsPerComponent, BytesPerRow, ColorSpace, 0x2006u);
    v14.size.width = v5;
    v14.size.height = *(float *)&v2;
    v14.origin.x = 0.0;
    v14.origin.y = 0.0;
    CGContextDrawImage(v9, v14, v4);
    Image = CGBitmapContextCreateImage(v9);
    CGContextRelease(v9);
    v11 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(v3, "scale");
    objc_msgSend(v11, "imageWithCGImage:scale:orientation:", Image, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(Image);
  }
  return v12;
}

- (id)sts_nonAlphaImage
{
  id v1;
  CGImage *NonAlphaImageFromImage;
  void *v3;
  void *v4;

  v1 = objc_retainAutorelease(a1);
  NonAlphaImageFromImage = createNonAlphaImageFromImage((CGImage *)objc_msgSend(v1, "CGImage"));
  v3 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v1, "scale");
  objc_msgSend(v3, "imageWithCGImage:scale:orientation:", NonAlphaImageFromImage, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(NonAlphaImageFromImage);
  return v4;
}

@end
