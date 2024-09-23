@implementation LargeMonthWeekView

+ (void)initialize
{
  if (qword_1001F5ED0 != -1)
    dispatch_once(&qword_1001F5ED0, &stru_1001B23F0);
}

+ (id)gridlineColor
{
  return (id)qword_1001F5ED8;
}

+ (id)weekendColor
{
  return (id)qword_1001F5EE0;
}

+ (void)clearCachedFonts
{
  void *v2;
  void *v3;

  v2 = (void *)qword_1001F5EC0;
  qword_1001F5EC0 = 0;

  v3 = (void *)qword_1001F5EC8;
  qword_1001F5EC8 = 0;

}

- (LargeMonthWeekView)initWithFrame:(CGRect)a3
{
  LargeMonthWeekView *v3;
  MonthWeekOccurrencesView *v4;
  MonthWeekOccurrencesView *occurrencesView;
  CALayer *v6;
  CALayer *topBorderLine;
  void *v8;
  CALayer *v9;
  CALayer *paddingRowBorderLine;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;
  uint64_t v21;

  v20.receiver = self;
  v20.super_class = (Class)LargeMonthWeekView;
  v3 = -[LargeMonthWeekView initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MonthWeekOccurrencesView);
    occurrencesView = v3->_occurrencesView;
    v3->_occurrencesView = v4;

    -[MonthWeekOccurrencesView setDelegate:](v3->_occurrencesView, "setDelegate:", v3);
    -[LargeMonthWeekView addSubview:](v3, "addSubview:", v3->_occurrencesView);
    v3->_showsTopBorder = 1;
    v6 = (CALayer *)objc_alloc_init((Class)CALayer);
    topBorderLine = v3->_topBorderLine;
    v3->_topBorderLine = v6;

    -[CALayer setBackgroundColor:](v3->_topBorderLine, "setBackgroundColor:", objc_msgSend((id)qword_1001F5ED8, "CGColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthWeekView layer](v3, "layer"));
    objc_msgSend(v8, "addSublayer:", v3->_topBorderLine);

    v9 = (CALayer *)objc_alloc_init((Class)CALayer);
    paddingRowBorderLine = v3->_paddingRowBorderLine;
    v3->_paddingRowBorderLine = v9;

    -[CALayer setBackgroundColor:](v3->_paddingRowBorderLine, "setBackgroundColor:", objc_msgSend((id)qword_1001F5ED8, "CGColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthWeekView layer](v3, "layer"));
    objc_msgSend(v11, "addSublayer:", v3->_paddingRowBorderLine);

    -[LargeMonthWeekView bringSubviewToFront:](v3, "bringSubviewToFront:", v3->_occurrencesView);
    v12 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v3, "_viewTapped:");
    -[LargeMonthWeekView addGestureRecognizer:](v3, "addGestureRecognizer:", v12);
    v13 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v3, "_viewDoubleTapped:");
    objc_msgSend(v13, "setNumberOfTapsRequired:", 2);
    -[LargeMonthWeekView addGestureRecognizer:](v3, "addGestureRecognizer:", v13);
    objc_initWeak(&location, v3);
    v21 = objc_opt_class(UITraitUserInterfaceStyle);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001EE0C;
    v17[3] = &unk_1001B2418;
    objc_copyWeak(&v18, &location);
    v15 = -[LargeMonthWeekView registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v14, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LargeMonthWeekView;
  -[LargeMonthWeekView touchesBegan:withEvent:](&v11, "touchesBegan:withEvent:", v6, v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector(WeakRetained, "largeMonthWeekView:touchesBegan:withEvent:");

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "largeMonthWeekView:touchesBegan:withEvent:", self, v6, v7);

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LargeMonthWeekView;
  -[LargeMonthWeekView touchesMoved:withEvent:](&v11, "touchesMoved:withEvent:", v6, v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector(WeakRetained, "largeMonthWeekView:touchesMoved:withEvent:");

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "largeMonthWeekView:touchesMoved:withEvent:", self, v6, v7);

  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LargeMonthWeekView;
  -[LargeMonthWeekView touchesEnded:withEvent:](&v11, "touchesEnded:withEvent:", v6, v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector(WeakRetained, "largeMonthWeekView:touchesEnded:withEvent:");

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "largeMonthWeekView:touchesEnded:withEvent:", self, v6, v7);

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LargeMonthWeekView;
  -[LargeMonthWeekView touchesCancelled:withEvent:](&v11, "touchesCancelled:withEvent:", v6, v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector(WeakRetained, "largeMonthWeekView:touchesCancelled:withEvent:");

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "largeMonthWeekView:touchesCancelled:withEvent:", self, v6, v7);

  }
}

+ (double)topInset
{
  return 0.0;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *specialDayTypes;
  NSArray *v8;
  NSArray *dayBadgeColors;
  NSArray *v10;
  NSArray *dayBadgeLocales;
  id v12;

  if (!self->_occurrencesHidden && self->_startDate)
  {
    if (self->_endDate)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthWeekView dataSource](self, "dataSource"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_startDate, "date"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_endDate, "date"));
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "occurrencesForStartDate:endDate:waitForLoad:", v4, v5, 0));

      -[MonthWeekOccurrencesView setOccurrences:](self->_occurrencesView, "setOccurrences:", v12);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView dayTypesFromOccurrences](self->_occurrencesView, "dayTypesFromOccurrences"));
      specialDayTypes = self->_specialDayTypes;
      self->_specialDayTypes = v6;

      v8 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView dayBadgeColorsFromOccurrences](self->_occurrencesView, "dayBadgeColorsFromOccurrences"));
      dayBadgeColors = self->_dayBadgeColors;
      self->_dayBadgeColors = v8;

      v10 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView dayBadgeLocalesFromOccurrences](self->_occurrencesView, "dayBadgeLocalesFromOccurrences"));
      dayBadgeLocales = self->_dayBadgeLocales;
      self->_dayBadgeLocales = v10;

      -[LargeMonthWeekView _updateBadges](self, "_updateBadges");
    }
  }
}

