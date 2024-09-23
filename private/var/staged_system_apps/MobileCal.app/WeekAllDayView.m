@implementation WeekAllDayView

- (int64_t)daysToDisplay
{
  return (int64_t)-[objc_class numMultiDays](-[WeekAllDayView weekViewClass](self, "weekViewClass"), "numMultiDays");
}

- (Class)weekViewClass
{
  unsigned int v2;
  __objc2_class **v3;

  v2 = -[WeekAllDayView useMultiDayHeaderStyle](self, "useMultiDayHeaderStyle");
  v3 = off_1001B16A0;
  if (!v2)
    v3 = off_1001B1AF8;
  return (Class)(id)objc_opt_class(*v3);
}

- (WeekAllDayView)initWithFrame:(CGRect)a3 orientation:(int64_t)a4 numberOfDaysToDisplay:(unint64_t)a5 opaque:(BOOL)a6 backgroundColor:(id)a7 rightClickDelegate:(id)a8
{
  _BOOL8 v9;
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  WeekAllDayView *v19;
  WeekAllDayView *v20;
  uint64_t v21;
  uint64_t v22;
  NSCalendar *calendar;
  NSMutableArray *v24;
  NSMutableArray *layedOutRows;
  NSMutableArray *v26;
  NSMutableArray *layedOutRowsForEachDay;
  id v28;
  UIScrollView *v29;
  UIScrollView *scroller;
  uint64_t v31;
  void *v32;
  WeekViewAllDayContents *v33;
  WeekViewAllDayContents *v34;
  WeekViewAllDayContents *contentView;
  uint64_t v36;
  void *v37;
  WeekViewAllDayContents *v38;
  id v39;
  UIView *v40;
  UIView *topSeparator;
  void *v42;
  UIView *v43;
  UIView *bottomSeparator;
  void *v45;
  NSMutableDictionary *v46;
  NSMutableDictionary *temporaryViewCacheByDay;
  uint64_t v48;
  NSMutableDictionary *cachedVisibleHeightMap;
  void *v50;
  objc_super v52;

  v9 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a7;
  v18 = a8;
  v52.receiver = self;
  v52.super_class = (Class)WeekAllDayView;
  v19 = -[WeekAllDayView initWithFrame:](&v52, "initWithFrame:", x, y, width, height);
  v20 = v19;
  if (v19)
  {
    -[WeekAllDayView setAutoresizingMask:](v19, "setAutoresizingMask:", 2);
    -[WeekAllDayView setBackgroundColor:](v20, "setBackgroundColor:", v17);
    v21 = CUIKCalendar(-[WeekAllDayView setOpaque:](v20, "setOpaque:", v9));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    calendar = v20->_calendar;
    v20->_calendar = (NSCalendar *)v22;

    v20->_orientation = a4;
    v24 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    layedOutRows = v20->_layedOutRows;
    v20->_layedOutRows = v24;

    v26 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    layedOutRowsForEachDay = v20->_layedOutRowsForEachDay;
    v20->_layedOutRowsForEachDay = v26;

    v20->_daysToDisplay = a5;
    v20->_allowsOccurrenceSelection = 1;
    v28 = objc_alloc((Class)UIScrollView);
    -[WeekViewAllDayContents bounds](v20->_contentView, "bounds");
    v29 = (UIScrollView *)objc_msgSend(v28, "initWithFrame:");
    scroller = v20->_scroller;
    v20->_scroller = v29;

    -[UIScrollView setAutoresizingMask:](v20->_scroller, "setAutoresizingMask:", 2);
    -[UIScrollView setShowsVerticalScrollIndicator:](v20->_scroller, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v20->_scroller, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setBounces:](v20->_scroller, "setBounces:", 1);
    -[UIScrollView setScrollsToTop:](v20->_scroller, "setScrollsToTop:", 0);
    v31 = CUIKAllDayBackgroundColor(-[UIScrollView setDelegate:](v20->_scroller, "setDelegate:", v20));
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    -[UIScrollView setBackgroundColor:](v20->_scroller, "setBackgroundColor:", v32);

    -[UIScrollView _setAutoScrollEnabled:](v20->_scroller, "_setAutoScrollEnabled:", 0);
    -[WeekAllDayView addSubview:](v20, "addSubview:", v20->_scroller);
    v33 = [WeekViewAllDayContents alloc];
    -[WeekAllDayView bounds](v20, "bounds");
    v34 = -[WeekViewAllDayContents initWithFrame:](v33, "initWithFrame:");
    contentView = v20->_contentView;
    v20->_contentView = v34;

    -[WeekViewAllDayContents setAutoresizingMask:](v20->_contentView, "setAutoresizingMask:", 2);
    v36 = CUIKAllDayBackgroundColor(-[WeekViewAllDayContents setDelegate:](v20->_contentView, "setDelegate:", v20));
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    -[WeekViewAllDayContents setBackgroundColor:](v20->_contentView, "setBackgroundColor:", v37);

    v38 = v20->_contentView;
    v39 = objc_msgSend(objc_alloc((Class)EKUIRightClickEmptySpaceInteraction), "initWithDelegate:", v18);
    -[WeekViewAllDayContents addInteraction:](v38, "addInteraction:", v39);

    -[UIScrollView addSubview:](v20->_scroller, "addSubview:", v20->_contentView);
    v40 = (UIView *)objc_alloc_init((Class)UIView);
    topSeparator = v20->_topSeparator;
    v20->_topSeparator = v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    -[UIView setBackgroundColor:](v20->_topSeparator, "setBackgroundColor:", v42);

    -[UIView setHidden:](v20->_topSeparator, "setHidden:", 1);
    -[WeekAllDayView addSubview:](v20, "addSubview:", v20->_topSeparator);
    v43 = (UIView *)objc_alloc_init((Class)UIView);
    bottomSeparator = v20->_bottomSeparator;
    v20->_bottomSeparator = v43;

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    -[UIView setBackgroundColor:](v20->_bottomSeparator, "setBackgroundColor:", v45);

    -[UIView setHidden:](v20->_bottomSeparator, "setHidden:", 1);
    -[WeekAllDayView addSubview:](v20, "addSubview:", v20->_bottomSeparator);
    v46 = objc_opt_new(NSMutableDictionary);
    temporaryViewCacheByDay = v20->_temporaryViewCacheByDay;
    v20->_temporaryViewCacheByDay = v46;

    v48 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cachedVisibleHeightMap = v20->_cachedVisibleHeightMap;
    v20->_cachedVisibleHeightMap = (NSMutableDictionary *)v48;

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v50, "addObserver:selector:name:object:", v20, "_localeChanged:", CUIKLocaleChangedNotification, 0);
    objc_msgSend(v50, "addObserver:selector:name:object:", v20, "_significantTimeChanged:", CUIKCalendarModelSignificantTimeChangeNotification, 0);
    objc_msgSend(v50, "addObserver:selector:name:object:", v20, "_contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v20;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKLocaleChangedNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CUIKCalendarModelSignificantTimeChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)WeekAllDayView;
  -[WeekAllDayView dealloc](&v4, "dealloc");
}

- (void)_localeChanged:(id)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self, a2))
    +[DayNavigationViewCell localeChanged](LargeDayNavigationViewCell, "localeChanged");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_dayNumberViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "updateOverlay", (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[WeekAllDayView _setNeedsHeaderUpdate](self, "_setNeedsHeaderUpdate");
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  int IsRegularInViewHierarchy;
  __objc2_class **v5;

  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self, a2);
  v5 = off_1001B1630;
  if (!IsRegularInViewHierarchy)
    v5 = off_1001B1698;
  -[__objc2_class contentSizeCategoryChanged](*v5, "contentSizeCategoryChanged");
  -[WeekAllDayView _setNeedsHeaderUpdate](self, "_setNeedsHeaderUpdate");
}

- (void)iterateThroughEachAllDayRow:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD, char *, char *);
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *j;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];

  v4 = (void (**)(id, uint64_t, _QWORD, char *, char *))a3;
  if (-[WeekAllDayView splitMultiDayEvents](self, "splitMultiDayEvents"))
  {
    v36 = 0uLL;
    v37 = 0uLL;
    v34 = 0uLL;
    v35 = 0uLL;
    v5 = self->_layedOutRowsForEachDay;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v35;
      v24 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          v33 = 0;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v12 = v11;
          v13 = (char *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
          if (v13)
          {
            v14 = v13;
            v15 = 0;
            v16 = *(_QWORD *)v30;
            while (2)
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v30 != v16)
                  objc_enumerationMutation(v12);
                v4[2](v4, v8, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j), &j[v15], &v33);
                if (v33)
                {

                  goto LABEL_28;
                }
              }
              v14 = (char *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
              v15 += (uint64_t)j;
              if (v14)
                continue;
              break;
            }
          }

          ++v8;
          v9 = v24;
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v7);
    }
  }
  else
  {
    v27 = 0uLL;
    v28 = 0uLL;
    v25 = 0uLL;
    v26 = 0uLL;
    v5 = self->_layedOutRows;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v26;
LABEL_20:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v5);
        v23 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v22);
        v33 = 0;
        v4[2](v4, -1, v23, (char *)(v20 + v22), &v33);
        if (v33)
          break;
        if (v19 == (id)++v22)
        {
          v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
          v20 += v22;
          if (v19)
            goto LABEL_20;
          break;
        }
      }
    }
  }
LABEL_28:

}

- (void)iterateThroughEachOccurrence:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002FE44;
  v5[3] = &unk_1001B29A8;
  v6 = a3;
  v4 = v6;
  -[WeekAllDayView iterateThroughEachAllDayRow:](self, "iterateThroughEachAllDayRow:", v5);

}

- (void)setUseMultiDayHeaderStyle:(BOOL)a3
{
  if (self->_useMultiDayHeaderStyle != a3)
  {
    self->_useMultiDayHeaderStyle = a3;
    -[WeekAllDayView updateSeparatorVisibility](self, "updateSeparatorVisibility");
  }
}

- (void)updateSeparatorVisibility
{
  UIView *topSeparator;
  uint64_t v4;
  uint64_t v5;

  if (self->_useMultiDayHeaderStyle)
  {
    topSeparator = self->_topSeparator;
    v4 = 1;
  }
  else
  {
    topSeparator = self->_topSeparator;
    if (!self->_showSeparatorLines)
    {
      v5 = 1;
      -[UIView setHidden:](topSeparator, "setHidden:", 1);
      goto LABEL_6;
    }
    v4 = 0;
  }
  -[UIView setHidden:](topSeparator, "setHidden:", v4);
  v5 = 0;
LABEL_6:
  -[UIView setHidden:](self->_bottomSeparator, "setHidden:", v5);
}

- (void)setUsesSmallText:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  if (self->_usesSmallText != a3)
  {
    self->_usesSmallText = a3;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100030078;
    v3[3] = &unk_1001B29C8;
    v4 = a3;
    -[WeekAllDayView iterateThroughEachOccurrence:](self, "iterateThroughEachOccurrence:", v3);
  }
}

- (void)layedOutRowsRemoveAllObjects
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (-[WeekAllDayView splitMultiDayEvents](self, "splitMultiDayEvents"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = self->_layedOutRowsForEachDay;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "removeAllObjects", (_QWORD)v8);
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
  else
  {
    -[NSMutableArray removeAllObjects](self->_layedOutRows, "removeAllObjects");
  }
}

- (void)showOverlayMonthInCellAtOffset:(double)a3 animated:(BOOL)a4
{
  NSArray *dayNumberViews;
  _QWORD v8[6];
  BOOL v9;

  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self, a2))
  {
    dayNumberViews = self->_dayNumberViews;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100030278;
    v8[3] = &unk_1001B29F0;
    v8[4] = self;
    *(double *)&v8[5] = a3;
    v9 = a4;
    -[NSArray enumerateObjectsUsingBlock:](dayNumberViews, "enumerateObjectsUsingBlock:", v8);
  }
}

