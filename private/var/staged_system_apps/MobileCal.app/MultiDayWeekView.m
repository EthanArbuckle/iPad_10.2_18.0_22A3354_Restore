@implementation MultiDayWeekView

- (MultiDayWeekView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 targetWindow:(id)a5 rightClickDelegate:(id)a6
{
  MultiDayWeekView *v6;
  MultiDayWeekView *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MultiDayWeekView;
  v6 = -[WeekView initWithFrame:sizeClass:targetWindow:rightClickDelegate:](&v11, "initWithFrame:sizeClass:targetWindow:rightClickDelegate:", a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView allDayView](v6, "allDayView"));
    objc_msgSend(v8, "setUseMultiDayHeaderStyle:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView content](v7, "content"));
    objc_msgSend(v9, "setUseMultiDayStyle:", 1);

  }
  return v7;
}

+ (int64_t)numMultiDays
{
  return 2;
}

+ (BOOL)usesSmallTextForIsCompact:(BOOL)a3
{
  return 0;
}

+ (double)dayHeaderHeightWithSizeClass:(int64_t)a3
{
  double result;

  +[MultiDayNavigationViewCell heightRequiredWithSizeClass:](MultiDayNavigationViewCell, "heightRequiredWithSizeClass:", a3);
  return result;
}

+ (double)centerYOffsetForTitleLabelWithSizeClass:(int64_t)a3
{
  double v3;

  +[MultiDayNavigationViewCell heightRequiredWithSizeClass:](MultiDayNavigationViewCell, "heightRequiredWithSizeClass:", a3);
  return v3 * 0.5;
}

+ (double)standardWidthForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4
{
  double v5;
  double v6;
  double v7;
  id v8;

  objc_msgSend(a1, "dayWidthForOrientation:withViewInViewHierarchy:", a3, a4);
  v6 = v5;
  *(_QWORD *)&v7 = objc_opt_class(a1).n128_u64[0];
  return v6 * (double)(uint64_t)objc_msgSend(v8, "numMultiDays", v7);
}

+ (unint64_t)displayedDaysForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4
{
  double v4;
  id v5;

  *(_QWORD *)&v4 = objc_opt_class(a1).n128_u64[0];
  return (unint64_t)objc_msgSend(v5, "numMultiDays", v4);
}

+ (double)dayWidthForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v6 = a4;
  objc_msgSend(a1, "windowSpaceForOrientation:withViewInViewHierarchy:", a3, v6);
  v8 = v7;
  objc_msgSend(a1, "leadingVerticalLinePeak");
  v10 = v8 - v9;
  v11 = objc_msgSend(a1, "displayedDaysForOrientation:withViewInViewHierarchy:", a3, v6);

  return v10 / (double)(unint64_t)v11;
}

+ (BOOL)showsAllDayDividerLine
{
  return 0;
}

- (int64_t)daysToDisplay
{
  double v2;
  id v3;

  *(_QWORD *)&v2 = objc_opt_class(self).n128_u64[0];
  return (int64_t)objc_msgSend(v3, "numMultiDays", v2);
}

- (void)hideNowDot:(BOOL)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[WeekView content](self, "content", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "grid"));
  objc_msgSend(v3, "hideNowDot:", 1);

}

@end
