@implementation DayNavigationView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  int IsRegularInViewHierarchy;
  double v14;
  double v15;
  __n128 v16;
  double v17;
  id v18;
  double v19;
  double Width;
  double v21;
  double v22;
  int IsLeftToRight;
  void *v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
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
  double v45;
  double MinX;
  double MaxY;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  double v61;
  id v62;
  double v63;
  uint64_t v64;
  double v65;
  void *v66;
  int v67;
  double MaxX;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  objc_super v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  v76.receiver = self;
  v76.super_class = (Class)DayNavigationView;
  -[DayNavigationView layoutSubviews](&v76, "layoutSubviews");
  -[DayNavigationView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[DayNavigationWeekScrollView setClipsToBounds:](self->_weekScrollView, "setClipsToBounds:", EKUICurrentWidthSizeClassIsCompactInViewHierarchy(self, v11));
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self, v12);
  v14 = 0.0;
  v15 = 0.0;
  if (IsRegularInViewHierarchy)
  {
    v16.n128_f64[0] = v8
                    / ((double)-[DayNavigationWeekScrollView cellsDisplayed](self->_weekScrollView, "cellsDisplayed", 0.0)+ 0.4)* 0.2;
    CalFloorToScreenScale(v16);
    v14 = -6.0;
  }
  v17 = v4 + v14 + v15;
  v18 = -[DayNavigationWeekScrollView sizeThatFits:](self->_weekScrollView, "sizeThatFits:", v8 + v15 * -2.0, v10);
  Width = v19;
  v22 = v21;
  IsLeftToRight = CalInterfaceIsLeftToRight(v18);
  if (!-[DayNavigationView showWeekNumber](self, "showWeekNumber"))
    goto LABEL_21;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView traitCollection](self, "traitCollection"));
  v25 = EKUIPrefersLargerTextThanDefault();

  if (v25)
  {
    -[DayNavigationView layoutMargins](self, "layoutMargins");
    if (IsLeftToRight)
      v28 = v26;
    else
      v28 = v27;
    -[UILabel frame](self->_weekNumberLabel, "frame");
    v29 = v28 + CGRectGetWidth(v77);
    v78.origin.x = v17;
    v78.origin.y = v6;
    v78.size.width = Width;
    v78.size.height = v22;
    Width = CGRectGetWidth(v78);
    v79.origin.x = v4;
    v79.origin.y = v6;
    v79.size.width = v8;
    v79.size.height = v10;
    v30 = CGRectGetWidth(v79) - v29;
    if (Width >= v30)
      Width = v30;
    if (IsLeftToRight)
    {
      v80.origin.x = v17;
      v80.origin.y = v6;
      v80.size.width = Width;
      v80.size.height = v22;
      if (CGRectGetMinX(v80) < v29)
        goto LABEL_22;
    }
    else
    {
      v81.origin.x = v4;
      v81.origin.y = v6;
      v81.size.width = v8;
      v81.size.height = v10;
      v43 = CGRectGetMaxX(v81) - v29;
      v82.origin.x = v17;
      v82.origin.y = v6;
      v82.size.width = Width;
      v82.size.height = v22;
      if (CGRectGetMaxX(v82) > v43)
      {
        v83.origin.x = v17;
        v83.origin.y = v6;
        v83.size.width = Width;
        v83.size.height = v22;
        v29 = v43 - CGRectGetWidth(v83);
        goto LABEL_22;
      }
    }
LABEL_21:
    v29 = v17;
    goto LABEL_22;
  }
  if (EKUIIsExtended(self))
  {
    v31 = UIRectInsetEdges(10, v17, v6, Width, v22, 18.0);
    v6 = v32;
    v34 = v33;
    v22 = v35;
    -[DayNavigationView layoutMargins](self, "layoutMargins");
    v37 = v36;
    v39 = v38;
    -[DayNavigationView layoutMargins](self, "layoutMargins");
    if (!IsLeftToRight)
      v40 = v41;
    v42 = -(v39 + 9.0);
    if (IsLeftToRight)
      v42 = v37 + 9.0;
    v29 = v31 + v42;
    Width = v34 - v40;
  }
  else
  {
    v29 = UIRectInsetEdges(10, v17, v6, Width, v22, 36.0);
    v6 = v71;
    Width = v72;
    v22 = v73;
  }
