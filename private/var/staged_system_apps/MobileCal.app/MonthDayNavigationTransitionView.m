@implementation MonthDayNavigationTransitionView

- (MonthDayNavigationTransitionView)initWithFrame:(CGRect)a3
{
  MonthDayNavigationTransitionView *v3;
  MonthDayNavigationTransitionView *v4;
  TopLineView *v5;
  TopLineView *topLine;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MonthDayNavigationTransitionView;
  v3 = -[MonthDayNavigationTransitionView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MonthDayNavigationTransitionView setSelectedIndex:](v3, "setSelectedIndex:", -1);
    -[MonthDayNavigationTransitionView setTodayIndex:](v4, "setTodayIndex:", -1);
    -[MonthDayNavigationTransitionView setMonthBreakIndex:](v4, "setMonthBreakIndex:", -1);
    v5 = objc_alloc_init(TopLineView);
    topLine = v4->_topLine;
    v4->_topLine = v5;

    -[MonthDayNavigationTransitionView addSubview:](v4, "addSubview:", v4->_topLine);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MonthDayNavigationTransitionView setBackgroundColor:](v4, "setBackgroundColor:", v7);

  }
  return v4;
}

- (void)setStrings:(id)a3 overlayStrings:(id)a4 weekNumberString:(id)a5 todayInWeek:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  NSMutableArray *v12;
  NSMutableArray *cells;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CompactDayNavigationViewCell *v20;
  void *v21;
  void *v22;
  void *v23;
  UILabel *v24;
  UILabel *weekNumberLabel;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double Width;
  double v33;
  double v34;
  _BOOL4 v35;
  id v36;
  CGRect v37;
  CGRect v38;

  v35 = a6;
  v36 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "count");
  self->_hasOverlay = v11 == objc_msgSend(v36, "count");
  v12 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 7);
  cells = self->_cells;
  self->_cells = v12;

  if (objc_msgSend(v36, "count"))
  {
    v14 = 0;
    do
    {
      -[MonthDayNavigationTransitionView dayCellSize](self, "dayCellSize");
      v16 = v15;
      v18 = v17;
      -[MonthDayNavigationTransitionView dayCellSize](self, "dayCellSize");
      v20 = -[CompactDayNavigationViewCell initWithFrame:loadMonthAnimationState:hasOverlay:sizeClass:]([CompactDayNavigationViewCell alloc], "initWithFrame:loadMonthAnimationState:hasOverlay:sizeClass:", 1, self->_hasOverlay, 1, v19 * (double)v14, 0.0, v16, v18);
      -[CompactDayNavigationViewCell setMatchesMonthView:](v20, "setMatchesMonthView:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[CompactDayNavigationViewCell setBackgroundColor:](v20, "setBackgroundColor:", v21);

      -[MonthDayNavigationTransitionView addSubview:](self, "addSubview:", v20);
      -[NSMutableArray addObject:](self->_cells, "addObject:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndex:", v14));
      -[CompactDayNavigationViewCell setDisplayedString:](v20, "setDisplayedString:", v22);

      if (self->_hasOverlay)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v14));
        -[CompactDayNavigationViewCell setOverlayString:](v20, "setOverlayString:", v23);

      }
      ++v14;
    }
    while (v14 < (unint64_t)objc_msgSend(v36, "count"));
  }
  self->_showWeekNumber = v10 != 0;
  if (v10)
  {
    v24 = objc_opt_new(UILabel);
    weekNumberLabel = self->_weekNumberLabel;
    self->_weekNumberLabel = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CompactMonthWeekView weekNumberFont](CompactMonthWeekView, "weekNumberFont"));
    -[UILabel setFont:](self->_weekNumberLabel, "setFont:", v26);

    -[UILabel setText:](self->_weekNumberLabel, "setText:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CompactMonthWeekView weekNumberColorForThisWeek:](CompactMonthWeekView, "weekNumberColorForThisWeek:", v35));
    -[UILabel setTextColor:](self->_weekNumberLabel, "setTextColor:", v27);

    -[MonthDayNavigationTransitionView addSubview:](self, "addSubview:", self->_weekNumberLabel);
  }
  -[MonthDayNavigationTransitionView frame](self, "frame");
  v29 = v28;
  v31 = v30;
  -[MonthDayNavigationTransitionView dayFrame](self, "dayFrame");
  Width = CGRectGetWidth(v37);
  -[MonthDayNavigationTransitionView monthFrame](self, "monthFrame");
  v33 = CGRectGetWidth(v38);
  if (Width < v33)
    Width = v33;
  -[MonthDayNavigationTransitionView dayCellSize](self, "dayCellSize");
  -[MonthDayNavigationTransitionView setFrame:](self, "setFrame:", v29, v31, Width, v34);

}