- (void)setShowSeparatorLines:(BOOL)a3
{
  self->_showSeparatorLines = a3;
  -[WeekAllDayView updateSeparatorVisibility](self, "updateSeparatorVisibility");
}

- (void)setContentOffset:(CGPoint)a3
{
  -[UIScrollView setContentOffset:](self->_scroller, "setContentOffset:", a3.x, a3.y);
}

- (CGPoint)contentOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[UIScrollView contentOffset](self->_scroller, "contentOffset");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[WeekAllDayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)occurrenceHeight
{
  uint64_t v3;
  unsigned int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  double v23;

  v3 = EKUIWidthSizeClassForViewHierarchy(self);
  v4 = -[objc_class usesSmallTextForIsCompact:](-[WeekAllDayView weekViewClass](self, "weekViewClass"), "usesSmallTextForIsCompact:", v3 == 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance"));
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "weekAllDayOccurrenceHeightSmallText");
    v8 = v7;

    if (v8 < 0.0)
    {
      v9 = +[EKDayOccurrenceView heightForAllDayOccurrenceForSizeClass:usesSmallText:](EKDayOccurrenceView, "heightForAllDayOccurrenceForSizeClass:usesSmallText:", v3, 1);
      v12 = CalRoundToScreenScale(v9, v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance"));
      objc_msgSend(v13, "setWeekAllDayOccurrenceHeightSmallText:", v12);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance"));
    objc_msgSend(v14, "weekAllDayOccurrenceHeightSmallText");
  }
  else
  {
    objc_msgSend(v5, "weekAllDayOccurrenceHeight");
    v17 = v16;

    if (v17 < 0.0)
    {
      v18 = +[EKDayOccurrenceView heightForAllDayOccurrenceForSizeClass:usesSmallText:](EKDayOccurrenceView, "heightForAllDayOccurrenceForSizeClass:usesSmallText:", v3, 0);
      v21 = CalRoundToScreenScale(v18, v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance"));
      objc_msgSend(v22, "setWeekAllDayOccurrenceHeight:", v21);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance"));
    objc_msgSend(v14, "weekAllDayOccurrenceHeight");
  }
  v23 = v15;

  return v23;
}

- (void)_computeDayStartsAndEndDate
{
  void *v3;
  void *v4;
  uint64_t v5;
  char IsLeftToRight;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSDateComponents *v14;
  NSDateComponents *endDate;
  id obj;

  if (self->_startDate && self->_calendar)
  {
    obj = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", self->_daysToDisplay);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar timeZone](self->_calendar, "timeZone"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDateComponents:timeZone:](EKCalendarDate, "calendarDateWithDateComponents:timeZone:", self->_startDate, v3));
    IsLeftToRight = CalTimeDirectionIsLeftToRight(v4, v5);
    if ((IsLeftToRight & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateByAddingDays:", self->_daysToDisplay - 1));

      v7 = -1;
      v4 = (void *)v8;
    }
    v9 = obj;
    if (self->_daysToDisplay)
    {
      v10 = 0;
      do
      {
        objc_msgSend(v9, "addObject:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateByAddingDays:", v7));

        v9 = obj;
        ++v10;
        v4 = v11;
      }
      while (v10 < self->_daysToDisplay);
    }
    else
    {
      v11 = v4;
    }
    objc_storeStrong((id *)&self->_dayStarts, v9);
    if ((IsLeftToRight & 1) != 0)
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "lastObject"));
    else
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
    v13 = v12;
    v14 = (NSDateComponents *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allComponents"));
    endDate = self->_endDate;
    self->_endDate = v14;

    -[WeekAllDayView _buildDayNumberViews](self, "_buildDayNumberViews");
    -[WeekAllDayView _updateShouldAnnotateByDay](self, "_updateShouldAnnotateByDay");

  }
}

- (BOOL)_shouldAnnotateAppEntitiesForDay:(id)a3
{
  id v4;
  NSMutableDictionary *shouldAnnotateByDay;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  shouldAnnotateByDay = self->_shouldAnnotateByDay;
  if (!shouldAnnotateByDay)
  {
    -[WeekAllDayView _updateShouldAnnotateByDay](self, "_updateShouldAnnotateByDay");
    shouldAnnotateByDay = self->_shouldAnnotateByDay;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](shouldAnnotateByDay, "objectForKeyedSubscript:", v4));
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)_updateShouldAnnotateByDay
{
  WeekAllDayViewDelegate **p_delegate;
  id WeakRetained;
  char v5;
  NSMutableDictionary *shouldAnnotateByDay;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  NSArray *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "weekAllDayViewShouldAnnotateAppEntities:onDayStarting:");

  if ((v5 & 1) != 0)
  {
    shouldAnnotateByDay = self->_shouldAnnotateByDay;
    if (shouldAnnotateByDay)
    {
      -[NSMutableDictionary removeAllObjects](shouldAnnotateByDay, "removeAllObjects");
    }
    else
    {
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", self->_daysToDisplay));
      v8 = self->_shouldAnnotateByDay;
      self->_shouldAnnotateByDay = v7;

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = self->_dayStarts;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12);
          v14 = objc_loadWeakRetained((id *)p_delegate);
          v15 = objc_msgSend(v14, "weekAllDayViewShouldAnnotateAppEntities:onDayStarting:", self, v13);

          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v15));
          v17 = self->_shouldAnnotateByDay;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "date"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

  }
}

- (void)shouldAnnotateAppEntitiesChanged
{
  _QWORD v3[5];

  -[WeekAllDayView _updateShouldAnnotateByDay](self, "_updateShouldAnnotateByDay");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000308DC;
  v3[3] = &unk_1001B2A18;
  v3[4] = self;
  -[WeekAllDayView iterateThroughEachOccurrence:](self, "iterateThroughEachOccurrence:", v3);
}

- (void)setStartDate:(id)a3
{
  NSDateComponents *v4;
  NSDateComponents *startDate;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_startDate) & 1) == 0)
  {
    v4 = (NSDateComponents *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateComponentsForDateOnly"));
    startDate = self->_startDate;
    self->_startDate = v4;

    -[WeekAllDayView _computeDayStartsAndEndDate](self, "_computeDayStartsAndEndDate");
    -[WeekAllDayView _setNeedsHeaderUpdate](self, "_setNeedsHeaderUpdate");
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

    -[WeekAllDayView _computeDayStartsAndEndDate](self, "_computeDayStartsAndEndDate");
    -[WeekAllDayView _setNeedsHeaderUpdate](self, "_setNeedsHeaderUpdate");
  }

}

- (void)setTimeZone:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar timeZone](self->_calendar, "timeZone"));
  v5 = objc_msgSend(v6, "isEqualToTimeZone:", v4);

  if ((v5 & 1) == 0)
  {
    -[NSCalendar setTimeZone:](self->_calendar, "setTimeZone:", v6);
    -[WeekAllDayView _computeDayStartsAndEndDate](self, "_computeDayStartsAndEndDate");
    -[WeekAllDayView _setNeedsHeaderUpdate](self, "_setNeedsHeaderUpdate");
  }

}

- (NSTimeZone)timeZone
{
  return -[NSCalendar timeZone](self->_calendar, "timeZone");
}

- (void)setFixedDayWidth:(double)a3
{
  if (self->_fixedDayWidth != a3)
  {
    self->_fixedDayWidth = a3;
    -[WeekAllDayView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)selectedOccurrenceView
{
  return self->_selectedOccurrenceView;
}

- (void)rectBecameVisible:(CGRect)a3
{
  double width;
  double y;
  double x;
  double v7;
  CGFloat v8;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NSMutableDictionary removeAllObjects](self->_cachedVisibleHeightMap, "removeAllObjects", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIScrollView contentSize](self->_scroller, "contentSize");
  v8 = v7;
  -[WeekAllDayView updateTotalRowCountWithContainerRect:](self, "updateTotalRowCountWithContainerRect:", x, y, width, v7);
  self->_latestVisibleRect.origin.x = x;
  self->_latestVisibleRect.origin.y = y;
  self->_latestVisibleRect.size.width = width;
  self->_latestVisibleRect.size.height = v8;
}

- (id)occurrenceViewForOccurrence:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = sub_100030CE8;
    v15 = sub_100030CF8;
    v16 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100030D00;
    v8[3] = &unk_1001B2A40;
    v9 = v4;
    v10 = &v11;
    -[WeekAllDayView iterateThroughEachOccurrence:](self, "iterateThroughEachOccurrence:", v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)scrollToEvent:(id)a3 animating:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  UIScrollView *scroller;
  id v11;

  v4 = a4;
  v7 = a3;
  v8 = v7;
  if (self->_scroller)
  {
    v11 = v7;
    if (v4 && !self->_scrollingToOccurrence)
      objc_storeStrong((id *)&self->_scrollingToOccurrence, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView occurrenceViewForOccurrence:](self, "occurrenceViewForOccurrence:", v11));
    scroller = self->_scroller;
    objc_msgSend(v9, "frame");
    -[UIScrollView scrollRectToVisible:animated:](scroller, "scrollRectToVisible:animated:", v4);

    v8 = v11;
  }

}

- (void)setAllowsOccurrenceSelection:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_allowsOccurrenceSelection != a3)
  {
    self->_allowsOccurrenceSelection = a3;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100030EAC;
    v3[3] = &unk_1001B2A18;
    v3[4] = self;
    -[WeekAllDayView iterateThroughEachOccurrence:](self, "iterateThroughEachOccurrence:", v3);
  }
}

- (void)setViewsDimmed:(BOOL)a3 forEvent:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030F78;
  v7[3] = &unk_1001B2A68;
  v8 = a4;
  v9 = a3;
  v6 = v8;
  -[WeekAllDayView iterateThroughEachOccurrence:](self, "iterateThroughEachOccurrence:", v7);

}

- (id)selectedEvent
{
  return self->_selectedEvent;
}

- (BOOL)hasOccurrences
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000310B0;
  v4[3] = &unk_1001B2A90;
  v4[4] = &v5;
  -[WeekAllDayView iterateThroughEachOccurrence:](self, "iterateThroughEachOccurrence:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)selectEvent:(id)a3
{
  EKEvent *v4;
  EKEvent *v5;
  NSObject *v6;
  _QWORD v7[4];
  EKEvent *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  const char *v15;

  v4 = (EKEvent *)a3;
  v5 = v4;
  if (v4 && self->_selectedEvent != v4)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100031234;
    v7[3] = &unk_1001B2A40;
    v8 = v4;
    v9 = &v10;
    -[WeekAllDayView iterateThroughEachOccurrence:](self, "iterateThroughEachOccurrence:", v7);
    if (!*((_BYTE *)v11 + 24))
    {
      v6 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[WeekAllDayView selectEvent:]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s: Asked to select an event we can't find!", buf, 0xCu);
      }
    }

    _Block_object_dispose(&v10, 8);
  }

}

- (void)setDimmedOccurrence:(id)a3
{
  EKEvent **p_dimmedOccurrence;
  id v6;

  p_dimmedOccurrence = &self->_dimmedOccurrence;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", *p_dimmedOccurrence) & 1) == 0)
  {
    if (*p_dimmedOccurrence)
      -[WeekAllDayView setViewsDimmed:forEvent:](self, "setViewsDimmed:forEvent:", 0);
    objc_storeStrong((id *)&self->_dimmedOccurrence, a3);
    if (*p_dimmedOccurrence)
      -[WeekAllDayView setViewsDimmed:forEvent:](self, "setViewsDimmed:forEvent:", 1);
  }

}

- (NSArray)occurrenceViews
{
  id v3;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000313B8;
  v5[3] = &unk_1001B2A18;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = v3;
  -[WeekAllDayView iterateThroughEachOccurrence:](self, "iterateThroughEachOccurrence:", v5);

  return (NSArray *)v3;
}

