@implementation LargeMonthViewController

- (LargeMonthViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5
{
  id v9;
  id v10;
  id v11;
  LargeMonthViewController *v12;
  LargeMonthViewController *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;
  uint64_t v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)LargeMonthViewController;
  v12 = -[MonthViewController initWithCalendarDate:model:window:](&v20, "initWithCalendarDate:model:window:", v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_initialDate, a3);
    +[MonthViewOccurrence clearCachedFonts](MonthViewOccurrence, "clearCachedFonts");
    +[LargeMonthWeekView clearCachedFonts](LargeMonthWeekView, "clearCachedFonts");
    -[LargeMonthViewController findWeekends](v13, "findWeekends");
    objc_initWeak(&location, v13);
    v21 = objc_opt_class(UITraitUserInterfaceStyle);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100057E14;
    v17[3] = &unk_1001B2418;
    objc_copyWeak(&v18, &location);
    v15 = -[LargeMonthViewController registerForTraitChanges:withHandler:](v13, "registerForTraitChanges:withHandler:", v14, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventEditViewController](self, "shownEventEditViewController"));
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "supportedInterfaceOrientations");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)LargeMonthViewController;
    v5 = -[LargeMonthViewController supportedInterfaceOrientations](&v8, "supportedInterfaceOrientations");
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (void)findWeekends
{
  CUIKGetWeekendDays(self->_weekendOffsets, &self->_weekendOffsets[1]);
}

- (void)loadView
{
  int v3;
  NSArray *v4;
  double y;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *verticalGridLines;
  NSArray *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *weekendDayBackgrounds;
  objc_super v22;
  _QWORD v23[2];

  v22.receiver = self;
  v22.super_class = (Class)LargeMonthViewController;
  -[MonthViewController loadView](&v22, "loadView");
  v3 = 6;
  v4 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 6);
  y = CGPointZero.y;
  do
  {
    v6 = objc_alloc_init((Class)CALayer);
    objc_msgSend(v6, "setAnchorPoint:", CGPointZero.x, y);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[LargeMonthWeekView gridlineColor](LargeMonthWeekView, "gridlineColor")));
    objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
    objc_msgSend(v9, "addSublayer:", v6);

    -[NSArray addObject:](v4, "addObject:", v6);
    --v3;
  }
  while (v3);
  verticalGridLines = self->_verticalGridLines;
  self->_verticalGridLines = v4;
  v11 = v4;

  v12 = objc_alloc_init((Class)CALayer);
  v13 = objc_alloc_init((Class)CALayer);
  objc_msgSend(v12, "setAnchorPoint:", CGPointZero.x, y);
  objc_msgSend(v13, "setAnchorPoint:", CGPointZero.x, y);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[LargeMonthWeekView weekendColor](LargeMonthWeekView, "weekendColor")));
  objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[LargeMonthWeekView weekendColor](LargeMonthWeekView, "weekendColor")));
  objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
  objc_msgSend(v17, "addSublayer:", v12);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
  objc_msgSend(v19, "addSublayer:", v13);

  v23[0] = v12;
  v23[1] = v13;
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
  weekendDayBackgrounds = self->_weekendDayBackgrounds;
  self->_weekendDayBackgrounds = v20;

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  EKCalendarDate *navigationBarDisplayedDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LargeMonthViewController;
  -[MonthViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_displayedOccurrencesChanged:", CUIKCalendarModelDisplayedOccurrencesChangedNotification, self->super.super.super._model);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_selectedOccurrencesChanged:", CUIKCalendarModelSelectedOccurrencesChangedNotification, self->super.super.super._model);
  -[InfiniteScrollViewController reloadDataForAllViews](self, "reloadDataForAllViews");
  navigationBarDisplayedDate = self->_navigationBarDisplayedDate;
  self->_navigationBarDisplayedDate = 0;

  self->_viewIsAppearing = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;

  v12.receiver = self;
  v12.super_class = (Class)LargeMonthViewController;
  -[MonthViewController viewDidAppear:](&v12, "viewDidAppear:", a3);
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2114;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);

  }
  self->_viewIsAppearing = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CUIKCalendarModelDisplayedOccurrencesChangedNotification, self->super.super.super._model);
  objc_msgSend(v5, "removeObserver:name:object:", self, CUIKCalendarModelSelectedOccurrencesChangedNotification, self->super.super.super._model);
  -[LargeMonthViewController setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:](self, "setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventViewController](self, "shownEventViewController"));

  if (v6)
    -[LargeMonthViewController _closeEventPresentationAnimated:](self, "_closeEventPresentationAnimated:", 0);
  self->_viewIsAppearing = 0;
  v7.receiver = self;
  v7.super_class = (Class)LargeMonthViewController;
  -[MonthViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LargeMonthViewController;
  -[LargeMonthViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  self->_viewIsAppearing = 0;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[7];
  _QWORD v10[7];
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  CGPoint v14;
  objc_super v15;
  CGAffineTransform v16;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  self->_shouldForceAllowUpdateNavigationBarDateString = 1;
  if (-[InfiniteScrollViewController viewIsVisible](self, "viewIsVisible") || self->_viewIsAppearing)
  {
    if (v7)
      objc_msgSend(v7, "targetTransform");
    else
      memset(&v16, 0, sizeof(v16));
    self->_animateResize = CGAffineTransformIsIdentity(&v16);
    v15.receiver = self;
    v15.super_class = (Class)LargeMonthViewController;
    -[InfiniteScrollViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController view](self, "view"));
    objc_msgSend(v8, "setNeedsLayout");

    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3010000000;
    v13[3] = &unk_100195B79;
    v14 = CGPointZero;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_100058834;
    v11[4] = sub_100058844;
    v12 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005884C;
    v10[3] = &unk_1001B30A0;
    v10[4] = self;
    v10[5] = v11;
    v10[6] = v13;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100058ABC;
    v9[3] = &unk_1001B30A0;
    v9[4] = self;
    v9[5] = v11;
    v9[6] = v13;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, v9);
    _Block_object_dispose(v11, 8);

    _Block_object_dispose(v13, 8);
  }

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LargeMonthViewController;
  -[InfiniteScrollViewController viewWillLayoutSubviews](&v4, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController _paletteView](self, "_paletteView"));
  -[LargeMonthViewController updatePalette:](self, "updatePalette:", v3);

  if (!self->_animateResize)
    -[LargeMonthViewController _layoutGridlinesAndBackgrounds:](self, "_layoutGridlinesAndBackgrounds:", 0);
}

- (void)_animateGridlinesAndBackgrounds
{
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100058D28;
  v7[3] = &unk_1001B2538;
  v7[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7);
  for (i = 0; i != 6; ++i)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_verticalGridLines, "objectAtIndexedSubscript:", i));
    objc_msgSend(v4, "setHidden:", 1);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_weekendDayBackgrounds, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v5, "setHidden:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_weekendDayBackgrounds, "objectAtIndexedSubscript:", 1));
  objc_msgSend(v6, "setHidden:", 1);

  -[LargeMonthViewController _layoutGridlinesAndBackgrounds:](self, "_layoutGridlinesAndBackgrounds:", 1);
}

- (void)_removeAnimatedGridComponents
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSArray *animatableGridLines;
  NSArray *animatableDayBackgrounds;
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

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_animatableGridLines;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v7), "removeFromSuperview");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_animatableDayBackgrounds;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "removeFromSuperview", (_QWORD)v15);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v10);
  }

  animatableGridLines = self->_animatableGridLines;
  self->_animatableGridLines = 0;

  animatableDayBackgrounds = self->_animatableDayBackgrounds;
  self->_animatableDayBackgrounds = 0;

}

- (void)_cleanupGridAnimation
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  NSArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
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

  -[LargeMonthViewController _removeAnimatedGridComponents](self, "_removeAnimatedGridComponents");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_verticalGridLines;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "setHidden:", 0);
        objc_msgSend(v8, "removeAllAnimations");
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_weekendDayBackgrounds;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v14, "setHidden:", 0, (_QWORD)v15);
        objc_msgSend(v14, "removeAllAnimations");
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }

}