LABEL_22:
  -[DayNavigationWeekScrollView setFrame:](self->_weekScrollView, "setFrame:", v29, v6, Width, v22);
  if (-[DayNavigationView showWeekNumber](self, "showWeekNumber"))
  {
    +[EKDayTimeView timeWidthForOrientation:inViewHierarchy:](EKDayTimeView, "timeWidthForOrientation:inViewHierarchy:", EKUIInterfaceOrientationForViewHierarchy(self), self);
    v45 = v44;
    -[DayNavigationView bounds](self, "bounds");
    MinX = CGRectGetMinX(v84);
    -[DayNavigationView bounds](self, "bounds");
    MaxY = CGRectGetMaxY(v85);
    CalRoundRectToScreenScale(MinX, v6, v45, MaxY);
    v50 = v49;
    v52 = v51;
    v54 = v53;
    if ((IsLeftToRight & 1) == 0)
    {
      -[DayNavigationView bounds](self, "bounds");
      v55 = CGRectGetWidth(v86);
      v48 = CalRoundToScreenScale(v56, v57, v55 - v45);
    }
    -[UIView setFrame:](self->_weekNumberLabelBackgroundView, "setFrame:", v48, v50, v52, v54);
    -[UIView frame](self->_weekNumberLabelBackgroundView, "frame");
    v59 = v58;
    +[WeekAllDayView baselineForWeekdayLabelsWithSizeClass:](WeekAllDayView, "baselineForWeekdayLabelsWithSizeClass:", EKUIWidthSizeClassForViewHierarchy(self));
    v61 = v59 + v60;
    v62 = -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_weekNumberLabel, "_firstLineBaselineOffsetFromBoundsTop");
    v65 = CalRoundToScreenScale(v62, v64, v61 - v63);
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView traitCollection](self, "traitCollection"));
    v67 = EKUIPrefersLargerTextThanDefault();

    if (v67)
    {
      MaxX = 2.0;
      if ((IsLeftToRight & 1) == 0)
      {
        v87.origin.x = v29;
        v87.origin.y = v6;
        v87.size.width = Width;
        v87.size.height = v22;
        MaxX = CGRectGetMaxX(v87);
      }
    }
    else
    {
      -[DayNavigationView paletteSafeAreaInsets](self, "paletteSafeAreaInsets");
      if (IsLeftToRight)
        MaxX = v69 + 20.0;
      else
        MaxX = v70 + 16.0;
    }
    -[UILabel sizeThatFits:](self->_weekNumberLabel, "sizeThatFits:", 10.0, 10.0);
    -[UILabel setFrame:](self->_weekNumberLabel, "setFrame:", MaxX, v65, v74, v75);
  }
}

- (void)setSelectedDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSDate *selectedDate;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  int v14;
  void *v15;

  v4 = a4;
  v7 = a3;
  if (v7)
  {
    selectedDate = self->_selectedDate;
    if (!selectedDate || !-[NSDate isEqualToDate:](selectedDate, "isEqualToDate:", v7))
    {
      objc_storeStrong((id *)&self->_selectedDate, a3);
      -[DayNavigationWeekScrollView cancelScrollingAnimation](self->_weekScrollView, "cancelScrollingAnimation");
      -[DayNavigationWeekScrollView setSelectedDate:animated:](self->_weekScrollView, "setSelectedDate:animated:", v7, v4);
      -[DayNavigationView _updateWeekNumberLabel](self, "_updateWeekNumberLabel");
    }
  }
  else
  {
    v9 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      v11 = (objc_class *)objc_opt_class(self);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = 138412290;
      v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "nil selected date provided.  Will not update [%@]", (uint8_t *)&v14, 0xCu);

    }
  }

}

