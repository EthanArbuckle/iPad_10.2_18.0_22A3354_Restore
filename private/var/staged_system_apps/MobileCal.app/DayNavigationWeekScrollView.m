@implementation DayNavigationWeekScrollView

- (id)_weekStartForDate:(id)a3
{
  NSCalendar *calendar;
  id v5;
  void *v6;
  void *v7;

  calendar = self->_calendar;
  v5 = a3;
  -[NSCalendar setFirstWeekday:](calendar, "setFirstWeekday:", CUIKOneIndexedWeekStart());
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 24578, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v6));
  return v7;
}

- (void)stopPulsingToday
{
  NSMutableArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_cells;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isToday", (_QWORD)v8))
        {
          objc_msgSend(v7, "stopPulsing");
          goto LABEL_11;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (int64_t)_indexOfCellToScrollToForDateAndBuildIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int IsLeftToRight;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  int64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_cells, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_cells, "lastObject"));
  IsLeftToRight = CalTimeDirectionIsLeftToRight(v6, v7);
  if (IsLeftToRight)
    v9 = v5;
  else
    v9 = v6;
  if (IsLeftToRight)
    v10 = v6;
  else
    v10 = v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
  if (objc_msgSend(v4, "compare:", v11) == (id)-1 || objc_msgSend(v4, "compare:", v12) == (id)1)
  {
    v13 = -[DayNavigationWeekScrollView _firstVisibleIndex](self, "_firstVisibleIndex", v6);
    v14 = -[DayNavigationWeekScrollView _lastVisibleIndex](self, "_lastVisibleIndex");
    if (v13 < 0 || v13 >= (uint64_t)-[NSMutableArray count](self->_cells, "count"))
    {
      v15 = 0;
      if (v14 < 0)
        goto LABEL_16;
    }
    else
    {
      v15 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", v13));
      if (v14 < 0)
        goto LABEL_16;
    }
    if (v14 < (uint64_t)-[NSMutableArray count](self->_cells, "count"))
    {
      v16 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", v14));
      goto LABEL_17;
    }
LABEL_16:
    v16 = 0;
LABEL_17:
    if (IsLeftToRight)
      v17 = (void *)v15;
    else
      v17 = (void *)v16;
    v45 = (void *)v15;
    if (IsLeftToRight)
      v15 = v16;
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "date"));
    v19 = (void *)v15;
    v20 = (void *)v18;
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "date"));
    v22 = (void *)v21;
    v47 = (void *)v16;
    if (!v20 || v21)
    {
      if (!v20 && v21)
      {
        v26 = objc_alloc_init((Class)NSDateComponents);
        objc_msgSend(v26, "setDay:", 1 - self->_weekLength);
        v27 = v22;
        v28 = objc_claimAutoreleasedReturnValue(-[NSCalendar dateByAddingComponents:toDate:options:](self->_calendar, "dateByAddingComponents:toDate:options:", v26, v22, 0));

        v20 = (void *)v28;
        v22 = v27;
      }
      if (!v20)
        goto LABEL_32;
      v25 = v22;
    }
    else
    {
      v23 = v20;
      v24 = objc_alloc_init((Class)NSDateComponents);
      objc_msgSend(v24, "setDay:", self->_weekLength - 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateByAddingComponents:toDate:options:](self->_calendar, "dateByAddingComponents:toDate:options:", v24, v23, 0));

      v20 = v23;
    }
    if (objc_msgSend(v4, "compare:", v20) == (id)-1)
    {
      v46 = v20;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v4, v20, 0));
      v34 = objc_msgSend(v33, "day");

      goto LABEL_38;
    }
    v22 = v25;
LABEL_32:
    v46 = v20;
    if (v22)
    {
      v25 = v22;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v22, v4, 0));
      v30 = objc_msgSend(v29, "day");

      if ((uint64_t)v30 > self->_weekLength)
      {
        v31 = -1;
        v6 = v44;
        v32 = v45;
LABEL_54:

        goto LABEL_55;
      }
      v6 = v44;
      if (objc_msgSend(v4, "compare:", v12) == (id)1)
      {
        do
        {
          if (IsLeftToRight)
          {
            -[DayNavigationWeekScrollView _addNewCellToSide:](self, "_addNewCellToSide:", 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_cells, "lastObject"));
            v39 = v6;
            v6 = v38;
          }
          else
          {
            -[DayNavigationWeekScrollView _addNewCellToSide:](self, "_addNewCellToSide:", 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_cells, "firstObject"));
            v39 = v5;
            v5 = v38;
          }

          v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "date"));
          v12 = (void *)v40;
        }
        while (objc_msgSend(v4, "compare:", v40) == (id)1);
        v12 = (void *)v40;
      }
      goto LABEL_52;
    }
    v25 = 0;
    v34 = 0;
LABEL_38:
    v6 = v44;
    if ((uint64_t)v34 > self->_weekLength)
    {
      v31 = -1;
LABEL_53:
      v32 = v45;
      goto LABEL_54;
    }
    if (objc_msgSend(v4, "compare:", v11) == (id)-1)
    {
      do
      {
        if (IsLeftToRight)
        {
          -[DayNavigationWeekScrollView _addNewCellToSide:](self, "_addNewCellToSide:", 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_cells, "firstObject"));
          v36 = v5;
          v5 = v35;
        }
        else
        {
          -[DayNavigationWeekScrollView _addNewCellToSide:](self, "_addNewCellToSide:", 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_cells, "lastObject"));
          v36 = v6;
          v6 = v35;
        }

        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "date"));
        v11 = (void *)v37;
      }
      while (objc_msgSend(v4, "compare:", v37) == (id)-1);
      v11 = (void *)v37;
    }
LABEL_52:
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_cells, "firstObject"));

    objc_msgSend(v41, "frame");
    self->_firstCellX = v42;
    v31 = -[DayNavigationWeekScrollView _indexForDate:](self, "_indexForDate:", v4);
    v5 = v41;
    goto LABEL_53;
  }
  v31 = -[DayNavigationWeekScrollView _indexForDate:](self, "_indexForDate:", v4);
LABEL_55:

  return v31;
}

