@implementation CRLSwatchRenderingResult

+ (id)renderingResultWithForeground:(CGImage *)a3 background:(CGImage *)a4
{
  CRLSwatchRenderingResult *v6;

  v6 = objc_alloc_init(CRLSwatchRenderingResult);
  v6->foreground = CGImageRetain(a3);
  v6->background = CGImageRetain(a4);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->foreground);
  CGImageRelease(self->background);
  v3.receiver = self;
  v3.super_class = (Class)CRLSwatchRenderingResult;
  -[CRLSwatchRenderingResult dealloc](&v3, "dealloc");
}

- (CGImage)foreground
{
  return self->foreground;
}

- (CGImage)background
{
  return self->background;
}

@end
