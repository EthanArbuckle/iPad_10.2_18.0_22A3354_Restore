@implementation CompactMonthWeekView

+ (double)dayNumberFontSize:(BOOL)a3
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double result;

  if (a3)
  {
    v3 = CUIKGetOverlayCalendar(a1, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = 28.0;
    if (v4)
      v5 = 23.0;
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 18.0, v5);
    v7 = v6;

    return v7;
  }
  else
  {
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 18.0, 28.0);
  }
  return result;
}

+ (double)dayNumberOverlayFontSize:(BOOL)a3
{
  double v3;
  double result;

  v3 = 12.5;
  if (!a3)
    v3 = 15.5;
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 10.0, v3);
  return result;
}

- (CompactMonthWeekView)initWithCalendarDate:(id)a3 calendar:(id)a4 compressed:(BOOL)a5
{
  id v8;
  id v9;
  CompactMonthWeekView *v10;
  CompactMonthWeekView *v11;
  void *v12;
  MonthWeekOccurrencesView *v13;
  MonthWeekOccurrencesView *occurrencesView;
  double v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;
  uint64_t v24;

  v8 = a3;
  v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CompactMonthWeekView;
  v10 = -[CompactMonthWeekView init](&v23, "init");
  v11 = v10;
  if (v10)
  {
    v10->_compressedVerticalMode = a5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CompactMonthWeekView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    objc_storeStrong((id *)&v11->_calendar, a4);
    -[CompactMonthWeekView _initializeGrayLine](v11, "_initializeGrayLine");
    -[CompactMonthWeekView _initializeDays](v11, "_initializeDays");
    -[CompactMonthWeekView _initializeDaySummaries](v11, "_initializeDaySummaries");
    -[CompactMonthWeekView _initializeBackground](v11, "_initializeBackground");
    -[CompactMonthWeekView _setUpInteraction](v11, "_setUpInteraction");
    v13 = objc_alloc_init(MonthWeekOccurrencesView);
    occurrencesView = v11->_occurrencesView;
    v11->_occurrencesView = v13;

    -[MonthWeekOccurrencesView setDelegate:](v11->_occurrencesView, "setDelegate:", v11);
    -[MonthWeekOccurrencesView setIsCompact:](v11->_occurrencesView, "setIsCompact:", 1);
    -[CompactMonthWeekView addSubview:](v11, "addSubview:", v11->_occurrencesView);
    -[CompactMonthWeekView bringSubviewToFront:](v11, "bringSubviewToFront:", v11->_occurrencesView);
    -[CompactMonthWeekView setCalendarDate:](v11, "setCalendarDate:", v8);
    objc_initWeak(&location, v11);
    *(_QWORD *)&v15 = objc_opt_class(UITraitUserInterfaceStyle).n128_u64[0];
    v24 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1, v15));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000AD260;
    v20[3] = &unk_1001B2418;
    objc_copyWeak(&v21, &location);
    v18 = -[CompactMonthWeekView registerForTraitChanges:withHandler:](v11, "registerForTraitChanges:withHandler:", v17, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (BOOL)drawWithViews
{
  return self->_drawsWithViews;
}

- (void)setDrawWithViews:(BOOL)a3
{
  if (self->_drawsWithViews != a3)
  {
    self->_drawsWithViews = a3;
    -[MonthWeekOccurrencesView setDrawWithViews:](self->_occurrencesView, "setDrawWithViews:");
    -[MonthWeekOccurrencesView setNeedsDisplay](self->_occurrencesView, "setNeedsDisplay");
  }
}

+ (id)weekNumberColorForThisWeek:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (qword_1001F62B0 != -1)
  {
    dispatch_once(&qword_1001F62B0, &stru_1001B46C8);
    if (a3)
      goto LABEL_3;
LABEL_5:
    v5 = (id)qword_1001F62A8;
    return v5;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  v4 = CalendarAppTintColor(a1, a2);
  v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  return v5;
}

- (void)setShowWeekNumber:(BOOL)a3
{
  UILabel *v4;
  UILabel *weekNumberLabel;
  double v6;
  id v7;
  void *v8;
  UILabel *v9;

  if (self->_showWeekNumber != a3)
  {
    self->_showWeekNumber = a3;
    if (a3)
    {
      v4 = objc_opt_new(UILabel);
      weekNumberLabel = self->_weekNumberLabel;
      self->_weekNumberLabel = v4;

      *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "weekNumberFont", v6));
      -[UILabel setFont:](self->_weekNumberLabel, "setFont:", v8);

      -[CompactMonthWeekView addSubview:](self, "addSubview:", self->_weekNumberLabel);
      -[CompactMonthWeekView _updateWeekNumberAnimated:](self, "_updateWeekNumberAnimated:", 0);
    }
    else
    {
      -[UILabel removeFromSuperview](self->_weekNumberLabel, "removeFromSuperview");
      v9 = self->_weekNumberLabel;
      self->_weekNumberLabel = 0;

    }
    -[CompactMonthWeekView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTemporarilyHideWeekNumber:(BOOL)a3
{
  if (self->_temporarilyHideWeekNumber != a3)
  {
    self->_temporarilyHideWeekNumber = a3;
    -[UILabel setHidden:](self->_weekNumberLabel, "setHidden:");
  }
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CompactMonthWeekView;
  v3 = -[CompactMonthWeekView description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@;\n\t_startCalendarDate: [%@]"),
                   v4,
                   self->_startCalendarDate));

  return (NSString *)v5;
}

- (void)_initializeGrayLine
{
  UIView *v3;
  double v4;
  id v5;
  void *v6;
  UIView *grayLine;

  if (!self->_grayLine)
  {
    v3 = (UIView *)objc_alloc_init((Class)UIView);
    *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "grayLineColor", v4));
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v6);

    -[CompactMonthWeekView addSubview:](self, "addSubview:", v3);
    grayLine = self->_grayLine;
    self->_grayLine = v3;

  }
}

- (void)_initializeDays
{
  unint64_t v3;
  NSArray *i;
  CompactMonthWeekDayNumber *v5;
  double v6;
  id v7;
  double v8;
  id v9;
  NSArray *days;

  if (!self->_days)
  {
    v3 = -[CompactMonthWeekView _daysInAWeek](self, "_daysInAWeek");
    for (i = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v3); v3; --v3)
    {
      v5 = -[CompactMonthWeekDayNumber initWithWeekView:andCalendar:]([CompactMonthWeekDayNumber alloc], "initWithWeekView:andCalendar:", self, self->_calendar);
      *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
      objc_msgSend(v7, "dayNumberFontSize:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v6));
      -[CompactMonthWeekDayNumber setFontSize:](v5, "setFontSize:");
      *(_QWORD *)&v8 = objc_opt_class(self).n128_u64[0];
      objc_msgSend(v9, "dayNumberOverlayFontSize:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v8));
      -[CompactMonthWeekDayNumber setOverlayFontSize:](v5, "setOverlayFontSize:");
      -[NSArray addObject:](i, "addObject:", v5);

    }
    days = self->_days;
    self->_days = i;

  }
  -[CompactMonthWeekView _updateDayFrames](self, "_updateDayFrames");
}

- (void)_initializeBackground
{
  UIView *v3;
  UIView *backgroundView;
  void *v5;

  v3 = objc_opt_new(UIView);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v5);

  -[CompactMonthWeekView addSubview:](self, "addSubview:", self->_backgroundView);
  -[CompactMonthWeekView sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundView);
}

- (void)_initializeDaySummaries
{
  NSArray *v3;
  uint64_t v4;
  SingleDaySummary *v5;
  NSArray *daySummaries;

  v3 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[CompactMonthWeekView _daysInAWeek](self, "_daysInAWeek")));
  if ((uint64_t)-[CompactMonthWeekView _daysInAWeek](self, "_daysInAWeek") >= 1)
  {
    v4 = 0;
    do
    {
      v5 = objc_alloc_init(SingleDaySummary);
      -[NSArray addObject:](v3, "addObject:", v5);
      -[CompactMonthWeekView addSubview:](self, "addSubview:", v5);

      ++v4;
    }
    while ((uint64_t)-[CompactMonthWeekView _daysInAWeek](self, "_daysInAWeek") > v4);
  }
  daySummaries = self->_daySummaries;
  self->_daySummaries = v3;

}

- (void)_updateDayFrames
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat Width;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double Height;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  void *v23;
  void *v24;
  CGRect v25;
  CGRect v26;

  -[CompactMonthWeekView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[CompactMonthWeekView useLayoutMargins](self, "useLayoutMargins"))
  {
    -[CompactMonthWeekView safeAreaInsets](self, "safeAreaInsets");
    v4 = v4 + v11;
    -[CompactMonthWeekView safeAreaInsets](self, "safeAreaInsets");
    v8 = v8 - v12;
  }
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  Width = CGRectGetWidth(v25);
  v16 = CalRoundToScreenScale(v14, v15, Width / 7.0);
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  Height = CGRectGetHeight(v26);
  v18 = -[CompactMonthWeekView _daysInAWeek](self, "_daysInAWeek");
  if (v18)
  {
    v20 = 0;
    v21 = -1;
    do
    {
      v22 = v20;
      if ((CalTimeDirectionIsLeftToRight(v18, v19) & 1) == 0)
        v22 = (char *)-[CompactMonthWeekView _daysInAWeek](self, "_daysInAWeek") + v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_days, "objectAtIndexedSubscript:", v22));
      objc_msgSend(v23, "setFrame:", v4, 0.0, v16, Height);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_days, "objectAtIndexedSubscript:", v22));
      objc_msgSend(v24, "updateOverlay");

      v4 = v16 + v4;
      ++v20;
      v18 = -[CompactMonthWeekView _daysInAWeek](self, "_daysInAWeek");
      --v21;
    }
    while ((unint64_t)v20 < v18);
  }
}

- (void)_initializeMonthNameLabel
{
  UILabel *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  UILabel *monthNameLabel;

  if (!self->_monthNameLabel)
  {
    v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CompactMonthViewController monthNameFont](CompactMonthViewController, "monthNameFont"));
    -[UILabel setFont:](v3, "setFont:", v4);

    if (-[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode"))
      v5 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    else
      v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v6 = (void *)v5;
    -[UILabel setBackgroundColor:](v3, "setBackgroundColor:", v5);

    -[UILabel setHidden:](v3, "setHidden:", 1);
    -[UILabel setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    if (self->_weekNumberLabel)
      -[CompactMonthWeekView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v3);
    else
      -[CompactMonthWeekView addSubview:](self, "addSubview:", v3);
    monthNameLabel = self->_monthNameLabel;
    self->_monthNameLabel = v3;

  }
}

- (double)monthWeekScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView weekDelegate](self, "weekDelegate"));

  if (!v3)
    return 1.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView weekDelegate](self, "weekDelegate"));
  objc_msgSend(v4, "monthWeekScale");
  v6 = v5;

  return v6;
}

+ (id)cachedCalculatedValues
{
  if (qword_1001F62B8 != -1)
    dispatch_once(&qword_1001F62B8, &stru_1001B46E8);
  return (id)__cachedCalculatedValues;
}

+ (void)clearCalculatedValues
{
  NSMutableDictionary *v2;
  void *v3;

  +[EKUILargeTextUtilities clearCache](EKUILargeTextUtilities, "clearCache");
  v2 = objc_opt_new(NSMutableDictionary);
  v3 = (void *)__cachedCalculatedValues;
  __cachedCalculatedValues = (uint64_t)v2;

  +[MonthViewOccurrence clearCachedFonts](MonthViewOccurrence, "clearCachedFonts");
  +[MonthWeekOccurrencesView clearMoreEventAttributes](MonthWeekOccurrencesView, "clearMoreEventAttributes");
}

+ (id)weekNumberFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cachedCalculatedValues"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", weekDayFontKey));
  if (!v3)
  {
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 11.0, 14.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, weekDayFontKey);
  }

  return v3;
}

+ (double)twoDigitWeekNumberWidth
{
  void *v3;
  void *v4;
  void *v5;
  UILabel *v6;
  uint64_t v7;
  void *v8;
  NSNumber *v9;
  double v10;
  double v11;
  CGRect v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cachedCalculatedValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", twoDigitWeekNumberWidthKey));
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "weekNumberFont"));
    v6 = objc_opt_new(UILabel);
    -[UILabel setFont:](v6, "setFont:", v5);
    v7 = CUIKLocalizedStringForInteger(22);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[UILabel setText:](v6, "setText:", v8);

    -[UILabel sizeToFit](v6, "sizeToFit");
    -[UILabel frame](v6, "frame");
    v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CGRectGetWidth(v13));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, twoDigitWeekNumberWidthKey);

  }
  objc_msgSend(v4, "doubleValue");
  v11 = v10;

  return v11;
}

+ (double)weekNumberDistanceFromGrayLine
{
  return 3.0;
}

+ (double)dayNumberLayerYOffsetCompressed:(BOOL)a3 containsFirstDayOfMonth:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %i %i"), dayNumberLayerYOffsetKey, a3, a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cachedCalculatedValues"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
  if (!v9)
  {
    v10 = 0.0;
    if (v4)
    {
      +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance](CompactMonthViewController, "topOfMonthNameLabelToGrayLineDistance");
      v10 = v11 + 0.0;
    }
    objc_msgSend(a1, "grayLineHeight");
    v13 = v10 + v12;
    +[CompactMonthWeekTodayCircle topOffset](CompactMonthWeekTodayCircle, "topOffset");
    v15 = 1.0;
    if (v5)
      v15 = 2.0;
    v16 = v13 + v14 / v15;
    objc_msgSend(a1, "heightOfCircleCompressed:", v5);
    v18 = v16 + v17 * 0.5;
    *(_QWORD *)&v19 = objc_opt_class(a1).n128_u64[0];
    objc_msgSend(v20, "dayNumberFontSize:", v5, v19);
    v21 = +[CompactMonthWeekDayNumber heightOfFrameForFontSize:](CompactMonthWeekDayNumber, "heightOfFrameForFontSize:");
    v23 = v18 - v22 * 0.5;
    v25 = CUIKGetOverlayCalendar(v21, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

    if (v26)
    {
      +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 6.0, 6.0);
      v23 = v23 - v27;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);
  }
  objc_msgSend(v9, "doubleValue");
  v29 = v28;

  return v29;
}

+ (double)verticalEventPadding:(BOOL)a3
{
  double result;

  result = 7.0;
  if (a3)
    return 3.5;
  return result;
}