- (void)_layoutGridlinesAndBackgrounds:(BOOL)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t IsLeftToRight;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  v12 = CalRoundToScreenScale(v10, v11, 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController centerViewOnScreen](self, "centerViewOnScreen"));
  v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dayFrames"));

  v16 = 0;
  IsLeftToRight = CalTimeDirectionIsLeftToRight(v14, v15);
  do
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectAtIndexedSubscript:", IsLeftToRight + v16));
    objc_msgSend(v18, "CGRectValue");
    v20 = v19;

    v21 = v20 - v12;
    if (a3)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_animatableGridLines, "objectAtIndexedSubscript:", v16));
      objc_msgSend(v22, "setFrame:", v21, v7, v12, v9);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_verticalGridLines, "objectAtIndexedSubscript:", v16));
    objc_msgSend(v23, "setFrame:", v21, v7, v12, v9);
    objc_msgSend(v23, "removeAllAnimations");

    ++v16;
  }
  while (v16 != 6);
  v25 = self->_weekendOffsets[0];
  v26 = CUIKZeroIndexedWeekStart(v24);
  v27 = (v25 - v26 + 7) % 7;
  v28 = self->_weekendOffsets[1];
  v29 = (v28 - CUIKZeroIndexedWeekStart(v26) + 7) % 7;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectAtIndexedSubscript:", v27));
  objc_msgSend(v30, "CGRectValue");
  v32 = v31;
  v34 = v33;

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectAtIndexedSubscript:", v29));
  objc_msgSend(v35, "CGRectValue");
  v37 = v36;
  v39 = v38;

  if (a3)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_animatableDayBackgrounds, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v40, "setFrame:", v32, v7, v34, v9);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_animatableDayBackgrounds, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v41, "setFrame:", v37, v7, v39, v9);

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_weekendDayBackgrounds, "objectAtIndexedSubscript:", 0));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_weekendDayBackgrounds, "objectAtIndexedSubscript:", 1));
  objc_msgSend(v42, "setFrame:", v32, v7, v34, v9);
  objc_msgSend(v43, "setFrame:", v37, v7, v39, v9);
  objc_msgSend(v42, "removeAllAnimations");
  objc_msgSend(v43, "removeAllAnimations");

}

- (id)_paletteView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController navigationController](self, "navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "paletteView"));

  return v3;
}

- (void)_updateDayHeaderFrames
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController _paletteView](self, "_paletteView"));
  if (v3)
  {
    v16 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", CGPointZero.x, CGPointZero.y));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dayFrames"));
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
    if (objc_msgSend(v5, "count"))
    {
      v7 = 0;
      do
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v7));
        objc_msgSend(v8, "CGRectValue");
        v10 = v9;
        v12 = v11;

        objc_msgSend(v16, "bounds");
        v14 = v13;
        objc_msgSend(v16, "bounds");
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v10, v14, v12));
        objc_msgSend(v6, "addObject:", v15);

        ++v7;
      }
      while (v7 < (unint64_t)objc_msgSend(v5, "count"));
    }
    objc_msgSend(v16, "setDayHeaderFrames:", v6);

    v3 = v16;
  }

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[LargeMonthViewController _presentationControllerDidDismiss](self, "_presentationControllerDidDismiss", a3);
}

- (void)_presentationControllerDidDismiss
{
  void *v3;
  void *v4;
  void *v5;
  EKEvent *eventBeingInspected;
  EKCalendarDate *tappedDay;
  CGSize size;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController draggedOccurrenceView](self, "draggedOccurrenceView"));

  if (v3)
  {
    -[MonthViewController removeDraggingOccurrenceAnimated:](self, "removeDraggingOccurrenceAnimated:", 1);
    -[MonthViewController removeAllWeekHighlights](self, "removeAllWeekHighlights");
  }
  -[MainViewController invalidateManagedNavigationController](self, "invalidateManagedNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent startCalendarDate](self->_eventBeingInspected, "startCalendarDate"));
  v9 = (id)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v4));

  -[LargeMonthViewController selectOccurrence:inWeek:](self, "selectOccurrence:inWeek:", 0, v9);
  self->_currentlyEditingEvent = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v5, "setScrollEnabled:", 1);

  eventBeingInspected = self->_eventBeingInspected;
  self->_eventBeingInspected = 0;

  tappedDay = self->_tappedDay;
  self->_tappedDay = 0;

  size = CGRectNull.size;
  self->_scrubbingRect.origin = CGRectNull.origin;
  self->_scrubbingRect.size = size;
  self->_shouldAnimateScrollToVisibleWeekViewForSelectedOccurrence = 0;
  -[NSMutableArray removeAllObjects](self->_weeksContainingSelectedOccurrences, "removeAllObjects");
  self->_shouldPresentEventCommentsForSelectedOccurrence = 0;
  -[LargeMonthViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");

}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  void *v8;
  EKEvent *eventBeingInspected;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  id v19;
  CGRect v20;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent startCalendarDate](self->_eventBeingInspected, "startCalendarDate", a3));
  v19 = (id)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v8));

  eventBeingInspected = self->_eventBeingInspected;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent startCalendarDate](eventBeingInspected, "startCalendarDate"));
  objc_msgSend(v19, "frameForOccurrence:onDay:", eventBeingInspected, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v20.origin.x = v12;
  v20.origin.y = v14;
  v20.size.width = v16;
  v20.size.height = v18;
  if (!CGRectIsNull(v20))
  {
    *a5 = objc_retainAutorelease(v19);
    a4->origin.x = v12;
    a4->origin.y = v14;
    a4->size.width = v16;
    a4->size.height = v18;
  }
  -[LargeMonthViewController selectOccurrence:inWeek:](self, "selectOccurrence:inWeek:", self->_eventBeingInspected, v19);

}

- (unint64_t)maximumCachedReusableViews
{
  return 12;
}

- (id)_createLargeMonthWeekViewForDate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  id v20;
  void *v21;
  _BYTE *v22;
  _BYTE *v23;
  void *v24;
  _BYTE *v25;
  uint64_t v26;
  double v27;
  id v28;
  double v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  LargeMonthWeekView *v42;
  LargeMonthWeekView *v43;
  id v44;
  LargeMonthViewController *v45;
  id v46;
  uint64_t v47;
  int v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  _BOOL8 v55;
  uint64_t v56;
  void *v57;
  void *v59;
  uint64_t v60;

  v4 = a3;
  v5 = CUIKOneIndexedWeekStart(v4);
  v7 = CUIKTodayDate(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateForWeekWithWeekStart:", v5));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateForEndOfWeekWithWeekStart:", v5));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "calendarDateByAddingWeeks:", 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendarDateByAddingWeeks:", -1));
  v15 = objc_msgSend(v14, "month");
  if (v15 == objc_msgSend(v12, "month") && (v16 = objc_msgSend(v11, "month"), v16 == objc_msgSend(v13, "month")))
  {
    v17 = 0;
    v18 = 0;
    v60 = 2;
    v19 = 7;
  }
  else
  {
    v20 = objc_msgSend(v4, "month");
    if (v20 == objc_msgSend(v14, "month"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "calendarDateForEndOfMonth"));

      v22 = objc_msgSend(v21, "day");
      v23 = objc_msgSend(v11, "day");
      v17 = 0;
      v19 = v22 - v23 + 1;
      v18 = 1;
      v60 = 2;
      v12 = v21;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "calendarDateForMonth"));

      v25 = objc_msgSend(v12, "day");
      v18 = 0;
      v17 = v25 - (_BYTE *)objc_msgSend(v24, "day") - 6;
      v60 = 3;
      v19 = 7;
      v11 = v24;
    }
  }
  v26 = v19 + v17;
  objc_msgSend(v11, "absoluteTime");
  if (v10 >= v27 && (v28 = objc_msgSend(v12, "absoluteTime"), v10 <= v29))
  {
    v31 = CUIKTodayComponents(v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v30 = objc_msgSend(v32, "day");

  }
  else
  {
    v30 = 0;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController view](self, "view"));
  objc_msgSend(v33, "bounds");
  v35 = v34;
  v37 = v36;
  v39 = v38;

  -[LargeMonthViewController _subviewHeightForDate:](self, "_subviewHeightForDate:", v11);
  v41 = v40;
  v42 = (LargeMonthWeekView *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dequeueReusableView](self, "dequeueReusableView"));
  if (v42)
  {
    v43 = v42;
    -[LargeMonthWeekView setFrame:](v42, "setFrame:", v35, v37, v39, v41);
  }
  else
  {
    v43 = -[LargeMonthWeekView initWithFrame:]([LargeMonthWeekView alloc], "initWithFrame:", v35, v37, v39, v41);
    -[LargeMonthWeekView setDataSource:](v43, "setDataSource:", self);
    -[LargeMonthWeekView setDelegate:](v43, "setDelegate:", self);
    v44 = objc_msgSend(objc_alloc((Class)EKUIRightClickEmptySpaceInteraction), "initWithDelegate:", self);
    v59 = v12;
    v45 = self;
    v46 = v30;
    v47 = v26;
    v48 = v18;
    v49 = v4;
    v50 = v14;
    v51 = v13;
    v52 = v44;
    -[LargeMonthWeekView addInteraction:](v43, "addInteraction:", v44);

    v13 = v51;
    v14 = v50;
    v4 = v49;
    v18 = v48;
    v26 = v47;
    v30 = v46;
    self = v45;
    v12 = v59;
  }
  -[LargeMonthWeekView setStartDate:endDate:dayCount:todayDay:reload:](v43, "setStartDate:endDate:dayCount:todayDay:reload:", v11, v12, v26, v30, 0);
  v53 = objc_msgSend(v11, "month");
  if (v53 == -[EKCalendarDate month](self->_navigationBarDisplayedDate, "month"))
  {
    v54 = objc_msgSend(v11, "year");
    v55 = v54 != -[EKCalendarDate year](self->_navigationBarDisplayedDate, "year");
  }
  else
  {
    v55 = 1;
  }
  -[LargeMonthWeekView setShowsFirstDayOfMonthLabel:animated:](v43, "setShowsFirstDayOfMonthLabel:animated:", v55, 0);
  if (v18)
    v56 = v60 | 4;
  else
    v56 = v60;
  -[LargeMonthWeekView setAutoresizingMask:](v43, "setAutoresizingMask:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPreferences sharedPreferences](CUIKPreferences, "sharedPreferences"));
  -[LargeMonthWeekView setShowsWeekNumber:](v43, "setShowsWeekNumber:", objc_msgSend(v57, "showWeekNumbers"));

  return v43;
}