- (void)setUnderlineThickness:(double)a3 forOverlayStringAtIndex:(int64_t)a4
{
  id v7;

  if ((a4 & 0x8000000000000000) == 0 && (uint64_t)-[NSMutableArray count](self->_cells, "count") > a4)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:", a4));
    objc_msgSend(v7, "setUnderlineThickness:", a3);

  }
}

- (void)setDayTypes:(id)a3 badgeColors:(id)a4 badgeLocales:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v19, "count");
  if (v10 == -[NSMutableArray count](self->_cells, "count"))
  {
    v11 = objc_msgSend(v8, "count");
    if (v11 == -[NSMutableArray count](self->_cells, "count"))
    {
      v12 = objc_msgSend(v9, "count");
      if (v12 == -[NSMutableArray count](self->_cells, "count")
        && (uint64_t)-[NSMutableArray count](self->_cells, "count") >= 1)
      {
        v13 = 0;
        do
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v13));
          v15 = objc_msgSend(v14, "integerValue");

          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:", v13));
          objc_msgSend(v16, "setBadgeType:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v13));
          objc_msgSend(v16, "setBadgeColor:", v17);

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v13));
          objc_msgSend(v16, "setBadgeLocale:", v18);

          ++v13;
        }
        while (v13 < (uint64_t)-[NSMutableArray count](self->_cells, "count"));
      }
    }
  }

}

- (void)setVerticallyCompressedState:(BOOL)a3
{
  _BOOL8 v3;
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

  v3 = a3;
  self->_verticallyCompressedState = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "setVerticallyCompressedState:", v3, (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)completeSetup
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

  -[MonthDayNavigationTransitionView _updateWeekendIndices](self, "_updateWeekendIndices");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_cells;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "layoutIfNeeded", (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)setWeekendIndices:(id)a3
{
  objc_storeStrong((id *)&self->_weekendIndices, a3);
}

- (void)_updateWeekendIndices
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = self->_cells;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v7), "setIsWeekend:", 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView weekendIndices](self, "weekendIndices"));
  if (v8)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView weekendIndices](self, "weekendIndices", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = (uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13), "integerValue");
          if ((v14 & 0x8000000000000000) == 0)
          {
            v15 = v14;
            if (v14 < (uint64_t)-[NSMutableArray count](self->_cells, "count"))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", v15));
              objc_msgSend(v16, "setIsWeekend:", 1);

            }
          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v11);
    }

  }
}

- (void)animateToDayLayout
{
  -[MonthDayNavigationTransitionView _setToMonthStateAnimated:](self, "_setToMonthStateAnimated:", 0);
  -[MonthDayNavigationTransitionView _setToDayStateAnimated:](self, "_setToDayStateAnimated:", 1);
}

- (void)animateToMonthLayout
{
  -[MonthDayNavigationTransitionView _setToDayStateAnimated:](self, "_setToDayStateAnimated:", 0);
  -[MonthDayNavigationTransitionView _setToMonthStateAnimated:](self, "_setToMonthStateAnimated:", 1);
}

- (void)_setToDayStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[9];
  _QWORD v40[5];
  BOOL v41;
  _QWORD v42[5];
  BOOL v43;
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthOccurrencesSnapshot](self, "monthOccurrencesSnapshot"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthOccurrencesSnapshot](self, "monthOccurrencesSnapshot"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));

    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthOccurrencesSnapshot](self, "monthOccurrencesSnapshot"));
      -[MonthDayNavigationTransitionView addSubview:](self, "addSubview:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthOccurrencesSnapshot](self, "monthOccurrencesSnapshot"));
    -[MonthDayNavigationTransitionView bringSubviewToFront:](self, "bringSubviewToFront:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthSummarySnapshots](self, "monthSummarySnapshots"));
  if (!objc_msgSend(v10, "count"))
    goto LABEL_16;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthSummarySnapshots](self, "monthSummarySnapshots"));
  v12 = objc_msgSend(v11, "count");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthSummaryFrames](self, "monthSummaryFrames"));
  v14 = objc_msgSend(v13, "count");

  if (v12 == v14)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthSummarySnapshots](self, "monthSummarySnapshots"));
    v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v17)
            objc_enumerationMutation(v10);
          v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "superview"));

          if (!v20)
            -[MonthDayNavigationTransitionView addSubview:](self, "addSubview:", v19);
          -[MonthDayNavigationTransitionView bringSubviewToFront:](self, "bringSubviewToFront:", v19);
        }
        v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v16);
    }
