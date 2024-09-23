@implementation LargeDayNavigationViewCellFactory

- (id)createCellWithFrame:(CGRect)a3
{
  LargeDayNavigationViewCell *v3;
  uint64_t v4;

  v3 = -[LargeDayNavigationViewCell initWithFrame:]([LargeDayNavigationViewCell alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[LargeDayNavigationViewCell setUsesRoundedRectInsteadOfCircle:](v3, "setUsesRoundedRectInsteadOfCircle:", EKUIUsesRoundedRectsInsteadOfCircles(0, v4));
  return v3;
}

- (void)localeChanged
{
  +[DayNavigationViewCell localeChanged](LargeDayNavigationViewCell, "localeChanged");
}

- (void)contentSizeCategoryChanged
{
  +[DayNavigationViewCell contentSizeCategoryChanged](LargeDayNavigationViewCell, "contentSizeCategoryChanged");
}

- (Class)cellClass
{
  return (Class)objc_opt_class(LargeDayNavigationViewCell);
}

- (double)roundedRectHeight
{
  double result;

  +[DayNavigationViewCell roundedRectHeight](LargeDayNavigationViewCell, "roundedRectHeight");
  return result;
}

@end
