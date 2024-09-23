@implementation LargeTextCompactYearMonthView

+ (double)leftMarginForWindowSize:(CGSize)a3
{
  double width;
  double result;

  width = a3.width;
  if (qword_1001F5FE0 != -1)
    dispatch_once(&qword_1001F5FE0, &stru_1001B2880);
  objc_msgSend((id)qword_1001F5FD8, "valueForSize:", width);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  if (qword_1001F5FF0 != -1)
    dispatch_once(&qword_1001F5FF0, &stru_1001B28A0);
  v4 = (void *)qword_1001F5FE8;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v4, "valueForSize:");
  v6 = v5;
  v7 = EKUIInterfaceOrientationForViewHierarchy(self);
  v8 = (void *)objc_opt_class(self);
  v9 = EKUICurrentWindowSize(self);
  objc_msgSend(v8, "heightForInterfaceOrientation:windowSize:heightSizeClass:", v7, EKUIHeightSizeClassForViewHierarchy(self), v9, v10);
  v12 = v11;
  v13 = v6;
  result.height = v12;
  result.width = v13;
  return result;
}

+ (double)heightForInterfaceOrientation:(int64_t)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5
{
  double width;
  double result;

  width = a4.width;
  if (qword_1001F6000 != -1)
    dispatch_once(&qword_1001F6000, &stru_1001B28C0);
  objc_msgSend((id)qword_1001F5FF8, "valueForSize:", width);
  return result;
}

- (double)xInset
{
  return 0.0;
}

- (double)yInset
{
  return 0.0;
}

- (double)headerXAdjust
{
  return 0.0;
}

- (double)headerFontMaxSize
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeTextCompactYearMonthView headerFont](self, "headerFont"));
  objc_msgSend(v2, "pointSize");
  v4 = v3;

  return v4;
}

- (id)headerFont
{
  void *v3;

  if (qword_1001F6010 != -1)
    dispatch_once(&qword_1001F6010, &stru_1001B28E0);
  v3 = (void *)qword_1001F6008;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
}

- (double)headerFontKerning
{
  return 0.0;
}

- (id)dayNumberFont
{
  -[LargeTextCompactYearMonthView dayTextSize](self, "dayTextSize");
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

- (double)dayNumberKerning
{
  return 0.0;
}

- (double)todayNumberKerning
{
  return 0.0;
}

- (double)dayTextSize
{
  void *v3;
  double result;

  if (qword_1001F6020 != -1)
    dispatch_once(&qword_1001F6020, &stru_1001B2900);
  v3 = (void *)qword_1001F6018;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)circleSize
{
  void *v3;
  double result;

  if (qword_1001F6030 != -1)
    dispatch_once(&qword_1001F6030, &stru_1001B2920);
  v3 = (void *)qword_1001F6028;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)circleSizeForDoubleDigit
{
  double result;

  -[LargeTextCompactYearMonthView circleSize](self, "circleSize");
  return result;
}

- (double)daysXAdjustLeft
{
  return 0.0;
}

- (double)daysYAdjustTop
{
  void *v3;
  double result;

  if (qword_1001F6040 != -1)
    dispatch_once(&qword_1001F6040, &stru_1001B2940);
  v3 = (void *)qword_1001F6038;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)xSpacing
{
  void *v3;
  double result;

  if (qword_1001F6050 != -1)
    dispatch_once(&qword_1001F6050, &stru_1001B2960);
  v3 = (void *)qword_1001F6048;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (double)ySpacing
{
  void *v3;
  double result;

  if (qword_1001F6060 != -1)
    dispatch_once(&qword_1001F6060, &stru_1001B2980);
  v3 = (void *)qword_1001F6058;
  AnchoredValueCurrentWindowWidth(self);
  objc_msgSend(v3, "valueForSize:");
  return result;
}

- (BOOL)showWeekDayInitials
{
  return 0;
}

- (double)weekDayInitialsAdjustLeft
{
  return 0.0;
}

- (double)weekDayInitialsAdjustTop
{
  return 0.0;
}

- (id)weekDayInitialsFont
{
  return 0;
}

- (BOOL)computeCircleFrameWithoutAdjustments
{
  return 1;
}

- (CGSize)roundedRectSizeForDayNumberString:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  NSAttributedStringKey v17;
  void *v18;
  CGSize result;

  v16.receiver = self;
  v16.super_class = (Class)LargeTextCompactYearMonthView;
  v4 = a3;
  -[LargeTextCompactYearMonthView roundedRectSizeForDayNumberString:](&v16, "roundedRectSizeForDayNumberString:", v4);
  v6 = v5;
  v8 = v7;
  v17 = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LargeTextCompactYearMonthView dayNumberFont](self, "dayNumberFont"));
  v18 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  objc_msgSend(v4, "sizeWithAttributes:", v10);
  v12 = v11;

  v13 = v12 + 4.0;
  if (v6 >= v13)
    v14 = v6;
  else
    v14 = v13;
  v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGRect)frameForGridOfDays:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  -[LargeTextCompactYearMonthView bounds](self, "bounds", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[LargeTextCompactYearMonthView daysYAdjustTop](self, "daysYAdjustTop");
  v11 = v10;
  -[LargeTextCompactYearMonthView yInset](self, "yInset");
  v13 = v7 + v11 + v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LargeTextCompactYearMonthView calendar](self, "calendar"));
  v15 = objc_msgSend(v14, "copy");

  objc_msgSend(v15, "setFirstWeekday:", CUIKOneIndexedWeekStart(v16));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[LargeTextCompactYearMonthView calendarDate](self, "calendarDate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "date"));
  objc_msgSend(v15, "rangeOfUnit:inUnit:forDate:", 4096, 8, v18);
  v20 = v19;

  -[LargeTextCompactYearMonthView ySpacing](self, "ySpacing");
  v22 = v21 * (double)v20;

  v23 = v5;
  v24 = v13;
  v25 = v9;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

@end
