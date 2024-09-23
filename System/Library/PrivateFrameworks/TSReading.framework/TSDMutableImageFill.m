@implementation TSDMutableImageFill

- (void)setTintColor:(id)a3
{
  TSUColor *mTintColor;

  mTintColor = self->super.mTintColor;
  if ((-[TSUColor isEqual:](mTintColor, "isEqual:") & 1) == 0)
  {

    self->super.mStandardSizeTintedImage = 0;
    self->super.mHalfSizeTintedImage = 0;

    self->super.mQuarterSizeTintedImage = 0;
    self->super.mReferenceColor = 0;
    self->super.mTintColor = (TSUColor *)objc_msgSend(a3, "copy");

  }
}

- (void)setTechnique:(int)a3
{
  self->super.mTechnique = a3;
}

- (void)setImageData:(id)a3
{
  id v3;
  id v5;
  BOOL v6;
  void *v7;

  if (self->super.mImageData != a3)
  {
    v3 = a3;

    self->super.mStandardSizeTintedImage = 0;
    self->super.mHalfSizeTintedImage = 0;

    self->super.mQuarterSizeTintedImage = 0;
    v5 = TSDResampleImageData(v3, 0, 0, 4096.0, 4096.0);
    if (v5)
      v6 = v5 == v3;
    else
      v6 = 1;
    if (v6)
      v7 = v3;
    else
      v7 = v5;
    if (v6)
      v3 = 0;

    self->super.mImageData = (TSPData *)v7;
    self->super.mReferenceColor = 0;
    self->super.mFillSize = (CGSize)*MEMORY[0x24BDBF148];

    self->super.mOriginalImageData = 0;
    self->super.mOriginalImageData = (TSPData *)v3;
    -[TSDMutableImageFill setInterpretsUntaggedImageDataAsGeneric:](self, "setInterpretsUntaggedImageDataAsGeneric:", 0);
  }
}

- (void)setFillSize:(CGSize)a3
{
  self->super.mFillSize = a3;
}

- (void)setScale:(double)a3
{
  double v5;
  double v6;
  double v7;

  objc_msgSend(-[TSDImageFill p_validatedImageProvider](self, "p_validatedImageProvider"), "naturalSize");
  v7 = TSDMultiplySizeScalar(v5, v6, a3);
  -[TSDMutableImageFill setFillSize:](self, "setFillSize:", TSDCeilSize(v7));
}

- (void)setInterpretsUntaggedImageDataAsGeneric:(BOOL)a3
{
  if (self->super.mInterpretsUntaggedImageDataAsGeneric != a3)
    self->super.mInterpretsUntaggedImageDataAsGeneric = a3;
}

@end
