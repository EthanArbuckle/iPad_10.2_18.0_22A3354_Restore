@implementation UILabel(PXCMM)

- (BOOL)px_isOneLineForWidth:()PXCMM
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(a1, "textRectForBounds:limitedToNumberOfLines:", 1, *MEMORY[0x1E0C9D648], v5, a2, 1.79769313e308);
  v7 = v6;
  objc_msgSend(a1, "textRectForBounds:limitedToNumberOfLines:", 2, v4, v5, a2, 1.79769313e308);
  return v8 == v7;
}

@end
