@implementation YearMultipleMonthView

- (id)initCalendarDate:(id)a3 calendar:(id)a4 maximumNumberOfMonths:(unint64_t)a5
{
  id v8;
  id v9;
  YearMultipleMonthView *v10;
  uint64_t v11;
  EKCalendarDate *calendarDate;
  double v13;
  id v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)YearMultipleMonthView;
  v10 = -[YearMultipleMonthView init](&v16, "init");
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendarDateForMonth"));
    calendarDate = v10->_calendarDate;
    v10->_calendarDate = (EKCalendarDate *)v11;

    objc_storeStrong((id *)&v10->_calendar, a4);
    v10->_maximumNumberOfMonths = a5;
    v10->_needToCalculateEligibleToShowYearNumber = 1;
    *(_QWORD *)&v13 = objc_opt_class(v10).n128_u64[0];
    if (objc_msgSend(v14, "useUIKitLayoutMargins", v13))
      -[YearMultipleMonthView setPreservesSuperviewLayoutMargins:](v10, "setPreservesSuperviewLayoutMargins:", 1);
    -[YearMultipleMonthView _initializeHeaderView](v10, "_initializeHeaderView");
    -[YearMultipleMonthView _initializeMonthViews](v10, "_initializeMonthViews");
  }

  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)YearMultipleMonthView;
  v3 = -[YearMultipleMonthView description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[YearMultipleMonthView calendarDate](self, "calendarDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[YearMultipleMonthView endCalendarDate](self, "endCalendarDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@; calendarDate: [%@]; endCalendarDate: [%@]"),
                   v4,
                   v5,
                   v6));

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[YearMultipleMonthView window](self, "window", a3.width, a3.height));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[YearMultipleMonthView window](self, "window"));
    objc_msgSend(v6, "mainContentSize");
    v8 = v7;
    v10 = v9;

  }
  else
  {
    v8 = EKUICurrentWindowSize(self);
    v10 = v11;
  }

  v12 = -[YearMultipleMonthView eligibleToShowYearNumber](self, "eligibleToShowYearNumber");
  objc_opt_class(self);
  v14 = v13;
  v15 = EKUIHeightSizeClassForViewHierarchy(self);
  objc_msgSend(v14, "_heightForViewWithVisibleHeader:windowSize:heightSizeClass:orientation:", v12, v15, EKUIInterfaceOrientationForViewHierarchy(self), v8, v10);
  v17 = v16;
  if (-[YearMultipleMonthView containsLastMonthOfYear](self, "containsLastMonthOfYear"))
  {
    v18 = EKUICurrentWindowSize(self);
    if (EKUIWindowSizeParadigmForWindowSize(v18) == 0x1000000)
      v17 = v17 + 7.0;
  }
  v19 = width;
  v20 = v17;
  result.height = v20;
  result.width = v19;
  return result;
}

- (double)_leftMarginWithOriginalValue:(double)a3
{
  id v5;
  double result;
  double v7;

  objc_opt_class(self);
  objc_msgSend(v5, "leftMarginForWindowSize:", EKUICurrentWindowSize(self));
  if (result < 0.0)
  {
    -[YearMultipleMonthView leftMarginAdjustment](self, "leftMarginAdjustment");
    return v7 + a3;
  }
  return result;
}

- (double)_rightMarginWithOriginalValue:(double)a3
{
  id v5;
  double result;
  double v7;

  objc_opt_class(self);
  objc_msgSend(v5, "rightMarginForWindowSize:", EKUICurrentWindowSize(self));
  if (result < 0.0)
  {
    -[YearMultipleMonthView rightMarginAdjustment](self, "rightMarginAdjustment");
    return v7 + a3;
  }
  return result;
}

- (UIEdgeInsets)_yearLayoutMargins
{
  double v3;
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIEdgeInsets result;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  if (objc_msgSend(v4, "useUIKitLayoutMargins", v3))
  {
    -[YearMultipleMonthView layoutMargins](self, "layoutMargins");
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    -[YearMultipleMonthView bounds](self, "bounds");
    v7 = EKUILayoutMarginsForFullscreenLayoutRectWithSize(self, v12, v13);
    v11 = v14;
    v16 = v15;
    -[YearMultipleMonthView _leftMarginWithOriginalValue:](self, "_leftMarginWithOriginalValue:", v17);
    v9 = v18;
    -[YearMultipleMonthView _rightMarginWithOriginalValue:](self, "_rightMarginWithOriginalValue:", v16);
    v5 = v19;
  }
  v20 = v7;
  v21 = v9;
  v22 = v11;
  result.right = v5;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (CGRect)insetBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v7;

  -[YearMultipleMonthView _yearLayoutMargins](self, "_yearLayoutMargins");
  v4 = v3;
  v6 = v5;
  -[YearMultipleMonthView bounds](self, "bounds");
  return CGRectInset(v7, v6 + v4, 0.0);
}

