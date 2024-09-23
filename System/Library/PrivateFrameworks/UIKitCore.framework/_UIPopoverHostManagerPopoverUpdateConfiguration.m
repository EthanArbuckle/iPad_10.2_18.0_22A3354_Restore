@implementation _UIPopoverHostManagerPopoverUpdateConfiguration

- (CGRect)sourceRectInParentUIWindow
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRectInParentUIWindow.origin.x;
  y = self->_sourceRectInParentUIWindow.origin.y;
  width = self->_sourceRectInParentUIWindow.size.width;
  height = self->_sourceRectInParentUIWindow.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRectInParentUIWindow:(CGRect)a3
{
  self->_sourceRectInParentUIWindow = a3;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (int64_t)preferredHorizontalAlignment
{
  return self->_preferredHorizontalAlignment;
}

- (void)setPreferredHorizontalAlignment:(int64_t)a3
{
  self->_preferredHorizontalAlignment = a3;
}

- (BOOL)showsArrow
{
  return self->_showsArrow;
}

- (void)setShowsArrow:(BOOL)a3
{
  self->_showsArrow = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

@end