LABEL_16:

  }
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000D6D10;
  v44[3] = &unk_1001B2538;
  v44[4] = self;
  v21 = objc_retainBlock(v44);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView _todayCell](self, "_todayCell"));
  objc_msgSend(v22, "setIsToday:", 1);

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000D724C;
  v42[3] = &unk_1001B2510;
  v42[4] = self;
  v43 = v3;
  v23 = animateNavigationPreferringFRR(v42);
  if (self->_selectedIndex != self->_todayIndex)
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000D72B0;
    v40[3] = &unk_1001B2510;
    v40[4] = self;
    v41 = v3;
    v23 = animateNavigationPreferringFRR(v40);
    if (!v3)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView _selectedCell](self, "_selectedCell"));
      objc_msgSend(v24, "layoutIfNeeded");

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView _todayCell](self, "_todayCell"));
      objc_msgSend(v25, "layoutIfNeeded");

    }
  }
  if (v3)
  {
    v26 = springAnimationDuration(v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
    v28 = navigationAnimationsPreferringFRR(v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v27, v29, 0, v26, 0.0);

    v30 = -[MonthDayNavigationTransitionView dayFrame](self, "dayFrame");
    v32 = v31;
    v34 = v33;
    v35 = springAnimationDuration(v30);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000D72F4;
    v39[3] = &unk_1001B27C0;
    v39[5] = 0;
    v39[6] = 0;
    v39[4] = self;
    v39[7] = v32;
    v39[8] = v34;
    v37 = navigationAnimationsPreferringFRR(v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v36, v38, 0, v35, 0.0);

    -[MonthDayNavigationTransitionView dayFrame](self, "dayFrame");
    -[MonthDayNavigationTransitionView _animateView:toPosition:](self, "_animateView:toPosition:", self);
  }
  else
  {
    ((void (*)(_QWORD *))v21[2])(v21);
    -[MonthDayNavigationTransitionView dayFrame](self, "dayFrame");
    -[MonthDayNavigationTransitionView setFrame:](self, "setFrame:");
  }

}

- (double)_yOffsetForMonthCells:(BOOL)a3
{
  __n128 v3;
  double result;

  v3.n128_u64[0] = 0.5;
  if (a3)
    v3.n128_f64[0] = 0.0;
  if (self->_hasOverlay)
    v3.n128_f64[0] = v3.n128_f64[0] + 6.0;
  CalFloorToScreenScale(v3);
  return result;
}

- (void)_setToMonthStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  _QWORD *v21;
  unsigned int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void (**v26)(void);
  uint64_t v27;
  uint64_t v28;
  void (**v29)(void);
  void *v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[5];
  CGPoint origin;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[5];
  BOOL v49;
  _QWORD v50[5];
  BOOL v51;
  _QWORD v52[5];
  BOOL v53;
  _QWORD v54[5];
  BOOL v55;
  _QWORD v56[5];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthOccurrencesSnapshot](self, "monthOccurrencesSnapshot"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthOccurrencesSnapshot](self, "monthOccurrencesSnapshot"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));

    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthOccurrencesSnapshot](self, "monthOccurrencesSnapshot"));
      -[MonthDayNavigationTransitionView addSubview:](self, "addSubview:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthOccurrencesSnapshot](self, "monthOccurrencesSnapshot"));
    -[MonthDayNavigationTransitionView bringSubviewToFront:](self, "bringSubviewToFront:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthSummarySnapshots](self, "monthSummarySnapshots"));
  if (objc_msgSend(v10, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthSummarySnapshots](self, "monthSummarySnapshots"));
    v12 = objc_msgSend(v11, "count");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthSummaryFrames](self, "monthSummaryFrames"));
    v14 = objc_msgSend(v13, "count");

    if (v12 != v14)
      goto LABEL_17;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView monthSummarySnapshots](self, "monthSummarySnapshots"));
    v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v58 != v17)
            objc_enumerationMutation(v10);
          v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "superview"));

          if (!v20)
            -[MonthDayNavigationTransitionView addSubview:](self, "addSubview:", v19);
          -[MonthDayNavigationTransitionView bringSubviewToFront:](self, "bringSubviewToFront:", v19);
        }
        v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      }
      while (v16);
    }
  }