- (void)contentSizeCategoryChanged
{
  -[LargeMonthWeekView _rebuildDayNumberLabels](self, "_rebuildDayNumberLabels");
  -[LargeMonthWeekView _rebuildOverlayLabels](self, "_rebuildOverlayLabels");
  -[LargeMonthWeekView _updateWeekNumberFont](self, "_updateWeekNumberFont");
  -[LargeMonthWeekView reloadData](self, "reloadData");
  -[LargeMonthWeekView setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateToday
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  id v10;
  uint64_t v11;
  void *v12;

  v3 = CUIKTodayDate(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  -[EKCalendarDate absoluteTime](self->_startDate, "absoluteTime");
  if (v6 >= v7 && (v8 = -[EKCalendarDate absoluteTime](self->_endDate, "absoluteTime"), v6 <= v9))
  {
    v11 = CUIKTodayComponents(v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v10 = objc_msgSend(v12, "day");

  }
  else
  {
    v10 = 0;
  }
  if (v10 != (id)self->_todayDay)
  {
    self->_todayDay = (int64_t)v10;
    -[LargeMonthWeekView _rebuildDayNumberLabels](self, "_rebuildDayNumberLabels");
    -[LargeMonthWeekView setNeedsDisplay](self, "setNeedsDisplay");
    -[LargeMonthWeekView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LargeMonthWeekView;
  v3 = -[LargeMonthWeekView description](&v11, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthWeekView calendarDate](self, "calendarDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "date"));
  v7 = CUIKStringForDate(v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@; Week Represented: %@"),
                   v4,
                   v8));

  return (NSString *)v9;
}

- (id)dateForIndex:(int64_t)a3
{
  return -[EKCalendarDate calendarDateByAddingDays:](self->_startDate, "calendarDateByAddingDays:", a3);
}

- (id)occurrenceAtPoint:(CGPoint)a3
{
  double y;
  double x;
  MonthWeekOccurrencesView *occurrencesView;
  void *v7;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  -[LargeMonthWeekView layoutIfNeeded](self, "layoutIfNeeded");
  -[MonthWeekOccurrencesView frame](self->_occurrencesView, "frame");
  v9.x = x;
  v9.y = y;
  if (CGRectContainsPoint(v10, v9))
  {
    occurrencesView = self->_occurrencesView;
    -[MonthWeekOccurrencesView convertPoint:fromView:](occurrencesView, "convertPoint:fromView:", self, x, y);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView occurrenceAtPoint:](occurrencesView, "occurrenceAtPoint:"));
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (CGRect)frameForTodayHighlight
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[_CircleView frame](self->_todayCircle, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)frameForDate:(id)a3
{
  int64_t v4;
  const CGRect *v5;
  double width;
  double height;
  double x;
  double y;
  CGRect result;

  v4 = (int64_t)objc_msgSend(a3, "differenceInDays:", self->_startDate);
  if (v4 < 0 || v4 >= self->_dayCount)
    v5 = &CGRectNull;
  else
    v5 = &self->_dayFrames[self->_firstDayIndex + v4];
  width = v5->size.width;
  height = v5->size.height;
  x = v5->origin.x;
  y = v5->origin.y;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSelectedOccurrence:(id)a3
{
  -[MonthWeekOccurrencesView setSelectedOccurrence:](self->_occurrencesView, "setSelectedOccurrence:", a3);
}

- (EKEvent)selectedOccurrence
{
  return -[MonthWeekOccurrencesView selectedOccurrence](self->_occurrencesView, "selectedOccurrence");
}

- (void)setSelectedOccurrences:(id)a3
{
  -[MonthWeekOccurrencesView setSelectedOccurrences:](self->_occurrencesView, "setSelectedOccurrences:", a3);
}

- (NSArray)selectedOccurrences
{
  return -[MonthWeekOccurrencesView selectedOccurrences](self->_occurrencesView, "selectedOccurrences");
}

- (void)selectOccurrence:(id)a3
{
  -[MonthWeekOccurrencesView selectOccurrence:](self->_occurrencesView, "selectOccurrence:", a3);
}

- (void)deselectOccurrence:(id)a3
{
  -[MonthWeekOccurrencesView deselectOccurrence:](self->_occurrencesView, "deselectOccurrence:", a3);
}

- (void)setShowsTopBorder:(BOOL)a3
{
  CALayer *topBorderLine;

  if (self->_showsTopBorder != a3)
  {
    self->_showsTopBorder = a3;
    topBorderLine = self->_topBorderLine;
    if (a3)
    {
      -[CALayer setHidden:](topBorderLine, "setHidden:", 0);
      -[LargeMonthWeekView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[CALayer setHidden:](topBorderLine, "setHidden:", 1);
    }
  }
}

- (void)setShowsWeekNumber:(BOOL)a3
{
  UILabel *v4;
  UILabel *weekNumberLabel;
  UILabel *v6;

  if (self->_showsWeekNumber != a3)
  {
    self->_showsWeekNumber = a3;
    if (a3)
    {
      v4 = objc_opt_new(UILabel);
      weekNumberLabel = self->_weekNumberLabel;
      self->_weekNumberLabel = v4;

      -[LargeMonthWeekView _updateWeekNumberFont](self, "_updateWeekNumberFont");
      -[LargeMonthWeekView addSubview:](self, "addSubview:", self->_weekNumberLabel);
      -[LargeMonthWeekView _updateWeekNumber](self, "_updateWeekNumber");
    }
    else
    {
      -[UILabel removeFromSuperview](self->_weekNumberLabel, "removeFromSuperview");
      v6 = self->_weekNumberLabel;
      self->_weekNumberLabel = 0;

    }
  }
}

- (void)_updateWeekNumberFont
{
  id v3;

  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 13.0);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
  -[UILabel setFont:](self->_weekNumberLabel, "setFont:", v3);

}

- (void)_updateWeekNumber
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (self->_showsWeekNumber)
  {
    v3 = CUIKCalendar();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthWeekView calendarDate](self, "calendarDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "date"));
    v7 = CUIKLocalizedStringForInteger(objc_msgSend(v4, "component:fromDate:", 0x2000, v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[UILabel setText:](self->_weekNumberLabel, "setText:", v8);

    if (self->_todayDay < 1)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    }
    else
    {
      v11 = CalendarAppTintColor(v9, v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
    }
    v13 = (void *)v12;
    -[UILabel setTextColor:](self->_weekNumberLabel, "setTextColor:", v12);

    -[LargeMonthWeekView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStartDate:(id)a3
{
  +[NSException raise:format:](NSException, "raise:format:", CFSTR("Must use setStartDate:endDate:dayCount: to set dates on PadMonthWeekView"), CFSTR("Attempted to set start date directly to %@"), a3, 0);
}

- (EKCalendarDate)startDate
{
  return self->_startDate;
}

- (void)setEndDate:(id)a3
{
  +[NSException raise:format:](NSException, "raise:format:", CFSTR("Must use setStartDate:endDate:dayCount: to set dates on PadMonthWeekView"), CFSTR("Attempted to set end date directly to %@"), a3, 0);
}

- (EKCalendarDate)endDate
{
  return self->_endDate;
}

- (void)setDayCount:(int64_t)a3
{
  +[NSException raise:format:](NSException, "raise:format:", CFSTR("Must use setStartDate:endDate:dayCount: to set dates on PadMonthWeekView"), CFSTR("Attempted to set dayCount directly to %ld"), a3, 0);
}

- (int64_t)dayCount
{
  return self->_dayCount;
}

- (void)setStartDate:(id)a3 endDate:(id)a4 dayCount:(int64_t)a5 todayDay:(int64_t)a6 reload:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  EKCalendarDate *v13;
  EKCalendarDate *startDate;
  EKCalendarDate *v15;
  EKCalendarDate *endDate;
  id v17;
  int64_t v18;
  id v19;
  void *v20;
  id v21;

  v7 = a7;
  v21 = a3;
  v12 = a4;
  if (!objc_msgSend(v21, "isEqual:", self->_startDate)
    || !objc_msgSend(v12, "isEqual:", self->_endDate)
    || self->_dayCount != a5)
  {
    -[LargeMonthWeekView setShowsFirstDayOfMonthLabel:animated:](self, "setShowsFirstDayOfMonthLabel:animated:", 0, 0);
    v13 = (EKCalendarDate *)objc_msgSend(v21, "copy");
    startDate = self->_startDate;
    self->_startDate = v13;

    v15 = (EKCalendarDate *)objc_msgSend(v12, "copy");
    endDate = self->_endDate;
    self->_endDate = v15;

    self->_dayCount = a5;
    self->_todayDay = a6;
    v17 = objc_msgSend(v21, "day");
    v18 = 7 - a5;
    if (v17 != (id)1)
      v18 = 0;
    self->_firstDayIndex = v18;
    v19 = objc_msgSend(v12, "month");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendarDateByAddingDays:", 1));
    self->_isLastWeekOfMonth = v19 != objc_msgSend(v20, "month");

    -[MonthWeekOccurrencesView setStartDate:endDate:dayCount:](self->_occurrencesView, "setStartDate:endDate:dayCount:", self->_startDate, self->_endDate, self->_dayCount);
    if (v7)
      -[LargeMonthWeekView reloadData](self, "reloadData");
    -[LargeMonthWeekView _rebuildDayNumberLabels](self, "_rebuildDayNumberLabels");
    -[LargeMonthWeekView _rebuildOverlayLabels](self, "_rebuildOverlayLabels");
    -[LargeMonthWeekView _updateWeekNumber](self, "_updateWeekNumber");
    -[LargeMonthWeekView setNeedsLayout](self, "setNeedsLayout");
    -[LargeMonthWeekView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)_rebuildOverlayLabels
{
  uint64_t v3;
  uint64_t v4;
  NSArray *overlayLabels;
  uint64_t v6;
  NSArray *v7;
  UILabel *v8;
  NSArray *v9;
  void *v10;
  id v11;
  uint64_t v12;
  int64_t dayCount;
  uint64_t v14;
  NSArray *v15;
  NSArray *v16;
  UIView *overlayUnderline;
  UIView *v18;
  UIView *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  UIView *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  LargeMonthWeekView *v29;
  NSArray *v30;
  uint64_t v31;
  uint64_t v32;

  v3 = CUIKGetOverlayCalendar(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  overlayLabels = self->_overlayLabels;
  v25 = (id)v4;
  if (v4)
  {
    if (!overlayLabels)
    {
      v6 = 7;
      v7 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 7, v4);
      do
      {
        v8 = objc_opt_new(UILabel);
        -[LargeMonthWeekView addSubview:](self, "addSubview:", v8);
        -[NSArray addObject:](v7, "addObject:", v8);

        --v6;
      }
      while (v6);
      v9 = self->_overlayLabels;
      self->_overlayLabels = v7;

    }
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 12.0, v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _thinSystemFontOfSize:](UIFont, "_thinSystemFontOfSize:"));
    v11 = -[EKCalendarDate dayOfWeek](self->_startDate, "dayOfWeek");
    v12 = CUIKZeroIndexedWeekStart(v11);
    dayCount = self->_dayCount;
    self->_isFirstOfOverlayYear = 0;
    self->_firstOfOverlayMonthIndex = -1;
    v14 = ((uint64_t)v11 - v12 + 6) % 7;
    v15 = self->_overlayLabels;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10001FDB0;
    v27[3] = &unk_1001B2480;
    v31 = v14;
    v32 = v14 + dayCount;
    v28 = v26;
    v29 = self;
    v16 = v10;
    v30 = v16;
    -[NSArray enumerateObjectsUsingBlock:](v15, "enumerateObjectsUsingBlock:", v27);
    overlayUnderline = self->_overlayUnderline;
    if (self->_firstOfOverlayMonthIndex < 0)
    {
      if (overlayUnderline)
      {
        -[UIView removeFromSuperview](overlayUnderline, "removeFromSuperview");
        v24 = self->_overlayUnderline;
        self->_overlayUnderline = 0;

      }
    }
    else if (!overlayUnderline)
    {
      v18 = objc_opt_new(UIView);
      v19 = self->_overlayUnderline;
      self->_overlayUnderline = v18;

      v22 = CalendarAppTintColor(v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      -[UIView setBackgroundColor:](self->_overlayUnderline, "setBackgroundColor:", v23);

      -[LargeMonthWeekView addSubview:](self, "addSubview:", self->_overlayUnderline);
    }

  }
  else
  {
    -[NSArray enumerateObjectsUsingBlock:](overlayLabels, "enumerateObjectsUsingBlock:", &stru_1001B2458, 0);
    v16 = self->_overlayLabels;
    self->_overlayLabels = 0;
  }

}

- (void)_rebuildDayNumberLabels
{
  uint64_t v3;
  NSArray *v4;
  id v5;
  NSArray *dayNumberLabels;
  NSArray *v7;
  UILabel *v8;
  UILabel *firstOfMonthLabel;
  uint64_t v10;
  NSArray *v11;
  id v12;
  NSArray *dayBadgeViews;
  UIImageView *v14;
  UIImageView *dayBadgeViewBesideFirstOfMonthLabel;
  UILabel *v16;
  UILabel *firstOfMonthNoDayLabel;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int64_t dayCount;
  NSArray *v28;
  unint64_t v29;
  int64_t todayDay;
  _CircleView *v31;
  _CircleView *todayCircle;
  void *v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[8];

  if (!self->_dayNumberLabels)
  {
    v3 = 7;
    v4 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 7);
    do
    {
      v5 = objc_alloc_init((Class)UILabel);
      -[LargeMonthWeekView addSubview:](self, "addSubview:", v5);
      -[NSArray addObject:](v4, "addObject:", v5);

      --v3;
    }
    while (v3);
    dayNumberLabels = self->_dayNumberLabels;
    self->_dayNumberLabels = v4;
    v7 = v4;

    v8 = objc_opt_new(UILabel);
    firstOfMonthLabel = self->_firstOfMonthLabel;
    self->_firstOfMonthLabel = v8;

    -[UILabel setAlpha:](self->_firstOfMonthLabel, "setAlpha:", 0.0);
    -[LargeMonthWeekView addSubview:](self, "addSubview:", self->_firstOfMonthLabel);

  }
  if (!self->_dayBadgeViews)
  {
    v10 = 7;
    v11 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 7);
    do
    {
      v12 = objc_alloc_init((Class)UIImageView);
      objc_msgSend(v12, "setHidden:", 1);
      -[LargeMonthWeekView addSubview:](self, "addSubview:", v12);
      -[NSArray addObject:](v11, "addObject:", v12);

      --v10;
    }
    while (v10);
    dayBadgeViews = self->_dayBadgeViews;
    self->_dayBadgeViews = v11;

  }
  if (!self->_dayBadgeViewBesideFirstOfMonthLabel)
  {
    v14 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    dayBadgeViewBesideFirstOfMonthLabel = self->_dayBadgeViewBesideFirstOfMonthLabel;
    self->_dayBadgeViewBesideFirstOfMonthLabel = v14;

    -[LargeMonthWeekView addSubview:](self, "addSubview:", self->_dayBadgeViewBesideFirstOfMonthLabel);
  }
  if (self->_todayDay && !self->_firstOfMonthNoDayLabel)
  {
    v16 = objc_opt_new(UILabel);
    firstOfMonthNoDayLabel = self->_firstOfMonthNoDayLabel;
    self->_firstOfMonthNoDayLabel = v16;

    -[UILabel setAlpha:](self->_firstOfMonthNoDayLabel, "setAlpha:", 0.0);
    -[LargeMonthWeekView addSubview:](self, "addSubview:", self->_firstOfMonthNoDayLabel);
  }
  v18 = -[EKCalendarDate dayOfWeek](self->_startDate, "dayOfWeek");
  v19 = -[EKCalendarDate daysInMonth](self->_startDate, "daysInMonth");
  v20 = v19;
  if (!qword_1001F5EC0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleBody, 0, 3));
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 17.0);
    v22 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v21));
    v23 = (void *)qword_1001F5EC0;
    qword_1001F5EC0 = v22;

    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 17.0);
    v24 = objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
    v25 = (void *)qword_1001F5EC8;
    qword_1001F5EC8 = v24;

  }
  v26 = (uint64_t)v18 - CUIKZeroIndexedWeekStart(v19) + 6;
  dayCount = self->_dayCount;
  self->_firstOfMonthIndex = -1;
  v36[0] = _NSConcreteStackBlock;
  v36[2] = sub_1000203FC;
  v36[3] = &unk_1001B24A8;
  v28 = self->_dayNumberLabels;
  v36[1] = 3221225472;
  v36[4] = self;
  v36[5] = v26 % 7;
  v36[6] = v26 % 7 + dayCount;
  v36[7] = v20;
  -[NSArray enumerateObjectsUsingBlock:](v28, "enumerateObjectsUsingBlock:", v36);
  -[NSArray enumerateObjectsUsingBlock:](self->_dayBadgeViews, "enumerateObjectsUsingBlock:", &stru_1001B24E8);
  v29 = (unint64_t)self->_firstOfMonthIndex >> 63;
  -[UILabel setHidden:](self->_firstOfMonthLabel, "setHidden:", v29);
  -[UILabel setHidden:](self->_firstOfMonthNoDayLabel, "setHidden:", v29);
  -[UIImageView setHidden:](self->_dayBadgeViewBesideFirstOfMonthLabel, "setHidden:", v29);
  -[UIImageView setAlpha:](self->_dayBadgeViewBesideFirstOfMonthLabel, "setAlpha:", 0.0);
  todayDay = self->_todayDay;
  if (todayDay >= 1)
  {
    if (!self->_todayCircle)
    {
      v31 = objc_alloc_init(_CircleView);
      todayCircle = self->_todayCircle;
      self->_todayCircle = v31;

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[_CircleView setBackgroundColor:](self->_todayCircle, "setBackgroundColor:", v33);

      -[LargeMonthWeekView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_todayCircle, self->_occurrencesView);
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthWeekView traitCollection](self, "traitCollection"));
    -[_CircleView setUsesRoundedRectInsteadOfCircle:](self->_todayCircle, "setUsesRoundedRectInsteadOfCircle:", EKUIUsesRoundedRectsInsteadOfCircles(v34, v35));

  }
  -[_CircleView setHidden:](self->_todayCircle, "setHidden:", todayDay < 1);
  -[LargeMonthWeekView _updateBadgeBackgroundColors](self, "_updateBadgeBackgroundColors");
  if (self->_specialDayTypes)
  {
    if (self->_dayBadgeColors)
      -[LargeMonthWeekView _updateBadges](self, "_updateBadges");
  }
}

- (void)setShowsFirstDayOfMonthLabel:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v5;
  _QWORD *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_showingFirstDayOfMonthLabel != a3 && (self->_firstOfMonthIndex & 0x8000000000000000) == 0)
  {
    v5 = a4;
    self->_showingFirstDayOfMonthLabel = a3;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000207D4;
    v8[3] = &unk_1001B2510;
    v8[4] = self;
    v9 = a3;
    v6 = objc_retainBlock(v8);
    v7 = v6;
    if (v5)
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.5);
    else
      ((void (*)(_QWORD *))v6[2])(v6);
    -[LargeMonthWeekView setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)_updateBadges
{
  unint64_t v3;

  if (-[NSArray count](self->_dayBadgeViews, "count"))
  {
    v3 = 0;
    do
      -[LargeMonthWeekView _updateBadgeAtIndex:](self, "_updateBadgeAtIndex:", v3++);
    while (v3 < -[NSArray count](self->_dayBadgeViews, "count"));
  }
}