- (void)didMoveToWindow
{
  void *v3;

  if (self->_layoutWhenJoiningViewHierarchy)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[YearMultipleMonthView window](self, "window"));

    if (v3)
    {
      -[YearMultipleMonthView layoutSubviews](self, "layoutSubviews");
      self->_layoutWhenJoiningViewHierarchy = 0;
    }
  }
}

- (void)layoutSubviews
{
  void *v2;
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
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  NSArray *monthViews;
  uint64_t v38;
  _QWORD v39[8];
  _QWORD v40[4];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void *v44;
  double v45;
  double v46;
  CGSize size;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)YearMultipleMonthView;
  -[YearMultipleMonthView layoutSubviews](&v48, "layoutSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[YearMultipleMonthView window](self, "window"));

  if (!v4)
  {
    self->_layoutWhenJoiningViewHierarchy = 1;
    return;
  }
  -[YearMultipleMonthView _yearLayoutMargins](self, "_yearLayoutMargins");
  v6 = v5;
  v8 = v7;
  -[YearMultipleMonthView insetBounds](self, "insetBounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (-[YearMultipleMonthView eligibleToShowYearNumber](self, "eligibleToShowYearNumber"))
  {
    -[YearViewYearHeader sizeThatFits:](self->_header, "sizeThatFits:", v12, v14);
    v16 = v15;
    -[YearViewYearHeader setFrame:](self->_header, "setFrame:", v6, v10, v8 + v6 + v12, v15);
    v10 = v10 + v16;
  }
  v17 = -[YearMultipleMonthView maximumNumberOfMonths](self, "maximumNumberOfMonths");
  v19 = EKUICurrentWindowSizeParadigmForViewHierarchy(self, v18);
  if (EKUICurrentWindowInterfaceParadigm(self, v20) != 8)
    goto LABEL_24;
  v21 = 0;
  if (v19 <= 0x1FFFFFF)
  {
    if (v19 != 0x80000 && v19 != 0x800000)
      goto LABEL_13;
  }
  else if (v19 != 0x2000000 && v19 != 0x8000000 && v19 != 0x20000000)
  {
LABEL_13:
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[YearMultipleMonthView traitCollection](self, "traitCollection"));
    v21 = EKUIUsesLargeTextYearView() ^ 1;
  }
  if (v19 > 0x1FFFFFF)
  {
    if (v19 != 0x2000000 && v19 != 0x8000000 && v19 != 0x20000000)
      goto LABEL_23;
LABEL_21:
    if ((v21 & 1) == 0)
      goto LABEL_24;
LABEL_22:
    v22 = 45.0;
    goto LABEL_27;
  }
  if (v19 == 0x80000 || v19 == 0x800000)
    goto LABEL_21;
LABEL_23:

  if ((v21 & 1) != 0)
    goto LABEL_22;
LABEL_24:
  -[YearMultipleMonthView monthViewSubviewSize](self, "monthViewSubviewSize");
  v24 = v23;
  if (-[YearMultipleMonthView maximumNumberOfMonths](self, "maximumNumberOfMonths"))
  {
    -[YearMultipleMonthView _yearLayoutMargins](self, "_yearLayoutMargins");
    v26 = v25;
    v28 = v27;
    -[YearMultipleMonthView bounds](self, "bounds");
    v30 = v29 - v26 - v28 - v24 * (double)-[YearMultipleMonthView maximumNumberOfMonths](self, "maximumNumberOfMonths");
    v22 = v30 / (double)(-[YearMultipleMonthView maximumNumberOfMonths](self, "maximumNumberOfMonths") - 1);
  }
  else
  {
    v22 = 0.0;
  }
LABEL_27:
  v41 = 0;
  v42 = &v41;
  v43 = 0x4010000000;
  v44 = &unk_100195B79;
  size = CGRectZero.size;
  v45 = v6;
  v46 = v10;
  v31 = -[YearMultipleMonthView monthViewSubviewSize](self, "monthViewSubviewSize");
  v32 = v42;
  v42[6] = v33;
  v32[7] = v34;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  v36 = CalTimeDirectionIsLeftToRight(v31, v35) == 0;
  monthViews = self->_monthViews;
  if (v36)
    v38 = 2;
  else
    v38 = 0;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100099CE8;
  v39[3] = &unk_1001B3F08;
  v39[4] = &v41;
  v39[5] = v40;
  v39[6] = v17;
  *(double *)&v39[7] = v22;
  -[NSArray enumerateObjectsWithOptions:usingBlock:](monthViews, "enumerateObjectsWithOptions:usingBlock:", v38, v39);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v41, 8);
}

