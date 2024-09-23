@implementation CompactWeekDayInitialsHeaderView

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  objc_msgSend((id)objc_opt_class(self), "standardHeight");
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

+ (double)standardHeight
{
  void *v3;
  double v4;
  double v5;
  id v6;
  double v7;
  uint64_t v8;
  double v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dayInitialFont"));
  objc_msgSend(v3, "capHeight");
  v5 = v4 + 4.5;
  v6 = objc_msgSend(a1, "_bottomPadding");
  v9 = CalRoundToScreenScale(v6, v8, v5 + v7);

  return v9;
}

+ (double)_bottomPadding
{
  double result;

  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 5.5, 9.9);
  return result;
}

+ (id)dayInitialFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 10.0, 18.0);
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
}

- (double)bottomPadding
{
  double result;

  objc_msgSend((id)objc_opt_class(self), "_bottomPadding");
  return result;
}

@end