- (DayNavigationWeekScrollView)initWithFrame:(CGRect)a3 calendar:(id)a4 selectedDate:(id)a5 cellFactory:(id)a6 eventSpringLoadingEnabled:(BOOL)a7
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  id v18;
  DayNavigationWeekScrollView *v19;
  DayNavigationWeekScrollView *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v27.receiver = self;
  v27.super_class = (Class)DayNavigationWeekScrollView;
  v19 = -[DayNavigationWeekScrollView initWithFrame:](&v27, "initWithFrame:", x, y, width, height);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_calendar, a4);
    -[NSCalendar rangeOfUnit:inUnit:forDate:](v20->_calendar, "rangeOfUnit:inUnit:forDate:", 512, 4096, v17);
    v20->_weekLength = v21;
    if (v21 >= 0)
      v22 = v21;
    else
      v22 = v21 + 1;
    v20->_sideViews = v22 >> 1;
    v20->_maxBufferViews = v20->_weekLength;
    objc_storeStrong((id *)&v20->_cellFactory, a6);
    v20->_eventSpringLoadingEnabled = a7;
    -[DayNavigationWeekScrollView setShowsHorizontalScrollIndicator:](v20, "setShowsHorizontalScrollIndicator:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[DayNavigationWeekScrollView setBackgroundColor:](v20, "setBackgroundColor:", v23);

    -[DayNavigationWeekScrollView setPagingEnabled:](v20, "setPagingEnabled:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView panGestureRecognizer](v20, "panGestureRecognizer"));
    objc_msgSend(v24, "setDelaysTouchesBegan:", 1);

    -[DayNavigationWeekScrollView setContentInsetAdjustmentBehavior:](v20, "setContentInsetAdjustmentBehavior:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView _weekStartForDate:](v20, "_weekStartForDate:", v17));
    -[DayNavigationWeekScrollView _createSubviewsWithFirstVisibleDate:](v20, "_createSubviewsWithFirstVisibleDate:", v25);
    -[DayNavigationWeekScrollView setFrame:](v20, "setFrame:", x, y, v20->_cellWidth * (double)((2 * -[DayNavigationWeekScrollView sideViews](v20, "sideViews")) | 1), height);
    -[DayNavigationWeekScrollView setSelectedDate:animated:](v20, "setSelectedDate:animated:", v17, 0);

  }
  return v20;
}

- (void)_updateCellWidthIfNeeded
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[DayNavigationWeekScrollView _calculateCellWidth](self, "_calculateCellWidth");
  v4 = v3;
  if (vabdd_f64(v3, self->_cellWidth) >= 2.22044605e-16)
  {
    self->_cellWidth = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView navDelegate](self, "navDelegate"));

    if (v5)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView navDelegate](self, "navDelegate"));
      objc_msgSend(v6, "dayNavigationWeekScrollView:didChangeCellWidth:", self, v4);

    }
  }
}

- (double)_calculateCellWidth
{
  uint64_t v3;
  double v4;
  void *v5;
  id v6;
  double v7;
  uint64_t v8;
  double result;

  -[DayNavigationWeekScrollView bounds](self, "bounds");
  if (fabs(v4) >= 2.22044605e-16)
  {
    v6 = -[DayNavigationWeekScrollView bounds](self, "bounds");
    return CalRoundToScreenScale(v6, v8, v7 / (double)self->_weekLength);
  }
  else
  {
    if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(self, v3))
    {
      if (qword_1001F64E0 != -1)
        dispatch_once(&qword_1001F64E0, &stru_1001B52A8);
      v5 = (void *)qword_1001F64D8;
    }
    else
    {
      if (qword_1001F64F0 != -1)
        dispatch_once(&qword_1001F64F0, &stru_1001B52C8);
      v5 = (void *)qword_1001F64E8;
    }
    AnchoredValueCurrentWindowWidth(self);
    objc_msgSend(v5, "valueForSize:");
  }
  return result;
}

- (void)_layoutCells
{
  double cellWidth;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  double v8;
  double v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[8];
  _BYTE v22[128];

  cellWidth = self->_cellWidth;
  -[DayNavigationWeekScrollView _updateCellWidthIfNeeded](self, "_updateCellWidthIfNeeded");
  v4 = self->_cellWidth;
  self->_pageAlignment = v4 * (double)((2 * -[DayNavigationWeekScrollView sideViews](self, "sideViews")) | 1);
  if (cellWidth == 0.0)
  {
    v7 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView _layoutCells: oldCellWidth was 0 in division.", buf, 2u);
    }
    v5 = self->_cellWidth;
    v6 = 0.0;
  }
  else
  {
    v5 = self->_cellWidth;
    v6 = self->_firstCellX / cellWidth * v5;
  }
  -[DayNavigationWeekScrollView bounds](self, "bounds");
  v9 = v8;
  self->_firstCellX = v6;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = self->_cells;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "setFrame:", v6, 0.0, v5, v9, (_QWORD)v17);
        objc_msgSend(v15, "setNeedsLayout");
        v6 = v6 + self->_cellWidth;
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v12);
  }

  self->_needToLayoutCells = 0;
  v16 = self->_firstCellX + self->_contentOffsetBeforeResizeInCellWidths * self->_cellWidth;
  self->_contentOffsetBeforeResizeInCellWidths = 0.0;
  -[DayNavigationWeekScrollView setContentOffset:](self, "setContentOffset:", v16, 0.0);
  if (vabdd_f64(cellWidth, self->_cellWidth) >= 2.22044605e-16)
    -[DayNavigationWeekScrollView _adjustContentOffsetIfNeeded](self, "_adjustContentOffsetIfNeeded");
  -[DayNavigationWeekScrollView _setOffscreenCellsHidden:animated:](self, "_setOffscreenCellsHidden:animated:", 1, 0, (_QWORD)v17);
}

- (void)_setOffscreenCellsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double targetX;
  double v8;
  _QWORD *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD *v12;
  _QWORD v13[7];
  BOOL v14;
  CGRect v15;

  v4 = a4;
  if (self->_isScrolling)
  {
    targetX = self->_targetX;
  }
  else
  {
    -[DayNavigationWeekScrollView contentOffset](self, "contentOffset");
    targetX = v8;
  }
  -[DayNavigationWeekScrollView bounds](self, "bounds");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000C840;
  v13[3] = &unk_1001B5310;
  v13[4] = self;
  v14 = a3;
  *(double *)&v13[5] = targetX;
  *(double *)&v13[6] = targetX + CGRectGetWidth(v15);
  v9 = objc_retainBlock(v13);
  v10 = v9;
  if (v4)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000E5FE8;
    v11[3] = &unk_1001B2E30;
    v12 = v9;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, 0.3);

  }
  else
  {
    ((void (*)(_QWORD *))v9[2])(v9);
  }

}