- (void)_updateBadgeAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  UIImageView **p_dayBadgeViewBesideFirstOfMonthLabel;
  uint64_t v17;
  id v18;

  if (-[NSArray count](self->_dayBadgeViews, "count") > a3)
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_dayBadgeViews, "objectAtIndex:", a3));
    if (-[NSArray count](self->_specialDayTypes, "count") <= a3
      || -[NSArray count](self->_dayBadgeColors, "count") <= a3
      || -[NSArray count](self->_dayBadgeLocales, "count") <= a3)
    {
      objc_msgSend(v18, "setHidden:", 1);
LABEL_12:

      return;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_specialDayTypes, "objectAtIndex:", a3));
    v6 = objc_msgSend(v5, "integerValue");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_dayBadgeColors, "objectAtIndex:", a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_dayBadgeLocales, "objectAtIndex:", a3));
    if (objc_msgSend(v8, "isEqual:", &stru_1001B67C0))
    {

      v8 = 0;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthWeekView traitCollection](self, "traitCollection"));
    v10 = objc_msgSend(v9, "userInterfaceStyle");

    if (v6 == (id)3)
    {
      v14 = BadgeImageForAlternateWorkday(v7, v10, v8, 14.0);
      v13 = objc_claimAutoreleasedReturnValue(v14);
    }
    else
    {
      v11 = v18;
      if (v6 != (id)1)
        goto LABEL_17;
      v12 = BadgeImageForHoliday(v7, v10, v8, 14.0);
      v13 = objc_claimAutoreleasedReturnValue(v12);
    }
    v15 = (void *)v13;
    v11 = v18;
    if (v15)
    {
      objc_msgSend(v18, "setImage:", v15);
      objc_msgSend(v18, "setHidden:", 0);
      if (self->_firstDayIndex != a3)
      {
LABEL_21:

        goto LABEL_12;
      }
      p_dayBadgeViewBesideFirstOfMonthLabel = &self->_dayBadgeViewBesideFirstOfMonthLabel;
      -[UIImageView setImage:](*p_dayBadgeViewBesideFirstOfMonthLabel, "setImage:", v15);
      v17 = 0;
LABEL_19:
      -[UIImageView setHidden:](*p_dayBadgeViewBesideFirstOfMonthLabel, "setHidden:", v17);
      goto LABEL_21;
    }
