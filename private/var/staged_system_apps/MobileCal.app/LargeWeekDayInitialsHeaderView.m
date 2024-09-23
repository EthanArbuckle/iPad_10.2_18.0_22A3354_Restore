@implementation LargeWeekDayInitialsHeaderView

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  width = a3.width;
  *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dayInitialFont", v5));
  objc_msgSend(v7, "lineHeight");
  v9 = v8;
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 7.5, 9.0);
  v11 = v9 + v10;
  v12 = -[LargeWeekDayInitialsHeaderView bottomPadding](self, "bottomPadding");
  v15 = CalRoundToScreenScale(v12, v14, v11 + v13);

  v16 = width;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

+ (id)dayInitialFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 17.0, 23.0);
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

- (int64_t)dayInitialTextAlignment
{
  void *v2;
  uint64_t v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekDayInitialsHeaderView traitCollection](self, "traitCollection"));
  v4 = EKUIUsesLargeTextLayout(v2, v3);

  if (v4)
    return 1;
  else
    return 2;
}

- (double)dayFrameRightInset
{
  void *v2;
  uint64_t v3;
  int v4;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeWeekDayInitialsHeaderView traitCollection](self, "traitCollection"));
  v4 = EKUIUsesLargeTextLayout(v2, v3);

  result = 10.0;
  if (v4)
    return 0.0;
  return result;
}

- (double)bottomPadding
{
  double result;

  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 11.0, 12.5);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->super._useCustomDayFrames + 1), 0);
}

@end