- (void)_adjustCellsIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double firstCellX;
  void *v8;
  double MaxX;
  void *v10;
  double v11;
  void *v12;
  double v13;
  id v14;
  CGRect v15;
  CGRect v16;

  if (!self->_recentering && self->_cells)
  {
    -[DayNavigationWeekScrollView contentOffset](self, "contentOffset");
    v4 = v3;
    -[DayNavigationWeekScrollView frame](self, "frame");
    v6 = v4 + v5;
    firstCellX = self->_firstCellX;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_cells, "lastObject"));
    objc_msgSend(v8, "frame");
    MaxX = CGRectGetMaxX(v15);
    while (v4 < firstCellX)
    {
      -[DayNavigationWeekScrollView _addNewCellToSide:](self, "_addNewCellToSide:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_cells, "firstObject"));
      objc_msgSend(v10, "frame");
      firstCellX = v11;

    }
    if (v6 <= MaxX)
    {
      v14 = v8;
    }
    else
    {
      do
      {
        -[DayNavigationWeekScrollView _addNewCellToSide:](self, "_addNewCellToSide:", 0);
        v14 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_cells, "lastObject"));

        objc_msgSend(v14, "frame");
        v8 = v14;
      }
      while (v6 > CGRectGetMaxX(v16));
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_cells, "firstObject"));
    objc_msgSend(v12, "frame");
    self->_firstCellX = v13;

  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DayNavigationWeekScrollView;
  -[DayNavigationWeekScrollView setBackgroundColor:](&v14, "setBackgroundColor:", v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_cells;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setBackgroundColor:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)setSelectedDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSDate **p_selectedDate;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSDate *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  CGRect v33;

  v4 = a4;
  v6 = a3;
  self->_decelerationWasLastInput = 0;
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 30, v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v8));

  }
  else
  {
    v9 = 0;
  }
  p_selectedDate = &self->_selectedDate;
  if ((-[NSDate isEqual:](self->_selectedDate, "isEqual:", v9) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedDate, v9);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = self->_cells;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          -[DayNavigationWeekScrollView _setCell:highlight:animated:](self, "_setCell:highlight:animated:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), 0, v4);
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

    if (*p_selectedDate)
    {
      v16 = -[DayNavigationWeekScrollView _indexOfCellToScrollToForDateAndBuildIfNeeded:](self, "_indexOfCellToScrollToForDateAndBuildIfNeeded:", v9);
      if (v16 < 0
        || (v17 = v16, v16 >= (uint64_t)-[NSMutableArray count](self->_cells, "count"))
        || (v18 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", v17))) == 0)
      {
        self->_isScrolling = 0;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView _weekStartForDate:](self, "_weekStartForDate:", v9));
        -[DayNavigationWeekScrollView _createSubviewsWithFirstVisibleDate:](self, "_createSubviewsWithFirstVisibleDate:", v19);
        v25 = *p_selectedDate;
        *p_selectedDate = 0;

        -[DayNavigationWeekScrollView setSelectedDate:animated:](self, "setSelectedDate:animated:", v9, 0);
LABEL_21:

        goto LABEL_22;
      }
      v19 = (void *)v18;
      if (v17 < -[DayNavigationWeekScrollView _firstVisibleIndex](self, "_firstVisibleIndex")
        || v17 > -[DayNavigationWeekScrollView _lastVisibleIndex](self, "_lastVisibleIndex"))
      {
        objc_msgSend(v19, "frame");
        -[DayNavigationWeekScrollView _alignXToPage:](self, "_alignXToPage:", CGRectGetMidX(v33));
        self->_targetX = v20;
        if (v4)
        {
          self->_isScrolling = 1;
          v21 = springAnimationDuration(-[DayNavigationWeekScrollView _setOffscreenCellsHidden:animated:](self, "_setOffscreenCellsHidden:animated:", 1, 1));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_1000E4988;
          v27[3] = &unk_1001B2538;
          v27[4] = self;
          v23 = dayViewScrollAnimationsPreferringFRR(v27);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_1000E49E0;
          v26[3] = &unk_1001B25D0;
          v26[4] = self;
          +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v22, v24, v26, v21, 0.0);

          self->_needToHighlightCellAfterScrolling = 1;
          -[DayNavigationWeekScrollView updateHighlightIfNeeded](self, "updateHighlightIfNeeded");
LABEL_25:
          self->_selectedIndex = v17;
          goto LABEL_21;
        }
        -[DayNavigationWeekScrollView setContentOffset:](self, "setContentOffset:");
        -[DayNavigationWeekScrollView _setOffscreenCellsHidden:animated:](self, "_setOffscreenCellsHidden:animated:", 1, 0);
      }
      -[DayNavigationWeekScrollView _setCell:highlight:animated:](self, "_setCell:highlight:animated:", v19, 1, v4);
      -[DayNavigationWeekScrollView _setOffscreenCellsHidden:animated:](self, "_setOffscreenCellsHidden:animated:", 1, 0);
      goto LABEL_25;
    }
  }
LABEL_22:

}

- (CGSize)cellSize
{
  double v3;
  double cellWidth;
  CGSize result;

  -[DayNavigationWeekScrollView sizeThatFits:](self, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  cellWidth = self->_cellWidth;
  result.height = v3;
  result.width = cellWidth;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  double v14;
  CGSize result;

  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView traitCollection](self, "traitCollection", a3.width, a3.height));
  v7 = EKUIUsesRoundedRectsInsteadOfCircles(v5, v6);

  if (v7)
  {
    -[DayNavigationViewCellFactory roundedRectHeight](self->_cellFactory, "roundedRectHeight");
    v10 = v9;
  }
  else if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(self, v8))
  {
    v11 = CUIKGetOverlayCalendar();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = v12 == 0;

    v10 = dbl_1001A1920[v13];
  }
  else
  {
    v10 = 45.0;
  }
  v14 = width;
  result.height = v10;
  result.width = v14;
  return result;
}

- (void)_createSubviewsWithFirstVisibleDate:(id)a3
{
  id v4;
  NSMutableArray *cells;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  NSMutableArray *v11;
  uint64_t v12;
  double v13;
  double cellWidth;
  uint64_t v15;
  NSCalendar *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char IsLeftToRight;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSMutableArray *v27;
  NSMutableArray *v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  NSCalendar *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];

  v4 = a3;
  cells = self->_cells;
  if (cells)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v6 = cells;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v50 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v8);
    }

    v11 = self->_cells;
    self->_cells = 0;

  }
  -[DayNavigationWeekScrollView _updateCellWidthIfNeeded](self, "_updateCellWidthIfNeeded");
  v44 = 2 * -[DayNavigationWeekScrollView sideViews](self, "sideViews");
  v12 = v44 + 3;
  -[DayNavigationWeekScrollView bounds](self, "bounds");
  -[DayNavigationWeekScrollView setContentSize:](self, "setContentSize:", 40000.0, v13);
  cellWidth = self->_cellWidth;
  v15 = 1;
  self->_pageAlignment = cellWidth * (double)((2 * -[DayNavigationWeekScrollView sideViews](self, "sideViews")) | 1);
  -[DayNavigationWeekScrollView bounds](self, "bounds");
  -[DayNavigationWeekScrollView setBounds:](self, "setBounds:");
  v16 = self->_calendar;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v16, "components:fromDate:", 30, v4));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v16, "dateFromComponents:"));

  v18 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v18, "setHour:", 4);
  v19 = objc_claimAutoreleasedReturnValue(-[NSCalendar dateByAddingComponents:toDate:options:](v16, "dateByAddingComponents:toDate:options:", v18, v17, 0));

  IsLeftToRight = CalTimeDirectionIsLeftToRight(v20, v21);
  objc_msgSend(v18, "setHour:", 0);
  objc_msgSend(v18, "setDay:", -1);
  v45 = (void *)v19;
  v46 = v18;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateByAddingComponents:toDate:options:](v16, "dateByAddingComponents:toDate:options:", v18, v19, 0));
  v48 = v16;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar timeZone](v16, "timeZone"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v23, v24));

  if ((IsLeftToRight & 1) == 0)
  {
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "calendarDateByAddingDays:", v44 + 2));

    v15 = -1;
    v25 = (void *)v26;
  }
  v27 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v12);
  v28 = self->_cells;
  self->_cells = v27;

  -[DayNavigationWeekScrollView contentSize](self, "contentSize");
  v30 = v29 * 0.5;
  v31 = -[DayNavigationWeekScrollView sideViews](self, "sideViews");
  v32 = self->_cellWidth;
  v33 = v30 - (double)v31 * v32 - v32 * 0.5;
  -[DayNavigationWeekScrollView bounds](self, "bounds");
  v35 = v34;
  -[DayNavigationWeekScrollView _alignXToPage:](self, "_alignXToPage:", v33);
  v37 = v36 - self->_cellWidth;
  self->_firstCellX = v37;
  if (v12 < 1)
  {
    v42 = v25;
  }
  else
  {
    do
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCellFactory createCellWithFrame:](self->_cellFactory, "createCellWithFrame:", v37, 0.0, v32, v35));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView backgroundColor](self, "backgroundColor"));
      objc_msgSend(v38, "setBackgroundColor:", v39);

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "calendarDateForDay"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "date"));
      -[DayNavigationWeekScrollView _setCell:toDate:](self, "_setCell:toDate:", v38, v41);

      objc_msgSend(v38, "setDelegate:", self);
      -[DayNavigationWeekScrollView addSubview:](self, "addSubview:", v38);
      -[NSMutableArray addObject:](self->_cells, "addObject:", v38);
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "calendarDateByAddingDays:", v15));

      v37 = v37 + self->_cellWidth;
      objc_msgSend(v38, "layoutSubviews");

      v25 = v42;
      --v12;
    }
    while (v12);
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", 1));
  self->_needToLayoutCells = 0;
  self->_contentOffsetBeforeResizeInCellWidths = 0.0;
  objc_msgSend(v43, "frame");
  -[DayNavigationWeekScrollView setContentOffset:](self, "setContentOffset:");
  -[DayNavigationWeekScrollView _setOffscreenCellsHidden:animated:](self, "_setOffscreenCellsHidden:animated:", 1, 0);

}