LABEL_17:
    objc_msgSend(v11, "setHidden:", 1);
    if (self->_firstDayIndex != a3)
    {
      v15 = 0;
      goto LABEL_21;
    }
    v15 = 0;
    p_dayBadgeViewBesideFirstOfMonthLabel = &self->_dayBadgeViewBesideFirstOfMonthLabel;
    v17 = 1;
    goto LABEL_19;
  }
}

- (void)_updateBadgeBackgroundColors
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;

  v18 = 0;
  v3 = CUIKGetWeekendDays((char *)&v18 + 4, &v18);
  v4 = HIDWORD(v18);
  v5 = CUIKZeroIndexedWeekStart(v3);
  v6 = v18;
  v7 = CUIKZeroIndexedWeekStart(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v9 = objc_msgSend((id)objc_opt_class(self), "_opaqueWeekendBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if ((uint64_t)-[NSArray count](self->_dayBadgeViews, "count") >= 1)
  {
    v11 = 0;
    v12 = (v4 - v5 + 7) % 7;
    v13 = (v6 - v7 + 7) % 7;
    do
    {
      if (v13 == v11 || v12 == v11)
        v15 = v10;
      else
        v15 = v8;
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_dayBadgeViews, "objectAtIndex:", v11));
      objc_msgSend(v17, "setBackgroundColor:", v16);
      if (v11 == self->_firstOfMonthIndex)
        -[UIImageView setBackgroundColor:](self->_dayBadgeViewBesideFirstOfMonthLabel, "setBackgroundColor:", v16);

      ++v11;
    }
    while (v11 < (uint64_t)-[NSArray count](self->_dayBadgeViews, "count"));
  }

}

