@implementation _TUISearchScopeBarContainerView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _BOOL4 IsAlmostEqualFloat;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  IsAlmostEqualFloat = TUICGFloatIsAlmostEqualFloat(a3.width, 0.0);
  if (width == 1.79769313e308 || IsAlmostEqualFloat)
    width = self->_intrinsicContentSize.width;
  if (TUICGFloatIsAlmostEqualFloat(height, 0.0) || height == 1.79769313e308)
    height = self->_intrinsicContentSize.height;
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_intrinsicContentSize.width;
  height = self->_intrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIntrinsicContentSize:(CGSize)a3
{
  self->_intrinsicContentSize = a3;
}

@end
