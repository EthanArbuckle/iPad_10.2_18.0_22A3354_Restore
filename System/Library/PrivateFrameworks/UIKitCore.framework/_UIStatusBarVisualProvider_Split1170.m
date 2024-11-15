@implementation _UIStatusBarVisualProvider_Split1170

+ (double)nativeDisplayWidth
{
  return 1170.0;
}

+ (CGSize)notchSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 210.0;
  v3 = 32.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)itemSpacing
{
  return 5.33333333;
}

- (double)leadingItemSpacing
{
  return 2.66666667;
}

- (double)leadingSmallPillSpacing
{
  return 4.0;
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

  v2 = 55.6666667;
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
  return 13.5;
}

+ (double)expandedFontSize
{
  return 15.0;
}

+ (double)pillFontSize
{
  return 14.0;
}

- (double)lowerExpandedBaselineOffset
{
  return 22.0;
}

+ (double)bottomLeadingTopOffset
{
  return 7.0;
}

- (double)normalIconScale
{
  return 1.06;
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
  return 12.5;
}

@end
