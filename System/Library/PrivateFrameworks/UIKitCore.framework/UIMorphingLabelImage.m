@implementation UIMorphingLabelImage

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentsRect:(CGRect)a3
{
  self->_contentsRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
