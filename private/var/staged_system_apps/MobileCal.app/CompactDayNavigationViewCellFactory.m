@implementation CompactDayNavigationViewCellFactory

- (id)createCellWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CompactDayNavigationViewCell *v7;
  uint64_t v8;
  void *v9;
  CompactDayNavigationViewCell *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = [CompactDayNavigationViewCell alloc];
  v8 = CUIKGetOverlayCalendar();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = -[CompactDayNavigationViewCell initWithFrame:loadMonthAnimationState:hasOverlay:sizeClass:](v7, "initWithFrame:loadMonthAnimationState:hasOverlay:sizeClass:", 0, v9 != 0, 1, x, y, width, height);

  -[CompactDayNavigationViewCell setMatchesMonthView:](v10, "setMatchesMonthView:", 1);
  return v10;
}

- (void)localeChanged
{
  +[CompactDayNavigationViewCell localeChanged](CompactDayNavigationViewCell, "localeChanged");
}

- (Class)cellClass
{
  return (Class)objc_opt_class(CompactDayNavigationViewCell);
}

- (double)roundedRectHeight
{
  double result;

  +[CompactDayNavigationViewCell roundedRectHeightToMatchMonthView](CompactDayNavigationViewCell, "roundedRectHeightToMatchMonthView");
  return result;
}

@end
