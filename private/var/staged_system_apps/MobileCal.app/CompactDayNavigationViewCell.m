@implementation CompactDayNavigationViewCell

- (void)setIsToday:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompactDayNavigationViewCell;
  -[DayNavigationViewCell setIsToday:](&v4, "setIsToday:", a3);
  -[TappableDayNumber setIsToday:](self->_dateNumber, "setIsToday:", -[DayNavigationViewCell isToday](self, "isToday"));
  -[CompactDayNavigationViewCell _updateTextColor](self, "_updateTextColor");
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CompactDayNavigationViewCell;
  -[CompactDayNavigationViewCell setNeedsDisplay](&v3, "setNeedsDisplay");
  -[TappableDayNumber setNeedsDisplay](self->_dateNumber, "setNeedsDisplay");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CompactDayNavigationViewCell;
  -[CompactDayNavigationViewCell setBackgroundColor:](&v7, "setBackgroundColor:", v4);
  -[TappableDayNumber setBackgroundColor:](self->_dateNumber, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_monthAnimationStateDayNumber, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_monthAnimationStateOverlay, "setBackgroundColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  if ((objc_msgSend(v4, "isEqual:", v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[UIImageView setBackgroundColor:](self->_dayBadge, "setBackgroundColor:", v6);

  }
  else
  {
    -[UIImageView setBackgroundColor:](self->_dayBadge, "setBackgroundColor:", v4);
  }

}

- (void)setMatchesMonthView:(BOOL)a3
{
  if (self->_matchesMonthView != a3)
  {
    self->_matchesMonthView = a3;
    -[CompactDayNavigationViewCell _updateToMatchMonthViewIfNeeded](self, "_updateToMatchMonthViewIfNeeded");
  }
}

- (void)setDate:(id)a3 forceStringUpdate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell date](self, "date"));
  v8 = objc_msgSend(v6, "isEqualToDate:", v7);

  if (!v8 || v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)CompactDayNavigationViewCell;
    -[DayNavigationViewCell setDate:](&v14, "setDate:", v6);
    v9 = objc_alloc((Class)EKCalendarDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone calendarTimeZone](NSTimeZone, "calendarTimeZone"));
    v11 = objc_msgSend(v9, "initWithDate:timeZone:", v6, v10);

    v12 = CUIKLocalizedStringForInteger(objc_msgSend(v11, "day"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[CompactDayNavigationViewCell setDisplayedString:](self, "setDisplayedString:", v13);

    -[CompactDayNavigationViewCell updateOverlay](self, "updateOverlay");
    -[CompactDayNavigationViewCell setBadgeType:](self, "setBadgeType:", 0);

  }
}

- (void)setDisplayedString:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_displayString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_displayString, a3);
    -[CompactDayNavigationViewCell _updateDisplayedString](self, "_updateDisplayedString");
  }

}

- (void)setDate:(id)a3
{
  -[CompactDayNavigationViewCell setDate:forceStringUpdate:](self, "setDate:forceStringUpdate:", a3, 0);
}