+ (id)_opaqueWeekendBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "weekendColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v13 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  v10 = 0.0;
  objc_msgSend(v2, "getRed:green:blue:alpha:", &v13, &v12, &v11, &v10);
  v8 = 0.0;
  v9 = 0.0;
  v6 = 0;
  v7 = 0.0;
  objc_msgSend(v3, "getRed:green:blue:alpha:", &v9, &v8, &v7, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v9 * (1.0 - v10) + v13 * v10, (1.0 - v10) * v8 + v12 * v10, (1.0 - v10) * v7 + v11 * v10, 1.0));

  return v4;
}

- (void)_viewTapped:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  _BOOL8 v23;
  id WeakRetained;
  unsigned int v25;
  id v26;
  CGPoint v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  v26 = (id)objc_claimAutoreleasedReturnValue(-[LargeMonthWeekView dateAtPoint:](self, "dateAtPoint:"));
  -[MonthWeekOccurrencesView frameForLastOccurrenceOnDay:](self->_occurrencesView, "frameForLastOccurrenceOnDay:");
  -[LargeMonthWeekView convertRect:fromView:](self, "convertRect:fromView:", self->_occurrencesView);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[MonthWeekOccurrencesView frame](self->_occurrencesView, "frame");
  if (v8 >= CGRectGetMinY(v28))
  {
    v29.origin.x = v10;
    v29.origin.y = v12;
    v29.size.width = v14;
    v29.size.height = v16;
    if (v8 <= CGRectGetMaxY(v29))
      goto LABEL_6;
    v17 = -8.0;
  }
  else
  {
    v17 = 8.0;
  }
  v8 = v8 + v17;
LABEL_6:
  -[MonthWeekOccurrencesView frame](self->_occurrencesView, "frame");
  v27.x = v6;
  v27.y = v8;
  if (CGRectContainsPoint(v30, v27))
  {
    -[MonthWeekOccurrencesView convertPoint:fromView:](self->_occurrencesView, "convertPoint:fromView:", self, v6, v8);
    v19 = v18;
    v21 = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView occurrenceAtPoint:](self->_occurrencesView, "occurrenceAtPoint:"));
    if (v22)
      v23 = -[MonthWeekOccurrencesView occurrence:hasSymbolAtPoint:](self->_occurrencesView, "occurrence:hasSymbolAtPoint:", v22, v19, v21);
    else
      v23 = 0;
  }
  else
  {
    v23 = 0;
    v22 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v25 = objc_msgSend(v4, "modifierFlags");

  objc_msgSend(WeakRetained, "largeMonthWeekView:didTapOccurrence:onDay:extendSelection:userInitiated:tappedSymbol:", self, v22, v26, (*(_QWORD *)&v25 & 0x120000) != 0, 1, v23);
}

- (void)_viewDoubleTapped:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  LargeMonthWeekView *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  objc_msgSend(a3, "locationInView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthWeekView dateAtPoint:](self, "dateAtPoint:"));
  if (v4)
  {
    v5 = objc_alloc((Class)UIView);
    -[LargeMonthWeekView frameForDate:](self, "frameForDate:", v4);
    v6 = objc_msgSend(v5, "initWithFrame:");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v6, "setBackgroundColor:", v7);

    objc_msgSend(v6, "setAlpha:", 0.0);
    -[LargeMonthWeekView addSubview:](self, "addSubview:", v6);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000212A8;
    v13[3] = &unk_1001B2538;
    v14 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000212B8;
    v9[3] = &unk_1001B2560;
    v10 = v14;
    v11 = self;
    v12 = v4;
    v8 = v14;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v13, v9, 0.3);

  }
}

- (id)calendarDate
{
  return self->_startDate;
}

- (id)endCalendarDate
{
  return self->_endDate;
}

- (double)topInset
{
  double result;

  objc_msgSend((id)objc_opt_class(self), "topInset");
  return result;
}

- (BOOL)_hasPaddingRow
{
  return self->_isLastWeekOfMonth && self->_dayCount == 7;
}

- (void)_updateDayFrames
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  char *v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  double gridlineThickness;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  LargeMonthWeekView *v26;
  uint64_t v27;
  double v28;
  CGFloat v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthWeekView window](self, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "screen"));
  objc_msgSend(v4, "scale");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthWeekView window](self, "window"));
  v8 = (char *)objc_msgSend(v7, "interfaceOrientation") - 1;

  if (v6 <= 1.0)
  {
    self->_gridlineThickness = 1.0;
    v9 = (unint64_t)v8 >= 2;
    if ((unint64_t)v8 >= 2)
      v10 = qword_1001F5F58;
    else
      v10 = qword_1001F5F90;
    v11 = qword_1001A12E0;
    v12 = qword_1001A1318;
  }
  else
  {
    self->_gridlineThickness = 0.5;
    v9 = (unint64_t)v8 >= 2;
    if ((unint64_t)v8 >= 2)
      v10 = qword_1001F5EE8;
    else
      v10 = qword_1001F5F20;
    v11 = qword_1001A1270;
    v12 = qword_1001A12A8;
  }
  if (v9)
    v13 = v11;
  else
    v13 = v12;
  -[LargeMonthWeekView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v18 = (id)-[LargeMonthWeekView _hasPaddingRow](self, "_hasPaddingRow");
  if ((_DWORD)v18)
    v17 = CalRoundToScreenScale(v18, v19, v17 * 0.5);
  v20 = 0;
  gridlineThickness = self->_gridlineThickness;
  v22 = v17 - gridlineThickness;
  v23 = v15 + gridlineThickness;
  if ((unint64_t)v8 >= 2)
    v24 = 1024.0;
  else
    v24 = 768.0;
  v25 = 6;
  v26 = self;
  do
  {
    if (CalTimeDirectionIsLeftToRight(v18, v19))
      v27 = v20;
    else
      v27 = v25;
    v18 = -[LargeMonthWeekView bounds](self, "bounds");
    if (v28 == 0.0)
      v28 = EKUICurrentWindowWidthWithViewHierarchy(self);
    v29 = v28 * *(double *)&v13[v27] / v24;
    v26->_dayFrames[0].origin.x = v28 * *(double *)&v10[v27] / v24;
    v26->_dayFrames[0].origin.y = v23;
    v26->_dayFrames[0].size.width = v29;
    v26->_dayFrames[0].size.height = v22;
    ++v20;
    v26 = (LargeMonthWeekView *)((char *)v26 + 32);
    --v25;
  }
  while (v20 != 7);
}