+ (double)circleYOffsetCompressed:(BOOL)a3 containsFirstDayOfMonth:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %i %i"), circleYOffsetKey, a3, a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cachedCalculatedValues"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));
  if (!v9)
  {
    v10 = 0.0;
    if (v4)
    {
      +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance](CompactMonthViewController, "topOfMonthNameLabelToGrayLineDistance");
      v10 = v11 + 0.0;
    }
    objc_msgSend(a1, "grayLineHeight");
    v13 = v10 + v12;
    +[CompactMonthWeekTodayCircle topOffset](CompactMonthWeekTodayCircle, "topOffset");
    v15 = 1.0;
    if (v5)
      v15 = 2.0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13 + v14 / v15));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);
  }
  objc_msgSend(v9, "doubleValue");
  v17 = v16;

  return v17;
}

+ (double)heightOfCircleCompressed:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double result;

  v3 = a3;
  *(_QWORD *)&v5 = objc_opt_class(a1).n128_u64[0];
  v7 = objc_msgSend(v6, "usesRoundedRectInsteadOfCircle", v5);
  v8 = (int)v7;
  v10 = CUIKGetOverlayCalendar(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v8)
  {
    v13 = CFSTR("abc");
    if (!v11)
      v13 = 0;
    v14 = v13;

    *(_QWORD *)&v15 = objc_opt_class(a1).n128_u64[0];
    objc_msgSend(v16, "dayNumberFontSize:", v3, v15);
    v18 = v17;
    *(_QWORD *)&v19 = objc_opt_class(a1).n128_u64[0];
    objc_msgSend(v20, "dayNumberOverlayFontSize:", v3, v19);
    +[CompactMonthWeekTodayCircle roundedRectSizeForNumberString:overlayString:fontSize:overlayFontSize:](CompactMonthWeekTodayCircle, "roundedRectSizeForNumberString:overlayString:fontSize:overlayFontSize:", CFSTR("99"), v14, v18, v21);
    v23 = v22;

    return v23;
  }
  else
  {

    if (v12)
    {
      +[CompactMonthWeekTodayCircle circleDiameterWithOverlayLarge](CompactMonthWeekTodayCircle, "circleDiameterWithOverlayLarge");
    }
    else if (v3)
    {
      +[CompactMonthWeekTodayCircle circleDiameterCompressed](CompactMonthWeekTodayCircle, "circleDiameterCompressed");
    }
    else
    {
      +[CompactMonthWeekTodayCircle circleDiameter](CompactMonthWeekTodayCircle, "circleDiameter");
    }
  }
  return result;
}

+ (double)distanceToBottomOfCircleCompressed:(BOOL)a3 containsFirstDay:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a1, "circleYOffsetCompressed:containsFirstDayOfMonth:", a3, a4);
  v7 = v6;
  objc_msgSend(a1, "heightOfCircleCompressed:", v4);
  return v7 + v8;
}

+ (double)heightForViewThatContainsFirstDayOfMonth:(BOOL)a3 compressed:(BOOL)a4 scale:(double)a5
{
  _BOOL8 v6;
  _BOOL4 v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "grayLineHeight");
  v10 = v9;
  if (v6)
    v11 = 50.0;
  else
    v11 = 68.0;
  objc_msgSend(a1, "distanceToBottomOfCircleCompressed:containsFirstDay:", v6, 0);
  v13 = v12 + 6.0;
  objc_msgSend(a1, "verticalEventPadding:", v6);
  v15 = v13 + v14 * 2.0;
  if (v11 >= v15)
    v15 = v11;
  v16 = (v10 + v15) * a5;
  if (v7)
  {
    +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance](CompactMonthViewController, "topOfMonthNameLabelToGrayLineDistance");
    return v16 + v17;
  }
  return v16;
}

+ (double)narrowScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cachedCalculatedValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", narrowScaleKey));
  if (!v4)
  {
    objc_msgSend(a1, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, 0, 1.0);
    v6 = v5;
    objc_msgSend(a1, "distanceToBottomOfCircleCompressed:containsFirstDay:", 0, 0);
    v8 = v7;
    +[MonthWeekOccurrencesView minNarrowOccurrenceHeight](MonthWeekOccurrencesView, "minNarrowOccurrenceHeight");
    v10 = v8 + v9;
    objc_msgSend(a1, "verticalEventPadding:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v10 + v11 * 2.0) / v6));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, narrowScaleKey);
  }
  objc_msgSend(v4, "doubleValue");
  v13 = v12;

  return v13;
}

+ (double)eventScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cachedCalculatedValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", eventScaleKey));
  if (!v4)
  {
    objc_msgSend(a1, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, 0, 1.0);
    v6 = v5;
    objc_msgSend(a1, "distanceToBottomOfCircleCompressed:containsFirstDay:", 0, 0);
    v8 = v7;
    +[MonthWeekOccurrencesView maxNarrowOccurrenceHeight](MonthWeekOccurrencesView, "maxNarrowOccurrenceHeight");
    v10 = v8 + v9;
    objc_msgSend(a1, "verticalEventPadding:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v10 + v11 * 2.0) / v6));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, eventScaleKey);
  }
  objc_msgSend(v4, "doubleValue");
  v13 = v12;

  return v13;
}

+ (CGPoint)_roundedRectOriginForDayLayerFrame:(CGRect)a3 roundedRectSize:(CGSize)a4 withOverlay:(BOOL)a5 compressed:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double width;
  CGFloat height;
  CGFloat v10;
  CGFloat y;
  CGFloat x;
  CGFloat MidX;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double MinY;
  double v23;
  double v24;
  id v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  CGPoint result;
  CGRect v31;

  v6 = a6;
  v7 = a5;
  width = a4.width;
  height = a3.size.height;
  v10 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v17 = CalRoundToScreenScale(v15, v16, MidX + width * -0.5);
  objc_msgSend(a1, "dayNumberFontSize:", v6);
  v19 = v18;
  objc_msgSend(a1, "dayNumberOverlayFontSize:", v6);
  v21 = v20;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = v10;
  v31.size.height = height;
  MinY = CGRectGetMinY(v31);
  +[CompactMonthWeekDayNumber baselineOffsetFromTopOfLayerForFontSize:](CompactMonthWeekDayNumber, "baselineOffsetFromTopOfLayerForFontSize:", v19);
  v24 = MinY + v23;
  v25 = +[CompactMonthWeekTodayCircle roundedRectDayNumberBaselineOffsetWithOverlay:fontSize:overlayFontSize:](CompactMonthWeekTodayCircle, "roundedRectDayNumberBaselineOffsetWithOverlay:fontSize:overlayFontSize:", v7, v19, v21);
  v28 = CalRoundToScreenScale(v25, v27, v24 - v26);
  v29 = v17;
  result.y = v28;
  result.x = v29;
  return result;
}

+ (CGPoint)positionOfCircleInCellWithWidth:(double)a3 circleSize:(CGSize)a4 compressed:(BOOL)a5 containsFirstDayOfMonth:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v6 = a6;
  v7 = a5;
  v9 = CalRoundToScreenScale(a1, a2, a3 * 0.5 - a4.width * 0.5);
  objc_msgSend(a1, "circleYOffsetCompressed:containsFirstDayOfMonth:", v7, v6);
  v11 = v10;
  v12 = v9;
  result.y = v11;
  result.x = v12;
  return result;
}

+ (CGRect)frameForDayCircleWithSize:(CGSize)a3 dayNumberLayerFrame:(CGRect)a4 dayNumberFrame:(CGRect)a5 withOverlay:(BOOL)a6 compressed:(BOOL)a7 containsFirstDayOfMonth:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  double height;
  double width;
  double y;
  double x;
  double v15;
  double v16;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3.height;
  v16 = a3.width;
  *(_QWORD *)&v18 = objc_opt_class(a1).n128_u64[0];
  if (objc_msgSend(v19, "usesRoundedRectInsteadOfCircle", v18))
  {
    objc_msgSend(a1, "_roundedRectOriginForDayLayerFrame:roundedRectSize:withOverlay:compressed:", v10, v9, x, y, width, height, v16, v15);
  }
  else
  {
    objc_msgSend(a1, "positionOfCircleInCellWithWidth:circleSize:compressed:containsFirstDayOfMonth:", v9, v8, CGRectGetWidth(a5), v16, v15);
    v20 = a5.origin.x + v22;
  }
  v23 = v16;
  v24 = v15;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (CGRect)_circleFrameWithDayFrame:(CGRect)a3 numberString:(id)a4 overlayString:(id)a5 compressed:(BOOL)a6 containsFirstDay:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  double width;
  double x;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v7 = a7;
  v8 = a6;
  width = a3.size.width;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v15 = +[CompactMonthWeekTodayCircle circleDiameter](CompactMonthWeekTodayCircle, "circleDiameter");
  if (v14)
  {
    if ((unint64_t)objc_msgSend(v13, "length") <= 1 && (unint64_t)objc_msgSend(v14, "length") < 3)
      v15 = +[CompactMonthWeekTodayCircle circleDiameterWithOverlay](CompactMonthWeekTodayCircle, "circleDiameterWithOverlay");
    else
      v15 = +[CompactMonthWeekTodayCircle circleDiameterWithOverlayLarge](CompactMonthWeekTodayCircle, "circleDiameterWithOverlayLarge");
    goto LABEL_8;
  }
  v19 = v17;
  if (v8)
  {
    v15 = +[CompactMonthWeekTodayCircle circleDiameterCompressed](CompactMonthWeekTodayCircle, "circleDiameterCompressed");
LABEL_8:
    v19 = v18;
  }
  v20 = CalRoundToScreenScale(v15, v16, x + (width - v19) * 0.5);
  objc_msgSend(a1, "circleYOffsetCompressed:containsFirstDayOfMonth:", v8, v7);
  v22 = v21;

  v23 = v20;
  v24 = v22;
  v25 = v19;
  v26 = v19;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

+ (CGRect)_roundedRectFrameWithDayFrame:(CGRect)a3 dayLayerFrame:(CGRect)a4 numberString:(id)a5 overlayString:(id)a6 compressed:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  v7 = a7;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a6;
  v15 = a5;
  *(_QWORD *)&v16 = objc_opt_class(a1).n128_u64[0];
  objc_msgSend(v17, "dayNumberFontSize:", v7, v16);
  v19 = v18;
  *(_QWORD *)&v20 = objc_opt_class(a1).n128_u64[0];
  objc_msgSend(v21, "dayNumberOverlayFontSize:", v7, v20);
  +[CompactMonthWeekTodayCircle roundedRectSizeForNumberString:overlayString:fontSize:overlayFontSize:](CompactMonthWeekTodayCircle, "roundedRectSizeForNumberString:overlayString:fontSize:overlayFontSize:", v15, v14, v19, v22);
  v24 = v23;
  v26 = v25;

  objc_msgSend(a1, "_roundedRectOriginForDayLayerFrame:roundedRectSize:withOverlay:compressed:", v14 != 0, v7, x, y, width, height, v24, v26);
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

+ (CGRect)frameForCircleWithDayFrame:(CGRect)a3 dayLayerFrame:(CGRect)a4 numberString:(id)a5 overlayString:(id)a6 compressed:(BOOL)a7 containsFirstDay:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  double height;
  double width;
  double y;
  double x;
  double v15;
  double v16;
  double v17;
  double v18;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  v8 = a8;
  v9 = a7;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3.size.height;
  v16 = a3.size.width;
  v17 = a3.origin.y;
  v18 = a3.origin.x;
  v20 = a6;
  v21 = a5;
  if (objc_msgSend(a1, "usesRoundedRectInsteadOfCircle"))
    objc_msgSend(a1, "_roundedRectFrameWithDayFrame:dayLayerFrame:numberString:overlayString:compressed:", v21, v20, v9, v18, v17, v16, v15, x, y, width, height);
  else
    objc_msgSend(a1, "_circleFrameWithDayFrame:numberString:overlayString:compressed:containsFirstDay:", v21, v20, v9, v8, v18, v17, v16, v15);
  v26 = v22;
  v27 = v23;
  v28 = v24;
  v29 = v25;

  v30 = v26;
  v31 = v27;
  v32 = v28;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

+ (double)heightForViewWithCalendarDate:(id)a3 compressed:(BOOL)a4 windowSize:(CGSize)a5 scale:(double)a6
{
  _BOOL8 v7;
  id v9;
  double v10;
  id v11;
  id v12;
  id v13;
  double result;

  v7 = a4;
  v9 = a3;
  *(_QWORD *)&v10 = objc_opt_class(a1).n128_u64[0];
  v12 = objc_msgSend(v11, "_viewForCalendarDateContainsFirstDayOfMonth:", v9, v10);

  objc_opt_class(a1);
  objc_msgSend(v13, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", v12, v7, a6);
  return result;
}

+ (double)circleDiameter
{
  double result;

  +[CompactMonthWeekTodayCircle circleDiameter](CompactMonthWeekTodayCircle, "circleDiameter");
  return result;
}

+ (double)circleDiameterCompressed
{
  double result;

  +[CompactMonthWeekTodayCircle circleDiameterCompressed](CompactMonthWeekTodayCircle, "circleDiameterCompressed");
  return result;
}

+ (double)circleDiameterWithOverlay
{
  double result;

  +[CompactMonthWeekTodayCircle circleDiameterWithOverlay](CompactMonthWeekTodayCircle, "circleDiameterWithOverlay");
  return result;
}

+ (double)circleDiameterWithOverlayLarge
{
  double result;

  +[CompactMonthWeekTodayCircle circleDiameterWithOverlayLarge](CompactMonthWeekTodayCircle, "circleDiameterWithOverlayLarge");
  return result;
}

+ (double)headerHeight
{
  double result;

  +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance](CompactMonthViewController, "topOfMonthNameLabelToGrayLineDistance");
  return result;
}

+ (double)dayTypeBadgeDiameter:(BOOL)a3
{
  double result;

  result = 14.0;
  if (a3)
    return 12.0;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  void *v6;
  void *v7;
  _BOOL8 containsFirstDayOfMonth;
  _BOOL8 v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
  v7 = v6;
  containsFirstDayOfMonth = self->_containsFirstDayOfMonth;
  v9 = -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v5);
  -[CompactMonthWeekView monthWeekScale](self, "monthWeekScale");
  objc_msgSend(v7, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", containsFirstDayOfMonth, v9);
  v11 = v10;
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CompactMonthWeekView frame](self, "frame");
  if (vabdd_f64(width, v8) >= 2.22044605e-16)
    self->_needToForceLayout = 1;
  v9.receiver = self;
  v9.super_class = (Class)CompactMonthWeekView;
  -[CompactMonthWeekView setFrame:](&v9, "setFrame:", x, y, width, height);
}