- (void)_setCell:(id)a3 toDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  unsigned int v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v16, "setDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView _selectedDateAsCalendarDate](self, "_selectedDateAsCalendarDate"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calendarDateForDay"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendarDateForEndOfDay"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "date"));

    v13 = objc_msgSend(v10, "compare:", v6) != (id)1 && objc_msgSend(v12, "compare:", v6) != (id)-1;
    objc_msgSend(v16, "setCircled:animated:", v13, 0);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView today](self, "today"));
  v15 = objc_msgSend(v6, "isEqualToDate:", v14);

  if (v15)
    objc_msgSend(v16, "setIsToday:", 1);
  if (-[DayNavigationWeekScrollView _isDateWeekend:](self, "_isDateWeekend:", v6))
    objc_msgSend(v16, "setIsWeekend:", 1);
  objc_msgSend(v16, "setOverlayShowsMonth:animated:", -[NSCalendar component:fromDate:](self->_calendar, "component:fromDate:", 512, v6) == CUIKOneIndexedWeekStart(), 0);
  -[DayNavigationWeekScrollView _updateBadgeForCell:forDate:](self, "_updateBadgeForCell:forDate:", v16, v6);
  objc_msgSend(v16, "setAlpha:", 1.0);

}

- (NSDate)today
{
  NSDate *today;
  uint64_t v4;
  NSDate *v5;
  NSDate *v6;

  today = self->_today;
  if (!today)
  {
    v4 = CUIKTodayDate(0, a2);
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue(v4);
    v6 = self->_today;
    self->_today = v5;

    today = self->_today;
  }
  return today;
}

- (id)_selectedDateAsCalendarDate
{
  void *v3;
  id v4;

  if (self->_selectedDate)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar timeZone](self->_calendar, "timeZone"));
    if (v3)
      v4 = objc_msgSend(objc_alloc((Class)EKCalendarDate), "initWithDate:timeZone:", self->_selectedDate, v3);
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)_isDateWeekend:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSCalendar *calendar;
  void *v8;
  id v9;
  unsigned __int8 v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  v6 = objc_msgSend(v5, "overrideLocaleWeekends");

  calendar = self->_calendar;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](calendar, "components:fromDate:", 512, v4));

    v9 = objc_msgSend(v8, "weekday");
    v11 = v9 == (id)1 || v9 == (id)7;
    v4 = v8;
  }
  else
  {
    v11 = -[NSCalendar isDateInWeekend:](calendar, "isDateInWeekend:", v4);
  }

  return v11;
}

- (void)_setCell:(id)a3 highlight:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setCircled:animated:", v6, v5);
  objc_msgSend(v7, "setUserInteractionEnabled:", v6 ^ 1);

}

- (void)updateOverlays
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView superview](self, "superview"));
  objc_msgSend(v3, "setNeedsLayout");

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_cells;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)updateDayBadges
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_cells;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "date", (_QWORD)v10));
        -[DayNavigationWeekScrollView _updateBadgeForCell:forDate:](self, "_updateBadgeForCell:forDate:", v8, v9);

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_updateBadgeForCell:(id)a3 forDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;

  v6 = a3;
  v12 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView _badgeDataForDate:outIsLoading:](self, "_badgeDataForDate:outIsLoading:", a4, &v12));
  v8 = v7;
  if (!v12)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "color"));
    objc_msgSend(v6, "setBadgeColor:", v9);

    if (v8)
      v10 = objc_msgSend(v8, "dayType");
    else
      v10 = 0;
    objc_msgSend(v6, "setBadgeType:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "locale"));
    objc_msgSend(v6, "setBadgeLocale:", v11);

  }
}

