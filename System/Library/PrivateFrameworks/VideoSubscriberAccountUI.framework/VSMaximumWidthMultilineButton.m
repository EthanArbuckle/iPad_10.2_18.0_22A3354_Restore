@implementation VSMaximumWidthMultilineButton

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)VSMaximumWidthMultilineButton;
  -[VSMultilineButton intrinsicContentSize](&v4, sel_intrinsicContentSize);
  v3 = 1.79769313e308;
  result.height = v2;
  result.width = v3;
  return result;
}

@end