- (void)dayNavigationWeekScrollView:(id)a3 didChangeCellWidth:(double)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView delegate](self, "delegate", a3));

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[DayNavigationView delegate](self, "delegate"));
    objc_msgSend(v7, "dayNavigationView:didChangeCellWidth:", self, a4);

  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  UIView *weekNumberLabelBackgroundView;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DayNavigationView;
  -[DayNavigationView setBackgroundColor:](&v6, "setBackgroundColor:", v4);
  -[DayNavigationWeekScrollView setBackgroundColor:](self->_weekScrollView, "setBackgroundColor:", v4);
  if (-[DayNavigationView showWeekNumber](self, "showWeekNumber"))
  {
    -[UILabel setBackgroundColor:](self->_weekNumberLabel, "setBackgroundColor:", v4);
    weekNumberLabelBackgroundView = self->_weekNumberLabelBackgroundView;
    if (weekNumberLabelBackgroundView)
      -[UIView setBackgroundColor:](weekNumberLabelBackgroundView, "setBackgroundColor:", v4);
  }

}

- (void)_updateFontSizes
{
  id v3;
  void *v4;

  v3 = objc_msgSend((id)objc_opt_class(self), "_weekNumberFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[UILabel setFont:](self->_weekNumberLabel, "setFont:", v4);

  -[DayNavigationView setNeedsLayout](self, "setNeedsLayout");
}

+ (id)_weekNumberFont
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 16.0, 23.0);
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
}

- (DayNavigationWeekScrollView)weekScrollView
{
  return self->_weekScrollView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  int IsCompactInViewHierarchy;
  void *v7;
  uint64_t v8;
  int v9;
  double v10;
  double v11;
  DayNavigationWeekScrollView *weekScrollView;
  void *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  double v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(self, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView traitCollection](self, "traitCollection"));
  v9 = EKUIUsesRoundedRectsInsteadOfCircles(v7, v8);

  if (IsCompactInViewHierarchy)
  {
    if (v9)
    {
      -[DayNavigationWeekScrollView sizeThatFits:](self->_weekScrollView, "sizeThatFits:", width, height);
      v11 = v10 + 10.0;
    }
    else
    {
      v11 = 50.0;
    }
  }
  else
  {
    weekScrollView = self->_weekScrollView;
    if (v9)
    {
      -[DayNavigationWeekScrollView sizeThatFits:](weekScrollView, "sizeThatFits:", width, height);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView cellFactory](weekScrollView, "cellFactory"));
      objc_msgSend(objc_msgSend(v13, "cellClass"), "circleDiameter");
      v15 = v14 + 4.0;

      v16 = fmax(v15, 41.0);
      v17 = CUIKGetOverlayCalendar();
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

      if (v18)
        v11 = v16 + 17.0;
      else
        v11 = v16;
    }
  }
  v19 = width;
  result.height = v11;
  result.width = v19;
  return result;
}

- (id)dayNavigationWeekScrollView:(id)a3 dayDataForDate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView delegate](self, "delegate"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dayNavigationView:dayDataForDate:", self, v5));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)dayNavigationWeekScrollViewIsLoadingSpecialDayData:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView delegate](self, "delegate", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView delegate](self, "delegate"));
    objc_msgSend(v5, "dayNavigationViewIsLoadingSpecialDayData:", self);

  }
  return 0;
}

