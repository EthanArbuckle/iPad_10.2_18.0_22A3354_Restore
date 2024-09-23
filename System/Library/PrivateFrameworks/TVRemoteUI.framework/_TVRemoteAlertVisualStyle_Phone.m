@implementation _TVRemoteAlertVisualStyle_Phone

- (double)remoteWidth
{
  return 1.79769313e308;
}

- (double)remoteHeight
{
  return 1.79769313e308;
}

- (double)minimizedCornerRadius
{
  double v2;

  -[_TVRemoteAlertVisualStyle_Phone maximizedCornerRadius](self, "maximizedCornerRadius");
  return v2 * 0.5;
}

- (double)maximizedCornerRadius
{
  return 0.0;
}

- (CGRect)frameForParentView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a3, "bounds");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)foregroundVisualEffect
{
  return (id)objc_msgSend(MEMORY[0x24BEBD428], "effectWithBlurRadius:", 20.0);
}

- (id)backgroundMaterialView
{
  return 0;
}

- (BOOL)allowsTapToDismiss
{
  return 0;
}

- (BOOL)allowsSwipeToDismiss
{
  return 0;
}

- (double)crossfadeDuration
{
  return 0.2;
}

@end
