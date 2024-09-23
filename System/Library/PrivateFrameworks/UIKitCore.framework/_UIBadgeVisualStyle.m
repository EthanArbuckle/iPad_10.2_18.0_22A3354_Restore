@implementation _UIBadgeVisualStyle

- (double)cornerRadius
{
  return 9.0;
}

- (UIFont)font
{
  -[_UIBadgeVisualStyle fontSize](self, "fontSize");
  return (UIFont *)objc_msgSend(off_1E167A828, "systemFontOfSize:");
}

- (double)fontSize
{
  return 13.0;
}

- (UIColor)defaultBadgeColor
{
  return +[UIColor systemRedColor](UIColor, "systemRedColor");
}

- (double)minWidth
{
  return 24.0;
}

- (double)maxWidth
{
  return 64.0;
}

- (double)edgePadding
{
  return 5.0;
}

@end