- (DayNavigationViewDelegate)delegate
{
  return (DayNavigationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setShowWeekNumber:(BOOL)a3
{
  UIView *v4;
  UIView *weekNumberLabelBackgroundView;
  void *v6;
  UILabel *v7;
  UILabel *weekNumberLabel;
  id v9;
  void *v10;
  void *v11;
  UILabel *v12;

  if (self->_showWeekNumber != a3)
  {
    self->_showWeekNumber = a3;
    if (a3)
    {
      if (qword_1001F64C8 != -1)
        dispatch_once(&qword_1001F64C8, &stru_1001B5178);
      v4 = objc_opt_new(UIView);
      weekNumberLabelBackgroundView = self->_weekNumberLabelBackgroundView;
      self->_weekNumberLabelBackgroundView = v4;

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[UIView setBackgroundColor:](self->_weekNumberLabelBackgroundView, "setBackgroundColor:", v6);

      -[DayNavigationView addSubview:](self, "addSubview:", self->_weekNumberLabelBackgroundView);
      v7 = objc_opt_new(UILabel);
      weekNumberLabel = self->_weekNumberLabel;
      self->_weekNumberLabel = v7;

      v9 = objc_msgSend((id)objc_opt_class(self), "_weekNumberFont");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      -[UILabel setFont:](self->_weekNumberLabel, "setFont:", v10);

      -[UILabel setTextColor:](self->_weekNumberLabel, "setTextColor:", qword_1001F64C0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](self->_weekNumberLabel, "setBackgroundColor:", v11);

      -[DayNavigationView addSubview:](self, "addSubview:", self->_weekNumberLabel);
      -[DayNavigationView _updateWeekNumberLabel](self, "_updateWeekNumberLabel");
    }
    else
    {
      -[UILabel removeFromSuperview](self->_weekNumberLabel, "removeFromSuperview");
      v12 = self->_weekNumberLabel;
      self->_weekNumberLabel = 0;

    }
    -[DayNavigationView setNeedsLayout](self, "setNeedsLayout");
    -[DayNavigationView _updateFontSizes](self, "_updateFontSizes");
  }
}

- (void)setPaletteSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_paletteSafeAreaInsets = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  -[DayNavigationView _stopPulsingToday](self, "_stopPulsingToday", a3);
  -[DayNavigationWeekScrollView didScroll](self->_weekScrollView, "didScroll");
}

- (void)_stopPulsingToday
{
  -[DayNavigationWeekScrollView stopPulsingToday](self->_weekScrollView, "stopPulsingToday");
}

- (DayNavigationView)initWithCalendar:(id)a3 selectedDate:(id)a4 cellFactory:(id)a5 eventSpringLoadingEnabled:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  id v12;
  id v13;
  double y;
  double width;
  double height;
  DayNavigationView *v17;
  DayNavigationView *v18;
  uint64_t v19;
  NSTimeZone *timeZone;
  DayNavigationWeekScrollView *v21;
  DayNavigationWeekScrollView *weekScrollView;
  ScrollSpringFactory *v23;
  ScrollSpringFactory *springFactory;
  void *v25;
  double v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  objc_super v32;
  uint64_t v33;

  v6 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v32.receiver = self;
  v32.super_class = (Class)DayNavigationView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v17 = -[DayNavigationView initWithFrame:](&v32, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_calendar, a3);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timeZone"));
    timeZone = v18->_timeZone;
    v18->_timeZone = (NSTimeZone *)v19;

    v21 = -[DayNavigationWeekScrollView initWithFrame:calendar:selectedDate:cellFactory:eventSpringLoadingEnabled:]([DayNavigationWeekScrollView alloc], "initWithFrame:calendar:selectedDate:cellFactory:eventSpringLoadingEnabled:", v11, v12, v13, v6, CGRectZero.origin.x, y, width, height);
    weekScrollView = v18->_weekScrollView;
    v18->_weekScrollView = v21;

    -[DayNavigationWeekScrollView setDelegate:](v18->_weekScrollView, "setDelegate:", v18);
    -[DayNavigationWeekScrollView setNavDelegate:](v18->_weekScrollView, "setNavDelegate:", v18);
    -[DayNavigationView addSubview:](v18, "addSubview:", v18->_weekScrollView);
    v23 = (ScrollSpringFactory *)objc_alloc_init((Class)ScrollSpringFactory);
    springFactory = v18->_springFactory;
    v18->_springFactory = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[DayNavigationView setBackgroundColor:](v18, "setBackgroundColor:", v25);

    -[DayNavigationView setSelectedDate:animated:](v18, "setSelectedDate:animated:", v12, 0);
    -[DayNavigationView updateShowWeekNumber](v18, "updateShowWeekNumber");
    *(_QWORD *)&v26 = objc_opt_class(UITraitHorizontalSizeClass).n128_u64[0];
    v33 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1, v26));
    v29 = -[DayNavigationView registerForTraitChanges:withAction:](v18, "registerForTraitChanges:withAction:", v28, "updateShowWeekNumber");

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v30, "addObserver:selector:name:object:", v18, "_dayTimeViewHourWidthChanged", EKDayTimeViewHourWidthChangedNotification, 0);

  }
  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, EKDayTimeViewHourWidthChangedNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)DayNavigationView;
  -[DayNavigationView dealloc](&v4, "dealloc");
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DayNavigationView;
  -[DayNavigationView layoutMarginsDidChange](&v3, "layoutMarginsDidChange");
  -[DayNavigationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)willTransitionToSize
{
  -[DayNavigationWeekScrollView willTransitionToSize](self->_weekScrollView, "willTransitionToSize");
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  ScrollSpringFactory *springFactory;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[7];

  v4 = a3;
  -[DayNavigationWeekScrollView _pageDecelerationTarget](self->_weekScrollView, "_pageDecelerationTarget");
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView selectedDateAfterScrollingToPoint:](self->_weekScrollView, "selectedDateAfterScrollingToPoint:"));
  objc_storeStrong((id *)&self->_selectedDate, v9);
  -[DayNavigationWeekScrollView setSelectedDateWithoutScrolling:](self->_weekScrollView, "setSelectedDateWithoutScrolling:", v9);
  -[DayNavigationView _updateWeekNumberLabel](self, "_updateWeekNumberLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView delegate](self, "delegate"));

  if (v10)
  {
    CalAnalyticsSendEventLazy(CFSTR("UserNavigated"), &stru_1001B5158);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView delegate](self, "delegate"));
    objc_msgSend(v11, "dayNavigationView:selectedDateChanged:", self, v9);

  }
  objc_msgSend(v4, "contentOffset");
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend(v4, "_horizontalVelocity");
  if (v17 < 0.0)
    v17 = -v17;
  v18 = v13 - v6;
  if (v13 - v6 < 0.0)
    v18 = -(v13 - v6);
  -[ScrollSpringFactory setInitialVelocity:](self->_springFactory, "setInitialVelocity:", EKUIScaleFactor(v16) * (v17 / v18) * 1000.0);
  objc_msgSend(v4, "stopScrollingAndZooming");
  v19 = springAnimationDuration(objc_msgSend(v4, "setContentOffset:animated:", 0, v13, v15));
  springFactory = self->_springFactory;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000E0E58;
  v24[3] = &unk_1001B2810;
  v24[4] = self;
  *(double *)&v24[5] = v6;
  v24[6] = v8;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000E0E74;
  v22[3] = &unk_1001B2F58;
  v22[4] = self;
  v23 = v4;
  v21 = v4;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393222, springFactory, v24, v22, v19, 0.0);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[DayNavigationWeekScrollView setNeedsLayout](self->_weekScrollView, "setNeedsLayout", a3);
  -[DayNavigationWeekScrollView didFinishScrolling](self->_weekScrollView, "didFinishScrolling");
  -[DayNavigationWeekScrollView updateHighlightIfNeeded](self->_weekScrollView, "updateHighlightIfNeeded");
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  -[DayNavigationWeekScrollView setNeedsLayout](self->_weekScrollView, "setNeedsLayout", a3);
  -[DayNavigationWeekScrollView didFinishScrolling](self->_weekScrollView, "didFinishScrolling");
  -[DayNavigationWeekScrollView updateHighlightIfNeeded](self->_weekScrollView, "updateHighlightIfNeeded");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[DayNavigationWeekScrollView cancelScrollingAnimation](self->_weekScrollView, "cancelScrollingAnimation", a3);
  -[DayNavigationWeekScrollView willBeginDragging](self->_weekScrollView, "willBeginDragging");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  -[DayNavigationWeekScrollView willEndDraggingTargetX:](self->_weekScrollView, "willEndDraggingTargetX:", a3, a5->x, a4.y);
}