- (CompactDayNavigationViewCell)initWithFrame:(CGRect)a3 loadMonthAnimationState:(BOOL)a4 hasOverlay:(BOOL)a5 sizeClass:(int64_t)a6
{
  _BOOL4 v8;
  CompactDayNavigationViewCell *v9;
  CompactDayNavigationViewCell *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;
  uint64_t v21;

  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CompactDayNavigationViewCell;
  v9 = -[DayNavigationViewCell initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    v9->_monthAnimationState = 0;
    v9->_hasOverlay = a5;
    -[CompactDayNavigationViewCell _createSubviewsWithSizeClass:](v9, "_createSubviewsWithSizeClass:", a6);
    if (v8)
      -[CompactDayNavigationViewCell _createMonthAnimationStateModeSubviews](v10, "_createMonthAnimationStateModeSubviews");
    -[CompactDayNavigationViewCell layoutSubviews](v10, "layoutSubviews");
    -[CompactDayNavigationViewCell setCircled:](v10, "setCircled:", 0);
    objc_msgSend((id)objc_opt_class(v10), "standardCircleDiameterForSizeClass:", a6);
    v10->_circleDiameter = v11;
    objc_msgSend((id)objc_opt_class(v10), "overlayCircleDiameterForSizeClass:", a6);
    v10->_circleDiameterOverlay = v12;
    objc_msgSend((id)objc_opt_class(v10), "largeOverlayCircleDiameterForSizeClass:", a6);
    v10->_circleDiameterOverlayLarge = v13;
    objc_initWeak(&location, v10);
    v21 = objc_opt_class(UITraitUserInterfaceStyle);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100028710;
    v17[3] = &unk_1001B2418;
    objc_copyWeak(&v18, &location);
    v15 = -[CompactDayNavigationViewCell registerForTraitChanges:withHandler:](v10, "registerForTraitChanges:withHandler:", v14, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v10;
}

- (void)setCircled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  if (-[DayNavigationViewCell circled](self, "circled") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)CompactDayNavigationViewCell;
    -[DayNavigationViewCell setCircled:](&v7, "setCircled:", v5);
    -[TappableDayNumber setCircled:animated:](self->_dateNumber, "setCircled:animated:", v5, v4);
    -[CompactDayNavigationViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCircled:(BOOL)a3
{
  -[CompactDayNavigationViewCell setCircled:animated:](self, "setCircled:animated:", a3, 1);
}

- (void)_updateDisplayedString
{
  TappableDayNumber *dateNumber;
  UILabel *monthAnimationStateDayNumber;

  dateNumber = self->_dateNumber;
  if (dateNumber)
    -[TappableDayNumber setText:](dateNumber, "setText:", self->_displayString);
  monthAnimationStateDayNumber = self->_monthAnimationStateDayNumber;
  if (monthAnimationStateDayNumber)
  {
    -[UILabel setText:](monthAnimationStateDayNumber, "setText:", self->_displayString);
    -[CompactDayNavigationViewCell _updateTextColor](self, "_updateTextColor");
  }
  -[CompactDayNavigationViewCell _updateToMatchMonthViewIfNeeded](self, "_updateToMatchMonthViewIfNeeded");
  -[CompactDayNavigationViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateOverlay
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v3 = CUIKGetOverlayCalendar(self, a2);
  v10 = (id)objc_claimAutoreleasedReturnValue(v3);
  if (v10)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell date](self, "date"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKDateStrings overlayShortStringForDate:inCalendar:](CUIKDateStrings, "overlayShortStringForDate:inCalendar:", v4, v10));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell date](self, "date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "components:fromDate:", 24, v6));

    v8 = 0.0;
    if (objc_msgSend(v7, "day") != (id)1
      || (v8 = 1.0, objc_msgSend(v7, "month") != (id)1)
      || (v9 = 1.5, objc_msgSend(v7, "isLeapMonth")))
    {
      v9 = v8;
    }

  }
  else
  {
    v5 = 0;
    v9 = 0.0;
  }
  -[CompactDayNavigationViewCell setOverlayString:](self, "setOverlayString:", v5);
  -[CompactDayNavigationViewCell setUnderlineThickness:](self, "setUnderlineThickness:", v9);
  -[CompactDayNavigationViewCell _updateToMatchMonthViewIfNeeded](self, "_updateToMatchMonthViewIfNeeded");

}

- (void)setUnderlineThickness:(double)a3
{
  -[TappableDayNumber setUnderlineThickness:](self->_dateNumber, "setUnderlineThickness:", a3);
}

- (void)setOverlayString:(id)a3
{
  NSString *v5;
  NSString **p_overlayString;
  NSString *overlayString;
  unsigned __int8 v8;
  TappableDayNumber *dateNumber;
  UILabel *monthAnimationStateOverlay;
  NSString *v11;

  v5 = (NSString *)a3;
  p_overlayString = &self->_overlayString;
  overlayString = self->_overlayString;
  if (overlayString != v5)
  {
    v11 = v5;
    if (!v5 || (v8 = -[NSString isEqualToString:](overlayString, "isEqualToString:", v5), v5 = v11, (v8 & 1) == 0))
    {
      objc_storeStrong((id *)&self->_overlayString, a3);
      self->_hasOverlay = -[NSString length](v11, "length") != 0;
      dateNumber = self->_dateNumber;
      if (dateNumber)
        -[TappableDayNumber setOverlayText:](dateNumber, "setOverlayText:", *p_overlayString);
      monthAnimationStateOverlay = self->_monthAnimationStateOverlay;
      if (monthAnimationStateOverlay)
      {
        -[UILabel setText:](monthAnimationStateOverlay, "setText:", *p_overlayString);
        -[CompactDayNavigationViewCell _updateTextColor](self, "_updateTextColor");
      }
      -[CompactDayNavigationViewCell _updateToMatchMonthViewIfNeeded](self, "_updateToMatchMonthViewIfNeeded");
      -[CompactDayNavigationViewCell setNeedsLayout](self, "setNeedsLayout");
      v5 = v11;
    }
  }

}

- (void)_createSubviewsWithSizeClass:(int64_t)a3
{
  TappableDayNumber *v4;
  TappableDayNumber *dateNumber;
  void *v6;
  UIImageView *v7;
  UIImageView *dayBadge;

  if (!self->_dateNumber)
  {
    v4 = -[TappableDayNumber initWithSizeClass:]([TappableDayNumber alloc], "initWithSizeClass:", a3);
    dateNumber = self->_dateNumber;
    self->_dateNumber = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayNavigationViewCell backgroundColor](self, "backgroundColor"));
    -[TappableDayNumber setBackgroundColor:](self->_dateNumber, "setBackgroundColor:", v6);

    -[TappableDayNumber setUserInteractionEnabled:](self->_dateNumber, "setUserInteractionEnabled:", 0);
    -[TappableDayNumber setIsToday:](self->_dateNumber, "setIsToday:", -[DayNavigationViewCell isToday](self, "isToday"));
    -[CompactDayNavigationViewCell addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, "touchDownOccurred:", 1);
    -[CompactDayNavigationViewCell addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, "touchUpOccurred:", 64);
    -[CompactDayNavigationViewCell addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, "touchCancelled:", 128);
    -[CompactDayNavigationViewCell addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, "touchCancelled:", 256);
    -[CompactDayNavigationViewCell addSubview:](self, "addSubview:", self->_dateNumber);
    v7 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    dayBadge = self->_dayBadge;
    self->_dayBadge = v7;

    -[UIImageView setClipsToBounds:](self->_dayBadge, "setClipsToBounds:", 1);
    -[UIImageView setHidden:](self->_dayBadge, "setHidden:", 1);
    -[CompactDayNavigationViewCell addSubview:](self, "addSubview:", self->_dayBadge);
  }
}

+ (double)standardCircleDiameterForSizeClass:(int64_t)a3
{
  double result;

  EKUIMultiwindowAssert(a3 != 0, CFSTR("Unspecified size class"));
  result = 35.0;
  if (a3 == 2)
    return 28.0;
  return result;
}

+ (double)overlayCircleDiameterForSizeClass:(int64_t)a3
{
  EKUIMultiwindowAssert(a3 != 0, CFSTR("Unspecified size class"));
  return 35.0;
}

+ (double)largeOverlayCircleDiameterForSizeClass:(int64_t)a3
{
  _BOOL4 v3;

  v3 = a3 == 2;
  EKUIMultiwindowAssert(a3 != 0, CFSTR("Unspecified size class"));
  return dbl_1001A1360[v3];
}

- (void)setIsWeekend:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompactDayNavigationViewCell;
  -[DayNavigationViewCell setIsWeekend:](&v4, "setIsWeekend:", a3);
  -[TappableDayNumber setIsWeekend:](self->_dateNumber, "setIsWeekend:", -[DayNavigationViewCell isWeekend](self, "isWeekend"));
  -[CompactDayNavigationViewCell _updateTextColor](self, "_updateTextColor");
}

