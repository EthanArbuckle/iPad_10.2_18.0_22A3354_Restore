@implementation _UISearchTextFieldVisualStyle_iOS

- (double)defaultHeightForBarMetrics:(int64_t)a3
{
  int v4;
  BOOL v5;
  double result;
  double v7;

  v4 = _UIBarsUseNewPadHeights();
  v5 = a3 == 1 || a3 == 102;
  result = 36.0;
  v7 = 30.0;
  if (!v5)
    v7 = 36.0;
  if (!v4)
    return v7;
  return result;
}

+ (double)defaultHeightForBarMetrics:(int64_t)a3
{
  int v4;
  BOOL v5;
  double result;
  double v7;

  v4 = _UIBarsUseNewPadHeights();
  v5 = a3 == 1 || a3 == 102;
  result = 36.0;
  v7 = 30.0;
  if (!v5)
    v7 = 36.0;
  if (!v4)
    return v7;
  return result;
}

@end
