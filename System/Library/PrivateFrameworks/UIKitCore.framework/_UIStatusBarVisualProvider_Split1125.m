@implementation _UIStatusBarVisualProvider_Split1125

+ (double)height
{
  return 44.0;
}

+ (double)nativeDisplayWidth
{
  return 1125.0;
}

+ (CGSize)notchSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 209.0;
  v3 = 30.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)itemSpacing
{
  return 5.0;
}

- (double)leadingItemSpacing
{
  return 2.66666667;
}

- (double)leadingSmallPillSpacing
{
  return 4.0;
}

+ (double)leadingCenteringOffset
{
  return -0.666666667;
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

  v2 = 54.6666667;
  v3 = 21.3333333;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)smallPillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 19.0;
  v3 = 19.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)expandedPillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 44.0;
  v3 = 16.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)baseFontSize
{
  return 13.0;
}

+ (double)pillFontSize
{
  return 14.0;
}

- (double)lowerExpandedBaselineOffset
{
  return 22.0;
}

+ (double)additionalBottomLeadingMargin
{
  return 3.0;
}

+ (double)expandedEdgeInset
{
  return 5.0;
}

- (double)normalIconScale
{
  return 1.0;
}

- (double)expandedIconScale
{
  return 1.16;
}

- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4
{
  const __CFString *v4;

  v4 = CFSTR("􀛱");
  if (a3 != 9)
    v4 = 0;
  if (a3 == 8)
    v4 = CFSTR("􀛰");
  if (a4)
    return (id)v4;
  else
    return 0;
}

+ (double)LTEAPlusFontSize
{
  return 12.0;
}

@end