- (void)_updateTextColor
{
  UIColor *weekendColor;
  UIColor *v4;
  uint64_t v5;
  UIColor *v6;

  if (self->_monthAnimationStateDayNumber)
  {
    if (-[DayNavigationViewCell isWeekend](self, "isWeekend"))
    {
      weekendColor = self->_weekendColor;
      if (weekendColor)
      {
        v4 = weekendColor;
      }
      else
      {
        v5 = WeekendTextColor();
        v4 = (UIColor *)objc_claimAutoreleasedReturnValue(v5);
      }
    }
    else
    {
      v4 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    }
    v6 = v4;
    -[UILabel setTextColor:](self->_monthAnimationStateDayNumber, "setTextColor:", v4);
    -[UILabel setTextColor:](self->_monthAnimationStateOverlay, "setTextColor:", v6);

  }
}

- (void)_updateToMatchMonthViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *displayString;
  NSString *overlayString;
  double v10;
  double v11;
  double v12;

  +[CompactMonthWeekView dayNumberFontSize:](CompactMonthWeekView, "dayNumberFontSize:", -[CompactDayNavigationViewCell verticallyCompressedState](self, "verticallyCompressedState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TappableDayNumber normalFontForSize:](TappableDayNumber, "normalFontForSize:"));
  -[UILabel setFont:](self->_monthAnimationStateDayNumber, "setFont:", v3);

  +[CompactMonthWeekView dayNumberOverlayFontSize:](CompactMonthWeekView, "dayNumberOverlayFontSize:", -[CompactDayNavigationViewCell verticallyCompressedState](self, "verticallyCompressedState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TappableDayNumber overlayFontForSize:](TappableDayNumber, "overlayFontForSize:"));
  -[UILabel setFont:](self->_monthAnimationStateOverlay, "setFont:", v4);

  if (-[CompactDayNavigationViewCell matchesMonthView](self, "matchesMonthView"))
  {
    +[CompactMonthWeekView dayNumberFontSize:](CompactMonthWeekView, "dayNumberFontSize:", -[CompactDayNavigationViewCell verticallyCompressedState](self, "verticallyCompressedState"));
    -[CompactDayNavigationViewCell setFontSize:](self, "setFontSize:");
    -[CompactDayNavigationViewCell fontSize](self, "fontSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
    -[UILabel setFont:](self->_monthAnimationStateDayNumber, "setFont:", v5);

    +[CompactMonthWeekView dayNumberOverlayFontSize:](CompactMonthWeekView, "dayNumberOverlayFontSize:", -[CompactDayNavigationViewCell verticallyCompressedState](self, "verticallyCompressedState"));
    -[CompactDayNavigationViewCell setOverlayFontSize:](self, "setOverlayFontSize:");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayNavigationViewCell traitCollection](self, "traitCollection"));
    -[CompactDayNavigationViewCell setUsesRoundedRectInsteadOfCircle:](self, "setUsesRoundedRectInsteadOfCircle:", EKUIUsesRoundedRectsInsteadOfCircles(v6, v7));

    if (-[CompactDayNavigationViewCell usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle"))
    {
      displayString = self->_displayString;
      overlayString = self->_overlayString;
      -[CompactDayNavigationViewCell fontSize](self, "fontSize");
      v11 = v10;
      -[CompactDayNavigationViewCell overlayFontSize](self, "overlayFontSize");
      +[CompactMonthWeekTodayCircle roundedRectSizeForNumberString:overlayString:fontSize:overlayFontSize:](CompactMonthWeekTodayCircle, "roundedRectSizeForNumberString:overlayString:fontSize:overlayFontSize:", displayString, overlayString, v11, v12);
      -[DayNavigationViewCell setRoundedRectSize:](self, "setRoundedRectSize:");
    }
    -[CompactDayNavigationViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)verticallyCompressedState
{
  return self->_verticallyCompressedState;
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
  -[TappableDayNumber setUsesRoundedRectInsteadOfCircle:](self->_dateNumber, "setUsesRoundedRectInsteadOfCircle:", a3);
}

- (void)setOverlayFontSize:(double)a3
{
  id v5;

  -[TappableDayNumber setOverlayFontSize:](self->_dateNumber, "setOverlayFontSize:");
  if (self->_monthAnimationStateOverlay)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[TappableDayNumber overlayFontForSize:](TappableDayNumber, "overlayFontForSize:", a3));
    -[UILabel setFont:](self->_monthAnimationStateOverlay, "setFont:", v5);

  }
}

- (void)setFontSize:(double)a3
{
  uint64_t v4;
  id v5;

  -[TappableDayNumber setFontSize:](self->_dateNumber, "setFontSize:", a3);
  if (self->_monthAnimationStateDayNumber)
  {
    if (self->_monthAnimationState)
    {
      -[CompactDayNavigationViewCell fontSize](self, "fontSize");
      v4 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
    }
    else
    {
      -[CompactDayNavigationViewCell fontSize](self, "fontSize");
      v4 = objc_claimAutoreleasedReturnValue(+[TappableDayNumber normalFontForSize:](TappableDayNumber, "normalFontForSize:"));
    }
    v5 = (id)v4;
    -[UILabel setFont:](self->_monthAnimationStateDayNumber, "setFont:", v4);

  }
}

- (BOOL)matchesMonthView
{
  return self->_matchesMonthView;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double MidX;
  CGFloat Width;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  double v38;
  double v39;
  int IsRightToLeft;
  double v41;
  double v42;
  double v43;
  double v44;
  double MinX;
  double v46;
  CGFloat MinY;
  void *v48;
  UILabel *monthAnimationStateDayNumber;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  UILabel *monthAnimationStateOverlay;
  double v58;
  CGFloat v59;
  CGFloat height;
  CGFloat v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  CGFloat MaxY;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double rect;
  void *recta;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  -[TappableDayNumber frame](self->_dateNumber, "frame");
  v4 = v3;
  v6 = v5;
  if (-[CompactDayNavigationViewCell usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle"))
  {
    -[DayNavigationViewCell roundedRectSize](self, "roundedRectSize");
    v8 = v7;
    v10 = v9;
  }
  else
  {
    -[CompactDayNavigationViewCell _circleDiameter](self, "_circleDiameter");
    v8 = v11;
    v10 = v11;
  }
  -[CompactDayNavigationViewCell bounds](self, "bounds");
  MidX = CGRectGetMidX(v75);
  v76.origin.x = v4;
  v76.origin.y = v6;
  v76.size.width = v8;
  v76.size.height = v10;
  Width = CGRectGetWidth(v76);
  v16 = CalRoundToScreenScale(v14, v15, MidX + Width * -0.5);
  if (-[CompactDayNavigationViewCell monthAnimationState](self, "monthAnimationState")
    || -[CompactDayNavigationViewCell applyMonthAnimationStateAdjustments](self, "applyMonthAnimationStateAdjustments"))
  {
    +[CompactMonthWeekView dayNumberLayerYOffsetCompressed:containsFirstDayOfMonth:](CompactMonthWeekView, "dayNumberLayerYOffsetCompressed:containsFirstDayOfMonth:", -[CompactDayNavigationViewCell verticallyCompressedState](self, "verticallyCompressedState"), 0);
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber titleLabel](self->_dateNumber, "titleLabel"));
    objc_msgSend(v19, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber titleLabel](self->_dateNumber, "titleLabel"));
    -[CompactDayNavigationViewCell convertRect:fromView:](self, "convertRect:fromView:", v28, v21, v23, v25, v27);
    v30 = v29;

    v33 = v18 + (v30 - v10) * 0.5;
  }
  else
  {
    -[CompactDayNavigationViewCell yCenterForDayNumbers](self, "yCenterForDayNumbers");
    v35 = v34;
    v77.origin.x = v16;
    v77.origin.y = v6;
    v77.size.width = v8;
    v77.size.height = v10;
    v33 = v35 + CGRectGetHeight(v77) * -0.5;
  }
  v36 = CalRoundToScreenScale(v31, v32, v33);
  -[TappableDayNumber setFrame:](self->_dateNumber, "setFrame:", v16, v36, v8, v10);
  v37 = objc_msgSend((id)objc_opt_class(self), "badgeDiameter");
  v39 = v38;
  IsRightToLeft = CUIKLocaleIsRightToLeft(v37);
  v41 = v16;
  v42 = v36;
  v43 = v8;
  v44 = v10;
  if (IsRightToLeft)
    MinX = CGRectGetMinX(*(CGRect *)&v41);
  else
    MinX = CGRectGetMaxX(*(CGRect *)&v41);
  v46 = MinX - v39 * 0.5;
  v78.origin.x = v16;
  v78.origin.y = v36;
  v78.size.width = v8;
  v78.size.height = v10;
  MinY = CGRectGetMinY(v78);
  CalRoundRectToScreenScale(v46, MinY + -1.0, v39, v39);
  -[UIImageView setFrame:](self->_dayBadge, "setFrame:");
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_dayBadge, "layer"));
  objc_msgSend(v48, "setCornerRadius:", v39 * 0.5);

  monthAnimationStateDayNumber = self->_monthAnimationStateDayNumber;
  if (monthAnimationStateDayNumber)
  {
    -[UILabel sizeToFit](monthAnimationStateDayNumber, "sizeToFit");
    -[UILabel frame](self->_monthAnimationStateDayNumber, "frame");
    v51 = v50;
    v53 = v52;
    -[CompactDayNavigationViewCell bounds](self, "bounds");
    rect = (v54 - v51) * 0.5;
    +[CompactMonthWeekView dayNumberLayerYOffsetCompressed:containsFirstDayOfMonth:](CompactMonthWeekView, "dayNumberLayerYOffsetCompressed:containsFirstDayOfMonth:", -[CompactDayNavigationViewCell verticallyCompressedState](self, "verticallyCompressedState"), 0);
    v56 = v55;
    monthAnimationStateOverlay = self->_monthAnimationStateOverlay;
    if (monthAnimationStateOverlay)
    {
      -[UILabel sizeToFit](monthAnimationStateOverlay, "sizeToFit");
      -[UILabel frame](self->_monthAnimationStateOverlay, "frame");
      v71 = v8;
      v72 = v16;
      v58 = v79.size.width;
      v59 = v53;
      height = v79.size.height;
      v61 = CGRectGetHeight(v79);
      v56 = v56 - CalRoundToScreenScale(v62, v63, (v61 + -2.0) * 0.5 + 1.0);
      -[CompactDayNavigationViewCell bounds](self, "bounds");
      v65 = (v64 - v58) * 0.5;
      v80.origin.x = rect;
      v80.origin.y = v56;
      v80.size.width = v51;
      v80.size.height = v59;
      MaxY = CGRectGetMaxY(v80);
      v67 = v58;
      v68 = height;
      v53 = v59;
      v8 = v71;
      v16 = v72;
      CalRoundRectToScreenScale(v65, MaxY + -2.0, v67, v68);
      -[UILabel setFrame:](self->_monthAnimationStateOverlay, "setFrame:");
    }
    CalRoundRectToScreenScale(rect, v56, v51, v53);
    -[UILabel setFrame:](self->_monthAnimationStateDayNumber, "setFrame:");
  }
  if (self->_badgeType)
  {
    if (self->_monthAnimationStateDayBadge)
    {
      +[CompactMonthWeekView dayTypeBadgeFrameFromDayNumberFrame:compressed:](CompactMonthWeekView, "dayTypeBadgeFrameFromDayNumberFrame:compressed:", -[CompactDayNavigationViewCell verticallyCompressedState](self, "verticallyCompressedState"), v16, v36, v8, v10);
      v70 = v69;
      -[UIImageView setFrame:](self->_monthAnimationStateDayBadge, "setFrame:");
      recta = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_monthAnimationStateDayBadge, "layer"));
      objc_msgSend(recta, "setCornerRadius:", v70 * 0.5);

    }
  }
}

