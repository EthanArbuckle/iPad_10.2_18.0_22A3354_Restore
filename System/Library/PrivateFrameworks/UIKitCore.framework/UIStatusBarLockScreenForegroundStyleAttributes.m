@implementation UIStatusBarLockScreenForegroundStyleAttributes

- (id)expandedNameForImageName:(id)a3
{
  return (id)objc_msgSend(CFSTR("LockScreen_"), "stringByAppendingString:", a3);
}

- (int64_t)activityIndicatorStyleWithSyncActivity:(BOOL)a3
{
  if (a3)
    return 12;
  else
    return 11;
}

- (UIEdgeInsets)edgeInsetsForBatteryInsides
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
  if (v2 <= 2.5)
    v3 = 4.5;
  else
    v3 = 4.66666667;
  v4 = 2.0;
  v5 = 2.0;
  v6 = 2.0;
  result.right = v3;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)makeTextFontForStyle:(int64_t)a3
{
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:", a3, 14.0);
}

- (double)textOffsetForStyle:(int64_t)a3
{
  return 1.5;
}

- (double)sizeForMoonMaskVisible:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double result;
  double v7;
  double v8;
  double v9;

  v3 = a3;
  -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
  if (v5 <= 2.5)
  {
    -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
    v8 = 15.0;
    if (v3)
      v8 = 10.0;
    v9 = 13.5;
    if (v3)
      v9 = 9.5;
    if (v7 > 1.5)
      return v9;
    else
      return v8;
  }
  else
  {
    result = 13.3333333;
    if (v3)
      return 9.66666667;
  }
  return result;
}

- (CGPoint)positionForMoonMaskInBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
  if (v8 <= 2.5)
  {
    -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
    if (v11 <= 1.5)
      v10 = 1.0;
    else
      v10 = 1.5;
    if (v11 <= 1.5)
      v9 = 4.0;
    else
      v9 = 5.0;
  }
  else
  {
    v9 = 5.66666667;
    v10 = 1.33333333;
  }
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v12 = v10 + CGRectGetMaxX(v15);
  v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)supportsShowingBuildVersion
{
  return 0;
}

@end