- (void)layoutIfNeeded
{
  objc_super v2;

  if (self->_needToForceLayout)
  {
    -[CompactMonthWeekView layoutSubviews](self, "layoutSubviews");
  }
  else
  {
    v2.receiver = self;
    v2.super_class = (Class)CompactMonthWeekView;
    -[CompactMonthWeekView layoutIfNeeded](&v2, "layoutIfNeeded");
  }
}

- (double)usableSpaceForOccurrencesWithHeight:(double)a3
{
  double v5;
  id v6;
  double v7;
  double v8;
  double v9;

  *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v6, "distanceToBottomOfCircleCompressed:containsFirstDay:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v5), -[CompactMonthWeekView containsFirstDayOfMonth](self, "containsFirstDayOfMonth"));
  v8 = a3 - v7;
  +[CompactMonthWeekView verticalEventPadding:](CompactMonthWeekView, "verticalEventPadding:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode"));
  return v8 + v9 * -2.0;
}

- (BOOL)hideDaySummariesWithScale:(double)a3
{
  double v4;

  +[CompactMonthWeekView narrowScale](CompactMonthWeekView, "narrowScale");
  return v4 <= a3;
}

+ (unint64_t)eventRowsForScale:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t result;
  double v13;

  objc_msgSend(a1, "eventScale");
  v6 = v5;
  objc_msgSend(a1, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, 0, 1.0);
  v8 = v7;
  +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
  v10 = v9;
  +[MonthViewOccurrence verticalSpaceBetweenOccurrences](MonthViewOccurrence, "verticalSpaceBetweenOccurrences");
  result = 2;
  v13 = (v10 + v11) / v8;
  do
  {
    v6 = v13 + v6;
    ++result;
  }
  while (v6 < a3);
  return result;
}

+ (double)eventScaleForNumberOfRows:(unint64_t)a3
{
  double result;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(a1, "eventScale");
  v6 = result;
  if (a3 >= 4)
  {
    objc_msgSend(a1, "heightForViewThatContainsFirstDayOfMonth:compressed:scale:", 0, 0, 1.0);
    v8 = v7;
    +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
    v10 = v9;
    +[MonthViewOccurrence verticalSpaceBetweenOccurrences](MonthViewOccurrence, "verticalSpaceBetweenOccurrences");
    return v6 + (double)(a3 - 3) * ((v10 + v11) / v8);
  }
  return result;
}

- (unint64_t)nearestSnapBoundaryForScale:(double)a3
{
  id v6;

  if (!-[CompactMonthWeekView hideDaySummariesWithScale:](self, "hideDaySummariesWithScale:"))
    return 1;
  if (-[CompactMonthWeekView isNarrowWithScale:](self, "isNarrowWithScale:", a3))
    return 2;
  objc_opt_class(self);
  return (unint64_t)_objc_msgSend(v6, "eventRowsForScale:", a3);
}

- (void)layoutSubviews
{
  double v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSArray *days;
  id v13;
  uint64_t v14;
  double height;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double MinX;
  CGFloat Width;
  uint64_t v27;
  uint64_t v28;
  double x;
  double v30;
  double v31;
  double v32;
  double v33;
  double MaxX;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t IsLeftToRight;
  uint64_t v42;
  int v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  id v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  id v64;
  double v65;
  double v66;
  double v67;
  id v68;
  double v69;
  double v70;
  id v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  CGFloat v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  CGFloat v85;
  uint64_t v86;
  uint64_t v87;
  CGFloat v88;
  uint64_t v89;
  uint64_t v90;
  double v91;
  double v92;
  double v93;
  double v94;
  uint64_t v95;
  uint64_t *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD v102[13];
  uint64_t v103;
  _QWORD v104[3];
  uint64_t v105;
  _QWORD v106[3];
  _QWORD v107[4];
  uint64_t v108;
  double *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double *v113;
  uint64_t v114;
  uint64_t v115;
  objc_super v116;
  _BYTE v117[16];
  uint64_t v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;

  v116.receiver = self;
  v116.super_class = (Class)CompactMonthWeekView;
  -[CompactMonthWeekView layoutSubviews](&v116, "layoutSubviews");
  self->_needToForceLayout = 0;
  -[CompactMonthWeekView _updateDayFrames](self, "_updateDayFrames");
  +[CATransaction begin](CATransaction, "begin");
  if (!-[CompactMonthWeekView enableLayerAnimationsDuringLayout](self, "enableLayerAnimationsDuringLayout"))
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v112 = 0;
  v113 = (double *)&v112;
  v114 = 0x2020000000;
  v115 = 0;
  v108 = 0;
  v109 = (double *)&v108;
  v110 = 0x2020000000;
  v111 = 0x47EFFFFFE0000000;
  v107[0] = 0;
  v107[1] = v107;
  v107[2] = 0x2020000000;
  v107[3] = 0;
  v105 = 0;
  v106[0] = &v105;
  v106[1] = 0x2020000000;
  v106[2] = -1;
  v103 = 0;
  v104[0] = &v103;
  v104[1] = 0x2020000000;
  v104[2] = -1;
  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v4, "dayNumberLayerYOffsetCompressed:containsFirstDayOfMonth:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v3), self->_containsFirstDayOfMonth);
  v6 = v5;
  if (self->_containsFirstDayOfMonth)
  {
    +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance](CompactMonthViewController, "topOfMonthNameLabelToGrayLineDistance");
    v8 = v7 + 0.0;
  }
  else
  {
    v8 = 0.0;
  }
  -[CompactMonthWeekView monthWeekScale](self, "monthWeekScale");
  self->_hideDaySummaries = -[CompactMonthWeekView hideDaySummariesWithScale:](self, "hideDaySummariesWithScale:");
  -[CompactMonthWeekView frame](self, "frame");
  -[CompactMonthWeekView usableSpaceForOccurrencesWithHeight:](self, "usableSpaceForOccurrencesWithHeight:", v9);
  v11 = v10;
  days = self->_days;
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_1000AF5BC;
  v102[3] = &unk_1001B4710;
  v102[4] = self;
  v102[5] = &v105;
  v102[6] = &v103;
  v102[7] = &v108;
  v102[8] = v107;
  v102[9] = &v112;
  v102[10] = v6;
  *(double *)&v102[11] = v8;
  *(double *)&v102[12] = v10;
  -[NSArray enumerateObjectsUsingBlock:](days, "enumerateObjectsUsingBlock:", v102);
  v13 = +[CATransaction commit](CATransaction, "commit");
  if (self->_containsFirstDayOfMonth)
  {
    height = self->_monthNameLabelFittingSize.height;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_days, "objectAtIndexedSubscript:", *(_QWORD *)(v106[0] + 24)));
    objc_msgSend(v16, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v119.origin.x = v18;
    v119.origin.y = v20;
    v119.size.width = v22;
    v119.size.height = v24;
    MinX = CGRectGetMinX(v119);
    v120.origin.x = v18;
    v120.origin.y = v20;
    v120.size.width = v22;
    v120.size.height = v24;
    Width = CGRectGetWidth(v120);
    v121.origin.x = CalRoundToScreenScale(v27, v28, MinX + (Width - self->_monthNameLabelFittingSize.width) * 0.5);
    x = v121.origin.x;
    v30 = self->_monthNameLabelFittingSize.width;
    v121.origin.y = 0.0;
    v121.size.width = v30;
    v121.size.height = height;
    v31 = CGRectGetMinX(v121);
    -[CompactMonthWeekView layoutMargins](self, "layoutMargins");
    if (v31 >= v32)
    {
      v122.origin.y = 0.0;
      v122.origin.x = x;
      v122.size.width = v30;
      v122.size.height = height;
      MaxX = CGRectGetMaxX(v122);
      -[CompactMonthWeekView bounds](self, "bounds");
      v35 = CGRectGetMaxX(v123);
      -[CompactMonthWeekView layoutMargins](self, "layoutMargins");
      if (MaxX > v35 - v36)
      {
        -[CompactMonthWeekView bounds](self, "bounds");
        v37 = CGRectGetMaxX(v124);
        -[CompactMonthWeekView layoutMargins](self, "layoutMargins");
        v39 = v38;
        v125.origin.y = 0.0;
        v125.origin.x = x;
        v125.size.width = v30;
        v125.size.height = height;
        x = v37 - v39 - CGRectGetWidth(v125);
      }
    }
    else
    {
      -[CompactMonthWeekView layoutMargins](self, "layoutMargins");
      x = v33;
    }
    v13 = -[UILabel setFrame:](self->_monthNameLabel, "setFrame:", x, 0.0, v30, height);
  }
  v40 = v109[3];
  IsLeftToRight = CalTimeDirectionIsLeftToRight(v13, v14);
  v43 = IsLeftToRight;
  if ((_DWORD)IsLeftToRight)
    v44 = &v105;
  else
    v44 = &v103;
  v45 = *(_QWORD *)(v44[1] + 24);
  v46 = CalTimeDirectionIsLeftToRight(IsLeftToRight, v42);
  if (v43)
    v48 = 0;
  else
    v48 = 6;
  v49 = v106;
  if ((_DWORD)v46)
    v49 = v104;
  v50 = *v49;
  if ((_DWORD)v46)
    v51 = 6;
  else
    v51 = 0;
  v52 = *(_QWORD *)(v50 + 24);
  if (v45 == v48)
  {
    if (self->_showWeekNumber && CalTimeDirectionIsLeftToRight(v46, v47))
    {
      -[CompactMonthWeekView safeAreaInsets](self, "safeAreaInsets");
      v54 = v53;
      *(_QWORD *)&v55 = objc_opt_class(self).n128_u64[0];
      objc_msgSend(v56, "twoDigitWeekNumberWidth", v55);
      v58 = v54 + 6.0 + v57;
      v113[3] = v113[3] - (v58 - v40);
      v40 = v58;
    }
    else
    {
      v113[3] = v109[3] + v113[3];
      v40 = 0.0;
    }
  }
  if (v52 == v51)
  {
    -[CompactMonthWeekView bounds](self, "bounds");
    v113[3] = CGRectGetMaxX(v126) - v40;
    if (self->_showWeekNumber && (CalTimeDirectionIsLeftToRight(v59, v60) & 1) == 0)
    {
      -[CompactMonthWeekView safeAreaInsets](self, "safeAreaInsets");
      v62 = v61;
      *(_QWORD *)&v63 = objc_opt_class(self).n128_u64[0];
      objc_msgSend(v64, "twoDigitWeekNumberWidth", v63);
      v113[3] = v113[3] - (v62 + 6.0 + v65);
    }
  }
  v66 = v113[3];
  *(_QWORD *)&v67 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v68, "grayLineHeight", v67);
  -[UIView setFrame:](self->_grayLine, "setFrame:", CalRoundRectToScreenScale(v40, v8, v66, v69));
  -[CompactMonthWeekView frame](self, "frame");
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v40, v8, v113[3], v70 - v8);
  if (self->_showWeekNumber)
  {
    -[UILabel sizeToFit](self->_weekNumberLabel, "sizeToFit");
    v71 = -[UILabel frame](self->_weekNumberLabel, "frame");
    v73 = v72;
    v75 = v74;
    v77 = v76;
    v79 = v78;
    if (CalTimeDirectionIsLeftToRight(v71, v80))
    {
      v127.origin.x = v73;
      v127.origin.y = v75;
      v127.size.width = v77;
      v127.size.height = v79;
      v81 = CGRectGetWidth(v127);
      v84 = fmax(CalRoundToScreenScale(v82, v83, v40 - v81 + -3.0), 0.0);
    }
    else
    {
      -[UIView frame](self->_grayLine, "frame");
      v85 = CGRectGetMaxX(v128);
      v84 = CalRoundToScreenScale(v86, v87, v85 + 3.0);
    }
    v129.origin.x = v84;
    v129.origin.y = v75;
    v129.size.width = v77;
    v129.size.height = v79;
    v88 = CGRectGetHeight(v129);
    -[UILabel setFrame:](self->_weekNumberLabel, "setFrame:", v84, v8 - CalRoundToScreenScale(v89, v90, v88 * 0.5), v77, v79);
  }
  -[CompactMonthWeekView frame](self, "frame");
  v92 = v91;
  +[CompactMonthWeekView verticalEventPadding:](CompactMonthWeekView, "verticalEventPadding:", 0);
  v94 = v93;
  -[CompactMonthWeekView frame](self, "frame");
  -[MonthWeekOccurrencesView setFrame:](self->_occurrencesView, "setFrame:", 0.0, v92 - v11 - v94);
  v95 = 0;
  v96 = &v118;
  do
  {
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_days, "objectAtIndexedSubscript:", v95));
    objc_msgSend(v97, "frame");
    -[CompactMonthWeekView convertRect:toView:](self, "convertRect:toView:", self->_occurrencesView);
    *(v96 - 2) = v98;
    *(v96 - 1) = v99;
    *v96 = v100;
    v96[1] = v101;

    ++v95;
    v96 += 4;
  }
  while (v95 != 7);
  -[MonthWeekOccurrencesView setDayFrames:](self->_occurrencesView, "setDayFrames:", v117);
  if (!self->_animating)
    -[MonthWeekOccurrencesView setHidden:](self->_occurrencesView, "setHidden:", !self->_hideDaySummaries);
  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(v107, 8);
  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v112, 8);
}

- (BOOL)isNarrowWithScale:(double)a3
{
  double v4;
  double v6;

  +[CompactMonthWeekView narrowScale](CompactMonthWeekView, "narrowScale");
  if (v4 > a3)
    return 0;
  +[CompactMonthWeekView eventScale](CompactMonthWeekView, "eventScale");
  return v6 > a3;
}