- (void)layoutSubviews
{
  CGRect *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double MaxY;
  CALayer **p_paddingRowBorderLine;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double gridlineThickness;
  double v20;
  int64_t v21;
  id v22;
  uint64_t v23;
  UILabel *weekNumberLabel;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  double v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  int IsLeftToRight;
  double v39;
  CGRect *v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double MaxX;
  NSArray *dayNumberLabels;
  void *v50;
  double v51;
  unsigned __int8 v52;
  double v53;
  double v54;
  double MidX;
  CGFloat v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double MidY;
  CGFloat v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  id v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  id v71;
  double v72;
  uint64_t v73;
  uint64_t i;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[7];
  _QWORD v81[6];
  objc_super v82;
  _BYTE v83[224];
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  v82.receiver = self;
  v82.super_class = (Class)LargeMonthWeekView;
  -[LargeMonthWeekView layoutSubviews](&v82, "layoutSubviews");
  v3 = &self->_dayFrames[(13 - CUIKZeroIndexedWeekStart(-[LargeMonthWeekView _updateDayFrames](self, "_updateDayFrames")))
                       % 7];
  x = v3->origin.x;
  y = v3->origin.y;
  width = v3->size.width;
  height = v3->size.height;
  v8 = -[LargeMonthWeekView _hasPaddingRow](self, "_hasPaddingRow");
  if (v8)
  {
    -[LargeMonthWeekView bounds](self, "bounds");
    v10 = v9;
    v12 = v11;
    v84.origin.x = x;
    v84.origin.y = y;
    v84.size.width = width;
    v84.size.height = height;
    MaxY = CGRectGetMaxY(v84);
    CalRoundRectToScreenScale(v10, MaxY, v12, self->_gridlineThickness);
    p_paddingRowBorderLine = &self->_paddingRowBorderLine;
    -[CALayer setFrame:](self->_paddingRowBorderLine, "setFrame:");
  }
  else
  {
    p_paddingRowBorderLine = &self->_paddingRowBorderLine;
  }
  -[CALayer setHidden:](*p_paddingRowBorderLine, "setHidden:", v8 ^ 1);
  -[LargeMonthWeekView bounds](self, "bounds");
  v16 = v15;
  v18 = v17 + 0.0;
  gridlineThickness = self->_gridlineThickness;
  -[CALayer setFrame:](self->_topBorderLine, "setFrame:", v15, v17 + 0.0);
  v20 = v18 + gridlineThickness + 7.0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x3010000000;
  v81[3] = &unk_100195B79;
  *(CGFloat *)&v81[4] = v16;
  *(double *)&v81[5] = v20;
  v21 = -[LargeMonthWeekView dayIndexForToday](self, "dayIndexForToday");
  v22 = -[EKCalendarDate dayOfWeek](self->_startDate, "dayOfWeek");
  v23 = ((uint64_t)v22 - CUIKZeroIndexedWeekStart(v22) + 6) % 7;
  weekNumberLabel = self->_weekNumberLabel;
  if (weekNumberLabel)
  {
    -[UILabel sizeToFit](weekNumberLabel, "sizeToFit");
    -[UILabel frame](self->_weekNumberLabel, "frame");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[CALayer frame](self->_topBorderLine, "frame");
    v31 = CGRectGetMaxY(v85);
    v32 = -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_weekNumberLabel, "_firstLineBaselineOffsetFromBoundsTop");
    v35 = CalRoundToScreenScale(v32, v34, v31 - v33);
    IsLeftToRight = CalTimeDirectionIsLeftToRight(v36, v37);
    v39 = v35 + 21.0;
    v40 = &self->_dayFrames[v23];
    v41 = v40->origin.x;
    v42 = v40->origin.y;
    v43 = v40->size.width;
    v44 = v40->size.height;
    if (IsLeftToRight)
    {
      v47 = CGRectGetMinX(*(CGRect *)&v41) + 10.5;
    }
    else
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v41);
      v86.origin.x = v26;
      v86.origin.y = v39;
      v86.size.width = v28;
      v86.size.height = v30;
      v47 = MaxX + -10.5 - CGRectGetWidth(v86);
    }
    -[UILabel setFrame:](self->_weekNumberLabel, "setFrame:", CalRoundToScreenScale(v45, v46, v47), v39, v28, v30);
  }
  dayNumberLabels = self->_dayNumberLabels;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100021AA4;
  v80[3] = &unk_1001B2588;
  v80[4] = self;
  v80[5] = v81;
  v80[6] = v23;
  -[NSArray enumerateObjectsUsingBlock:](dayNumberLabels, "enumerateObjectsUsingBlock:", v80);
  if (v21 < 0 || v21 >= self->_firstDayIndex + self->_dayCount)
  {
    v65 = -[_CircleView setHidden:](self->_todayCircle, "setHidden:", 1);
  }
  else
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_dayNumberLabels, "objectAtIndexedSubscript:", v21));
    objc_msgSend(v50, "frame");
    v51 = CGRectGetWidth(v87);
    v52 = -[_CircleView usesRoundedRectInsteadOfCircle](self->_todayCircle, "usesRoundedRectInsteadOfCircle");
    v53 = v51 + 10.0;
    if ((v52 & (v51 + 10.0 > 26.0)) != 0)
      v54 = v51 + 10.0;
    else
      v54 = 26.0;
    objc_msgSend(v50, "frame", v53);
    MidX = CGRectGetMidX(v88);
    v89.size.height = 26.0;
    v89.origin.x = v16;
    v89.origin.y = v20;
    v89.size.width = v54;
    v56 = CGRectGetWidth(v89);
    v59 = CalRoundToScreenScale(v57, v58, MidX + v56 * -0.5);
    objc_msgSend(v50, "frame");
    MidY = CGRectGetMidY(v90);
    v91.size.height = 26.0;
    v91.origin.x = v59;
    v91.origin.y = v20;
    v91.size.width = v54;
    v61 = CGRectGetHeight(v91);
    v64 = CalRoundToScreenScale(v62, v63, MidY + v61 * -0.5 + -0.5);
    CalRoundRectToScreenScale(v59, v64, v54, 26.0);
    -[_CircleView setFrame:](self->_todayCircle, "setFrame:");
    -[_CircleView setHidden:](self->_todayCircle, "setHidden:", 0);

  }
  v67 = CalRoundToScreenScale(v65, v66, v20 + 24.0 + 3.0);
  -[LargeMonthWeekView bounds](self, "bounds");
  v68 = CGRectGetWidth(v92);
  -[LargeMonthWeekView bounds](self, "bounds");
  v70 = v69 - v67;
  if (-[LargeMonthWeekView _hasPaddingRow](self, "_hasPaddingRow"))
  {
    v71 = -[LargeMonthWeekView bounds](self, "bounds");
    v70 = v70 - CalRoundToScreenScale(v71, v73, v72 * 0.5);
  }
  CalRoundRectToScreenScale(0.0, v67, v68, v70);
  -[MonthWeekOccurrencesView setFrame:](self->_occurrencesView, "setFrame:");
  for (i = 0; i != 7; ++i)
  {
    -[LargeMonthWeekView convertRect:toView:](self, "convertRect:toView:", self->_occurrencesView, self->_dayFrames[i].origin.x, self->_dayFrames[i].origin.y, self->_dayFrames[i].size.width, self->_dayFrames[i].size.height);
    v75 = &v83[i * 32];
    *v75 = v76;
    v75[1] = v77;
    v75[2] = v78;
    v75[3] = v79;
  }
  -[MonthWeekOccurrencesView setDayFrames:](self->_occurrencesView, "setDayFrames:", v83);
  _Block_object_dispose(v81, 8);
}