- (id)createInitialViewForDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "calendarDateForWeekWithWeekStart:", CUIKOneIndexedWeekStart(v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController _createLargeMonthWeekViewForDate:](self, "_createLargeMonthWeekViewForDate:", v6));
  objc_msgSend(v7, "reloadData");

  return v7;
}

- (id)newTopViewAboveViewWithCalendarDate:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController calendarDateForSubviewAboveSubviewWithCalendarDate:](self, "calendarDateForSubviewAboveSubviewWithCalendarDate:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController _createLargeMonthWeekViewForDate:](self, "_createLargeMonthWeekViewForDate:", v4));

  return v5;
}

- (id)newBottomViewBelowViewWithCalendarDate:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController calendarDateForSubviewBelowSubviewWithCalendarDate:](self, "calendarDateForSubviewBelowSubviewWithCalendarDate:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController _createLargeMonthWeekViewForDate:](self, "_createLargeMonthWeekViewForDate:", v4));

  return v5;
}

- (double)decelerationDistanceThresholdForPreferringMonthBoundary
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController view](self, "view"));
  v5 = EKUICurrentWindowSize(v4);
  objc_msgSend(v3, "_cellHeightForMultiplier:windowSize:", 3.5, v5, v6);
  v8 = v7;

  return v8;
}

- (double)topInsetForSubviewWithCalendarDate:(id)a3
{
  double result;

  +[LargeMonthWeekView topInset](LargeMonthWeekView, "topInset", a3);
  return result;
}

- (double)subviewBufferExtensionMultiplier
{
  return 0.15;
}

- (void)significantTimeChangeOccurred
{
  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", &stru_1001B30C0);
}

- (void)showDate:(id)a3 animated:(BOOL)a4
{
  -[MonthViewController showDate:animated:toMonthStart:](self, "showDate:animated:toMonthStart:", a3, a4, 0);
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  -[LargeMonthViewController _showEventDetailsForOccurrence:inWeek:onDay:animatedScrollToVisible:showMode:context:creationMethod:](self, "_showEventDetailsForOccurrence:inWeek:onDay:animatedScrollToVisible:showMode:context:creationMethod:", a3, 0, 0, 0, a5, a6, 0);
}

- (void)updatePalette:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "setWeekdayHeaderVisible:", 1);
  objc_msgSend(v4, "setWeekdayHeaderFillsHalfWidth:", 0);
  objc_msgSend(v4, "setTodayButtonVisible:", 1);
  objc_msgSend(v4, "setDateStringVisible:", 1);
  objc_msgSend(v4, "setDividerLineVisible:", 0);
  objc_msgSend(v4, "setFocusBannerPlacement:", 2);
  objc_msgSend(v4, "setDayScrubberController:", 0);
  -[LargeMonthViewController _updateDayHeaderFrames](self, "_updateDayHeaderFrames");
  objc_msgSend(v4, "sizeToFit");
  objc_msgSend(v4, "frame");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containingPalette"));
  objc_msgSend(v7, "setPreferredHeight:", v6);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containingPalette"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "_setBottomPalette:", v9);

}

- (void)updateNavigationBarDisplayedDateString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  LargeMonthViewController *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dateOfCenterViewOnScreen](self, "dateOfCenterViewOnScreen"));
  v4 = v3;
  if (self->_shouldForceAllowUpdateNavigationBarDateString
    || !self->_navigationBarDisplayedDate
    || (v9 = objc_msgSend(v3, "month"), v9 != -[EKCalendarDate month](self->_navigationBarDisplayedDate, "month"))
    || (v10 = objc_msgSend(v4, "year"), v10 != -[EKCalendarDate year](self->_navigationBarDisplayedDate, "year")))
  {
    self->_shouldForceAllowUpdateNavigationBarDateString = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController navigationController](self, "navigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topMainViewControllerContainer"));
    if ((objc_msgSend(v6, "currentChildViewControllerIsLoaded") & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topMainViewControllerContainer"));
      v8 = (LargeMonthViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentChildViewController"));

      if (v8 == self)
        objc_msgSend(v5, "setNavBarStringFromDate:includeMonth:includeYear:", v4, 1, 1);
    }
    else
    {

    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005A190;
    v11[3] = &unk_1001B2798;
    v12 = v4;
    -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v11);
    objc_storeStrong((id *)&self->_navigationBarDisplayedDate, v4);

  }
}

- (int)supportedToggleMode
{
  return 0;
}

- (void)didScroll
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LargeMonthViewController;
  -[MonthViewController didScroll](&v3, "didScroll");
  -[LargeMonthViewController updateNavigationBarDisplayedDateString](self, "updateNavigationBarDisplayedDateString");
  if (!self->_animateResize)
    -[LargeMonthViewController _layoutGridlinesAndBackgrounds:](self, "_layoutGridlinesAndBackgrounds:", 0);
}

- (void)didEndScrolling
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LargeMonthViewController;
  -[MonthViewController didEndScrolling](&v3, "didEndScrolling");
  -[LargeMonthViewController updateNavigationBarDisplayedDateString](self, "updateNavigationBarDisplayedDateString");
  -[LargeMonthViewController _layoutGridlinesAndBackgrounds:](self, "_layoutGridlinesAndBackgrounds:", 0);
}

- (CGRect)frameForTodayHighlight
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;
  double v19;
  CGFloat x;
  double v21;
  CGFloat y;
  double v23;
  CGFloat width;
  double v25;
  CGFloat height;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  v3 = CUIKTodayDate(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super.super.super._model, "calendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v4, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v7));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "frameForTodayHighlight");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController view](self, "view"));
    objc_msgSend(v18, "convertRect:fromView:", v9, v11, v13, v15, v17);
    x = v19;
    y = v21;
    width = v23;
    height = v25;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:(BOOL)a3
{
  self->_isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView = a3;
}

- (BOOL)isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView
{
  return self->_isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView;
}

- (id)shownEventViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController viewControllerToShowFrom](self, "viewControllerToShowFrom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentingViewController"));

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)LargeMonthViewController;
    v5 = -[MainViewController shownEventViewController](&v8, "shownEventViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)shownEventEditViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController viewControllerToShowFrom](self, "viewControllerToShowFrom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentingViewController"));

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)LargeMonthViewController;
    v5 = -[MainViewController shownEventEditViewController](&v8, "shownEventEditViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)currentlyEditingEventsWithGestures
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController draggedOccurrenceView](self, "draggedOccurrenceView"));
  v3 = v2 != 0;

  return v3;
}

- (int64_t)intendedSizeClass
{
  return 2;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (BOOL)mainViewControllerCanChangeSelectedEvent
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventEditViewController](self, "shownEventEditViewController"));
  v3 = v2 == 0;

  return v3;
}

- (BOOL)mainViewControllerCanChangeSelectedDate
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventEditViewController](self, "shownEventEditViewController"));
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventViewController](self, "shownEventViewController"));
    v4 = v5 == 0;

  }
  return v4;
}

- (BOOL)requiresSelfAsEventEditorDelegate
{
  return 1;
}

- (void)showNextOccurrenceOfSelectableItem
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventViewController](self, "shownEventViewController"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventViewController](self, "shownEventViewController"));
    -[LargeMonthViewController eventViewControllerNextButtonWasTapped:](self, "eventViewControllerNextButtonWasTapped:", v4);

  }
}

- (void)showPreviousOccurrenceOfSelectableItem
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventViewController](self, "shownEventViewController"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventViewController](self, "shownEventViewController"));
    -[LargeMonthViewController eventViewControllerPreviousButtonWasTapped:](self, "eventViewControllerPreviousButtonWasTapped:", v4);

  }
}

- (void)navigateToNextDateComponentUnitAnimated:(BOOL)a3
{
  -[LargeMonthViewController _showNextDateComponentUnitInForwardDirection:animated:](self, "_showNextDateComponentUnitInForwardDirection:animated:", 1, a3);
}

- (void)navigateToPreviousDateComponentUnitAnimated:(BOOL)a3
{
  -[LargeMonthViewController _showNextDateComponentUnitInForwardDirection:animated:](self, "_showNextDateComponentUnitInForwardDirection:animated:", 0, a3);
}