- (void)animateToScale:(double)a3 fromScale:(double)a4 completionBlock:(id)a5
{
  void (**v8)(_QWORD);
  unsigned int v9;
  char v10;
  unint64_t v11;
  NSMutableDictionary *animationInfos;
  NSMutableDictionary *v13;
  NSArray *days;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  NSMutableArray *v18;
  NSMutableArray *fadingInfos;
  void *v20;
  _QWORD *v21;
  NSDictionary *v22;
  NSDictionary *firstOccurrenceDict;
  NSDictionary *v24;
  _QWORD *v25;
  NSArray *v26;
  NSArray *secondOccurrences;
  CompactMonthWeekView *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  AnimationInfo *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _QWORD *v45;
  double v46;
  dispatch_time_t v47;
  NSMutableDictionary *v48;
  char v49;
  char v50;
  unint64_t v51;
  NSArray *obj;
  unsigned int v53;
  _QWORD block[5];
  void (**v55)(_QWORD);
  unint64_t v56;
  _QWORD v57[6];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  char v62;
  _QWORD v63[5];
  char v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  NSMutableDictionary *v70;
  CompactMonthWeekView *v71;
  id v72;
  char v73;
  char v74;
  _QWORD v75[5];
  _QWORD v76[5];
  NSMutableDictionary *v77;
  _BYTE v78[128];

  v8 = (void (**)(_QWORD))a5;
  v53 = -[CompactMonthWeekView hideDaySummariesWithScale:](self, "hideDaySummariesWithScale:", a4);
  v9 = -[CompactMonthWeekView hideDaySummariesWithScale:](self, "hideDaySummariesWithScale:", a3);
  v10 = v9 ^ 1;
  if (((v53 ^ 1) & 1) != 0 || ((v9 ^ 1) & 1) != 0)
  {
    v11 = self->_animationCounter + 1;
    self->_animationCounter = v11;
    -[CompactMonthWeekView setEnableLayerAnimationsDuringLayout:](self, "setEnableLayerAnimationsDuringLayout:", 1);
    -[CompactMonthWeekView layoutSubviews](self, "layoutSubviews");
    -[MonthWeekOccurrencesView layoutSubviews](self->_occurrencesView, "layoutSubviews");
    if (self->_animating)
    {
      if (v53 != v9)
      {
        animationInfos = self->_animationInfos;
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_1000B05F8;
        v63[3] = &unk_1001B47B0;
        v64 = v9 ^ 1;
        v63[4] = self;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](animationInfos, "enumerateKeysAndObjectsUsingBlock:", v63);
      }
    }
    else
    {
      v50 = v9;
      v51 = v11;
      v13 = objc_opt_new(NSMutableDictionary);
      days = self->_days;
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_1000B00D4;
      v76[3] = &unk_1001B4738;
      v76[4] = self;
      v15 = v13;
      v77 = v15;
      -[NSArray enumerateObjectsUsingBlock:](days, "enumerateObjectsUsingBlock:", v76);
      v16 = objc_opt_new(NSMutableDictionary);
      v17 = self->_animationInfos;
      self->_animationInfos = v16;

      v18 = objc_opt_new(NSMutableArray);
      fadingInfos = self->_fadingInfos;
      self->_fadingInfos = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView occurrenceContainer](self->_occurrencesView, "occurrenceContainer"));
      objc_msgSend(v20, "setHidden:", 1);

      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_1000B0260;
      v75[3] = &unk_1001B4760;
      v75[4] = self;
      v21 = objc_retainBlock(v75);
      v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView firstOccurrencesForEachDay](self->_occurrencesView, "firstOccurrencesForEachDay"));
      firstOccurrenceDict = self->_firstOccurrenceDict;
      self->_firstOccurrenceDict = v22;

      v24 = self->_firstOccurrenceDict;
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_1000B0358;
      v69[3] = &unk_1001B4788;
      v48 = v15;
      v70 = v48;
      v49 = v9 ^ 1;
      v73 = v9 ^ 1;
      v25 = v21;
      v71 = self;
      v72 = v25;
      v74 = v53 ^ 1;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v24, "enumerateKeysAndObjectsUsingBlock:", v69);
      v26 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView secondAndThirdOccurrencesForEachDay](self->_occurrencesView, "secondAndThirdOccurrencesForEachDay"));
      secondOccurrences = self->_secondOccurrences;
      self->_secondOccurrences = v26;

      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v28 = self;
      obj = self->_secondOccurrences;
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(_QWORD *)v66 != v31)
              objc_enumerationMutation(obj);
            v33 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
            v34 = ((uint64_t (*)(_QWORD *, uint64_t))v25[2])(v25, v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
            v36 = objc_opt_new(AnimationInfo);
            -[AnimationInfo setView:](v36, "setView:", v35, v48);
            -[AnimationInfo setOccurrenceView:](v36, "setOccurrenceView:", v33);
            if ((v53 & 1) == 0)
            {
              objc_msgSend(v35, "frame");
              v38 = v37;
              objc_msgSend(v35, "frame");
              v40 = v38 + v39 * 0.5;
              objc_msgSend(v35, "frame");
              v42 = v41;
              objc_msgSend(v35, "frame");
              objc_msgSend(v35, "setFrame:", v40, v42 + v43 * -2.0, 0.5, 0.5);
              objc_msgSend(v35, "setAlpha:", 0.0);
            }
            -[NSMutableArray addObject:](v28->_fadingInfos, "addObject:", v36);

          }
          v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
        }
        while (v30);
      }

      v11 = v51;
      self = v28;
      v10 = v49;
      LOBYTE(v9) = v50;
    }
    self->_animating = 1;
    -[MonthWeekOccurrencesView setAnimating:](self->_occurrencesView, "setAnimating:", 1, v48);
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1000B0750;
    v61[3] = &unk_1001B2510;
    v61[4] = self;
    v62 = v10;
    +[UIView animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:](UIView, "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 131078, v61, 0, 0.25, 0.0, 0.0, 0.0);
    if ((v9 & 1) != 0)
    {
      if (!self->_startedStage2Animation)
      {
        self->_startedStage2Animation = 1;
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_1000B0CE8;
        v58[3] = &unk_1001B2538;
        v58[4] = self;
        +[UIView animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:](UIView, "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 196612, v58, 0, 0.25, 0.0, 0.0, 0.0);
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_1000B0E48;
        v57[3] = &unk_1001B2838;
        v57[4] = self;
        v57[5] = v11;
        v46 = 0.150000006;
        v44 = 0.25;
        v45 = v57;
        goto LABEL_23;
      }
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_1000B0B84;
      v59[3] = &unk_1001B2538;
      v59[4] = self;
      v44 = 0.25;
      v45 = v59;
    }
    else
    {
      self->_startedStage2Animation = 0;
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_1000B0A10;
      v60[3] = &unk_1001B2538;
      v60[4] = self;
      v44 = 0.25;
      v45 = v60;
    }
    v46 = 0.0;
LABEL_23:
    +[UIView animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:](UIView, "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 131078, v45, 0, v44, 0.0, 0.0, v46);
    v47 = dispatch_time(0, 450000005);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B0F94;
    block[3] = &unk_1001B4828;
    v56 = v11;
    block[4] = self;
    v55 = v8;
    dispatch_after(v47, (dispatch_queue_t)&_dispatch_main_q, block);

    goto LABEL_24;
  }
  if (v8)
    v8[2](v8);
LABEL_24:

}

- (void)finishAnimations
{
  void *v3;
  unsigned int v4;
  double v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableDictionary *animationInfos;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  self->_animating = 0;
  -[MonthWeekOccurrencesView setAnimating:](self->_occurrencesView, "setAnimating:", 0);
  -[CompactMonthWeekView setEnableLayerAnimationsDuringLayout:](self, "setEnableLayerAnimationsDuringLayout:", 0);
  self->_startedStage2Animation = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView occurrenceContainer](self->_occurrencesView, "occurrenceContainer"));
  objc_msgSend(v3, "setHidden:", 0);

  -[CompactMonthWeekView monthWeekScale](self, "monthWeekScale");
  v4 = -[CompactMonthWeekView hideDaySummariesWithScale:](self, "hideDaySummariesWithScale:");
  v5 = 0.0;
  if (v4)
    v5 = 1.0;
  -[MonthWeekOccurrencesView setAlpha:](self->_occurrencesView, "setAlpha:", v5);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_fadingInfos;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "view", (_QWORD)v13));
        objc_msgSend(v11, "removeFromSuperview");

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[NSMutableArray removeAllObjects](self->_fadingInfos, "removeAllObjects");
  -[MonthWeekOccurrencesView layoutSubviews](self->_occurrencesView, "layoutSubviews");
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_animationInfos, "enumerateKeysAndObjectsUsingBlock:", &stru_1001B4868);
  animationInfos = self->_animationInfos;
  self->_animationInfos = 0;

  -[CompactMonthWeekView layoutSubviews](self, "layoutSubviews");
}

- (void)safeAreaInsetsDidChange
{
  self->_needToForceLayout = 1;
}

- (id)calendarDate
{
  return self->_startCalendarDate;
}

- (id)endCalendarDate
{
  return self->_endCalendarDate;
}

- (double)topInset
{
  return 0.0;
}

- (void)pulseTodayCircle
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  EKUITodayCirclePulseView *v9;
  EKUITodayCirclePulseView *todayPulse;
  void *v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  uint64_t v18;
  double v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  id v27;
  void *v28;
  EKUITodayCirclePulseView *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  CompactMonthWeekView *v33;

  if (self->_today && !-[CompactMonthWeekView disableTodayPulse](self, "disableTodayPulse"))
  {
    if (self->_todayPulse)
      -[CompactMonthWeekView haltTodayPulse](self, "haltTodayPulse");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](self->_today, "attachedTodayCircle"));
    objc_msgSend(v3, "frame");
    v5 = v4;
    v9 = (EKUITodayCirclePulseView *)objc_msgSend(objc_alloc((Class)EKUITodayCirclePulseView), "initWithFrame:", v6, v7, v8, v4);
    todayPulse = self->_todayPulse;
    self->_todayPulse = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dayNumberString"));
    -[EKUITodayCirclePulseView setString:](self->_todayPulse, "setString:", v11);

    *(_QWORD *)&v12 = objc_opt_class(self).n128_u64[0];
    objc_msgSend(v13, "dayNumberFontSize:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CompactMonthWeekTodayCircle dayNumberFontForSize:](CompactMonthWeekTodayCircle, "dayNumberFontForSize:"));
    -[EKUITodayCirclePulseView setFont:](self->_todayPulse, "setFont:", v14);

    -[EKUITodayCirclePulseView setTextOffsetFromCircle:](self->_todayPulse, "setTextOffsetFromCircle:", 0.0, -0.5);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber layer](self->_today, "layer"));
    v16 = objc_msgSend(v15, "frame");
    -[EKUITodayCirclePulseView setTextYOffset:](self->_todayPulse, "setTextYOffset:", CalRoundToScreenScale(v16, v18, (v5 - v17) * 0.5));

    -[EKUITodayCirclePulseView setCircleShouldFillFrame:](self->_todayPulse, "setCircleShouldFillFrame:", 1);
    *(_QWORD *)&v19 = objc_opt_class(self).n128_u64[0];
    v21 = -[EKUITodayCirclePulseView setUsesRoundedRectInsteadOfCircle:](self->_todayPulse, "setUsesRoundedRectInsteadOfCircle:", objc_msgSend(v20, "usesRoundedRectInsteadOfCircle", v19));
    v23 = CUIKGetOverlayCalendar(v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "overlayString"));
      -[EKUITodayCirclePulseView setOverlayString:](self->_todayPulse, "setOverlayString:", v25);

      *(_QWORD *)&v26 = objc_opt_class(self).n128_u64[0];
      objc_msgSend(v27, "dayNumberOverlayFontSize:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v26));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[CompactMonthWeekTodayCircle dayOverlayFontForSize:](CompactMonthWeekTodayCircle, "dayOverlayFontForSize:"));
      -[EKUITodayCirclePulseView setOverlayFont:](self->_todayPulse, "setOverlayFont:", v28);

    }
    -[EKUITodayCirclePulseView layoutIfNeeded](self->_todayPulse, "layoutIfNeeded");
    -[CompactMonthWeekView addSubview:](self, "addSubview:", self->_todayPulse);
    objc_msgSend(v3, "setHidden:", 1);
    v29 = self->_todayPulse;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000B14D4;
    v31[3] = &unk_1001B26A0;
    v32 = v3;
    v33 = self;
    v30 = v3;
    -[EKUITodayCirclePulseView pulse:](v29, "pulse:", v31);

  }
}

- (void)haltTodayPulse
{
  EKUITodayCirclePulseView *todayPulse;

  -[EKUITodayCirclePulseView removeFromSuperview](self->_todayPulse, "removeFromSuperview");
  todayPulse = self->_todayPulse;
  self->_todayPulse = 0;

}

- (void)prepareForReuse
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  CompactMonthWeekDayNumber *today;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (!self->_animating)
  {
    -[CompactMonthWeekView _clearTodayHighlight](self, "_clearTodayHighlight");
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->_daySummaries;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "setData:date:calendar:delegate:", 0, 0, 0, 0, (_QWORD)v9);
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    today = self->_today;
    self->_today = 0;

  }
}