- (double)yCenterForDayNumbers
{
  unsigned int v3;
  double result;
  double v5;

  v3 = -[CompactDayNavigationViewCell usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle");
  result = 21.0;
  if (v3)
  {
    -[DayNavigationViewCell roundedRectSize](self, "roundedRectSize", 21.0);
    return v5 * 0.5;
  }
  return result;
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return -[TappableDayNumber usesRoundedRectInsteadOfCircle](self->_dateNumber, "usesRoundedRectInsteadOfCircle");
}

- (BOOL)monthAnimationState
{
  return self->_monthAnimationState;
}

- (BOOL)applyMonthAnimationStateAdjustments
{
  return self->_applyMonthAnimationStateAdjustments;
}

- (double)_circleDiameter
{
  void *v4;
  void *v5;
  id v6;
  int *v7;
  void *v9;

  if (-[CompactDayNavigationViewCell usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CompactDayNavigationViewCell.m"), 616, CFSTR("Should not have tried to get the circle diameter for a rounded rect."));

  }
  if (self->_hasOverlay)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber text](self->_dateNumber, "text"));
    if ((unint64_t)objc_msgSend(v4, "length") >= 2)
    {

      v7 = &OBJC_IVAR___CompactDayNavigationViewCell__circleDiameterOverlayLarge;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber overlayText](self->_dateNumber, "overlayText"));
      v6 = objc_msgSend(v5, "length");

      v7 = &OBJC_IVAR___CompactDayNavigationViewCell__circleDiameterOverlay;
      if ((unint64_t)v6 > 2)
        v7 = &OBJC_IVAR___CompactDayNavigationViewCell__circleDiameterOverlayLarge;
    }
  }
  else
  {
    v7 = &OBJC_IVAR___CompactDayNavigationViewCell__circleDiameter;
  }
  return *(double *)((char *)&self->super.super.super.super.super.isa + *v7);
}

