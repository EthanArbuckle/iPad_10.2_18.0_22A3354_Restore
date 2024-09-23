@implementation MonthWeekOccurrencesView

- (MonthWeekOccurrencesView)initWithFrame:(CGRect)a3
{
  MonthWeekOccurrencesView *v3;
  MonthWeekOccurrencesView *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  _MoreEventsView *v9;
  _MoreEventsView *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MonthWeekOccurrencesView;
  v3 = -[MonthWeekOccurrencesView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_drawLock._os_unfair_lock_opaque = 0;
    v3->_layoutOccurrencesNeeded = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MonthWeekOccurrencesView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView layer](v4, "layer"));
    objc_msgSend(v6, "setDelegate:", v4);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView layer](v4, "layer"));
    objc_msgSend(v7, "setValue:forKeyPath:", &__kCFBooleanTrue, CFSTR("separatedOptions.enableContext"));
    objc_msgSend(v7, "setNeedsDisplay");
    for (i = 0; i != 7; ++i)
    {
      v9 = objc_opt_new(_MoreEventsView);
      v10 = v4->_moreEventsViews[i];
      v4->_moreEventsViews[i] = v9;

    }
    -[MonthWeekOccurrencesView _setUpInteractions](v4, "_setUpInteractions");
    -[MonthWeekOccurrencesView setupEntityProvider](v4, "setupEntityProvider");

  }
  return v4;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MonthWeekOccurrencesView;
  v3 = -[MonthWeekOccurrencesView description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_startDate, "date"));
  v6 = CUIKStringForDate(v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@; Month Represented: %@"),
                   v4,
                   v7));

  return (NSString *)v8;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (!a3 && !self->_drawsWithViews)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView subviews](self, "subviews", 0));
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v10;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v10 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v6);
      }

      if (self->_needsRelayout)
        -[MonthWeekOccurrencesView layoutOccurrences](self, "layoutOccurrences");
      -[MonthWeekOccurrencesView layoutSubviews](self, "layoutSubviews");
      -[MonthWeekOccurrencesView renderLayer](self, "renderLayer");
    }
  }
}

- (void)setDrawWithViews:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _MoreEventsView **moreEventsViews;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  if (self->_drawsWithViews != a3)
  {
    self->_drawsWithViews = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[_BackgroundViewRenderManager sharedManager](_BackgroundViewRenderManager, "sharedManager"));
      objc_msgSend(v4, "cancelAllRendering");

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView layer](self, "layer"));
      objc_msgSend(v5, "setContents:", 0);

      v6 = objc_alloc((Class)UIView);
      -[MonthWeekOccurrencesView bounds](self, "bounds");
      v8 = v7;
      -[MonthWeekOccurrencesView bounds](self, "bounds");
      v9 = objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, v8);
      -[MonthWeekOccurrencesView setOccurrenceContainer:](self, "setOccurrenceContainer:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView occurrenceContainer](self, "occurrenceContainer"));
      -[MonthWeekOccurrencesView addSubview:](self, "addSubview:", v10);

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v11 = self->_allMonthViews;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView occurrenceContainer](self, "occurrenceContainer"));
            objc_msgSend(v17, "addSubview:", v16);

          }
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v13);
      }

      v18 = 0;
      moreEventsViews = self->_moreEventsViews;
      do
      {
        -[_MoreEventsView setIsCompact:](moreEventsViews[v18], "setIsCompact:", self->_isCompact);
        -[MonthWeekOccurrencesView addSubview:](self, "addSubview:", moreEventsViews[v18++]);
      }
      while (v18 != 7);
    }
    else if (!-[MonthWeekOccurrencesView animating](self, "animating"))
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView subviews](self, "subviews", 0));
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(_QWORD *)v26 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j), "removeFromSuperview");
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v22);
      }

      -[MonthWeekOccurrencesView setOccurrenceContainer:](self, "setOccurrenceContainer:", 0);
      -[MonthWeekOccurrencesView layoutSubviews](self, "layoutSubviews");
      -[MonthWeekOccurrencesView renderLayer](self, "renderLayer");
    }
  }
}

- (BOOL)drawWithViews
{
  return self->_drawsWithViews;
}

- (void)setStartDate:(id)a3 endDate:(id)a4 dayCount:(int64_t)a5
{
  id v9;
  NSArray *allOccurrences;
  int64_t v11;
  id v12;

  v12 = a3;
  v9 = a4;
  if (!objc_msgSend(v12, "isEqual:", self->_startDate)
    || !objc_msgSend(v9, "isEqual:", self->_endDate)
    || self->_dayCount != a5)
  {
    objc_storeStrong((id *)&self->_startDate, a3);
    objc_storeStrong((id *)&self->_endDate, a4);
    self->_dayCount = a5;
    allOccurrences = self->_allOccurrences;
    self->_allOccurrences = (NSArray *)&__NSArray0__struct;

    self->_layoutOccurrencesNeeded = 1;
    if (-[EKCalendarDate day](self->_startDate, "day") == (id)1)
      v11 = 7 - self->_dayCount;
    else
      v11 = 0;
    self->_firstDayIndex = v11;
    -[MonthWeekOccurrencesView setNeedsLayout](self, "setNeedsLayout");
  }

}

+ (id)xMoreStringAttributesCompact:(BOOL)a3 narrow:(BOOL)a4
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableParagraphStyle *v15;
  const NSAttributedStringKey *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;

  if (a3 && a4)
  {
    v4 = (id)qword_1001F6138;
    if (!qword_1001F6138)
    {
      v5 = objc_opt_new(NSMutableDictionary);
      v6 = &qword_1001F6138;
      v7 = (void *)qword_1001F6138;
      qword_1001F6138 = (uint64_t)v5;

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend((id)qword_1001F6138, "setObject:forKeyedSubscript:", v8, NSForegroundColorAttributeName);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
      v10 = 8.5;
LABEL_8:
      +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fontWithSize:"));
      objc_msgSend((id)*v6, "setObject:forKeyedSubscript:", v14, NSFontAttributeName);

      v15 = objc_opt_new(NSMutableParagraphStyle);
      -[NSMutableParagraphStyle setAlignment:](v15, "setAlignment:", 1);
      v16 = &NSParagraphStyleAttributeName;
LABEL_11:
      objc_msgSend((id)*v6, "setObject:forKeyedSubscript:", v15, *v16);

      v4 = (id)*v6;
    }
  }
  else if (a3)
  {
    v4 = (id)qword_1001F6140;
    if (!qword_1001F6140)
    {
      v11 = objc_opt_new(NSMutableDictionary);
      v6 = &qword_1001F6140;
      v12 = (void *)qword_1001F6140;
      qword_1001F6140 = (uint64_t)v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend((id)qword_1001F6140, "setObject:forKeyedSubscript:", v13, NSForegroundColorAttributeName);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
      v10 = 9.5;
      goto LABEL_8;
    }
  }
  else
  {
    v4 = (id)qword_1001F6148;
    if (!qword_1001F6148)
    {
      v17 = objc_opt_new(NSMutableDictionary);
      v6 = &qword_1001F6148;
      v18 = (void *)qword_1001F6148;
      qword_1001F6148 = (uint64_t)v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend((id)qword_1001F6148, "setObject:forKeyedSubscript:", v19, NSForegroundColorAttributeName);

      v15 = (NSMutableParagraphStyle *)objc_claimAutoreleasedReturnValue(+[MonthViewOccurrence textFont](MonthViewOccurrence, "textFont"));
      v16 = &NSFontAttributeName;
      goto LABEL_11;
    }
  }
  return v4;
}

+ (void)clearMoreEventAttributes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)qword_1001F6138;
  qword_1001F6138 = 0;

  v3 = (void *)qword_1001F6140;
  qword_1001F6140 = 0;

  v4 = (void *)qword_1001F6148;
  qword_1001F6148 = 0;

}

- (id)occurrenceAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  if (-[MonthWeekOccurrencesView isNarrow](self, "isNarrow"))
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView _monthOccurrenceAtPoint:](self, "_monthOccurrenceAtPoint:", x, y));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "occurrence"));

  }
  return v6;
}

- (id)_monthOccurrenceAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  CGPoint v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_allMonthViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "occFrame", (_QWORD)v20);
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        +[MonthViewOccurrence verticalSpaceBetweenOccurrences](MonthViewOccurrence, "verticalSpaceBetweenOccurrences");
        v26.size.height = v17 + v18;
        v26.origin.x = v11;
        v26.origin.y = v13;
        v26.size.width = v15;
        v25.x = x;
        v25.y = y;
        if (CGRectContainsPoint(v26, v25))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)occurrence:(id)a3 hasSymbolAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  y = a4.y;
  x = a4.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "CUIK_symbolName"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView _monthOccurrenceAtPoint:](self, "_monthOccurrenceAtPoint:", x, y));
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "isPointInSymbol:", x, y);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_calendarDateAtPoint:(CGPoint)a3
{
  int64_t firstDayIndex;
  CGFloat y;
  CGFloat x;
  uint64_t v7;
  CGSize *p_size;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  uint64_t v14;
  double v15;
  void *v17;
  CGPoint v19;
  CGRect v20;

  firstDayIndex = self->_firstDayIndex;
  if ((int)firstDayIndex > 6)
  {
LABEL_6:
    v17 = 0;
  }
  else
  {
    y = a3.y;
    x = a3.x;
    v7 = (int)firstDayIndex + 1;
    p_size = &self->_dayFrames[(int)firstDayIndex].size;
    while (1)
    {
      v9 = CalRoundRectToScreenScale(p_size[-1].width, p_size[-1].height, p_size->width, p_size->height);
      v11 = v10;
      v13 = v12;
      v20.size.width = CalOnePixelInPoints(v14) + v15;
      v20.origin.x = v9;
      v20.origin.y = v11;
      v20.size.height = v13;
      v19.x = x;
      v19.y = y;
      if (CGRectContainsPoint(v20, v19))
        break;
      p_size += 2;
      if ((_DWORD)v7++ == 7)
        goto LABEL_6;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate calendarDateByAddingDays:](self->_startDate, "calendarDateByAddingDays:", 0));
  }
  return v17;
}

