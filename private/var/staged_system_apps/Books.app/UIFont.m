@implementation UIFont

- (double)bk_heightFromCapLineToDescender
{
  double v3;
  double v4;
  double v5;

  -[UIFont capHeight](self, "capHeight");
  v4 = v3;
  -[UIFont descender](self, "descender");
  return v4 - v5;
}

@end
