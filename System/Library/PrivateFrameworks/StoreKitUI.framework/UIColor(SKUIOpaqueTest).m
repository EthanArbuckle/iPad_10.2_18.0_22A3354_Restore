@implementation UIColor(SKUIOpaqueTest)

- (BOOL)skui_isOpaque
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getWhite:alpha:", 0, &v2);
  return v2 >= 1.0;
}

@end