- (id)firstOccurrencesForEachDay
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_layedOutRows, "firstObject"));
  v5 = v4;
  if (v4)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "occurrenceBlocks", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "occurrence"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eventOccurrenceID"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

  }
  if (-[MonthWeekOccurrencesView dayCount](self, "dayCount"))
  {
    v14 = 0;
    do
    {
      if ((objc_msgSend(v5, "isFilledForDay:", v14) & 1) == 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_singleDayEventBuckets, "objectAtIndexedSubscript:", v14));
        if (objc_msgSend(v15, "count"))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "occurrence"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventOccurrenceID"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, v18);

        }
      }
      ++v14;
    }
    while (v14 < -[MonthWeekOccurrencesView dayCount](self, "dayCount"));
  }

  return v3;
}

- (id)secondAndThirdOccurrencesForEachDay
{
  NSMutableArray *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_opt_new(NSMutableArray);
  if (-[MonthWeekOccurrencesView dayCount](self, "dayCount"))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_secondOccurrencesForEachDay, "objectAtIndexedSubscript:", v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

      if (v5 != v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_secondOccurrencesForEachDay, "objectAtIndexedSubscript:", v4));
        -[NSMutableArray addObject:](v3, "addObject:", v7);

      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_thirdOccurrencesForEachDay, "objectAtIndexedSubscript:", v4));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

      if (v8 != v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_thirdOccurrencesForEachDay, "objectAtIndexedSubscript:", v4));
        -[NSMutableArray addObject:](v3, "addObject:", v10);

      }
      ++v4;
    }
    while (v4 < -[MonthWeekOccurrencesView dayCount](self, "dayCount"));
  }
  return v3;
}

- (CGRect)frameForOccurrence:(id)a3 onDay:(id)a4
{
  id v6;
  id v7;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat x;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _MoreEventsView **moreEventsViews;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  v6 = a3;
  v7 = a4;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v11 = height;
  v12 = width;
  v13 = y;
  x = CGRectNull.origin.x;
  if (v6)
  {
    v11 = CGRectNull.size.height;
    v12 = CGRectNull.size.width;
    v13 = CGRectNull.origin.y;
    x = CGRectNull.origin.x;
    if ((objc_msgSend(v6, "isNew") & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView _occurrenceViewForEventOccurrence:](self, "_occurrenceViewForEventOccurrence:", v6));
      objc_msgSend(v15, "frame");
      x = v16;
      v13 = v17;
      v12 = v18;
      v11 = v19;

    }
  }
  v20 = (unint64_t)objc_msgSend(v7, "differenceInDays:", self->_startDate);
  if (objc_msgSend(v6, "isNew"))
  {
    -[MonthWeekOccurrencesView _frameForStartColumn:endColumn:dayRow:occurrenceRow:numRows:](self, "_frameForStartColumn:endColumn:dayRow:occurrenceRow:numRows:", v20, v20, 0, 0.0, 1.0);
LABEL_12:
    x = v21;
    v13 = v22;
    v12 = v23;
    v11 = v24;
    goto LABEL_14;
  }
  if (!v6)
    goto LABEL_21;
  v30.origin.x = x;
  v30.origin.y = v13;
  v30.size.width = v12;
  v30.size.height = v11;
  if (CGRectIsNull(v30)
    || (v31.origin.x = x, v31.origin.y = v13, v31.size.width = v12, v31.size.height = v11, CGRectIsEmpty(v31)))
  {
LABEL_21:
    if (v20 > 6)
    {
      v11 = height;
      v12 = width;
      v13 = y;
      x = CGRectNull.origin.x;
      goto LABEL_14;
    }
    moreEventsViews = self->_moreEventsViews;
    v11 = height;
    v12 = width;
    v13 = y;
    x = CGRectNull.origin.x;
    if (-[_MoreEventsView numberOfEvents](moreEventsViews[v20], "numberOfEvents") >= 1)
    {
      -[_MoreEventsView frame](moreEventsViews[v20], "frame");
      goto LABEL_12;
    }
  }
LABEL_14:

  v26 = x;
  v27 = v13;
  v28 = v12;
  v29 = v11;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)frameForLastOccurrenceOnDay:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *layedOutRows;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
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
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[6];
  uint64_t v36;
  id *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _BYTE v42[128];
  CGRect result;

  v4 = a3;
  v5 = objc_msgSend(v4, "differenceInDays:", self->_startDate);
  v36 = 0;
  v37 = (id *)&v36;
  v38 = 0x3032000000;
  v39 = sub_10005296C;
  v40 = sub_10005297C;
  v41 = 0;
  layedOutRows = self->_layedOutRows;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100052984;
  v35[3] = &unk_1001B2F30;
  v35[4] = &v36;
  v35[5] = v5;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](layedOutRows, "enumerateObjectsWithOptions:usingBlock:", 2, v35);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_singleDayEventBuckets, "objectAtIndexedSubscript:", v5, 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "frame");
        v13 = v12;
        v15 = v14;
        objc_msgSend(v37[5], "frame");
        v16 = v13 + v15;
        if (v13 + v15 > v17 + v18)
          objc_storeStrong(v37 + 5, v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v42, 16, v16);
    }
    while (v8);
  }

  objc_msgSend(v37[5], "frame");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  _Block_object_dispose(&v36, 8);

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (CGRect)frameForOccurrenceAfterLastOnDay:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *layedOutRows;
  void *v7;
  char *v8;
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
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  CGRect result;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v5 = objc_msgSend(v4, "differenceInDays:", self->_startDate);
  layedOutRows = self->_layedOutRows;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100052C24;
  v21[3] = &unk_1001B2F30;
  v21[4] = &v22;
  v21[5] = v5;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](layedOutRows, "enumerateObjectsWithOptions:usingBlock:", 2, v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_singleDayEventBuckets, "objectAtIndexedSubscript:", v5));
  v8 = (char *)objc_msgSend(v7, "count");
  v23[3] += (uint64_t)(v8 + 1);

  -[MonthWeekOccurrencesView _frameForStartColumn:endColumn:dayRow:occurrenceRow:numRows:](self, "_frameForStartColumn:endColumn:dayRow:occurrenceRow:numRows:", v5, v5, 0, (double)(unint64_t)v23[3], 1.0);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  _Block_object_dispose(&v22, 8);

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)occurrenceViewForOccurrence:(id)a3 onDay:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  MonthViewOccurrence *v11;

  v6 = a3;
  -[MonthWeekOccurrencesView frameForOccurrence:onDay:](self, "frameForOccurrence:onDay:", v6, a4);
  v11 = -[MonthViewOccurrence initWithFrame:occurrence:forDayRange:isCompact:]([MonthViewOccurrence alloc], "initWithFrame:occurrence:forDayRange:isCompact:", v6, 0, 1, -[MonthWeekOccurrencesView isCompact](self, "isCompact"), v7, v8, v9, v10);

  return v11;
}