- (id)_badgeDataForDate:(id)a3 outIsLoading:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView navDelegate](self, "navDelegate"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView navDelegate](self, "navDelegate"));
    v9 = objc_msgSend(v8, "dayNavigationWeekScrollViewIsLoadingSpecialDayData:", self);

    if (a4)
      *a4 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView navDelegate](self, "navDelegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dayNavigationWeekScrollView:dayDataForDate:", self, v6));

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (DayNavigationWeekScrollViewDelegate)navDelegate
{
  return (DayNavigationWeekScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_navDelegate);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  int64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  double v16;
  objc_super v17;
  uint8_t buf[16];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (double)((2 * -[DayNavigationWeekScrollView sideViews](self, "sideViews")) | 1);
  v9 = -[DayNavigationWeekScrollView sideViews](self, "sideViews");
  v11 = CalRoundToScreenScale(v9, v10, width / (double)((2 * v9) | 1)) * v8;
  -[DayNavigationWeekScrollView frame](self, "frame");
  if (vabdd_f64(v11, v12) >= 2.22044605e-16
    || (-[DayNavigationWeekScrollView frame](self, "frame"), vabdd_f64(height, v13) >= 2.22044605e-16))
  {
    if (!self->_needToLayoutCells)
    {
      if (self->_cellWidth == 0.0)
      {
        v15 = kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView setFrame: _cellWidth was 0 in division.", buf, 2u);
        }
      }
      else
      {
        -[DayNavigationWeekScrollView contentOffset](self, "contentOffset");
        self->_contentOffsetBeforeResizeInCellWidths = (v14 - self->_firstCellX) / self->_cellWidth;
      }
      self->_needToLayoutCells = 1;
      -[DayNavigationWeekScrollView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  -[DayNavigationWeekScrollView frame](self, "frame");
  if (vabdd_f64(height, v16) >= 2.22044605e-16)
  {
    -[DayNavigationWeekScrollView contentSize](self, "contentSize");
    -[DayNavigationWeekScrollView setContentSize:](self, "setContentSize:");
  }
  v17.receiver = self;
  v17.super_class = (Class)DayNavigationWeekScrollView;
  -[DayNavigationWeekScrollView setFrame:](&v17, "setFrame:", x, y, v11, height);
}

- (int64_t)sideViews
{
  return self->_sideViews;
}

- (int64_t)_indexForDate:(id)a3
{
  NSCalendar *v5;
  void *v6;
  NSMutableArray *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  int64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = self->_calendar;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v5, "components:fromDate:", 30, a3));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->_cells;
  v8 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    while (2)
    {
      v12 = 0;
      v13 = &v9[(_QWORD)v10];
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v12), "date", (_QWORD)v22));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v5, "components:fromDate:", 30, v14));

        v16 = objc_msgSend(v6, "day");
        if (v16 == objc_msgSend(v15, "day"))
        {
          v17 = objc_msgSend(v6, "month");
          if (v17 == objc_msgSend(v15, "month"))
          {
            v18 = objc_msgSend(v6, "year");
            if (v18 == objc_msgSend(v15, "year"))
            {
              v19 = objc_msgSend(v6, "era");
              if (v19 == objc_msgSend(v15, "era"))
              {

                v20 = (int64_t)&v12[(_QWORD)v10];
                goto LABEL_14;
              }
            }
          }
        }

        ++v12;
      }
      while (v9 != v12);
      v9 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v10 = v13;
      if (v9)
        continue;
      break;
    }
  }
  v20 = -1;
LABEL_14:

  return v20;
}

- (void)layoutSubviews
{
  if (self->_needToLayoutCells)
    -[DayNavigationWeekScrollView _layoutCells](self, "_layoutCells");
  -[DayNavigationWeekScrollView _adjustCellsIfNeeded](self, "_adjustCellsIfNeeded");
}

- (void)_adjustContentOffsetIfNeeded
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
  id v14;

  -[DayNavigationWeekScrollView contentSize](self, "contentSize");
  v4 = v3 * 0.5;
  -[DayNavigationWeekScrollView bounds](self, "bounds");
  v6 = v4 - v5 * 0.5;
  -[DayNavigationWeekScrollView contentSize](self, "contentSize");
  v8 = v7 * 0.25;
  -[DayNavigationWeekScrollView contentOffset](self, "contentOffset");
  if (v8 < vabdd_f64(v6, v9))
  {
    self->_recentering = 1;
    -[DayNavigationWeekScrollView _alignXToPage:](self, "_alignXToPage:", v6 - v9);
    -[DayNavigationWeekScrollView _offsetAllViews:](self, "_offsetAllViews:");
    -[DayNavigationWeekScrollView _alignXToPage:](self, "_alignXToPage:", v6 + v10);
    v12 = v11;
    v14 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", 0));
    objc_msgSend(v14, "frame");
    self->_firstCellX = v13;
    -[DayNavigationWeekScrollView setContentOffset:](self, "setContentOffset:", v12, 0.0);
    self->_recentering = 0;

  }
}

- (void)setNavDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navDelegate, a3);
}

- (void)didScroll
{
  self->_decelerationWasLastInput = 0;
}

- (void)cancelScrollingAnimation
{
  -[DayNavigationWeekScrollView _removeAllAnimations:](self, "_removeAllAnimations:", 0);
  if (self->_isScrolling)
    -[DayNavigationWeekScrollView didFinishScrolling](self, "didFinishScrolling");
}

- (int64_t)_lastVisibleIndex
{
  double v3;
  double v4;
  double firstCellX;
  double v6;
  double cellWidth;
  NSObject *v9;
  uint8_t v10[16];

  -[DayNavigationWeekScrollView contentOffset](self, "contentOffset");
  v4 = v3;
  firstCellX = self->_firstCellX;
  -[DayNavigationWeekScrollView bounds](self, "bounds");
  cellWidth = self->_cellWidth;
  if (cellWidth != 0.0)
    return vcvtmd_u64_f64((v4 - firstCellX + v6 + cellWidth * -0.5) / cellWidth);
  v9 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView _lastVisibleIndex: _cellWidth was 0 in division.", v10, 2u);
  }
  return 0;
}

- (int64_t)_firstVisibleIndex
{
  double v3;
  double cellWidth;
  NSObject *v6;
  uint8_t v7[16];

  -[DayNavigationWeekScrollView contentOffset](self, "contentOffset");
  cellWidth = self->_cellWidth;
  if (cellWidth != 0.0)
    return vcvtmd_u64_f64((v3 - self->_firstCellX + 0.5) / cellWidth);
  v6 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView _firstVisibleIndex: _cellWidth was 0 in division.", v7, 2u);
  }
  return 0;
}

- (double)_alignXToPage:(double)a3
{
  double v4;
  double pageAlignment;
  NSObject *v6;
  uint8_t v8[16];

  v4 = CalRoundToScreenScale(self, a2, a3);
  pageAlignment = self->_pageAlignment;
  if (pageAlignment != 0.0)
    return pageAlignment * floor(v4 / pageAlignment);
  v6 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView _alignXToPage: _pageAlignment was 0 in division.", v8, 2u);
  }
  return v4;
}

- (int64_t)maxBufferViews
{
  return self->_maxBufferViews;
}

- (int64_t)_loadedBufferViewsRight
{
  id v3;

  v3 = -[NSMutableArray count](self->_cells, "count");
  return (int64_t)v3
       + ~(unint64_t)-[DayNavigationWeekScrollView _lastVisibleIndex](self, "_lastVisibleIndex");
}

- (NSDate)selectedDate
{
  return self->_selectedDate;
}

- (NSDate)startDateOfSelectedWeek
{
  return (NSDate *)-[DayNavigationWeekScrollView _weekStartForDate:](self, "_weekStartForDate:", self->_selectedDate);
}

- (int64_t)cellsDisplayed
{
  return self->_weekLength;
}

- (DayNavigationViewCellFactory)cellFactory
{
  return self->_cellFactory;
}

- (void)setSelectedDateWithoutScrolling:(id)a3
{
  id v5;
  NSDate **p_selectedDate;
  uint64_t v7;
  int64_t v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSDate *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a3;
  p_selectedDate = &self->_selectedDate;
  objc_storeStrong((id *)&self->_selectedDate, a3);
  v7 = -[DayNavigationWeekScrollView _indexOfCellToScrollToForDateAndBuildIfNeeded:](self, "_indexOfCellToScrollToForDateAndBuildIfNeeded:", v5);
  if (v7 < 0 || (v8 = v7, v7 >= (uint64_t)-[NSMutableArray count](self->_cells, "count")))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView _weekStartForDate:](self, "_weekStartForDate:", v5));
    -[DayNavigationWeekScrollView _createSubviewsWithFirstVisibleDate:](self, "_createSubviewsWithFirstVisibleDate:", v16);
    v17 = *p_selectedDate;
    *p_selectedDate = 0;

    -[DayNavigationWeekScrollView setSelectedDate:animated:](self, "setSelectedDate:animated:", v5, 0);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", v8));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = self->_cells;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14);
          if (v15 != v9 || (objc_msgSend(v9, "circled", (_QWORD)v18) & 1) == 0)
            -[DayNavigationWeekScrollView _setCell:highlight:animated:](self, "_setCell:highlight:animated:", v15, 0, 1, (_QWORD)v18);
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    -[DayNavigationWeekScrollView _setCell:highlight:animated:](self, "_setCell:highlight:animated:", v9, 1, 1);
    self->_selectedIndex = v8;

  }
}

