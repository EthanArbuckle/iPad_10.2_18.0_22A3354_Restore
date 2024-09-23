@implementation NCNotificationAppSectionListHeaderOptionsButton

- (UIBezierPath)visiblePathForPreview
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v7;
  CGRect v8;

  -[NCNotificationAppSectionListHeaderOptionsButton bounds](self, "bounds");
  x = v7.origin.x;
  y = v7.origin.y;
  width = v7.size.width;
  height = v7.size.height;
  CGRectGetWidth(v7);
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  CGRectGetHeight(v8);
  UIRectCenteredIntegralRect();
  return (UIBezierPath *)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:");
}

@end