- (id)occurrenceViewForEvent:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_100030CE8;
  v14 = sub_100030CF8;
  v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000314E8;
  v7[3] = &unk_1001B2A40;
  v4 = a3;
  v8 = v4;
  v9 = &v10;
  -[WeekAllDayView iterateThroughEachOccurrence:](self, "iterateThroughEachOccurrence:", v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (int64_t)dayIndexForCalendarDate:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_dayStarts;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    v10 = -1;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "isEqual:", v4, (_QWORD)v13))
          v10 = (int64_t)i + v8;
      }
      v8 += (uint64_t)v7;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = -[WeekAllDayView useMultiDayHeaderStyle](self, "useMultiDayHeaderStyle");
  if (v7 && (v8 & 1) != 0)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_100030CE8;
    v19 = sub_100030CF8;
    v20 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000319D4;
    v11[3] = &unk_1001B2AB8;
    v14 = -[WeekAllDayView dayIndexForCalendarDate:](self, "dayIndexForCalendarDate:", v7);
    v12 = v6;
    v13 = &v15;
    -[WeekAllDayView iterateThroughEachAllDayRow:](self, "iterateThroughEachAllDayRow:", v11);
    v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[WeekAllDayView occurrenceViewForEvent:](self, "occurrenceViewForEvent:", v6));
  }

  return v9;
}

- (id)_getSortedBlocksFromOccurrenceBlocks:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)NSArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _calendarOrderSortDescriptor](self, "_calendarOrderSortDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _numberOfDaysSortDescriptor](self, "_numberOfDaysSortDescriptor"));
  v8 = objc_msgSend(v5, "initWithObjects:", v6, v7, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingDescriptors:", v8));
  return v9;
}

- (void)addViewToScroller:(id)a3
{
  id v4;
  UIScrollView *v5;
  UIScrollView *scroller;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v4 = a3;
  if (self->_scroller)
  {
    v16 = v4;
    v5 = (UIScrollView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
    scroller = self->_scroller;

    v4 = v16;
    if (v5 != scroller)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "superview"));
      objc_msgSend(v16, "frame");
      objc_msgSend(v7, "convertRect:toView:", self->_scroller);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;

      -[UIScrollView addSubview:](self->_scroller, "addSubview:", v16);
      objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
      v4 = v16;
    }
  }

}

- (BOOL)scrollerIsParentOfView:(id)a3
{
  UIScrollView *scroller;
  UIScrollView *v4;

  scroller = self->_scroller;
  v4 = (UIScrollView *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "superview"));
  LOBYTE(scroller) = scroller == v4;

  return (char)scroller;
}

- (void)prepareForReuse
{
  NSMutableSet *v3;
  NSMutableSet *reusableViews;
  _QWORD v5[5];

  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", 0));
  reusableViews = self->_reusableViews;
  self->_reusableViews = v3;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100031D84;
  v5[3] = &unk_1001B2A18;
  v5[4] = self;
  -[WeekAllDayView iterateThroughEachOccurrence:](self, "iterateThroughEachOccurrence:", v5);
  -[WeekAllDayView layedOutRowsRemoveAllObjects](self, "layedOutRowsRemoveAllObjects");
}

- (void)saveTemporaryViews
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100031E44;
  v2[3] = &unk_1001B2A18;
  v2[4] = self;
  -[WeekAllDayView iterateThroughEachOccurrence:](self, "iterateThroughEachOccurrence:", v2);
}

- (void)clearTemporaryViews
{
  id v3;
  id v4;
  void *i;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *j;
  void *v12;
  void *v13;
  id obj;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_temporaryViewCacheByDay, "allKeys"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(obj);
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_temporaryViewCacheByDay, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i)));
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v17;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(_QWORD *)v17 != v10)
                objc_enumerationMutation(v7);
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j)));
              v13 = v12;
              if (v12)
              {
                objc_msgSend(v12, "setHidden:", 1);
                objc_msgSend(v13, "setOccurrence:", 0);
                -[NSMutableSet addObject:](self->_reusableViews, "addObject:", v13);
              }

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v9);
        }

        objc_msgSend(v6, "removeAllObjects");
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }

}

- (id)_allDayOccurrenceBlocksForEvents:(id)a3 rangeStart:(id)a4 rangeEnd:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  char *v16;
  char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  EKAllDayOccurrenceBlock *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  EKAllDayOccurrenceBlock *v29;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  LOBYTE(a5) = -[WeekAllDayView splitMultiDayEvents](self, "splitMultiDayEvents");
  v11 = objc_msgSend(v8, "count");
  if ((a5 & 1) != 0)
  {
    if (v11)
    {
      v12 = 0;
      v31 = v8;
      do
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v12, v31));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startCalendarDate"));
        v33 = v13;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "endCalendarDate"));
        v15 = (unint64_t)objc_msgSend(v32, "differenceInDays:", v14);
        if ((v15 & 0x8000000000000000) == 0)
        {
          v16 = 0;
          v17 = (char *)(v15 + 1);
          do
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "calendarDateByAddingDays:", v16));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "calendarDateForEndOfDay"));
            if (objc_msgSend(v18, "compare:", v9) != (id)-1 && objc_msgSend(v19, "compare:", v10) != (id)1)
            {
              v20 = CUIKDayRangeForOccurenceDates(v18, v19, v9, v10);
              v22 = -[EKAllDayOccurrenceBlock initWithEventIndex:calendarOrder:dayRange:]([EKAllDayOccurrenceBlock alloc], "initWithEventIndex:calendarOrder:dayRange:", v12, v12, v20, v21);
              objc_msgSend(v34, "addObject:", v22);

            }
            ++v16;
          }
          while (v17 != v16);
        }

        ++v12;
        v8 = v31;
      }
      while (v12 < (unint64_t)objc_msgSend(v31, "count"));
    }
  }
  else if (v11)
  {
    v23 = 0;
    do
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v23));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "startCalendarDate"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "endCalendarDate"));
      v27 = CUIKDayRangeForOccurenceDates(v25, v26, v9, v10);
      v29 = -[EKAllDayOccurrenceBlock initWithEventIndex:calendarOrder:dayRange:]([EKAllDayOccurrenceBlock alloc], "initWithEventIndex:calendarOrder:dayRange:", v23, v23, v27, v28);
      objc_msgSend(v34, "addObject:", v29);

      ++v23;
    }
    while (v23 < (unint64_t)objc_msgSend(v8, "count"));
  }

  return v34;
}

- (id)_dayOccurrenceViewForEvent:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *temporaryViewCacheByDay;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  _BOOL8 v32;
  void *v33;
  _BOOL8 v34;
  uint64_t v35;
  double v36;
  double v37;
  __n128 v38;
  double v39;
  __n128 v40;
  _BOOL4 v42;

  v6 = a3;
  v7 = a4;
  temporaryViewCacheByDay = self->_temporaryViewCacheByDay;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "rangeStart")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](temporaryViewCacheByDay, "objectForKeyedSubscript:", v9));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarItemIdentifier"));
    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v11);

        goto LABEL_9;
      }
    }

  }
  v14 = objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->_reusableViews, "anyObject"));
  if (v14)
  {
    v13 = (void *)v14;
    -[NSMutableSet removeObject:](self->_reusableViews, "removeObject:", v14);
    objc_msgSend(v13, "prepareForReuse");
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[EKDayOccurrenceView occurrenceViewWithFrame:](EKDayOccurrenceView, "occurrenceViewWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height));
    -[WeekViewAllDayContents addSubview:](self->_contentView, "addSubview:", v13);
  }
LABEL_9:
  objc_msgSend(v13, "setHidden:", 0);
  objc_msgSend(v13, "setUsesSmallText:", self->_usesSmallText);
  objc_msgSend(v13, "setOccurrence:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _rangeStart](self, "_rangeStart"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "calendarDateByAddingDays:", objc_msgSend(v7, "rangeStart")));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startCalendarDate"));
  v18 = objc_msgSend(v16, "differenceInDays:", v17);

  objc_msgSend(v13, "setOccurrenceDateIndex:", v18);
  objc_msgSend(v13, "setDelegate:", self);
  objc_msgSend(v13, "setUserInteractionEnabled:", self->_allowsOccurrenceSelection);
  objc_msgSend(v13, "setDimmed:", 0);
  objc_msgSend(v13, "setHideText:", 0);
  objc_msgSend(v13, "setAllDayDrawingStyle:", 1);
  objc_msgSend(v13, "setOpaque:", 1);
  v19 = -[NSArray count](self->_dayStarts, "count");
  if (v19 > (unint64_t)objc_msgSend(v7, "rangeStart"))
  {
    v20 = -[NSArray count](self->_dayStarts, "count");
    if (v20 > (unint64_t)objc_msgSend(v7, "rangeEnd"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startCalendarDate"));
      objc_msgSend(v21, "absoluteTime");
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_dayStarts, "objectAtIndexedSubscript:", objc_msgSend(v7, "rangeStart")));
      objc_msgSend(v24, "absoluteTime");
      v42 = v23 < v25;

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endCalendarDate"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "calendarDateForDay"));
      objc_msgSend(v27, "absoluteTime");
      v29 = v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_dayStarts, "objectAtIndexedSubscript:", objc_msgSend(v7, "rangeEnd")));
      objc_msgSend(v30, "absoluteTime");
      v32 = v29 > v31;

      objc_msgSend(v13, "setHasPrecedingDuration:", v42);
      objc_msgSend(v13, "setHasTrailingDuration:", v32);
    }
  }
  objc_msgSend(v13, "setMultiAllDayRoundCorners:", -[WeekAllDayView useMultiDayHeaderStyle](self, "useMultiDayHeaderStyle"));
  -[WeekAllDayView _occurrencePadding](self, "_occurrencePadding");
  objc_msgSend(v13, "setPadding:");
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
  v34 = -[WeekAllDayView _shouldAnnotateAppEntitiesForDay:](self, "_shouldAnnotateAppEntitiesForDay:", v33);

  objc_msgSend(v13, "setShouldAnnotateAppEntities:", v34);
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self, v35))
  {
    +[EKDayOccurrenceView defaultMargin](EKDayOccurrenceView, "defaultMargin");
    v37 = v36;
    v38.n128_u64[0] = 0.5;
    v39 = CalFloorToScreenScale(v38);
    v40.n128_u64[0] = 1.5;
    objc_msgSend(v13, "setMargin:", CalFloorToScreenScale(v40), v39, 0.0, v37);
  }
  objc_msgSend(v13, "setNeedsDisplay");

  return v13;
}

- (void)_fadeInOccurrenceView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setAlpha:", 0.0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100032858;
    v7[3] = &unk_1001B2538;
    v8 = v6;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, 0.300000012);

  }
  else
  {
    objc_msgSend(v5, "setAlpha:", 1.0);
  }

}

- (id)_rangeStart
{
  char IsLeftToRight;
  NSArray *dayStarts;
  void *v5;

  IsLeftToRight = CalTimeDirectionIsLeftToRight(self, a2);
  dayStarts = self->_dayStarts;
  if ((IsLeftToRight & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](dayStarts, "firstObject"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](dayStarts, "lastObject"));
  return v5;
}

- (id)_rangeEnd
{
  char IsLeftToRight;
  NSArray *dayStarts;
  void *v5;
  void *v6;
  void *v7;

  IsLeftToRight = CalTimeDirectionIsLeftToRight(self, a2);
  dayStarts = self->_dayStarts;
  if ((IsLeftToRight & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](dayStarts, "lastObject"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](dayStarts, "firstObject"));
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calendarDateForEndOfDay"));

  return v7;
}