- (CGRect)_frameForStartColumn:(unint64_t)a3 endColumn:(unint64_t)a4 dayRow:(unint64_t)a5 occurrenceRow:(double)a6 numRows:(double)a7
{
  int64_t firstDayIndex;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat x;
  CGFloat width;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect result;

  firstDayIndex = self->_firstDayIndex;
  v11 = firstDayIndex + a3;
  v12 = firstDayIndex + a4;
  v13 = v11 > 6 || v12 >= 7;
  if (v13)
    v14 = v11 % 7;
  else
    v14 = v11;
  if (v13)
    v15 = v12 % 7;
  else
    v15 = v12;
  -[MonthWeekOccurrencesView _occurrenceHeight](self, "_occurrenceHeight");
  v17 = v16;
  +[MonthViewOccurrence verticalSpaceBetweenOccurrences](MonthViewOccurrence, "verticalSpaceBetweenOccurrences");
  v19 = v18;
  v31 = CGRectUnion(self->_dayFrames[v14], self->_dayFrames[v15]);
  x = v31.origin.x;
  width = v31.size.width;
  v24 = CalRoundToScreenScale(v22, v23, (v17 + v19) * a6) + v31.origin.y;
  v27 = CalRoundToScreenScale(v25, v26, v19 * (double)((unint64_t)a7 - 1) + v17 * a7);
  v28 = x;
  v29 = v24;
  v30 = width;
  result.size.height = v27;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (void)setDayFrames:(CGRect *)a3
{
  unint64_t v4;
  CGFloat *p_height;
  CGSize *p_size;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGRect v11;

  v4 = 0;
  p_height = &self->_dayFrames[0].size.height;
  p_size = &a3->size;
  do
  {
    -[MonthWeekOccurrencesView bounds](self, "bounds");
    v11.origin.x = v7;
    v11.origin.y = v8;
    v11.size.width = v9;
    v11.size.height = v10;
    *(CGRect *)&p_height[v4 / 8 - 3] = CGRectIntersection(*(CGRect *)&p_size[v4 / 0x10 - 1].width, v11);
    v4 += 32;
  }
  while (v4 != 224);
  -[MonthWeekOccurrencesView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setUpInteractions
{
  UIPointerInteraction *v3;
  UIPointerInteraction *interaction;
  id v5;

  if (!self->_interaction)
  {
    v3 = (UIPointerInteraction *)objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", self);
    interaction = self->_interaction;
    self->_interaction = v3;

    -[MonthWeekOccurrencesView addInteraction:](self, "addInteraction:", self->_interaction);
  }
  v5 = objc_msgSend(objc_alloc((Class)UIContextMenuInteraction), "initWithDelegate:", self);
  -[MonthWeekOccurrencesView addInteraction:](self, "addInteraction:", v5);

}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
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

  v6 = a4;
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView _monthOccurrenceAtPoint:](self, "_monthOccurrenceAtPoint:"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "occurrence"));
  objc_msgSend(v6, "location");
  v10 = v9;
  v12 = v11;

  v13 = objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView _calendarDateAtPoint:](self, "_calendarDateAtPoint:", v10, v12));
  v14 = (void *)v13;
  v15 = 0;
  if (v7 && v8 && v13)
  {
    if ((objc_msgSend(v7, "selected") & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      -[MonthWeekOccurrencesView frameForOccurrence:onDay:](self, "frameForOccurrence:onDay:", v8, v14);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      objc_msgSend(v7, "backgroundInsets");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v17 + v27, v19 + v24, v21 - (v27 + v25), v23 - (v24 + v26)));
    }
  }

  return v15;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6;
  double MidX;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  id v16;
  id v17;
  CGRect v18;
  CGRect v19;

  v6 = a4;
  objc_msgSend(v6, "rect");
  MidX = CGRectGetMidX(v18);
  objc_msgSend(v6, "rect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v19.origin.x = v9;
  v19.origin.y = v11;
  v19.size.width = v13;
  v19.size.height = v15;
  v16 = -[MonthWeekOccurrencesView _monthOccurrenceAtPoint:](self, "_monthOccurrenceAtPoint:", MidX, CGRectGetMidY(v19));
  v17 = (id)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v17, "setHidden:", 1);
  -[MonthWeekOccurrencesView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  double MidX;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v18;
  id v19;
  void ***v20;
  void **v21;
  uint64_t v22;
  id (*v23)(uint64_t);
  void *v24;
  id v25;
  MonthWeekOccurrencesView *v26;
  CGRect v27;
  CGRect v28;

  v7 = a5;
  v8 = a4;
  objc_msgSend(v8, "rect");
  MidX = CGRectGetMidX(v27);
  objc_msgSend(v8, "rect");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v28.origin.x = v11;
  v28.origin.y = v13;
  v28.size.width = v15;
  v28.size.height = v17;
  v18 = -[MonthWeekOccurrencesView _monthOccurrenceAtPoint:](self, "_monthOccurrenceAtPoint:", MidX, CGRectGetMidY(v28));
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_10005326C;
  v24 = &unk_1001B2F58;
  v19 = (id)objc_claimAutoreleasedReturnValue(v18);
  v25 = v19;
  v26 = self;
  v20 = objc_retainBlock(&v21);
  if (objc_msgSend(v19, "selected", v21, v22, v23, v24))
    objc_msgSend(v7, "addCompletion:", v20);
  else
    ((void (*)(void ***, uint64_t))v20[2])(v20, 1);

}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  double MidX;
  double MidY;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t ImageViewFromView;
  void *v23;
  id v24;
  void *v25;
  MonthWeekOccurrencesView *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  CGRect v36;
  CGRect v37;

  v5 = a4;
  objc_msgSend(v5, "rect");
  MidX = CGRectGetMidX(v36);
  objc_msgSend(v5, "rect");
  MidY = CGRectGetMidY(v37);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView occurrenceAtPoint:](self, "occurrenceAtPoint:", MidX, MidY));
  v9 = objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView _calendarDateAtPoint:](self, "_calendarDateAtPoint:", MidX, MidY));
  v10 = (void *)v9;
  v11 = 0;
  if (v8 && v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView superview](self, "superview"));
    objc_msgSend(v5, "rect");
    objc_msgSend(v12, "convertRect:fromView:", self);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView superview](self, "superview"));
    ImageViewFromView = createImageViewFromView(v21, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue(ImageViewFromView);

    objc_msgSend(v23, "setFrame:", v14, v16, v18, v20);
    v24 = objc_alloc_init((Class)UIPreviewParameters);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView delegate](self, "delegate"));
    v26 = (MonthWeekOccurrencesView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "containerViewForOccurrencePreview"));

    if (!v26)
      v26 = self;
    -[MonthWeekOccurrencesView convertPoint:fromView:](v26, "convertPoint:fromView:", self, MidX, MidY);
    v28 = v27;
    v30 = v29;
    if (objc_msgSend(v8, "isAllDay"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      objc_msgSend(v24, "setBackgroundColor:", v31);

    }
    v32 = objc_msgSend(objc_alloc((Class)UIPreviewTarget), "initWithContainer:center:", v26, v28, v30);
    v33 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:parameters:target:", v23, v24, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerHoverEffect effectWithPreview:](UIPointerHoverEffect, "effectWithPreview:", v33));
    objc_msgSend(v34, "setPreferredTintMode:", 1);
    objc_msgSend(v34, "setPrefersShadow:", 0);
    objc_msgSend(v34, "setPrefersScaledContent:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v34, 0));

  }
  return v11;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MonthWeekOccurrencesView;
  -[MonthWeekOccurrencesView layoutSubviews](&v3, "layoutSubviews");
  if (!self->_inLayoutOccurrences)
    -[MonthWeekOccurrencesView _updateOccurrencesBounds](self, "_updateOccurrencesBounds");
  -[MonthWeekOccurrencesView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawIntoContext:(CGContext *)a3 traitCollection:(id)a4
{
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  _MoreEventsView **moreEventsViews;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  CGRect v32;
  CGRect v33;

  v6 = a4;
  if (!-[MonthWeekOccurrencesView animating](self, "animating"))
  {
    os_unfair_lock_lock(&self->_drawLock);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = self->_allMonthViews;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v15, "hidden", (_QWORD)v27) & 1) == 0)
          {
            objc_msgSend(v15, "occAlpha");
            if (v16 != 0.0)
            {
              objc_msgSend(v15, "occFrame");
              v18 = v17;
              v20 = v19;
              v22 = v21;
              v24 = v23;
              v32.origin.x = CGRectZero.origin.x;
              v32.origin.y = y;
              v32.size.width = width;
              v32.size.height = height;
              v33.origin.x = v18;
              v33.origin.y = v20;
              v33.size.width = v22;
              v33.size.height = v24;
              if (!CGRectEqualToRect(v32, v33))
                objc_msgSend(v15, "drawInFrame:context:traitCollection:", a3, v6, v18, v20, v22, v24);
            }
          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v9);
    }

    v25 = 0;
    moreEventsViews = self->_moreEventsViews;
    do
    {
      if (-[_MoreEventsView numberOfEvents](moreEventsViews[v25], "numberOfEvents", (_QWORD)v27) >= 1)
      {
        -[_MoreEventsView setIsCompact:](moreEventsViews[v25], "setIsCompact:", self->_isCompact);
        -[_MoreEventsView draw](moreEventsViews[v25], "draw");
      }
      ++v25;
    }
    while (v25 != 7);
    os_unfair_lock_unlock(&self->_drawLock);
  }

}

- (void)_layoutSingleOccurrence:(id)a3 index:(double)a4 numRows:(double)a5 drawTimeString:(BOOL)a6
{
  _BOOL4 v6;
  unint64_t v10;
  unint64_t v11;
  unint64_t dayCount;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  double v30;
  CGFloat v31;
  _BOOL8 v32;
  unint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  unint64_t v36;
  double v37;
  double v38;
  _BOOL8 v39;
  _BOOL8 v40;
  _BOOL8 v41;
  double v42;
  double v43;
  _BOOL8 v44;
  _BOOL4 v45;
  id v46;

  v6 = a6;
  v46 = a3;
  v10 = (unint64_t)objc_msgSend(v46, "startRange");
  v11 = (unint64_t)objc_msgSend(v46, "endRange");
  dayCount = self->_dayCount;
  v13 = v10 / dayCount;
  v14 = v10 % dayCount;
  v15 = v11 / dayCount;
  v16 = v11 % dayCount;
  v17 = objc_msgSend(v46, "isSingleDay");
  objc_msgSend(v46, "resetSegments");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "occurrence"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endDate"));
  objc_msgSend(v22, "timeIntervalSinceReferenceDate");
  v24 = v23;

  -[EKCalendarDate absoluteTime](self->_startDate, "absoluteTime");
  v26 = v25;
  -[EKCalendarDate absoluteTime](self->_endDate, "absoluteTime");
  v28 = v27;
  v29 = v15 - v13;
  v45 = v6;
  if (v15 == v13)
  {
    if (v17)
      v30 = a5;
    else
      v30 = 1.0;
    -[MonthWeekOccurrencesView _frameForStartColumn:endColumn:dayRow:occurrenceRow:numRows:](self, "_frameForStartColumn:endColumn:dayRow:occurrenceRow:numRows:", v14, v16, v13, a4, v30);
    objc_msgSend(v46, "setFrame:");
    objc_msgSend(v46, "setSplitLeftEdge:splitRightEdge:", v21 < v26, v24 > v28);
    if (v21 >= v26)
    {
      v32 = 0;
    }
    else
    {
      objc_msgSend(v46, "frame");
      v32 = v31 > self->_dayFrames[0].origin.x + 1.0;
    }
    objc_msgSend(v46, "setFadeLeftEdge:", v32);
    if (v24 <= v28)
    {
      v44 = 0;
    }
    else
    {
      objc_msgSend(v46, "frame");
      v44 = v42 + v43 < self->_dayFrames[6].origin.x + self->_dayFrames[6].size.width + -1.0;
    }
    objc_msgSend(v46, "setFadeRightEdge:", v44);
  }
  else if (v29 != -1)
  {
    v33 = 0;
    do
    {
      if (v33 >= v29)
        v34 = v16;
      else
        v34 = 6;
      v35 = v24 > v28 || v33 < v29;
      if (v33)
        v36 = 0;
      else
        v36 = v14;
      -[MonthWeekOccurrencesView _frameForStartColumn:endColumn:dayRow:occurrenceRow:numRows:](self, "_frameForStartColumn:endColumn:dayRow:occurrenceRow:numRows:", v36, v34, v33 + v13, a4, 1.0);
      v39 = v21 < v26 || v33 != 0;
      v40 = v21 < v26 && v37 > self->_dayFrames[0].origin.x + 1.0;
      v41 = v24 > v28 && v37 + v38 < self->_dayFrames[6].origin.x + self->_dayFrames[6].size.width + -1.0;
      objc_msgSend(v46, "addSegmentWithFrame:splitLeftEdge:splitRightEdge:fadeLeftEdge:fadeRightEdge:", v39, v35, v40, v41);
      ++v33;
    }
    while (v29 + 1 != v33);
  }
  objc_msgSend(v46, "setDrawsTimeString:", v45);

}