- (void)updateHighlightIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (self->_needToHighlightCellAfterScrolling)
  {
    self->_needToHighlightCellAfterScrolling = 0;
    v3 = -[DayNavigationWeekScrollView _indexForDate:](self, "_indexForDate:", self->_selectedDate);
    if ((v3 & 0x8000000000000000) == 0)
    {
      v4 = v3;
      if (v3 < (uint64_t)-[NSMutableArray count](self->_cells, "count"))
      {
        v5 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", v4));
        if (v5)
        {
          v6 = (id)v5;
          -[DayNavigationWeekScrollView _setCell:highlight:animated:](self, "_setCell:highlight:animated:", v5, 1, 1);

        }
      }
    }
  }
}

- (void)pulseToday
{
  NSMutableArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_cells;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isToday", (_QWORD)v8))
        {
          objc_msgSend(v7, "pulseToday");
          goto LABEL_11;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)setCalendar:(id)a3
{
  id v5;
  NSDate *today;
  id v7;

  objc_storeStrong((id *)&self->_calendar, a3);
  v5 = a3;
  today = self->_today;
  self->_today = 0;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView _weekStartForDate:](self, "_weekStartForDate:", self->_selectedDate));
  -[DayNavigationWeekScrollView _createSubviewsWithFirstVisibleDate:](self, "_createSubviewsWithFirstVisibleDate:", v7);

}

- (void)setFirstVisibleDate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *cells;
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
  v5 = self->_cells;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "removeFromSuperview", (_QWORD)v11);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  cells = self->_cells;
  self->_cells = 0;

  -[DayNavigationWeekScrollView _createSubviewsWithFirstVisibleDate:](self, "_createSubviewsWithFirstVisibleDate:", v4);
}

- (void)setToSelectedDateAtLocation:(CGPoint)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = -[DayNavigationWeekScrollView _cellIndexForX:](self, "_cellIndexForX:", a3.x, a3.y);
  if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = v4;
    if (v4 < (uint64_t)-[NSMutableArray count](self->_cells, "count"))
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", v5));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));
      -[DayNavigationWeekScrollView setSelectedDate:animated:](self, "setSelectedDate:animated:", v6, 1);

    }
  }
}

- (BOOL)canAnimateToDate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  BOOL v17;

  v4 = a3;
  v5 = -[DayNavigationWeekScrollView _firstVisibleIndex](self, "_firstVisibleIndex");
  v6 = -[DayNavigationWeekScrollView _lastVisibleIndex](self, "_lastVisibleIndex");
  if (v5 < 0 || v5 >= (uint64_t)-[NSMutableArray count](self->_cells, "count"))
  {
    v7 = 0;
    if (v6 < 0)
    {
LABEL_8:
      v8 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", v5));
    if (v6 < 0)
      goto LABEL_8;
  }
  if (v6 >= (uint64_t)-[NSMutableArray count](self->_cells, "count"))
    goto LABEL_8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", v6));
LABEL_9:
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "date"));
  v11 = (void *)v10;
  if (!v9 || v10)
  {
    if (v9 || !v10)
      goto LABEL_16;
    v12 = objc_alloc_init((Class)NSDateComponents);
    objc_msgSend(v12, "setDay:", 1 - self->_weekLength);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateByAddingComponents:toDate:options:](self->_calendar, "dateByAddingComponents:toDate:options:", v12, v11, 0));
  }
  else
  {
    v12 = objc_alloc_init((Class)NSDateComponents);
    objc_msgSend(v12, "setDay:", self->_weekLength - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateByAddingComponents:toDate:options:](self->_calendar, "dateByAddingComponents:toDate:options:", v12, v9, 0));
  }

LABEL_16:
  v17 = 0;
  if (v9 && v11)
  {
    if (objc_msgSend(v9, "compare:", v4) != (id)1 && objc_msgSend(v11, "compare:", v4) != (id)-1
      || (objc_msgSend(v4, "compare:", v9) == (id)-1 ? (v13 = v4, v14 = v9) : (v13 = v11, v14 = v4),
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v13, v14, 0)), v16 = objc_msgSend(v15, "day"), v15, (uint64_t)v16 <= self->_weekLength))
    {
      v17 = 1;
    }
  }

  return v17;
}

- (void)significantTimeChangeOccurred
{
  uint64_t v3;
  void *v4;
  NSCalendar *v5;
  void *v6;
  NSDate *v7;
  NSDate **p_today;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = CUIKTodayDate(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = self->_calendar;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v5, "components:fromDate:", 30, v4));
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v5, "dateFromComponents:", v6));

  p_today = &self->_today;
  if (self->_today != v7)
  {
    objc_storeStrong((id *)&self->_today, v7);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = self->_cells;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "date", (_QWORD)v16));
          objc_msgSend(v14, "setIsToday:", objc_msgSend(v15, "isEqualToDate:", *p_today));

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
}

- (void)contentSizeCategoryChanged
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView _weekStartForDate:](self, "_weekStartForDate:", self->_selectedDate));
  -[DayNavigationWeekScrollView _createSubviewsWithFirstVisibleDate:](self, "_createSubviewsWithFirstVisibleDate:", v3);

}

- (id)selectedDateAfterScrollingToPoint:(CGPoint)a3
{
  double x;
  double weekLength;
  double v6;
  double v7;
  int64_t selectedIndex;
  void *v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v17;
  unint64_t v18;
  unint64_t v19;
  int IsLeftToRight;
  uint64_t v21;
  uint64_t v22;
  NSDate *v23;
  NSDate *v24;
  CGRect v26;

  x = a3.x;
  weekLength = (double)self->_weekLength;
  -[DayNavigationWeekScrollView cellSize](self, "cellSize");
  v7 = v6 * weekLength;
  selectedIndex = self->_selectedIndex;
  if (selectedIndex < 0 || selectedIndex >= (uint64_t)-[NSMutableArray count](self->_cells, "count"))
    v9 = 0;
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:", self->_selectedIndex));
  objc_msgSend(v9, "frame");
  v11 = v10;
  objc_msgSend(v9, "bounds");
  v12 = -[DayNavigationWeekScrollView _alignXToPage:](self, "_alignXToPage:", v11 + CGRectGetWidth(v26) * 0.5);
  v15 = v7 + v14 + -0.0001;
  if (x >= v14 + -0.0001 && x < v15)
  {
    v23 = self->_selectedDate;
  }
  else
  {
    if (x >= v15)
      v14 = v7 + v14;
    v17 = x - v14;
    if (v17 < 0.0)
      v17 = -v17;
    v18 = llround(v17 / v7);
    if (x < v15)
      v19 = v18;
    else
      v19 = v18 + 1;
    IsLeftToRight = CalTimeDirectionIsLeftToRight(v12, v13);
    v21 = 1;
    if (!IsLeftToRight)
      v21 = -1;
    v22 = -1;
    if (!IsLeftToRight)
      v22 = 1;
    if (x < v15)
      v21 = v22;
    v23 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateByAddingUnit:value:toDate:options:](self->_calendar, "dateByAddingUnit:value:toDate:options:", 0x2000, v19 * v21, self->_selectedDate, 0));
  }
  v24 = v23;

  return v24;
}

