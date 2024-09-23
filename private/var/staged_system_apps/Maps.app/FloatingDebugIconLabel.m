@implementation FloatingDebugIconLabel

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)FloatingDebugIconLabel;
  -[FloatingDebugIconLabel intrinsicContentSize](&v5, "intrinsicContentSize");
  v4 = v3 + 8.0;
  result.height = v2;
  result.width = v4;
  return result;
}

@end