+ (double)badgeDiameter
{
  return 14.0;
}

- (void)setBadgeType:(int64_t)a3
{
  if (self->_badgeType != a3)
  {
    self->_badgeType = a3;
    -[CompactDayNavigationViewCell _updateBadge](self, "_updateBadge");
  }
}

- (void)setBadgeLocale:(id)a3
{
  unint64_t v5;
  NSString *badgeLocale;
  unsigned __int8 v7;
  unint64_t v8;

  v5 = (unint64_t)a3;
  badgeLocale = self->_badgeLocale;
  if (v5 | (unint64_t)badgeLocale)
  {
    v8 = v5;
    v7 = -[NSString isEqual:](badgeLocale, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_badgeLocale, a3);
      -[CompactDayNavigationViewCell _updateBadge](self, "_updateBadge");
      v5 = v8;
    }
  }

}

- (void)setBadgeColor:(id)a3
{
  unint64_t v5;
  UIColor *badgeColor;
  unsigned __int8 v7;
  unint64_t v8;

  v5 = (unint64_t)a3;
  badgeColor = self->_badgeColor;
  if (v5 | (unint64_t)badgeColor)
  {
    v8 = v5;
    v7 = -[UIColor isEqual:](badgeColor, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_badgeColor, a3);
      -[CompactDayNavigationViewCell _updateBadge](self, "_updateBadge");
      v5 = v8;
    }
  }

}

- (void)stopPulsing
{
  EKUITodayCirclePulseView *pulseView;
  EKUITodayCirclePulseView *v4;

  pulseView = self->_pulseView;
  if (pulseView)
  {
    -[EKUITodayCirclePulseView removeFromSuperview](pulseView, "removeFromSuperview");
    v4 = self->_pulseView;
    self->_pulseView = 0;

  }
}

+ (double)roundedRectHeightToMatchMonthView
{
  double v2;
  double v3;
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  double result;

  +[CompactMonthWeekView dayNumberFontSize:](CompactMonthWeekView, "dayNumberFontSize:", 0);
  v3 = v2;
  v4 = +[CompactMonthWeekView dayNumberOverlayFontSize:](CompactMonthWeekView, "dayNumberOverlayFontSize:", 0);
  v6 = v5;
  v8 = CUIKGetOverlayCalendar(v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9 != 0;

  +[CompactMonthWeekTodayCircle roundedRectHeightWithOverlay:fontSize:overlayFontSize:](CompactMonthWeekTodayCircle, "roundedRectHeightWithOverlay:fontSize:overlayFontSize:", v10, v3, v6);
  return result;
}

+ (double)contentHeightForFontSize:(double)a3 overlayFontSize:(double)a4
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TappableDayNumber circledFontForSize:](TappableDayNumber, "circledFontForSize:", a3));
  objc_msgSend(v5, "lineHeight");
  v7 = v6;

  if (a4 > 0.0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TappableDayNumber overlayFontForSize:](TappableDayNumber, "overlayFontForSize:", a4));
    objc_msgSend(v8, "lineHeight");
    v7 = v7 + v9;

  }
  return v7;
}

