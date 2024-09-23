@implementation WeekView

+ (BOOL)usesSmallTextForIsCompact:(BOOL)a3
{
  return a3;
}

+ (BOOL)showsAllDayDividerLine
{
  return 0;
}

+ (double)standardWidthForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4
{
  double v4;

  objc_msgSend(a1, "dayWidthForOrientation:withViewInViewHierarchy:", a3, a4);
  return v4 * 7.0;
}

+ (double)windowSpaceForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4
{
  id v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;

  v5 = a4;
  v6 = EKUICurrentWindowWidthWithViewHierarchy(v5);
  if (EKUICurrentHeightSizeClassIsCompact(v5)
    && EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v5, v7))
  {
    v8 = EKUICurrentWindowHeightWithViewHierarchy(v5);
    if (v6 < v8)
      v6 = v8;
  }
  else
  {
    v9 = objc_opt_class(UIWindow);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
      v10 = v5;
    else
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    v11 = v10;
    v12 = objc_opt_class(MobileCalWindow);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      objc_msgSend(v11, "mainContentSize");
      v6 = v13;
    }

  }
  if ((((unint64_t)(a3 - 3) < 2) & EKUIIsExtended(v5)) != 0)
    v6 = v6 + -53.0;
  +[WeekTimeView widthForOrientation:inViewHierarchy:](WeekTimeView, "widthForOrientation:inViewHierarchy:", a3, v5);
  v15 = v6 - v14;

  return v15;
}

+ (unint64_t)displayedDaysForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4
{
  id v6;
  uint64_t v7;
  int IsCompactInViewHierarchy;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  unint64_t v17;
  unint64_t v18;

  v6 = a4;
  if (EKUICurrentHeightSizeClassIsCompact(v6))
    IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v6, v7);
  else
    IsCompactInViewHierarchy = 0;
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v6, v7))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
    if (EKUIUsesLargeTextLayout(v9, v10))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v12 = objc_msgSend(v11, "userInterfaceIdiom") == 0;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  if ((v12 | IsCompactInViewHierarchy) == 1)
  {
    objc_msgSend(a1, "windowSpaceForOrientation:withViewInViewHierarchy:", a3, v6);
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption2));
    objc_msgSend(v15, "_scaledValueForValue:", v14 / 5.0);
    v17 = vcvtad_u64_f64(v14 / v16);
    if (v17 >= 5)
      v17 = 5;
    if (v17 <= 2)
      v18 = 2;
    else
      v18 = v17;

  }
  else
  {
    v18 = 7;
  }

  return v18;
}

+ (double)dayWidthForOrientation:(int64_t)a3 withViewInViewHierarchy:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;

  v6 = a4;
  v7 = EKUICurrentWindowWidthWithViewHierarchy(v6);
  v8 = v7 / EKUICurrentWindowHeightWithViewHierarchy(v6);
  if (v8 < 1.0)
  {
    v9 = EKUICurrentWindowHeightWithViewHierarchy(v6);
    v8 = v9 / EKUICurrentWindowWidthWithViewHierarchy(v6);
  }
  if (EKUICurrentHeightSizeClassIsCompact(v6)
    && EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v6, v10)
    && v8 < 1.7)
  {
    v11 = 130.0;
  }
  else
  {
    objc_msgSend(a1, "windowSpaceForOrientation:withViewInViewHierarchy:", a3, v6);
    v13 = v12;
    v14 = objc_msgSend(a1, "displayedDaysForOrientation:withViewInViewHierarchy:", a3, v6);
    v15 = v13 + -9.0;
    if ((unint64_t)v14 >= 5)
      v15 = v13;
    v11 = CalCeilToScreenScale(v14, v15 / (double)(unint64_t)v14);
  }

  return v11;
}

+ (id)weekSeparatorColor
{
  return +[UIColor separatorColor](UIColor, "separatorColor");
}

