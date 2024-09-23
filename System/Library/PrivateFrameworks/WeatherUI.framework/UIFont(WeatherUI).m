@implementation UIFont(WeatherUI)

+ (uint64_t)wu_systemUsesExuberatedLineHeight
{
  return CTFontHasExuberatedLineHeight();
}

- (double)wu_exuberatedLineHeightAmount
{
  double v1;
  double v2;
  double v3;

  objc_msgSend(a1, "lineHeight");
  v2 = v1;
  CTFontGetExuberatedLineHeightForLineHeight();
  return v3 - v2;
}

- (double)wu_lineHeightNotIncludingExuberatedAmount
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "lineHeight");
  v3 = v2;
  objc_msgSend(a1, "wu_exuberatedLineHeightAmount");
  return v3 - v4;
}

@end
