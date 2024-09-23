@implementation CRLRemoveImageBackgroundData

- (void)setImage:(CGImage *)a3
{
  CGImage *image;

  image = self->_image;
  if (image)
  {
    CFRelease(image);
    self->_image = 0;
  }
  self->_image = CGImageRetain(a3);
}

- (void)dealloc
{
  CGImage *image;
  objc_super v4;

  image = self->_image;
  if (image)
  {
    CFRelease(image);
    self->_image = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLRemoveImageBackgroundData;
  -[CRLRemoveImageBackgroundData dealloc](&v4, "dealloc");
}

- (CGImage)image
{
  return self->_image;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