- (void)layoutMarginsDidChange
{
  double v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)YearMultipleMonthView;
  -[YearMultipleMonthView layoutMarginsDidChange](&v5, "layoutMarginsDidChange");
  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  if (objc_msgSend(v4, "useUIKitLayoutMargins", v3))
    -[YearMultipleMonthView setNeedsLayout](self, "setNeedsLayout");
}

- (EKCalendarDate)endCalendarDate
{
  EKCalendarDate *endCalendarDate;
  void *v4;
  void *v5;
  EKCalendarDate *v6;
  EKCalendarDate *v7;

  endCalendarDate = self->_endCalendarDate;
  if (!endCalendarDate)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_monthViews, "lastObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDate"));
    v6 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calendarDateForEndOfMonth"));
    v7 = self->_endCalendarDate;
    self->_endCalendarDate = v6;

    endCalendarDate = self->_endCalendarDate;
  }
  return endCalendarDate;
}

- (double)topInset
{
  double v2;
  id v3;
  double result;

  *(_QWORD *)&v2 = objc_opt_class(self).n128_u64[0];
  objc_msgSend(v3, "topInset", v2);
  return result;
}

- (void)pulseTodayCircle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = CUIKTodayDate(self, a2);
  v7 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar timeZone](self->_calendar, "timeZone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v7, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[YearMultipleMonthView monthViewForCalendarDate:](self, "monthViewForCalendarDate:", v5));
  objc_msgSend(v6, "pulseTodayCircle");

}

- (void)updateToday
{
  -[NSArray makeObjectsPerformSelector:](self->_monthViews, "makeObjectsPerformSelector:", "updateToday");
}

- (void)setOverlaySignificantDatesProvider:(id)a3
{
  id v5;
  NSArray *monthViews;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  objc_storeStrong((id *)&self->_overlaySignificantDatesProvider, a3);
  monthViews = self->_monthViews;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100099FA8;
  v8[3] = &unk_1001B3F30;
  v9 = v5;
  v7 = v5;
  -[NSArray enumerateObjectsUsingBlock:](monthViews, "enumerateObjectsUsingBlock:", v8);

}

- (void)overlaySignificantDatesChangedInRange:(id)a3
{
  id v4;
  NSArray *monthViews;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  monthViews = self->_monthViews;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009A038;
  v7[3] = &unk_1001B3F30;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](monthViews, "enumerateObjectsUsingBlock:", v7);

}

- (void)localeChanged
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  -[YearViewYearHeader localeChanged](self->_header, "localeChanged");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_monthViews;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "localeChanged", (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (double)topInset
{
  return 0.0;
}

- (double)leftMarginAdjustment
{
  return 0.0;
}

- (double)rightMarginAdjustment
{
  return 0.0;
}

+ (double)leftMarginForWindowSize:(CGSize)a3
{
  return -1.0;
}

+ (double)rightMarginForWindowSize:(CGSize)a3
{
  return -1.0;
}

+ (BOOL)useUIKitLayoutMargins
{
  return 0;
}

+ (double)heightForViewWithCalendarDate:(id)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5 orientation:(int64_t)a6
{
  double height;
  double width;
  id v11;
  double v12;
  id v13;
  id v14;
  id v15;
  double result;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  *(_QWORD *)&v12 = objc_opt_class(a1).n128_u64[0];
  v14 = objc_msgSend(v13, "_headerEligibleForCalendarDate:", v11, v12);

  objc_opt_class(a1);
  objc_msgSend(v15, "_heightForViewWithVisibleHeader:windowSize:heightSizeClass:orientation:", v14, a5, a6, width, height);
  return result;
}

- (BOOL)containsLastMonthOfYear
{
  return self->_containsLastMonthOfYear;
}

- (BOOL)pointIsAboveMonthNameBaseline:(CGPoint)a3
{
  double y;
  double x;
  YearMultipleMonthView *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_monthViews, "firstObject"));
  objc_msgSend(v6, "convertPoint:fromView:", v5, x, y);
  LOBYTE(v5) = objc_msgSend(v6, "pointIsAboveMonthNameBaseline:");

  return (char)v5;
}