- (void)_showNextDateComponentUnitInForwardDirection:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v5 = a3;
  -[LargeMonthViewController _closeEventPresentationAnimated:](self, "_closeEventPresentationAnimated:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedDate"));

  if (v5)
    v8 = 1;
  else
    v8 = -1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendarDateByAddingMonths:", v8));
  -[MonthViewController selectDate:animated:](self, "selectDate:animated:", v9, v4);

}

- (double)_subviewHeightForDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "calendarDateForWeekWithWeekStart:", CUIKOneIndexedWeekStart(v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarDateByAddingWeeks:", 1));
  v8 = objc_msgSend(v7, "day");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "calendarDateForMonth"));

  v10 = objc_msgSend(v9, "day");
  if (v8 == v10)
    v11 = 2.0;
  else
    v11 = 1.0;
  v12 = (void *)objc_opt_class(self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController view](self, "view"));
  v14 = EKUICurrentWindowSize(v13);
  objc_msgSend(v12, "_cellHeightForMultiplier:windowSize:", v11, v14, v15);
  v17 = v16;

  return v17;
}

+ (double)_cellHeightForMultiplier:(double)a3 windowSize:(CGSize)a4
{
  double width;
  double v6;

  width = a4.width;
  if (qword_1001F6168 != -1)
    dispatch_once(&qword_1001F6168, &stru_1001B30E0);
  objc_msgSend((id)qword_1001F6160, "valueForSize:", width);
  return v6 * a3;
}

- (id)pushedWeekViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController nextLevelWeekViewControllerWithDate:](self, "nextLevelWeekViewControllerWithDate:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController navigationController](self, "navigationController"));
  objc_msgSend(v7, "pushViewController:animated:", v6, v4);

  return v6;
}

- (id)nextLevelWeekViewControllerWithDate:(id)a3
{
  WeekViewContainerViewController *v4;
  CUIKCalendarModel *model;
  void *v6;
  WeekViewContainerViewController *v7;

  -[CUIKCalendarModel setSelectedDate:](self->super.super.super._model, "setSelectedDate:", a3);
  v4 = [WeekViewContainerViewController alloc];
  model = self->super.super.super._model;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v7 = -[MainViewControllerContainer initWithModel:window:](v4, "initWithModel:window:", model, v6);

  return v7;
}

- (id)occurrencesForStartDate:(id)a3 endDate:(id)a4 waitForLoad:(BOOL)a5
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel occurrencesForStartDate:endDate:preSorted:waitForLoad:](self->super.super.super._model, "occurrencesForStartDate:endDate:preSorted:waitForLoad:", a3, a4, 0, a5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "occurrences"));

  return v6;
}

- (void)didCompleteBackgroundOccurrenceRenderingForLargeMonthWeekView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _BYTE v25[24];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedOccurrence"));

  v7 = -[LargeMonthViewController isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:isPreemptiveCheck:](self, "isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:isPreemptiveCheck:", 0, 1);
  if (v6)
  {
    v8 = v7;
    if (-[LargeMonthViewController isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView](self, "isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endCalendarDate"));
      objc_msgSend(v9, "absoluteTime");
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
      objc_msgSend(v12, "absoluteTime");
      if (v11 <= v13)
      {

LABEL_11:
        goto LABEL_12;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startCalendarDate"));
      objc_msgSend(v14, "absoluteTime");
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
      objc_msgSend(v17, "absoluteTime");
      if (v16 >= v18)
        v8 = 0;

      if (v8 == 1)
      {
        -[LargeMonthViewController setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:](self, "setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:", 0);
        v19 = (void *)kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          v20 = v19;
          v21 = (void *)objc_opt_class(self);
          v22 = v21;
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController managedNavigationController](self, "managedNavigationController"));
          *(_DWORD *)v25 = 138412546;
          *(_QWORD *)&v25[4] = v21;
          *(_WORD *)&v25[12] = 2112;
          *(_QWORD *)&v25[14] = objc_opt_class(v23);
          v24 = *(id *)&v25[14];
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@ notifying %@ that it completed background rendering of the occurrence view for the selected event.", v25, 0x16u);

        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController managedNavigationController](self, "managedNavigationController", *(_OWORD *)v25, *(_QWORD *)&v25[16]));
        objc_msgSend(v9, "sourceViewController:notifiesReadinessForPresentation:", self, 1);
        goto LABEL_11;
      }
    }
  }
LABEL_12:

}

- (BOOL)isBackgroundScene
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windowScene"));
  v4 = objc_msgSend(v3, "activationState") == (id)2;

  return v4;
}

- (void)largeMonthWeekView:(id)a3 didTapOccurrence:(id)a4 onDay:(id)a5 extendSelection:(BOOL)a6 userInitiated:(BOOL)a7 tappedSymbol:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  BOOL *p_isTrackingTouches;
  uint64_t v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  _BOOL4 currentlyEditingEvent;
  void *v36;
  id v37;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v37 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pasteboardManager"));
  if (v14)
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
  else
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "date"));
  v19 = (void *)v18;
  objc_msgSend(v17, "setDateForPaste:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventEditViewController](self, "shownEventEditViewController"));
  if (v20)
    goto LABEL_22;
  if (v9)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController presentedViewController](self, "presentedViewController"));
    v22 = objc_msgSend(v21, "isBeingDismissed");

    if ((v22 & 1) != 0)
      goto LABEL_22;
    p_isTrackingTouches = &self->_isTrackingTouches;
    if (!self->_isTrackingTouches)
    {
      v24 = objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v15));
      v25 = (void *)v24;
      if (v14 && v24)
      {
        if (v10)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super.super.super._model, "selectedOccurrences"));
          v27 = objc_msgSend(v26, "containsObject:", v14);

          if (v27)
            -[LargeMonthViewController removeEventFromSelection:inWeek:updateModel:](self, "removeEventFromSelection:inWeek:updateModel:", v14, v25, 1);
          else
            -[LargeMonthViewController addEventToSelection:inWeek:updateModel:](self, "addEventToSelection:inWeek:updateModel:", v14, v25, 1);
        }
        else if (v8 && objc_msgSend(v14, "isIntegrationEvent"))
        {
          -[LargeMonthViewController completeReminderFromTap:](self, "completeReminderFromTap:", v14);
        }
        else
        {
          -[LargeMonthViewController _showEventDetailsForOccurrence:inWeek:onDay:creationMethod:](self, "_showEventDetailsForOccurrence:inWeek:onDay:creationMethod:", v14, v25, v15, 0);
        }
      }
      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventEditViewController](self, "shownEventEditViewController"));
        if (v34)
        {
          currentlyEditingEvent = self->_currentlyEditingEvent;

          if (!currentlyEditingEvent)
          {
            -[LargeMonthViewController _closeEventPresentationAnimated:](self, "_closeEventPresentationAnimated:", 1);
            -[MonthViewController removeDraggingOccurrenceAnimated:](self, "removeDraggingOccurrenceAnimated:", 1);
            -[MonthViewController removeAllWeekHighlights](self, "removeAllWeekHighlights");
            -[LargeMonthViewController selectOccurrence:inWeek:](self, "selectOccurrence:inWeek:", 0, 0);
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
            objc_msgSend(v36, "setScrollEnabled:", 1);

          }
        }
      }

      goto LABEL_22;
    }
    goto LABEL_14;
  }
  p_isTrackingTouches = &self->_isTrackingTouches;
  if (self->_isTrackingTouches)
  {
LABEL_14:
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventViewController](self, "shownEventViewController"));

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrence](self->super.super.super._model, "selectedOccurrence"));

      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrence](self->super.super.super._model, "selectedOccurrence"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_weeksContainingSelectedOccurrences, "firstObject"));
        -[LargeMonthViewController _showEventDetailsForOccurrence:inWeek:onDay:creationMethod:](self, "_showEventDetailsForOccurrence:inWeek:onDay:creationMethod:", v30, v31, self->_tappedDay, 0);

      }
      else
      {
        -[LargeMonthViewController _closeEventPresentationAnimated:](self, "_closeEventPresentationAnimated:", 1);
      }
    }
    *p_isTrackingTouches = 0;
    goto LABEL_22;
  }
  if (v14)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super.super.super._model, "selectedOccurrences"));
    v33 = objc_msgSend(v32, "containsObject:", v14);

    if ((v33 & 1) == 0)
      -[CUIKCalendarModel setSelectedOccurrence:](self->super.super.super._model, "setSelectedOccurrence:", v14);
  }
LABEL_22:

}

- (void)completeReminderFromTap:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;

  v4 = a3;
  objc_msgSend(v4, "setCompleted:", objc_msgSend(v4, "completed") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController EKUI_editor](self, "EKUI_editor"));
  v9 = 0;
  v6 = objc_msgSend(v5, "saveEvent:span:error:", v4, 0, &v9);

  v7 = v9;
  if ((v6 & 1) == 0)
  {
    v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "error completing/uncompleting reminder: %@", buf, 0xCu);
    }
  }

}

