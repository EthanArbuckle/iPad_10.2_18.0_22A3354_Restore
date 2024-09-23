@implementation VUIBadgeViewWrapper

- (UIView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (IKViewElement)badgeElement
{
  return self->_badgeElement;
}

- (void)setBadgeElement:(id)a3
{
  objc_storeStrong((id *)&self->_badgeElement, a3);
}

- (CGSize)badgeSize
{
  double width;
  double height;
  CGSize result;

  width = self->_badgeSize.width;
  height = self->_badgeSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBadgeSize:(CGSize)a3
{
  self->_badgeSize = a3;
}

- (CGRect)badgeFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_badgeFrame.origin.x;
  y = self->_badgeFrame.origin.y;
  width = self->_badgeFrame.size.width;
  height = self->_badgeFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBadgeFrame:(CGRect)a3
{
  self->_badgeFrame = a3;
}

- (NSString)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(id)a3
{
  objc_storeStrong((id *)&self->_badgeType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeType, 0);
  objc_storeStrong((id *)&self->_badgeElement, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end