- (void)setOccurrences:(id)a3 animated:(BOOL)a4
{
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  int64_t v19;
  char *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  id WeakRetained;
  char v29;
  id v30;
  uint64_t v31;
  id v32;
  char v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  NSMutableSet *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *j;
  id v47;
  id v48;
  char v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *k;
  id v55;
  char v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  void *m;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  void *n;
  void *v71;
  void *v72;
  EKAllDayRow *v73;
  unint64_t v74;
  __objc2_class_ro **p_info;
  NSMutableArray *layedOutRows;
  id v77;
  void *v78;
  id v79;
  void *ii;
  id v81;
  void *v82;
  uint64_t v83;
  unint64_t v84;
  void *jj;
  void *v86;
  id v87;
  unint64_t v89;
  id v90;
  NSArray *specialDayTypes;
  NSArray *v92;
  NSArray *dayBadgeColors;
  NSArray *v94;
  NSArray *dayBadgeLocales;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  unint64_t v103;
  void *v104;
  _BOOL4 v105;
  id v106;
  void *v107;
  WeekAllDayView *v108;
  NSArray *v109;
  NSArray *v110;
  NSArray *v111;
  void *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];

  v105 = a4;
  v106 = a3;
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", self->_daysToDisplay));
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", self->_daysToDisplay));
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", self->_daysToDisplay));
  if (SLODWORD(self->_daysToDisplay) >= 1)
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
      -[NSArray addObject:](v5, "addObject:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[NSArray addObject:](v6, "addObject:", v10);

      -[NSArray addObject:](v7, "addObject:", &stru_1001B67C0);
      ++v8;
    }
    while (v8 < SLODWORD(self->_daysToDisplay));
  }
  v109 = v6;
  v110 = v7;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _rangeStart](self, "_rangeStart"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _rangeEnd](self, "_rangeEnd"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _allDayOccurrenceBlocksForEvents:rangeStart:rangeEnd:](self, "_allDayOccurrenceBlocksForEvents:rangeStart:rangeEnd:", v106, v112));
  v107 = v11;
  v108 = self;
  v12 = v5;
  if (objc_msgSend(v11, "count"))
  {
    v13 = 0;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "objectAtIndex:", objc_msgSend(v14, "eventIndex")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _dayOccurrenceViewForEvent:block:](self, "_dayOccurrenceViewForEvent:block:", v15, v14));
      objc_msgSend(v14, "setOccurrenceView:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "occurrenceView"));
      -[WeekAllDayView _fadeInOccurrenceView:animated:](self, "_fadeInOccurrenceView:animated:", v17, v105);

      v18 = -[WeekAllDayView _specialDayTypeForOccurrence:](self, "_specialDayTypeForOccurrence:", v15);
      if (v18)
      {
        v19 = v18;
        for (i = (char *)objc_msgSend(v14, "rangeStart"); i <= objc_msgSend(v14, "rangeEnd"); ++i)
        {
          if (i < (char *)-[NSArray count](v12, "count"))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v19));
            -[NSArray replaceObjectAtIndex:withObject:](v12, "replaceObjectAtIndex:withObject:", i, v21);

            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "calendar"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v22, "CGColor")));
            -[NSArray replaceObjectAtIndex:withObject:](v109, "replaceObjectAtIndex:withObject:", i, v23);

            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "calendar"));
            v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "locale"));
            v26 = (void *)v25;
            if (v25)
              v27 = (const __CFString *)v25;
            else
              v27 = &stru_1001B67C0;
            -[NSArray replaceObjectAtIndex:withObject:](v7, "replaceObjectAtIndex:withObject:", i, v27);

          }
        }
      }

      ++v13;
      v11 = v107;
      self = v108;
    }
    while (v13 < (unint64_t)objc_msgSend(v107, "count"));
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v29 = objc_opt_respondsToSelector(WeakRetained, "weekAllDayViewForTimeframeBefore:");

  if ((v29 & 1) != 0)
  {
    v30 = objc_loadWeakRetained((id *)&self->_delegate);
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "weekAllDayViewForTimeframeBefore:", self));

  }
  else
  {
    v31 = 0;
  }
  v32 = objc_loadWeakRetained((id *)&self->_delegate);
  v33 = objc_opt_respondsToSelector(v32, "weekAllDayViewForTimeframeAfter:");

  if ((v33 & 1) != 0)
  {
    v34 = objc_loadWeakRetained((id *)&self->_delegate);
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "weekAllDayViewForTimeframeAfter:", self));

  }
  else
  {
    v35 = 0;
  }
  v36 = v107;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _extractEventsStartingBeforeTimeframeFrom:](self, "_extractEventsStartingBeforeTimeframeFrom:", v107));
  v97 = v37;
  if (v31)
    v38 = (id)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _sortBlocks:intoRowsUsingDataFrom:](self, "_sortBlocks:intoRowsUsingDataFrom:", v37, v31));
  else
    v38 = v37;
  v99 = (void *)v31;
  v96 = v38;
  objc_msgSend(v107, "addObjectsFromArray:", v38);
  v39 = (void *)v35;
  if (v35)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _extractEventsEndingAfterTimeframeFrom:](self, "_extractEventsEndingAfterTimeframeFrom:", v107));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _sortBlocks:intoRowsUsingDataFrom:](self, "_sortBlocks:intoRowsUsingDataFrom:", v40, v35));
    objc_msgSend(v107, "addObjectsFromArray:", v41);

    v36 = v107;
  }
  v98 = v39;
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _getSortedBlocksFromOccurrenceBlocks:](self, "_getSortedBlocksFromOccurrenceBlocks:", v36));
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v42 = self->_reusableViews;
  v43 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v129, v137, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v130;
    do
    {
      for (j = 0; j != v44; j = (char *)j + 1)
      {
        if (*(_QWORD *)v130 != v45)
          objc_enumerationMutation(v42);
        objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * (_QWORD)j), "removeFromSuperview");
      }
      v44 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v129, v137, 16);
    }
    while (v44);
  }

  v47 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v101);
  v48 = objc_loadWeakRetained((id *)&self->_delegate);
  v49 = objc_opt_respondsToSelector(v48, "weekAllDayViewForTimeframeAfter:");

  if ((v49 & 1) != 0)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _extractEventsEndingAfterTimeframeFrom:](self, "_extractEventsEndingAfterTimeframeFrom:", v107));
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v125, v136, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v126;
      do
      {
        for (k = 0; k != v52; k = (char *)k + 1)
        {
          if (*(_QWORD *)v126 != v53)
            objc_enumerationMutation(v50);
          objc_msgSend(v47, "removeObject:", *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)k));
        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v125, v136, 16);
      }
      while (v52);
    }
    objc_msgSend(v50, "addObjectsFromArray:", v47);

  }
  else
  {
    v50 = v47;
  }
  v55 = objc_loadWeakRetained((id *)&self->_delegate);
  v56 = objc_opt_respondsToSelector(v55, "weekAllDayViewForTimeframeBefore:");

  if ((v56 & 1) != 0)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _extractEventsStartingBeforeTimeframeFrom:](self, "_extractEventsStartingBeforeTimeframeFrom:", v107));
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v121, v135, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v122;
      do
      {
        for (m = 0; m != v59; m = (char *)m + 1)
        {
          if (*(_QWORD *)v122 != v60)
            objc_enumerationMutation(v57);
          objc_msgSend(v50, "removeObject:", *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)m));
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v121, v135, 16);
      }
      while (v59);
    }
    objc_msgSend(v57, "addObjectsFromArray:", v50);

  }
  else
  {
    v57 = v50;
  }
  v111 = v12;
  v104 = v57;
  if (-[WeekAllDayView splitMultiDayEvents](self, "splitMultiDayEvents"))
  {
    -[NSMutableArray removeAllObjects](self->_layedOutRowsForEachDay, "removeAllObjects");
    v62 = v112;
    if (-[WeekAllDayView daysToDisplay](self, "daysToDisplay") >= 1)
    {
      v63 = 0;
      do
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        -[NSMutableArray addObject:](self->_layedOutRowsForEachDay, "addObject:", v64);
        v102 = v63;
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "calendarDateByAddingDays:", v63));
        v117 = 0u;
        v118 = 0u;
        v119 = 0u;
        v120 = 0u;
        v66 = v57;
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v117, v134, 16);
        if (v67)
        {
          v68 = v67;
          v69 = *(_QWORD *)v118;
          do
          {
            for (n = 0; n != v68; n = (char *)n + 1)
            {
              if (*(_QWORD *)v118 != v69)
                objc_enumerationMutation(v66);
              v71 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)n);
              v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "calendarDateByAddingDays:", objc_msgSend(v71, "rangeStart")));
              if (!objc_msgSend(v65, "compare:", v72))
              {
                v73 = objc_alloc_init(EKAllDayRow);
                -[EKAllDayRow addOccurrenceBlock:](v73, "addOccurrenceBlock:", v71);
                objc_msgSend(v64, "addObject:", v73);

                v62 = v112;
              }

            }
            v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v117, v134, 16);
          }
          while (v68);
        }

        v63 = v102 + 1;
        self = v108;
        v57 = v104;
      }
      while (v102 + 1 < -[WeekAllDayView daysToDisplay](v108, "daysToDisplay"));
    }
    objc_msgSend(v57, "removeAllObjects");
    v12 = v111;
  }
  else if (objc_msgSend(v57, "count"))
  {
    v74 = 0;
    p_info = &OBJC_METACLASS___TimerOperation.info;
    do
    {
      while (v74 >= (unint64_t)-[NSMutableArray count](self->_layedOutRows, "count"))
      {
        layedOutRows = self->_layedOutRows;
        v77 = objc_alloc_init((Class)(p_info + 161));
        -[NSMutableArray addObject:](layedOutRows, "addObject:", v77);

      }
      v103 = v74;
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_layedOutRows, "objectAtIndex:", v74));
      v113 = 0u;
      v114 = 0u;
      v115 = 0u;
      v116 = 0u;
      v79 = v57;
      for (ii = v79; ; v79 = ii)
      {
        v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v113, v133, 16);
        if (!v81)
          break;
        v82 = 0;
        v83 = *(_QWORD *)v114;
        v84 = -1;
        do
        {
          for (jj = 0; jj != v81; jj = (char *)jj + 1)
          {
            if (*(_QWORD *)v114 != v83)
              objc_enumerationMutation(ii);
            v86 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)jj);
            v87 = objc_msgSend(v78, "spaceGapFor:", v86);
            if (v87 != (id)-1 && (unint64_t)v87 < v84)
            {
              v89 = (unint64_t)v87;
              v90 = v86;

              v82 = v90;
              v84 = v89;
            }
          }
          v81 = objc_msgSend(ii, "countByEnumeratingWithState:objects:count:", &v113, v133, 16);
        }
        while (v81);

        v12 = v111;
        if (!v82)
          goto LABEL_88;
        objc_msgSend(v78, "addOccurrenceBlock:", v82);
        objc_msgSend(ii, "removeObject:", v82);

        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
      }

LABEL_88:
      v74 = v103 + 1;

      self = v108;
      v57 = v104;
      p_info = (__objc2_class_ro **)(&OBJC_METACLASS___TimerOperation + 32);
    }
    while (objc_msgSend(ii, "count"));
  }
  self->_layoutSyncronously = !v105;
  specialDayTypes = self->_specialDayTypes;
  self->_specialDayTypes = v12;
  v92 = v12;

  dayBadgeColors = self->_dayBadgeColors;
  self->_dayBadgeColors = v109;
  v94 = v109;

  dayBadgeLocales = self->_dayBadgeLocales;
  self->_dayBadgeLocales = v110;

  -[WeekAllDayView _updateDayBadges](self, "_updateDayBadges");
  -[WeekAllDayView setNeedsLayout](self, "setNeedsLayout");

}

- (id)_sortBlocks:(id)a3 intoRowsUsingDataFrom:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  EKAllDayRow *v16;
  void *v17;
  id v19;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a3;
  v7 = a4;
  if (-[WeekAllDayView splitMultiDayEvents](self, "splitMultiDayEvents"))
  {
    v21 = v6;
  }
  else
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "occurrenceView"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "occurrence"));
          v15 = (unint64_t)objc_msgSend(v7, "rowIndexOfOccurrence:", v14);

          if ((v15 & 0x8000000000000000) != 0)
          {
            objc_msgSend(v21, "addObject:", v12);
          }
          else
          {
            while (v15 >= (unint64_t)-[NSMutableArray count](self->_layedOutRows, "count"))
            {
              v16 = objc_alloc_init(EKAllDayRow);
              -[NSMutableArray addObject:](self->_layedOutRows, "addObject:", v16);

            }
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_layedOutRows, "objectAtIndex:", v15));
            if (objc_msgSend(v17, "spaceGapFor:", v12) == (id)-1)
              objc_msgSend(v21, "addObject:", v12);
            else
              objc_msgSend(v17, "addOccurrenceBlock:", v12);

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    v6 = v19;
  }

  return v21;
}