- (CompactDayNavigationViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CUIKGetOverlayCalendar(self, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9 != 0;

  return -[CompactDayNavigationViewCell initWithFrame:loadMonthAnimationState:hasOverlay:sizeClass:](self, "initWithFrame:loadMonthAnimationState:hasOverlay:sizeClass:", 0, v10, 1, x, y, width, height);
}

- (void)prepareForReuse
{
  -[CompactDayNavigationViewCell setCircled:](self, "setCircled:", 0);
  -[CompactDayNavigationViewCell setIsToday:](self, "setIsToday:", 0);
  -[CompactDayNavigationViewCell setIsWeekend:](self, "setIsWeekend:", 0);
  -[CompactDayNavigationViewCell setBadgeType:](self, "setBadgeType:", 0);
}

- (CGRect)circleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TappableDayNumber frame](self->_dateNumber, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

+ (double)circleDiameter
{
  return 35.0;
}

- (void)_createMonthAnimationStateModeSubviews
{
  UILabel *v3;
  UILabel *monthAnimationStateDayNumber;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  monthAnimationStateDayNumber = self->_monthAnimationStateDayNumber;
  self->_monthAnimationStateDayNumber = v3;

  -[UILabel setTextAlignment:](self->_monthAnimationStateDayNumber, "setTextAlignment:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayNavigationViewCell backgroundColor](self, "backgroundColor"));
  -[UILabel setBackgroundColor:](self->_monthAnimationStateDayNumber, "setBackgroundColor:", v5);

  -[CompactDayNavigationViewCell addSubview:](self, "addSubview:", self->_monthAnimationStateDayNumber);
  -[CompactDayNavigationViewCell _loadMonthAnimationStateOverlayIfNeeded](self, "_loadMonthAnimationStateOverlayIfNeeded");
  -[CompactDayNavigationViewCell _loadMonthAnimationStateBadgeIfNeeded](self, "_loadMonthAnimationStateBadgeIfNeeded");
  if (self->_monthAnimationState)
  {
    -[CompactDayNavigationViewCell fontSize](self, "fontSize");
    v6 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
  }
  else
  {
    -[UILabel setAlpha:](self->_monthAnimationStateDayNumber, "setAlpha:", 0.0);
    -[UILabel setAlpha:](self->_monthAnimationStateOverlay, "setAlpha:", 0.0);
    -[UIImageView setAlpha:](self->_monthAnimationStateDayBadge, "setAlpha:", 0.0);
    -[CompactDayNavigationViewCell fontSize](self, "fontSize");
    v6 = objc_claimAutoreleasedReturnValue(+[TappableDayNumber normalFontForSize:](TappableDayNumber, "normalFontForSize:"));
  }
  v7 = (id)v6;
  -[UILabel setFont:](self->_monthAnimationStateDayNumber, "setFont:", v6);

}

- (void)setMonthAnimationState:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;

  if (self->_monthAnimationState != a3)
  {
    v3 = a3;
    self->_monthAnimationState = a3;
    if (a3)
      v5 = 0.0;
    else
      v5 = 1.0;
    if (a3)
      v6 = 1.0;
    else
      v6 = 0.0;
    -[TappableDayNumber setAlpha:](self->_dateNumber, "setAlpha:", v5);
    -[UIImageView setAlpha:](self->_dayBadge, "setAlpha:", v5);
    -[UILabel setAlpha:](self->_monthAnimationStateDayNumber, "setAlpha:", v6);
    -[UILabel setAlpha:](self->_monthAnimationStateOverlay, "setAlpha:", v6);
    -[CompactDayNavigationViewCell _updateMonthAnimationStateBadgeToState:](self, "_updateMonthAnimationStateBadgeToState:", v3);
  }
}

- (void)setApplyMonthAnimationStateAdjustments:(BOOL)a3
{
  if (self->_applyMonthAnimationStateAdjustments != a3)
  {
    self->_applyMonthAnimationStateAdjustments = a3;
    -[CompactDayNavigationViewCell _updateMonthAnimationStateBadgeToState:](self, "_updateMonthAnimationStateBadgeToState:");
  }
}

- (void)_loadMonthAnimationStateOverlayIfNeeded
{
  UILabel *v3;
  UILabel *monthAnimationStateOverlay;
  void *v5;
  void *v6;

  if (self->_hasOverlay && !self->_monthAnimationStateOverlay)
  {
    v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    monthAnimationStateOverlay = self->_monthAnimationStateOverlay;
    self->_monthAnimationStateOverlay = v3;

    -[UILabel setTextAlignment:](self->_monthAnimationStateOverlay, "setTextAlignment:", 1);
    -[CompactDayNavigationViewCell overlayFontSize](self, "overlayFontSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TappableDayNumber overlayFontForSize:](TappableDayNumber, "overlayFontForSize:"));
    -[UILabel setFont:](self->_monthAnimationStateOverlay, "setFont:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayNavigationViewCell backgroundColor](self, "backgroundColor"));
    -[UILabel setBackgroundColor:](self->_monthAnimationStateOverlay, "setBackgroundColor:", v6);

    -[CompactDayNavigationViewCell addSubview:](self, "addSubview:", self->_monthAnimationStateOverlay);
  }
}

- (void)_loadMonthAnimationStateBadgeIfNeeded
{
  UIImageView *v3;
  UIImageView *monthAnimationStateDayBadge;
  void *v5;

  if (!self->_monthAnimationStateDayBadge)
  {
    v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    monthAnimationStateDayBadge = self->_monthAnimationStateDayBadge;
    self->_monthAnimationStateDayBadge = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView backgroundColor](self->_dayBadge, "backgroundColor"));
    -[UIImageView setBackgroundColor:](self->_monthAnimationStateDayBadge, "setBackgroundColor:", v5);

    -[CompactDayNavigationViewCell addSubview:](self, "addSubview:", self->_monthAnimationStateDayBadge);
  }
}

- (void)_updateMonthAnimationStateBadgeToState:(BOOL)a3
{
  UIImageView *monthAnimationStateDayBadge;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  int64_t badgeType;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  monthAnimationStateDayBadge = self->_monthAnimationStateDayBadge;
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](monthAnimationStateDayBadge, "image"));

    if (v5)
    {
LABEL_10:
      -[UIImageView setAlpha:](self->_monthAnimationStateDayBadge, "setAlpha:", 1.0);
      -[UIImageView setAlpha:](self->_dayBadge, "setAlpha:", 0.0);
      -[CompactDayNavigationViewCell fontSize](self, "fontSize");
      v13 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
      goto LABEL_11;
    }
    +[CompactMonthWeekView dayTypeBadgeDiameter:](CompactMonthWeekView, "dayTypeBadgeDiameter:", -[CompactDayNavigationViewCell verticallyCompressedState](self, "verticallyCompressedState"));
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayNavigationViewCell traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v8, "userInterfaceStyle");

    badgeType = self->_badgeType;
    if (badgeType == 3)
    {
      v14 = BadgeImageForAlternateWorkday(self->_badgeColor, v9, self->_badgeLocale, v7);
      v12 = objc_claimAutoreleasedReturnValue(v14);
    }
    else
    {
      if (badgeType != 1)
      {
LABEL_9:
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[CompactMonthWeekView dayTypeBadgeBackgroundColorForVerticallyCompressedMode:](CompactMonthWeekView, "dayTypeBadgeBackgroundColorForVerticallyCompressedMode:", -[CompactDayNavigationViewCell verticallyCompressedState](self, "verticallyCompressedState")));
        -[UIImageView setBackgroundColor:](self->_monthAnimationStateDayBadge, "setBackgroundColor:", v16);

        goto LABEL_10;
      }
      v11 = BadgeImageForHoliday(self->_badgeColor, v9, self->_badgeLocale, v7);
      v12 = objc_claimAutoreleasedReturnValue(v11);
    }
    v15 = (void *)v12;
    -[UIImageView setImage:](self->_monthAnimationStateDayBadge, "setImage:", v12);

    goto LABEL_9;
  }
  -[UIImageView setAlpha:](monthAnimationStateDayBadge, "setAlpha:", 0.0);
  -[UIImageView setAlpha:](self->_dayBadge, "setAlpha:", 1.0);
  -[CompactDayNavigationViewCell fontSize](self, "fontSize");
  v13 = objc_claimAutoreleasedReturnValue(+[TappableDayNumber normalFontForSize:](TappableDayNumber, "normalFontForSize:"));