- (void)largeMonthWeekView:(id)a3 didDoubleTapOnDay:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a4;
  -[LargeMonthViewController _closeEventPresentationAnimated:](self, "_closeEventPresentationAnimated:", 0);
  -[MonthViewController removeAllWeekHighlights](self, "removeAllWeekHighlights");
  -[CUIKCalendarModel setSelectedDate:](self->super.super.super._model, "setSelectedDate:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController pushedWeekViewControllerWithDate:animated:](self, "pushedWeekViewControllerWithDate:animated:", v8, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentChildViewController"));

  if ((objc_opt_respondsToSelector(v6, "pushedDayViewControllerWithDate:animated:") & 1) != 0)
    v7 = objc_msgSend(v6, "pushedDayViewControllerWithDate:animated:", v8, 0);

}

- (void)largeMonthWeekView:(id)a3 touchesBegan:(id)a4 withEvent:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventEditViewController](self, "shownEventEditViewController"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventViewController](self, "shownEventViewController"));

    if (v7)
    {
      self->_isTrackingTouches = 1;
      -[LargeMonthViewController _scrubWithTouches:](self, "_scrubWithTouches:", v8);
    }
  }

}

- (void)largeMonthWeekView:(id)a3 touchesMoved:(id)a4 withEvent:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventEditViewController](self, "shownEventEditViewController"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventViewController](self, "shownEventViewController"));

    if (v7)
      -[LargeMonthViewController _scrubWithTouches:](self, "_scrubWithTouches:", v8);
  }

}

- (void)largeMonthWeekView:(id)a3 touchesEnded:(id)a4 withEvent:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventEditViewController](self, "shownEventEditViewController"));

  if (!v6)
  {
    self->_isTrackingTouches = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventViewController](self, "shownEventViewController"));

    if (v7)
    {
      -[LargeMonthViewController _scrubWithTouches:](self, "_scrubWithTouches:", v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedOccurrence"));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "anyObject"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
        objc_msgSend(v10, "locationInView:", v11);
        v13 = v12;
        v15 = v14;

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController _weekViewAtPoint:pointInWeek:](self, "_weekViewAtPoint:pointInWeek:", 0, v13, v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectedOccurrence"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController dateAtPoint:](self, "dateAtPoint:", v13, v15));
        -[LargeMonthViewController _showEventDetailsForOccurrence:inWeek:onDay:creationMethod:](self, "_showEventDetailsForOccurrence:inWeek:onDay:creationMethod:", v18, v16, v19, 0);

      }
      else
      {
        -[LargeMonthViewController _closeEventPresentationAnimated:](self, "_closeEventPresentationAnimated:", 1);
      }
      -[MonthViewController removeAllWeekHighlights](self, "removeAllWeekHighlights");
    }
  }

}

- (id)presentationControllerForEditMenu
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController currentPresentationController](self, "currentPresentationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));

  if (v3)
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));
  else
    v4 = v2;
  v5 = v4;

  return v5;
}

- (id)selectedEventsForEditMenu
{
  return -[CUIKCalendarModel selectedOccurrences](self->super.super.super._model, "selectedOccurrences");
}

- (BOOL)interaction:(id)a3 shouldShowMenuAtPoint:(CGPoint)a4 inView:(id)a5
{
  void *v5;
  BOOL v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "occurrenceAtPoint:", a3, a4.x, a4.y));
  v6 = v5 == 0;

  return v6;
}

- (BOOL)interaction:(id)a3 canPasteEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", a3, a5, a4.x, a4.y));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pasteboardManager"));
  v7 = objc_msgSend(v6, "canPerformPaste");

  return v7;
}

- (BOOL)interaction:(id)a3 canCreateEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  void *v5;
  void *v6;
  BOOL v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", a3, a5, a4.x, a4.y));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultCalendarForNewEvents"));
  v7 = v6 != 0;

  return v7;
}

- (BOOL)interaction:(id)a3 canCreateReminderAtPoint:(CGPoint)a4 inView:(id)a5
{
  void *v5;
  void *v6;
  BOOL v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", a3, a5, a4.x, a4.y));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reminderCalendar"));
  v7 = v6 != 0;

  return v7;
}

- (void)interaction:(id)a3 createEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v9, "convertPoint:fromView:", v8, x, y);
  v11 = v10;
  v13 = v12;

  v14 = -[MonthViewController eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:](self, "eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", 0, 0, 1, v11, v13);
  -[MonthViewController eventGestureController:commitToPoint:](self, "eventGestureController:commitToPoint:", 0, v11, v13);
}

- (void)interaction:(id)a3 createReminderAtPoint:(CGPoint)a4 inView:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v9, "convertPoint:fromView:", v8, x, y);
  v11 = v10;
  v13 = v12;

  v17 = (id)objc_claimAutoreleasedReturnValue(-[MonthViewController eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:](self, "eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", 0, 0, 1, v11, v13));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "reminderCalendar"));
  objc_msgSend(v17, "setCalendar:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startDate"));
  objc_msgSend(v17, "setEndDate:", v16);

  -[MonthViewController eventGestureController:commitToPoint:](self, "eventGestureController:commitToPoint:", 0, v11, v13);
}

- (void)interaction:(id)a3 pasteEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v9, "convertPoint:fromView:", v8, x, y);
  v11 = v10;
  v13 = v12;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[MonthViewController dateAtPoint:](self, "dateAtPoint:", v11, v13));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pasteboardManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "date"));
  objc_msgSend(v15, "setDateForPaste:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "pasteboardManager"));
  objc_msgSend(v18, "pasteEventsWithDateMode:delegate:", 0, self);

}

- (id)interaction:(id)a3 titleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", a3, a5, a4.x, a4.y));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pasteboardManager"));
  v7 = objc_msgSend(v6, "numberOfEventsToPaste");

  return +[EKUIRightClickEmptySpaceInteraction localizedPasteStringForEventCount:includeHere:](EKUIRightClickEmptySpaceInteraction, "localizedPasteStringForEventCount:includeHere:", v7, 0);
}

- (id)interaction:(id)a3 subtitleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v9, "convertPoint:fromView:", v8, x, y);
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController dateAtPoint:](self, "dateAtPoint:", v11, v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "date"));
  v16 = CUIKCalendar(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPasteboardUtilities roundedDateForDate:dateMode:calendar:](CUIKPasteboardUtilities, "roundedDateForDate:dateMode:calendar:", v15, 0, v17));

  v19 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v19, "setCalendar:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "timeZone"));
  objc_msgSend(v19, "setTimeZone:", v20);

  objc_msgSend(v19, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend(v19, "setDateStyle:", 1);
  objc_msgSend(v19, "setTimeStyle:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringFromDate:", v18));

  return v21;
}

- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4
{
  -[LargeMonthViewController _showEventDetailsForOccurrence:inWeek:onDay:animatedScrollToVisible:showMode:context:creationMethod:](self, "_showEventDetailsForOccurrence:inWeek:onDay:animatedScrollToVisible:showMode:context:creationMethod:", a4, 0, 0, 0, 1, 0, 0);
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
  objc_msgSend(a4, "presentFromSource:", self);
}

- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5
{
  if (!a4 && !a5)
    -[MainViewController attemptDisplayReviewPrompt](self, "attemptDisplayReviewPrompt", a3);
}

- (void)_showEventDetailsForOccurrence:(id)a3 inWeek:(id)a4 onDay:(id)a5 creationMethod:(unint64_t)a6
{
  -[LargeMonthViewController _showEventDetailsForOccurrence:inWeek:onDay:animatedScrollToVisible:showMode:context:creationMethod:](self, "_showEventDetailsForOccurrence:inWeek:onDay:animatedScrollToVisible:showMode:context:creationMethod:", a3, a4, a5, 1, 1, 0, a6);
}

- (void)_showEventDetailsForOccurrence:(id)a3 inWeek:(id)a4 onDay:(id)a5 animatedScrollToVisible:(BOOL)a6 showMode:(unint64_t)a7 context:(id)a8 creationMethod:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *weeksContainingSelectedOccurrences;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  BOOL v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  BOOL v44;
  _QWORD v45[4];
  id v46;
  LargeMonthViewController *v47;
  id v48;
  id v49;
  uint64_t *v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;

  v15 = a3;
  v16 = a4;
  v39 = a5;
  v17 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  objc_msgSend(v18, "setSelectedOccurrence:", v15);

  if (!self->_weeksContainingSelectedOccurrences)
  {
    v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    weeksContainingSelectedOccurrences = self->_weeksContainingSelectedOccurrences;
    self->_weeksContainingSelectedOccurrences = v19;

  }
  if (v16)
    -[NSMutableArray addObject:](self->_weeksContainingSelectedOccurrences, "addObject:", v16);
  v40 = v16;
  objc_storeStrong((id *)&self->_tappedDay, a5);
  self->_shouldAnimateScrollToVisibleWeekViewForSelectedOccurrence = a6;
  v38 = a7 == 2;
  self->_shouldPresentEventCommentsForSelectedOccurrence = a7 == 2;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_100058834;
  v57 = sub_100058844;
  v58 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController viewControllerToShowFrom](self, "viewControllerToShowFrom"));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10005BE10;
  v45[3] = &unk_1001B3108;
  v22 = v15;
  v46 = v22;
  v47 = self;
  v51 = a7;
  v52 = a9;
  v50 = &v53;
  v23 = v17;
  v48 = v23;
  v24 = v21;
  v49 = v24;
  v25 = objc_retainBlock(v45);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "viewControllers"));
  v27 = objc_msgSend(v26, "count");

  if (!v27)
    goto LABEL_10;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventEditViewController](self, "shownEventEditViewController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "event"));
  if (objc_msgSend(v29, "isEqual:", v22))
  {

    goto LABEL_11;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventViewController](self, "shownEventViewController"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "event"));
  v32 = objc_msgSend(v31, "isEqual:", v22);

  if ((v32 & 1) == 0)
  {
    objc_msgSend(v24, "setViewControllers:animated:", &__NSArray0__struct, 0);
    objc_msgSend(v24, "dismissViewControllerAnimated:completion:", 0, 0);
LABEL_10:
    ((void (*)(_QWORD *))v25[2])(v25);
  }
