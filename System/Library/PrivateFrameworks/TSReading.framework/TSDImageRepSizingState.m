@implementation TSDImageRepSizingState

- (TSDImageRepSizingState)initWithDesiredSize:(CGSize)a3 provider:(id)a4 maskPath:(CGPath *)a5 wideGamutCanvas:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  void *v12;
  uint64_t v13;
  TSDImageRepSizingState *v14;
  TSDImageRepSizingState *v15;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  if (!a4)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageRepSizingState initWithDesiredSize:provider:maskPath:wideGamutCanvas:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRepSizingState.m"), 23, CFSTR("invalid nil value for '%s'"), "provider");
  }
  v17.receiver = self;
  v17.super_class = (Class)TSDImageRepSizingState;
  v14 = -[TSDImageRepSizingState init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->mDesiredSize.width = width;
    v14->mDesiredSize.height = height;
    v14->mProvider = (TSDImageProvider *)a4;
    v15->mStatus = 0;
    v15->mWideGamutCanvas = a6;
    if (a5)
      v15->mMaskPath = CGPathRetain(a5);
  }
  return v15;
}

- (void)dealloc
{
  CGPath *mMaskPath;
  objc_super v4;

  CGImageRelease(self->mSizedImage);
  mMaskPath = self->mMaskPath;
  if (mMaskPath)
    CGPathRelease(mMaskPath);
  v4.receiver = self;
  v4.super_class = (Class)TSDImageRepSizingState;
  -[TSDImageRepSizingState dealloc](&v4, sel_dealloc);
}

- (void)setSizedImage:(CGImage *)a3
{
  CGImage *mSizedImage;

  mSizedImage = self->mSizedImage;
  if (mSizedImage != a3)
  {
    CGImageRelease(mSizedImage);
    self->mSizedImage = CGImageRetain(a3);
  }
}

- (BOOL)sizedImageHasMask
{
  return self->mMaskPath != 0;
}

- (void)generateSizedImage
{
  double width;
  double height;
  double v5;
  double v6;
  BOOL v7;
  char v8;
  CGContext *v9;
  CGContext *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPath *mMaskPath;

  CGImageRelease(self->mSizedImage);
  self->mSizedImage = 0;
  if (!self->mStatus)
  {
    width = self->mDesiredSize.width;
    height = self->mDesiredSize.height;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((-[TSDImageProvider naturalSize](self->mProvider, "naturalSize"), width == v6)
        ? (v7 = height == v5)
        : (v7 = 0),
          v7 && !self->mMaskPath))
    {
      self->mSizedImage = CGImageRetain((CGImageRef)-[TSDImageProvider CGImageForNaturalSize](self->mProvider, "CGImageForNaturalSize"));
      self->mSizedImageOrientation = -[TSDImageProvider orientation](self->mProvider, "orientation");
    }
    else
    {
      v8 = 11;
      if (self->mWideGamutCanvas
        && !-[TSDImageProvider isError](self->mProvider, "isError")
        && -[TSDImageProvider imageGamut](self->mProvider, "imageGamut") != 2)
      {
        v8 = 43;
      }
      v9 = TSDBitmapContextCreate(v8, width);
      if (v9)
      {
        v10 = v9;
        CGContextSetInterpolationQuality(v9, kCGInterpolationHigh);
        v11 = TSDRectWithSize();
        v13 = v12;
        v15 = v14;
        v17 = v16;
        mMaskPath = self->mMaskPath;
        if (mMaskPath)
        {
          CGContextAddPath(v10, mMaskPath);
          CGContextClip(v10);
        }
        -[TSDImageProvider drawImageInContext:rect:](self->mProvider, "drawImageInContext:rect:", v10, v11, v13, v15, v17);
        self->mSizedImage = CGBitmapContextCreateImage(v10);
        self->mSizedImageOrientation = 0;
        CGContextRelease(v10);
      }
    }
  }
}

- (BOOL)wideGamut
{
  return self->mWideGamutCanvas;
}

- (CGSize)desiredSize
{
  double width;
  double height;
  CGSize result;

  width = self->mDesiredSize.width;
  height = self->mDesiredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDesiredSize:(CGSize)a3
{
  self->mDesiredSize = a3;
}

- (TSDImageProvider)provider
{
  return self->mProvider;
}

- (void)setProvider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)status
{
  return self->mStatus;
}

- (void)setStatus:(int)a3
{
  self->mStatus = a3;
}

- (CGImage)sizedImage
{
  return self->mSizedImage;
}

- (int64_t)sizedImageOrientation
{
  return self->mSizedImageOrientation;
}

- (void)setSizedImageOrientation:(int64_t)a3
{
  self->mSizedImageOrientation = a3;
}

- (CGPath)maskPath
{
  return self->mMaskPath;
}

- (BOOL)sizedImageIncludesAdjustments
{
  return self->mIncludesAdjustments;
}

- (void)setSizedImageIncludesAdjustments:(BOOL)a3
{
  self->mIncludesAdjustments = a3;
}

@end