- (_NSRange)_dayRangeForOccurrence:(id)a3 useProposedTime:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  NSUInteger v25;
  NSUInteger v26;
  unint64_t dayCount;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  _NSRange result;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "proposedStartDate"));

    if (!v8)
    {
      v19 = 0;
      v28 = 0;
      v26 = 0;
      goto LABEL_15;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "proposedStartDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventStore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeZone"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v9, v11));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "proposedStartDate"));
    objc_msgSend(v7, "duration");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:"));

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventStore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timeZone"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v14, v16));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventStore"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "timeZone"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v13, v18));

  if ((objc_msgSend(v7, "isAllDay") & 1) == 0)
  {
    objc_msgSend(v19, "absoluteTime");
    v21 = v20 + -1.0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "timeZone"));
    v23 = objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithAbsoluteTime:timeZone:](EKCalendarDate, "calendarDateWithAbsoluteTime:timeZone:", v22, v21));

    v19 = (void *)v23;
  }
  v24 = CUIKDayRangeForOccurenceDates(v8, v19, self->_startDate, self->_endDate);
  v26 = v24;
  dayCount = self->_dayCount;
  if (dayCount >= 7)
    dayCount = 7;
  if (v24 + v25 <= dayCount)
  {
    v28 = v25;
  }
  else
  {
    if (v24 >= dayCount - 1)
      v26 = dayCount - 1;
    v28 = dayCount + ~v26;
  }
LABEL_15:

  v29 = v26;
  v30 = v28;
  result.length = v30;
  result.location = v29;
  return result;
}

- (void)setOccurrences:(id)a3
{
  objc_storeStrong((id *)&self->_allOccurrences, a3);
  if (-[MonthWeekOccurrencesView animating](self, "animating"))
    self->_needsRelayout = 1;
  else
    -[MonthWeekOccurrencesView layoutOccurrences](self, "layoutOccurrences");
}

- (BOOL)layoutOccurrencesIfNeeded
{
  _BOOL4 layoutOccurrencesNeeded;

  layoutOccurrencesNeeded = self->_layoutOccurrencesNeeded;
  if (self->_layoutOccurrencesNeeded)
    -[MonthWeekOccurrencesView layoutOccurrences](self, "layoutOccurrences");
  return layoutOccurrencesNeeded;
}

- (void)layoutOccurrences
{
  unint64_t v3;
  NSMutableArray *layedOutRows;
  NSMutableArray *v5;
  NSMutableArray *allMonthViews;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id *p_isa;
  double y;
  double width;
  double height;
  void *i;
  const __CFString *v21;
  void *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  MonthViewOccurrence *v28;
  void *v29;
  id v30;
  int64_t firstDayIndex;
  unint64_t v32;
  char *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  MonthViewOccurrence *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  os_log_t *v54;
  void *j;
  void *v56;
  id v57;
  void *v58;
  os_log_t v59;
  NSObject *v60;
  void *v61;
  os_log_t *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  MonthWeekOccurrencesView *v69;
  NSMutableArray *v70;
  _CalendarEventsRow *v71;
  id v72;
  void *k;
  id v74;
  void *v75;
  uint64_t v76;
  unint64_t v77;
  void *m;
  void *v79;
  id v80;
  unint64_t v82;
  id v83;
  NSArray *dayTypes;
  void *v85;
  NSMutableArray *v86;
  MonthWeekOccurrencesView *v87;
  NSArray *badgeColors;
  NSMutableArray *v89;
  NSArray *badgeLocales;
  unint64_t v91;
  os_unfair_lock_s *p_drawLock;
  void *v93;
  NSArray *obj;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id v98;
  id v99;
  id v100;
  id v101;
  NSMutableArray *v102;
  NSMutableArray *v103;
  MonthWeekOccurrencesView *v104;
  NSMutableArray *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint8_t v118[128];
  uint8_t buf[4];
  void *v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  id v124;
  __int16 v125;
  id v126;
  _BYTE v127[128];
  _BYTE v128[128];

  p_drawLock = &self->_drawLock;
  os_unfair_lock_lock(&self->_drawLock);
  self->_inLayoutOccurrences = 1;
  -[MonthWeekOccurrencesView layoutIfNeeded](self, "layoutIfNeeded");
  v3 = -[MonthWeekOccurrencesView dayCount](self, "dayCount");
  layedOutRows = self->_layedOutRows;
  v104 = self;
  if (layedOutRows)
  {
    -[NSMutableArray removeAllObjects](layedOutRows, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_allMonthViews, "removeAllObjects");
  }
  else
  {
    v5 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_allOccurrences, "count"));
    allMonthViews = self->_allMonthViews;
    self->_allMonthViews = v5;

    v7 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
    v8 = self->_layedOutRows;
    self->_layedOutRows = v7;

  }
  v91 = v3;
  v9 = objc_opt_new(NSMutableArray);
  v10 = objc_opt_new(NSMutableArray);
  v11 = objc_opt_new(NSMutableArray);
  v12 = 7;
  v13 = &stru_1001B67C0;
  do
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
    -[NSMutableArray addObject:](v9, "addObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[NSMutableArray addObject:](v10, "addObject:", v15);

    -[NSMutableArray addObject:](v11, "addObject:", &stru_1001B67C0);
    --v12;
  }
  while (v12);
  v103 = v11;
  v101 = objc_alloc_init((Class)NSMutableArray);
  v100 = objc_alloc_init((Class)NSMutableArray);
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  p_isa = (id *)&v104->super.super.super.isa;
  obj = v104->_allOccurrences;
  v102 = v10;
  v105 = v9;
  v98 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v114, v128, 16);
  if (v98)
  {
    v95 = *(_QWORD *)v115;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
    do
    {
      for (i = 0; i != v98; i = (char *)i + 1)
      {
        v21 = v13;
        if (*(_QWORD *)v115 != v95)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)i);
        v23 = (char *)objc_msgSend(p_isa, "_dayRangeForOccurrence:useProposedTime:", v22, 0);
        v25 = v24;
        if (v24)
        {
          if (objc_msgSend(v22, "participationStatus") != (id)3
            || (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "eventStore")),
                v27 = objc_msgSend(v26, "showDeclinedEvents"),
                v26,
                v27))
          {
            v28 = -[MonthViewOccurrence initWithFrame:occurrence:forDayRange:isProposedTime:isCompact:]([MonthViewOccurrence alloc], "initWithFrame:occurrence:forDayRange:isProposedTime:isCompact:", v22, v23, v25, 0, objc_msgSend(p_isa, "isCompact"), CGRectNull.origin.x, y, width, height);
            -[MonthViewOccurrence setSelected:](v28, "setSelected:", objc_msgSend(p_isa[46], "containsObject:", v22));
            if (-[MonthViewOccurrence isSingleDay](v28, "isSingleDay"))
              v29 = v100;
            else
              v29 = v101;
            objc_msgSend(v29, "addObject:", v28);
            objc_msgSend(p_isa[43], "addObject:", v28);

          }
        }
        v30 = objc_msgSend(p_isa, "_dayTypeForOccurrence:", v22);
        if (v30)
        {
          firstDayIndex = v104->_firstDayIndex;
          v32 = (unint64_t)&v23[firstDayIndex];
          v33 = &v23[v25];
          if (&v23[firstDayIndex] < &v23[v25 + firstDayIndex])
          {
            v34 = v30;
            do
            {
              if (v32 < (unint64_t)-[NSMutableArray count](v105, "count"))
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v34));
                -[NSMutableArray replaceObjectAtIndex:withObject:](v105, "replaceObjectAtIndex:withObject:", v32, v35);

                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "calendar"));
                v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v36, "CGColor")));
                -[NSMutableArray replaceObjectAtIndex:withObject:](v102, "replaceObjectAtIndex:withObject:", v32, v37);

                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "calendar"));
                v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "locale"));
                v40 = (void *)v39;
                if (v39)
                  v41 = v39;
                else
                  v41 = (uint64_t)v21;
                -[NSMutableArray replaceObjectAtIndex:withObject:](v103, "replaceObjectAtIndex:withObject:", v32, v41);

              }
              ++v32;
            }
            while (v32 < (unint64_t)&v33[v104->_firstDayIndex]);
          }
        }
        p_isa = (id *)&v104->super.super.super.isa;
        v42 = -[MonthWeekOccurrencesView _dayRangeForOccurrence:useProposedTime:](v104, "_dayRangeForOccurrence:useProposedTime:", v22, 1);
        if (v43)
        {
          v44 = -[MonthViewOccurrence initWithFrame:occurrence:forDayRange:isProposedTime:isCompact:]([MonthViewOccurrence alloc], "initWithFrame:occurrence:forDayRange:isProposedTime:isCompact:", v22, v42, v43, 1, -[MonthWeekOccurrencesView isCompact](v104, "isCompact"), CGRectNull.origin.x, y, width, height);
          if (-[MonthViewOccurrence isSingleDay](v44, "isSingleDay"))
            v45 = v100;
          else
            v45 = v101;
          objc_msgSend(v45, "addObject:", v44);

        }
        v13 = v21;
      }
      v98 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v114, v128, 16);
    }
    while (v98);
  }

  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "sortedArrayUsingComparator:", &stru_1001B2F98));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "sortedArrayUsingComparator:", &stru_1001B2F98));
  v47 = v91;
  v48 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v91);
  v49 = p_isa[32];
  p_isa[32] = v48;

  if (v91)
  {
    do
    {
      v50 = objc_alloc_init((Class)NSMutableArray);
      objc_msgSend(p_isa[32], "addObject:", v50);

      --v47;
    }
    while (v47);
  }
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v99 = v46;
  v51 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v110, v127, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v111;
    v54 = (os_log_t *)&kCalUILogHandle;
    v96 = *(_QWORD *)v111;
    do
    {
      for (j = 0; j != v52; j = (char *)j + 1)
      {
        if (*(_QWORD *)v111 != v53)
          objc_enumerationMutation(v99);
        v56 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)j);
        v57 = objc_msgSend(v56, "startRange");
        if (v57 >= -[NSMutableArray count](v104->_singleDayEventBuckets, "count"))
        {
          v59 = *v54;
          if (os_log_type_enabled(*v54, OS_LOG_TYPE_ERROR))
          {
            v60 = v59;
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "occurrence"));
            v62 = v54;
            v63 = v52;
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "title"));
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "occurrence"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "startDate"));
            v67 = -[NSMutableArray count](v104->_singleDayEventBuckets, "count");
            *(_DWORD *)buf = 138413058;
            v120 = v64;
            v121 = 2112;
            v122 = v66;
            v123 = 2048;
            v124 = v57;
            v125 = 2048;
            v126 = v67;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "Occurrence %@ on %@ is out of bounds for the bucket. framePosition is %lu but the bucket is %lu large.", buf, 0x2Au);

            v52 = v63;
            v54 = v62;
            v53 = v96;

          }
        }
        else
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v104->_singleDayEventBuckets, "objectAtIndex:", v57));
          objc_msgSend(v58, "addObject:", v56);

        }
      }
      v52 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v110, v127, 16);
    }
    while (v52);
  }

  v68 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v93);
  v70 = v103;
  v69 = v104;
  if (objc_msgSend(v68, "count"))
  {
    do
    {
      v71 = objc_alloc_init(_CalendarEventsRow);
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectAtIndex:", 0));
      -[_CalendarEventsRow addOccurrenceBlock:](v71, "addOccurrenceBlock:");
      -[NSMutableArray addObject:](v69->_layedOutRows, "addObject:", v71);
      objc_msgSend(v68, "removeObjectAtIndex:", 0);
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v72 = v68;
      for (k = v72; ; v72 = k)
      {
        v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
        if (!v74)
          break;
        v75 = 0;
        v76 = *(_QWORD *)v107;
        v77 = -1;
        do
        {
          for (m = 0; m != v74; m = (char *)m + 1)
          {
            if (*(_QWORD *)v107 != v76)
              objc_enumerationMutation(k);
            v79 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)m);
            v80 = -[_CalendarEventsRow spaceGapFor:](v71, "spaceGapFor:", v79);
            if (v80 != (id)-1 && (unint64_t)v80 < v77)
            {
              v82 = (unint64_t)v80;
              v83 = v79;

              v75 = v83;
              v77 = v82;
            }
          }
          v74 = objc_msgSend(k, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
        }
        while (v74);

        v70 = v103;
        v69 = v104;
        if (!v75)
          goto LABEL_64;
        -[_CalendarEventsRow addOccurrenceBlock:](v71, "addOccurrenceBlock:", v75);
        objc_msgSend(k, "removeObject:", v75);

        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
      }

LABEL_64:
    }
    while (objc_msgSend(k, "count"));
  }
  v69->_layoutOccurrencesNeeded = 0;
  -[MonthWeekOccurrencesView _updateOccurrencesBounds](v69, "_updateOccurrencesBounds");
  dayTypes = v69->_dayTypes;
  v85 = v68;
  v69->_dayTypes = &v105->super;
  v86 = v105;

  v87 = v69;
  badgeColors = v69->_badgeColors;
  v87->_badgeColors = &v102->super;
  v89 = v102;

  badgeLocales = v87->_badgeLocales;
  v87->_badgeLocales = &v70->super;

  v87->_inLayoutOccurrences = 0;
  os_unfair_lock_unlock(p_drawLock);
  -[MonthWeekOccurrencesView setNeedsDisplay](v87, "setNeedsDisplay");

}