- (void)setCompressedVerticalMode:(BOOL)a3
{
  _BOOL8 v3;
  CompactMonthWeekDayNumber *today;
  void *v6;
  void *v7;
  UILabel **p_monthNameLabel;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  id v23;
  double v24;
  double v25;
  id v26;
  double v27;
  NSArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  if (self->_compressedVerticalMode == a3)
    return;
  v3 = a3;
  self->_compressedVerticalMode = a3;
  -[CompactMonthWeekView setNeedsLayout](self, "setNeedsLayout");
  -[CompactMonthWeekView setNeedsDisplay](self, "setNeedsDisplay");
  today = self->_today;
  if (!today)
  {
    p_monthNameLabel = &self->_monthNameLabel;
    if (!self->_monthNameLabel)
      goto LABEL_12;
    if (v3)
      goto LABEL_8;
LABEL_10:
    v9 = objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    goto LABEL_11;
  }
  if (!v3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](self->_today, "attachedTodayCircle"));
    objc_msgSend(v11, "setBackgroundColor:", v10);

    p_monthNameLabel = &self->_monthNameLabel;
    if (!self->_monthNameLabel)
      goto LABEL_12;
    goto LABEL_10;
  }
  objc_storeStrong((id *)&self->_selected, today);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](self->_today, "attachedTodayCircle"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  p_monthNameLabel = &self->_monthNameLabel;
  if (self->_monthNameLabel)
  {
LABEL_8:
    v9 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
LABEL_11:
    v12 = (void *)v9;
    -[UILabel setBackgroundColor:](*p_monthNameLabel, "setBackgroundColor:", v9);

  }
LABEL_12:
  -[CompactMonthWeekView _updateDayTypeBadgesWithBackgroundColor](self, "_updateDayTypeBadgesWithBackgroundColor");
  *(_QWORD *)&v13 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v14, "dayNumberFontSize:", v3, v13);
  v16 = v15;
  *(_QWORD *)&v17 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v18, "dayNumberOverlayFontSize:", v3, v17);
  v20 = v19;
  *(_QWORD *)&v21 = objc_opt_class(self).n128_u64[0];
  v22 = v3 ^ 1;
  objc_msgSend(v23, "dayNumberFontSize:", v22, v21);
  if (v16 != v24
    || (*(_QWORD *)&v25 = objc_opt_class(self).n128_u64[0],
        objc_msgSend(v26, "dayNumberOverlayFontSize:", v22, v25),
        v20 != v27))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v28 = self->_days;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v33, "setFontSize:", v16, (_QWORD)v38);
          objc_msgSend(v33, "setOverlayFontSize:", v20);
          objc_msgSend(v33, "updateDayNumber");
          objc_msgSend(v33, "updateOverlay");
        }
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v30);
    }

    -[CompactMonthWeekDayNumber hideOverlayAndNumber:](self->_today, "hideOverlayAndNumber:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](self->_today, "attachedTodayCircle"));
    objc_msgSend(v34, "setFontSize:", v16);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](self->_today, "attachedTodayCircle"));
    objc_msgSend(v35, "setOverlayFontSize:", v20);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](self->_selected, "attachedTodayCircle"));
    objc_msgSend(v36, "setFontSize:", v16);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](self->_selected, "attachedTodayCircle"));
    objc_msgSend(v37, "setOverlayFontSize:", v20);

    -[CompactMonthWeekView setNeedsLayout](self, "setNeedsLayout");
  }
  -[CompactMonthWeekView _forceReloadImagesForDayTypeBadges](self, "_forceReloadImagesForDayTypeBadges", (_QWORD)v38);
  if (self->_containsFirstDayOfMonth)
    -[CompactMonthWeekView _updateWeekNumberAnimated:](self, "_updateWeekNumberAnimated:", 1);
}

- (BOOL)containsFirstDayOfMonth
{
  return self->_containsFirstDayOfMonth;
}

- (int64_t)daysInMonth
{
  return (int64_t)-[EKCalendarDate daysInMonth](self->_startCalendarDate, "daysInMonth");
}

- (CGRect)rectForCells
{
  double v3;
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
  double v14;
  double v15;
  CGRect result;

  -[CompactMonthWeekView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (self->_containsFirstDayOfMonth)
  {
    +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance](CompactMonthViewController, "topOfMonthNameLabelToGrayLineDistance");
    v6 = v6 + v11;
    v10 = v10 - v11;
  }
  v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)isTodayHighlightVisible
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](self->_today, "attachedTodayCircle"));
  v3 = objc_msgSend(v2, "drawCircle");

  return v3;
}

- (CGRect)frameForTodayHighlight
{
  CompactMonthWeekDayNumber *today;
  void *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  today = self->_today;
  if (today)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](today, "attachedTodayCircle"));
    objc_msgSend(v3, "frame");
    x = v4;
    y = v6;
    width = v8;
    height = v10;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)dayNumberCellFrames
{
  id v3;
  NSArray *days;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init((Class)NSMutableArray);
  days = self->_days;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B1BB0;
  v7[3] = &unk_1001B4890;
  v5 = v3;
  v8 = v5;
  -[NSArray enumerateObjectsUsingBlock:](days, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

- (id)days
{
  return self->_days;
}

- (id)dayForPoint:(CGPoint)a3
{
  NSArray *days;
  id v4;
  _QWORD v6[5];
  CGPoint v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1000B1CE8;
  v12 = sub_1000B1CF8;
  v13 = 0;
  days = self->_days;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B1D00;
  v6[3] = &unk_1001B48B8;
  v7 = a3;
  v6[4] = &v8;
  -[NSArray enumerateObjectsUsingBlock:](days, "enumerateObjectsUsingBlock:", v6);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (int64_t)indexForPoint:(CGPoint)a3
{
  NSArray *days;
  int64_t v4;
  _QWORD v6[5];
  CGPoint v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  days = self->_days;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000B1E2C;
  v6[3] = &unk_1001B48B8;
  v7 = a3;
  v6[4] = &v8;
  -[NSArray enumerateObjectsUsingBlock:](days, "enumerateObjectsUsingBlock:", v6);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (void)adjustHighlight:(id)a3 forDay:(id)a4
{
  id v6;
  id v7;
  CompactMonthWeekDayNumber *today;
  void *v9;
  id v10;
  NSCalendar *calendar;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  int v26;
  CGSize size;
  NSArray *days;
  id v29;
  double v30;
  id v31;
  double v32;
  id v33;
  double v34;
  id v35;
  void **v36;
  uint64_t v37;
  void (*v38)(_QWORD *, void *);
  void *v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  void *v46;
  CGPoint v47;
  CGSize v48;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  void *v52;
  CGPoint origin;
  CGSize v54;

  v6 = a3;
  v7 = a4;
  today = self->_today;
  if (!today)
  {
    objc_msgSend(v6, "setIsToday:", 0);
    goto LABEL_5;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber calendarDate](today, "calendarDate"));
  v10 = objc_msgSend(v9, "compare:", v7);

  objc_msgSend(v6, "setIsToday:", v10 == 0);
  if (v10)
  {
LABEL_5:
    calendar = self->_calendar;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));
    objc_msgSend(v6, "setIsWeekend:", -[NSCalendar isDateInWeekend:](calendar, "isDateInWeekend:", v12));

  }
  v13 = CUIKLocalizedStringForInteger(objc_msgSend(v7, "day"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = objc_msgSend(v6, "setText:", v14);
  v17 = CUIKGetOverlayCalendar(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));
  if (v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKDateStrings overlayShortStringForDate:inCalendar:](CUIKDateStrings, "overlayShortStringForDate:inCalendar:", v19, v18));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "components:fromDate:", 24, v19));
    v22 = 0.0;
    if (objc_msgSend(v21, "day") != (id)1
      || (v22 = 1.0, objc_msgSend(v21, "month") != (id)1)
      || (v23 = 1.5, objc_msgSend(v21, "isLeapMonth")))
    {
      v23 = v22;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView traitCollection](self, "traitCollection"));
    v26 = EKUIUsesLargeTextLayout(v24, v25);

    if (v26)
      v23 = v23 + v23;

  }
  else
  {
    v20 = 0;
    v23 = 0.0;
  }
  objc_msgSend(v6, "setOverlayText:", v20);
  objc_msgSend(v6, "setUnderlineThickness:", v23);
  v49 = 0;
  v50 = (double *)&v49;
  v51 = 0x4010000000;
  v52 = &unk_100195B79;
  size = CGRectZero.size;
  origin = CGRectZero.origin;
  v54 = size;
  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x4010000000;
  v46 = &unk_100195B79;
  v47 = origin;
  v48 = size;
  days = self->_days;
  v36 = _NSConcreteStackBlock;
  v37 = 3221225472;
  v38 = sub_1000B2224;
  v39 = &unk_1001B48E0;
  v29 = v7;
  v40 = v29;
  v41 = &v49;
  v42 = &v43;
  -[NSArray enumerateObjectsUsingBlock:](days, "enumerateObjectsUsingBlock:", &v36);
  *(_QWORD *)&v30 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v31, "dayNumberFontSize:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v30, v36, v37, v38, v39));
  objc_msgSend(v6, "setFontSize:");
  *(_QWORD *)&v32 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v33, "dayNumberOverlayFontSize:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v32));
  objc_msgSend(v6, "setOverlayFontSize:");
  *(_QWORD *)&v34 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v6, "setUsesRoundedRectInsteadOfCircle:", objc_msgSend(v35, "usesRoundedRectInsteadOfCircle", v34));
  -[CompactMonthWeekView frameForCircleWithDayFrame:dayLayerFrame:numberString:overlayString:](self, "frameForCircleWithDayFrame:dayLayerFrame:numberString:overlayString:", v14, v20, v50[4], v50[5], v50[6], v50[7], v44[4], v44[5], v44[6], v44[7]);
  objc_msgSend(v6, "setFrame:");

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

}

- (void)setCalendarDate:(id)a3
{
  EKCalendarDate *v5;
  EKCalendarDate **p_startCalendarDate;
  double v7;
  id v8;
  double v9;
  id v10;
  id v11;
  NSUInteger v12;
  NSArray *days;
  EKCalendarDate *v14;
  EKCalendarDate *endCalendarDate;
  _QWORD v16[11];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  EKCalendarDate *v32;
  _QWORD v33[3];
  char v34;

  v5 = (EKCalendarDate *)a3;
  p_startCalendarDate = &self->_startCalendarDate;
  if (self->_startCalendarDate != v5)
  {
    objc_storeStrong((id *)&self->_startCalendarDate, a3);
    *(_QWORD *)&v7 = objc_opt_class(self).n128_u64[0];
    self->_cellToStartDrawingIn = (int64_t)objc_msgSend(v8, "_cellToStartDrawingInForViewWithCalendarDate:calendar:", *p_startCalendarDate, self->_calendar, v7);
    *(_QWORD *)&v9 = objc_opt_class(self).n128_u64[0];
    self->_containsFirstDayOfMonth = objc_msgSend(v10, "_viewForCalendarDateContainsFirstDayOfMonth:", *p_startCalendarDate, v9);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v34 = 1;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = sub_1000B1CE8;
    v31 = sub_1000B1CF8;
    v32 = *p_startCalendarDate;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_1000B1CE8;
    v25 = sub_1000B1CF8;
    v26 = (id)v28[5];
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v11 = objc_msgSend((id)v28[5], "month");
    v12 = -[NSArray count](self->_days, "count");
    days = self->_days;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000B2568;
    v16[3] = &unk_1001B4908;
    v16[4] = self;
    v16[5] = v33;
    v16[6] = &v27;
    v16[7] = &v21;
    v16[8] = &v17;
    v16[9] = v11;
    v16[10] = v12;
    -[NSArray enumerateObjectsUsingBlock:](days, "enumerateObjectsUsingBlock:", v16);
    v14 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v22[5], "calendarDateForEndOfDay"));
    endCalendarDate = self->_endCalendarDate;
    self->_endCalendarDate = v14;

    -[CompactMonthWeekView resetTodayBits](self, "resetTodayBits");
    -[CompactMonthWeekView setEventData:animated:](self, "setEventData:animated:", 0, 0);
    -[CompactMonthWeekView _updateWeekNumberAnimated:](self, "_updateWeekNumberAnimated:", 0);
    -[MonthWeekOccurrencesView setStartDate:endDate:dayCount:](self->_occurrencesView, "setStartDate:endDate:dayCount:", *p_startCalendarDate, self->_endCalendarDate, v18[3]);
    -[CompactMonthWeekView setNeedsLayout](self, "setNeedsLayout");
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(v33, 8);
  }

}

- (void)_updateWeekNumberAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  double v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  _QWORD v16[6];

  if (self->_weekNumberLabel)
  {
    v3 = a3;
    v5 = CUIKCalendar(self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_startCalendarDate, "date"));
    v8 = objc_msgSend(v6, "component:fromDate:", 0x2000, v7);

    v9 = CUIKLocalizedStringForInteger(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[UILabel setText:](self->_weekNumberLabel, "setText:", v10);

    *(_QWORD *)&v11 = objc_opt_class(self).n128_u64[0];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "weekNumberColorForThisWeek:", self->_containsToday, v11));
    -[UILabel setTextColor:](self->_weekNumberLabel, "setTextColor:", v13);

    if (self->_compressedVerticalMode)
    {
      if (self->_containsFirstDayOfMonth)
        v14 = 0.0;
      else
        v14 = 1.0;
    }
    else
    {
      v14 = 1.0;
    }
    -[UILabel alpha](self->_weekNumberLabel, "alpha");
    if (v14 != v15)
    {
      if (v3)
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000B281C;
        v16[3] = &unk_1001B2838;
        v16[4] = self;
        *(double *)&v16[5] = v14;
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v16, 0.3);
      }
      else
      {
        -[UILabel setAlpha:](self->_weekNumberLabel, "setAlpha:", v14);
      }
    }
  }
}

- (void)resetTimeZone:(id)a3
{
  id v4;
  void *v5;
  EKCalendarDate *v6;
  EKCalendarDate *startCalendarDate;
  void *v8;
  EKCalendarDate *v9;
  EKCalendarDate *endCalendarDate;
  NSArray *days;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_startCalendarDate, "date"));
  v6 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v5, v4));
  startCalendarDate = self->_startCalendarDate;
  self->_startCalendarDate = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_endCalendarDate, "date"));
  v9 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v8, v4));
  endCalendarDate = self->_endCalendarDate;
  self->_endCalendarDate = v9;

  days = self->_days;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B2950;
  v13[3] = &unk_1001B4890;
  v14 = v4;
  v12 = v4;
  -[NSArray enumerateObjectsUsingBlock:](days, "enumerateObjectsUsingBlock:", v13);

}