- (int64_t)_cellIndexForX:(double)a3
{
  double cellWidth;
  NSObject *v5;
  uint8_t v6[16];

  cellWidth = self->_cellWidth;
  if (cellWidth != 0.0)
    return vcvtmd_s64_f64((a3 - self->_firstCellX) / cellWidth);
  v5 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView _cellIndexForX: _cellWidth was 0 in division.", v6, 2u);
  }
  return 0;
}

- (void)sizeToFit
{
  double cellWidth;

  -[DayNavigationWeekScrollView _updateCellWidthIfNeeded](self, "_updateCellWidthIfNeeded");
  cellWidth = self->_cellWidth;
  self->_pageAlignment = cellWidth * (double)((2 * -[DayNavigationWeekScrollView sideViews](self, "sideViews")) | 1);
  -[DayNavigationWeekScrollView bounds](self, "bounds");
  -[DayNavigationWeekScrollView setBounds:](self, "setBounds:");
}

- (void)setEventSpringLoadingEnabled:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_eventSpringLoadingEnabled != a3)
  {
    self->_eventSpringLoadingEnabled = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:", -[DayNavigationWeekScrollView _firstVisibleIndex](self, "_firstVisibleIndex")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "date"));
    -[DayNavigationWeekScrollView _createSubviewsWithFirstVisibleDate:](self, "_createSubviewsWithFirstVisibleDate:", v4);

  }
}

- (int64_t)firstVisibleDayOffsetFromSelectedDay
{
  void *v3;
  int64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView selectedDate](self, "selectedDate"));
  v4 = -[DayNavigationWeekScrollView _indexForDate:](self, "_indexForDate:", v3);

  return -[DayNavigationWeekScrollView _firstVisibleIndexInView](self, "_firstVisibleIndexInView") - v4;
}

- (id)visibleCellDayTypes
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = -[DayNavigationWeekScrollView _firstVisibleIndex](self, "_firstVisibleIndex");
  if (v4 <= -[DayNavigationWeekScrollView _lastVisibleIndex](self, "_lastVisibleIndex"))
  {
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:", v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "badgeType")));
      objc_msgSend(v3, "addObject:", v6);

    }
    while (v4++ < -[DayNavigationWeekScrollView _lastVisibleIndex](self, "_lastVisibleIndex"));
  }
  return v3;
}

- (id)visibleCellBadgeColors
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = -[DayNavigationWeekScrollView _firstVisibleIndex](self, "_firstVisibleIndex");
  if (v4 <= -[DayNavigationWeekScrollView _lastVisibleIndex](self, "_lastVisibleIndex"))
  {
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:", v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "badgeColor"));
      if (v6)
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "badgeColor"));
      else
        v7 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v8 = (void *)v7;
      objc_msgSend(v3, "addObject:", v7);

    }
    while (v4++ < -[DayNavigationWeekScrollView _lastVisibleIndex](self, "_lastVisibleIndex"));
  }
  return v3;
}

- (id)visibleCellBadgeLocales
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localeIdentifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = -[DayNavigationWeekScrollView _firstVisibleIndex](self, "_firstVisibleIndex");
  if (v6 <= -[DayNavigationWeekScrollView _lastVisibleIndex](self, "_lastVisibleIndex"))
  {
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "badgeLocale"));
      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "badgeLocale"));
        objc_msgSend(v5, "addObject:", v9);

      }
      else
      {
        objc_msgSend(v5, "addObject:", v4);
      }

    }
    while (v6++ < -[DayNavigationWeekScrollView _lastVisibleIndex](self, "_lastVisibleIndex"));
  }

  return v5;
}

- (void)willTransitionToSize
{
  self->_rotatedDuringAnimation = 1;
}

- (void)_didFinishDecelerating
{
  if (self->_decelerationWasLastInput || self->_rotatedDuringAnimation)
    -[DayNavigationWeekScrollView didFinishScrolling](self, "didFinishScrolling");
}

- (void)willBeginDragging
{
  self->_isScrolling = 1;
  -[DayNavigationWeekScrollView _setOffscreenCellsHidden:animated:](self, "_setOffscreenCellsHidden:animated:", 0, 1);
}

- (void)willEndDraggingTargetX:(double)a3
{
  self->_targetX = a3;
  -[DayNavigationWeekScrollView _setOffscreenCellsHidden:animated:](self, "_setOffscreenCellsHidden:animated:", 1, 1);
}

- (void)didFinishScrolling
{
  int64_t weekLength;
  int64_t selectedIndex;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  self->_isScrolling = 0;
  -[DayNavigationWeekScrollView _adjustContentOffsetIfNeeded](self, "_adjustContentOffsetIfNeeded");
  weekLength = self->_weekLength;
  if (weekLength >= 1)
  {
    selectedIndex = self->_selectedIndex;
    v5 = selectedIndex + weekLength;
    v6 = selectedIndex - weekLength;
    do
    {
      v7 = v5;
      v8 = -[DayNavigationWeekScrollView _firstVisibleIndex](self, "_firstVisibleIndex");
      v5 = v7 + weekLength;
      v6 += weekLength;
    }
    while (v6 < v8);
    do
      v7 -= weekLength;
    while (v7 > -[DayNavigationWeekScrollView _lastVisibleIndex](self, "_lastVisibleIndex"));
    if ((v7 & 0x8000000000000000) == 0
      && self->_selectedIndex != v7
      && v7 < (uint64_t)-[NSMutableArray count](self->_cells, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
      -[DayNavigationWeekScrollView setSelectedDate:animated:](self, "setSelectedDate:animated:", v10, 1);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView navDelegate](self, "navDelegate"));
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView navDelegate](self, "navDelegate"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
        objc_msgSend(v12, "dayNavigationWeekScrollView:selectedDateChanged:", self, v13);

      }
    }
    -[DayNavigationWeekScrollView _setOffscreenCellsHidden:animated:](self, "_setOffscreenCellsHidden:animated:", 1, 1);
  }
}

