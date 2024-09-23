@implementation _TSUImageM

+ (id)init
{
  return objc_alloc_init(TSUUIImage);
}

+ (id)initWithCGImage:(CGImage *)a3
{
  return -[TSUCGImage initWithCGImage:scale:orientation:]([TSUCGImage alloc], "initWithCGImage:scale:orientation:", a3, 0, 0.0);
}

+ (id)initWithData:(id)a3
{
  return -[TSUUIImage initWithData:]([TSUUIImage alloc], "initWithData:", a3);
}

+ (id)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  return -[TSUCGImage initWithCGImage:scale:orientation:]([TSUCGImage alloc], "initWithCGImage:scale:orientation:", a3, a5, a4);
}

+ (id)initWithContentsOfFile:(id)a3
{
  return -[TSUUIImage initWithContentsOfFile:]([TSUUIImage alloc], "initWithContentsOfFile:", a3);
}

+ (id)initWithImageSourceRef:(CGImageSource *)a3
{
  CGImageSource *v3;
  CGImage *ImageAtIndex;
  TSUCGImage *v5;

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
  v5 = -[TSUCGImage initWithCGImage:scale:orientation:]([TSUCGImage alloc], "initWithCGImage:scale:orientation:", ImageAtIndex, v3, 0.0);
  CGImageRelease(ImageAtIndex);
  return v5;
}

@end