LABEL_11:
  if (v54[5])
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController navigationController](self, "navigationController"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "window"));

    if (v35)
      EKUIPushFallbackSizingContextWithViewHierarchy(v35);
    v36 = v54[5];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10005BEF4;
    v41[3] = &unk_1001B3130;
    v44 = v38;
    v43 = &v53;
    v37 = v35;
    v42 = v37;
    objc_msgSend(v24, "showViewController:sender:animated:completion:", v36, self, 1, v41);

  }
  _Block_object_dispose(&v53, 8);

}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_opt_class(CNContactViewController);
  if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController viewControllerToShowFrom](self, "viewControllerToShowFrom"));
    objc_msgSend(v14, "setNavigationBarHidden:animated:", 1, 0);

  }
  v15.receiver = self;
  v15.super_class = (Class)LargeMonthViewController;
  -[MainViewController showViewController:sender:animated:completion:](&v15, "showViewController:sender:animated:completion:", v10, v11, v7, v12);

}

- (void)_scrubAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CGPoint v12;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventEditViewController](self, "shownEventEditViewController"));

  if (!v6)
  {
    v12.x = x;
    v12.y = y;
    if (!CGRectContainsPoint(self->_scrubbingRect, v12)
      || (v7 = objc_claimAutoreleasedReturnValue(-[LargeMonthViewController occurrenceAtPoint:](self, "occurrenceAtPoint:", x, y))) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedOccurrence"));

      if (!v9)
        return;
      v7 = 0;
    }
    v11 = (id)v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController _weekViewAtPoint:pointInWeek:](self, "_weekViewAtPoint:pointInWeek:", 0, x, y));
    -[LargeMonthViewController selectOccurrence:inWeek:](self, "selectOccurrence:inWeek:", v11, v10);

  }
}

- (void)_scrubWithTouches:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "anyObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v9, "locationInView:", v4);
  v6 = v5;
  v8 = v7;

  -[LargeMonthViewController _scrubAtPoint:](self, "_scrubAtPoint:", v6, v8);
}

- (void)_scrollToWeekView:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, uint64_t);
  double v10;
  void *v11;
  void *v12;
  double MaxY;
  void *v14;
  double v15;
  double v16;
  void *v17;
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
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  _QWORD v44[7];
  uint8_t buf[4];
  const char *v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  if (v8)
  {
    if (v6)
      v10 = 0.4;
    else
      v10 = 0.0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController existingPalette](self, "existingPalette"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "superview"));
    objc_msgSend(v11, "frame");
    MaxY = CGRectGetMaxY(v47);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController view](self, "view"));
    objc_msgSend(v12, "convertPoint:toView:", v14, 0.0, MaxY);
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController view](self, "view"));
    objc_msgSend(v17, "bounds");
    v18 = CGRectGetMaxY(v48);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
    objc_msgSend(v8, "frame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController view](self, "view"));
    objc_msgSend(v19, "convertRect:toView:", v28, v21, v23, v25, v27);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;

    v49.origin.x = v30;
    v49.origin.y = v32;
    v49.size.width = v34;
    v49.size.height = v36;
    if (CGRectGetMinY(v49) >= v16 + 0.0)
    {
      v51.origin.x = v30;
      v51.origin.y = v32;
      v51.size.width = v34;
      v51.size.height = v36;
      if (CGRectGetMaxY(v51) <= v18)
        goto LABEL_13;
      v52.origin.x = v30;
      v52.origin.y = v32;
      v52.size.width = v34;
      v52.size.height = v36;
      v37 = CGRectGetMaxY(v52) - v18;
    }
    else
    {
      v50.origin.x = v30;
      v50.origin.y = v32;
      v50.size.width = v34;
      v50.size.height = v36;
      v37 = CGRectGetMinY(v50) - v16;
    }
    if (v37 != 0.0)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v39, "contentOffset");
      v41 = v40;
      v43 = v42;

      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10005C488;
      v44[3] = &unk_1001B2810;
      v44[4] = self;
      v44[5] = v41;
      *(double *)&v44[6] = v37 + v43;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v44, v9, v10);
LABEL_15:

      goto LABEL_16;
    }
LABEL_13:
    if (v9)
      v9[2](v9, 1);
    goto LABEL_15;
  }
  v38 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[LargeMonthViewController _scrollToWeekView:animated:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "%s: Can't scroll to nil weekView.", buf, 0xCu);
  }
LABEL_16:

}

- (void)_closeEventPresentationAnimated:(BOOL)a3
{
  -[LargeMonthViewController _closeEventPresentationAnimated:completion:](self, "_closeEventPresentationAnimated:completion:", a3, 0);
}

- (void)_closeEventPresentationAnimated:(BOOL)a3 completion:(id)a4
{
  -[LargeMonthViewController _closeEventPresentationAnimated:viewController:completion:](self, "_closeEventPresentationAnimated:viewController:completion:", a3, 0, a4);
}

- (void)_closeEventPresentationAnimated:(BOOL)a3 viewController:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController presentedViewController](self, "presentedViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "popoverPresentationController"));

  if (v11)
  {
    if ((objc_msgSend(v11, "dismissing") & 1) == 0)
    {
      if (v6)
        v12 = 0.3;
      else
        v12 = 0.0;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10005C67C;
      v19[3] = &unk_1001B2538;
      v20 = v11;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10005C6B0;
      v16[3] = &unk_1001B3180;
      v16[4] = self;
      v17 = v20;
      v18 = v9;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v19, v16, v12);

    }
  }
  else if (v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentingViewController"));
    v14 = objc_opt_class(EnqueueableManagedNavigationController);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "presentingViewController"));

      v13 = (void *)v15;
    }
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", v6, v9);

  }
}

- (void)addEventToSelection:(id)a3 inWeek:(id)a4 updateModel:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSMutableArray *weeksContainingSelectedOccurrences;
  NSMutableArray *v10;
  NSMutableArray *v11;
  id v12;

  v5 = a5;
  v12 = a3;
  v8 = a4;
  if (v5)
    -[CUIKCalendarModel selectOccurrence:](self->super.super.super._model, "selectOccurrence:", v12);
  if (v8)
  {
    objc_msgSend(v8, "selectOccurrence:", v12);
    if ((-[NSMutableArray containsObject:](self->_weeksContainingSelectedOccurrences, "containsObject:", v8) & 1) == 0)
    {
      weeksContainingSelectedOccurrences = self->_weeksContainingSelectedOccurrences;
      if (!weeksContainingSelectedOccurrences)
      {
        v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v11 = self->_weeksContainingSelectedOccurrences;
        self->_weeksContainingSelectedOccurrences = v10;

        weeksContainingSelectedOccurrences = self->_weeksContainingSelectedOccurrences;
      }
      -[NSMutableArray addObject:](weeksContainingSelectedOccurrences, "addObject:", v8);
    }
  }

}

- (void)removeEventFromSelection:(id)a3 inWeek:(id)a4 updateModel:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  id v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  if (v5)
    -[CUIKCalendarModel deselectOccurrence:](self->super.super.super._model, "deselectOccurrence:", v11);
  objc_msgSend(v8, "deselectOccurrence:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedOccurrences"));
  v10 = objc_msgSend(v9, "count");

  if (!v10)
    -[NSMutableArray removeObject:](self->_weeksContainingSelectedOccurrences, "removeObject:", v8);

}

- (BOOL)isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:(id)a3
{
  return -[LargeMonthViewController isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:isPreemptiveCheck:](self, "isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:isPreemptiveCheck:", a3, 0);
}

