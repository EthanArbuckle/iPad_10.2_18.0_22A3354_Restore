@implementation LargeYearViewYearHeader

+ (double)headerYInsetForWindowSize:(CGSize)a3
{
  return 13.0;
}

+ (double)middleHeightForWindowSize:(CGSize)a3
{
  double width;
  double result;

  width = a3.width;
  if (EKUIWindowInterfaceParadigmForWindowSize(0, a2, (__n128)a3, *(__n128 *)&a3.height) == 8)
    return 57.0;
  if (qword_1001F6388 != -1)
    dispatch_once(&qword_1001F6388, &stru_1001B4CC8);
  objc_msgSend((id)qword_1001F6380, "valueForSize:", width);
  return result;
}

+ (double)headerDaySpacingForWindowSize:(CGSize)a3
{
  return 0.0;
}

- (double)heightBetweenLineAndNumber
{
  return 1.0;
}

- (id)yearNumberFont
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CC278;
  block[3] = &unk_1001B2538;
  block[4] = self;
  if (qword_1001F6398 != -1)
    dispatch_once(&qword_1001F6398, block);
  return (id)qword_1001F6390;
}

- (double)_yearNumberFontSize
{
  double result;
  void *v4;

  if (EKUICurrentWindowInterfaceParadigm(self, a2) == 8)
    return 24.0;
  if (qword_1001F63A8 != -1)
    dispatch_once(&qword_1001F63A8, &stru_1001B4CE8);
  v4 = (void *)qword_1001F63A0;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v4, "valueForSize:");
  return result;
}

- (double)yearNumberKerning
{
  return 0.0;
}

- (id)overlayLegendFont
{
  void *v3;
  void *v4;

  if (EKUICurrentWindowInterfaceParadigm(self, a2) == 8)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewYearHeader traitCollection](self, "traitCollection"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[EKUIConstrainedFontUtilities constrainedFontForTextStyle:maximumContentSizeCategory:traitCollection:](EKUIConstrainedFontUtilities, "constrainedFontForTextStyle:maximumContentSizeCategory:traitCollection:", UIFontTextStyleCaption1, UIContentSizeCategoryAccessibilityMedium, v4));

  }
  return v3;
}

- (double)overlayLegendRightInset
{
  return 64.0;
}

- (double)overlayLegendYearBaseline
{
  double v4;
  double v5;
  double v6;

  if (EKUICurrentWindowInterfaceParadigm(self, a2) == 8)
    return 37.0;
  -[LargeYearViewYearHeader overlayLegendMonthBaseline](self, "overlayLegendMonthBaseline");
  v5 = v4;
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 1, 37.0 - v4, 34.0);
  return v5 + v6;
}

- (double)overlayLegendMonthBaseline
{
  return 15.0;
}

- (double)overlayLegendSpacing
{
  void *v2;
  int v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewYearHeader traitCollection](self, "traitCollection"));
  v3 = EKUIUsesLargeTextYearView();

  result = 6.0;
  if (v3)
    return 12.0;
  return result;
}

- (double)overlayLegendLineLength
{
  void *v2;
  int v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewYearHeader traitCollection](self, "traitCollection"));
  v3 = EKUIUsesLargeTextYearView();

  result = 12.0;
  if (v3)
    return 24.0;
  return result;
}

- (double)overlayLegendYearLineThickness
{
  void *v2;
  int v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewYearHeader traitCollection](self, "traitCollection"));
  v3 = EKUIUsesLargeTextYearView();

  result = 2.0;
  if (v3)
    return 4.0;
  return result;
}

- (double)overlayLegendMonthLineThickness
{
  void *v2;
  int v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeYearViewYearHeader traitCollection](self, "traitCollection"));
  v3 = EKUIUsesLargeTextYearView();

  result = 1.0;
  if (v3)
    return 2.0;
  return result;
}

@end