- (WeekView)initWithFrame:(CGRect)a3 sizeClass:(int64_t)a4 targetWindow:(id)a5 rightClickDelegate:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  WeekView *v15;
  uint64_t v16;
  id v17;
  _BOOL8 v18;
  double v19;
  double v20;
  WeekAllDayView *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  WeekAllDayView *v26;
  WeekAllDayView *allDayView;
  id v28;
  void *v29;
  EKDayViewContent *v30;
  EKDayViewContent *content;
  EKDayViewContent *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UIScrollView *v38;
  UIScrollView *scrollView;
  void *v40;
  UIScrollView *v41;
  double v42;
  double v43;
  UIImageView *v44;
  UIImageView *gridExtensionView;
  dispatch_queue_t v46;
  OS_dispatch_queue *reloadQueue;
  CGSize size;
  void *v49;
  id v50;
  _QWORD v52[4];
  id v53;
  id location;
  objc_super v55;
  uint64_t v56;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a5;
  v14 = a6;
  v55.receiver = self;
  v55.super_class = (Class)WeekView;
  v15 = -[WeekView initWithFrame:](&v55, "initWithFrame:", x, y, width, height);
  if (v15)
  {
    v16 = EKUIInterfaceOrientationForViewHierarchy(v13);
    v17 = -[WeekView daysToDisplay](v15, "daysToDisplay");
    v18 = a4 == 1;
    objc_storeWeak((id *)&v15->_targetWindow, v13);
    objc_msgSend((id)objc_opt_class(v15), "dayWidthForOrientation:withViewInViewHierarchy:", v16, v13);
    v20 = v19;
    v15->_daysToDisplay = (int64_t)v17;
    v21 = [WeekAllDayView alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("weekHeaderBGColor")));
    v23 = CGRectZero.origin.y;
    v24 = CGRectZero.size.width;
    v25 = CGRectZero.size.height;
    v26 = -[WeekAllDayView initWithFrame:orientation:numberOfDaysToDisplay:opaque:backgroundColor:rightClickDelegate:](v21, "initWithFrame:orientation:numberOfDaysToDisplay:opaque:backgroundColor:rightClickDelegate:", v16, v17, 1, v22, v14, CGRectZero.origin.x, v23, v24, v25);
    allDayView = v15->_allDayView;
    v15->_allDayView = v26;

    -[WeekAllDayView setFixedDayWidth:](v15->_allDayView, "setFixedDayWidth:", v20);
    -[WeekAllDayView setDelegate:](v15->_allDayView, "setDelegate:", v15);
    -[WeekAllDayView setOrientation:](v15->_allDayView, "setOrientation:", v16);
    -[WeekAllDayView setShowsHalfOfScrolledEvents:](v15->_allDayView, "setShowsHalfOfScrolledEvents:", 1);
    -[WeekAllDayView setUsesSmallText:](v15->_allDayView, "setUsesSmallText:", objc_msgSend((id)objc_opt_class(v15), "usesSmallTextForIsCompact:", v18));
    -[WeekAllDayView setShowSeparatorLines:](v15->_allDayView, "setShowSeparatorLines:", 1);
    -[WeekView addSubview:](v15, "addSubview:", v15->_allDayView);
    v28 = objc_alloc((Class)EKDayViewContent);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v30 = (EKDayViewContent *)objc_msgSend(v28, "initWithFrame:sizeClass:orientation:backgroundColor:opaque:isMiniPreviewInEventDetail:numberOfDaysToDisplay:", a4, v16, v29, 0, 0, v17, CGRectZero.origin.x, v23, v24, v25);
    content = v15->_content;
    v15->_content = v30;

    v32 = v15->_content;
    v33 = objc_msgSend(objc_alloc((Class)EKUIRightClickEmptySpaceInteraction), "initWithDelegate:", v14);
    -[EKDayViewContent addInteraction:](v32, "addInteraction:", v33);

    -[EKDayViewContent setEventsFillGrid:](v15->_content, "setEventsFillGrid:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](v15->_content, "grid"));
    objc_msgSend(v34, "setShowsLeftBorder:", 0);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](v15->_content, "grid"));
    objc_msgSend(v35, "setShowsRightBorder:", 0);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](v15->_content, "grid"));
    objc_msgSend(v36, "setRightBorderInsetsOccurrences:", 0);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](v15->_content, "grid"));
    objc_msgSend(v37, "setEventHorizontalInset:", -6.0);

    -[EKDayViewContent setOrientation:](v15->_content, "setOrientation:", v16);
    -[EKDayViewContent setFixedDayWidth:](v15->_content, "setFixedDayWidth:", v20);
    -[EKDayViewContent setUsesSmallText:](v15->_content, "setUsesSmallText:", objc_msgSend((id)objc_opt_class(v15), "usesSmallTextForIsCompact:", v18));
    -[EKDayViewContent setDelegate:](v15->_content, "setDelegate:", v15);
    -[EKDayViewContent sizeToFit](v15->_content, "sizeToFit");
    if (!v18)
    {
      +[EKDayOccurrenceView defaultPadding](EKDayOccurrenceView, "defaultPadding");
      -[EKDayViewContent setOccurrencePadding:](v15->_content, "setOccurrencePadding:", 0.5, 2.0);
    }
    v38 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
    scrollView = v15->_scrollView;
    v15->_scrollView = v38;

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[UIScrollView setBackgroundColor:](v15->_scrollView, "setBackgroundColor:", v40);

    v41 = v15->_scrollView;
    -[EKDayViewContent frame](v15->_content, "frame");
    -[UIScrollView setContentSize:](v41, "setContentSize:", v42, v43);
    -[UIScrollView addSubview:](v15->_scrollView, "addSubview:", v15->_content);
    -[UIScrollView setShowsVerticalScrollIndicator:](v15->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setScrollsToTop:](v15->_scrollView, "setScrollsToTop:", 0);
    -[UIScrollView setAutoresizingMask:](v15->_scrollView, "setAutoresizingMask:", 18);
    -[UIScrollView setDelegate:](v15->_scrollView, "setDelegate:", v15);
    -[WeekView addSubview:](v15, "addSubview:", v15->_scrollView);
    -[WeekView setAutoresizingMask:](v15, "setAutoresizingMask:", 16);
    v15->_hourHeightScale = 1.0;
    -[WeekView bringSubviewToFront:](v15, "bringSubviewToFront:", v15->_allDayView);
    v44 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, v23, v24, v25);
    gridExtensionView = v15->_gridExtensionView;
    v15->_gridExtensionView = v44;

    -[UIImageView setOpaque:](v15->_gridExtensionView, "setOpaque:", 0);
    -[UIScrollView insertSubview:atIndex:](v15->_scrollView, "insertSubview:atIndex:", v15->_gridExtensionView, 0);
    v15->_selectedSecond = -1;
    -[WeekView setOrientation:](v15, "setOrientation:", v16);
    v46 = dispatch_queue_create("weekReload", 0);
    reloadQueue = v15->_reloadQueue;
    v15->_reloadQueue = (OS_dispatch_queue *)v46;

    size = CGRectNull.size;
    v15->_visibleRectToSet.origin = CGRectNull.origin;
    v15->_visibleRectToSet.size = size;
    objc_initWeak(&location, v15);
    v56 = objc_opt_class(UITraitUserInterfaceStyle);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v56, 1));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10006018C;
    v52[3] = &unk_1001B2418;
    objc_copyWeak(&v53, &location);
    v50 = -[WeekView registerForTraitChanges:withHandler:](v15, "registerForTraitChanges:withHandler:", v49, v52);

    objc_destroyWeak(&v53);
    objc_destroyWeak(&location);
  }

  return v15;
}

+ (int64_t)numMultiDays
{
  return 7;
}

- (int64_t)daysToDisplay
{
  return (int64_t)objc_msgSend((id)objc_opt_class(self), "numMultiDays");
}