- (BOOL)dayNavigationWeekScrollViewAllowedToChangeSelectedDate
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView delegate](self, "delegate"));

  if (!v3)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView delegate](self, "delegate"));
  v5 = objc_msgSend(v4, "dayNavigationViewAllowedToChangeSelectedDate");

  return v5;
}

- (void)dayNavigationWeekScrollViewFailedToSelectDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView delegate](self, "delegate"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView delegate](self, "delegate"));
    objc_msgSend(v5, "dayNavigationViewFailedToSelectDate:", v6);

  }
}

- (void)dayNavigationWeekScrollView:(id)a3 selectedDateChanged:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  -[DayNavigationView setSelectedDate:animated:](self, "setSelectedDate:animated:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView delegate](self, "delegate"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView delegate](self, "delegate"));
    objc_msgSend(v6, "dayNavigationView:selectedDateChanged:", self, v7);

  }
}

- (BOOL)showWeekNumber
{
  return self->_showWeekNumber;
}

- (void)setCalendar:(id)a3
{
  NSTimeZone *v5;
  NSTimeZone *timeZone;
  id v7;

  objc_storeStrong((id *)&self->_calendar, a3);
  v7 = a3;
  -[DayNavigationWeekScrollView setSelectedDate:animated:](self->_weekScrollView, "setSelectedDate:animated:", self->_selectedDate, 0);
  -[DayNavigationWeekScrollView setCalendar:](self->_weekScrollView, "setCalendar:", v7);
  v5 = (NSTimeZone *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timeZone"));
  timeZone = self->_timeZone;
  self->_timeZone = v5;

}

- (void)significantTimeChangeOccurred
{
  -[DayNavigationWeekScrollView significantTimeChangeOccurred](self->_weekScrollView, "significantTimeChangeOccurred");
}

- (void)contentSizeCategoryChanged
{
  -[DayNavigationWeekScrollView contentSizeCategoryChanged](self->_weekScrollView, "contentSizeCategoryChanged");
  -[DayNavigationView _updateFontSizes](self, "_updateFontSizes");
}

- (BOOL)canAnimateToDate:(id)a3
{
  return -[DayNavigationWeekScrollView canAnimateToDate:](self->_weekScrollView, "canAnimateToDate:", a3);
}

- (void)pulseToday
{
  -[DayNavigationWeekScrollView pulseToday](self->_weekScrollView, "pulseToday");
}

- (void)updateShowWeekNumber
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  if ((objc_msgSend(v4, "showWeekNumbers") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationView traitCollection](self, "traitCollection"));
    -[DayNavigationView setShowWeekNumber:](self, "setShowWeekNumber:", objc_msgSend(v3, "horizontalSizeClass") == (id)2);

  }
  else
  {
    -[DayNavigationView setShowWeekNumber:](self, "setShowWeekNumber:", 0);
  }

}

