@implementation BEImageFilter

+ (BOOL)imageIsFilteringCandidate:(CGImage *)a3
{
  if (CGImageGetHeight(a3) > 0x77)
    return 0;
  else
    return +[BEImageFilter isBlackAndWhite:](BEImageFilter, "isBlackAndWhite:", a3);
}

+ (BOOL)isBlackAndWhite:(CGImage *)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  CGColorSpace *DeviceRGB;
  CGContext *v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  BOOL v13;
  BOOL v14;
  CGRect v16;

  v4 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x9C40uLL, 0xA94D847FuLL);
  if (!v4)
    return 0;
  v5 = v4;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v7 = CGBitmapContextCreate(v5, 0x64uLL, 0x64uLL, 8uLL, 0x190uLL, DeviceRGB, 5u);
  CGColorSpaceRelease(DeviceRGB);
  if (v7)
  {
    CGContextSetInterpolationQuality(v7, kCGInterpolationNone);
    v16.size.width = 100.0;
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.height = 100.0;
    CGContextDrawImage(v7, v16, a3);
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = v5[v8];
      v11 = v10 - v5[v8 + 1];
      if (v11 < 0)
        v11 = v5[v8 + 1] - v10;
      if (v11 > 5)
        goto LABEL_10;
      v12 = v10 - v5[v8 + 2];
      if (v12 < 0)
        v12 = v5[v8 + 2] - v10;
      if (v12 >= 6)
LABEL_10:
        ++v9;
      v13 = v9 < 100;
      if (v9 > 99)
        break;
      v14 = v8 >= 0x9C3C;
      v8 += 4;
    }
    while (!v14);
    CGContextRelease(v7);
  }
  else
  {
    v13 = 0;
  }
  free(v5);
  return v13;
}

+ (id)invertedImage:(CGImage *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorInvert")));
  objc_msgSend(v4, "setDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CIImage imageWithCGImage:](CIImage, "imageWithCGImage:", a3));
  objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("inputImage"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outputImage"));
  return v6;
}

+ (id)pngDataForCIImage:(id)a3
{
  id v3;
  void *v4;
  CGColorSpace *DeviceRGB;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CIContext context](CIContext, "context"));
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "PNGRepresentationOfImage:format:colorSpace:options:", v3, kCIFormatRGBA8, DeviceRGB, &__NSDictionary0__struct));

  CGColorSpaceRelease(DeviceRGB);
  return v6;
}

@end
