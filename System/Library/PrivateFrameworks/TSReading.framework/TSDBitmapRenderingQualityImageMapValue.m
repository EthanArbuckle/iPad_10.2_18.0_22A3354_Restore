@implementation TSDBitmapRenderingQualityImageMapValue

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->mDegradedImageRef);
  v3.receiver = self;
  v3.super_class = (Class)TSDBitmapRenderingQualityImageMapValue;
  -[TSDBitmapRenderingQualityImageMapValue dealloc](&v3, sel_dealloc);
}

- (void)addSize:(CGSize)a3
{
  double v4;
  double v5;
  double width;
  double height;
  CGImage *mDegradedImageRef;

  v4 = TSDCeilSize(a3.width);
  width = self->mMaxSize.width;
  height = self->mMaxSize.height;
  if (v4 > width || v5 > height)
  {
    if (width > v4)
      v4 = self->mMaxSize.width;
    if (height > v5)
      v5 = self->mMaxSize.height;
    self->mMaxSize.width = v4;
    self->mMaxSize.height = v5;
    mDegradedImageRef = self->mDegradedImageRef;
    if (mDegradedImageRef)
    {
      CGImageRelease(mDegradedImageRef);
      self->mDegradedImageRef = 0;
    }
  }
}

- (CGImage)degradedImageRefForForProvider:(id)a3 quality:(int)a4 canvasScale:(float)a5
{
  CGImage *result;
  void *v10;
  uint64_t v11;
  BOOL v12;
  _BOOL8 v13;
  float v14;
  double v15;
  CGImage *v16;

  result = self->mDegradedImageRef;
  if (!result)
  {
    if (a4 == 2)
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBitmapRenderingQualityImageMapValue degradedImageRefForForProvider:quality:canvasScale:]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBitmapRenderingQualityInfo.m"), 116, CFSTR("Shouldn't be called for high DPI"));
    }
    v12 = a4 == 1;
    v13 = a4 != 1;
    v14 = 2.0833;
    if (!v12)
      v14 = 1.0;
    v15 = TSDMultiplySizeScalar(self->mMaxSize.width, self->mMaxSize.height, (float)(v14 * a5));
    v16 = (CGImage *)objc_msgSend(a3, "CGImageForSize:lowQuality:", v13, TSDCeilSize(v15));
    self->mDegradedImageRef = v16;
    CGImageRetain(v16);
    return self->mDegradedImageRef;
  }
  return result;
}

@end
