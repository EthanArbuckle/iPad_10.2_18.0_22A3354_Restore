@implementation OI_TSUImageM

+ (id)init
{
  return objc_alloc_init(OITSUUIImage);
}

+ (id)initWithCGImage:(CGImage *)a3
{
  return -[OITSUCGImage initWithCGImage:scale:orientation:]([OITSUCGImage alloc], "initWithCGImage:scale:orientation:", a3, 0, 0.0);
}

+ (id)initWithData:(id)a3
{
  CGImageSourceRef v4;
  void *v5;

  v4 = CGImageSourceCreateWithData((CFDataRef)a3, MEMORY[0x24BDBD1B8]);
  v5 = (void *)objc_msgSend(a1, "initWithImageSourceRef:", v4);
  if (v4)
    CFRelease(v4);
  return v5;
}

+ (id)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  return -[OITSUCGImage initWithCGImage:scale:orientation:]([OITSUCGImage alloc], "initWithCGImage:scale:orientation:", a3, a5, a4);
}

+ (id)initWithContentsOfFile:(id)a3
{
  return -[OITSUUIImage initWithContentsOfFile:]([OITSUUIImage alloc], "initWithContentsOfFile:", a3);
}

+ (id)initWithImageSourceRef:(CGImageSource *)a3
{
  CGImageSource *v3;
  CGImage *ImageAtIndex;
  OITSUCGImage *v5;

  v3 = a3;
  if (a3)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
    v3 = (CGImageSource *)TSUImageSourceOrientation(v3);
  }
  else
  {
    ImageAtIndex = 0;
  }
  v5 = -[OITSUCGImage initWithCGImage:scale:orientation:]([OITSUCGImage alloc], "initWithCGImage:scale:orientation:", ImageAtIndex, v3, 0.0);
  CGImageRelease(ImageAtIndex);
  return v5;
}

+ (id)initWithUIImage:(id)a3
{
  return -[OITSUUIImage initWithUIImage:]([OITSUUIImage alloc], "initWithUIImage:", a3);
}

@end