- (BOOL)isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:(id)a3 isPreemptiveCheck:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  unsigned int v21;
  NSObject *v22;
  _BOOL4 v23;
  unsigned int v24;
  int v25;
  void *v26;
  int v28;
  const char *v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedOccurrence"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startCalendarDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController view](self, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startCalendarDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "calendarDateForDay"));
    objc_msgSend(v9, "frameForOccurrence:onDay:", v7, v12);
    objc_msgSend(v10, "convertRect:fromView:", v9);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    if (a4)
      v21 = 1;
    else
      v21 = !-[LargeMonthViewController isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView](self, "isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView");
    if (v9)
      v24 = v21;
    else
      v24 = 0;
    v30.origin.x = v14;
    v30.origin.y = v16;
    v30.size.width = v18;
    v30.size.height = v20;
    v25 = v24 & ~CGRectIsEmpty(v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController view](self, "view"));
    objc_msgSend(v26, "bounds");
    v32.origin.x = v14;
    v32.origin.y = v16;
    v32.size.width = v18;
    v32.size.height = v20;
    v23 = v25 & CGRectContainsRect(v31, v32);

  }
  else
  {
    v22 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v28 = 136315138;
      v29 = "-[LargeMonthViewController isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:isPreemptiveCheck:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Couldn't find a selected event to show details for.", (uint8_t *)&v28, 0xCu);
    }
    LOBYTE(v23) = 0;
  }

  return v23;
}

- (void)enqueuableNavigationController:(id)a3 requestsDeferShowViewControllerUntilReady:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  LargeMonthViewController *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;

  v6 = a3;
  v7 = a4;
  v8 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController managedNavigationController](self, "managedNavigationController"));
    v11 = (void *)objc_opt_class(v10);
    v12 = v11;
    *(_DWORD *)buf = 138412546;
    v29 = (const char *)v11;
    v30 = 2112;
    v31 = (id)objc_opt_class(self);
    v13 = v31;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ requested that %@ prepare itself to show the source view for the popover.", buf, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "selectedOccurrence"));

  if (v15)
  {
    objc_initWeak((id *)buf, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10005CDF4;
    v22[3] = &unk_1001B31A8;
    objc_copyWeak(&v27, (id *)buf);
    v16 = v15;
    v23 = v16;
    v17 = v6;
    v24 = v17;
    v25 = self;
    v26 = v7;
    v18 = objc_retainBlock(v22);
    if (-[LargeMonthViewController isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:](self, "isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:", v17))
    {
      ((void (*)(_QWORD *, uint64_t))v18[2])(v18, 1);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "startCalendarDate"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "date"));
      -[InfiniteScrollViewController showDate:animated:completionBlock:](self, "showDate:animated:completionBlock:", v21, self->_shouldAnimateScrollToVisibleWeekViewForSelectedOccurrence, v18);

    }
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v19 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[LargeMonthViewController enqueuableNavigationController:requestsDeferShowViewControllerUntilReady:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: Couldn't find a selected event to show details for.", buf, 0xCu);
    }
    objc_msgSend(v6, "enqueueStackResetOperation");
  }

}

- (void)enqueueableManagedNavigationController:(id)a3 requestsConfigurationOfPropertiesForPopoverPresentationController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  double v31;
  double x;
  double v33;
  double y;
  double v35;
  double width;
  double v37;
  double height;
  double v39;
  void *v40;
  double v41;
  void *v42;
  _BYTE v43[24];
  CGRect v44;
  CGRect v45;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController managedNavigationController](self, "managedNavigationController"));
    v14 = (void *)objc_opt_class(v13);
    v15 = v14;
    *(_DWORD *)v43 = 138412546;
    *(_QWORD *)&v43[4] = v14;
    *(_WORD *)&v43[12] = 2112;
    *(_QWORD *)&v43[14] = objc_opt_class(self);
    v16 = *(id *)&v43[14];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@ requested that %@ configure the popover.", v43, 0x16u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", *(_OWORD *)v43, *(_QWORD *)&v43[16]));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectedOccurrence"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startCalendarDate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v19));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentedViewController"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
      objc_msgSend(v23, "setBackgroundColor:", v21);

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentedViewController"));
      objc_msgSend(v24, "setModalPresentationStyle:", 7);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController draggedOccurrenceView](self, "draggedOccurrenceView"));
      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController draggedOccurrenceView](self, "draggedOccurrenceView"));
        objc_msgSend(v26, "bounds");
        objc_msgSend(v9, "setSourceRect:");

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController draggedOccurrenceView](self, "draggedOccurrenceView"));
        objc_msgSend(v9, "setSourceView:", v27);

      }
      else
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startCalendarDate"));
        objc_msgSend(v20, "frameForOccurrence:onDay:", v18, v30);
        x = v31;
        y = v33;
        width = v35;
        height = v37;

        v44.origin.x = x;
        v44.origin.y = y;
        v44.size.width = width;
        v44.size.height = height;
        if (CGRectIsNull(v44))
        {
          x = CGRectZero.origin.x;
          y = CGRectZero.origin.y;
          width = CGRectZero.size.width;
          height = CGRectZero.size.height;
        }
        else
        {
          objc_msgSend(v20, "frame");
          if (width == v39)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController view](self, "view"));
            v41 = EKUICurrentWindowSize(v40);

            if (width == v41)
              width = width + -30.0;
          }
        }
        objc_msgSend(v9, "setSourceRect:", x, y, width, height);
        objc_msgSend(v9, "setSourceView:", v20);
      }
      objc_msgSend(v9, "setDelegate:", self);
      objc_msgSend(v9, "setPermittedArrowDirections:", 12);
      if (self->_tappedDay)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventEditViewController](self, "shownEventEditViewController"));

        if (!v42)
        {
          objc_msgSend(v20, "frameForDate:", self->_tappedDay);
          CGRectIsNull(v45);
        }
      }
      if (v10)
        v10[2](v10);
    }
    else
    {
      v29 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v43 = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Can't present popover from a nil event.", v43, 2u);
      }
    }

  }
  else
  {
    v28 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Can't present popover from a nil event.", v43, 2u);
    }
  }

}

- (int)editorShowTransition
{
  return 6;
}

- (int)editorHideTransition
{
  return 6;
}

- (void)eventViewControllerWillBeginEditingEvent:(id)a3
{
  self->_currentlyEditingEvent = 1;
  -[LargeMonthViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations", a3);
}

- (BOOL)eventViewDelegateShouldHandlePresentationOfEditViewController:(id)a3
{
  return 1;
}

- (BOOL)eventViewDelegateShouldCreateOwnEditViewController:(id)a3
{
  return 0;
}

- (void)eventViewController:(id)a3 requestsDisplayOfEditViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v7 = a4;
  objc_msgSend(v7, "setInternalEditViewDelegate:", self);
  objc_msgSend(v7, "setModalPresentationStyle:", 3);
  objc_msgSend(v7, "setModalTransitionStyle:", 2);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController managedNavigationController](self, "managedNavigationController"));
  objc_msgSend(v8, "presentViewController:animated:completion:", v7, v5, 0);

}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  -[LargeMonthViewController _closeEventPresentationAnimated:](self, "_closeEventPresentationAnimated:", 1, a4);
}

- (BOOL)eventViewControllerPresentationWantsHiddenNavBarForSingleController
{
  return 1;
}

- (BOOL)eventViewDelegateShouldHandlePresentationOfDeleteAlert:(id)a3
{
  return 1;
}

- (void)eventViewController:(id)a3 requestsDisplayOfDeleteAlert:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
  objc_msgSend(v8, "sourceRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
  objc_msgSend(v17, "setSourceRect:", v10, v12, v14, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sourceView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
  objc_msgSend(v20, "setSourceView:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
  v22 = objc_msgSend(v21, "permittedArrowDirections");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
  objc_msgSend(v23, "setPermittedArrowDirections:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "popoverPresentationController"));
  objc_msgSend(v24, "setDelegate:", self);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10005D6D0;
  v26[3] = &unk_1001B26A0;
  v26[4] = self;
  v27 = v6;
  v25 = v6;
  -[LargeMonthViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v26);

}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  -[LargeMonthViewController eventEditViewController:didCompleteWithAction:completionHandler:](self, "eventEditViewController:didCompleteWithAction:completionHandler:", a3, a4, 0);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;

  v8 = a3;
  v9 = a5;
  if (a4 == 1
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "event")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "calendar")),
        v12 = objc_msgSend(v11, "sharingStatus"),
        v11,
        v10,
        v12))
  {
    if (!v9)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10005D8B8;
      v17[3] = &unk_1001B2538;
      v17[4] = self;
      v13 = objc_retainBlock(v17);
      goto LABEL_10;
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10005D888;
    v18[3] = &unk_1001B2600;
    v18[4] = self;
    v19 = v9;
    v13 = objc_retainBlock(v18);
    v14 = v19;
  }
  else
  {
    if (!v9)
    {
      v13 = 0;
      goto LABEL_10;
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10005D8C0;
    v15[3] = &unk_1001B2600;
    v15[4] = self;
    v16 = v9;
    v13 = objc_retainBlock(v15);
    v14 = v16;
  }

LABEL_10:
  -[LargeMonthViewController _closeEventPresentationAnimated:viewController:completion:](self, "_closeEventPresentationAnimated:viewController:completion:", 1, v8, v13);
  -[MonthViewController removeDraggingOccurrenceAnimated:](self, "removeDraggingOccurrenceAnimated:", 1);
  -[MonthViewController removeAllWeekHighlights](self, "removeAllWeekHighlights");
  self->_currentlyEditingEvent = 0;

}

