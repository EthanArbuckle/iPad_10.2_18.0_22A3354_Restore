@implementation _UIBadgeTVVisualStyle

- (id)defaultBadgeColor
{
  return +[UIColor externalSystemRedColor](UIColor, "externalSystemRedColor");
}

- (double)fontSize
{
  return 28.0;
}

- (double)edgePadding
{
  return 10.0;
}

- (double)maxWidth
{
  return 128.0;
}

- (double)cornerRadius
{
  return 18.0;
}

@end