- (id)makeDayCircleForDate:(id)a3 isToday:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CompactMonthWeekTodayCircle *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  id v15;
  double v16;
  id v17;
  double v18;
  id v19;

  v4 = a4;
  v6 = a3;
  v7 = -[CompactMonthWeekTodayCircle initWithCalendarDate:]([CompactMonthWeekTodayCircle alloc], "initWithCalendarDate:", v6);

  -[CompactMonthWeekTodayCircle setUseTodayColors:](v7, "setUseTodayColors:", v4);
  if (-[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode"))
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  else
    v8 = objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v9 = (void *)v8;
  -[CompactMonthWeekTodayCircle setBackgroundColor:](v7, "setBackgroundColor:", v8);

  v10 = -[CompactMonthWeekTodayCircle setCompressed:](v7, "setCompressed:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode"));
  v12 = CUIKGetOverlayCalendar(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[CompactMonthWeekTodayCircle setShowOverlay:](v7, "setShowOverlay:", v13 != 0);

  *(_QWORD *)&v14 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v15, "dayNumberFontSize:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v14));
  -[CompactMonthWeekTodayCircle setFontSize:](v7, "setFontSize:");
  *(_QWORD *)&v16 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v17, "dayNumberOverlayFontSize:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v16));
  -[CompactMonthWeekTodayCircle setOverlayFontSize:](v7, "setOverlayFontSize:");
  *(_QWORD *)&v18 = objc_opt_class(self).n128_u64[0];
  -[CompactMonthWeekTodayCircle setUsesRoundedRectInsteadOfCircle:](v7, "setUsesRoundedRectInsteadOfCircle:", objc_msgSend(v19, "usesRoundedRectInsteadOfCircle", v18));
  -[CompactMonthWeekTodayCircle sizeToFit](v7, "sizeToFit");
  return v7;
}

- (void)resetTodayBits
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSArray *days;
  CompactMonthWeekDayNumber *today;
  void *v8;
  _BOOL4 v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CompactMonthWeekView *v13;

  self->_containsToday = 0;
  v3 = CUIKTodayDate(self, a2);
  v10 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_startCalendarDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_endCalendarDate, "date"));
  if (objc_msgSend(v4, "compare:", v10) == (id)1)
  {
    if (self->_containsToday)
      goto LABEL_3;
LABEL_8:
    -[CompactMonthWeekView _clearTodayHighlight](self, "_clearTodayHighlight");
    goto LABEL_9;
  }
  v9 = objc_msgSend(v5, "compare:", v10) != (id)-1;
  self->_containsToday = v9;
  if (!v9)
    goto LABEL_8;
LABEL_3:
  days = self->_days;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B2CA0;
  v11[3] = &unk_1001B4738;
  v12 = v10;
  v13 = self;
  -[NSArray enumerateObjectsUsingBlock:](days, "enumerateObjectsUsingBlock:", v11);
  -[CompactMonthWeekView setNeedsLayout](self, "setNeedsLayout");
  if (-[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode"))
  {
    today = self->_today;
    if (self->_selected != today)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](today, "attachedTodayCircle"));
      objc_msgSend(v8, "setDrawCircle:", 0);

      -[CompactMonthWeekDayNumber hideOverlayAndNumber:](self->_today, "hideOverlayAndNumber:", 1);
    }
  }

LABEL_9:
  -[CompactMonthWeekView _reloadMonthNameLabel](self, "_reloadMonthNameLabel");

}

- (void)_clearTodayHighlight
{
  CompactMonthWeekDayNumber *today;
  void *v4;
  void *v5;
  CompactMonthWeekDayNumber *v6;

  today = self->_today;
  if (today)
  {
    -[CompactMonthWeekDayNumber hideOverlayAndNumber:](today, "hideOverlayAndNumber:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](self->_today, "attachedTodayCircle"));
    objc_msgSend(v4, "removeFromSuperview");

    -[CompactMonthWeekDayNumber setAttachedTodayCircle:](self->_today, "setAttachedTodayCircle:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber overlay](self->_today, "overlay"));
    objc_msgSend(v5, "setHidden:", 0);

    v6 = self->_today;
    self->_today = 0;

    -[CompactMonthWeekView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEventData:(id)a3
{
  -[CompactMonthWeekView setEventData:animated:](self, "setEventData:animated:", a3, 1);
}

- (void)setEventData:(id)a3 animated:(BOOL)a4
{
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_eventData, a3);
  +[CATransaction begin](CATransaction, "begin");
  if (!a4)
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[CompactMonthWeekView _updateEventSummaries](self, "_updateEventSummaries");
  +[CATransaction commit](CATransaction, "commit");

}

- (void)setOccurrences:(id)a3 animated:(BOOL)a4
{
  -[MonthWeekOccurrencesView setOccurrences:](self->_occurrencesView, "setOccurrences:", a3, a4);
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
  -[CompactMonthWeekView layoutIfNeeded](self, "layoutIfNeeded");
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

- (void)setSelectedOccurrence:(id)a3
{
  -[MonthWeekOccurrencesView setSelectedOccurrence:](self->_occurrencesView, "setSelectedOccurrence:", a3);
}

- (id)selectedOccurrence
{
  return -[MonthWeekOccurrencesView selectedOccurrence](self->_occurrencesView, "selectedOccurrence");
}

- (void)setSelectedOccurrences:(id)a3
{
  -[MonthWeekOccurrencesView setSelectedOccurrences:](self->_occurrencesView, "setSelectedOccurrences:", a3);
}

- (id)selectedOccurrences
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

- (void)_updateEventSummaries
{
  void *v3;
  NSArray *days;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  NSArray *eventData;
  NSArray *v10;
  NSArray *v11;
  id v12;
  uint64_t v13;
  void *j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  _QWORD v20[6];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _QWORD v26[4];
  _BYTE v27[128];
  _BYTE v28[128];

  if (!self->_animating)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView traitCollection](self, "traitCollection"));
    +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v3);

    if (self->_eventData)
    {
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x2020000000;
      days = self->_days;
      v26[3] = 0;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000B33A4;
      v25[3] = &unk_1001B4930;
      v25[4] = v26;
      -[NSArray enumerateObjectsUsingBlock:](days, "enumerateObjectsUsingBlock:", v25);
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v5 = self->_daySummaries;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v7)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "setData:date:calendar:delegate:", 0, 0, 0, 0);
          }
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
        }
        while (v6);
      }

      eventData = self->_eventData;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000B33FC;
      v20[3] = &unk_1001B4958;
      v20[4] = self;
      v20[5] = v26;
      -[NSArray enumerateObjectsUsingBlock:](eventData, "enumerateObjectsUsingBlock:", v20);
      _Block_object_dispose(v26, 8);
    }
    else
    {
      v10 = self->_days;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000B3548;
      v19[3] = &unk_1001B4890;
      v19[4] = self;
      -[NSArray enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v19);
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v11 = self->_daySummaries;
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v16;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)j), "setAlpha:", 0.0, (_QWORD)v15);
          }
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
        }
        while (v12);
      }

    }
  }
}

- (void)setSelectedDay:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CompactMonthWeekDayNumber **p_selected;
  CompactMonthWeekDayNumber *selected;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  CompactMonthWeekDayNumber *today;
  void *v19;
  void *v20;
  CompactMonthWeekDayNumber *v21;
  double v22;
  double v23;
  CompactMonthWeekDayNumber *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  CompactMonthWeekDayNumber *i;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id *location;
  _BOOL4 v55;
  CompactMonthWeekView *v56;
  NSArray *obj;
  _QWORD v58[4];
  NSArray *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];

  v4 = a4;
  v6 = a3;
  p_selected = &self->_selected;
  selected = self->_selected;
  if (selected)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber calendarDate](selected, "calendarDate"));
    v10 = (void *)v9;
    if (v6 && v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber calendarDate](*p_selected, "calendarDate"));
      v12 = objc_msgSend(v11, "year");
      if (v12 == objc_msgSend(v6, "year"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber calendarDate](*p_selected, "calendarDate"));
        v14 = objc_msgSend(v13, "month");
        if (v14 == objc_msgSend(v6, "month"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber calendarDate](self->_selected, "calendarDate"));
          v16 = objc_msgSend(v15, "day");
          v17 = objc_msgSend(v6, "day");

          p_selected = &self->_selected;
          if (v16 == v17)
            goto LABEL_45;
          goto LABEL_11;
        }

        p_selected = &self->_selected;
      }

    }
LABEL_11:
    today = *p_selected;
    if (*p_selected != self->_today)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](today, "attachedTodayCircle"));
      objc_msgSend(v19, "removeFromSuperview");

      -[CompactMonthWeekDayNumber setAttachedTodayCircle:](*p_selected, "setAttachedTodayCircle:", 0);
      -[CompactMonthWeekDayNumber hideOverlayAndNumber:](*p_selected, "hideOverlayAndNumber:", 0);
      today = self->_today;
    }
    if (today)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](today, "attachedTodayCircle"));
      objc_msgSend(v20, "setDrawCircle:", 0);

      -[CompactMonthWeekDayNumber hideOverlayAndNumber:](self->_today, "hideOverlayAndNumber:", 1);
    }
    v21 = *p_selected;
    *p_selected = 0;

  }
  if (v6)
  {
    objc_msgSend(v6, "absoluteTime");
    v23 = v22;
    v24 = (CompactMonthWeekDayNumber *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView calendarDate](self, "calendarDate"));
    -[CompactMonthWeekDayNumber absoluteTime](v24, "absoluteTime");
    if (v23 < v25)
      goto LABEL_44;
    objc_msgSend(v6, "absoluteTime");
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView endCalendarDate](self, "endCalendarDate"));
    objc_msgSend(v28, "absoluteTime");
    v30 = v29;

    if (v27 <= v30)
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      obj = self->_days;
      v24 = (CompactMonthWeekDayNumber *)-[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      if (!v24)
        goto LABEL_43;
      location = (id *)p_selected;
      v56 = self;
      v55 = v4;
      v31 = *(_QWORD *)v61;
      while (2)
      {
        for (i = 0; i != v24; i = (CompactMonthWeekDayNumber *)((char *)i + 1))
        {
          if (*(_QWORD *)v61 != v31)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
          v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "calendarDate"));
          if (v34)
          {
            v35 = (void *)v34;
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "calendarDate"));
            v37 = objc_msgSend(v36, "month");
            if (v37 == objc_msgSend(v6, "month"))
            {
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "calendarDate"));
              v39 = objc_msgSend(v38, "day");
              v40 = v6;
              v41 = objc_msgSend(v6, "day");

              v42 = v39 == v41;
              v6 = v40;
              if (v42)
              {
                v24 = v33;

                if (!v24)
                  goto LABEL_44;
                if (v24 == v56->_today)
                {
                  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](v24, "attachedTodayCircle"));
                  objc_msgSend(v52, "setDrawCircle:", 1);

                  objc_storeStrong(location, v56->_today);
                  -[CompactMonthWeekDayNumber hideOverlayAndNumber:](v56->_today, "hideOverlayAndNumber:", 1);
                  if (!v55)
                    goto LABEL_44;
                }
                else
                {
                  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView makeDayCircleForDate:isToday:](v56, "makeDayCircleForDate:isToday:", v40, 0));
                  -[CompactMonthWeekView addSubview:](v56, "addSubview:", v43);
                  -[CompactMonthWeekDayNumber setAttachedTodayCircle:](v24, "setAttachedTodayCircle:", v43);
                  objc_storeStrong(location, v33);
                  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber overlay](v24, "overlay"));

                  if (v44)
                  {
                    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber overlay](v24, "overlay"));
                    objc_msgSend(v45, "setHidden:", 1);

                  }
                  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber dayTypeBadge](v24, "dayTypeBadge"));
                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "superlayer"));

                  if (v47)
                  {
                    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber dayTypeBadge](v24, "dayTypeBadge"));
                    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "superlayer"));

                    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber dayTypeBadge](v24, "dayTypeBadge"));
                    objc_msgSend(v50, "removeFromSuperlayer");

                    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber dayTypeBadge](v24, "dayTypeBadge"));
                    objc_msgSend(v49, "addSublayer:", v51);

                  }
                  v6 = v40;
                  if (!v55)
                    goto LABEL_44;
                }
                v53 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](v24, "attachedTodayCircle"));
                objc_msgSend(v53, "setAlpha:", 0.0);

                v58[0] = _NSConcreteStackBlock;
                v58[1] = 3221225472;
                v58[2] = sub_1000B3AB0;
                v58[3] = &unk_1001B2538;
                v24 = v24;
                v59 = (NSArray *)v24;
                +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v58, 0.2);
                obj = v59;
                goto LABEL_43;
              }
            }
            else
            {

            }
          }
        }
        v24 = (CompactMonthWeekDayNumber *)-[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
        if (v24)
          continue;
        break;
      }
LABEL_43:

LABEL_44:
    }
  }
LABEL_45:

}

- (void)setGrayLineAlpha:(double)a3
{
  -[UIView setAlpha:](self->_grayLine, "setAlpha:", a3);
}

- (id)occurrencesView
{
  return self->_occurrencesView;
}

- (id)visibleDaySummaryViews
{
  void *v2;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  double v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (self->_hideDaySummaries)
  {
    v2 = 0;
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self->_daySummaries, "count")));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = self->_daySummaries;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v9, "isHidden", (_QWORD)v13) & 1) == 0)
          {
            objc_msgSend(v9, "alpha");
            if (v10 > 0.01)
            {
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "superview"));

              if (v11)
                objc_msgSend(v2, "addObject:", v9);
            }
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  return v2;
}

+ (BOOL)usesRoundedRectInsteadOfCircle
{
  return EKUIUsesRoundedRectsInsteadOfCircles(0, a2);
}

+ (double)grayLineHeight
{
  return 1.0;
}

+ (id)grayLineColor
{
  return +[UIColor systemGray5Color](UIColor, "systemGray5Color");
}

- (void)_updateSingleDaySummaryForDayIndex:(int64_t)a3 withData:(id)a4 date:(id)a5 calendar:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  id v15;

  v15 = a4;
  v10 = a5;
  v11 = a6;
  if ((a3 & 0x8000000000000000) == 0
    && !self->_animating
    && (uint64_t)-[NSArray count](self->_daySummaries, "count") > a3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_daySummaries, "objectAtIndex:", a3));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView weekDelegate](self, "weekDelegate"));
    objc_msgSend(v12, "setData:date:calendar:delegate:", v15, v10, v11, v13);

    if (objc_msgSend(v15, "count"))
    {
      v14 = 0.0;
      if (!self->_hideDaySummaries)
        v14 = 1.0;
    }
    else
    {
      v14 = 0.0;
    }
    objc_msgSend(v12, "setAlpha:", v14);

  }
}

+ (id)dayTypeBadgeBackgroundColorForVerticallyCompressedMode:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (!a3)
    return (id)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v14 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  v11 = 0.0;
  objc_msgSend(v3, "getRed:green:blue:alpha:", &v14, &v13, &v12, &v11);
  v9 = 0.0;
  v10 = 0.0;
  v7 = 0;
  v8 = 0.0;
  objc_msgSend(v4, "getRed:green:blue:alpha:", &v10, &v9, &v8, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v10 * (1.0 - v11) + v14 * v11, (1.0 - v11) * v9 + v13 * v11, (1.0 - v11) * v8 + v12 * v11, 1.0));

  return v5;
}

