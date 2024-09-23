@implementation SXImageDecodingTools

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_sharedInstance;
}

void __38__SXImageDecodingTools_sharedInstance__block_invoke()
{
  SXImageDecodingTools *v0;
  void *v1;

  v0 = objc_alloc_init(SXImageDecodingTools);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (id)imageFromData:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  CGImage *v14;
  void *v15;

  height = a4.height;
  width = a4.width;
  v7 = (objc_class *)MEMORY[0x24BDF6AC8];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithData:", v8);

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;

  v13 = objc_retainAutorelease(v9);
  v14 = -[SXImageDecodingTools newImageByDecodingImage:size:](self, "newImageByDecodingImage:size:", objc_msgSend(v13, "CGImage"), width * v12, height * v12);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:scale:orientation:", v14, 0, v12);
  CGImageRelease(v14);

  return v15;
}

- (id)imageFromData:(id)a3
{
  CGImageSource *v3;
  const __CFDictionary *v4;
  CGImage *ImageAtIndex;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v3 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  v8 = *MEMORY[0x24BDD97D8];
  v9[0] = *MEMORY[0x24BDBD270];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v3, 0, v4);
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", ImageAtIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(ImageAtIndex);
  CFRelease(v3);

  return v6;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a3, a4);
}

- (id)decodeImage:(CGImage *)a3
{
  CGImage *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = -[SXImageDecodingTools newImageByDecodingImage:size:](self, "newImageByDecodingImage:size:", a3, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v4 = objc_alloc(MEMORY[0x24BDF6AC8]);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v6 = (void *)objc_msgSend(v4, "initWithCGImage:scale:orientation:", v3, 0);

  CGImageRelease(v3);
  return v6;
}

- (CGImage)newImageByDecodingImage:(CGImage *)a3 size:(CGSize)a4
{
  double height;
  double width;
  size_t v8;
  size_t v9;
  CGColorSpace *v10;
  CGColorSpace *ColorSpace;
  CGContext *v12;
  CGImage *Image;
  CGRect v15;

  height = a4.height;
  width = a4.width;
  CGImageRetain(a3);
  v8 = CGImageGetWidth(a3);
  v9 = CGImageGetHeight(a3);
  v10 = -[SXImageDecodingTools RGBColorSpace](self, "RGBColorSpace");
  if (objc_msgSend(MEMORY[0x24BDF69C8], "sx_isSpectreDevice"))
  {
    ColorSpace = CGImageGetColorSpace(a3);
    if (CGColorSpaceIsWideGamutRGB(ColorSpace))
      v10 = -[SXImageDecodingTools P3ColorSpace](self, "P3ColorSpace");
  }
  if (width <= 0.0 || height <= 0.0)
  {
    height = (double)v9;
    width = (double)v8;
  }
  v12 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, 0, v10, 2u);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = width;
  v15.size.height = height;
  CGContextDrawImage(v12, v15, a3);
  Image = CGBitmapContextCreateImage(v12);
  CGContextRelease(v12);
  CGImageRelease(a3);
  return Image;
}

- (id)loadAnimatedImageFromImageData:(id)a3 size:(CGSize)a4
{
  return +[SXAnimatedImage animatedImageWithData:size:](SXAnimatedImage, "animatedImageWithData:size:", a3, a4.width, a4.height);
}

- (__CFString)contentTypeForImageData:(id)a3
{
  __CFString *result;
  __CFString **v4;
  unsigned __int8 v5;

  v5 = 0;
  objc_msgSend(a3, "getBytes:length:", &v5, 1);
  result = 0;
  if (v5 <= 0x4Cu)
  {
    if (v5 == 71)
    {
      v4 = (__CFString **)MEMORY[0x24BDC1780];
      return *v4;
    }
    if (v5 != 73)
      return result;
  }
  else if (v5 != 77)
  {
    if (v5 == 137)
    {
      v4 = (__CFString **)MEMORY[0x24BDC1820];
    }
    else
    {
      if (v5 != 255)
        return result;
      v4 = (__CFString **)MEMORY[0x24BDC17C0];
    }
    return *v4;
  }
  v4 = (__CFString **)MEMORY[0x24BDC1880];
  return *v4;
}

- (BOOL)dataIsAnimatedImage:(id)a3
{
  const __CFData *v4;
  __CFString *v5;
  CGImageSource *v7;
  BOOL v8;

  v4 = (const __CFData *)a3;
  v5 = -[SXImageDecodingTools contentTypeForImageData:](self, "contentTypeForImageData:", v4);
  if (v5 == (__CFString *)*MEMORY[0x24BDC1820] || v5 == (__CFString *)*MEMORY[0x24BDC1780])
  {
    v7 = CGImageSourceCreateWithData(v4, 0);
    v8 = CGImageSourceGetCount(v7) > 1;
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGColorSpace)RGBColorSpace
{
  if (RGBColorSpace_onceToken != -1)
    dispatch_once(&RGBColorSpace_onceToken, &__block_literal_global_7);
  return (CGColorSpace *)RGBColorSpace_colorSpace;
}

CGColorSpaceRef __37__SXImageDecodingTools_RGBColorSpace__block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  RGBColorSpace_colorSpace = (uint64_t)result;
  return result;
}

- (CGColorSpace)P3ColorSpace
{
  if (P3ColorSpace_onceToken != -1)
    dispatch_once(&P3ColorSpace_onceToken, &__block_literal_global_8);
  return (CGColorSpace *)P3ColorSpace_colorSpace;
}

CGColorSpaceRef __36__SXImageDecodingTools_P3ColorSpace__block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
  P3ColorSpace_colorSpace = (uint64_t)result;
  return result;
}

@end
