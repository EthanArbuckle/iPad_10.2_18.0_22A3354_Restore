@implementation _UIBadgeCarplayVisualStyle

- (id)defaultBadgeColor
{
  return +[UIColor externalSystemRedColor](UIColor, "externalSystemRedColor");
}

- (double)fontSize
{
  return 10.0;
}

- (double)edgePadding
{
  return 5.0;
}

- (double)cornerRadius
{
  return 6.0;
}

@end