- (id)annotatedEntities
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self->_allOccurrences, "count")));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_allMonthViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "occurrence", (_QWORD)v18));
        if ((objc_msgSend(v10, "isBirthday") & 1) == 0)
        {
          objc_msgSend(v9, "occFrame");
          v15 = objc_msgSend(objc_alloc((Class)CUIKViewEntityAnnotation), "initWithEvent:rect:state:", v10, objc_msgSend(v9, "selected"), v11, v12, v13, v14);
          objc_msgSend(v3, "addObject:", v15);

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v16 = objc_msgSend(v3, "copy");
  return v16;
}

- (int64_t)_dayTypeForOccurrence:(id)a3
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

- (BOOL)hasOccurrences
{
  MonthWeekOccurrencesView *v2;
  os_unfair_lock_s *p_drawLock;

  v2 = self;
  p_drawLock = &self->_drawLock;
  os_unfair_lock_lock(&self->_drawLock);
  LOBYTE(v2) = -[NSMutableArray count](v2->_allMonthViews, "count") != 0;
  os_unfair_lock_unlock(p_drawLock);
  return (char)v2;
}

- (id)firstNonAllDayEvent
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[MonthWeekOccurrencesView dayCount](self, "dayCount"))
  {
    v3 = 0;
    while (1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_singleDayEventBuckets, "objectAtIndexedSubscript:", v3));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
      if (v5)
        break;

      if (++v3 >= -[MonthWeekOccurrencesView dayCount](self, "dayCount"))
        goto LABEL_5;
    }
    v7 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "occurrence"));

  }
  else
  {
LABEL_5:
    v6 = 0;
  }
  return v6;
}

- (id)dayTypesFromOccurrences
{
  return self->_dayTypes;
}

- (id)dayBadgeColorsFromOccurrences
{
  return self->_badgeColors;
}

- (id)dayBadgeLocalesFromOccurrences
{
  return self->_badgeLocales;
}

- (id)_occurrenceViewForEventOccurrence:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
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
  v5 = self->_allMonthViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "occurrence", (_QWORD)v13));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (EKEvent)selectedOccurrence
{
  void *v3;

  if (-[NSMutableArray count](self->_selectedOccurrences, "count") == (id)1)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_selectedOccurrences, "firstObject"));
  else
    v3 = 0;
  return (EKEvent *)v3;
}

- (void)setSelectedOccurrence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    -[MonthWeekOccurrencesView setSelectedOccurrences:](self, "setSelectedOccurrences:", v6);

  }
  else
  {
    -[MonthWeekOccurrencesView setSelectedOccurrences:](self, "setSelectedOccurrences:", &__NSArray0__struct);
  }

}

- (NSArray)selectedOccurrences
{
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->_selectedOccurrences);
}

- (void)setSelectedOccurrences:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView selectedOccurrences](self, "selectedOccurrences"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[MonthWeekOccurrencesView deselectOccurrence:](self, "deselectOccurrence:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[MonthWeekOccurrencesView selectOccurrence:](self, "selectOccurrence:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), (_QWORD)v15);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)selectOccurrence:(id)a3
{
  NSMutableArray *selectedOccurrences;
  NSMutableArray *v5;
  NSMutableArray *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((-[NSMutableArray containsObject:](self->_selectedOccurrences, "containsObject:") & 1) == 0)
  {
    selectedOccurrences = self->_selectedOccurrences;
    if (!selectedOccurrences)
    {
      v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v6 = self->_selectedOccurrences;
      self->_selectedOccurrences = v5;

      selectedOccurrences = self->_selectedOccurrences;
    }
    -[NSMutableArray addObject:](selectedOccurrences, "addObject:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView _occurrenceViewForEventOccurrence:](self, "_occurrenceViewForEventOccurrence:", v8));
    objc_msgSend(v7, "setSelected:", 1);
    -[MonthWeekOccurrencesView setNeedsDisplay](self, "setNeedsDisplay");
    -[UIPointerInteraction invalidate](self->_interaction, "invalidate");

  }
}

- (void)deselectOccurrence:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = -[NSMutableArray containsObject:](self->_selectedOccurrences, "containsObject:", v4);
    v4 = v7;
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView _occurrenceViewForEventOccurrence:](self, "_occurrenceViewForEventOccurrence:", v7));
      objc_msgSend(v6, "setSelected:", 0);
      -[NSMutableArray removeObject:](self->_selectedOccurrences, "removeObject:", v7);
      -[MonthWeekOccurrencesView setNeedsDisplay](self, "setNeedsDisplay");
      -[UIPointerInteraction invalidate](self->_interaction, "invalidate");

      v4 = v7;
    }
  }

}

+ (double)maxNarrowOccurrenceHeight
{
  double v2;
  double v3;
  double v4;

  +[MonthViewOccurrence compactOccurrenceHeight](MonthViewOccurrence, "compactOccurrenceHeight");
  v3 = v2;
  +[MonthViewOccurrence verticalSpaceBetweenOccurrences](MonthViewOccurrence, "verticalSpaceBetweenOccurrences");
  return v4 * 3.0 + v3 * 3.0;
}

+ (double)minNarrowOccurrenceHeight
{
  double v2;
  double v3;
  double v4;

  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 6.0);
  v3 = v2;
  +[MonthViewOccurrence verticalSpaceBetweenOccurrences](MonthViewOccurrence, "verticalSpaceBetweenOccurrences");
  return v4 * 3.0 + v3 * 3.0;
}

- (BOOL)isNarrow
{
  double v2;
  double v3;
  double v4;

  -[MonthWeekOccurrencesView frame](self, "frame");
  v3 = ceil(v2);
  +[MonthWeekOccurrencesView maxNarrowOccurrenceHeight](MonthWeekOccurrencesView, "maxNarrowOccurrenceHeight");
  return v3 < v4;
}

- (double)_occurrenceHeight
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
  double v12;
  double result;

  if (-[MonthWeekOccurrencesView isNarrow](self, "isNarrow")
    && -[MonthWeekOccurrencesView isCompact](self, "isCompact"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView delegate](self, "delegate"));
    objc_msgSend(v3, "monthWeekScale");
    v5 = v4;

    +[CompactMonthWeekView narrowScale](CompactMonthWeekView, "narrowScale");
    if (v5 <= v6)
    {
      v12 = 6.0;
    }
    else
    {
      +[MonthWeekOccurrencesView minNarrowOccurrenceHeight](MonthWeekOccurrencesView, "minNarrowOccurrenceHeight");
      v8 = v7;
      -[MonthWeekOccurrencesView frame](self, "frame");
      v10 = v9 - v8;
      +[MonthWeekOccurrencesView maxNarrowOccurrenceHeight](MonthWeekOccurrencesView, "maxNarrowOccurrenceHeight");
      v12 = 6.0 * (v10 / (v11 - v8)) + 6.0;
    }
  }
  else
  {
    -[MonthWeekOccurrencesView isCompact](self, "isCompact");
    v12 = 16.0;
  }
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, v12);
  return result;
}

- (void)animateBlock:(id)a3
{
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, a3, 0, 0.25, 0.0);
}

