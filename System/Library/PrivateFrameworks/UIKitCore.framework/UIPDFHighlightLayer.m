@implementation UIPDFHighlightLayer

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPDFHighlightLayer;
  -[UIPDFHighlightLayer dealloc](&v3, sel_dealloc);
  CGPathRelease(self->_clipPath);
  CGPathRelease(self->_borderPath);
}

- (CGPath)clipPath
{
  return self->_clipPath;
}

- (void)setClipPath:(CGPath *)a3
{
  CGPathRetain(a3);
  CGPathRelease(self->_clipPath);
  self->_clipPath = a3;
}

- (CGPath)borderPath
{
  return self->_borderPath;
}

- (void)setBorderPath:(CGPath *)a3
{
  CGPathRetain(a3);
  CGPathRelease(self->_borderPath);
  self->_borderPath = a3;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->offset.x;
  y = self->offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->offset = a3;
}

@end