- (void)setOrientation:(int64_t)a3
{
  void *v5;
  id WeakRetained;
  double v7;
  double v8;
  UIImage *verticalGridExtensionImage;
  void *v10;
  UIScrollView *scrollView;
  double v12;
  double v13;

  self->_orientation = a3;
  v5 = (void *)objc_opt_class(self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindow);
  objc_msgSend(v5, "dayWidthForOrientation:withViewInViewHierarchy:", a3, WeakRetained);
  v8 = v7;

  verticalGridExtensionImage = self->_verticalGridExtensionImage;
  self->_verticalGridExtensionImage = 0;

  -[EKDayViewContent setOrientation:](self->_content, "setOrientation:", a3);
  -[EKDayViewContent setFixedDayWidth:](self->_content, "setFixedDayWidth:", v8);
  -[EKDayViewContent sizeToFit](self->_content, "sizeToFit");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
  objc_msgSend(v10, "updateMarkerPosition");

  scrollView = self->_scrollView;
  -[EKDayViewContent frame](self->_content, "frame");
  -[UIScrollView setContentSize:](scrollView, "setContentSize:", v12, v13);
  -[WeekAllDayView setFixedDayWidth:](self->_allDayView, "setFixedDayWidth:", v8);
  -[WeekView setNeedsLayout](self, "setNeedsLayout");
}

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
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  int64_t selectedSecond;
  id WeakRetained;
  char v17;
  id v18;
  CGRect *p_visibleRectToSet;
  double x;
  double y;
  double width;
  double height;
  CGSize size;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  v25.receiver = self;
  v25.super_class = (Class)WeekView;
  -[WeekView layoutSubviews](&v25, "layoutSubviews");
  -[WeekView bounds](self, "bounds");
  -[WeekAllDayView sizeThatFits:](self->_allDayView, "sizeThatFits:", v3, v4);
  v6 = v5;
  -[WeekView bounds](self, "bounds");
  -[WeekAllDayView setFrame:](self->_allDayView, "setFrame:", 0.0, 0.0);
  -[WeekView bounds](self, "bounds");
  v8 = v7;
  -[WeekView bounds](self, "bounds");
  v10 = v9 - v6;
  -[UIScrollView frame](self->_scrollView, "frame");
  v27.origin.x = v11;
  v27.origin.y = v12;
  v27.size.width = v13;
  v27.size.height = v14;
  v26.origin.x = 0.0;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  if (!CGRectEqualToRect(v26, v27))
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", 0.0, v6, v8, v10);
  selectedSecond = self->_selectedSecond;
  if (selectedSecond != -1)
    -[WeekView scrollToSecond:animated:completion:](self, "scrollToSecond:animated:completion:", selectedSecond, 0, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = objc_opt_respondsToSelector(WeakRetained, "weekViewDidLayout:");

  if ((v17 & 1) != 0)
  {
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v18, "weekViewDidLayout:", self);

  }
  p_visibleRectToSet = &self->_visibleRectToSet;
  if (!CGRectIsNull(self->_visibleRectToSet))
  {
    x = p_visibleRectToSet->origin.x;
    y = self->_visibleRectToSet.origin.y;
    width = self->_visibleRectToSet.size.width;
    height = self->_visibleRectToSet.size.height;
    size = CGRectNull.size;
    p_visibleRectToSet->origin = CGRectNull.origin;
    self->_visibleRectToSet.size = size;
    -[WeekView adjustForVisibleRect:](self, "adjustForVisibleRect:", x, y, width, height);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[WeekView updateDayWidth](self, "updateDayWidth");
  -[WeekAllDayView sizeThatFits:](self->_allDayView, "sizeThatFits:", width, height);
  v7 = height;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)updateDayWidth
{
  void *v3;
  int64_t orientation;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  UIScrollView *scrollView;
  double v10;
  double v11;

  v3 = (void *)objc_opt_class(self);
  orientation = self->_orientation;
  WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindow);
  objc_msgSend(v3, "dayWidthForOrientation:withViewInViewHierarchy:", orientation, WeakRetained);
  v7 = v6;

  -[EKDayViewContent fixedDayWidth](self->_content, "fixedDayWidth");
  if (v7 != v8)
  {
    -[EKDayViewContent setFixedDayWidth:](self->_content, "setFixedDayWidth:", v7);
    -[EKDayViewContent sizeToFit](self->_content, "sizeToFit");
    scrollView = self->_scrollView;
    -[EKDayViewContent frame](self->_content, "frame");
    -[UIScrollView setContentSize:](scrollView, "setContentSize:", v10, v11);
    -[WeekAllDayView setFixedDayWidth:](self->_allDayView, "setFixedDayWidth:", v7);
    -[WeekView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)hideNowDot:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
  objc_msgSend(v4, "hideNowDot:", v3);

}

- (void)setWeekStartDate:(id)a3
{
  NSDateComponents *v4;
  NSDateComponents *weekStartDate;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_weekStartDate) & 1) == 0)
  {
    v4 = (NSDateComponents *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateComponentsForDateOnly"));
    weekStartDate = self->_weekStartDate;
    self->_weekStartDate = v4;

    -[WeekAllDayView setStartDate:](self->_allDayView, "setStartDate:", self->_weekStartDate);
    -[EKDayViewContent setStartDateWithDateComponents:](self->_content, "setStartDateWithDateComponents:", self->_weekStartDate);
    -[WeekView _updateTimeMarkerTodayDay](self, "_updateTimeMarkerTodayDay");
  }

}

- (void)setCalendar:(id)a3
{
  NSCalendar *v4;
  NSCalendar *calendar;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_calendar) & 1) == 0)
  {
    v4 = (NSCalendar *)objc_msgSend(v6, "copy");
    calendar = self->_calendar;
    self->_calendar = v4;

    -[EKDayViewContent setCalendar:](self->_content, "setCalendar:", v6);
    -[WeekAllDayView setCalendar:](self->_allDayView, "setCalendar:", v6);
    -[WeekView _updateTimeMarkerTodayDay](self, "_updateTimeMarkerTodayDay");
  }

}

- (void)setTimeZone:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar timeZone](self->_calendar, "timeZone"));
  if ((objc_msgSend(v7, "isEqualToTimeZone:", v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent timeZone](self->_content, "timeZone"));
    v6 = objc_msgSend(v7, "isEqualToTimeZone:", v5);

    if ((v6 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  -[NSCalendar setTimeZone:](self->_calendar, "setTimeZone:", v7);
  -[EKDayViewContent setTimeZone:](self->_content, "setTimeZone:", v7);
  -[WeekAllDayView setTimeZone:](self->_allDayView, "setTimeZone:", v7);
LABEL_6:

}

- (NSTimeZone)timeZone
{
  return -[NSCalendar timeZone](self->_calendar, "timeZone");
}

- (void)setHighlightedDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedDateComponents, a3);
  -[WeekView _updateHighlightedDay](self, "_updateHighlightedDay");
}

- (NSDateComponents)highlightedDateComponents
{
  return self->_highlightedDateComponents;
}

- (NSDateComponents)lastDateOfWeek
{
  return (NSDateComponents *)-[NSDateComponents dateComponents:byAddingDays:calendar:](self->_weekStartDate, "dateComponents:byAddingDays:calendar:", 30, 6, self->_calendar);
}