LABEL_11:
  v17 = (id)v13;
  -[UILabel setFont:](self->_monthAnimationStateDayNumber, "setFont:", v13);

}

- (void)setVerticallyCompressedState:(BOOL)a3
{
  self->_verticallyCompressedState = a3;
  -[CompactDayNavigationViewCell _updateToMatchMonthViewIfNeeded](self, "_updateToMatchMonthViewIfNeeded");
}

- (void)setWeekendColor:(id)a3
{
  id v5;
  TappableDayNumber *dateNumber;
  unsigned int v7;
  void *v8;
  id v9;

  v5 = a3;
  dateNumber = self->_dateNumber;
  v9 = v5;
  if (dateNumber)
  {
    -[TappableDayNumber setWeekendColor:](dateNumber, "setWeekendColor:", v5);
LABEL_5:
    v8 = v9;
    goto LABEL_6;
  }
  objc_storeStrong((id *)&self->_weekendColor, a3);
  v7 = -[DayNavigationViewCell isWeekend](self, "isWeekend");
  v8 = v9;
  if (v7)
  {
    -[UILabel setTextColor:](self->_monthAnimationStateDayNumber, "setTextColor:", v9);
    -[UILabel setTextColor:](self->_monthAnimationStateOverlay, "setTextColor:", v9);
    goto LABEL_5;
  }
LABEL_6:

}

- (UIColor)weekendColor
{
  UIColor *v2;

  if (self->_dateNumber)
    v2 = (UIColor *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber weekendColor](self->_dateNumber, "weekendColor"));
  else
    v2 = self->_weekendColor;
  return v2;
}

- (void)setCircleDiameter:(double)a3 overlayDiameter:(double)a4 largeOverlayDiameter:(double)a5
{
  self->_circleDiameter = a3;
  self->_circleDiameterOverlay = a4;
  self->_circleDiameterOverlayLarge = a5;
  -[CompactDayNavigationViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (id)badgeColor
{
  UIColor *badgeColor;

  badgeColor = self->_badgeColor;
  if (badgeColor)
    return badgeColor;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
}

- (id)badgeLocale
{
  return self->_badgeLocale;
}

- (void)_updateBadge
{
  void *v3;
  void *v4;
  id v5;
  int64_t badgeType;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayNavigationViewCell badgeColor](self, "badgeColor"));

  if (!v3)
    goto LABEL_8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayNavigationViewCell traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  badgeType = self->_badgeType;
  if (badgeType == 3)
  {
    objc_msgSend((id)objc_opt_class(self), "badgeDiameter");
    v14 = v13;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayNavigationViewCell badgeColor](self, "badgeColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayNavigationViewCell badgeLocale](self, "badgeLocale"));
    v15 = BadgeImageForAlternateWorkday(v9, v5, v10, v14);
    v12 = objc_claimAutoreleasedReturnValue(v15);
  }
  else
  {
    if (badgeType != 1)
      goto LABEL_8;
    objc_msgSend((id)objc_opt_class(self), "badgeDiameter");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayNavigationViewCell badgeColor](self, "badgeColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayNavigationViewCell badgeLocale](self, "badgeLocale"));
    v11 = BadgeImageForHoliday(v9, v5, v10, v8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
  }
  v16 = (id)v12;

  if (v16)
  {
    -[UIImageView setImage:](self->_dayBadge, "setImage:", v16);
    -[UIImageView setHidden:](self->_dayBadge, "setHidden:", 0);

    return;
  }
LABEL_8:
  -[UIImageView setHidden:](self->_dayBadge, "setHidden:", 1);
}

- (double)fontSize
{
  double result;

  -[TappableDayNumber fontSize](self->_dateNumber, "fontSize");
  return result;
}

- (double)overlayFontSize
{
  double result;

  -[TappableDayNumber overlayFontSize](self->_dateNumber, "overlayFontSize");
  return result;
}

- (double)contentWidth
{
  TappableDayNumber *dateNumber;
  double v3;
  double v4;
  double result;

  dateNumber = self->_dateNumber;
  -[CompactDayNavigationViewCell bounds](self, "bounds");
  -[TappableDayNumber sizeThatFits:](dateNumber, "sizeThatFits:", v3, v4);
  return result;
}

- (double)baselineOffsetFromTop
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  -[TappableDayNumber firstLineBaselineOffsetFromBoundsTop](self->_dateNumber, "firstLineBaselineOffsetFromBoundsTop");
  v4 = v3;
  -[TappableDayNumber frame](self->_dateNumber, "frame");
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TappableDayNumber superview](self->_dateNumber, "superview"));
  -[CompactDayNavigationViewCell convertPoint:fromView:](self, "convertPoint:fromView:", v9, v6, v8);
  v11 = v10;

  return v4 + v11;
}

