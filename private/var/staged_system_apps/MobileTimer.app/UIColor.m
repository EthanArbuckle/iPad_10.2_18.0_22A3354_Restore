@implementation UIColor

- (id)normalShade
{
  return -[UIColor colorWithAlphaComponent:](self, "colorWithAlphaComponent:", 0.28);
}

- (id)highlightedShade
{
  return -[UIColor colorWithAlphaComponent:](self, "colorWithAlphaComponent:", 0.1);
}

@end