- (id)_extractEventsStartingBeforeTimeframeFrom:(id)a3
{
  id v4;
  void *v5;
  NSCalendar *calendar;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  calendar = self->_calendar;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView startDate](self, "startDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](calendar, "dateFromComponents:", v7));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "occurrenceView", (_QWORD)v19));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "occurrence"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startDate"));

        if (objc_msgSend(v17, "compare:", v8) == (id)-1)
          objc_msgSend(v5, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  objc_msgSend(v9, "removeObjectsInArray:", v5);
  return v5;
}

- (id)_extractEventsEndingAfterTimeframeFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", self->_endDate));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "occurrenceView", (_QWORD)v17));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "occurrence"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));

        if (objc_msgSend(v6, "compare:", v15) == (id)-1)
          objc_msgSend(v5, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(v7, "removeObjectsInArray:", v5);
  return v5;
}

- (int64_t)_specialDayTypeForOccurrence:(id)a3
{
  id v3;
  int64_t v4;
  int64_t v5;

  v3 = a3;
  if (_os_feature_enabled_impl("MobileCal", "mark_holidays"))
  {
    v4 = (int64_t)objc_msgSend(v3, "specialDayType");
    if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)heightForNumberOfOccurrences:(unint64_t)a3
{
  double v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  int IsRegularInViewHierarchy;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;

  v4 = (double)a3;
  v5 = -[WeekAllDayView maxOccurrencesWithoutScroller](self, "maxOccurrencesWithoutScroller");
  if ((double)v5 + 0.5 <= v4)
    v6 = (double)v5 + 0.5;
  else
    v6 = v4;
  v7 = 0.0;
  if (v6 > 0.0)
  {
    -[WeekAllDayView occurrenceHeight](self, "occurrenceHeight");
    v7 = floor(v6 * v8) + ceil(v6 + -1.0) * 3.0;
  }
  if (v6 == 0.0)
  {
    v9 = (void *)objc_opt_class(self);
    v10 = objc_msgSend(v9, "dayLabelHeightWithSizeClass:usesMultiDay:", EKUIWidthSizeClassForViewHierarchy(self), -[WeekAllDayView useMultiDayHeaderStyle](self, "useMultiDayHeaderStyle"));
    v13 = v12 + 0.0;
  }
  else
  {
    -[UIView frame](self->_topSeparator, "frame");
    v16 = v15;
    if (v6 == v4)
    {
      IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self, v14);
      v18 = 2.5;
      if (IsRegularInViewHierarchy)
        v18 = 3.5;
      v16 = v16 + v18;
    }
    -[WeekAllDayView occurrenceInsetIntoScroller](self, "occurrenceInsetIntoScroller");
    v20 = v16 + v7 + v19;
    v21 = (void *)objc_opt_class(self);
    v10 = objc_msgSend(v21, "dayLabelHeightWithSizeClass:usesMultiDay:", EKUIWidthSizeClassForViewHierarchy(self), -[WeekAllDayView useMultiDayHeaderStyle](self, "useMultiDayHeaderStyle"));
    v13 = v20 + v22;
  }
  return CalRoundToScreenScale(v10, v11, v13);
}

- (double)heightWithoutNoAllDayOccurrences
{
  double result;

  -[WeekAllDayView heightForNumberOfOccurrences:](self, "heightForNumberOfOccurrences:", 0);
  return result;
}

- (double)naturalHeight
{
  double result;

  -[WeekAllDayView heightForNumberOfOccurrences:](self, "heightForNumberOfOccurrences:", -[WeekAllDayView totalRowCount](self, "totalRowCount"));
  return result;
}

- (double)multiDayViewVisibleHeightWithUserVisibleEarliestDate:(id)a3 latestDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  id v26;
  id v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *j;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  double v42;
  void *v44;
  NSMutableArray *obj;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  WeekAllDayView *v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  int v56;
  void *v57;
  int v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];

  v6 = a3;
  v7 = a4;
  v57 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toISO8601String"));
  v59 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "toISO8601String"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@"), v9, v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedVisibleHeightMap, "objectForKeyedSubscript:", v12));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedVisibleHeightMap, "objectForKeyedSubscript:", v12));
    objc_msgSend(v14, "doubleValue");
    v16 = v15;
  }
  else
  {
    v44 = v12;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = self->_layedOutRowsForEachDay;
    v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    if (v47)
    {
      v49 = 0;
      v46 = *(_QWORD *)v69;
      if (v57)
        v17 = v7 == 0;
      else
        v17 = 1;
      v18 = !v17;
      v51 = self;
      v56 = v18;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v69 != v46)
          {
            v20 = v19;
            objc_enumerationMutation(obj);
            v19 = v20;
          }
          v48 = v19;
          v21 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v19);
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v50 = v21;
          v53 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
          v22 = 0;
          if (v53)
          {
            v52 = *(_QWORD *)v65;
            do
            {
              for (i = 0; i != v53; i = (char *)i + 1)
              {
                if (*(_QWORD *)v65 != v52)
                  objc_enumerationMutation(v50);
                v24 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
                v60 = 0u;
                v61 = 0u;
                v62 = 0u;
                v63 = 0u;
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "occurrenceBlocks"));
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
                if (v26)
                {
                  v27 = v26;
                  v54 = i;
                  v55 = v22;
                  v28 = 0;
                  v29 = *(_QWORD *)v61;
                  v30 = v25;
                  do
                  {
                    for (j = 0; j != v27; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v61 != v29)
                        objc_enumerationMutation(v30);
                      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1)
                                                                                         + 8 * (_QWORD)j), "occurrenceView"));
                      v33 = v32;
                      if (v18)
                      {
                        v34 = v27;
                        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "occurrence"));
                        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "startCalendarDate"));
                        if (objc_msgSend(v36, "compare:", v59) == (id)-1)
                        {
                          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "occurrence"));
                          v58 = v28;
                          v39 = v29;
                          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "endCalendarDate"));
                          v37 = objc_msgSend(v40, "compare:", v57) == (id)1;

                          v29 = v39;
                          v28 = v58;

                          v18 = v56;
                        }
                        else
                        {
                          v37 = 0;
                        }

                        v28 |= v37;
                        v27 = v34;
                      }
                      else
                      {
                        v28 = 1;
                      }

                    }
                    v27 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
                  }
                  while (v27);

                  i = v54;
                  v22 = v55 + (v28 & 1);
                  self = v51;
                }
                else
                {

                }
              }
              v53 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
            }
            while (v53);
          }

          v41 = v49;
          if (v22 > v49)
            v41 = v22;
          v49 = v41;
          v19 = v48 + 1;
        }
        while ((id)(v48 + 1) != v47);
        v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
      }
      while (v47);
    }
    else
    {
      v49 = 0;
    }

    -[WeekAllDayView heightForNumberOfOccurrences:](self, "heightForNumberOfOccurrences:", v49);
    v16 = v42;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v12 = v44;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedVisibleHeightMap, "setObject:forKeyedSubscript:", v14, v44);
  }

  return v16;
}

- (void)updateTotalRowCountWithContainerRect:(CGRect)a3
{
  _QWORD v4[5];
  CGRect v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100034020;
  v4[3] = &unk_1001B2AE0;
  v5 = a3;
  v4[4] = &v6;
  -[WeekAllDayView iterateThroughEachAllDayRow:](self, "iterateThroughEachAllDayRow:", v4);
  -[WeekAllDayView setTotalRowCount:](self, "setTotalRowCount:", v7[3] + 1);
  _Block_object_dispose(&v6, 8);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double fixedDayHeight;
  double v6;
  double fixedDayWidth;
  double v8;
  CGSize result;

  width = a3.width;
  fixedDayHeight = self->_fixedDayHeight;
  if (fixedDayHeight <= 0.0)
  {
    -[WeekAllDayView naturalHeight](self, "naturalHeight");
    fixedDayHeight = v6;
  }
  fixedDayWidth = self->_fixedDayWidth;
  if (fixedDayWidth > 0.0)
    width = fixedDayWidth * (double)self->_daysToDisplay;
  v8 = width;
  result.height = fixedDayHeight;
  result.width = v8;
  return result;
}

- (double)_dayWidth
{
  double result;
  id v4;
  double v5;
  uint64_t v6;

  result = self->_fixedDayWidth;
  if (result <= 0.0)
  {
    v4 = -[WeekViewAllDayContents bounds](self->_contentView, "bounds");
    return CalRoundToScreenScale(v4, v6, v5 / (double)self->_daysToDisplay);
  }
  return result;
}

- (void)setReceiveTapsInHeader:(BOOL)a3
{
  UITapGestureRecognizer *tapGestureRecognizer;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *v7;

  if (self->_receiveTapsInHeader != a3)
  {
    self->_receiveTapsInHeader = a3;
    tapGestureRecognizer = self->_tapGestureRecognizer;
    if (a3)
    {
      if (!tapGestureRecognizer)
      {
        v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_tapReceived:");
        v6 = self->_tapGestureRecognizer;
        self->_tapGestureRecognizer = v5;

        -[WeekAllDayView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
      }
    }
    else if (tapGestureRecognizer)
    {
      -[WeekAllDayView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_tapGestureRecognizer);
      v7 = self->_tapGestureRecognizer;
      self->_tapGestureRecognizer = 0;

    }
  }
}

- (void)_tapReceived:(id)a3
{
  objc_msgSend(a3, "locationInView:", self);
  -[WeekAllDayView emptySpaceClickForCalendarWeekDayEventContent:atPoint:](self, "emptySpaceClickForCalendarWeekDayEventContent:atPoint:", 0);
}

+ (UIEdgeInsets)occurrencePaddingForSizeClass:(int64_t)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  id v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  +[EKDayOccurrenceView defaultPadding](EKDayOccurrenceView, "defaultPadding");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
  v7 = v6;
  if (a3 == 1)
  {
    v8 = 0.0;
    v9 = objc_msgSend(v6, "_scaledValueForValue:", 0.0);
    v12 = v11;
  }
  else
  {
    v13 = objc_msgSend(v6, "_scaledValueForValue:", 2.0);
    v12 = v14;
    v8 = CalRoundToScreenScale(v13, v15, 0.5);
  }
  v16 = CalRoundToScreenScale(v9, v10, v12);

  v17 = 0.0;
  v18 = v16;
  v19 = v8;
  v20 = v5;
  result.right = v17;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (UIEdgeInsets)_occurrencePadding
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(self, a2))
    v3 = 1;
  else
    v3 = 2;
  v4 = (void *)objc_opt_class(self);
  _objc_msgSend(v4, "occurrencePaddingForSizeClass:", v3);
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

+ (double)_fontSizeForSizeClass:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  double v9;
  id v10;
  uint64_t v11;
  double v12;

  v4 = EKUIMultiwindowAssert(a3 != 0, CFSTR("Unspecified size class"));
  if (a3 == 2)
    v6 = 17.0;
  else
    v6 = 18.0;
  v7 = CUIKGetOverlayCalendar(v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
    v9 = 28.0;
  else
    v9 = 40.0;

  v10 = +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, v6, v9);
  return CalRoundToScreenScale(v10, v11, v12);
}

+ (double)_overlayFontSize
{
  id v2;
  uint64_t v3;
  double v4;

  v2 = +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", 0, 10.0, 15.5);
  return CalRoundToScreenScale(v2, v3, v4);
}