- (void)setCalendarDate:(id)a3
{
  EKCalendarDate *v4;
  EKCalendarDate *endCalendarDate;
  EKCalendarDate *v6;

  v4 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "calendarDateForMonth"));
  if (self->_calendarDate != v4)
  {
    v6 = v4;
    objc_storeStrong((id *)&self->_calendarDate, v4);
    endCalendarDate = self->_endCalendarDate;
    self->_endCalendarDate = 0;

    self->_needToCalculateEligibleToShowYearNumber = 1;
    -[YearMultipleMonthView _reloadHeaderView](self, "_reloadHeaderView");
    -[YearMultipleMonthView _reloadMonthViews](self, "_reloadMonthViews");
    v4 = v6;
  }

}

- (id)startOfMonthForPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  CGPoint v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_monthViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "frame", (_QWORD)v11);
        v16.x = x;
        v16.y = y;
        if (CGRectContainsPoint(v17, v16))
        {
          v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "calendarDate"));
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)monthViewForCalendarDate:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_monthViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "containsCalendarDate:", v4, (_QWORD)v11))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)eligibleToShowYearNumber
{
  double v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_needToCalculateEligibleToShowYearNumber)
  {
    *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[YearMultipleMonthView calendarDate](self, "calendarDate", v3));
    self->_eligibleToShowYearNumber = objc_msgSend(v5, "_headerEligibleForCalendarDate:", v6);

    self->_needToCalculateEligibleToShowYearNumber = 0;
  }
  return self->_eligibleToShowYearNumber;
}

- (void)hideYearNumberAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  YearViewYearHeader *header;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  id v11;

  v3 = a3;
  if (-[YearMultipleMonthView eligibleToShowYearNumber](self, "eligibleToShowYearNumber"))
  {
    v5 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      header = self->_header;
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewYearHeader calendarDate](header, "calendarDate"));
      *(_DWORD *)buf = 134217984;
      v11 = objc_msgSend(v8, "year");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Hiding year number: [%lu]", buf, 0xCu);

    }
    if (v3)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10009A718;
      v9[3] = &unk_1001B2538;
      v9[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.3);
    }
    else
    {
      -[YearViewYearHeader setAlpha:](self->_header, "setAlpha:", 0.0);
    }
  }
}

- (void)showYearNumberAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  YearViewYearHeader *header;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  id v11;

  v3 = a3;
  if (-[YearMultipleMonthView eligibleToShowYearNumber](self, "eligibleToShowYearNumber"))
  {
    v5 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      header = self->_header;
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[YearViewYearHeader calendarDate](header, "calendarDate"));
      *(_DWORD *)buf = 134217984;
      v11 = objc_msgSend(v8, "year");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Showing year number: [%lu]", buf, 0xCu);

    }
    if (v3)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10009A87C;
      v9[3] = &unk_1001B2538;
      v9[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.3);
    }
    else
    {
      -[YearViewYearHeader setAlpha:](self->_header, "setAlpha:", 1.0);
    }
  }
}

+ (double)_heightForViewWithVisibleHeader:(BOOL)a3 windowSize:(CGSize)a4 heightSizeClass:(int64_t)a5 orientation:(int64_t)a6
{
  double height;
  double width;
  _BOOL4 v10;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  *(_QWORD *)&v12 = objc_opt_class(a1).n128_u64[0];
  objc_msgSend(objc_msgSend(v13, "monthClass", v12), "heightForInterfaceOrientation:windowSize:heightSizeClass:", a6, a5, width, height);
  v15 = v14;
  if (v10)
  {
    *(_QWORD *)&v16 = objc_opt_class(a1).n128_u64[0];
    objc_msgSend(objc_msgSend(v17, "headerClass", v16), "heightForWindowSize:", width, height);
    return v15 + v18;
  }
  return v15;
}

+ (BOOL)_headerEligibleForCalendarDate:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "year");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDateByAddingMonths:", -1));

  LOBYTE(v3) = objc_msgSend(v5, "year") != v4;
  return (char)v3;
}

- (CGSize)monthViewSubviewSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_monthViews, "lastObject"));
  -[YearMultipleMonthView insetBounds](self, "insetBounds");
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_initializeHeaderView
{
  NSObject *v2;
  double v4;
  id v5;
  id v6;
  void *v7;
  YearViewYearHeader *v8;
  YearViewYearHeader *header;
  uint8_t v10[16];

  if (self->_header)
  {
    v2 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "The header already been initialized.", v10, 2u);
    }
  }
  else
  {
    *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
    v6 = objc_alloc((Class)objc_msgSend(v5, "headerClass", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[YearMultipleMonthView calendarDate](self, "calendarDate"));
    v8 = (YearViewYearHeader *)objc_msgSend(v6, "initWithCalendarDate:", v7);
    header = self->_header;
    self->_header = v8;

    self->_headerIsInViewHierarchy = 0;
    -[YearMultipleMonthView _reloadHeaderView](self, "_reloadHeaderView");
  }
}

