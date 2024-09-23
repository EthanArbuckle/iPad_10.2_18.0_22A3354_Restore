@implementation VUIGradientMaskProperties

+ (id)defaultGradientMaskProperties
{
  VUIGradientMaskProperties *v2;

  v2 = objc_alloc_init(VUIGradientMaskProperties);
  -[VUIGradientMaskProperties setMinPadding:](v2, "setMinPadding:", 100.0, 100.0, 150.0, 100.0);
  -[VUIGradientMaskProperties setMinLengths:](v2, "setMinLengths:", 90.0, 90.0);
  return v2;
}

- (UIEdgeInsets)minPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_minPadding.top;
  left = self->_minPadding.left;
  bottom = self->_minPadding.bottom;
  right = self->_minPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMinPadding:(UIEdgeInsets)a3
{
  self->_minPadding = a3;
}

- (CGSize)minLengths
{
  double width;
  double height;
  CGSize result;

  width = self->_minLengths.width;
  height = self->_minLengths.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinLengths:(CGSize)a3
{
  self->_minLengths = a3;
}

@end