+ (double)_compactRoundedRectHeightForSizeClass:(int64_t)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  double v13;
  uint64_t v14;
  double v15;

  v4 = objc_msgSend(a1, "_fontSizeForSizeClass:", a3);
  v6 = v5;
  v8 = CUIKGetOverlayCalendar(v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
  {
    objc_msgSend(a1, "_overlayFontSize");
    v11 = v10;
  }
  else
  {
    v11 = 0.0;
  }
  v12 = +[CompactDayNavigationViewCell contentHeightForFontSize:overlayFontSize:](CompactDayNavigationViewCell, "contentHeightForFontSize:overlayFontSize:", v6, v11);
  v15 = CalRoundToScreenScale(v12, v14, v13 + 8.0);

  return fmin(v15, 47.0);
}

- (void)_buildDayNumberViews
{
  NSArray *v3;
  unint64_t v4;
  MultiDayNavigationViewCell *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSArray *dayNumberViews;

  if (!self->_dayNumberViews)
  {
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", self->_daysToDisplay));
    if (self->_daysToDisplay)
    {
      v4 = 0;
      do
      {
        if (-[WeekAllDayView useMultiDayHeaderStyle](self, "useMultiDayHeaderStyle"))
        {
          v5 = objc_alloc_init(MultiDayNavigationViewCell);
          -[MultiDayNavigationViewCell setShouldShowOverlay:](v5, "setShouldShowOverlay:", 0);
        }
        else
        {
          v5 = objc_alloc_init(LargeDayNavigationViewCell);
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView traitCollection](self, "traitCollection"));
          -[DayNavigationViewCell setUsesRoundedRectInsteadOfCircle:](v5, "setUsesRoundedRectInsteadOfCircle:", EKUIUsesRoundedRectsInsteadOfCircles(v6, v7));

          -[MultiDayNavigationViewCell setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView backgroundColor](self, "backgroundColor"));
          -[MultiDayNavigationViewCell setBackgroundColor:](v5, "setBackgroundColor:", v8);

        }
        -[WeekAllDayView addSubview:](self, "addSubview:", v5);
        -[NSArray addObject:](v3, "addObject:", v5);

        ++v4;
      }
      while (v4 < self->_daysToDisplay);
    }
    dayNumberViews = self->_dayNumberViews;
    self->_dayNumberViews = v3;

  }
}

- (void)_buildVerticalDaySeparators
{
  unint64_t v3;
  NSArray *i;
  id v5;
  NSArray *verticalDaySeparators;
  id v7;

  v3 = self->_daysToDisplay - 1;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[objc_class weekSeparatorColor](-[WeekAllDayView weekViewClass](self, "weekViewClass"), "weekSeparatorColor"));
  for (i = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v3));
        v3;
        --v3)
  {
    v5 = objc_alloc_init((Class)UIView);
    objc_msgSend(v5, "setBackgroundColor:", v7);
    -[WeekAllDayView addSubview:](self, "addSubview:", v5);
    -[NSArray addObject:](i, "addObject:", v5);

  }
  verticalDaySeparators = self->_verticalDaySeparators;
  self->_verticalDaySeparators = i;

}

- (void)_layoutDayNumberCells
{
  unint64_t v3;
  void *v4;

  if (self->_daysToDisplay)
  {
    v3 = 0;
    do
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_dayNumberViews, "objectAtIndexedSubscript:", v3));
      -[WeekAllDayView _numberFrameForDayIndex:](self, "_numberFrameForDayIndex:", v3);
      objc_msgSend(v4, "setFrame:");

      ++v3;
    }
    while (v3 < self->_daysToDisplay);
  }
}

- (void)_layoutVerticalDaySeparators
{
  double v3;
  double v4;
  id v5;
  double v6;
  double v7;
  unint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  void *v13;
  uint64_t v14;

  -[WeekAllDayView bounds](self, "bounds");
  v4 = v3;
  v5 = -[WeekAllDayView _dayWidth](self, "_dayWidth");
  v7 = v6;
  v8 = self->_daysToDisplay - 1;
  EKUISeparatorLineThickness(v5);
  if (v8)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0.0;
    do
    {
      v12 = v7 + v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_verticalDaySeparators, "objectAtIndexedSubscript:", v11));
      objc_msgSend(v13, "setFrame:", CalRoundToScreenScale(v13, v14, v12), 0.0, v10, v4);

      ++v11;
    }
    while (v8 != v11);
  }
}

- (CGRect)_numberFrameForDayIndex:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  double y;
  double v8;
  id v9;
  double v10;
  uint64_t v11;
  double v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  uint64_t v20;
  id v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  double v48;
  void *v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;
  double v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGRect result;

  v5 = -[WeekAllDayView useMultiDayHeaderStyle](self, "useMultiDayHeaderStyle");
  if (v5)
  {
    y = CGRectZero.origin.y;
    v8 = EKUISeparatorLineThickness(v5);
    v9 = -[WeekAllDayView _dayWidth](self, "_dayWidth");
    v12 = CalRoundToScreenScale(v9, v11, (v8 + v10) * (double)a3);
    v13 = -[WeekAllDayView _dayWidth](self, "_dayWidth");
    v16 = CalRoundToScreenScale(v13, v14, v15);
    +[MultiDayNavigationViewCell heightRequiredWithSizeClass:](MultiDayNavigationViewCell, "heightRequiredWithSizeClass:", EKUIWidthSizeClassForViewHierarchy(self));
LABEL_9:
    v44 = v17;
    goto LABEL_16;
  }
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(self, v6))
  {
    v18 = -[WeekAllDayView _dayWidth](self, "_dayWidth");
    v12 = CalRoundToScreenScale(v18, v20, v19 * (double)a3);
    v21 = -[WeekAllDayView _dayWidth](self, "_dayWidth");
    v16 = CalRoundToScreenScale(v21, v23, v22 + -0.5);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView traitCollection](self, "traitCollection"));
    v26 = EKUIUsesRoundedRectsInsteadOfCircles(v24, v25);

    if (v26)
    {
      v27 = EKUIWidthSizeClassForViewHierarchy(self);
      v28 = (void *)objc_opt_class(self);
      objc_msgSend(v28, "dayLabelHeightWithSizeClass:usesMultiDay:", EKUIWidthSizeClassForViewHierarchy(self), -[WeekAllDayView useMultiDayHeaderStyle](self, "useMultiDayHeaderStyle"));
      v30 = v29;
      objc_msgSend((id)objc_opt_class(self), "_heightForWeekdayLabelsForSizeClass:", v27);
      v32 = v30 - v31;
      v33 = objc_msgSend((id)objc_opt_class(self), "_compactRoundedRectHeightForSizeClass:", v27);
      v35 = v32 - v34;
      v37 = CalRoundToScreenScale(v33, v36, 4.0);
      v40 = CalRoundToScreenScale(v38, v39, (v35 - v37) * 0.5);
      v43 = CalRoundToScreenScale(v41, v42, 6.0);
      if (v40 >= v43)
        y = v40;
      else
        y = v43;
      objc_msgSend((id)objc_opt_class(self), "_compactRoundedRectHeightForSizeClass:", v27);
      goto LABEL_9;
    }
    +[DayNavigationViewCell circleDiameter](LargeDayNavigationViewCell, "circleDiameter");
    v44 = v51;
LABEL_13:
    y = 0.0;
    goto LABEL_16;
  }
  -[WeekAllDayView _circleSize](self, "_circleSize");
  v16 = v45;
  v44 = v46;
  v47 = -[WeekAllDayView _dayWidth](self, "_dayWidth");
  v12 = CalCeilToScreenScale(v47, (double)a3 * v48 + 0.5 + (v48 - v16) * 0.5);
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView traitCollection](self, "traitCollection"));
  if ((EKUIUsesRoundedRectsInsteadOfCircles(v49, v50) & 1) != 0)
  {

    goto LABEL_13;
  }
  +[LargeDayNavigationViewCell dayLabelBaseHeight](LargeDayNavigationViewCell, "dayLabelBaseHeight");
  v53 = v52;
  +[DayNavigationViewCell circleDiameter](LargeDayNavigationViewCell, "circleDiameter");
  v55 = v54;

  y = 0.0;
  if (v53 >= v55)
  {
    v56 = +[LargeDayNavigationViewCell dayLabelYMargin](LargeDayNavigationViewCell, "dayLabelYMargin");
    y = CalRoundToScreenScale(v56, v58, -v57);
  }
LABEL_16:
  v59 = v12;
  v60 = y;
  v61 = v16;
  v62 = v44;
  result.size.height = v62;
  result.size.width = v61;
  result.origin.y = v60;
  result.origin.x = v59;
  return result;
}

+ (double)_yOffsetForWeekdayLabelsWithSizeClass:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v14;

  EKUIMultiwindowAssert(a3 != 0, CFSTR("Unspecified size class"));
  v6 = EKUIUsesRoundedRectsInsteadOfCircles(0, v5);
  if (a3 == 1 && (_DWORD)v6)
  {
    v8 = objc_msgSend((id)objc_opt_class(a1), "dayLabelHeightWithSizeClass:usesMultiDay:", 1, 0);
    v11 = v10 - CalRoundToScreenScale(v8, v9, 4.0);
    objc_msgSend(a1, "_heightForWeekdayLabelsForSizeClass:", 1);
    return v11 - v12;
  }
  else
  {
    if (a3 == 2)
      v14 = 10.5;
    else
      v14 = 41.0;
    return CalRoundToScreenScale(v6, v7, v14);
  }
}

+ (double)_heightForWeekdayLabelsForSizeClass:(int64_t)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;

  if (!EKUIUsesRoundedRectsInsteadOfCircles(0, a2))
    return 20.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_dayLabelFontForSizeClass:", a3));
  v6 = objc_msgSend(v5, "lineHeight");
  v9 = CalRoundToScreenScale(v6, v7, v8);

  return v9;
}

+ (double)baselineForWeekdayLabelsWithSizeClass:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  UILabel *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance"));
  objc_msgSend(v5, "weekAllDayBaselineForLargeFormatWeekView");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance"));
  objc_msgSend(v8, "weekAllDayBaselineForSmallFormatWeekView");
  v10 = v9;

  if (v7 < 0.0 || v10 < 0.0)
  {
    v11 = objc_opt_new(UILabel);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_dayLabelFontForSizeClass:", a3));
    -[UILabel setFont:](v11, "setFont:", v12);

    objc_msgSend(a1, "_heightForWeekdayLabelsForSizeClass:", a3);
    -[UILabel setFrame:](v11, "setFrame:", 0.0, 0.0, 20.0, v13);
    -[UILabel _firstLineBaselineOffsetFromBoundsTop](v11, "_firstLineBaselineOffsetFromBoundsTop");
    v15 = v14;
    v17 = EKUIUsesRoundedRectsInsteadOfCircles(0, v16);
    if ((_DWORD)v17)
    {
      objc_msgSend(a1, "_yOffsetForWeekdayLabelsWithSizeClass:", a3);
      v20 = v19;
      +[DayNavigationViewCell roundedRectBaselineOffset](LargeDayNavigationViewCell, "roundedRectBaselineOffset");
      v7 = v21;
    }
    else
    {
      v7 = v15 + CalRoundToScreenScale(v17, v18, 10.5);
      v20 = CalRoundToScreenScale(v22, v23, 41.0);
    }
    v10 = v15 + v20;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance"));
    objc_msgSend(v24, "setWeekAllDayBaselineForLargeFormatWeekView:", v7);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance"));
    objc_msgSend(v25, "setWeekAllDayBaselineForLargeFormatWeekView:", v10);

  }
  if (a3 == 2)
    return v7;
  else
    return v10;
}

