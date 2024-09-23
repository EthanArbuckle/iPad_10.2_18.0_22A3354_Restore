@implementation BICImage

+ (id)imageWithCGImage:(CGImage *)a3
{
  BICImage *v4;

  v4 = objc_alloc_init(BICImage);
  -[BICImage setCGImage:](v4, "setCGImage:", a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_CGImage);
  v3.receiver = self;
  v3.super_class = (Class)BICImage;
  -[BICImage dealloc](&v3, "dealloc");
}

- (void)setCGImage:(CGImage *)a3
{
  self->_CGImage = CGImageRetain(a3);
}

- (CGImage)CGImage
{
  CGImage *result;
  CGImageRef v3;

  result = self->_CGImage;
  if (result)
  {
    v3 = CGImageRetain(result);
    return (CGImage *)CFAutorelease(v3);
  }
  return result;
}

@end