- (void)_updateDayTypeBadgeForDayNumber:(id)a3 withDayType:(int64_t)a4 color:(id)a5 locale:(id)a6 forceImageUpdate:(BOOL)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  double v19;
  id v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dayTypeBadge"));
  if (v12 && (a4 | 2) == 3)
  {
    if (objc_msgSend(v35, "dayBadgeType") == (id)a4 && !a7)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dayBadgeColor"));
      if ((objc_msgSend(v12, "isEqual:", v15) & 1) != 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dayBadgeLocale"));
        v17 = objc_msgSend(v13, "isEqual:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_20;
      }
      else
      {

      }
    }
    objc_msgSend(v35, "setDayBadgeType:", a4);
    objc_msgSend(v35, "setDayBadgeColor:", v12);
    objc_msgSend(v35, "setDayBadgeLocale:", v13);
    *(_QWORD *)&v19 = objc_opt_class(self).n128_u64[0];
    objc_msgSend(v20, "dayTypeBadgeDiameter:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v19));
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView traitCollection](self, "traitCollection"));
    v24 = objc_msgSend(v23, "userInterfaceStyle");

    if (a4 == 3)
    {
      v27 = BadgeImageForAlternateWorkday(v12, v24, v13, v22);
      v26 = objc_claimAutoreleasedReturnValue(v27);
    }
    else
    {
      if (a4 != 1)
      {
        v28 = 0;
        goto LABEL_17;
      }
      v25 = BadgeImageForHoliday(v12, v24, v13, v22);
      v26 = objc_claimAutoreleasedReturnValue(v25);
    }
    v28 = (void *)v26;
LABEL_17:
    *(_QWORD *)&v29 = objc_opt_class(self).n128_u64[0];
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "dayTypeBadgeBackgroundColorForVerticallyCompressedMode:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v29)));
    objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v31, "cgColor"));

    v32 = objc_retainAutorelease(v28);
    objc_msgSend(v14, "setContents:", objc_msgSend(v32, "CGImage"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "superlayer"));

    if (!v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView layer](self, "layer"));
      objc_msgSend(v34, "addSublayer:", v14);

    }
    goto LABEL_20;
  }
  objc_msgSend(v35, "setDayBadgeType:", a4);
  objc_msgSend(v35, "setDayBadgeColor:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "superlayer"));

  if (v18)
    objc_msgSend(v14, "removeFromSuperlayer");
LABEL_20:

}

- (void)_forceReloadImagesForDayTypeBadges
{
  void *v3;
  NSArray *days;
  NSArray *eventData;
  _QWORD v6[6];
  _QWORD v7[5];
  _QWORD v8[4];

  if (self->_eventData)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView traitCollection](self, "traitCollection"));
    +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v3);

    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    days = self->_days;
    v8[3] = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000B4240;
    v7[3] = &unk_1001B4930;
    v7[4] = v8;
    -[NSArray enumerateObjectsUsingBlock:](days, "enumerateObjectsUsingBlock:", v7);
    eventData = self->_eventData;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B4298;
    v6[3] = &unk_1001B4958;
    v6[4] = self;
    v6[5] = v8;
    -[NSArray enumerateObjectsUsingBlock:](eventData, "enumerateObjectsUsingBlock:", v6);
    _Block_object_dispose(v8, 8);
  }
}

- (void)_updateDayTypeBadgesWithBackgroundColor
{
  double v3;
  id v4;
  void *v5;
  NSArray *days;
  id v7;
  _QWORD v8[4];
  id v9;

  if (self->_eventData)
  {
    *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dayTypeBadgeBackgroundColorForVerticallyCompressedMode:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v3)));
    days = self->_days;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000B4434;
    v8[3] = &unk_1001B4890;
    v9 = v5;
    v7 = v5;
    -[NSArray enumerateObjectsUsingBlock:](days, "enumerateObjectsUsingBlock:", v8);

  }
}

- (void)_layoutDayTypeBadgeForDayNumber:(id)a3 yOffset:(double)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  id v46;

  v5 = a3;
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  -[CompactMonthWeekView frameForCircleWithDayFrame:dayLayerFrame:numberString:overlayString:](self, "frameForCircleWithDayFrame:dayLayerFrame:numberString:overlayString:", CFSTR("99"), 0, v7, v9, v11, v13, v16, v18, v20, v22);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  *(_QWORD *)&v31 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v32, "dayTypeBadgeFrameFromDayNumberFrame:compressed:", -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v31), v24, v26, v28, v30);
  v34 = v33;
  v38 = CalRoundRectToScreenScale(v35, v36, v33, v37);
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dayTypeBadge"));
  objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

  v46 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dayTypeBadge"));
  objc_msgSend(v46, "setCornerRadius:", v34 * 0.5);

}

+ (CGRect)dayTypeBadgeFrameFromDayNumberFrame:(CGRect)a3 compressed:(BOOL)a4
{
  _BOOL8 v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  id v10;
  id v11;
  double v12;
  double v13;
  int IsRightToLeft;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double MinX;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect result;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)&v9 = objc_opt_class(a1).n128_u64[0];
  v11 = objc_msgSend(v10, "dayTypeBadgeDiameter:", v4, v9);
  v13 = v12;
  IsRightToLeft = CUIKLocaleIsRightToLeft(v11);
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  if (IsRightToLeft)
    MinX = CGRectGetMinX(*(CGRect *)&v15);
  else
    MinX = CGRectGetMaxX(*(CGRect *)&v15);
  v20 = MinX + v13 * -0.5;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v21 = CGRectGetMinY(v25) + -1.0;
  v22 = v20;
  v23 = v13;
  v24 = v13;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v21;
  result.origin.x = v22;
  return result;
}

- (CGRect)frameForCircleWithDayFrame:(CGRect)a3 dayLayerFrame:(CGRect)a4 numberString:(id)a5 overlayString:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  id v16;
  id v17;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3.size.height;
  v12 = a3.size.width;
  v13 = a3.origin.y;
  v14 = a3.origin.x;
  v16 = a6;
  v17 = a5;
  *(_QWORD *)&v18 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v19, "frameForCircleWithDayFrame:dayLayerFrame:numberString:overlayString:compressed:containsFirstDay:", v17, v16, -[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", v18), -[CompactMonthWeekView containsFirstDayOfMonth](self, "containsFirstDayOfMonth"), v14, v13, v12, v11, x, y, width, height);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = v21;
  v29 = v23;
  v30 = v25;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (void)_setUpInteraction
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", self);
  -[CompactMonthWeekView addInteraction:](self, "addInteraction:", v3);

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  _BOOL4 v28;
  void *v29;
  double v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  CGPoint v38;
  CGRect v39;

  v6 = a4;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = self->_days;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        if (-[CompactMonthWeekView compressedVerticalMode](self, "compressedVerticalMode", (_QWORD)v33))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attachedTodayCircle"));
          v14 = objc_msgSend(v13, "drawCircle");

        }
        else
        {
          v14 = 0;
        }
        if (objc_msgSend(v12, "representsActualDate"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendarDate"));
          v16 = v15;
          if (v15)
            v17 = v14;
          else
            v17 = 1;
          if (v17 == 1)
          {

          }
          else
          {
            objc_msgSend(v12, "frame");
            v19 = v18;
            v21 = v20;
            v23 = v22;
            v25 = v24;
            objc_msgSend(v6, "location");
            v38.x = v26;
            v38.y = v27;
            v39.origin.x = v19;
            v39.origin.y = v21;
            v39.size.width = v23;
            v39.size.height = v25;
            v28 = CGRectContainsPoint(v39, v38);

            if (v28)
            {
              if (self->_containsFirstDayOfMonth)
              {
                +[CompactMonthViewController topOfMonthNameLabelToGrayLineDistance](CompactMonthViewController, "topOfMonthNameLabelToGrayLineDistance");
                *(_QWORD *)&v30 = objc_opt_class(self).n128_u64[0];
                objc_msgSend(v31, "grayLineHeight", v30);
              }
              objc_msgSend(v12, "frame");
              v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0));
              goto LABEL_22;
            }
          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v9)
        continue;
      break;
    }
  }
  v29 = 0;
LABEL_22:

  return v29;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  CGFloat MidX;
  CGFloat MidY;
  NSArray *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  CompactMonthWeekView *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t ImageViewFromView;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  unsigned int v81;
  uint64_t v82;
  void *v83;
  uint64_t v85;
  void *v86;
  CompactMonthWeekView *v87;
  void *v88;
  void *v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  CGPoint v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  v90 = a3;
  v6 = a4;
  objc_msgSend(v6, "rect");
  MidX = CGRectGetMidX(v97);
  v89 = v6;
  objc_msgSend(v6, "rect");
  MidY = CGRectGetMidY(v98);
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v87 = self;
  v9 = self->_days;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v92 != v15)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "representsActualDate"))
        {
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "calendarDate"));
          if (v18)
          {
            v19 = (void *)v18;
            objc_msgSend(v17, "frame");
            v96.x = MidX;
            v96.y = MidY;
            v20 = CGRectContainsPoint(v99, v96);

            if (v20)
            {
              v21 = v17;

              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "attachedTodayCircle"));
              if (v22)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "attachedTodayCircle"));

                v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
                objc_msgSend(v23, "setBackgroundColor:", v24);

                v13 = 1;
                v12 = v21;
                v14 = v23;
              }
              else
              {
                v12 = v21;
              }
            }
          }
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendarDate"));
  v26 = objc_msgSend(v25, "day");

  v27 = CUIKLocalizedStringForInteger(v26);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  v30 = CUIKGetOverlayCalendar(v28, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendarDate"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "date"));
    v34 = objc_claimAutoreleasedReturnValue(+[CUIKDateStrings overlayShortStringForDate:inCalendar:](CUIKDateStrings, "overlayShortStringForDate:inCalendar:", v33, v31));

  }
  else
  {
    v34 = 0;
  }
  v35 = v87;
  objc_msgSend(v12, "frame");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
  objc_msgSend(v44, "frame");
  -[CompactMonthWeekView frameForCircleWithDayFrame:dayLayerFrame:numberString:overlayString:](v87, "frameForCircleWithDayFrame:dayLayerFrame:numberString:overlayString:", v28, v34, v37, v39, v41, v43, v45, v46, v47, v48);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;

  v100.origin.x = v50;
  v100.origin.y = v52;
  v100.size.width = v54;
  v100.size.height = v56;
  v57 = CGRectGetMidX(v100);
  v101.origin.x = v50;
  v101.origin.y = v52;
  v101.size.width = v54;
  v101.size.height = v56;
  v58 = CGRectGetMidY(v101);
  v85 = v28;
  v88 = (void *)v34;
  if ((v13 & 1) == 0)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer", v28, v34));
    v60 = objc_msgSend(v59, "isHidden");

    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "overlay"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "layer"));
    v63 = objc_msgSend(v62, "isHidden");

    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
    objc_msgSend(v64, "setHidden:", 0);

    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "overlay"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "layer"));
    objc_msgSend(v66, "setHidden:", 0);

    ImageViewFromView = createImageViewFromView(v35, 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue(ImageViewFromView);

    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
    objc_msgSend(v69, "setHidden:", v60);

    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "overlay"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "layer"));
    objc_msgSend(v71, "setHidden:", v63);

    v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v68, "setBackgroundColor:", v72);

    objc_msgSend(v68, "setFrame:", v50, v52, v54, v56);
    v14 = v68;
  }
  v73 = objc_alloc_init((Class)UIPreviewParameters);
  v74 = objc_msgSend(objc_alloc((Class)UIPreviewTarget), "initWithContainer:center:", v35, v57, v58);
  v75 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:parameters:target:", v14, v73, v74);
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerHighlightEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v75));
  if (+[CompactMonthWeekView usesRoundedRectInsteadOfCircle](CompactMonthWeekView, "usesRoundedRectInsteadOfCircle"))
  {
    v77 = EKUILargeTextRoundedRectCornerRadius;
  }
  else
  {
    v77 = v54 * 0.5;
  }
  if (+[CompactMonthWeekView usesRoundedRectInsteadOfCircle](CompactMonthWeekView, "usesRoundedRectInsteadOfCircle", v85))
  {
    v78 = v56;
  }
  else
  {
    v78 = v56 + 1.0;
  }
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v50, v52, v54, v78, v77));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attachedTodayCircle"));
  v81 = objc_msgSend(v80, "drawCircle");

  if (v81)
  {
    v82 = objc_claimAutoreleasedReturnValue(+[UIPointerLiftEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v75));

    v79 = 0;
    v76 = (void *)v82;
  }
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v76, v79));

  return v83;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6;
  CGFloat MidX;
  CGFloat MidY;
  NSArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSArray *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  CGPoint v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v6 = a4;
  objc_msgSend(v6, "rect");
  MidX = CGRectGetMidX(v25);
  objc_msgSend(v6, "rect");
  MidY = CGRectGetMidY(v26);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = self->_days;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
      objc_msgSend(v14, "frame", (_QWORD)v19);
      v24.x = MidX;
      v24.y = MidY;
      if (CGRectContainsPoint(v27, v24))
        break;
      if (v11 == (id)++v13)
      {
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v15 = v14;

    if (!v15)
      goto LABEL_13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray layer](v15, "layer"));
    objc_msgSend(v16, "setHidden:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray overlay](v15, "overlay"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
    objc_msgSend(v18, "setHidden:", 1);

    v9 = v15;
  }
LABEL_12:

LABEL_13:
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  CGFloat MidX;
  CGFloat MidY;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  CompactMonthWeekDayNumber *v16;
  void *v17;
  unsigned __int8 v18;
  CompactMonthWeekDayNumber *v19;
  CompactMonthWeekDayNumber *v20;
  id v21;
  _QWORD v22[4];
  CompactMonthWeekDayNumber *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  CGPoint v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "rect");
  MidX = CGRectGetMidX(v30);
  objc_msgSend(v7, "rect");
  MidY = CGRectGetMidY(v31);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = self->_days;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v21 = v8;
    v14 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(CompactMonthWeekDayNumber **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        -[CompactMonthWeekDayNumber frame](v16, "frame", v21);
        v29.x = MidX;
        v29.y = MidY;
        if (CGRectContainsPoint(v32, v29) && v16 != self->_today)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekDayNumber attachedTodayCircle](v16, "attachedTodayCircle"));
          v18 = objc_msgSend(v17, "drawCircle");

          if ((v18 & 1) == 0)
          {
            v19 = v16;
            goto LABEL_13;
          }
        }
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v13)
        continue;
      break;
    }
    v19 = 0;