LABEL_17:
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1000D7838;
  v56[3] = &unk_1001B2538;
  v56[4] = self;
  v21 = objc_retainBlock(v56);
  v22 = -[MonthDayNavigationTransitionView verticallyCompressedState](self, "verticallyCompressedState");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView _todayCell](self, "_todayCell"));
  objc_msgSend(v23, "setIsToday:", 1);

  if (v22)
  {
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_1000D80F0;
    v54[3] = &unk_1001B2510;
    v54[4] = self;
    v55 = v3;
    v24 = animateNavigationPreferringFRR(v54);
    if (self->_selectedIndex == self->_todayIndex)
      goto LABEL_25;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1000D8154;
    v52[3] = &unk_1001B2510;
    v52[4] = self;
    v53 = v3;
    v24 = animateNavigationPreferringFRR(v52);
    if (v3)
      goto LABEL_25;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView _selectedCell](self, "_selectedCell"));
    objc_msgSend(v25, "layoutIfNeeded");

    v26 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView _todayCell](self, "_todayCell"));
    objc_msgSend(v26, "layoutIfNeeded");
  }
  else
  {
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000D8198;
    v50[3] = &unk_1001B2510;
    v50[4] = self;
    v51 = v3;
    v27 = navigationAnimationsPreferringFRR(v50);
    v26 = (void (**)(void))objc_claimAutoreleasedReturnValue(v27);
    v26[2]();
    if (self->_todayIndex != self->_selectedIndex)
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1000D81DC;
      v48[3] = &unk_1001B2510;
      v48[4] = self;
      v49 = v3;
      v28 = navigationAnimationsPreferringFRR(v48);
      v29 = (void (**)(void))objc_claimAutoreleasedReturnValue(v28);
      v29[2]();

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MonthDayNavigationTransitionView _todayCell](self, "_todayCell"));
    objc_msgSend(v30, "layoutBelowIfNeeded");

  }
LABEL_25:
  if (v3)
  {
    v31 = springAnimationDuration(v24);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
    v33 = navigationAnimationsPreferringFRR(v21);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v32, v34, 0, v31, 0.0);

    v35 = -[MonthDayNavigationTransitionView monthFrame](self, "monthFrame");
    v37 = v36;
    v39 = v38;
    v40 = springAnimationDuration(v35);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000D8224;
    v44[3] = &unk_1001B27C0;
    v44[4] = self;
    origin = CGRectZero.origin;
    v46 = v37;
    v47 = v39;
    v42 = navigationAnimationsPreferringFRR(v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v41, v43, 0, v40, 0.0);

    -[MonthDayNavigationTransitionView monthFrame](self, "monthFrame");
    -[MonthDayNavigationTransitionView _animateView:toPosition:](self, "_animateView:toPosition:", self);
  }
  else
  {
    ((void (*)(_QWORD *))v21[2])(v21);
    -[MonthDayNavigationTransitionView monthFrame](self, "monthFrame");
    -[MonthDayNavigationTransitionView setFrame:](self, "setFrame:");
  }

}

- (id)_selectedCell
{
  uint64_t v3;
  void *v4;

  if (-[MonthDayNavigationTransitionView selectedIndex](self, "selectedIndex") < 0
    || (v3 = -[MonthDayNavigationTransitionView selectedIndex](self, "selectedIndex"),
        v3 >= (uint64_t)-[NSMutableArray count](self->_cells, "count")))
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", -[MonthDayNavigationTransitionView selectedIndex](self, "selectedIndex")));
  }
  return v4;
}

- (id)_todayCell
{
  uint64_t v3;
  void *v4;

  if (-[MonthDayNavigationTransitionView todayIndex](self, "todayIndex") < 0
    || (v3 = -[MonthDayNavigationTransitionView todayIndex](self, "todayIndex"),
        v3 >= (uint64_t)-[NSMutableArray count](self->_cells, "count")))
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", -[MonthDayNavigationTransitionView todayIndex](self, "todayIndex")));
  }
  return v4;
}