- (void)setLabelElementsVisible:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CompactDayNavigationViewCell;
  -[DayNavigationViewCell setLabelElementsVisible:](&v5, "setLabelElementsVisible:");
  -[TappableDayNumber setHidden:](self->_dateNumber, "setHidden:", !v3);
}

- (double)_circleXForDiameter:(double)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;

  v4 = -[CompactDayNavigationViewCell bounds](self, "bounds");
  v6 = (v5 - a3) * 0.5 + -1.0 / EKUIScaleFactor(v4);
  return CalRoundToScreenScale(v7, v8, v6);
}

- (void)touchDownOccurred:(id)a3
{
  -[TappableDayNumber setPressed:](self->_dateNumber, "setPressed:", 1);
}

- (void)touchUpOccurred:(id)a3
{
  void *v4;
  id v5;

  -[TappableDayNumber setPressed:](self->_dateNumber, "setPressed:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell delegate](self, "delegate"));

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCell delegate](self, "delegate"));
    objc_msgSend(v5, "dayNavigationCellTouchUpOccurred:", self);

  }
}

- (void)touchCancelled:(id)a3
{
  -[TappableDayNumber setPressed:](self->_dateNumber, "setPressed:", 0);
}

- (void)pulseToday
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  EKUITodayCirclePulseView *v17;
  EKUITodayCirclePulseView *pulseView;
  void *v19;
  _BOOL8 v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  EKUITodayCirclePulseView *v25;
  _QWORD v26[5];

  if (-[DayNavigationViewCell isToday](self, "isToday") && !self->_pulseView)
  {
    -[TappableDayNumber frame](self->_dateNumber, "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    if (!-[CompactDayNavigationViewCell usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle"))
      v6 = v6 + 2.0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactDayNavigationViewCell superview](self, "superview"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "superview"));

    objc_msgSend(v12, "convertRect:fromView:", self, v4, v6, v8, v10);
    v17 = (EKUITodayCirclePulseView *)objc_msgSend(objc_alloc((Class)EKUITodayCirclePulseView), "initWithFrame:", v13, v14, v15, v16);
    pulseView = self->_pulseView;
    self->_pulseView = v17;

    if (-[CompactDayNavigationViewCell usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle"))
    {
      -[EKUITodayCirclePulseView setCircleShouldFillFrame:](self->_pulseView, "setCircleShouldFillFrame:", 1);
      -[EKUITodayCirclePulseView setUsesRoundedRectInsteadOfCircle:](self->_pulseView, "setUsesRoundedRectInsteadOfCircle:", 1);
    }
    else
    {
      -[CompactDayNavigationViewCell _circleDiameter](self, "_circleDiameter");
      -[EKUITodayCirclePulseView setCircleDiameter:](self->_pulseView, "setCircleDiameter:");
    }
    -[EKUITodayCirclePulseView setString:](self->_pulseView, "setString:", self->_displayString);
    -[CompactDayNavigationViewCell fontSize](self, "fontSize");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[TappableDayNumber circledFontForSize:](TappableDayNumber, "circledFontForSize:"));
    -[EKUITodayCirclePulseView setFont:](self->_pulseView, "setFont:", v19);

    v20 = -[CompactDayNavigationViewCell usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle");
    if (v20)
    {
      -[TappableDayNumber primaryNumberFrame](self->_dateNumber, "primaryNumberFrame");
      -[EKUITodayCirclePulseView setTextYOffset:](self->_pulseView, "setTextYOffset:", v22);
      -[EKUITodayCirclePulseView setUsesTextYOffsetWithoutAdjustmentForOverlay:](self->_pulseView, "setUsesTextYOffsetWithoutAdjustmentForOverlay:", 1);
    }
    else
    {
      v23 = 7.5;
      if (!self->_hasOverlay)
        v23 = 5.0;
      -[EKUITodayCirclePulseView setTextYOffset:](self->_pulseView, "setTextYOffset:", CalRoundToScreenScale(v20, v21, v23));
      -[EKUITodayCirclePulseView setTextOffsetFromCircle:](self->_pulseView, "setTextOffsetFromCircle:", 0.0, -0.5);
    }
    -[EKUITodayCirclePulseView setTextFrameWidthAdjustment:](self->_pulseView, "setTextFrameWidthAdjustment:", 0.0);
    if (self->_hasOverlay)
    {
      -[EKUITodayCirclePulseView setOverlayString:](self->_pulseView, "setOverlayString:", self->_overlayString);
      -[CompactDayNavigationViewCell overlayFontSize](self, "overlayFontSize");
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[TappableDayNumber overlayFontForSize:](TappableDayNumber, "overlayFontForSize:"));
      -[EKUITodayCirclePulseView setOverlayFont:](self->_pulseView, "setOverlayFont:", v24);

    }
    -[EKUITodayCirclePulseView layoutIfNeeded](self->_pulseView, "layoutIfNeeded");
    objc_msgSend(v12, "addSubview:", self->_pulseView);
    -[TappableDayNumber setHidden:](self->_dateNumber, "setHidden:", 1);
    v25 = self->_pulseView;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100029498;
    v26[3] = &unk_1001B2538;
    v26[4] = self;
    -[EKUITodayCirclePulseView pulse:](v25, "pulse:", v26);

  }
}

- (id)preferredPointerShape
{
  -[CompactDayNavigationViewCell circleFrame](self, "circleFrame");
  return +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:");
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_badgeLocale, 0);
  objc_storeStrong((id *)&self->_badgeColor, 0);
  objc_storeStrong((id *)&self->_monthAnimationStateDayBadge, 0);
  objc_storeStrong((id *)&self->_dayBadge, 0);
  objc_storeStrong((id *)&self->_weekendColor, 0);
  objc_storeStrong((id *)&self->_pulseView, 0);
  objc_storeStrong((id *)&self->_monthAnimationStateOverlay, 0);
  objc_storeStrong((id *)&self->_monthAnimationStateDayNumber, 0);
  objc_storeStrong((id *)&self->_dateNumber, 0);
  objc_storeStrong((id *)&self->_overlayString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
}

@end