- (id)dayFrames
{
  id v3;
  CGRect *dayFrames;
  uint64_t i;
  void *v6;

  -[LargeMonthWeekView _updateDayFrames](self, "_updateDayFrames");
  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 7);
  dayFrames = self->_dayFrames;
  for (i = 24; i != 248; i += 32)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", *(double *)((char *)dayFrames + i - 24), *(double *)((char *)dayFrames + i - 16), *(double *)((char *)dayFrames + i - 8), *(double *)((char *)&dayFrames->origin.x + i)));
    objc_msgSend(v3, "addObject:", v6);

  }
  return v3;
}

- (BOOL)containsCalendarDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthWeekView calendarDate](self, "calendarDate"));
  v6 = objc_msgSend(v5, "compare:", v4);

  if (v6 == (id)1)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthWeekView endCalendarDate](self, "endCalendarDate"));
    v7 = objc_msgSend(v8, "compare:", v4) != (id)-1;

  }
  return v7;
}

- (id)dateAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  uint64_t v6;
  CGRect *dayFrames;
  CGFloat *p_x;
  void *v9;
  CGPoint v11;
  CGRect v12;

  if (self->_dayCount < 1)
  {
LABEL_5:
    v9 = 0;
  }
  else
  {
    y = a3.y;
    x = a3.x;
    v6 = 0;
    dayFrames = self->_dayFrames;
    while (1)
    {
      p_x = &dayFrames[v6 + self->_firstDayIndex].origin.x;
      v12.origin.x = *p_x;
      v12.origin.y = p_x[1];
      v12.size.height = p_x[3];
      v12.size.width = p_x[2] + self->_gridlineThickness;
      v11.x = x;
      v11.y = y;
      if (CGRectContainsPoint(v12, v11))
        break;
      if (++v6 >= self->_dayCount)
        goto LABEL_5;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthWeekView dateForIndex:](self, "dateForIndex:", v6));
  }
  return v9;
}

- (CGRect)frameForOccurrence:(id)a3 onDay:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double x;
  double y;
  double width;
  double height;
  CGRect v20;
  CGRect result;

  v6 = a4;
  v7 = a3;
  -[LargeMonthWeekView layoutIfNeeded](self, "layoutIfNeeded");
  -[MonthWeekOccurrencesView frameForOccurrence:onDay:](self->_occurrencesView, "frameForOccurrence:onDay:", v7, v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  if (CGRectIsNull(v20))
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  else
  {
    -[LargeMonthWeekView convertRect:fromView:](self, "convertRect:fromView:", self->_occurrencesView, v9, v11, v13, v15);
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)frameForOccurrenceAfterLastOnDay:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL8 v23;
  uint64_t v24;
  CGFloat MaxY;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect result;

  v4 = a3;
  -[LargeMonthWeekView layoutIfNeeded](self, "layoutIfNeeded");
  -[MonthWeekOccurrencesView frameForOccurrenceAfterLastOnDay:](self->_occurrencesView, "frameForOccurrenceAfterLastOnDay:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[LargeMonthWeekView convertRect:fromView:](self, "convertRect:fromView:", self->_occurrencesView, v6, v8, v10, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[LargeMonthWeekView bounds](self, "bounds");
  v22 = v21;
  v23 = -[LargeMonthWeekView _hasPaddingRow](self, "_hasPaddingRow");
  if (v23)
    v22 = CalRoundToScreenScale(v23, v24, v22 * 0.5);
  v30.origin.x = v14;
  v30.origin.y = v16;
  v30.size.width = v18;
  v30.size.height = v20;
  MaxY = CGRectGetMaxY(v30);
  v26 = v22 - v20;
  if (MaxY <= v22)
    v26 = v16;
  v27 = v14;
  v28 = v18;
  v29 = v20;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v26;
  result.origin.x = v27;
  return result;
}

- (void)setHighlightedDayRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t dayCount;
  NSMutableDictionary *highlightedDays;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSUInteger v11;
  void *v12;
  uint64_t v13;
  id v14;
  CGRect *v15;
  double y;
  double x;
  double height;
  double width;
  double gridlineThickness;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  void *v28;
  id v29;
  id obj;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  _BYTE v42[128];

  length = a3.length;
  location = a3.location;
  if (a3.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    dayCount = self->_dayCount;
    if (a3.location + a3.length > dayCount)
      length = dayCount - a3.location;
  }
  if (a3.location != self->_highlightedDayRange.location || length != self->_highlightedDayRange.length)
  {
    self->_highlightedDayRange.location = a3.location;
    self->_highlightedDayRange.length = length;
    highlightedDays = self->_highlightedDays;
    if (!highlightedDays)
    {
      v9 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 7);
      v10 = self->_highlightedDays;
      self->_highlightedDays = v9;

      highlightedDays = self->_highlightedDays;
    }
    v31 = -[NSMutableDictionary mutableCopy](highlightedDays, "mutableCopy");
    if (length && location < length + location)
    {
      v11 = location;
      do
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
        v13 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_highlightedDays, "objectForKey:", v12));
        if (v13)
        {
          v14 = (id)v13;
          objc_msgSend(v31, "removeObjectForKey:", v12);
        }
        else
        {
          if (qword_1001F5FD0 != -1)
            dispatch_once(&qword_1001F5FD0, &stru_1001B25A8);
          v15 = &self->_dayFrames[v11 + self->_firstDayIndex];
          x = v15->origin.x;
          y = v15->origin.y;
          width = v15->size.width;
          height = v15->size.height;
          if (v11 > location)
          {
            gridlineThickness = self->_gridlineThickness;
            x = x - gridlineThickness;
            width = width + gridlineThickness;
          }
          v21 = objc_alloc((Class)UIView);
          CalRoundRectToScreenScale(x, y, width, height);
          v22 = objc_msgSend(v21, "initWithFrame:");
          objc_msgSend(v22, "setBackgroundColor:", qword_1001F5FC8);
          objc_msgSend(v22, "setAlpha:", 0.0);
          -[LargeMonthWeekView addSubview:](self, "addSubview:", v22);
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_1000229FC;
          v40[3] = &unk_1001B2538;
          v14 = v22;
          v41 = v14;
          +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v40, 0, 0.2, 0.0);
          -[NSMutableDictionary setObject:forKey:](self->_highlightedDays, "setObject:forKey:", v14, v12);

        }
        ++v11;
        --length;
      }
      while (length);
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "allKeys"));
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(obj);
          v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", v27));
          -[NSMutableDictionary removeObjectForKey:](self->_highlightedDays, "removeObjectForKey:", v27);
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_100022A08;
          v34[3] = &unk_1001B2538;
          v35 = v28;
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_100022A14;
          v32[3] = &unk_1001B25D0;
          v33 = v35;
          v29 = v35;
          +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, v34, v32, 0.2, 0.0);

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v24);
    }

  }
}