- (void)_animateView:(id)a3 toPosition:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  CGFloat v14;
  CGFloat v15;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  v7 = springAnimationDuration(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D8408;
  v12[3] = &unk_1001B2810;
  v13 = v6;
  v14 = x;
  v15 = y;
  v9 = v6;
  v10 = navigationAnimationsPreferringFRR(v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v8, v11, 0, v7, 0.0);

}

- (BOOL)verticallyCompressedState
{
  return self->_verticallyCompressedState;
}

- (NSArray)weekendIndices
{
  return self->_weekendIndices;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (int64_t)todayIndex
{
  return self->_todayIndex;
}

- (void)setTodayIndex:(int64_t)a3
{
  self->_todayIndex = a3;
}

- (CGRect)dayFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_dayFrame.origin.x;
  y = self->_dayFrame.origin.y;
  width = self->_dayFrame.size.width;
  height = self->_dayFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDayFrame:(CGRect)a3
{
  self->_dayFrame = a3;
}

- (double)firstDayCellInset
{
  return self->_firstDayCellInset;
}

- (void)setFirstDayCellInset:(double)a3
{
  self->_firstDayCellInset = a3;
}

- (int64_t)firstDayCellIndex
{
  return self->_firstDayCellIndex;
}

- (void)setFirstDayCellIndex:(int64_t)a3
{
  self->_firstDayCellIndex = a3;
}

- (CGSize)dayCellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_dayCellSize.width;
  height = self->_dayCellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDayCellSize:(CGSize)a3
{
  self->_dayCellSize = a3;
}

- (CGRect)monthFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_monthFrame.origin.x;
  y = self->_monthFrame.origin.y;
  width = self->_monthFrame.size.width;
  height = self->_monthFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setMonthFrame:(CGRect)a3
{
  self->_monthFrame = a3;
}

- (double)monthRowHeight
{
  return self->_monthRowHeight;
}

- (void)setMonthRowHeight:(double)a3
{
  self->_monthRowHeight = a3;
}

- (int64_t)firstMonthCellIndex
{
  return self->_firstMonthCellIndex;
}

- (void)setFirstMonthCellIndex:(int64_t)a3
{
  self->_firstMonthCellIndex = a3;
}

- (NSArray)monthCellFrames
{
  return self->_monthCellFrames;
}

- (void)setMonthCellFrames:(id)a3
{
  objc_storeStrong((id *)&self->_monthCellFrames, a3);
}

- (int64_t)monthBreakIndex
{
  return self->_monthBreakIndex;
}

- (void)setMonthBreakIndex:(int64_t)a3
{
  self->_monthBreakIndex = a3;
}

- (UIView)monthOccurrencesSnapshot
{
  return self->_monthOccurrencesSnapshot;
}

- (void)setMonthOccurrencesSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_monthOccurrencesSnapshot, a3);
}

- (CGRect)monthOccurrencesFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_monthOccurrencesFrame.origin.x;
  y = self->_monthOccurrencesFrame.origin.y;
  width = self->_monthOccurrencesFrame.size.width;
  height = self->_monthOccurrencesFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setMonthOccurrencesFrame:(CGRect)a3
{
  self->_monthOccurrencesFrame = a3;
}

- (NSArray)monthSummarySnapshots
{
  return self->_monthSummarySnapshots;
}

- (void)setMonthSummarySnapshots:(id)a3
{
  objc_storeStrong((id *)&self->_monthSummarySnapshots, a3);
}

- (NSArray)monthSummaryFrames
{
  return self->_monthSummaryFrames;
}

- (void)setMonthSummaryFrames:(id)a3
{
  objc_storeStrong((id *)&self->_monthSummaryFrames, a3);
}

- (BOOL)debug
{
  return self->_debug;
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthSummaryFrames, 0);
  objc_storeStrong((id *)&self->_monthSummarySnapshots, 0);
  objc_storeStrong((id *)&self->_monthOccurrencesSnapshot, 0);
  objc_storeStrong((id *)&self->_monthCellFrames, 0);
  objc_storeStrong((id *)&self->_weekendIndices, 0);
  objc_storeStrong((id *)&self->_weekNumberLabel, 0);
  objc_storeStrong((id *)&self->_topLine, 0);
  objc_storeStrong((id *)&self->_cells, 0);
}

@end