- (void)_addNewCellToSide:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *cells;
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
  uint64_t v16;
  char *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t IsLeftToRight;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSMutableArray *v39;
  int64_t selectedIndex;
  _BOOL4 v41;
  id v42;

  v3 = a3;
  cells = self->_cells;
  if (a3)
  {
    v42 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](cells, "objectAtIndex:", 0));
    objc_msgSend(v42, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v42, "frame");
    v15 = v7 - v14;
    v16 = -[DayNavigationWeekScrollView _loadedBufferViewsRight](self, "_loadedBufferViewsRight");
    v17 = (char *)-[NSMutableArray count](self->_cells, "count") - 1;
  }
  else
  {
    v42 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](cells, "lastObject"));
    objc_msgSend(v42, "frame");
    v19 = v18;
    v9 = v20;
    v11 = v21;
    v13 = v22;
    objc_msgSend(v42, "frame");
    v15 = v19 + v23;
    v16 = -[DayNavigationWeekScrollView _loadedBufferViewsLeft](self, "_loadedBufferViewsLeft");
    v17 = 0;
  }
  v24 = objc_alloc_init((Class)NSDateComponents);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "date"));
  objc_msgSend(v24, "setHour:", 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateByAddingComponents:toDate:options:](self->_calendar, "dateByAddingComponents:toDate:options:", v24, v25, 0));

  IsLeftToRight = CalTimeDirectionIsLeftToRight(v27, v28);
  v41 = v3;
  if (!(_DWORD)IsLeftToRight || v3)
  {
    if ((v3 & ~CalTimeDirectionIsLeftToRight(IsLeftToRight, v30)) != 0)
      v31 = 1;
    else
      v31 = -1;
  }
  else
  {
    v31 = 1;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar timeZone](self->_calendar, "timeZone"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v26, v32));

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "calendarDateByAddingDays:", v31));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "calendarDateForDay"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "date"));
  if (v16 < -[DayNavigationWeekScrollView maxBufferViews](self, "maxBufferViews")
    || (char *)self->_selectedIndex == v17)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationViewCellFactory createCellWithFrame:](self->_cellFactory, "createCellWithFrame:", v15, v9, v11, v13));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView backgroundColor](self, "backgroundColor"));
    objc_msgSend(v37, "setBackgroundColor:", v38);

    objc_msgSend(v37, "setDelegate:", self);
    -[DayNavigationWeekScrollView addSubview:](self, "addSubview:", v37);
  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", v17));
    -[NSMutableArray removeObjectAtIndex:](self->_cells, "removeObjectAtIndex:", v17);
    objc_msgSend(v37, "prepareForReuse");
    objc_msgSend(v37, "setFrame:", v15, v9, v11, v13);
    selectedIndex = self->_selectedIndex;
    if (selectedIndex > (uint64_t)v17)
      self->_selectedIndex = selectedIndex - 1;
  }
  -[DayNavigationWeekScrollView _setCell:toDate:](self, "_setCell:toDate:", v37, v36);
  v39 = self->_cells;
  if (v41)
  {
    -[NSMutableArray insertObject:atIndex:](v39, "insertObject:atIndex:", v37, 0);
    ++self->_selectedIndex;
  }
  else
  {
    -[NSMutableArray addObject:](v39, "addObject:", v37);
  }

}

- (void)setToday:(id)a3
{
  NSCalendar *v5;
  void *v6;
  NSDate *v7;
  NSDate *today;
  NSDate *v9;

  v5 = self->_calendar;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v5, "components:fromDate:", 30, a3));
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v5, "dateFromComponents:", v6));
  today = self->_today;
  self->_today = v7;
  v9 = v7;

}

- (double)_offsetAllViews:(double)a3
{
  double cellWidth;
  double v6;
  NSObject *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];

  cellWidth = self->_cellWidth;
  if (cellWidth == 0.0)
  {
    v7 = kCalUILogHandle;
    v6 = 0.0;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView _offsetAllViews: _cellWidth was 0 in division.", buf, 2u);
    }
  }
  else
  {
    v6 = cellWidth * round(a3 / cellWidth);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_cells;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "frame", (_QWORD)v16);
        objc_msgSend(v13, "setFrame:", v6 + v14);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v10);
  }

  return v6 - a3;
}

- (int64_t)_firstVisibleIndexInView
{
  double cellWidth;
  double v4;
  double v5;
  int64_t v6;
  double v7;
  NSObject *v8;
  uint8_t v10[16];

  cellWidth = self->_cellWidth;
  if (cellWidth <= 0.0)
  {
    v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "DayNavigationWeekScrollView _firstVisibleIndexInView: _cellWidth was 0 in division.", v10, 2u);
    }
    return 0;
  }
  v4 = cellWidth + self->_firstCellX + -0.5;
  -[DayNavigationWeekScrollView contentOffset](self, "contentOffset");
  if (v4 >= v5)
    return 0;
  v6 = 0;
  do
  {
    v4 = v4 + self->_cellWidth;
    ++v6;
    -[DayNavigationWeekScrollView contentOffset](self, "contentOffset");
  }
  while (v4 < v7);
  return v6;
}

- (void)dayNavigationCellTouchUpOccurred:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView navDelegate](self, "navDelegate"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView navDelegate](self, "navDelegate"));
    v7 = objc_msgSend(v6, "dayNavigationWeekScrollViewAllowedToChangeSelectedDate");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
      -[DayNavigationWeekScrollView setSelectedDate:animated:](self, "setSelectedDate:animated:", v8, 1);

      CalAnalyticsSendEventLazy(CFSTR("UserNavigated"), &stru_1001B5330);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView navDelegate](self, "navDelegate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
      objc_msgSend(v9, "dayNavigationWeekScrollView:selectedDateChanged:", self, v10);

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView navDelegate](self, "navDelegate"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000E643C;
      v12[3] = &unk_1001B26A0;
      v12[4] = self;
      v13 = v4;
      objc_msgSend(v11, "dayNavigationWeekScrollViewFailedToSelectDate:", v12);

    }
  }

}

- (BOOL)dayNavigationCellShouldEnableSpringLoading
{
  return -[DayNavigationWeekScrollView eventSpringLoadingEnabled](self, "eventSpringLoadingEnabled");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  BOOL v9;
  void *v10;
  objc_super v12;
  objc_super v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView navDelegate](self, "navDelegate"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView navDelegate](self, "navDelegate")),
        v8 = objc_msgSend(v7, "dayNavigationWeekScrollViewAllowedToChangeSelectedDate"),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DayNavigationWeekScrollView navDelegate](self, "navDelegate"));
    objc_msgSend(v10, "dayNavigationWeekScrollViewFailedToSelectDate:", 0);

    v9 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)DayNavigationWeekScrollView;
    if (-[DayNavigationWeekScrollView respondsToSelector:](&v13, "respondsToSelector:", "gestureRecognizerShouldBegin:"))
    {
      v12.receiver = self;
      v12.super_class = (Class)DayNavigationWeekScrollView;
      v9 = -[DayNavigationWeekScrollView gestureRecognizerShouldBegin:](&v12, "gestureRecognizerShouldBegin:", v4);
    }
    else
    {
      v9 = 1;
    }
  }

  return v9;
}

- (BOOL)eventSpringLoadingEnabled
{
  return self->_eventSpringLoadingEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navDelegate);
  objc_storeStrong((id *)&self->_selectedDate, 0);
  objc_storeStrong((id *)&self->_today, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_cellFactory, 0);
}

@end