- (NSDate)lastSecondOfWeek
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent lastDisplayedSecond](self->_content, "lastDisplayedSecond"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "date"));

  return (NSDate *)v3;
}

- (void)adjustForVisibleRect:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  double v8;
  double v9;
  double MaxY;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WeekView frame](self, "frame");
  if (v8 == 0.0 || (-[UIScrollView frame](self->_scrollView, "frame"), v9 == 0.0))
  {
    self->_visibleRectToSet.origin.x = x;
    self->_visibleRectToSet.origin.y = y;
    self->_visibleRectToSet.size.width = width;
    self->_visibleRectToSet.size.height = height;
  }
  else
  {
    -[WeekAllDayView bounds](self->_allDayView, "bounds");
    -[WeekAllDayView rectBecameVisible:](self->_allDayView, "rectBecameVisible:", x, 0.0, width, CGRectGetHeight(v15));
    -[WeekAllDayView frame](self->_allDayView, "frame");
    MaxY = CGRectGetMaxY(v16);
    -[UIScrollView frame](self->_scrollView, "frame");
    v11 = MaxY - CGRectGetMinY(v17);
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    v13 = v11 + v12;
    -[UIScrollView frame](self->_scrollView, "frame");
    -[EKDayViewContent rectBecameVisible:](self->_content, "rectBecameVisible:", x, v13, width, v14 - v11);
  }
}

- (id)dateForXOffset:(double)a3
{
  double v5;
  double v6;
  id v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t daysToDisplay;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend((id)objc_opt_class(self), "leadingVerticalLinePeak");
  v6 = v5 + a3;
  v7 = objc_msgSend((id)objc_opt_class(self), "dayWidthForOrientation:withViewInViewHierarchy:", self->_orientation, self);
  v9 = (uint64_t)(v6 / v8);
  if ((CalTimeDirectionIsLeftToRight(v7, v10) & 1) == 0)
  {
    v11 = +[WeekView displayedDaysForOrientation:withViewInViewHierarchy:](WeekView, "displayedDaysForOrientation:withViewInViewHierarchy:", self->_orientation, self);
    daysToDisplay = self->_daysToDisplay;
    if (v11 == 7)
      v9 = ~v9 + (int)daysToDisplay;
    else
      v9 = ~v9
         + (int)(daysToDisplay
               - +[WeekView displayedDaysForOrientation:withViewInViewHierarchy:](WeekView, "displayedDaysForOrientation:withViewInViewHierarchy:", self->_orientation, self));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent startDate](self->_content, "startDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "calendarDateByAddingDays:", v9));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allComponents"));

  return v15;
}

- (void)setShowsTimeMarker:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
  objc_msgSend(v5, "setShowsTimeLine:", v3);

  -[WeekView _updateTimeMarkerTodayDay](self, "_updateTimeMarkerTodayDay");
}

- (void)_updateTimeMarkerTodayDay
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSCalendar *calendar;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int IsLeftToRight;
  char *v21;
  char *v22;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
  v4 = objc_msgSend(v3, "showsTimeLine");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView weekStartDate](self, "weekStartDate"));

    if (v5)
    {
      v8 = CUIKTodayDate(v6, v7);
      v23 = (id)objc_claimAutoreleasedReturnValue(v8);
      calendar = self->_calendar;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView weekStartDate](self, "weekStartDate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](calendar, "dateFromComponents:", v10));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v11, v23, 0));
      -[NSCalendar rangeOfUnit:inUnit:forDate:](self->_calendar, "rangeOfUnit:inUnit:forDate:", 512, 0x2000, v11);
      v14 = v13;
      if (-[WeekView containsDate:](self, "containsDate:", v23)
        && ((unint64_t)objc_msgSend(v12, "day") & 0x8000000000000000) == 0
        && (v15 = objc_msgSend(v12, "day"), (unint64_t)v15 <= v14))
      {
        IsLeftToRight = CalTimeDirectionIsLeftToRight(v15, v16);
        v21 = (char *)objc_msgSend(v12, "day");
        if (IsLeftToRight)
          v22 = v21 + 1;
        else
          v22 = (char *)(v14 - (_QWORD)v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
        v18 = v17;
        v19 = (uint64_t)v22;
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
        v18 = v17;
        v19 = -1;
      }
      objc_msgSend(v17, "setTimeMarkerTodayDay:", v19);

    }
    else
    {
      v23 = (id)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
      objc_msgSend(v23, "setTimeMarkerTodayDay:", -1);
    }

  }
}

- (void)_updateHighlightedDay
{
  void *v3;
  NSCalendar *calendar;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int IsLeftToRight;
  char *v16;
  char *v17;
  id v18;

  if (self->_highlightedDateComponents)
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView weekStartDate](self, "weekStartDate"));

    if (v3)
    {
      calendar = self->_calendar;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView weekStartDate](self, "weekStartDate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](calendar, "dateFromComponents:", v5));

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v6, v18, 0));
      -[NSCalendar rangeOfUnit:inUnit:forDate:](self->_calendar, "rangeOfUnit:inUnit:forDate:", 512, 0x2000, v6);
      v9 = v8;
      if (-[WeekView containsDate:](self, "containsDate:", v18)
        && ((unint64_t)objc_msgSend(v7, "day") & 0x8000000000000000) == 0
        && (v10 = objc_msgSend(v7, "day"), (uint64_t)v10 <= v9))
      {
        IsLeftToRight = CalTimeDirectionIsLeftToRight(v10, v11);
        v16 = (char *)objc_msgSend(v7, "day");
        if (IsLeftToRight)
          v17 = v16 + 1;
        else
          v17 = (char *)(v9 - (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
        v13 = v12;
        v14 = (uint64_t)v17;
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
        v13 = v12;
        v14 = -1;
      }
      objc_msgSend(v12, "setHighlightedDayIndex:", v14);

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
      objc_msgSend(v6, "setHighlightedDayIndex:", -1);
    }

  }
  else
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
    objc_msgSend(v18, "setHighlightedDayIndex:", -1);
  }

}

- (BOOL)showsTimeMarker
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
  v3 = objc_msgSend(v2, "showsTimeLine");

  return v3;
}

- (BOOL)hasAllDayEvents
{
  return -[WeekAllDayView hasOccurrences](self->_allDayView, "hasOccurrences");
}