- (id)calendarModel
{
  return self->super.super.super._model;
}

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pasteboardManager"));

  return v4;
}

- (void)eventViewControllerNextButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "event"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextOccurrence"));

  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005D9DC;
    v7[3] = &unk_1001B2CD8;
    v7[4] = self;
    v8 = v6;
    v9 = v4;
    -[LargeMonthViewController _closeEventPresentationAnimated:viewController:completion:](self, "_closeEventPresentationAnimated:viewController:completion:", 1, 0, v7);

  }
}

- (void)eventViewControllerPreviousButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "event"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "previousOccurrence"));

  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005DAEC;
    v7[3] = &unk_1001B2CD8;
    v7[4] = self;
    v8 = v6;
    v9 = v4;
    -[LargeMonthViewController _closeEventPresentationAnimated:viewController:completion:](self, "_closeEventPresentationAnimated:viewController:completion:", 1, 0, v7);

  }
}

- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005DBEC;
  v9[3] = &unk_1001B2CD8;
  v9[4] = self;
  v10 = a4;
  v11 = v6;
  v7 = v6;
  v8 = v10;
  -[LargeMonthViewController _closeEventPresentationAnimated:viewController:completion:](self, "_closeEventPresentationAnimated:viewController:completion:", 1, 0, v9);

}

- (void)_displayedOccurrencesChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CUIKCalendarModelDisplayedOccurrencesChangedRangeStartKey));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CUIKCalendarModelDisplayedOccurrencesChangedRangeEndKey));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005DD30;
  v11[3] = &unk_1001B31D0;
  v12 = v6;
  v13 = v8;
  v9 = v8;
  v10 = v6;
  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v11);

}

- (void)_selectedOccurrencesChanged:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *k;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];

  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = -[NSMutableArray copy](self->_weeksContainingSelectedOccurrences, "copy", a3);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedOccurrences"));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v28 != v13)
                objc_enumerationMutation(v10);
              -[LargeMonthViewController removeEventFromSelection:inWeek:updateModel:](self, "removeEventFromSelection:inWeek:updateModel:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j), v9, 0);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v6);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel selectedOccurrences](self->super.super.super._model, "selectedOccurrences", 0));
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)k);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startCalendarDate"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v21));

        -[LargeMonthViewController addEventToSelection:inWeek:updateModel:](self, "addEventToSelection:inWeek:updateModel:", v20, v22, 0);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v17);
  }

}

- (void)contentSizeCategoryChanged
{
  objc_super v3;

  +[MonthViewOccurrence clearCachedFonts](MonthViewOccurrence, "clearCachedFonts");
  +[LargeMonthWeekView clearCachedFonts](LargeMonthWeekView, "clearCachedFonts");
  v3.receiver = self;
  v3.super_class = (Class)LargeMonthViewController;
  -[MonthViewController contentSizeCategoryChanged](&v3, "contentSizeCategoryChanged");
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
  v5[2] = sub_10005E15C;
  v5[3] = &unk_1001B31F0;
  v6 = v4;
  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v5);
}

- (void)localeChanged
{
  objc_super v3;

  -[LargeMonthViewController findWeekends](self, "findWeekends");
  v3.receiver = self;
  v3.super_class = (Class)LargeMonthViewController;
  -[MonthViewController localeChanged](&v3, "localeChanged");
}

- (BOOL)dragAndDropAllowLongPress
{
  return 1;
}

- (id)occurrenceAtPoint:(CGPoint)a3
{
  void *v3;
  void *v4;
  CGPoint v6;

  v6 = CGPointZero;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController _weekViewAtPoint:pointInWeek:](self, "_weekViewAtPoint:pointInWeek:", &v6, a3.x, a3.y));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "occurrenceAtPoint:", v6));

  return v4;
}

- (BOOL)dragAndDropIsCurrentlyScrubbing
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventViewController](self, "shownEventViewController"));
  v3 = v2 != 0;

  return v3;
}

- (void)draggedOccurrenceWasCancelled:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;

  y = a4.y;
  x = a4.x;
  if ((objc_msgSend(a3, "isNew") & 1) == 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController _weekViewAtPoint:pointInWeek:](self, "_weekViewAtPoint:pointInWeek:", 0, x, y));
    objc_msgSend(v7, "reloadData");

  }
}

- (void)selectOccurrence:(id)a3 inWeek:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  unsigned __int8 v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  NSMutableArray *v18;
  NSMutableArray *weeksContainingSelectedOccurrences;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(LargeMonthWeekView);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    if (v6)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectedOccurrence"));
      if (v11 == v6)
      {
        v12 = -[NSMutableArray containsObject:](self->_weeksContainingSelectedOccurrences, "containsObject:", v9);

        if ((v12 & 1) != 0)
          goto LABEL_20;
      }
      else
      {

      }
    }
    -[CUIKCalendarModel setSelectedOccurrence:](self->super.super.super._model, "setSelectedOccurrence:", v6);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = self->_weeksContainingSelectedOccurrences;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "setSelectedOccurrence:", 0, (_QWORD)v20);
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }

    -[NSMutableArray removeAllObjects](self->_weeksContainingSelectedOccurrences, "removeAllObjects");
    if (!self->_weeksContainingSelectedOccurrences)
    {
      v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      weeksContainingSelectedOccurrences = self->_weeksContainingSelectedOccurrences;
      self->_weeksContainingSelectedOccurrences = v18;

    }
    if (v9)
      -[NSMutableArray addObject:](self->_weeksContainingSelectedOccurrences, "addObject:", v9);
    if (v6)
      objc_msgSend(v9, "setSelectedOccurrence:", v6);
  }
  else
  {
    v9 = 0;
  }
LABEL_20:

}

- (void)showDetailsForDraggedOccurrence:(id)a3 inWeekView:(id)a4 onDay:(id)a5 creationMethod:(unint64_t)a6
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class(LargeMonthWeekView);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
    -[LargeMonthViewController _showEventDetailsForOccurrence:inWeek:onDay:creationMethod:](self, "_showEventDetailsForOccurrence:inWeek:onDay:creationMethod:", v12, v9, v10, 1);

}

- (void)showEditorForNewDraggedEvent:(id)a3 inWeek:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v9 = a4;
  v6 = a3;
  v7 = objc_opt_class(LargeMonthWeekView);
  if ((objc_opt_isKindOfClass(v9, v7) & 1) != 0)
    v8 = v9;
  else
    v8 = 0;
  -[LargeMonthViewController _showEventDetailsForOccurrence:inWeek:onDay:creationMethod:](self, "_showEventDetailsForOccurrence:inWeek:onDay:creationMethod:", v6, v8, 0, 1);

}

- (void)dragAndDropRequestsPresentationOfViewController:(id)a3
{
  id v4;
  void *v5;
  UnadaptableNavigationController *v6;

  v4 = a3;
  v6 = -[UnadaptableNavigationController initWithRootViewController:]([UnadaptableNavigationController alloc], "initWithRootViewController:", v4);

  -[UnadaptableNavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController currentPresentationController](self, "currentPresentationController"));
  objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

}

- (BOOL)isDraggingOccurrence
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MonthViewController draggedOccurrenceView](self, "draggedOccurrenceView"));
  v3 = v2 != 0;

  return v3;
}

- (id)_weekViewAtPoint:(CGPoint)a3 pointInWeek:(CGPoint *)a4
{
  id v4;
  _QWORD v6[6];
  CGPoint v7;
  CGPoint *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_100058834;
  v13 = sub_100058844;
  v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005E75C;
  v6[3] = &unk_1001B3218;
  v7 = a3;
  v6[4] = self;
  v6[5] = &v9;
  v8 = a4;
  -[InfiniteScrollViewController enumerateScrollViewSubviews:](self, "enumerateScrollViewSubviews:", v6);
  v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v4;
}

- (void)handleCloseKeyCommand
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventEditViewController](self, "shownEventEditViewController"));
  if (v3)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LargeMonthViewController shownEventViewController](self, "shownEventViewController"));

    if (v4)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10005E8DC;
      v5[3] = &unk_1001B2538;
      v5[4] = self;
      -[LargeMonthViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationBarDisplayedDate, 0);
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_weeksContainingSelectedOccurrences, 0);
  objc_storeStrong((id *)&self->_animatableDayBackgrounds, 0);
  objc_storeStrong((id *)&self->_animatableGridLines, 0);
  objc_storeStrong((id *)&self->_weekendDayBackgrounds, 0);
  objc_storeStrong((id *)&self->_verticalGridLines, 0);
  objc_storeStrong((id *)&self->_tappedDay, 0);
  objc_storeStrong((id *)&self->_eventBeingInspected, 0);
}

@end
