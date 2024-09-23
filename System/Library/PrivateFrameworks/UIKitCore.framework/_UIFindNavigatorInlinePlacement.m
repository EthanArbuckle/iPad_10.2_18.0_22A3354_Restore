@implementation _UIFindNavigatorInlinePlacement

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

- (UIView)hostView
{
  return self->_hostView;
}

- (void)setHostView:(id)a3
{
  objc_storeStrong((id *)&self->_hostView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostView, 0);
}

@end