- (void)_initializeMonthViews
{
  NSObject *v2;
  NSArray *v4;
  double v5;
  id v6;
  objc_class *v7;
  objc_class *v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  NSArray *monthViews;
  id v13;
  uint8_t buf[16];

  if (self->_monthViews)
  {
    v2 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Month views have already been initialized.", buf, 2u);
    }
  }
  else
  {
    v4 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    v13 = (id)objc_claimAutoreleasedReturnValue(-[YearMultipleMonthView calendarDate](self, "calendarDate"));
    *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
    v7 = (objc_class *)objc_msgSend(v6, "monthClass", v5);
    if (v7)
    {
      v8 = v7;
      v9 = -[YearMultipleMonthView maximumNumberOfMonths](self, "maximumNumberOfMonths");
      if (v9)
      {
        v10 = v9;
        do
        {
          v11 = objc_msgSend([v8 alloc], "initWithCalendarDate:calendar:", v13, self->_calendar);
          -[YearMultipleMonthView addSubview:](self, "addSubview:", v11);
          -[NSArray addObject:](v4, "addObject:", v11);

          --v10;
        }
        while (v10);
      }
    }
    monthViews = self->_monthViews;
    self->_monthViews = v4;

    -[YearMultipleMonthView _reloadMonthViews](self, "_reloadMonthViews");
  }
}

- (void)_reloadHeaderView
{
  void *v3;

  if (!-[YearMultipleMonthView eligibleToShowYearNumber](self, "eligibleToShowYearNumber"))
  {
    -[YearViewYearHeader setHidden:](self->_header, "setHidden:", 1);
    -[YearViewYearHeader removeFromSuperview](self->_header, "removeFromSuperview");
    self->_headerIsInViewHierarchy = 0;
LABEL_6:
    -[YearMultipleMonthView setNeedsLayout](self, "setNeedsLayout");
    return;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[YearMultipleMonthView calendarDate](self, "calendarDate"));
  -[YearViewYearHeader setCalendarDate:](self->_header, "setCalendarDate:", v3);

  -[YearViewYearHeader setHidden:](self->_header, "setHidden:", 0);
  if (!self->_headerIsInViewHierarchy)
  {
    -[YearMultipleMonthView addSubview:](self, "addSubview:", self->_header);
    self->_headerIsInViewHierarchy = 1;
    goto LABEL_6;
  }
}

- (void)_reloadMonthViews
{
  void *v3;
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[YearMultipleMonthView calendarDate](self, "calendarDate"));
  v4 = objc_msgSend(v3, "year");
  self->_containsLastMonthOfYear = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_monthViews;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
        if (v8)
        {
          v8 = 1;
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "setHidden:", 1);
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "setHidden:", 0, (_QWORD)v14);
          objc_msgSend(v11, "setCalendarDate:", v3);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDateByAddingMonths:", 1));
          v13 = objc_msgSend(v12, "year");
          v8 = v13 != v4;
          if (v13 != v4)
            self->_containsLastMonthOfYear = 1;

          v3 = v12;
        }
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (EKCalendarDate)calendarDate
{
  return self->_calendarDate;
}

- (EKUIOverlayCalendarSignificantDatesProvider)overlaySignificantDatesProvider
{
  return self->_overlaySignificantDatesProvider;
}

- (void)setEndCalendarDate:(id)a3
{
  objc_storeStrong((id *)&self->_endCalendarDate, a3);
}

- (unint64_t)maximumNumberOfMonths
{
  return self->_maximumNumberOfMonths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endCalendarDate, 0);
  objc_storeStrong((id *)&self->_overlaySignificantDatesProvider, 0);
  objc_storeStrong((id *)&self->_calendarDate, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_monthViews, 0);
}

+ (Class)headerClass
{
  uint64_t v2;

  v2 = sub_10002E49C((uint64_t)a1);
  sub_10002E48C(v2);
  return 0;
}

+ (Class)monthClass
{
  uint64_t v2;

  v2 = sub_10002E49C((uint64_t)a1);
  sub_10002E48C(v2);
  return 0;
}

@end