LABEL_13:
    v8 = v21;
  }
  else
  {
    v19 = 0;
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000B53C8;
  v22[3] = &unk_1001B25D0;
  v23 = v19;
  v20 = v19;
  objc_msgSend(v8, "addCompletion:", v22);

}

+ (int64_t)_cellToStartDrawingInForViewWithCalendarDate:(id)a3 calendar:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  int64_t v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "date"));
  objc_msgSend(v5, "rangeOfUnit:inUnit:forDate:", 512, 4096, v6);
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:", 528, v6));

  v11 = CUIKOneIndexedWeekStart(v10);
  v12 = (char *)objc_msgSend(v9, "weekday");
  v13 = &v12[v8 - v11];
  if ((unint64_t)v12 > v11)
    v13 = &v12[-v11];
  if (v12 == (char *)v11)
    v14 = 0;
  else
    v14 = (int64_t)v13;

  return v14;
}

+ (BOOL)_viewForCalendarDateContainsFirstDayOfMonth:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  BOOL v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDateForMonth"));
  v5 = objc_msgSend(v4, "month");
  if (v5 == objc_msgSend(v3, "month"))
  {
    v6 = objc_msgSend(v4, "day");
    v7 = v6 == objc_msgSend(v3, "day");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_reloadMonthNameLabel
{
  _BOOL4 containsFirstDayOfMonth;
  UILabel *monthNameLabel;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  char *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  CGFloat v31;
  CGFloat v32;
  void *v33;
  void *v34;

  containsFirstDayOfMonth = self->_containsFirstDayOfMonth;
  monthNameLabel = self->_monthNameLabel;
  if (containsFirstDayOfMonth)
  {
    if (!monthNameLabel)
    {
      -[CompactMonthWeekView _initializeMonthNameLabel](self, "_initializeMonthNameLabel");
      monthNameLabel = self->_monthNameLabel;
    }
    v5 = -[UILabel setHidden:](monthNameLabel, "setHidden:", 0);
    v7 = CUIKTodayDate(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_startCalendarDate, "date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate calendarDateForEndOfMonth](self->_startCalendarDate, "calendarDateForEndOfMonth"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));

    v12 = 0;
    if (objc_msgSend(v9, "compare:", v8) != (id)1)
      v12 = objc_msgSend(v11, "compare:", v8) != (id)-1;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_startCalendarDate, "date"));
    v14 = CUIKStringForMonth();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CompactMonthViewController monthNameFont](CompactMonthViewController, "monthNameFont"));
    -[UILabel setFont:](self->_monthNameLabel, "setFont:", v16);

    v34 = v11;
    if (CUIKCurrentLocaleRequiresUnabbrevatedMonthNames())
    {
      v33 = v9;
      v17 = -[CompactMonthWeekView _monthLabelColumnIndex](self, "_monthLabelColumnIndex");
      v18 = (char *)-[CompactMonthWeekView _daysInAWeek](self, "_daysInAWeek") - 1;
      v19 = -[CompactMonthWeekView _monthLabelColumnIndex](self, "_monthLabelColumnIndex");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_startCalendarDate, "date"));
      v21 = CUIKLongStringForMonth();
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

      if ((char *)v17 != v18 && v19)
      {
        v23 = v22;

        v15 = v23;
      }
      v9 = v33;

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "capitalizedStringWithLocale:", v24));

    v26 = -[UILabel setText:](self->_monthNameLabel, "setText:", v25);
    if (v12)
    {
      v28 = CalendarAppTintColor(v26, v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
    }
    else
    {
      v29 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    }
    v30 = (void *)v29;
    -[UILabel setTextColor:](self->_monthNameLabel, "setTextColor:", v29);

    -[UILabel sizeToFit](self->_monthNameLabel, "sizeToFit");
    -[UILabel bounds](self->_monthNameLabel, "bounds");
    self->_monthNameLabelFittingSize.width = v31;
    self->_monthNameLabelFittingSize.height = v32;

  }
  else
  {
    -[UILabel setText:](monthNameLabel, "setText:", 0);
    -[UILabel setHidden:](self->_monthNameLabel, "setHidden:", 1);
  }
  -[CompactMonthWeekView setNeedsLayout](self, "setNeedsLayout");
}

- (unint64_t)_daysInAWeek
{
  return 7;
}

- (id)monthNameLabel
{
  UILabel *monthNameLabel;

  monthNameLabel = self->_monthNameLabel;
  if (!monthNameLabel)
  {
    -[CompactMonthWeekView _initializeMonthNameLabel](self, "_initializeMonthNameLabel");
    monthNameLabel = self->_monthNameLabel;
  }
  return monthNameLabel;
}

- (unint64_t)_monthLabelColumnIndex
{
  NSArray *days;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (!self->_containsFirstDayOfMonth)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  days = self->_days;
  v9 = 0x7FFFFFFFLL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B58DC;
  v5[3] = &unk_1001B4930;
  v5[4] = &v6;
  -[NSArray enumerateObjectsUsingBlock:](days, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isBackgroundScene
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windowScene"));
  v4 = objc_msgSend(v3, "activationState") == (id)2;

  return v4;
}

- (id)containerViewForOccurrencePreview
{
  return 0;
}

- (id)selectedEventsForEditMenu
{
  return 0;
}

- (id)presentationControllerForEditMenu
{
  return 0;
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
  -[CompactMonthWeekView layoutIfNeeded](self, "layoutIfNeeded");
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
    -[CompactMonthWeekView convertRect:fromView:](self, "convertRect:fromView:", self->_occurrencesView, v9, v11, v13, v15);
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
  CGFloat MaxY;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect result;

  v4 = a3;
  -[CompactMonthWeekView layoutIfNeeded](self, "layoutIfNeeded");
  -[MonthWeekOccurrencesView frameForOccurrenceAfterLastOnDay:](self->_occurrencesView, "frameForOccurrenceAfterLastOnDay:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CompactMonthWeekView convertRect:fromView:](self, "convertRect:fromView:", self->_occurrencesView, v6, v8, v10, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[CompactMonthWeekView bounds](self, "bounds");
  v22 = v21;
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.width = v18;
  v28.size.height = v20;
  MaxY = CGRectGetMaxY(v28);
  v24 = v22 - v20;
  if (MaxY <= v22)
    v24 = v16;
  v25 = v14;
  v26 = v18;
  v27 = v20;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v24;
  result.origin.x = v25;
  return result;
}

- (void)setHighlightedDayRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  id v7;
  uint64_t *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  NSMutableDictionary *v14;
  NSMutableDictionary *highlightedDays;
  NSArray *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  double v39;
  double v40;
  double v41;
  id v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *i;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id obj;
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];

  length = a3.length;
  location = a3.location;
  if (qword_1001F62D0 != -1)
    dispatch_once(&qword_1001F62D0, &stru_1001B4978);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = &qword_1001F62C8;
  if (v7 != (id)2)
    v8 = &qword_1001F62C0;
  v9 = (id)*v8;

  v10 = -[MonthWeekOccurrencesView dayCount](self->_occurrencesView, "dayCount");
  if (location + length <= v10)
    v11 = length;
  else
    v11 = v10 - location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
    v12 = length;
  else
    v12 = v11;
  if (location != self->_highlightedDayRange.location || v12 != self->_highlightedDayRange.length)
  {
    self->_highlightedDayRange.location = location;
    self->_highlightedDayRange.length = v12;
    if (!self->_highlightedDays)
    {
      v14 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 7);
      highlightedDays = self->_highlightedDays;
      self->_highlightedDays = v14;

    }
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v56 = v9;
    v16 = self->_days;
    v17 = (char *)-[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v71;
      while (2)
      {
        v21 = 0;
        v22 = &v18[(_QWORD)v19];
        do
        {
          if (*(_QWORD *)v71 != v20)
            objc_enumerationMutation(v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)v21), "calendarDate", v56));

          if (v23)
          {
            v22 = &v21[(_QWORD)v19];
            goto LABEL_28;
          }
          ++v21;
        }
        while (v18 != v21);
        v18 = (char *)-[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
        v19 = v22;
        if (v18)
          continue;
        break;
      }
    }
    else
    {
      v22 = 0;
    }
LABEL_28:

    -[CompactMonthWeekView rectForCells](self, "rectForCells");
    v25 = v24;
    v27 = v26;
    v59 = -[NSMutableDictionary mutableCopy](self->_highlightedDays, "mutableCopy");
    v28 = v56;
    if (v12 && location < v12 + location)
    {
      do
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", location, v56));
        v30 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_highlightedDays, "objectForKey:", v29));
        if (v30)
        {
          v31 = (id)v30;
          objc_msgSend(v59, "removeObjectForKey:", v29);
        }
        else
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_days, "objectAtIndexedSubscript:", &v22[location]));
          objc_msgSend(v32, "frame");
          v34 = v33;
          v36 = v35;

          *(_QWORD *)&v37 = objc_opt_class(self).n128_u64[0];
          objc_msgSend(v38, "grayLineHeight", v37);
          v40 = v39;
          *(_QWORD *)&v41 = objc_opt_class(self).n128_u64[0];
          objc_msgSend(v42, "grayLineHeight", v41);
          v44 = v43;
          if (&v22[location + 1] < (char *)-[NSArray count](self->_days, "count"))
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_days, "objectAtIndexedSubscript:", &v22[location + 1]));
            objc_msgSend(v45, "frame");
            v47 = v46;

            v36 = v47 - v34;
          }
          v48 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v34, v25 + v40, v36, v27 - v44);
          objc_msgSend(v48, "setBackgroundColor:", v28);
          objc_msgSend(v48, "setAlpha:", 0.0);
          -[CompactMonthWeekView addSubview:](self, "addSubview:", v48);
          v68[0] = _NSConcreteStackBlock;
          v68[1] = 3221225472;
          v68[2] = sub_1000B6130;
          v68[3] = &unk_1001B2538;
          v31 = v48;
          v69 = v31;
          +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v68, 0, 0.2, 0.0);
          -[NSMutableDictionary setObject:forKey:](self->_highlightedDays, "setObject:forKey:", v31, v29);

        }
        ++location;
        --v12;
      }
      while (v12);
    }
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "allKeys", v56));
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v50; i = (char *)i + 1)
        {
          if (*(_QWORD *)v65 != v51)
            objc_enumerationMutation(obj);
          v53 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKey:", v53));
          -[NSMutableDictionary removeObjectForKey:](self->_highlightedDays, "removeObjectForKey:", v53);
          v62[0] = _NSConcreteStackBlock;
          v62[1] = 3221225472;
          v62[2] = sub_1000B613C;
          v62[3] = &unk_1001B2538;
          v63 = v54;
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472;
          v60[2] = sub_1000B6148;
          v60[3] = &unk_1001B25D0;
          v61 = v63;
          v55 = v63;
          +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, v62, v60, 0.2, 0.0);

        }
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
      }
      while (v50);
    }

    v9 = v57;
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
  -[CompactMonthWeekView frame](self, "frame");
  MaxX = CGRectGetMaxX(v28);
  if (x > MaxX)
  {
    -[CompactMonthWeekView frame](self, "frame");
    MaxX = CGRectGetMaxX(v29);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startCalendarDate", MaxX));
  objc_msgSend(v8, "absoluteTime");
  v10 = v9;
  -[EKCalendarDate absoluteTime](self->_startCalendarDate, "absoluteTime");
  v12 = v11;

  if (v10 >= v12)
    v13 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startCalendarDate"));
  else
    v13 = self->_startCalendarDate;
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

- (NSArray)eventData
{
  return self->_eventData;
}

- (BOOL)compressedVerticalMode
{
  return self->_compressedVerticalMode;
}

- (BOOL)compressedHorizontalMode
{
  return self->_compressedHorizontalMode;
}

- (void)setCompressedHorizontalMode:(BOOL)a3
{
  self->_compressedHorizontalMode = a3;
}

- (BOOL)enableLayerAnimationsDuringLayout
{
  return self->_enableLayerAnimationsDuringLayout;
}

- (void)setEnableLayerAnimationsDuringLayout:(BOOL)a3
{
  self->_enableLayerAnimationsDuringLayout = a3;
}

- (BOOL)disableTodayPulse
{
  return self->_disableTodayPulse;
}

- (void)setDisableTodayPulse:(BOOL)a3
{
  self->_disableTodayPulse = a3;
}

- (BOOL)showWeekNumber
{
  return self->_showWeekNumber;
}

- (BOOL)temporarilyHideWeekNumber
{
  return self->_temporarilyHideWeekNumber;
}

- (UIFont)monthNameFont
{
  return self->_monthNameFont;
}

- (void)setMonthNameFont:(id)a3
{
  objc_storeStrong((id *)&self->_monthNameFont, a3);
}

- (BOOL)useLayoutMargins
{
  return self->_useLayoutMargins;
}

- (void)setUseLayoutMargins:(BOOL)a3
{
  self->_useLayoutMargins = a3;
}

- (UIColor)dayBadgeColor
{
  return self->_dayBadgeColor;
}

- (void)setDayBadgeColor:(id)a3
{
  objc_storeStrong((id *)&self->_dayBadgeColor, a3);
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (void)setMonthWeekScale:(double)a3
{
  self->_monthWeekScale = a3;
}

- (CompactMonthWeekViewDelegate)weekDelegate
{
  return (CompactMonthWeekViewDelegate *)objc_loadWeakRetained((id *)&self->_weekDelegate);
}

- (void)setWeekDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_weekDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weekDelegate);
  objc_storeStrong((id *)&self->_dayBadgeColor, 0);
  objc_storeStrong((id *)&self->_monthNameFont, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_highlightedDays, 0);
  objc_storeStrong((id *)&self->_secondOccurrences, 0);
  objc_storeStrong((id *)&self->_firstOccurrenceDict, 0);
  objc_storeStrong((id *)&self->_fadingInfos, 0);
  objc_storeStrong((id *)&self->_animationInfos, 0);
  objc_storeStrong((id *)&self->_occurrencesView, 0);
  objc_storeStrong((id *)&self->_selected, 0);
  objc_storeStrong((id *)&self->_today, 0);
  objc_storeStrong((id *)&self->_daySummaries, 0);
  objc_storeStrong((id *)&self->_days, 0);
  objc_storeStrong((id *)&self->_weekNumberLabel, 0);
  objc_storeStrong((id *)&self->_todayPulse, 0);
  objc_storeStrong((id *)&self->_monthNameLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_grayLine, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_endCalendarDate, 0);
  objc_storeStrong((id *)&self->_startCalendarDate, 0);
}

@end
