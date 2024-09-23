@implementation PUIColorWell

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  CGSize result;

  -[UIColorWell selectedColor](self, "selectedColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = 44.0;
  if (!v2)
    v3 = 34.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

@end
