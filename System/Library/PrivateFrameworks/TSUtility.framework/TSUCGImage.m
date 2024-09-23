@implementation TSUCGImage

- (TSUCGImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  TSUCGImage *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSUCGImage;
  v8 = -[TSUImage init](&v10, sel_init);
  if (v8)
  {
    v8->mCGImage = CGImageRetain(a3);
    v8->mOrientation = a5;
    v8->mScale = a4;
    if (!v8->mCGImage)
    {

      return 0;
    }
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCGImage:scale:orientation:", self->mCGImage, self->mOrientation, self->mScale);
}

- (CGImage)CGImage
{
  return self->mCGImage;
}

- (CGImage)CGImageForSize:(CGSize)a3
{
  return self->mCGImage;
}

- (CGSize)size
{
  double v3;
  double v4;
  double Width;
  size_t Height;
  double v7;
  int64_t mOrientation;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[TSUCGImage scale](self, "scale");
  v4 = v3;
  Width = (double)CGImageGetWidth(self->mCGImage);
  Height = CGImageGetHeight(self->mCGImage);
  v7 = (double)Height;
  mOrientation = self->mOrientation;
  if ((mOrientation & 2) != 0)
    v9 = (double)Height;
  else
    v9 = Width;
  if ((mOrientation & 2) != 0)
    v7 = Width;
  v10 = v7 / v4;
  v11 = v9 / v4;
  result.height = v10;
  result.width = v11;
  return result;
}

- (double)scale
{
  double result;

  result = self->mScale;
  if (result == 0.0)
    return 1.0;
  return result;
}

- (int64_t)imageOrientation
{
  return self->mOrientation;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->mCGImage);
  v3.receiver = self;
  v3.super_class = (Class)TSUCGImage;
  -[TSUImage dealloc](&v3, sel_dealloc);
}

@end