- (id)newFeedbackViewForDraggingOccurrence:(id)a3 atPoint:(CGPoint)a4
{
  double x;
  id v6;
  double MaxX;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  EKCalendarDate *v13;
  EKCalendarDate *v14;
  void *v15;
  float v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  CGRect v28;
  CGRect v29;

  x = a4.x;
  v6 = a3;
  if (x < 0.0)
    x = 0.0;
  -[LargeMonthWeekView frame](self, "frame");
  MaxX = CGRectGetMaxX(v28);
  if (x > MaxX)
  {
    -[LargeMonthWeekView frame](self, "frame");
    MaxX = CGRectGetMaxX(v29);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startCalendarDate", MaxX));
  objc_msgSend(v8, "absoluteTime");
  v10 = v9;
  -[EKCalendarDate absoluteTime](self->_startDate, "absoluteTime");
  v12 = v11;

  if (v10 >= v12)
    v13 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startCalendarDate"));
  else
    v13 = self->_startDate;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView occurrenceViewForOccurrence:onDay:](self->_occurrencesView, "occurrenceViewForOccurrence:onDay:", v6, v13));
  objc_msgSend(v15, "setSelected:", 1);
  v16 = kDraggedEventShadowOpacity;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
  *(float *)&v18 = v16;
  objc_msgSend(v17, "setShadowOpacity:", v18);

  v19 = DraggedEventShadowOffset();
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
  objc_msgSend(v22, "setShadowOffset:", v19, v21);

  v23 = kDraggedEventShadowRadius;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
  objc_msgSend(v24, "setShadowRadius:", v23);

  v25 = DraggedEventShadowColor();
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layer"));
  objc_msgSend(v26, "setShadowColor:", v25);

  return v15;
}

- (void)didCompleteMonthWeekViewBackgroundRendering
{
  LargeMonthWeekViewDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "didCompleteBackgroundOccurrenceRenderingForLargeMonthWeekView:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "didCompleteBackgroundOccurrenceRenderingForLargeMonthWeekView:", self);

  }
}

- (BOOL)isBackgroundScene
{
  LargeMonthWeekViewDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;
  unsigned __int8 v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector(WeakRetained, "isBackgroundScene");

  if ((v4 & 1) == 0)
    return 0;
  v5 = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_msgSend(v5, "isBackgroundScene");

  return v6;
}

- (void)monthWeekOccurrencesView:(id)a3 selectedEvent:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  LargeMonthWeekViewDelegate **p_delegate;
  id v8;
  id WeakRetained;

  v5 = a5;
  p_delegate = &self->_delegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "largeMonthWeekView:didTapOccurrence:onDay:extendSelection:userInitiated:tappedSymbol:", self, v8, 0, 0, v5, 0);

}

- (id)presentationControllerForEditMenu
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "presentationControllerForEditMenu"));

  return v3;
}

- (id)selectedEventsForEditMenu
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "selectedEventsForEditMenu"));

  return v3;
}

- (void)attemptDisplayReviewPrompt
{
  LargeMonthWeekViewDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector(WeakRetained, "attemptDisplayReviewPrompt");

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v5, "attemptDisplayReviewPrompt");

  }
}

- (double)monthWeekScale
{
  return 1.0;
}

- (id)weekdayLabels
{
  return self->_dayNumberLabels;
}

- (id)todayCircle
{
  return self->_todayCircle;
}

- (CGRect)circleFrame
{
  _CircleView *todayCircle;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  todayCircle = self->_todayCircle;
  if (todayCircle)
  {
    -[_CircleView frame](todayCircle, "frame");
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)occurrencesView
{
  return self->_occurrencesView;
}

- (int64_t)dayIndexForToday
{
  int64_t todayDay;

  todayDay = self->_todayDay;
  if (todayDay)
    return todayDay - (_QWORD)-[EKCalendarDate day](self->_startDate, "day") + self->_firstDayIndex;
  else
    return -1;
}

- (int64_t)todayDay
{
  return self->_todayDay;
}

- (void)setTodayDay:(int64_t)a3
{
  self->_todayDay = a3;
}

- (BOOL)showsTopBorder
{
  return self->_showsTopBorder;
}

- (BOOL)showsWeekNumber
{
  return self->_showsWeekNumber;
}

- (_NSRange)highlightedDayRange
{
  _NSRange *p_highlightedDayRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_highlightedDayRange = &self->_highlightedDayRange;
  location = self->_highlightedDayRange.location;
  length = p_highlightedDayRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (LargeMonthWeekViewDataSource)dataSource
{
  return (LargeMonthWeekViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (LargeMonthWeekViewDelegate)delegate
{
  return (LargeMonthWeekViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_occurrencesView, 0);
  objc_storeStrong((id *)&self->_dayBadgeLocales, 0);
  objc_storeStrong((id *)&self->_dayBadgeColors, 0);
  objc_storeStrong((id *)&self->_specialDayTypes, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_weekNumberLabel, 0);
  objc_storeStrong((id *)&self->_firstOfMonthNoDayLabel, 0);
  objc_storeStrong((id *)&self->_firstOfMonthLabel, 0);
  objc_storeStrong((id *)&self->_occurrencesScrollView, 0);
  objc_storeStrong((id *)&self->_highlightedDays, 0);
  objc_storeStrong((id *)&self->_overlayUnderline, 0);
  objc_storeStrong((id *)&self->_dayBadgeViewBesideFirstOfMonthLabel, 0);
  objc_storeStrong((id *)&self->_dayBadgeViews, 0);
  objc_storeStrong((id *)&self->_overlayLabels, 0);
  objc_storeStrong((id *)&self->_dayNumberLabels, 0);
  objc_storeStrong((id *)&self->_todayCircle, 0);
  objc_storeStrong((id *)&self->_paddingRowBorderLine, 0);
  objc_storeStrong((id *)&self->_topBorderLine, 0);
}

@end
