@implementation CompactMonthViewController

+ (double)scrubbingMinimumPressDuration
{
  return 0.1;
}

+ (id)dividedModeBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompactMonthViewController;
  -[CompactMonthViewController viewIsAppearing:](&v4, "viewIsAppearing:", a3);
  -[CompactMonthViewController ekui_adjustNavAndToolBarToTranslucentGrayStyles](self, "ekui_adjustNavAndToolBarToTranslucentGrayStyles");
}

- (void)weekNumbersPrefChanged
{
  void *v3;
  unsigned __int8 v4;
  _QWORD v5[4];
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v4 = objc_msgSend(v3, "showWeekNumbers");

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EF3A4;
  v5[3] = &unk_1001B31F0;
  v6 = v4;
  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v5);
}

- (void)updatePalette:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "setTodayButtonVisible:", 0);
  objc_msgSend(v4, "setDateStringVisible:", 1);
  objc_msgSend(v4, "setWeekdayHeaderVisible:", 1);
  objc_msgSend(v4, "setDividerLineVisible:", 1);
  objc_msgSend(v4, "setDayScrubberController:", 0);
  objc_msgSend(v4, "setFocusBannerPlacement:", 1);
  objc_msgSend(v4, "sizeToFit");
  objc_msgSend(v4, "frame");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containingPalette"));

  objc_msgSend(v7, "setPreferredHeight:", v6);
  self->_previousViewWidth = 0.0;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CompactMonthViewController view](self, "view"));
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  Class v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;

  v11.receiver = self;
  v11.super_class = (Class)CompactMonthViewController;
  -[MonthViewController viewDidAppear:](&v11, "viewDidAppear:", a3);
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedDate](self->super.super.super._model, "selectedDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);

  }
  -[CUIKCalendarModel simulateFirstLoadFinished](self->super.super.super._model, "simulateFirstLoadFinished");
}

- (void)viewDidLayoutSubviews
{
  double previousViewWidth;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CompactMonthViewController;
  -[InfiniteScrollViewController viewDidLayoutSubviews](&v9, "viewDidLayoutSubviews");
  previousViewWidth = self->_previousViewWidth;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v6 = vabdd_f64(previousViewWidth, v5);

  if (v6 >= 2.22044605e-16)
  {
    -[CompactMonthViewController _updateDayHeaderFrames](self, "_updateDayHeaderFrames");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthViewController view](self, "view"));
    objc_msgSend(v7, "bounds");
    self->_previousViewWidth = v8;

  }
}

- (double)palleteViewXOffset
{
  return 0.0;
}

- (BOOL)pinchToZoomAllowed
{
  return 0;
}

- (BOOL)showsYearInMonthLabel
{
  return 0;
}

- (void)didScroll
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController firstViewOnScreen](self, "firstViewOnScreen"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDate"));

  v4 = objc_msgSend(v7, "weekOfMonth");
  if (v4 == objc_msgSend(v7, "weeksInMonth"))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calendarDateByAddingWeeks:", 1));

    v7 = (id)v5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthViewController navigationController](self, "navigationController"));
  objc_msgSend(v6, "setNavBarStringFromDate:includeMonth:includeYear:", v7, 1, -[CompactMonthViewController showsYearInMonthLabel](self, "showsYearInMonthLabel"));

}