- (void)_updateWeekNumberLabel
{
  NSCalendar *calendar;
  void *v4;
  id v5;
  NSCalendar *v6;
  NSDate *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  if (self->_showWeekNumber)
  {
    calendar = self->_calendar;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView startDateOfSelectedWeek](self->_weekScrollView, "startDateOfSelectedWeek"));
    v5 = -[NSCalendar component:fromDate:](calendar, "component:fromDate:", 0x2000, v4);

    v6 = self->_calendar;
    v7 = objc_opt_new(NSDate);
    v8 = -[NSCalendar component:fromDate:](v6, "component:fromDate:", 0x2000, v7);

    if (v5 == v8)
      v11 = CalendarAppTintColor(v9, v10);
    else
      v11 = WeekendTextColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[UILabel setTextColor:](self->_weekNumberLabel, "setTextColor:", v12);

    *(_QWORD *)&v13 = objc_opt_class(self).n128_u64[0];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v14, v13));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("W%@"), &stru_1001B67C0, 0));
    v17 = CUIKLocalizedStringForInteger(v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v18));
    -[UILabel setText:](self->_weekNumberLabel, "setText:", v19);

    -[UILabel sizeToFit](self->_weekNumberLabel, "sizeToFit");
  }
  -[DayNavigationView setNeedsLayout](self, "setNeedsLayout");
}

- (UIEdgeInsets)paletteSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_paletteSafeAreaInsets.top;
  left = self->_paletteSafeAreaInsets.left;
  bottom = self->_paletteSafeAreaInsets.bottom;
  right = self->_paletteSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_weekNumberLabelBackgroundView, 0);
  objc_storeStrong((id *)&self->_weekNumberLabel, 0);
  objc_storeStrong((id *)&self->_weekScrollView, 0);
  objc_storeStrong((id *)&self->_springFactory, 0);
  objc_storeStrong((id *)&self->_selectedDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