- (CGRect)_weekdayFrameForDayIndex:(int64_t)a3
{
  double v4;
  id v5;
  double v6;
  uint64_t v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v4 = (double)a3;
  v5 = -[WeekAllDayView _dayWidth](self, "_dayWidth");
  v8 = CalRoundToScreenScale(v5, v7, v6 * v4);
  v9 = (void *)objc_opt_class(self);
  objc_msgSend(v9, "_yOffsetForWeekdayLabelsWithSizeClass:", EKUIWidthSizeClassForViewHierarchy(self));
  v11 = v10;
  v12 = -[WeekAllDayView _dayWidth](self, "_dayWidth");
  v15 = CalRoundToScreenScale(v12, v14, v13 + -0.5);
  v16 = (void *)objc_opt_class(self);
  objc_msgSend(v16, "_heightForWeekdayLabelsForSizeClass:", EKUIWidthSizeClassForViewHierarchy(self));
  v18 = v17;
  v19 = v8;
  v20 = v11;
  v21 = v15;
  result.size.height = v18;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)_dayLabelFontAtDayIndex:(int64_t)a3 sizeClass:(int64_t)a4
{
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_dayStarts, "objectAtIndexedSubscript:", a3));
  objc_msgSend(v6, "absoluteTime");
  v8 = v7;

  v11 = CUIKTodayDate(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;

  v15 = (void *)objc_opt_class(self);
  if (v14 == v8)
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_todayDayLabelFontForSizeClass:", a4));
  else
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_dayLabelFontForSizeClass:", a4));
  return v16;
}

- (id)_dayLabelColorAtDayIndex:(int64_t)a3 isWeekend:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_dayStarts, "objectAtIndexedSubscript:", a3));
  objc_msgSend(v5, "absoluteTime");
  v7 = v6;

  v10 = CUIKTodayDate(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  if (!v4 || v7 == v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  }
  else
  {
    v14 = WeekendTextColor();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }
  return v15;
}

- (CGSize)_circleSize
{
  double v2;
  double v3;
  CGSize result;

  +[CompactDayNavigationViewCell standardCircleDiameterForSizeClass:](CompactDayNavigationViewCell, "standardCircleDiameterForSizeClass:", EKUIWidthSizeClassForViewHierarchy(self));
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)_dayLabelFontForSizeClass:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  EKUIMultiwindowAssert(a3 != 0, CFSTR("Unspecified size class"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance"));
  v5 = v4;
  if (a3 == 1)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekAllDayLabelFontCompact"));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekAllDayLabelFontRegular"));
  v7 = (void *)v6;

  return v7;
}

+ (id)_todayDayLabelFontForSizeClass:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  EKUIMultiwindowAssert(a3 != 0, CFSTR("Unspecified size class"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EKUISemiConstantCache sharedInstance](EKUISemiConstantCache, "sharedInstance"));
  v5 = v4;
  if (a3 == 1)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekAllDayTodayLabelFontCompact"));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "weekAllDayTodayLabelFontRegular"));
  v7 = (void *)v6;

  return v7;
}

- (int64_t)_dayIndexForToday
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;

  v3 = CUIKTodayDate(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  if (!-[NSArray count](self->_dayStarts, "count"))
    return -1;
  v7 = 0;
  while (1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_dayStarts, "objectAtIndex:", v7));
    objc_msgSend(v8, "absoluteTime");
    v10 = v9;

    if (v6 == v10)
      break;
    if (++v7 >= -[NSArray count](self->_dayStarts, "count"))
      return -1;
  }
  return v7;
}

- (unint64_t)maxOccurrencesWithoutScroller
{
  void *v3;
  double v4;

  if (qword_1001F6070 != -1)
    dispatch_once(&qword_1001F6070, &stru_1001B2B00);
  v3 = (void *)qword_1001F6068;
  AnchoredValueCurrentWindowHeight(self);
  objc_msgSend(v3, "valueForSize:");
  return vcvtmd_u64_f64(v4);
}

- (double)baselineForWeekdayNumbers
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;

  if (!-[NSArray count](self->_dayNumberViews, "count"))
    return -1.0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_dayNumberViews, "firstObject"));
  objc_msgSend(v3, "baselineOffsetFromTop");
  v5 = v4;
  objc_msgSend(v3, "frame");
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
  -[WeekAllDayView convertPoint:fromView:](self, "convertPoint:fromView:", v10, v7, v9);
  v12 = v11;

  v13 = v5 + v12;
  return v13;
}

- (double)occurrenceInsetIntoScroller
{
  uint64_t IsRegularInViewHierarchy;
  uint64_t v3;
  double result;
  double v5;

  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self, a2);
  result = 3.0;
  if ((_DWORD)IsRegularInViewHierarchy)
  {
    v5 = CalRoundToScreenScale(IsRegularInViewHierarchy, v3, 3.5);
    return v5 + CalOnePixelInPoints();
  }
  return result;
}

- (unint64_t)_calendarOrderForCalendar:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarsForEntityType:", 0));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      v11 = 0;
      v12 = (unint64_t)v8 + v9;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), "isEqual:", v3, (_QWORD)v14) & 1) != 0)
        {
          v12 = (unint64_t)v11 + v9;
          goto LABEL_12;
        }
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v9 = v12;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_12:

  return v12;
}

- (double)firstEventYOffset
{
  double v3;
  double v4;
  void *v5;
  id v6;
  double v7;
  uint64_t v8;

  -[WeekAllDayView occurrenceInsetIntoScroller](self, "occurrenceInsetIntoScroller");
  v4 = v3;
  v5 = (void *)objc_opt_class(self);
  v6 = objc_msgSend(v5, "dayLabelHeightWithSizeClass:usesMultiDay:", EKUIWidthSizeClassForViewHierarchy(self), -[WeekAllDayView useMultiDayHeaderStyle](self, "useMultiDayHeaderStyle"));
  return CalRoundToScreenScale(v6, v8, v4 + v7);
}

- (double)nextAvailableOccurrenceViewYOriginForDay:(id)a3
{
  id v4;
  double v5;
  double v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BYTE *v11;
  double v12;
  id v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  uint64_t v29;
  double v30;
  _QWORD v32[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v4 = a3;
  objc_msgSend(v4, "absoluteTime");
  v6 = v5;
  v7 = -[WeekAllDayView dayIndexForCalendarDate:](self, "dayIndexForCalendarDate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar timeZone](self->_calendar, "timeZone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithAbsoluteTime:timeZone:](EKCalendarDate, "calendarDateWithAbsoluteTime:timeZone:", v8, v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_dayStarts, "objectAtIndex:", 0));
  v11 = objc_msgSend(v9, "dayOfWeek");
  v12 = (double)(unint64_t)(v11 - (_BYTE *)objc_msgSend(v10, "dayOfWeek"));
  v13 = -[WeekAllDayView _dayWidth](self, "_dayWidth");
  -[WeekAllDayView occurrenceInsetIntoScroller](self, "occurrenceInsetIntoScroller", CalRoundToScreenScale(v13, v15, v14 * v12));
  v17 = v16;
  -[UIScrollView contentOffset](self->_scroller, "contentOffset");
  v19 = v18;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000356C8;
  v32[3] = &unk_1001B2AB8;
  v32[5] = &v33;
  v32[6] = v7;
  v32[4] = self;
  -[WeekAllDayView iterateThroughEachAllDayRow:](self, "iterateThroughEachAllDayRow:", v32);
  v20 = v34[3];
  -[WeekAllDayView occurrenceHeight](self, "occurrenceHeight");
  v22 = v21;
  -[WeekAllDayView firstEventYOffset](self, "firstEventYOffset");
  v24 = v23;
  -[WeekAllDayView occurrenceInsetIntoScroller](self, "occurrenceInsetIntoScroller");
  v26 = v25;
  v27 = -[UIScrollView contentOffset](self->_scroller, "contentOffset");
  v30 = CalRoundToScreenScale(v27, v29, v17 + v19 + (double)v20 * (v22 + 3.0) + v24 - v26 - v28);
  _Block_object_dispose(&v33, 8);

  return v30;
}

- (CGRect)_frameForOccurrenceBlock:(id)a3 index:(unint64_t)a4 yPos:(double)a5 padding:(double)a6
{
  id v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  double v14;
  double Width;
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
  CGRect v32;
  CGRect result;

  v9 = a3;
  -[WeekAllDayView _dayWidth](self, "_dayWidth");
  v11 = v10;
  v12 = objc_msgSend(v9, "rangeStart");
  if ((CalTimeDirectionIsLeftToRight(v12, v13) & 1) != 0)
  {
    v14 = v11 * (double)(unint64_t)v12 + 2.0;
  }
  else
  {
    -[WeekAllDayView frame](self, "frame");
    Width = CGRectGetWidth(v32);
    v16 = Width - v11 * (double)(unint64_t)objc_msgSend(v9, "rangeStart") + -1.0;
    v14 = v16 - v11 * (double)(unint64_t)objc_msgSend(v9, "length") + 1.0;
  }
  -[WeekAllDayView occurrenceInsetIntoScroller](self, "occurrenceInsetIntoScroller");
  v18 = v17 + a5;
  v19 = v11 * (double)(unint64_t)objc_msgSend(v9, "length") + -4.0;
  -[WeekAllDayView occurrenceHeight](self, "occurrenceHeight");
  v21 = CalRoundRectToScreenScale(v14, v18, v19, v20 + a6);
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

- (BOOL)dateIsWeekend:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unsigned __int8 v7;
  NSCalendar *calendar;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v6 = objc_msgSend(v5, "overrideLocaleWeekends");

  if (v6)
  {
    v7 = objc_msgSend(v4, "dayOfWeek") == (id)7 || objc_msgSend(v4, "dayOfWeek") == (id)1;
  }
  else
  {
    calendar = self->_calendar;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
    v7 = -[NSCalendar isDateInWeekend:](calendar, "isDateInWeekend:", v9);

  }
  return v7;
}

- (void)_setNeedsHeaderUpdate
{
  self->_needsHeaderUpdate = 1;
  -[NSMutableDictionary removeAllObjects](self->_cachedVisibleHeightMap, "removeAllObjects");
  -[WeekAllDayView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateHeaderViewsIfNeeded
{
  int64_t v3;
  int64_t v4;
  unint64_t v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;

  if (self->_needsHeaderUpdate && self->_dayStarts)
  {
    v3 = -[WeekAllDayView _dayIndexForToday](self, "_dayIndexForToday");
    if (self->_daysToDisplay)
    {
      v4 = v3;
      v5 = 0;
      do
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_dayStarts, "objectAtIndexedSubscript:", v5));
        v7 = -[WeekAllDayView dateIsWeekend:](self, "dateIsWeekend:", v6);
        if (-[NSArray count](self->_dayNumberViews, "count"))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_dayNumberViews, "objectAtIndexedSubscript:", v5));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
          objc_msgSend(v8, "setDate:forceStringUpdate:", v9, 1);

          objc_msgSend(v8, "setIsToday:", v4 == v5);
          objc_msgSend(v8, "setIsWeekend:", v7);
          objc_msgSend(v8, "setCircled:", v4 == v5);
          -[WeekAllDayView _updateCell:withBadgeDataIndex:](self, "_updateCell:withBadgeDataIndex:", v8, v5);
          if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(self, v10))
          {
            v11 = objc_opt_class(CompactDayNavigationViewCell);
            if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
              v12 = v8;
            else
              v12 = 0;
            v13 = v12;
            if (v7)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView _dayLabelColorAtDayIndex:isWeekend:](self, "_dayLabelColorAtDayIndex:isWeekend:", v5, 1));
              objc_msgSend(v13, "setWeekendColor:", v14);

            }
            if (objc_msgSend(v13, "usesRoundedRectInsteadOfCircle"))
            {
              objc_msgSend(v13, "contentWidth");
              v16 = v15 + 20.0;
              objc_msgSend(v13, "roundedRectSize");
              if (v16 > v17)
              {
                objc_msgSend(v13, "roundedRectSize");
                objc_msgSend(v13, "setRoundedRectSize:", v16);
              }
            }

          }
        }

        ++v5;
      }
      while (v5 < self->_daysToDisplay);
    }
    self->_needsHeaderUpdate = 0;
  }
}

- (void)_updateDayBadges
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_dayNumberViews;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v3);
        -[WeekAllDayView _updateCell:withBadgeDataIndex:](self, "_updateCell:withBadgeDataIndex:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), (char *)v8 + v6, (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v6 += (uint64_t)v8;
    }
    while (v5);
  }

}