- (id)dayHeaderFrames
{
  void *v3;
  void *v4;
  CompactMonthWeekView *v5;
  CompactMonthWeekView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  unint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthViewController navigationController](self, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "paletteView"));

  if (!v4)
    goto LABEL_8;
  v5 = (CompactMonthWeekView *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController firstView](self, "firstView"));
  if (v5)
    goto LABEL_4;
  v6 = [CompactMonthWeekView alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v7, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v5 = -[CompactMonthWeekView initWithCalendarDate:calendar:compressed:](v6, "initWithCalendarDate:calendar:compressed:", v9, v10, 0);

  -[CompactMonthWeekView frame](v5, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthViewController view](self, "view"));
  objc_msgSend(v17, "frame");
  v19 = v18;

  -[CompactMonthWeekView setFrame:](v5, "setFrame:", v12, v14, v19, v16);
  if (v5)
  {
LABEL_4:
    -[CompactMonthWeekView layoutIfNeeded](v5, "layoutIfNeeded");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthWeekView dayNumberCellFrames](v5, "dayNumberCellFrames"));
    v21 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v20, "count"));
    if (objc_msgSend(v20, "count"))
    {
      v22 = 0;
      do
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", v22));
        objc_msgSend(v23, "CGRectValue");
        v25 = v24;
        v27 = v26;

        -[CompactMonthViewController palleteViewXOffset](self, "palleteViewXOffset");
        v29 = v25 + v28;
        objc_msgSend(v4, "bounds");
        v31 = v30;
        objc_msgSend(v4, "bounds");
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v29, v31, v27));
        objc_msgSend(v21, "addObject:", v32);

        ++v22;
      }
      while (v22 < (unint64_t)objc_msgSend(v20, "count"));
    }

  }
  else
  {
LABEL_8:
    v21 = 0;
  }

  return v21;
}

- (void)_updateDayHeaderFrames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthViewController navigationController](self, "navigationController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "paletteView"));

  v4 = v8;
  if (v8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthViewController dayHeaderFrames](self, "dayHeaderFrames"));
    objc_msgSend(v8, "setDayHeaderFrames:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));

    if (v7)
    {
      EKUIPushFallbackSizingContextWithViewHierarchy(v7);
      EKUIPopFallbackSizingContextWithViewHierarchy(v7);
    }

    v4 = v8;
  }

}

- (void)setShouldRespondToApplicationDidBecomeActiveStateChange:(BOOL)a3
{
  self->_applicationResuming = a3;
}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  return !self->_applicationResuming;
}

- (void)contentSizeCategoryChanged
{
  void *v3;
  objc_super v4;

  v3 = (void *)qword_1001F6550;
  qword_1001F6550 = 0;

  qword_1001F6558 = 0;
  +[CompactMonthWeekView clearCalculatedValues](CompactMonthWeekView, "clearCalculatedValues");
  v4.receiver = self;
  v4.super_class = (Class)CompactMonthViewController;
  -[MonthViewController contentSizeCategoryChanged](&v4, "contentSizeCategoryChanged");
}

+ (id)monthNameFont
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)qword_1001F6550;
  if (!qword_1001F6550)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleTitle3, 32770, 0));
    v4 = objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
    v5 = (void *)qword_1001F6550;
    qword_1001F6550 = v4;

    v6 = (void *)qword_1001F6550;
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 20.0, 35.0);
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fontWithSize:"));
    v8 = (void *)qword_1001F6550;
    qword_1001F6550 = v7;

    v2 = (void *)qword_1001F6550;
  }
  return v2;
}

- (double)topInsetForSubviewWithCalendarDate:(id)a3
{
  return 0.0;
}

+ (double)topOfMonthNameLabelToGrayLineDistance
{
  void *v2;
  double v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "monthNameFont"));
  v3 = *(double *)&qword_1001F6558;
  if (*(double *)&qword_1001F6558 == 0.0)
  {
    v4 = objc_alloc_init((Class)UILabel);
    objc_msgSend(v4, "setText:", CFSTR("0"));
    objc_msgSend(v4, "setFont:", v2);
    objc_msgSend(v4, "sizeToFit");
    objc_msgSend(v4, "_firstLineBaselineOffsetFromBoundsTop");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", UIFontTextStyleTitle3));
    objc_msgSend(v7, "scaledValueForValue:", 6.5);
    v9 = v8;

    *(double *)&qword_1001F6558 = v6 + v9;
    v3 = *(double *)&qword_1001F6558;
  }

  return v3;
}

+ (double)minimumWeekScale
{
  return 1.0;
}

+ (double)maximumWeekScale
{
  return 5.0;
}

- (double)monthWeekScale
{
  return 1.0;
}

@end
