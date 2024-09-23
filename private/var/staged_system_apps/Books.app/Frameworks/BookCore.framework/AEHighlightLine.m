@implementation AEHighlightLine

- (void)dealloc
{
  objc_super v3;

  -[AEHighlightLine setMultiplyImage:](self, "setMultiplyImage:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AEHighlightLine;
  -[AEHighlightLine dealloc](&v3, "dealloc");
}

- (void)setMultiplyImage:(CGImage *)a3
{
  CGImage *mMultiplyImage;

  mMultiplyImage = self->mMultiplyImage;
  if (mMultiplyImage != a3)
  {
    if (mMultiplyImage)
      CFRelease(mMultiplyImage);
    self->mMultiplyImage = 0;
    if (a3)
      self->mMultiplyImage = (CGImage *)CFRetain(a3);
  }
}

- (CALayer)contentLayer
{
  return self->mContentLayer;
}

- (void)setContentLayer:(id)a3
{
  objc_storeStrong((id *)&self->mContentLayer, a3);
}

- (CGRect)fullLineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mFullLineRect.origin.x;
  y = self->mFullLineRect.origin.y;
  width = self->mFullLineRect.size.width;
  height = self->mFullLineRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFullLineRect:(CGRect)a3
{
  self->mFullLineRect = a3;
}

- (CGRect)currentLineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mCurrentLineRect.origin.x;
  y = self->mCurrentLineRect.origin.y;
  width = self->mCurrentLineRect.size.width;
  height = self->mCurrentLineRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentLineRect:(CGRect)a3
{
  self->mCurrentLineRect = a3;
}

- (double)underlinePosition
{
  return self->mUnderlinePosition;
}

- (void)setUnderlinePosition:(double)a3
{
  self->mUnderlinePosition = a3;
}

- (int)underlineDirection
{
  return self->mUnderlineDirection;
}

- (void)setUnderlineDirection:(int)a3
{
  self->mUnderlineDirection = a3;
}

- (CGImage)multiplyImage
{
  return self->mMultiplyImage;
}

- (BOOL)lightenBlend
{
  return self->mLightenBlend;
}

- (void)setLightenBlend:(BOOL)a3
{
  self->mLightenBlend = a3;
}

- (BOOL)includesCapSpace
{
  return self->mIncludesCapSpace;
}

- (void)setIncludesCapSpace:(BOOL)a3
{
  self->mIncludesCapSpace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContentLayer, 0);
  objc_storeStrong((id *)&self->mLayer, 0);
}

@end