- (void)loadDataAsyncWithCompletion:(id)a3 reverse:(BOOL)a4
{
  id v6;
  NSObject *reloadQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[EKDayViewContent prepareForReuseIsReload:](self->_content, "prepareForReuseIsReload:", 0);
  -[WeekAllDayView prepareForReuse](self->_allDayView, "prepareForReuse");
  reloadQueue = self->_reloadQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000610FC;
  block[3] = &unk_1001B32C0;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(reloadQueue, block);

}

- (void)reloadData
{
  void *v3;
  id WeakRetained;
  void *v5;
  CUIKOccurrencesCollection *v6;
  CUIKOccurrencesCollection *events;
  EKDayViewContent *content;
  void *v9;
  WeekAllDayView *allDayView;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", self->_weekStartDate));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView lastSecondOfWeek](self, "lastSecondOfWeek"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "weekView:allEventsForStartDate:endDate:", self, v12, v3));

  if (v5)
  {
    v6 = (CUIKOccurrencesCollection *)objc_msgSend(v5, "copy");
    events = self->_events;
    self->_events = v6;

    content = self->_content;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timedOccurrences"));
    -[EKDayViewContent setOccurrences:](content, "setOccurrences:", v9);

    -[WeekAllDayView saveTemporaryViews](self->_allDayView, "saveTemporaryViews");
    -[WeekAllDayView prepareForReuse](self->_allDayView, "prepareForReuse");
    allDayView = self->_allDayView;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allDayOccurrences"));
    -[WeekAllDayView setOccurrences:animated:](allDayView, "setOccurrences:animated:", v11, 0);

    -[WeekAllDayView clearTemporaryViews](self->_allDayView, "clearTemporaryViews");
    -[WeekView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (double)_verticalOffset
{
  return 0.0;
}

- (double)_positionOfSecond:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
  objc_msgSend(v5, "positionOfSecond:", a3);
  v7 = v6;

  -[WeekView _verticalOffset](self, "_verticalOffset");
  return v7 - v8;
}

- (int)_secondAtPosition:(double)a3
{
  WeekView *v4;
  void *v5;
  double v6;

  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
  -[WeekView _verticalOffset](v4, "_verticalOffset");
  LODWORD(v4) = objc_msgSend(v5, "secondAtPosition:", v6 + a3);

  return (int)v4;
}

- (int64_t)firstVisibleSecond
{
  double v3;

  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  return -[WeekView _secondAtPosition:](self, "_secondAtPosition:", v3);
}

- (void)setFirstVisibleSecond:(int64_t)a3
{
  double v5;

  if (-[WeekView firstVisibleSecond](self, "firstVisibleSecond") != a3)
  {
    -[WeekView _positionOfSecond:](self, "_positionOfSecond:", a3);
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", 0.0, v5);
    -[WeekView firstVisibleSecondChanged](self, "firstVisibleSecondChanged");
  }
  self->_selectedSecond = -1;
}

- (void)scrollToSecond:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  _QWORD *v17;
  double v19;
  double v20;
  unint64_t v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD v28[7];
  _QWORD v29[5];
  id v30;

  v5 = a4;
  v8 = a5;
  self->_selectedSecond = a3;
  if (a3 >= 86399)
    v9 = 86399;
  else
    v9 = a3;
  -[WeekView _positionOfSecond:](self, "_positionOfSecond:", v9);
  v11 = v10;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v13 = v12;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v15 = v14;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000617E8;
  v29[3] = &unk_1001B2D00;
  v29[4] = self;
  v16 = v8;
  v30 = v16;
  v17 = objc_retainBlock(v29);
  if (v11 >= v13 && v11 <= v13 + v15 * 0.5)
    goto LABEL_19;
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v20 = v19;
  v21 = 3600;
  if (a3 > 3600)
    v21 = a3;
  v22 = 0.0;
  v23 = v21 - 3600;
  if (v21 != 3600)
  {
    if (v21 < 0x15F8F)
    {
      -[WeekView _positionOfSecond:](self, "_positionOfSecond:", v23);
      v22 = v24;
    }
    else
    {
      v22 = v19 - v15;
    }
  }
  -[WeekAllDayView frame](self->_allDayView, "frame", v23);
  v26 = fmax(v22 - v25, 0.0);
  v27 = v20 - v15;
  if (v26 < v20 - v15)
    v27 = v26;
  if (!v5)
  {
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", 0.0, v27);
LABEL_19:
    ((void (*)(_QWORD *, uint64_t))v17[2])(v17, 1);
    goto LABEL_20;
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100061838;
  v28[3] = &unk_1001B2810;
  v28[4] = self;
  v28[5] = 0;
  *(double *)&v28[6] = v27;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v28, v17, 0.4);
LABEL_20:
  -[WeekView firstVisibleSecondChanged](self, "firstVisibleSecondChanged");

}

- (BOOL)scrollTowardPoint:(CGPoint)a3
{
  double y;
  double v5;
  double MaxY;
  double v7;
  double v8;
  double v9;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v28;
  CGRect v29;

  y = a3.y;
  self->_selectedSecond = -1;
  -[WeekAllDayView frame](self->_allDayView, "frame", a3.x);
  v5 = CGRectGetMaxY(v28) + 5.0;
  -[UIScrollView frame](self->_scrollView, "frame");
  MaxY = CGRectGetMaxY(v29);
  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  if (y >= v5)
  {
    v12 = MaxY - v7 + -50.0;
    if (y > v12)
    {
      -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
      v10 = v13;
      v15 = v14;
      -[UIScrollView bounds](self->_scrollView, "bounds");
      v17 = v15 + v16;
      -[UIScrollView contentInset](self->_scrollView, "contentInset");
      v19 = v17 - v18;
      -[UIScrollView contentSize](self->_scrollView, "contentSize");
      if (v19 < v20)
      {
        v21 = (y - v12) * 0.4 + v15;
        -[UIScrollView contentSize](self->_scrollView, "contentSize");
        v23 = v22;
        -[UIScrollView contentInset](self->_scrollView, "contentInset");
        v25 = v23 + v24;
        -[UIScrollView bounds](self->_scrollView, "bounds");
        v11 = fmin(v21, v25 - v26);
        goto LABEL_7;
      }
    }
  }
  else
  {
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    if (v9 > 0.0)
    {
      v10 = v8;
      v11 = fmax(v9 + (v5 - y) * -0.4, 0.0);
LABEL_7:
      -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v10, v11);
      return 1;
    }
  }
  return 0;
}