- (void)show:(BOOL)a3 occurrenceView:(id)a4 atRow:(double)a5 numRows:(double)a6 drawTimeString:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v10;
  id v12;
  double v13;
  double v14;
  id v15;
  char *v16;
  char *v17;
  void **v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  double v23;
  double v24;
  BOOL v25;
  _QWORD v26[5];
  id v27;
  double v28;
  double v29;
  BOOL v30;

  v7 = a7;
  v10 = a3;
  v12 = a4;
  v20 = v12;
  if (v10)
  {
    if ((-[MonthWeekOccurrencesView drawWithViews](self, "drawWithViews")
       || -[MonthWeekOccurrencesView animating](self, "animating"))
      && (objc_msgSend(v20, "frame"), v13 != 0.0))
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100055400;
      v26[3] = &unk_1001B2FC0;
      v26[4] = self;
      v27 = v20;
      v28 = a5;
      v29 = a6;
      v30 = v7;
      -[MonthWeekOccurrencesView animateBlock:](self, "animateBlock:", v26);

    }
    else
    {
      -[MonthWeekOccurrencesView _layoutSingleOccurrence:index:numRows:drawTimeString:](self, "_layoutSingleOccurrence:index:numRows:drawTimeString:", v20, v7, a5, a6);
      objc_msgSend(v20, "setHidden:", 0);
    }
  }
  else
  {
    if ((objc_msgSend(v12, "hidden") & 1) == 0
      && (objc_msgSend(v20, "alpha"), v14 > 0.0)
      && (-[MonthWeekOccurrencesView drawWithViews](self, "drawWithViews")
       || -[MonthWeekOccurrencesView animating](self, "animating")))
    {
      if (!-[MonthWeekOccurrencesView animating](self, "animating"))
        objc_msgSend(v20, "setHidden:", 0);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10005544C;
      v21[3] = &unk_1001B2FC0;
      v21[4] = self;
      v22 = v20;
      v23 = a5;
      v24 = a6;
      v25 = v7;
      -[MonthWeekOccurrencesView animateBlock:](self, "animateBlock:", v21);

    }
    else
    {
      objc_msgSend(v20, "setHidden:", 1);
    }
    v15 = objc_msgSend(v20, "startRange");
    v16 = (char *)objc_msgSend(v20, "length");
    if ((uint64_t)v15 < (uint64_t)((char *)v15 + (unint64_t)v16))
    {
      v17 = v16;
      v18 = (void **)&self->_moreEventsViews[(_QWORD)v15];
      do
      {
        v19 = *v18++;
        objc_msgSend(v19, "setNumberOfEvents:", (char *)objc_msgSend(v19, "numberOfEvents") + 1);
        --v17;
      }
      while (v17);
    }
  }

}

- (void)_updateOccurrencesBounds
{
  unint64_t v3;
  NSMutableArray *v4;
  id *p_secondOccurrencesForEachDay;
  NSMutableArray *secondOccurrencesForEachDay;
  NSMutableArray *v7;
  NSMutableArray *thirdOccurrencesForEachDay;
  unint64_t v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  MonthWeekOccurrencesView *v20;
  uint64_t v21;
  _MoreEventsView **moreEventsViews;
  MonthWeekOccurrencesView *v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  NSMutableArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  void *v33;
  id v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unsigned __int8 *v38;
  unsigned __int8 *v39;
  char *j;
  MonthWeekOccurrencesView *v41;
  void *v42;
  uint64_t v43;
  BOOL v44;
  id v45;
  char *v46;
  char *v47;
  uint64_t v48;
  id *v49;
  unsigned __int8 *v50;
  unsigned __int8 *v51;
  uint64_t v52;
  unsigned __int8 *v53;
  id v54;
  id v55;
  unsigned int v56;
  id v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  unsigned __int8 *v61;
  void *v62;
  unint64_t v63;
  unint64_t v64;
  BOOL v65;
  unint64_t v66;
  unint64_t v67;
  id v68;
  id v69;
  uint64_t v70;
  void *k;
  void *v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  unint64_t v83;
  uint64_t v84;
  void *v85;
  unsigned __int8 *v86;
  char *v87;
  int v88;
  BOOL v89;
  unint64_t v90;
  unsigned __int8 v91;
  char *v92;
  unint64_t v93;
  void *v94;
  id *v95;
  id v96;
  uint64_t v97;
  unint64_t v98;
  NSMutableArray **v99;
  void *v100;
  void *v101;
  int v102;
  id v103;
  double v104;
  uint64_t v105;
  void *v106;
  unint64_t v107;
  int v108;
  uint64_t v109;
  int v110;
  unint64_t v111;
  unint64_t v112;
  _QWORD *v113;
  unint64_t v114;
  double v115;
  double v116;
  double v117;
  BOOL v118;
  _BOOL8 v119;
  double v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  id *v124;
  NSMutableArray **v125;
  void *v126;
  void *v127;
  unsigned int v128;
  unint64_t v129;
  id v130;
  id v131;
  MonthWeekOccurrencesView *v132;
  uint64_t IsLeftToRight;
  uint64_t v134;
  double v135;
  _MoreEventsView **v136;
  double v137;
  double v138;
  uint64_t v139;
  double v140;
  double v141;
  _MoreEventsView *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  uint64_t v151;
  id v152;
  uint64_t *v153;
  _MoreEventsView **v154;
  uint64_t v155;
  unsigned int v156;
  int v157;
  unint64_t v158;
  char *v159;
  unint64_t v160;
  id v161;
  uint64_t v162;
  unsigned __int8 *v163;
  unsigned __int8 *v164;
  char *v165;
  uint64_t v166;
  char *v167;
  unsigned __int8 *v168;
  NSMutableArray **p_thirdOccurrencesForEachDay;
  char *v170;
  uint64_t v171;
  MonthWeekOccurrencesView *v172;
  _QWORD v173[4];
  _MoreEventsView *v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  _QWORD v180[5];
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  _BYTE v205[128];
  CGRect v206;

  -[MonthWeekOccurrencesView frame](self, "frame");
  if (!CGRectIsEmpty(v206) && !-[MonthWeekOccurrencesView layoutOccurrencesIfNeeded](self, "layoutOccurrencesIfNeeded"))
  {
    v3 = -[MonthWeekOccurrencesView dayCount](self, "dayCount");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v3));
    p_secondOccurrencesForEachDay = (id *)&self->_secondOccurrencesForEachDay;
    secondOccurrencesForEachDay = self->_secondOccurrencesForEachDay;
    self->_secondOccurrencesForEachDay = v4;

    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v3));
    v172 = self;
    thirdOccurrencesForEachDay = self->_thirdOccurrencesForEachDay;
    self->_thirdOccurrencesForEachDay = v7;

    if (v3)
    {
      v9 = v3;
      do
      {
        v10 = *p_secondOccurrencesForEachDay;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v10, "addObject:", v11);

        v12 = self->_thirdOccurrencesForEachDay;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        -[NSMutableArray addObject:](v12, "addObject:", v13);

        --v9;
      }
      while (v9);
    }
    p_thirdOccurrencesForEachDay = &self->_thirdOccurrencesForEachDay;
    v14 = ceil(CGRectGetHeight(v172->_dayFrames[0]));
    +[MonthWeekOccurrencesView maxNarrowOccurrenceHeight](MonthWeekOccurrencesView, "maxNarrowOccurrenceHeight");
    if (v14 >= v15)
    {
      +[MonthViewOccurrence verticalSpaceBetweenOccurrences](MonthViewOccurrence, "verticalSpaceBetweenOccurrences");
      v18 = v17;
      -[MonthWeekOccurrencesView _occurrenceHeight](v172, "_occurrenceHeight");
      v16 = vcvtmd_u64_f64(v14 / (v18 + v19));
      if (v16 <= 3)
        v16 = 3;
    }
    else
    {
      v16 = 3;
    }
    v20 = v172;
    v21 = 0;
    v172->_numberOfVisibleRows = v16;
    moreEventsViews = v20->_moreEventsViews;
    do
      -[_MoreEventsView reset](moreEventsViews[v21++], "reset");
    while (v21 != 7);
    v23 = v172;
    if (v172->_numberOfVisibleRows)
    {
      v154 = moreEventsViews;
      v171 = 264;
      v24 = EKUICurrentWindowWidthWithViewHierarchy(v172);
      v26 = EKUIWidthForWindowSizeParadigm(2048, v25);
      v153 = &v151;
      v170 = (char *)&v151 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v170, 8 * v3);
      v158 = v3;
      if (v3)
      {
        v27 = 0;
        do
        {
          v199 = 0u;
          v200 = 0u;
          v197 = 0u;
          v198 = 0u;
          v28 = v23->_layedOutRows;
          v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v197, v205, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v198;
            do
            {
              for (i = 0; i != v30; i = (char *)i + 1)
              {
                if (*(_QWORD *)v198 != v31)
                  objc_enumerationMutation(v28);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v197 + 1) + 8 * (_QWORD)i), "isFilledForDay:", v27))++*(_QWORD *)&v170[8 * v27];
              }
              v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v197, v205, 16);
            }
            while (v30);
          }

          v23 = v172;
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v172->_singleDayEventBuckets, "objectAtIndexedSubscript:", v27));
          v34 = objc_msgSend(v33, "count");
          *(_QWORD *)&v170[8 * v27] += v34;

          ++v27;
        }
        while (v27 != v158);
      }
      v35 = v158;
      v168 = (unsigned __int8 *)&v151 - ((20 * v158 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v168, 20 * v158);
      v36 = 248;
      if (-[NSMutableArray count](v23->_layedOutRows, "count"))
      {
        v37 = 0;
        v38 = v168;
        v162 = 248;
        do
        {
          v164 = v38;
          v39 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v23->super.super.super.isa + v36), "objectAtIndexedSubscript:", v37));
          v193 = 0u;
          v194 = 0u;
          v195 = 0u;
          v196 = 0u;
          v163 = v39;
          v165 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "occurrenceBlocks"));
          v167 = (char *)objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v193, v204, 16);
          if (v167)
          {
            v166 = *(_QWORD *)v194;
            do
            {
              for (j = 0; j != v167; ++j)
              {
                v41 = v23;
                if (*(_QWORD *)v194 != v166)
                  objc_enumerationMutation(v165);
                v42 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * (_QWORD)j);
                v43 = v171;
                v44 = (Class)v37 < *(Class *)((char *)&v41->super.super.super.isa + v171);
                v45 = objc_msgSend(v42, "startRange");
                v46 = (char *)objc_msgSend(v42, "length");
                if ((uint64_t)v45 < (uint64_t)((char *)v45 + (unint64_t)v46))
                {
                  v47 = v46;
                  v48 = *(uint64_t *)((char *)&v41->super.super.super.isa + v43) - 1;
                  do
                  {
                    if (v44 && v37 == v48)
                      v44 = (Class)*(_QWORD *)&v170[8 * (_QWORD)v45] <= *(Class *)((char *)&v172->super.super.super.isa
                                                                                 + v171);
                    v49 = p_secondOccurrencesForEachDay;
                    if (v37 == 1 || v37 == 2 && (v49 = (id *)p_thirdOccurrencesForEachDay, v44))
                      objc_msgSend(*v49, "setObject:atIndexedSubscript:", v42, v45);
                    v45 = (char *)v45 + 1;
                    --v47;
                  }
                  while (v47);
                }
                v23 = v172;
                -[MonthWeekOccurrencesView show:occurrenceView:atRow:numRows:drawTimeString:](v172, "show:occurrenceView:atRow:numRows:drawTimeString:", v44, v42, v24 > v26, (double)v37, 1.0);
              }
              v167 = (char *)objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v193, v204, 16);
            }
            while (v167);
          }

          v35 = v158;
          v51 = v163;
          v50 = v164;
          if (v158)
          {
            v52 = 0;
            v53 = v164;
            do
            {
              if (objc_msgSend(v51, "isFilledForDay:", v52) && v37 <= 0x13)
                *v53 = 1;
              ++v52;
              v53 += 20;
            }
            while (v35 != v52);
          }

          ++v37;
          v23 = v172;
          v36 = v162;
          v38 = v50 + 1;
        }
        while (v37 < (unint64_t)objc_msgSend(*(id *)((char *)&v172->super.super.super.isa + v162), "count"));
      }
      v54 = objc_alloc((Class)CalPreferences);
      v55 = objc_msgSend(v54, "initWithDomain:", kPreferenceDomain);
      v56 = objc_msgSend(v55, "getBooleanPreference:defaultValue:", kCompactMonthEventUseAllSpace, 1);
      v152 = v55;
      v57 = objc_msgSend(v55, "getBooleanPreference:defaultValue:", kCompactMonthEventIntegerBased, 0);
      v157 = (int)v57;
      if ((_DWORD)v57)
        v58 = 2.0;
      else
        v58 = 2.5;
      v59 = v171;
      if (v35)
      {
        v60 = 0;
        v155 = 256;
        v61 = v168;
        v156 = v56;
        while (1)
        {
          v163 = v61;
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v23->super.super.super.isa + v155), "objectAtIndexedSubscript:", v60));
          v63 = *(unint64_t *)((char *)&v23->super.super.super.isa + v59);
          v166 = v60;
          v64 = *(_QWORD *)&v170[8 * v60];
          v65 = v63 >= v64;
          v66 = v63 - v64;
          if (v65)
            v67 = v66;
          else
            v67 = 0;
          v189 = 0u;
          v190 = 0u;
          v191 = 0u;
          v192 = 0u;
          v162 = (uint64_t)v62;
          v68 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v189, v203, 16);
          if (v68)
          {
            v69 = v68;
            v165 = 0;
            v70 = *(_QWORD *)v190;
            do
            {
              for (k = 0; k != v69; k = (char *)k + 1)
              {
                if (*(_QWORD *)v190 != v70)
                  objc_enumerationMutation((id)v162);
                v72 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * (_QWORD)k);
                if (objc_msgSend(v72, "isSingleDay")
                  && (objc_msgSend(v72, "isAllDay") & 1) == 0
                  && (objc_msgSend(v72, "isMultiDayTimed") & 1) == 0)
                {
                  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "occurrence"));
                  v74 = objc_msgSend(v73, "isReminderIntegrationEvent") ^ 1;

                  v165 += v74;
                  v23 = v172;
                }
              }
              v69 = objc_msgSend((id)v162, "countByEnumeratingWithState:objects:count:", &v189, v203, 16);
            }
            while (v69);
          }
          else
          {
            v165 = 0;
          }
          v75 = v67;
          if ((v56 & 1) != 0 || (v58 + -1.0) * (double)(unint64_t)v165 <= (double)v67)
            LODWORD(v164) = -[MonthWeekOccurrencesView isCompact](v23, "isCompact");
          else
            LODWORD(v164) = 0;
          v76 = v67 - (_QWORD)v165;
          if (v67 < (unint64_t)v165)
            v76 = 0;
          if (v76 >= (unint64_t)v165)
            v77 = v76;
          else
            v77 = 0;
          v78 = *(_QWORD *)&v170[8 * v166];
          if (!v56)
            v76 = v77;
          v160 = v76;
          v79 = *(unint64_t *)((char *)&v23->super.super.super.isa + v59);
          v80 = -2;
          if (v78 <= v79)
            v80 = -1;
          v167 = (char *)(v80 + v79);
          if (v157)
          {
            v187 = 0u;
            v188 = 0u;
            v185 = 0u;
            v186 = 0u;
            v161 = (id)v162;
            v81 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v185, v202, 16);
            if (!v81)
              goto LABEL_173;
            v82 = v81;
            v83 = 0;
            v84 = *(_QWORD *)v186;
            v159 = v167 - 1;
            while (1)
            {
              v85 = 0;
              v86 = v163;
              do
              {
                if (*(_QWORD *)v186 != v84)
                {
                  objc_enumerationMutation(v161);
                  v86 = v163;
                }
                v87 = *(char **)(*((_QWORD *)&v185 + 1) + 8 * (_QWORD)v85);
                if (v83 <= 0x13)
                {
                  do
                  {
                    if (!v86[v83])
                      break;
                    ++v83;
                  }
                  while (v83 != 20);
                }
                if (v83 <= (unint64_t)v167)
                  v88 = (int)v164;
                else
                  v88 = 0;
                v89 = v88 != 1 || v75 == 0;
                v165 = *(char **)(*((_QWORD *)&v185 + 1) + 8 * (_QWORD)v85);
                if (v89)
                {
                  v90 = 1;
                }
                else
                {
                  v91 = -[MonthWeekOccurrencesView isNarrow](v23, "isNarrow");
                  if ((v91 & 1) != 0)
                    goto LABEL_104;
                  v92 = v165;
                  if (!objc_msgSend(v165, "isSingleDay")
                    || (objc_msgSend(v92, "isAllDay") & 1) != 0
                    || (objc_msgSend(v92, "isMultiDayTimed") & 1) != 0)
                  {
                    v90 = 1;
                    v87 = v92;
                    goto LABEL_110;
                  }
                  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "occurrence"));
                  if ((objc_msgSend(v101, "isReminderIntegrationEvent") & 1) != 0
                    || v83 >= (unint64_t)v167)
                  {

LABEL_104:
                    v90 = 1;
LABEL_105:
                    v87 = v165;
                    goto LABEL_110;
                  }
                  v102 = v168[20 * v166 + 1 + v83];

                  if (v102)
                  {
                    v90 = 1;
                    v23 = v172;
                    goto LABEL_105;
                  }
                  v87 = v165;
                  if (v160)
                  {
                    v23 = v172;
                    if (v83 >= (unint64_t)v159 || v168[20 * v166 + 2 + v83])
                    {
                      --v75;
                      v90 = 2;
                    }
                    else
                    {
                      v75 -= 2;
                      --v160;
                      v90 = 3;
                    }
                  }
                  else
                  {
                    v160 = 0;
                    --v75;
                    v90 = 2;
                    v23 = v172;
                  }
                }
