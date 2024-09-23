@implementation DOMNode(UIWebInteraction)

- (uint64_t)showsTapHighlight
{
  return 1;
}

- (UIColor)tapHighlightColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.101960784, 0.101960784, 0.101960784, 0.3);
}

- (uint64_t)touchCalloutEnabled
{
  return 1;
}

- (uint64_t)isLikelyToBeginPageLoad
{
  return 1;
}

@end