- (BOOL)isEventFullyVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  UIScrollView *scrollView;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat height;
  BOOL v28;
  CGRect v30;
  CGRect v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView occurrenceViewForEvent:occurrenceDate:](self, "occurrenceViewForEvent:occurrenceDate:", v4, 0));
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  objc_msgSend(v5, "frame");
  v8 = v7;
  if (!objc_msgSend(v4, "isAllDay"))
  {
    scrollView = self->_scrollView;
    objc_msgSend(v6, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
    -[UIScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", v18, v11, v13, v15, v17);

    -[UIScrollView frame](self->_scrollView, "frame");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView timeZone](self, "timeZone"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v19, v20));

    -[WeekView _positionOfSecond:](self, "_positionOfSecond:", 3600 * (_QWORD)objc_msgSend(v21, "hour")+ 60 * (_QWORD)objc_msgSend(v21, "minute")+ (int)objc_msgSend(v21, "second"));
    v8 = v22;

  }
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v24 = v23;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v26 = v25;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  height = v30.size.height;
  v30.origin.x = 0.0;
  v30.origin.y = v24;
  v30.size.width = v26;
  if (v8 < CGRectGetMinY(v30))
    goto LABEL_7;
  v31.origin.x = 0.0;
  v31.origin.y = v24;
  v31.size.width = v26;
  v31.size.height = height;
  if (v8 < CGRectGetMaxY(v31))
    v28 = 1;
  else
LABEL_7:
    v28 = 0;

  return v28;
}

- (void)scrollToEvent:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[WeekView scrollToEvent:animateWithDuration:completion:](self, "scrollToEvent:animateWithDuration:completion:", a3, a5, 0.4);
}

- (void)scrollToEvent:(id)a3 animateWithDuration:(double)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIScrollView *scrollView;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  _QWORD v38[9];

  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView occurrenceViewForEvent:occurrenceDate:](self, "occurrenceViewForEvent:occurrenceDate:", v8, 0));
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    if ((objc_msgSend(v8, "isAllDay") & 1) == 0)
    {
      scrollView = self->_scrollView;
      objc_msgSend(v11, "frame");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "superview"));
      -[UIScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", v29, v22, v24, v26, v28);
      v13 = v30;
      v17 = v31;
      v19 = v32;

      -[UIScrollView frame](self->_scrollView, "frame");
      if (v19 >= v33)
        v19 = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView timeZone](self, "timeZone"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v34, v35));

      -[WeekView _positionOfSecond:](self, "_positionOfSecond:", 3600 * (_QWORD)objc_msgSend(v36, "hour")+ 60 * (_QWORD)objc_msgSend(v36, "minute")+ (int)objc_msgSend(v36, "second"));
      v15 = v37;

    }
    if (a4 <= 0.0)
    {
      -[UIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 0, v13, v15, v17, v19);
      if (v9)
        v9[2](v9, 1);
    }
    else
    {
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100061DF0;
      v38[3] = &unk_1001B27C0;
      v38[4] = self;
      *(double *)&v38[5] = v13;
      *(double *)&v38[6] = v15;
      *(double *)&v38[7] = v17;
      *(double *)&v38[8] = v19;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v38, v9, a4);
    }
  }
  else if (v9)
  {
    v9[2](v9, 0);
  }
  -[WeekView firstVisibleSecondChanged](self, "firstVisibleSecondChanged");

}

- (void)setHourHeightScale:(double)a3
{
  void *v5;

  if (self->_hourHeightScale != a3)
  {
    self->_hourHeightScale = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
    objc_msgSend(v5, "setGridHeightScale:", a3);

    -[EKDayViewContent setNeedsLayout](self->_content, "setNeedsLayout");
  }
}

- (NSArray)occurrenceViews
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView content](self, "content"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "occurrenceViews"));

  return (NSArray *)v3;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  WeekViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  self->_selectedSecond = -1;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "weekViewDidBeginDragging:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "weekViewDidBeginDragging:", self);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  void *v6;
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
  id WeakRetained;
  char v21;
  id v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "contentOffset");
  v5 = v4;
  if (v4 < 0.0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView _verticalGridExtensionImage](self, "_verticalGridExtensionImage"));
    -[UIImageView setImage:](self->_gridExtensionView, "setImage:", v6);
    -[EKDayViewContent frame](self->_content, "frame");
    v8 = v7;
    objc_msgSend(v6, "size");
    -[UIImageView setFrame:](self->_gridExtensionView, "setFrame:", v8, v5, v9, -v5);

  }
  objc_msgSend(v23, "contentSize");
  v11 = v10;
  objc_msgSend(v23, "bounds");
  v13 = v5 - (v11 - v12);
  if (v13 > 0.0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView _verticalGridExtensionImage](self, "_verticalGridExtensionImage"));
    -[UIImageView setImage:](self->_gridExtensionView, "setImage:", v14);
    -[EKDayViewContent frame](self->_content, "frame");
    v16 = v15;
    objc_msgSend(v23, "contentSize");
    v18 = v17;
    objc_msgSend(v14, "size");
    -[UIImageView setFrame:](self->_gridExtensionView, "setFrame:", v16, v18, v19, v13);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v21 = objc_opt_respondsToSelector(WeakRetained, "weekViewDidScroll:");

  if ((v21 & 1) != 0)
  {
    v22 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v22, "weekViewDidScroll:", self);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  char v7;
  id v8;

  v4 = a4;
  -[WeekView firstVisibleSecondChanged](self, "firstVisibleSecondChanged", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "weekViewDidEndDragging:willDecelerate:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "weekViewDidEndDragging:willDecelerate:", self, v4);

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  -[WeekView firstVisibleSecondChanged](self, "firstVisibleSecondChanged", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "weekViewDidEndDecelerating:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "weekViewDidEndDecelerating:", self);

  }
}

- (void)firstVisibleSecondChanged
{
  WeekViewDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v7 = objc_opt_respondsToSelector(v6, "weekViewFirstVisibleSecondChanged:");

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v8, "weekViewFirstVisibleSecondChanged:", -[WeekView firstVisibleSecond](self, "firstVisibleSecond"));

    }
  }
}