LABEL_110:
                v93 = (unint64_t)v167;
                -[MonthWeekOccurrencesView show:occurrenceView:atRow:numRows:drawTimeString:](v23, "show:occurrenceView:atRow:numRows:drawTimeString:", v83 <= (unint64_t)v167, v87, v24 > v26, (double)v83, (double)v90);
                if (v83 - 1 < v93)
                {
                  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_secondOccurrencesForEachDay, "objectAtIndexedSubscript:", v166));

                  v95 = p_secondOccurrencesForEachDay;
                  if (!v94)
                    goto LABEL_113;
                  v96 = v82;
                  v97 = v84;
                  v98 = v75;
                  v99 = p_thirdOccurrencesForEachDay;
                  v100 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](*p_thirdOccurrencesForEachDay, "objectAtIndexedSubscript:", v166));

                  v95 = (id *)v99;
                  v75 = v98;
                  v84 = v97;
                  v82 = v96;
                  v23 = v172;
                  if (!v100)
LABEL_113:
                    objc_msgSend(*v95, "setObject:atIndexedSubscript:", v165, v166);
                }
                v83 += v90;
                v85 = (char *)v85 + 1;
                v86 = v163;
              }
              while (v85 != v82);
              v103 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v185, v202, 16);
              v82 = v103;
              if (!v103)
                goto LABEL_173;
            }
          }
          if (v56)
            v165 = (char *)((double)v67 / 1.5);
          v183 = 0u;
          v184 = 0u;
          v182 = 0u;
          v181 = 0u;
          v159 = (char *)(id)v162;
          v161 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v181, v201, 16);
          if (v161)
            break;
LABEL_173:
          v131 = (id)v162;

          v60 = v166 + 1;
          v61 = v163 + 20;
          v59 = v171;
          v56 = v156;
          if (v166 + 1 == v158)
            goto LABEL_174;
        }
        v160 = *(_QWORD *)v182;
        v104 = 0.0;
