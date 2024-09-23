@implementation _CRLImageM

+ (id)init
{
  return objc_alloc_init(CRLUIImage);
}

+ (id)initWithCGImage:(CGImage *)a3
{
  return -[CRLCGImage initWithCGImage:scale:orientation:]([CRLCGImage alloc], "initWithCGImage:scale:orientation:", a3, 0, 0.0);
}

+ (id)initWithData:(id)a3
{
  CGImageSourceRef v4;
  id v5;

  v4 = CGImageSourceCreateWithData((CFDataRef)a3, (CFDictionaryRef)&__NSDictionary0__struct);
  v5 = objc_msgSend(a1, "initWithImageSourceRef:", v4);
  if (v4)
    CFRelease(v4);
  return v5;
}

+ (id)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  return -[CRLCGImage initWithCGImage:scale:orientation:]([CRLCGImage alloc], "initWithCGImage:scale:orientation:", a3, a5, a4);
}

+ (id)initWithContentsOfFile:(id)a3
{
  id v3;
  CRLUIImage *v4;

  v3 = a3;
  v4 = -[CRLUIImage initWithContentsOfFile:]([CRLUIImage alloc], "initWithContentsOfFile:", v3);

  return v4;
}

+ (id)initWithImageSourceRef:(CGImageSource *)a3
{
  CGImageSource *v3;
  CGImage *ImageAtIndex;
  CRLCGImage *v5;

  v3 = a3;
  if (a3)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
    v3 = (CGImageSource *)sub_1003F61D4(v3);
  }
  else
  {
    ImageAtIndex = 0;
  }
  v5 = -[CRLCGImage initWithCGImage:scale:orientation:]([CRLCGImage alloc], "initWithCGImage:scale:orientation:", ImageAtIndex, v3, 0.0);
  CGImageRelease(ImageAtIndex);
  return v5;
}

+ (id)initWithUIImage:(id)a3
{
  id v3;
  CRLUIImage *v4;

  v3 = a3;
  v4 = -[CRLUIImage initWithUIImage:]([CRLUIImage alloc], "initWithUIImage:", v3);

  return v4;
}

@end
