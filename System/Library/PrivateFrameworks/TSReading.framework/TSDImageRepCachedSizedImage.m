@implementation TSDImageRepCachedSizedImage

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->mImageRef);
  CGPathRelease(self->mImageMaskPath);
  v3.receiver = self;
  v3.super_class = (Class)TSDImageRepCachedSizedImage;
  -[TSDImageRepCachedSizedImage dealloc](&v3, sel_dealloc);
}

- (CGImage)imageRef
{
  return self->mImageRef;
}

- (void)setImageRef:(CGImage *)a3
{
  CGImage *mImageRef;

  mImageRef = self->mImageRef;
  if (mImageRef != a3)
  {
    if (mImageRef)
    {
      CFRelease(mImageRef);
      self->mImageRef = 0;
    }
    self->mImageRef = CGImageRetain(a3);
  }
}

- (CGPath)imageMaskPath
{
  return self->mImageMaskPath;
}

- (void)setImageMaskPath:(CGPath *)a3
{
  CGPath *mImageMaskPath;

  mImageMaskPath = self->mImageMaskPath;
  if (mImageMaskPath != a3)
  {
    if (mImageMaskPath)
    {
      CFRelease(mImageMaskPath);
      self->mImageMaskPath = 0;
    }
    self->mImageMaskPath = CGPathRetain(a3);
  }
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->mImageSize.width;
  height = self->mImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->mImageSize = a3;
}

- (int64_t)imageOrientation
{
  return self->mImageOrientation;
}

- (void)setImageOrientation:(int64_t)a3
{
  self->mImageOrientation = a3;
}

- (BOOL)imageHasMaskBakedIn
{
  return self->mImageHasMaskBakedIn;
}

- (void)setImageHasMaskBakedIn:(BOOL)a3
{
  self->mImageHasMaskBakedIn = a3;
}

- (BOOL)imageHasAdjustmentsBakedImage
{
  return self->mImageHasAdjustmentsBakedImage;
}

- (void)setImageHasAdjustmentsBakedImage:(BOOL)a3
{
  self->mImageHasAdjustmentsBakedImage = a3;
}

@end