- (id)_verticalGridExtensionImage
{
  UIImage *verticalGridExtensionImage;
  void *v4;
  void *v5;
  double daysToDisplay;
  double v7;
  double v8;
  id v9;
  UIImage *v10;
  UIImage *v11;
  UIImage *v12;
  _QWORD v14[7];

  verticalGridExtensionImage = self->_verticalGridExtensionImage;
  if (!verticalGridExtensionImage)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection _currentTraitCollection](UITraitCollection, "_currentTraitCollection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView traitCollection](self, "traitCollection"));
    +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v5);

    daysToDisplay = (double)self->_daysToDisplay;
    objc_msgSend((id)objc_opt_class(self), "dayWidthForOrientation:withViewInViewHierarchy:", self->_orientation, self);
    v8 = v7 * daysToDisplay;
    v9 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", v8, 1.0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100062420;
    v14[3] = &unk_1001B32E8;
    *(double *)&v14[5] = v8;
    v14[6] = 0x3FF0000000000000;
    v14[4] = self;
    v10 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithActions:", v14));
    v11 = self->_verticalGridExtensionImage;
    self->_verticalGridExtensionImage = v10;
    v12 = v10;

    +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v4);
    verticalGridExtensionImage = self->_verticalGridExtensionImage;
  }
  return verticalGridExtensionImage;
}

- (void)updateMarkerPosition
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[EKDayViewContent grid](self->_content, "grid"));
  objc_msgSend(v2, "updateMarkerPosition");

}

- (void)dayViewContent:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v5 = a5;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector(WeakRetained, "weekView:didSelectEvent:userInitiated:");

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "weekView:didSelectEvent:userInitiated:", self, v10, v5);

  }
}

- (void)dayViewContent:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v5 = a5;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector(WeakRetained, "weekView:didSelectEvents:userInitiated:");

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "weekView:didSelectEvents:userInitiated:", self, v10, v5);

  }
}

- (void)dayViewContentDidLayout:(id)a3
{
  WeekViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "weekViewOccurrenceLayoutDidChange:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "weekViewOccurrenceLayoutDidChange:", self);

  }
}

- (BOOL)dayViewContentShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  unsigned __int8 v9;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "weekViewShouldAnnotateAppEntities:onDayStarting:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_msgSend(v8, "weekViewShouldAnnotateAppEntities:onDayStarting:", self, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
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
  WeekViewDelegate **p_delegate;
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

- (void)weekAllDayView:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v5 = a5;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector(WeakRetained, "weekView:didSelectEvent:userInitiated:");

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "weekView:didSelectEvent:userInitiated:", self, v10, v5);

  }
}

- (void)weekAllDayViewEmptySpaceClick:(id)a3 onDay:(double)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  -[WeekView dayViewContent:didTapInEmptySpaceOnDay:](self, "dayViewContent:didTapInEmptySpaceOnDay:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "weekView:receivedTapInAllDayAreaOnDate:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar timeZone](self->_calendar, "timeZone"));
    v10 = (id)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithAbsoluteTime:timeZone:](EKCalendarDate, "calendarDateWithAbsoluteTime:timeZone:", v8, a4));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView delegate](self, "delegate"));
    objc_msgSend(v9, "weekView:receivedTapInAllDayAreaOnDate:", self, v10);

  }
}

- (void)weekAllDayViewDidScroll:(id)a3
{
  WeekViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "weekViewAllDaySectionDidScroll:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "weekViewAllDaySectionDidScroll:", self);

  }
}

- (id)weekAllDayViewForTimeframeBefore:(id)a3
{
  WeekViewDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  void *v11;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_opt_respondsToSelector(v7, "weekViewForWeekBefore:");

  if ((v8 & 1) == 0)
    goto LABEL_5;
  v9 = objc_loadWeakRetained((id *)p_delegate);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "weekViewForWeekBefore:", self));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allDayView"));

  }
  else
  {
LABEL_5:
    v11 = 0;
  }
  return v11;
}

- (id)weekAllDayViewForTimeframeAfter:(id)a3
{
  WeekViewDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  void *v11;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
    goto LABEL_5;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_opt_respondsToSelector(v7, "weekViewForWeekAfter:");

  if ((v8 & 1) == 0)
    goto LABEL_5;
  v9 = objc_loadWeakRetained((id *)p_delegate);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "weekViewForWeekAfter:", self));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allDayView"));

  }
  else
  {
LABEL_5:
    v11 = 0;
  }
  return v11;
}

- (void)shouldAnnotateAppEntitiesChanged
{
  -[WeekAllDayView shouldAnnotateAppEntitiesChanged](self->_allDayView, "shouldAnnotateAppEntitiesChanged");
  -[EKDayViewContent shouldAnnotateAppEntitiesChanged](self->_content, "shouldAnnotateAppEntitiesChanged");
}

- (BOOL)weekAllDayViewShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  unsigned __int8 v9;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "weekViewShouldAnnotateAppEntities:onDayStarting:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_msgSend(v8, "weekViewShouldAnnotateAppEntities:onDayStarting:", self, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)showOverlayMonthInCellAtOffset:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  CGRect v7;

  v4 = a4;
  -[WeekAllDayView frame](self->_allDayView, "frame");
  -[WeekAllDayView showOverlayMonthInCellAtOffset:animated:](self->_allDayView, "showOverlayMonthInCellAtOffset:animated:", v4, a3 - CGRectGetMinX(v7));
}