LABEL_133:
        v105 = 0;
        while (1)
        {
          if (*(_QWORD *)v182 != v160)
            objc_enumerationMutation(v159);
          v106 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * v105);
          v107 = vcvtpd_u64_f64(v104);
          if (v165)
            v108 = (int)v164;
          else
            v108 = 0;
          v109 = *(_QWORD *)(*((_QWORD *)&v181 + 1) + 8 * v105);
          if (v108 != 1
            || -[MonthWeekOccurrencesView isNarrow](v23, "isNarrow")
            || !objc_msgSend(v106, "isSingleDay")
            || (objc_msgSend(v106, "isAllDay") & 1) != 0
            || (objc_msgSend(v106, "isMultiDayTimed") & 1) != 0)
          {
            v110 = 0;
            v111 = v107;
          }
          else
          {
            v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "occurrence"));
            v128 = objc_msgSend(v127, "isReminderIntegrationEvent");
            v110 = v128 ^ 1;

            v129 = vcvtpd_u64_f64(v58 + v104);
            if (v128)
              v111 = v107;
            else
              v111 = v129;
          }
          v112 = vcvtmd_u64_f64(v104);
          v180[0] = _NSConcreteStackBlock;
          v180[1] = 3221225472;
          v180[2] = sub_1000563A8;
          v180[3] = &unk_1001B2FE0;
          v180[4] = v166;
          v113 = objc_retainBlock(v180);
          if (v111 > 0x13)
          {
            v115 = v104;
          }
          else
          {
            v114 = v112;
            v115 = v104;
            do
            {
              if (!((unsigned int (*)(_QWORD *, unint64_t, unint64_t, unsigned __int8 *))v113[2])(v113, v114, v111, v168))break;
              v115 = v115 + 1.0;
              v114 = vcvtmd_u64_f64(v115);
              v116 = ceil(v58 + v115);
              v117 = ceil(v115);
              if (!v110)
                v116 = v117;
              v111 = (unint64_t)v116;
            }
            while ((unint64_t)v116 < 0x14);
          }
          v118 = v111 > (unint64_t)v167;
          v119 = v111 <= (unint64_t)v167;
          if (v110)
          {
            if (!v118)
            {
              --v165;
              -[MonthWeekOccurrencesView show:occurrenceView:atRow:numRows:drawTimeString:](v23, "show:occurrenceView:atRow:numRows:drawTimeString:", 1, v109, v24 > v26, v115, v58);
              v120 = v58;
              if (v115 > 0.0)
                goto LABEL_164;
              goto LABEL_167;
            }
            v121 = v109;
            if (v107 <= 0x13)
            {
              do
              {
                if (!((unsigned int (*)(_QWORD *, unint64_t, unint64_t, unsigned __int8 *))v113[2])(v113, v112, v107, v168))break;
                v104 = v104 + 1.0;
                v112 = vcvtmd_u64_f64(v104);
                v107 = vcvtpd_u64_f64(v104);
              }
              while (v107 < 0x14);
            }
            v119 = v107 <= (unint64_t)v167;
            v115 = v104;
          }
          else
          {
            v121 = v109;
          }
          v120 = 1.0;
          -[MonthWeekOccurrencesView show:occurrenceView:atRow:numRows:drawTimeString:](v23, "show:occurrenceView:atRow:numRows:drawTimeString:", v119, v121, v24 > v26, v115, 1.0);
          if (v115 > 0.0 && v119)
          {
LABEL_164:
            v122 = v166;
            v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_secondOccurrencesForEachDay, "objectAtIndexedSubscript:", v166));

            v124 = p_secondOccurrencesForEachDay;
            if (!v123
              || (v125 = p_thirdOccurrencesForEachDay,
                  v126 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](*p_thirdOccurrencesForEachDay, "objectAtIndexedSubscript:", v122)), v126, v124 = (id *)v125, !v126))
            {
              objc_msgSend(*v124, "setObject:atIndexedSubscript:", v109, v122);
            }
          }
LABEL_167:
          v104 = v120 + v115;

          if ((id)++v105 == v161)
          {
            v130 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v181, v201, 16);
            v161 = v130;
            if (!v130)
              goto LABEL_173;
            goto LABEL_133;
          }
        }
      }
LABEL_174:
      v132 = v23;
      IsLeftToRight = CalInterfaceIsLeftToRight(v57);
      v136 = v154;
      if ((IsLeftToRight & 1) != 0)
      {
        v137 = 6.0;
        if (!v132->_isCompact)
          v137 = 10.5;
        v135 = CalRoundToScreenScale(IsLeftToRight, v134, v137);
      }
      if (-[MonthWeekOccurrencesView isNarrow](v132, "isNarrow", v135))
      {
        v138 = 6.0;
      }
      else
      {
        -[MonthWeekOccurrencesView isCompact](v132, "isCompact");
        v138 = 16.0;
      }
      +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, v138);
      v139 = 0;
      v141 = v140 + 1.0;
      do
      {
        v142 = v136[v139];
        -[MonthWeekOccurrencesView _frameForStartColumn:endColumn:dayRow:occurrenceRow:numRows:](v132, "_frameForStartColumn:endColumn:dayRow:occurrenceRow:numRows:", v139, v139, 0, (double)(*(unint64_t *)((char *)&v132->super.super.super.isa + v59) - 1), 1.0);
        v144 = v143;
        v146 = v145;
        v148 = v147;
        if (-[_MoreEventsView numberOfEvents](v136[v139], "numberOfEvents") <= 0)
          v149 = 0.0;
        else
          v149 = 1.0;
        if (-[MonthWeekOccurrencesView drawWithViews](v132, "drawWithViews")
          && (-[_MoreEventsView frame](v142, "frame"), v150 > 0.0))
        {
          v173[0] = _NSConcreteStackBlock;
          v173[1] = 3221225472;
          v173[2] = sub_100056404;
          v173[3] = &unk_1001B2B98;
          v174 = v142;
          v175 = v149;
          v176 = v144;
          v177 = v146;
          v178 = v148;
          v179 = v141;
          -[MonthWeekOccurrencesView animateBlock:](v132, "animateBlock:", v173);

        }
        else
        {
          -[_MoreEventsView setFrame:](v142, "setFrame:", v144, v146, v148, v141);
          -[_MoreEventsView setAlpha:](v142, "setAlpha:", v149);
          -[_MoreEventsView update](v142, "update");
        }

        ++v139;
      }
      while (v139 != 7);

    }
  }
}

- (void)setNeedsDisplay
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView layer](self, "layer"));
  objc_msgSend(v2, "setNeedsDisplay");

}

- (void)renderLayer
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView traitCollection](self, "traitCollection"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000564D8;
  v4[3] = &unk_1001B2538;
  v4[4] = self;
  objc_msgSend(v3, "performAsCurrentTraitCollection:", v4);

}

- (void)displayLayer:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  unsigned int v7;
  void *v8;
  char v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "isBackgroundScene");

  if ((v5 & 1) != 0
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView delegate](self, "delegate")),
        v7 = objc_msgSend(v6, "isBackgroundScene"),
        v6,
        v7))
  {
    -[MonthWeekOccurrencesView renderLayer](self, "renderLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "didCompleteMonthWeekViewBackgroundRendering");

    if ((v9 & 1) != 0)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView delegate](self, "delegate"));
      objc_msgSend(v10, "didCompleteMonthWeekViewBackgroundRendering");
LABEL_9:

    }
  }
  else if (!-[MonthWeekOccurrencesView drawWithViews](self, "drawWithViews")
         && !-[MonthWeekOccurrencesView animating](self, "animating"))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[_BackgroundViewRenderManager sharedManager](_BackgroundViewRenderManager, "sharedManager"));
    objc_msgSend(v10, "addViewToQueue:", self);
    goto LABEL_9;
  }
}

- (void)willMoveToSuperview:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[_BackgroundViewRenderManager sharedManager](_BackgroundViewRenderManager, "sharedManager", a3));
  objc_msgSend(v4, "removeViewFromQueue:", self);

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v5 = a3;
  objc_msgSend(v5, "locationInView:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView occurrenceAtPoint:](self, "occurrenceAtPoint:"));
  if (v6 && objc_msgSend(v5, "menuAppearance") != (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthWeekOccurrencesView delegate](self, "delegate"));
    objc_msgSend(v8, "monthWeekOccurrencesView:selectedEvent:userInitiated:", self, v6, 0);

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005684C;
    v10[3] = &unk_1001B2678;
    v10[4] = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v10));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (EKCalendarDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (EKCalendarDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (unint64_t)dayCount
{
  return self->_dayCount;
}

- (void)setDayCount:(unint64_t)a3
{
  self->_dayCount = a3;
}

- (BOOL)isBackgroundScene
{
  return self->_isBackgroundScene;
}

- (void)setIsBackgroundScene:(BOOL)a3
{
  self->_isBackgroundScene = a3;
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (void)setIsCompact:(BOOL)a3
{
  self->_isCompact = a3;
}

- (UIView)occurrenceContainer
{
  return self->_occurrenceContainer;
}

- (void)setOccurrenceContainer:(id)a3
{
  objc_storeStrong((id *)&self->_occurrenceContainer, a3);
}

- (MonthWeekViewOccurrencesViewDelegate)delegate
{
  return (MonthWeekViewOccurrencesViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasDrawnBefore
{
  return self->_hasDrawnBefore;
}

- (void)setHasDrawnBefore:(BOOL)a3
{
  self->_hasDrawnBefore = a3;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_occurrenceContainer, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_viewsLoadedCompletionBlock, 0);
  objc_storeStrong((id *)&self->_badgeLocales, 0);
  objc_storeStrong((id *)&self->_badgeColors, 0);
  objc_storeStrong((id *)&self->_dayTypes, 0);
  objc_storeStrong((id *)&self->_selectedOccurrences, 0);
  objc_storeStrong((id *)&self->_thirdOccurrencesForEachDay, 0);
  objc_storeStrong((id *)&self->_secondOccurrencesForEachDay, 0);
  objc_storeStrong((id *)&self->_allMonthViews, 0);
  objc_storeStrong((id *)&self->_allOccurrences, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  for (i = 6; i != -1; --i)
    objc_storeStrong((id *)&self->_moreEventsViews[i], 0);
  objc_storeStrong((id *)&self->_singleDayEventBuckets, 0);
  objc_storeStrong((id *)&self->_layedOutRows, 0);
}

- (void)setupEntityProvider
{
  unint64_t v3;
  MonthWeekOccurrencesView *v4;
  _BYTE v5[8];

  swift_unknownObjectWeakInit(v5, self);
  v3 = sub_100125F44();
  v4 = self;
  UIView.setEntityProvider<A>(_:)(v5, &type metadata for ViewEntityProviderWrapper, v3);
  sub_10011FF30((uint64_t)v5);

}

@end
