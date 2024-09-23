@implementation STUIStatusBarVisualProvider_Split1242

+ (double)height
{
  return 44.0;
}

+ (double)nativeDisplayWidth
{
  return 1242.0;
}

+ (CGSize)notchSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 209.333333;
  v3 = 30.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)itemSpacing
{
  return 6.0;
}

+ (double)trailingEdgeInsetLeadingAdjustment
{
  return 0.666666667;
}

+ (double)pillCenteringOffset
{
  return 2.33333333;
}

- (CGSize)pillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 61.0;
  v3 = 22.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)expandedPillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 47.0;
  v3 = 17.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)baseFontSize
{
  return 14.0;
}

- (double)lowerExpandedBaselineOffset
{
  return 23.0;
}

+ (double)additionalBottomLeadingMargin
{
  return 2.33333333;
}

- (double)normalIconScale
{
  return 1.08;
}

- (double)expandedIconScale
{
  return 1.2412;
}

+ (BOOL)shrinksSingleCharacterTypes
{
  return 1;
}

@end
