@implementation _UIBadgePhoneLandscapeVisualStyle

- (double)fontSize
{
  return 10.0;
}

- (id)font
{
  -[_UIBadgePhoneLandscapeVisualStyle fontSize](self, "fontSize");
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:weight:");
}

- (double)edgePadding
{
  return 4.0;
}

- (double)minWidth
{
  return 22.0;
}

- (double)cornerRadius
{
  return 7.0;
}

@end
