@implementation _UIStatusBarVisualProvider_Split828

+ (double)height
{
  return 48.0;
}

+ (double)nativeDisplayWidth
{
  return 828.0;
}

+ (CGSize)notchSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 227.0;
  v3 = 32.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)itemSpacing
{
  return 4.5;
}

- (double)leadingItemSpacing
{
  return 3.0;
}

+ (double)leadingSmallPillSpacing
{
  return 5.0;
}

+ (double)leadingCenteringOffset
{
  return -1.5;
}

+ (double)pillCenteringOffset
{
  return 2.0;
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

- (CGSize)smallPillSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 20.5;
  v3 = 20.5;
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

- (double)baselineBottomInset
{
  return 1.5;
}

- (double)lowerExpandedBaselineOffset
{
  return 23.0;
}

+ (double)additionalBottomLeadingMargin
{
  return -1.0;
}

- (double)bottomLeadingTopOffset
{
  return 7.0;
}

- (double)normalIconScale
{
  return 1.07;
}

- (double)expandedIconScale
{
  return 1.2412;
}

- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4
{
  const __CFString *v4;

  v4 = CFSTR("􀛵");
  if (a3 != 9)
    v4 = 0;
  if (a3 == 8)
    v4 = CFSTR("􀛴");
  if (a4)
    return (id)v4;
  else
    return 0;
}

+ (double)LTEAPlusFontSize
{
  return 12.0;
}

+ (BOOL)shrinksSingleCharacterTypes
{
  return 1;
}

- (double)condensedPointSizeForCellularType:(int64_t)a3 defaultPointSize:(double)a4 baselineOffset:(double *)a5
{
  int v6;
  double v7;
  double result;

  if ((unint64_t)(a3 - 8) < 2)
  {
    *a5 = 1.5;
    objc_msgSend((id)objc_opt_class(), "LTEAPlusFontSize");
  }
  else if ((unint64_t)(a3 - 2) > 1)
  {
    *a5 = 1.0;
    return a4 + -2.0;
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_class(), "shrinksSingleCharacterTypes");
    v7 = 0.0;
    if (v6)
      v7 = 1.0;
    return a4 - v7;
  }
  return result;
}

@end
