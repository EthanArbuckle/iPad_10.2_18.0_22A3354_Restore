@implementation STUIStatusBarVisualProvider_Split1080

+ (double)referenceScreenScale
{
  return 2.88;
}

+ (double)height
{
  return 50.0;
}

+ (double)nativeDisplayWidth
{
  return 1080.0;
}

+ (CGSize)notchSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 226.0;
  v3 = 34.3333333;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)itemSpacing
{
  return 5.33333333;
}

- (double)leadingSmallPillSpacing
{
  return 3.33333333;
}

+ (double)leadingCenteringOffset
{
  return 1.33333333;
}

+ (double)pillCenteringOffset
{
  return 0.666666667;
}

- (CGSize)pillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 53.6666667;
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

  v2 = 18.0;
  v3 = 18.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)baselineBottomInset
{
  return 0.333333333;
}

- (int64_t)normalIconSize
{
  return 3;
}

- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4
{
  const __CFString *v4;

  v4 = CFSTR("􀛳");
  if (a3 != 9)
    v4 = 0;
  if (a3 == 8)
    v4 = CFSTR("􀛲");
  if (a4)
    return (id)v4;
  else
    return 0;
}

@end