- (BOOL)containsDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent startDate](self->_content, "startDate"));
  objc_msgSend(v5, "absoluteTime");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent lastDisplayedSecond](self->_content, "lastDisplayedSecond"));
  objc_msgSend(v8, "absoluteTime");
  v10 = v9;

  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  if (v11 >= v7)
  {
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v12 = v13 <= v10;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CGPoint)pointAtDate:(id)a3 isAllDay:(BOOL)a4
{
  _BOOL4 v4;
  NSCalendar *calendar;
  id v7;
  void *v8;
  void *v9;
  NSDateComponents *weekStartDate;
  void *v11;
  void *v12;
  _BYTE *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  CGPoint result;

  v4 = a4;
  calendar = self->_calendar;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar timeZone](calendar, "timeZone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v7, v8));

  weekStartDate = self->_weekStartDate;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar timeZone](self->_calendar, "timeZone"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", weekStartDate, v11));

  v13 = objc_msgSend(v9, "day");
  v14 = v13 - (_BYTE *)objc_msgSend(v12, "day");
  objc_msgSend(v9, "absoluteTime");
  v16 = v15;
  objc_msgSend(v12, "absoluteTime");
  if (v16 > v17 && v14 < 0)
    v14 += (uint64_t)objc_msgSend(v12, "daysInMonth");
  v18 = objc_msgSend((id)objc_opt_class(self), "dayWidthForOrientation:withViewInViewHierarchy:", self->_orientation, self);
  v20 = v19;
  if ((CalTimeDirectionIsLeftToRight(v18, v21) & 1) == 0)
  {
    v29 = (double)(self->_daysToDisplay + ~v14);
    objc_msgSend((id)objc_opt_class(self), "dayWidthForOrientation:withViewInViewHierarchy:", self->_orientation, self);
    v22 = v30 * v29;
    if (!v4)
      goto LABEL_6;
LABEL_8:
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView allDayView](self, "allDayView"));
    objc_msgSend(v31, "firstEventYOffset");
    v28 = v32;

    goto LABEL_9;
  }
  v22 = v20 * (double)v14;
  if (v4)
    goto LABEL_8;
LABEL_6:
  -[UIScrollView frame](self->_scrollView, "frame");
  v24 = v23;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v26 = v24 - v25;
  -[WeekView _positionOfSecond:](self, "_positionOfSecond:", 3600 * (_QWORD)objc_msgSend(v9, "hour")+ 60 * (_QWORD)objc_msgSend(v9, "minute")+ (int)objc_msgSend(v9, "second"));
  v28 = v26 + v27;
LABEL_9:

  v33 = v22;
  v34 = v28;
  result.y = v34;
  result.x = v33;
  return result;
}

- (BOOL)isAnimatingScroll
{
  return self->_selectedSecond != -1;
}

- (void)addViewToScroller:(id)a3 isAllDay:(BOOL)a4
{
  _BOOL4 v4;
  UIScrollView *v6;
  UIScrollView *scrollView;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v4 = a4;
  v17 = a3;
  v6 = (UIScrollView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));
  scrollView = self->_scrollView;

  if (v6 != scrollView)
  {
    if (v4)
    {
      -[WeekAllDayView addViewToScroller:](self->_allDayView, "addViewToScroller:", v17);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));
      objc_msgSend(v17, "frame");
      objc_msgSend(v8, "convertRect:toView:", self->_scrollView);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v17);
      objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);
    }
  }

}

- (BOOL)scrollerIsParentOfView:(id)a3 isAllDay:(BOOL)a4
{
  UIScrollView *scrollView;
  UIScrollView *v5;

  if (a4)
    return -[WeekAllDayView scrollerIsParentOfView:](self->_allDayView, "scrollerIsParentOfView:", a3);
  scrollView = self->_scrollView;
  v5 = (UIScrollView *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "superview"));
  LOBYTE(scrollView) = scrollView == v5;

  return (char)scrollView;
}

- (void)setScrollerContentOffset:(CGPoint)a3
{
  self->_selectedSecond = -1;
  -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", a3.x, a3.y);
}

- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EKDayViewContent occurrenceViewForEvent:](self->_content, "occurrenceViewForEvent:", v6));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(-[WeekAllDayView occurrenceViewForEvent:occurrenceDate:](self->_allDayView, "occurrenceViewForEvent:occurrenceDate:", v6, v7));
  v11 = v10;

  return v11;
}

- (double)yPositionPerhapsMatchingAllDayOccurrence:(id)a3 atPoint:(CGPoint)a4
{
  double x;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  WeekAllDayView *v10;
  double v11;
  double v12;
  WeekView *v13;
  WeekAllDayView *allDayView;
  double v15;
  double v16;
  double v17;

  x = a4.x;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekView dateForXOffset:](self, "dateForXOffset:", x));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeZone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", v7, v8));

  v10 = (WeekAllDayView *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView occurrenceViewForEvent:occurrenceDate:](self->_allDayView, "occurrenceViewForEvent:occurrenceDate:", v6, v9));
  if (v10)
  {
    -[WeekAllDayView bounds](v10, "bounds");
    v13 = self;
    allDayView = v10;
  }
  else
  {
    -[WeekAllDayView nextAvailableOccurrenceViewYOriginForDay:](self->_allDayView, "nextAvailableOccurrenceViewYOriginForDay:", v9);
    v12 = v15;
    allDayView = self->_allDayView;
    v11 = 0.0;
    v13 = self;
  }
  -[WeekView convertPoint:fromView:](v13, "convertPoint:fromView:", allDayView, v11, v12);
  v17 = v16;

  return v17;
}

- (void)dayViewContent:(id)a3 didTapInEmptySpaceOnDay:(double)a4
{
  WeekViewDelegate **p_delegate;
  id WeakRetained;
  char v8;
  void *v9;
  id v10;
  id v11;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector(WeakRetained, "emptySpaceClickedOnDate:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar timeZone](self->_calendar, "timeZone"));
    v11 = (id)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithAbsoluteTime:timeZone:](EKCalendarDate, "calendarDateWithAbsoluteTime:timeZone:", v9, a4));

    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "emptySpaceClickedOnDate:", v11);

  }
}

- (void)dayViewContent:(id)a3 didTapPinnedOccurrence:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  int v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startCalendarDate"));
  objc_msgSend(v6, "absoluteTime");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startCalendarDate"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "calendarDateForDay"));
  objc_msgSend(v10, "absoluteTime");
  v12 = (int)(v8 - v11);

  -[WeekView scrollToSecond:animated:completion:](self, "scrollToSecond:animated:completion:", v12, 1, 0);
}

- (WeekViewDataSource)dataSource
{
  return (WeekViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (WeekViewDelegate)delegate
{
  return (WeekViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDateComponents)weekStartDate
{
  return self->_weekStartDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (double)hourHeightScale
{
  return self->_hourHeightScale;
}

- (WeekAllDayView)allDayView
{
  return self->_allDayView;
}

- (EKDayViewContent)content
{
  return self->_content;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_weekStartDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_highlightedDateComponents, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_verticalGridExtensionImage, 0);
  objc_storeStrong((id *)&self->_gridExtensionView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_allDayView, 0);
  objc_destroyWeak((id *)&self->_targetWindow);
}

@end