- (void)_updateCell:(id)a3 withBadgeDataIndex:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[NSArray count](self->_specialDayTypes, "count") <= a4 || -[NSArray count](self->_dayBadgeColors, "count") <= a4)
  {
    objc_msgSend(v10, "setBadgeType:", 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_specialDayTypes, "objectAtIndex:", a4));
    v7 = objc_msgSend(v6, "integerValue");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_dayBadgeColors, "objectAtIndex:", a4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_dayBadgeLocales, "objectAtIndex:", a4));
    if (objc_msgSend(v9, "isEqual:", &stru_1001B67C0))
    {

      v9 = 0;
    }
    objc_msgSend(v10, "setBadgeColor:", v8);
    objc_msgSend(v10, "setBadgeType:", v7);
    objc_msgSend(v10, "setBadgeLocale:", v9);

  }
}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  _BOOL8 layoutSyncronously;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t IsRegularInViewHierarchy;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double MaxY;
  double v27;
  double v28;
  double v29;
  id WeakRetained;
  char v31;
  id v32;
  void *v33;
  _QWORD v34[8];
  uint64_t v35;
  double *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[5];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v45.receiver = self;
  v45.super_class = (Class)WeekAllDayView;
  -[WeekAllDayView layoutSubviews](&v45, "layoutSubviews");
  -[NSMutableDictionary removeAllObjects](self->_cachedVisibleHeightMap, "removeAllObjects");
  -[WeekAllDayView _updateHeaderViewsIfNeeded](self, "_updateHeaderViewsIfNeeded");
  -[WeekAllDayView _layoutDayNumberCells](self, "_layoutDayNumberCells");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView occurrenceViews](self, "occurrenceViews"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v42;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v42 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v6), "layoutIfNeeded");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v4);
  }

  if (!self->_verticalDaySeparators)
    -[WeekAllDayView _buildVerticalDaySeparators](self, "_buildVerticalDaySeparators");
  -[WeekAllDayView _layoutVerticalDaySeparators](self, "_layoutVerticalDaySeparators");
  -[WeekAllDayView bounds](self, "bounds");
  v8 = v7;
  layoutSyncronously = self->_layoutSyncronously;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_100030CE8;
  v39[4] = sub_100030CF8;
  v40 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v35 = 0;
  v36 = (double *)&v35;
  v37 = 0x2020000000;
  v38 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000361C8;
  v34[3] = &unk_1001B2B28;
  v34[4] = self;
  v34[5] = v39;
  v34[6] = &v35;
  v34[7] = 16 * layoutSyncronously;
  -[WeekAllDayView iterateThroughEachAllDayRow:](self, "iterateThroughEachAllDayRow:", v34);
  -[WeekAllDayView occurrenceInsetIntoScroller](self, "occurrenceInsetIntoScroller");
  v11 = v10;
  v12 = v36[3];
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self, v13);
  v16 = 2.5;
  if ((_DWORD)IsRegularInViewHierarchy)
    v16 = 3.5;
  v17 = CalRoundToScreenScale(IsRegularInViewHierarchy, v15, v11 + v12 + v16);
  v18 = (void *)objc_opt_class(self);
  objc_msgSend(v18, "dayLabelHeightWithSizeClass:usesMultiDay:", EKUIWidthSizeClassForViewHierarchy(self), -[WeekAllDayView useMultiDayHeaderStyle](self, "useMultiDayHeaderStyle"));
  v20 = v19;
  v21 = -[WeekAllDayView bounds](self, "bounds");
  v23 = v22;
  -[UIView setFrame:](self->_topSeparator, "setFrame:", 0.0, v20, v8, CalOnePixelInPoints(v21));
  v24 = v23 - v20;
  v47.origin.x = 0.0;
  v47.origin.y = v20;
  v47.size.width = v8;
  v47.size.height = v24;
  MaxY = CGRectGetMaxY(v47);
  v27 = 0.0;
  if (v24 > 0.0)
    v27 = CalOnePixelInPoints(v25);
  -[UIView setFrame:](self->_bottomSeparator, "setFrame:", 0.0, MaxY - v27, v8, CalOnePixelInPoints(v25));
  -[UIScrollView frame](self->_scroller, "frame");
  v49.origin.x = 0.0;
  v49.origin.y = v20;
  v49.size.width = v8;
  v49.size.height = v24;
  if (!CGRectEqualToRect(v48, v49))
    -[UIScrollView setFrame:](self->_scroller, "setFrame:", 0.0, v20, v8, v24);
  -[UIScrollView contentSize](self->_scroller, "contentSize");
  if (v29 != v8 || v28 != v17)
    -[UIScrollView setContentSize:](self->_scroller, "setContentSize:", v8, v17);
  -[WeekViewAllDayContents setFrame:](self->_contentView, "setFrame:", 0.0, 0.0, v8, v17);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v31 = objc_opt_respondsToSelector(WeakRetained, "weekAllDayView:didCreateOccurrenceViews:");

  if ((v31 & 1) != 0)
  {
    v32 = objc_loadWeakRetained((id *)&self->_delegate);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[WeekAllDayView occurrenceViews](self, "occurrenceViews"));
    objc_msgSend(v32, "weekAllDayView:didCreateOccurrenceViews:", self, v33);

  }
  -[WeekAllDayView rectBecameVisible:](self, "rectBecameVisible:", self->_latestVisibleRect.origin.x, self->_latestVisibleRect.origin.y, self->_latestVisibleRect.size.width, self->_latestVisibleRect.size.height);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v39, 8);

}

- (double)_dateForPoint:(CGPoint)a3
{
  double x;
  id v5;
  double v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  x = a3.x;
  v5 = -[WeekViewAllDayContents frame](self->_contentView, "frame", a3.x, a3.y);
  v7 = (unint64_t)(x / floor(v6 / (double)self->_daysToDisplay));
  if ((CalTimeDirectionIsLeftToRight(v5, v8) & 1) == 0)
    v7 = self->_daysToDisplay + ~v7;
  if (-[NSArray count](self->_dayStarts, "count"))
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_dayStarts, "objectAtIndex:", 0));
  else
    v9 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "calendarDateByAddingDays:", (int)v7));
  objc_msgSend(v10, "absoluteTime");
  v12 = v11;

  return v12;
}

- (int64_t)rowIndexOfOccurrence:(id)a3
{
  id v4;
  int64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100036674;
  v7[3] = &unk_1001B2B50;
  v4 = a3;
  v8 = v4;
  v9 = &v10;
  -[WeekAllDayView iterateThroughEachAllDayRow:](self, "iterateThroughEachAllDayRow:", v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)_calendarOrderSortDescriptor
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_1001F6078;
  if (!qword_1001F6078)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("calendarOrder"), 1);
    v4 = (void *)qword_1001F6078;
    qword_1001F6078 = (uint64_t)v3;

    v2 = (void *)qword_1001F6078;
  }
  return v2;
}

- (id)_numberOfDaysSortDescriptor
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_1001F6080;
  if (!qword_1001F6080)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("lengthForSorting"), 0);
    v4 = (void *)qword_1001F6080;
    qword_1001F6080 = (uint64_t)v3;

    v2 = (void *)qword_1001F6080;
  }
  return v2;
}

+ (double)dayLabelHeightWithSizeClass:(int64_t)a3 usesMultiDay:(BOOL)a4
{
  id v4;
  uint64_t v5;
  double v6;

  if (a4)
    v4 = +[MultiDayNavigationViewCell heightRequiredWithSizeClass:](MultiDayNavigationViewCell, "heightRequiredWithSizeClass:", a3);
  else
    v4 = +[LargeDayNavigationViewCell heightRequiredWithSizeClass:usesMultiDayStyle:](LargeDayNavigationViewCell, "heightRequiredWithSizeClass:usesMultiDayStyle:", a3);
  return CalRoundToScreenScale(v4, v5, v6);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v4 = a3;
  if (self->_allowsOccurrenceSelection)
  {
    v8 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector(WeakRetained, "weekAllDayViewStartDrag:");

    v4 = v8;
    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "weekAllDayViewStartDrag:", self);

      v4 = v8;
    }
  }

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  WeekAllDayViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  EKEvent *scrollingToOccurrence;

  if (self->_scrollingToOccurrence)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector(WeakRetained, "weekAllDayView:didFinishScrollingToOccurrence:");

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v7, "weekAllDayView:didFinishScrollingToOccurrence:", self, self->_scrollingToOccurrence);

    }
    scrollingToOccurrence = self->_scrollingToOccurrence;
    self->_scrollingToOccurrence = 0;

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  WeekAllDayViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "weekAllDayViewDidScroll:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "weekAllDayViewDidScroll:", self);

  }
}

- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4
{
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "weekAllDayView:didSelectEvent:userInitiated:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "occurrence"));
    objc_msgSend(v8, "weekAllDayView:didSelectEvent:userInitiated:", self, v9, a4 == 0);

  }
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
  WeekAllDayViewDelegate **p_delegate;
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

- (void)emptySpaceClickForCalendarWeekDayEventContent:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  id v11;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  if (self->_allowsOccurrenceSelection)
  {
    v11 = v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector(WeakRetained, "weekAllDayViewEmptySpaceClick:onDay:");

    v7 = v11;
    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      -[WeekAllDayView _dateForPoint:](self, "_dateForPoint:", x, y);
      objc_msgSend(v10, "weekAllDayViewEmptySpaceClick:onDay:", self);

      v7 = v11;
    }
  }

}

- (BOOL)leftMarginIncludesTimeView
{
  return self->_leftMarginIncludesTimeView;
}

- (WeekAllDayViewDelegate)delegate
{
  return (WeekAllDayViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDateComponents)startDate
{
  return self->_startDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (BOOL)useMultiDayHeaderStyle
{
  return self->_useMultiDayHeaderStyle;
}

- (BOOL)showSeparatorLines
{
  return self->_showSeparatorLines;
}

- (BOOL)showsHalfOfScrolledEvents
{
  return self->_showsHalfOfScrolledEvents;
}

- (void)setShowsHalfOfScrolledEvents:(BOOL)a3
{
  self->_showsHalfOfScrolledEvents = a3;
}

- (BOOL)allowsOccurrenceSelection
{
  return self->_allowsOccurrenceSelection;
}

- (BOOL)receiveTapsInHeader
{
  return self->_receiveTapsInHeader;
}

- (double)fixedDayWidth
{
  return self->_fixedDayWidth;
}

- (double)fixedDayHeight
{
  return self->_fixedDayHeight;
}

- (void)setFixedDayHeight:(double)a3
{
  self->_fixedDayHeight = a3;
}

- (BOOL)usesSmallText
{
  return self->_usesSmallText;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setLeftMarginIncludesTimeView:(BOOL)a3
{
  self->_leftMarginIncludesTimeView = a3;
}

- (EKEvent)dimmedOccurrence
{
  return self->_dimmedOccurrence;
}

- (int64_t)totalRowCount
{
  return self->_totalRowCount;
}

- (void)setTotalRowCount:(int64_t)a3
{
  self->_totalRowCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedVisibleHeightMap, 0);
  objc_storeStrong((id *)&self->_temporaryViewCacheByDay, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollingToOccurrence, 0);
  objc_storeStrong((id *)&self->_selectedOccurrenceView, 0);
  objc_storeStrong((id *)&self->_dimmedOccurrence, 0);
  objc_storeStrong((id *)&self->_selectedEvent, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_storeStrong((id *)&self->_dayBadgeLocales, 0);
  objc_storeStrong((id *)&self->_dayBadgeColors, 0);
  objc_storeStrong((id *)&self->_specialDayTypes, 0);
  objc_storeStrong((id *)&self->_verticalDaySeparators, 0);
  objc_storeStrong((id *)&self->_dayNumberViews, 0);
  objc_storeStrong((id *)&self->_scroller, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_shouldAnnotateByDay, 0);
  objc_storeStrong((id *)&self->_reusableViews, 0);
  objc_storeStrong((id *)&self->_layedOutRowsForEachDay, 0);
  objc_storeStrong((id *)&self->_layedOutRows, 0);
  objc_storeStrong((id *)&self->_dayStarts, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
