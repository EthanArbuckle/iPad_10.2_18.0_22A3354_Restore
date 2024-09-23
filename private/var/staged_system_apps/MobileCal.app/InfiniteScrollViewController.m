@implementation InfiniteScrollViewController

- (InfiniteScrollViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5
{
  id v9;
  InfiniteScrollViewController *v10;
  InfiniteScrollViewController *v11;
  NSMutableArray *v12;
  NSMutableArray *reusableViews;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)InfiniteScrollViewController;
  v10 = -[MainViewController initWithWindow:model:](&v15, "initWithWindow:model:", a5, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_startingDate, a3);
    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    reusableViews = v11->_reusableViews;
    v11->_reusableViews = v12;

  }
  return v11;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  EKCalendarDate *startingDate;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)InfiniteScrollViewController;
  v3 = -[InfiniteScrollViewController description](&v11, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  startingDate = self->_startingDate;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_views, "count")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->_reusableViews, "count")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@; startingDate: [%@], model: [%@], views: [%@], _reusableViews: [%@]"),
                   v4,
                   startingDate,
                   v6,
                   v7,
                   v8));

  return (NSString *)v9;
}

- (id)allViews
{
  return self->_views;
}

- (void)loadView
{
  _InfiniteScrollViewController *v3;
  UIScrollView *v4;
  UIScrollView *scrollView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = objc_alloc_init((Class)UIView);
  objc_msgSend(v10, "setAutoresizingMask:", 18);
  -[InfiniteScrollViewController setView:](self, "setView:", v10);
  v3 = objc_alloc_init(_InfiniteScrollViewController);
  -[_InfiniteScrollViewController setDelegate:](v3, "setDelegate:", self);
  v4 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  -[_InfiniteScrollViewController setView:](v3, "setView:", v7);

  -[InfiniteScrollViewController addChildViewController:](self, "addChildViewController:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v8, "addSubview:", v9);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)InfiniteScrollViewController;
  -[InfiniteScrollViewController viewDidLoad](&v12, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v3, "setClipsToBounds:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v4, "setContentSize:", 200.0, 400000.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v5, "setShowsHorizontalScrollIndicator:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v6, "setShowsVerticalScrollIndicator:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v7, "setScrollsToTop:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v9, "setBackgroundColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v10, "setBounces:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v11, "setDelegate:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)InfiniteScrollViewController;
  -[InfiniteScrollViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subviews"));
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    -[InfiniteScrollViewController _setUpInitialViewWithDate:](self, "_setUpInitialViewWithDate:", self->_startingDate);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  self->_viewIsVisible = 1;
  v3.receiver = self;
  v3.super_class = (Class)InfiniteScrollViewController;
  -[MainViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)InfiniteScrollViewController;
  -[InfiniteScrollViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  self->_viewIsVisible = 0;
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
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  self->_futureSize = a3;
  self->_useFutureSize = 1;
  v7 = a4;
  if (-[InfiniteScrollViewController isViewLoaded](self, "isViewLoaded"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController view](self, "view"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));

    if (v9)
      -[InfiniteScrollViewController adjustLoadedViewRange](self, "adjustLoadedViewRange");
  }
  v12.receiver = self;
  v12.super_class = (Class)InfiniteScrollViewController;
  -[MainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v10[4] = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004A8C4;
  v11[3] = &unk_1001B2C38;
  v11[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004A9C8;
  v10[3] = &unk_1001B2C38;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, v10);

}

- (void)_setUpInitialViewWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSMutableArray *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  NSMutableArray *views;
  void *v32;
  double v33;
  double v34;
  void *v35;
  NSMutableArray *v36;
  NSMutableArray *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  id v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeZone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timeZone"));
  v9 = objc_msgSend(v5, "isEqualToTimeZone:", v8);

  if ((v9 & 1) == 0)
  {
    v10 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeZone"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "calendar"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timeZone"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
      *(_DWORD *)buf = 138412546;
      v56 = v13;
      v57 = 2112;
      v58 = v17;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fixing mismatched timezone on date for reloading infinite scroll view (received %@, UI showing %@).", buf, 0x16u);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "calendar"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "timeZone"));
    v22 = objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v18, v21));

    v4 = (id)v22;
  }
  v23 = objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController view](self, "view"));
  if (v23)
  {
    v24 = (void *)v23;
    v25 = -[NSMutableArray count](self->_views, "count");

    if (v25)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v26 = self->_views;
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v51;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v51 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v30), "removeFromSuperview", (_QWORD)v50);
            v30 = (char *)v30 + 1;
          }
          while (v28 != v30);
          v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
        }
        while (v28);
      }

      views = self->_views;
      self->_views = 0;

      -[NSMutableArray removeAllObjects](self->_reusableViews, "removeAllObjects");
    }
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView", (_QWORD)v50));
  objc_msgSend(v32, "contentSize");
  v34 = v33 * 0.5;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v35, "setContentOffset:", 0.0, v34);

  v36 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
  v37 = self->_views;
  self->_views = v36;

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController createInitialViewForDate:](self, "createInitialViewForDate:", v4));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v39, "addSubview:", v38);

  -[NSMutableArray addObject:](self->_views, "addObject:", v38);
  objc_msgSend(v38, "setAutoresizingMask:", 2);
  objc_msgSend(v38, "setHidden:", 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v40, "bounds");
  objc_msgSend(v38, "sizeThatFits:", v41, v42);
  v44 = v43;
  v46 = v45;

  objc_msgSend(v38, "frame");
  objc_msgSend(v38, "setFrame:", CGPointZero.x, CGPointZero.y, v44, v46);
  v47 = -[InfiniteScrollViewController _addNewTopView](self, "_addNewTopView");
  v48 = -[InfiniteScrollViewController _addNewBottomView](self, "_addNewBottomView");
  -[InfiniteScrollViewController reloadDataForAllViews](self, "reloadDataForAllViews");
  -[InfiniteScrollViewController _layoutInitialSubviews](self, "_layoutInitialSubviews");
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[EKCalendarDate date](self->_startingDate, "date"));
  -[InfiniteScrollViewController showDate:animated:](self, "showDate:animated:", v49, 0);

}

- (void)_layoutInitialSubviews
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  char v8;
  void *i;
  void *v10;
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
  void *v22;
  void *v23;
  NSMutableArray *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];

  if (-[NSMutableArray count](self->_views, "count"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v3 = self->_views;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v35;
      v7 = 0.0;
      v8 = 1;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v6)
            objc_enumerationMutation(v3);
          v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "frame");
          v12 = v11;
          v14 = v13;
          v16 = v15;
          v17 = v7;
          if ((v8 & 1) == 0)
          {
            objc_msgSend(v10, "topInset");
            v17 = v7 - v18;
          }
          objc_msgSend(v10, "setFrame:", v12, v17, v14, v16);
          objc_msgSend(v10, "frame");
          v20 = v19;
          v21 = 0.0;
          if ((v8 & 1) == 0)
            objc_msgSend(v10, "topInset", 0.0);
          v8 = 0;
          v7 = v7 + v20 - v21;
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        v8 = 0;
      }
      while (v5);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v22, "contentOffset");

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_views, "objectAtIndex:", (unint64_t)-[NSMutableArray count](self->_views, "count") >> 1));
    objc_msgSend(v23, "frame");
    objc_msgSend(v23, "frame");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v24 = self->_views;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v29, "frame", (_QWORD)v30);
          objc_msgSend(v29, "setFrame:");
        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v26);
    }

  }
}

- (void)resizeAllViews
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

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_views;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "sizeToFit", (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[InfiniteScrollViewController _layoutInitialSubviews](self, "_layoutInitialSubviews");
}

- (void)reinitializeAllViewsWithCalendarDate:(id)a3
{
  EKCalendarDate *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  EKCalendarDate *startingDate;
  EKCalendarDate *v11;
  id v12;

  v4 = (EKCalendarDate *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

  if (v6
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController navigationController](self, "navigationController")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view")),
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window")),
        v9,
        v8,
        !v12))
  {
    v12 = 0;
    v7 = 1;
  }
  else
  {
    EKUIPushFallbackSizingContextWithViewHierarchy(v12);
    v7 = 0;
  }
  -[NSMutableArray removeAllObjects](self->_reusableViews, "removeAllObjects");
  startingDate = self->_startingDate;
  self->_startingDate = v4;
  v11 = v4;

  -[InfiniteScrollViewController _setUpInitialViewWithDate:](self, "_setUpInitialViewWithDate:", v11);
  -[InfiniteScrollViewController adjustLoadedViewRange](self, "adjustLoadedViewRange");
  if ((v7 & 1) == 0)
    EKUIPopFallbackSizingContextWithViewHierarchy(v12);

}

- (void)_recenterContentIfNeeded
{
  -[InfiniteScrollViewController _recenterContentIfNeededWithForce:](self, "_recenterContentIfNeededWithForce:", 0);
}

- (void)_recenterContentIfNeededWithForce:(BOOL)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  NSMutableArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  if (!-[InfiniteScrollViewController suppressViewAdjustments](self, "suppressViewAdjustments"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v5, "contentOffset");
    v7 = v6;
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v10, "contentSize");
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v13, "bounds");
    v15 = (v12 - v14) * 0.5;

    if (a3 || vabdd_f64(v9, v15) > v12 * 0.25)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v16, "setContentOffset:", v7, v15);

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v17 = self->_views;
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v22, "center", (_QWORD)v23);
            objc_msgSend(v22, "setCenter:");
          }
          v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v19);
      }

    }
  }
}

- (void)adjustLoadedViewRange
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
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double MinY;
  double MaxY;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  NSMutableArray *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  void *v40;
  NSMutableArray *v41;
  NSMutableArray *views;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  double v47;
  NSObject *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint8_t buf[16];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  if (!-[InfiniteScrollViewController suppressViewAdjustments](self, "suppressViewAdjustments"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    -[InfiniteScrollViewController _visibleSize](self, "_visibleSize");
    v5 = v4;
    -[InfiniteScrollViewController subviewBufferExtensionMultiplier](self, "subviewBufferExtensionMultiplier");
    v7 = v6;
    objc_msgSend(v3, "contentOffset");
    v9 = v8;
    objc_msgSend(v3, "contentOffset");
    v11 = v10;
    v12 = objc_alloc_init((Class)NSMutableSet);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_views, "firstObject"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_views, "lastObject"));
    if (!v13)
      goto LABEL_37;
    v15 = v9 - v5 * v7;
    v16 = v5 * v7 + v5 + v11;
    objc_msgSend(v13, "frame");
    MinY = CGRectGetMinY(v68);
    objc_msgSend(v14, "frame");
    MaxY = CGRectGetMaxY(v69);
    if (v16 < MinY)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "calendarDate", MaxY));
      objc_msgSend(v13, "frame");
      v21 = v20;
      objc_msgSend(v13, "topInset");
      v23 = v22;
      v24 = MinY;
      goto LABEL_7;
    }
    if (v15 > MaxY)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "calendarDate"));
      objc_msgSend(v14, "frame");
      v21 = v25;
      objc_msgSend(v14, "topInset");
      v23 = v26;
      objc_msgSend(v14, "frame");
      v24 = CGRectGetMinY(v70);
      do
      {
LABEL_7:
        while (1)
        {
          v27 = v16 >= MinY
              ? objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController calendarDateForSubviewBelowSubviewWithCalendarDate:](self, "calendarDateForSubviewBelowSubviewWithCalendarDate:", v19)): objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController calendarDateForSubviewAboveSubviewWithCalendarDate:](self, "calendarDateForSubviewAboveSubviewWithCalendarDate:", v19));
          v28 = (void *)v27;

          -[InfiniteScrollViewController heightForSubviewWithCalendarDate:](self, "heightForSubviewWithCalendarDate:", v28);
          v30 = v29;
          -[InfiniteScrollViewController topInsetForSubviewWithCalendarDate:](self, "topInsetForSubviewWithCalendarDate:", v28);
          v32 = v23 + v24 - v30;
          v33 = v21 + v24 - v31;
          v24 = v16 >= MinY ? v21 + v24 - v31 : v23 + v24 - v30;
          if (v16 >= MinY)
            break;
          v19 = v28;
          v23 = v31;
          v21 = v30;
          if (v32 <= v15)
            goto LABEL_17;
        }
        v19 = v28;
        v23 = v31;
        v21 = v30;
      }
      while (v30 + v33 < v16);
LABEL_17:
      if (-[NSMutableArray count](self->_views, "count"))
      {
        v59 = v14;
        v60 = v13;
        v61 = v3;
        v34 = -[InfiniteScrollViewController maximumCachedReusableViews](self, "maximumCachedReusableViews");
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v35 = self->_views;
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v64;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(_QWORD *)v64 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
              if ((unint64_t)-[NSMutableArray count](self->_reusableViews, "count") <= v34)
              {
                -[NSMutableArray addObject:](self->_reusableViews, "addObject:", v40);
                objc_msgSend(v40, "setHidden:", 1);
              }
              else
              {
                objc_msgSend(v40, "removeFromSuperview");
              }
            }
            v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
          }
          while (v37);
        }

        v41 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
        views = self->_views;
        self->_views = v41;

        v3 = v61;
        v14 = v59;
        v13 = v60;
      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController createInitialViewForDate:](self, "createInitialViewForDate:", v28));
      objc_msgSend(v43, "setHidden:", 0);
      -[NSMutableArray addObject:](self->_views, "addObject:", v43);
      objc_msgSend(v3, "addSubview:", v43);
      -[InfiniteScrollViewController _visibleSize](self, "_visibleSize");
      objc_msgSend(v43, "sizeThatFits:");
      objc_msgSend(v3, "frame");
      objc_msgSend(v43, "setFrame:");
      v44 = v43;

      v14 = v44;
      v13 = v44;
    }
    if (v13 && v14)
    {
      objc_msgSend(v13, "frame");
      if (CGRectGetMinY(v71) > v15)
      {
        while (1)
        {
          v45 = v13;
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController _addNewTopView](self, "_addNewTopView"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_views, "firstObject"));

          if (!v46)
            break;
          objc_msgSend(v46, "frame");
          if (v47 < 0.0001)
            break;
          objc_msgSend(v12, "addObject:", v46);

          objc_msgSend(v13, "frame");
          if (CGRectGetMinY(v72) <= v15)
            goto LABEL_40;
        }

      }
LABEL_40:
      objc_msgSend(v14, "frame");
      if (CGRectGetMaxY(v73) < v16)
      {
        while (1)
        {
          v49 = v14;
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController _addNewBottomView](self, "_addNewBottomView"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_views, "lastObject"));

          if (!v50)
            break;
          objc_msgSend(v50, "frame");
          if (v51 < 0.0001)
            break;
          objc_msgSend(v12, "addObject:", v50);

          objc_msgSend(v14, "frame");
          if (CGRectGetMaxY(v74) >= v16)
            goto LABEL_46;
        }

      }
LABEL_46:
      if (!self->_isRelayingOut)
      {
        if (!self->_viewCullingDisabledForScrollAnimation)
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_views, "firstObject"));

          if (-[NSMutableArray count](self->_views, "count"))
          {
            while (1)
            {
              objc_msgSend(v52, "frame");
              if (CGRectGetMaxY(v75) >= v15)
                break;
              -[InfiniteScrollViewController _removeTopView](self, "_removeTopView");
              v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_views, "firstObject"));

              v52 = v13;
              if (!-[NSMutableArray count](self->_views, "count"))
                goto LABEL_56;
            }
          }
          v13 = v52;
LABEL_56:
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_views, "lastObject"));

          if (-[NSMutableArray count](self->_views, "count"))
          {
            while (1)
            {
              objc_msgSend(v53, "frame");
              if (CGRectGetMinY(v76) <= v16)
                break;
              -[InfiniteScrollViewController _removeBottomView](self, "_removeBottomView");
              v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_views, "lastObject"));

              v53 = v14;
              if (!-[NSMutableArray count](self->_views, "count"))
                goto LABEL_61;
            }
          }
          v14 = v53;
LABEL_61:
          if (self->_viewIsVisible
            && -[InfiniteScrollViewController shouldUpdatePreferredReloadDates](self, "shouldUpdatePreferredReloadDates")&& (objc_opt_respondsToSelector(v14, "endCalendarDate") & 1) != 0)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "calendarDate"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "date"));

            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endCalendarDate"));
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "date"));

            v58 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
            objc_msgSend(v58, "setPreferredReloadStartDate:endDate:", v55, v57);

          }
        }
        -[InfiniteScrollViewController reloadDataForViews:](self, "reloadDataForViews:", v12);
        -[InfiniteScrollViewController didScroll](self, "didScroll");
      }
    }
    else
    {
LABEL_37:
      v48 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Didn't load required views in _adjustLoadedViewRange. It is possible that we are being torn down while reloading.", buf, 2u);
      }
    }

  }
}

- (BOOL)shouldUpdatePreferredReloadDates
{
  return 1;
}

- (void)reloadDataForAllViews
{
  -[InfiniteScrollViewController reloadDataForViews:](self, "reloadDataForViews:", self->_views);
}

- (void)reloadDataForViews:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "reloadData") & 1) != 0)
          objc_msgSend(v8, "reloadData");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  v4 = v3;
  -[UIScrollView frame](self->_scrollView, "frame");
  if (vabdd_f64(v4, v5) >= 2.22044605e-16)
  {
    -[UIScrollView contentSize](self->_scrollView, "contentSize");
    v7 = v6;
    -[UIScrollView frame](self->_scrollView, "frame");
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v8, v7);
  }
}

- (void)scrollViewSafeAreasDidChange
{
  -[InfiniteScrollViewController infiniteScrollViewSafeAreasDidChange](self, "infiniteScrollViewSafeAreasDidChange");
}

- (void)didEndScrolling
{
  -[InfiniteScrollViewController _recenterContentIfNeeded](self, "_recenterContentIfNeeded");
  if (self->_viewIsVisible)
  {
    if (-[InfiniteScrollViewController shouldUpdateSelectedDateWithCentralView](self, "shouldUpdateSelectedDateWithCentralView"))
    {
      -[InfiniteScrollViewController _updateSelectedDateWithTopView](self, "_updateSelectedDateWithTopView");
    }
  }
}

- (void)_updateSelectedDateWithTopView
{
  void *v3;
  void *v4;
  EKCalendarDate *v5;
  EKCalendarDate *lastKnownShownDate;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController firstViewOnScreen](self, "firstViewOnScreen"));
  if (v3)
  {
    v7 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDate"));
    -[CUIKCalendarModel setSelectedDate:](self->super._model, "setSelectedDate:", v4);

    v5 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "calendarDate"));
    lastKnownShownDate = self->_lastKnownShownDate;
    self->_lastKnownShownDate = v5;

    v3 = v7;
  }

}

- (BOOL)shouldUpdateSelectedDateWithCentralView
{
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  if (!-[InfiniteScrollViewController suppressViewAdjustments](self, "suppressViewAdjustments", a3))
    -[InfiniteScrollViewController didScroll](self, "didScroll");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[InfiniteScrollViewController setIsUserFingerDown:](self, "setIsUserFingerDown:", 1);
  -[InfiniteScrollViewController willBeginDragging](self, "willBeginDragging");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[InfiniteScrollViewController setIsUserFingerDown:](self, "setIsUserFingerDown:", 0);
  -[InfiniteScrollViewController didEndDraggingWillDecelerate:](self, "didEndDraggingWillDecelerate:", v4);
  if (!v4)
    -[InfiniteScrollViewController didEndScrolling](self, "didEndScrolling");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  -[InfiniteScrollViewController willEndDraggingWithVelocity:targetContentOffset:](self, "willEndDraggingWithVelocity:targetContentOffset:", a5, a4.x, a4.y);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  if (!-[InfiniteScrollViewController suppressViewAdjustments](self, "suppressViewAdjustments", a3))
  {
    self->_viewCullingDisabledForScrollAnimation = 0;
    -[InfiniteScrollViewController didEndScrolling](self, "didEndScrolling");
  }
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  if (-[InfiniteScrollViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (!self->_views)
    {
      -[InfiniteScrollViewController _setUpInitialViewWithDate:](self, "_setUpInitialViewWithDate:", self->_startingDate);
      -[InfiniteScrollViewController didLoadInitialViews](self, "didLoadInitialViews");
    }
    v3.receiver = self;
    v3.super_class = (Class)InfiniteScrollViewController;
    -[InfiniteScrollViewController viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  }
}

- (CGSize)_visibleSize
{
  CGFloat width;
  CGFloat height;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  if (self->_useFutureSize)
  {
    width = self->_futureSize.width;
    height = self->_futureSize.height;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v4, "bounds");
    width = v5;
    height = v6;

  }
  v7 = width;
  v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)insertViews:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *views;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", a3));
  views = self->_views;
  self->_views = v4;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_views;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "setHidden:", 0, (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
        objc_msgSend(v12, "addSubview:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (id)_addNewTopView
{
  void *v3;
  void *v4;
  id v5;
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
  CGFloat v16;
  double v17;
  CGRect v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_views, "firstObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDate"));
  v5 = -[InfiniteScrollViewController newTopViewAboveViewWithCalendarDate:](self, "newTopViewAboveViewWithCalendarDate:", v4);
  objc_msgSend(v5, "setAutoresizingMask:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "sendSubviewToBack:", v5);
  else
    objc_msgSend(v7, "insertSubview:atIndex:", v5, 0);

  objc_msgSend(v5, "setHidden:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v9, "bounds");
  objc_msgSend(v5, "sizeThatFits:", v10, v11);
  v13 = v12;
  v15 = v14;

  objc_msgSend(v5, "frame");
  objc_msgSend(v3, "frame");
  v16 = CGRectGetMinY(v19) - v15;
  objc_msgSend(v3, "topInset");
  objc_msgSend(v5, "setFrame:", 0.0, v16 + v17, v13, v15);
  -[NSMutableArray insertObject:atIndex:](self->_views, "insertObject:atIndex:", v5, 0);

  return v5;
}

- (id)_addNewBottomView
{
  void *v3;
  void *v4;
  id v5;
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
  double MaxY;
  double v17;
  CGRect v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_views, "lastObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDate"));
  v5 = -[InfiniteScrollViewController newBottomViewBelowViewWithCalendarDate:](self, "newBottomViewBelowViewWithCalendarDate:", v4);
  objc_msgSend(v5, "setAutoresizingMask:", 2);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    v8 = v7;
    if (v6)
      objc_msgSend(v7, "bringSubviewToFront:", v5);
    else
      objc_msgSend(v7, "addSubview:", v5);

    objc_msgSend(v5, "setHidden:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
    objc_msgSend(v9, "bounds");
    objc_msgSend(v5, "sizeThatFits:", v10, v11);
    v13 = v12;
    v15 = v14;

    objc_msgSend(v5, "frame");
    objc_msgSend(v3, "frame");
    MaxY = CGRectGetMaxY(v19);
    objc_msgSend(v5, "topInset");
    objc_msgSend(v5, "setFrame:", 0.0, MaxY - v17, v13, v15);
    -[NSMutableArray addObject:](self->_views, "addObject:", v5);
  }

  return v5;
}

- (void)_removeTopView
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_views, "firstObject"));
  v3 = -[NSMutableArray count](self->_reusableViews, "count");
  if (v3 <= (id)-[InfiniteScrollViewController maximumCachedReusableViews](self, "maximumCachedReusableViews"))
    -[NSMutableArray addObject:](self->_reusableViews, "addObject:", v4);
  else
    objc_msgSend(v4, "removeFromSuperview");
  -[NSMutableArray removeObjectAtIndex:](self->_views, "removeObjectAtIndex:", 0);
  objc_msgSend(v4, "setHidden:", 1);

}

+ (BOOL)_view:(id)a3 containsCalendarDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calendarDate"));
  v8 = objc_msgSend(v7, "compare:", v6);

  if (v8 == (id)1)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endCalendarDate"));
    v9 = objc_msgSend(v10, "compare:", v6) != (id)-1;

  }
  return v9;
}

- (void)_removeBottomView
{
  id v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_views, "lastObject"));
  v3 = -[NSMutableArray count](self->_reusableViews, "count");
  if (v3 <= (id)-[InfiniteScrollViewController maximumCachedReusableViews](self, "maximumCachedReusableViews"))
    -[NSMutableArray addObject:](self->_reusableViews, "addObject:", v4);
  else
    objc_msgSend(v4, "removeFromSuperview");
  -[NSMutableArray removeLastObject](self->_views, "removeLastObject");
  objc_msgSend(v4, "setHidden:", 1);

}

- (BOOL)isDateVisible:(id)a3
{
  id v4;
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
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  BOOL v20;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController firstViewOnScreen](self, "firstViewOnScreen"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController _lastViewOnScreen](self, "_lastViewOnScreen"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calendarDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endCalendarDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendarDateForEndOfDay"));

  objc_msgSend(v7, "absoluteTime");
  v11 = v10;
  objc_msgSend(v9, "absoluteTime");
  v13 = v12;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v15 = v14;
  v16 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "date"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));
    v22 = 138412802;
    v23 = v4;
    v24 = 2112;
    v25 = v18;
    v26 = 2112;
    v27 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Infinite scroll view determining if date %@ is visible. Onscreen dates: %@ - %@", (uint8_t *)&v22, 0x20u);

  }
  v20 = v15 <= v13 && v11 <= v15;

  return v20;
}

- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController firstViewOnScreen](self, "firstViewOnScreen"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController _lastViewOnScreen](self, "_lastViewOnScreen"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "calendarDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endCalendarDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "calendarDateForEndOfDay"));

  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "date"));
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "date"));

}

- (int64_t)subviewCount
{
  return (int64_t)-[NSMutableArray count](self->_views, "count");
}

- (void)showDate:(id)a3 animated:(BOOL)a4
{
  -[InfiniteScrollViewController showDate:animated:completionBlock:](self, "showDate:animated:completionBlock:", a3, a4, 0);
}

- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, _QWORD);
  NSString *const **v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *views;
  NSMutableArray *v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  id v42;
  BOOL v43;
  NSMutableArray *v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  NSString **v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _BOOL4 v81;
  void (**v82)(id, _QWORD);
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[5];
  id v87;
  void (**v88)(id, _QWORD);
  _QWORD v89[7];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  void *v101;
  _BYTE v102[128];

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = &EKEventStoreChangedNotification_ptr;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "eventStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timeZone"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[EKCalendarDate calendarDateWithDate:timeZone:](EKCalendarDate, "calendarDateWithDate:timeZone:", v8, v13));

  if (-[InfiniteScrollViewController isViewLoaded](self, "isViewLoaded"))
  {
    views = self->_views;
    if (views)
    {
      v85 = v8;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v16 = views;
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v91;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v91 != v18)
              objc_enumerationMutation(v16);
            v20 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend((id)objc_opt_class(self), "_view:containsCalendarDate:", v20, v14))
            {
              v17 = v20;
              goto LABEL_15;
            }
          }
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
          if (v17)
            continue;
          break;
        }
LABEL_15:
        v10 = &EKEventStoreChangedNotification_ptr;
      }

      v21 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v22 = (void *)v21;
      if (v17)
      {
        v23 = 0;
        goto LABEL_55;
      }
      v84 = (void *)v21;
      v81 = v6;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_views, "firstObject"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_views, "lastObject"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "calendarDate"));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "date"));

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "calendarDate"));
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "date"));

      v83 = (void *)v27;
      v30 = objc_msgSend(v85, "compare:", v27);
      v82 = v9;
      v79 = v25;
      v80 = v24;
      if (v30 == (id)1)
      {
        v34 = (void *)v29;
        if (objc_msgSend(v85, "compare:", v29) == (id)-1)
        {
          v31 = v84;
          v47 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v95 = v85;
            v96 = 2112;
            v97 = v83;
            v98 = 2112;
            v99 = v29;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "Target view is not loaded. No view for date %@ in range %@ to %@", buf, 0x20u);
          }
          goto LABEL_46;
        }
        v31 = v84;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "calendarDate"));
        v36 = -[InfiniteScrollViewController shouldAnimateScrollToDate:fromClosestDate:](self, "shouldAnimateScrollToDate:fromClosestDate:", v14, v35);

        if (!v36)
        {
LABEL_46:
          if (self->_reinitializingViewsForNewDate)
          {
            if (-[NSMutableArray count](self->_views, "count"))
              v17 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_views, "objectAtIndexedSubscript:", (unint64_t)-[NSMutableArray count](self->_views, "count") >> 1));
            else
              v17 = 0;
            v48 = (void *)kCalUILogHandle;
            v9 = v82;
            if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
            {
              v49 = v48;
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "calendarDate"));
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "date"));
              *(_DWORD *)buf = 138544130;
              v95 = v85;
              v96 = 2114;
              v97 = v83;
              v98 = 2114;
              v99 = (uint64_t)v34;
              v100 = 2114;
              v101 = v51;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "No view for date %{public}@. Loaded range is %{public}@ to %{public}@. Not reinitalizing views because we were already doing that, so scrolling to %{public}@ instead", buf, 0x2Au);

              v10 = &EKEventStoreChangedNotification_ptr;
            }
            v23 = 0;
            v6 = v81;
            v22 = v84;
          }
          else
          {
            self->_reinitializingViewsForNewDate = 1;
            -[InfiniteScrollViewController reinitializeAllViewsWithCalendarDate:](self, "reinitializeAllViewsWithCalendarDate:", v14);
            v23 = 0;
            v17 = 0;
            self->_reinitializingViewsForNewDate = 0;
            v22 = v31;
            v9 = v82;
            v6 = v81;
          }
          goto LABEL_54;
        }
      }
      else
      {
        v31 = v84;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "calendarDate"));
        v33 = -[InfiniteScrollViewController shouldAnimateScrollToDate:fromClosestDate:](self, "shouldAnimateScrollToDate:fromClosestDate:", v14, v32);

        v34 = (void *)v29;
        if ((v33 & 1) == 0)
          goto LABEL_46;
      }
      v78 = v34;
      v37 = 0;
      do
      {
        if (v30 == (id)1)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController _addNewBottomView](self, "_addNewBottomView"));
          v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "endCalendarDate"));
        }
        else
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController _addNewTopView](self, "_addNewTopView"));
          v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "calendarDate"));
        }
        v40 = (void *)v39;

        if (v38)
          objc_msgSend(v31, "addObject:", v38);
        v41 = objc_msgSend((id)objc_opt_class(self), "_view:containsCalendarDate:", v38, v14);
        v42 = objc_msgSend(v14, "compare:", v40);
        v43 = v42 == (id)-1 && v30 == (id)1;

        if (v42 == (id)1 && v30 != (id)1)
          break;
        if (!v42)
          break;
        if (v43)
          break;
        v37 = v40;
      }
      while (!v41);
      v45 = self->_views;
      v6 = v81;
      if (v30 == (id)1)
        v46 = objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v45, "lastObject"));
      else
        v46 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v45, "firstObject"));
      v17 = (id)v46;
      v22 = v31;
      v34 = v78;

      v23 = 1;
      v9 = v82;
      v10 = &EKEventStoreChangedNotification_ptr;
LABEL_54:

      if (!v17)
      {
        if (v9)
          v9[2](v9, 0);
        v17 = 0;
        goto LABEL_74;
      }
LABEL_55:
      objc_msgSend(v17, "frame");
      v53 = v52;
      v55 = v54;
      -[InfiniteScrollViewController showDateVerticalOffsetForDate:](self, "showDateVerticalOffsetForDate:", v14);
      v57 = v56 + v55;
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v58, "safeAreaInsets");
      v60 = v57 - v59;

      v63 = CalRoundToScreenScale(v61, v62, v60);
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
      objc_msgSend(v64, "contentOffset");
      v66 = v63 - v65;

      v69 = -v66;
      if (v66 >= 0.0)
        v69 = v66;
      if (v6 && v69 < 1.0)
      {
        v70 = (NSString **)v10[135];
        v71 = CUIKTodayDate(v67, v68);
        v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[CUIKCalendarModel calendar](self->super._model, "calendar"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "timeZone"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "calendarDateWithDate:timeZone:", v72, v74));

        v76 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForDate:](self, "subviewForDate:", v75));
        if ((objc_opt_respondsToSelector(v76, "pulseTodayCircle") & 1) != 0)
          objc_msgSend(v76, "pulseTodayCircle");
        if (v9)
          v9[2](v9, 1);

      }
      else
      {
        if (!v6)
        {
          v77 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView", v69));
          objc_msgSend(v77, "setContentOffset:animated:", 0, v53, v63);

          -[InfiniteScrollViewController adjustLoadedViewRange](self, "adjustLoadedViewRange");
          v8 = v85;
          if (v9)
            v9[2](v9, 1);
          -[InfiniteScrollViewController didEndScrolling](self, "didEndScrolling");
          -[InfiniteScrollViewController reloadDataForViews:](self, "reloadDataForViews:", v22);
          goto LABEL_75;
        }
        if (v23)
          self->_viewCullingDisabledForScrollAnimation = 1;
        v89[0] = _NSConcreteStackBlock;
        v89[1] = 3221225472;
        v89[2] = sub_10004D060;
        v89[3] = &unk_1001B2810;
        v89[4] = self;
        *(double *)&v89[5] = v53;
        *(double *)&v89[6] = v63;
        v86[0] = _NSConcreteStackBlock;
        v86[1] = 3221225472;
        v86[2] = sub_10004D0A4;
        v86[3] = &unk_1001B2E08;
        v86[4] = self;
        v88 = v9;
        v87 = v22;
        +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v89, v86);

      }
LABEL_74:
      v8 = v85;
LABEL_75:
      objc_storeStrong((id *)&self->_lastKnownShownDate, v14);

      goto LABEL_76;
    }
  }
  objc_storeStrong((id *)&self->_startingDate, v14);
  if (v9)
    v9[2](v9, 0);
LABEL_76:

}

- (id)subviewForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  NSMutableArray *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  CGPoint v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController view](self, "view"));
  v8 = objc_msgSend(v6, "convertPoint:fromView:", v7, x, y);
  v11 = CalRoundPointToScreenScale(v8, v9, v10);
  v13 = v12;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = self->_views;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v18, "frame", (_QWORD)v20);
        v25.x = v11;
        v25.y = v13;
        if (CGRectContainsPoint(v26, v25))
        {
          v15 = v18;
          goto LABEL_11;
        }
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_11:

  return v15;
}

- (id)subviewForDate:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController view](self, "view"));
  objc_msgSend(v5, "layoutIfNeeded");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_views;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_opt_class(self);
        if ((objc_msgSend(v12, "_view:containsCalendarDate:", v11, v4, (_QWORD)v15) & 1) != 0)
        {
          v13 = v11;
          goto LABEL_11;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)centerViewOnScreen
{
  void *v3;
  double v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", 0.0, v4 * 0.5));

  return v5;
}

- (id)firstViewOnScreen
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v3, "adjustedContentInset");
  v5 = v4;

  return -[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", 0.0, v5);
}

- (id)_lastViewOnScreen
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v3, "frame");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v6, "adjustedContentInset");
  v8 = v5 - v7;

  return -[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", 0.0, v8);
}

- (id)firstView
{
  return -[NSMutableArray firstObject](self->_views, "firstObject");
}

- (id)dateOfCenterViewOnScreen
{
  void *v3;
  EKCalendarDate *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController centerViewOnScreen](self, "centerViewOnScreen"));
  v4 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendarDate"));
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController firstViewOnScreen](self, "firstViewOnScreen"));
    v4 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calendarDate"));

    if (!v4)
      v4 = self->_startingDate;
  }

  return v4;
}

- (id)dateOfCenterViewInBuffer
{
  EKCalendarDate *v3;

  v3 = (EKCalendarDate *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController dateOfViewInBufferIndexRelativeToCenter:](self, "dateOfViewInBufferIndexRelativeToCenter:", 0));
  if (!v3)
    v3 = self->_startingDate;
  return v3;
}

- (id)dateOfViewInBufferIndexRelativeToCenter:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (unint64_t)-[NSMutableArray count](self->_views, "count");
  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_views, "objectAtIndex:", a3 + (v5 >> 1)))) != 0)
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarDate"));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)enumerateScrollViewSubviews:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = (void (**)(id, uint64_t, char *))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_views;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11)
        break;
      if (v7 == (id)++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (unint64_t)maximumCachedReusableViews
{
  return 0;
}

- (id)dequeueReusableView
{
  void *v3;

  if (-[NSMutableArray count](self->_reusableViews, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_reusableViews, "firstObject"));
    -[NSMutableArray removeObjectAtIndex:](self->_reusableViews, "removeObjectAtIndex:", 0);
    if ((objc_opt_respondsToSelector(v3, "prepareForReuse") & 1) != 0)
      objc_msgSend(v3, "prepareForReuse");
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)showSelectedDateIfNeeded
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedDate"));
  v5 = objc_msgSend(v4, "isEqual:", self->_lastKnownShownDate);

  if ((v5 & 1) == 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MainViewController model](self, "model"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
    -[InfiniteScrollViewController showDate:animated:](self, "showDate:animated:", v7, 0);

  }
}

- (CGPoint)nearestMajorBoundaryForPoint:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[InfiniteScrollViewController nearestMajorBoundaryForPoint:date:](self, "nearestMajorBoundaryForPoint:date:", 0, a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)nearestMajorBoundaryForPoint:(CGPoint)a3 date:(id *)a4
{
  double y;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  int v16;
  NSMutableArray *views;
  uint64_t v18;
  void *v19;
  double MinY;
  double MaxY;
  double v22;
  double v23;
  void *v24;
  void *v25;
  char v26;
  char v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  NSObject *v43;
  id v44;
  void *v45;
  double v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  NSObject *v50;
  uint32_t v51;
  uint64_t v52;
  double v53;
  double v54;
  id *v55;
  CGFloat x;
  void *v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  void *v61;
  CGPoint result;
  CGRect v63;
  CGRect v64;

  y = a3.y;
  x = a3.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v8;

  v10 = 0.0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", 0.0, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController view](self, "view"));
  objc_msgSend(v12, "convertPoint:fromView:", v13, 0.0, v9);
  v15 = v14;

  LOBYTE(v16) = v15 > y;
  if (!v11)
  {
    views = self->_views;
    if (v15 <= y)
      v18 = objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](views, "lastObject"));
    else
      v18 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](views, "firstObject"));
    v11 = (void *)v18;
  }
  v55 = a4;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "calendarDate"));
  objc_msgSend(v11, "frame");
  MinY = CGRectGetMinY(v63);
  objc_msgSend(v11, "frame");
  MaxY = CGRectGetMaxY(v64);
  v57 = v11;
  objc_msgSend(v11, "topInset");
  v23 = v22;
  v24 = 0;
  v25 = 0;
  v26 = 0;
LABEL_7:
  if (y >= MinY && y <= MaxY)
  {
    v29 = objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController pastMajorBoundaryCalendarDateForCalendarDate:](self, "pastMajorBoundaryCalendarDateForCalendarDate:", v19));

    v30 = objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController futureMajorBoundaryCalendarDateForCalendarDate:](self, "futureMajorBoundaryCalendarDateForCalendarDate:", v19));
    LOBYTE(v16) = 1;
    v25 = (void *)v29;
    v24 = (void *)v30;
    goto LABEL_15;
  }
  if ((v16 & 1) != 0)
  {
    if (y <= MaxY)
    {
      v28 = 0;
LABEL_28:
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController calendarDateForSubviewAboveSubviewWithCalendarDate:](self, "calendarDateForSubviewAboveSubviewWithCalendarDate:", v19));
      v16 = 1;
      goto LABEL_32;
    }
    v52 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v19;
      v49 = "Major boundary calculation failsafe triggered while searching upward.  Subview frame exceeds target point.  "
            "subviewCalendarDate: [%@]";
      goto LABEL_60;
    }
    goto LABEL_62;
  }
  if (y < MinY)
  {
    v52 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v19;
      v49 = "Major boundary calculation failsafe triggered while searching downward.  Subview frame exceeds target point."
            "  subviewCalendarDate: [%@]";
LABEL_60:
      v50 = v52;
      v51 = 12;
LABEL_61:
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, v49, buf, v51);
    }
LABEL_62:
    v44 = 0;
LABEL_63:
    v42 = v19;
LABEL_64:
    v47 = v57;
    goto LABEL_65;
  }
  v28 = 0;
  while (1)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController calendarDateForSubviewBelowSubviewWithCalendarDate:](self, "calendarDateForSubviewBelowSubviewWithCalendarDate:", v19));
    v16 = 0;
LABEL_32:
    -[InfiniteScrollViewController heightForSubviewWithCalendarDate:](self, "heightForSubviewWithCalendarDate:", v37);
    v39 = v38;
    -[InfiniteScrollViewController topInsetForSubviewWithCalendarDate:](self, "topInsetForSubviewWithCalendarDate:", v37);
    v41 = v40;
    if (v16)
      MinY = v23 + MinY - v39;
    else
      MinY = MaxY - v40;
    v42 = v37;

    if ((uint64_t)objc_msgSend(v42, "year") > 9999 || (uint64_t)objc_msgSend(v42, "year") <= -10000)
    {
      v43 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v42;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Major boundary calculation failsafe triggered while trying to find the subview matching a nearest major boundary calendar date. It is possible that nextSubviewHeight is negative, or other unexpected case happened. subviewCalendarDate: [%@]", buf, 0xCu);
      }

      v44 = 0;
      goto LABEL_64;
    }
    MaxY = v39 + MinY;

    v23 = v41;
    v19 = v42;
    if ((v28 & 1) == 0)
      goto LABEL_7;
LABEL_15:
    if ((v26 & 1) != 0)
    {
      v26 = 1;
    }
    else if ((v31 = objc_msgSend(v25, "month"), v31 == objc_msgSend(v19, "month"))
           && (v32 = objc_msgSend(v25, "day"), v32 == objc_msgSend(v19, "day"))
           || (v33 = objc_msgSend(v25, "compare:", v19)) == 0)
    {
      LOBYTE(v16) = 0;
      v26 = 1;
      v10 = MinY;
    }
    else
    {
      if (v33 == (id)1)
      {
        v48 = kCalUILogHandle;
        if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
          goto LABEL_62;
        *(_DWORD *)buf = 138412546;
        v59 = v25;
        v60 = 2112;
        v61 = v19;
        v49 = "Major boundary calculation failsafe triggered while trying to find the subview matching a past major bound"
              "ary calendar date.  pastMajorBoundaryCalendarDate: [%@] subviewCalendarDate: [%@]";
LABEL_53:
        v50 = v48;
        v51 = 22;
        goto LABEL_61;
      }
      v26 = 0;
    }
    v34 = objc_msgSend(v24, "month");
    if (v34 == objc_msgSend(v19, "month"))
    {
      v35 = objc_msgSend(v24, "day");
      if (v35 == objc_msgSend(v19, "day"))
        break;
    }
    v36 = objc_msgSend(v24, "compare:", v19);
    if (!v36)
      break;
    if (v36 == (id)-1)
    {
      v48 = kCalUILogHandle;
      if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_62;
      *(_DWORD *)buf = 138412546;
      v59 = v24;
      v60 = 2112;
      v61 = v19;
      v49 = "Major boundary calculation failsafe triggered while trying to find the subview matching a future major bound"
            "ary calendar date.  futureMajorBoundaryCalendarDate: [%@] subviewCalendarDate: [%@]";
      goto LABEL_53;
    }
    v28 = 1;
    if ((v16 & 1) != 0)
      goto LABEL_28;
  }
  if (y - v10 <= MinY - y)
    v45 = v25;
  else
    v45 = v24;
  if (y - v10 > MinY - y)
    v10 = MinY;
  v44 = v45;
  -[InfiniteScrollViewController showDateVerticalOffsetForDate:](self, "showDateVerticalOffsetForDate:", v44);
  y = v10 - v9 + v46;
  if (!v55)
    goto LABEL_63;
  v47 = v57;
  if (v44)
  {
    v44 = objc_retainAutorelease(v44);
    *v55 = v44;
  }
  v42 = v19;
LABEL_65:

  v53 = x;
  v54 = y;
  result.y = v54;
  result.x = v53;
  return result;
}

- (BOOL)shouldAnimateScrollToDate:(id)a3 fromClosestDate:(id)a4
{
  return 0;
}

- (double)showDateVerticalOffsetForDate:(id)a3
{
  return 0.0;
}

- (double)subviewBufferExtensionMultiplier
{
  return 0.0;
}

- (double)unobstructedScrollViewHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGRect v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InfiniteScrollViewController scrollView](self, "scrollView"));
  objc_msgSend(v8, "bounds");
  v9 = CGRectGetHeight(v11) - v5 - v7;

  return v9;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (BOOL)isUserFingerDown
{
  return self->_isUserFingerDown;
}

- (void)setIsUserFingerDown:(BOOL)a3
{
  self->_isUserFingerDown = a3;
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (BOOL)isRelayingOut
{
  return self->_isRelayingOut;
}

- (BOOL)suppressViewAdjustments
{
  return self->_suppressViewAdjustments;
}

- (void)setSuppressViewAdjustments:(BOOL)a3
{
  self->_suppressViewAdjustments = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_lastKnownShownDate, 0);
  objc_storeStrong((id *)&self->_reusableViews, 0);
  objc_storeStrong((id *)&self->_startingDate, 0);
  objc_storeStrong((id *)&self->_views, 0);
}

- (id)pastMajorBoundaryCalendarDateForCalendarDate:(id)a3
{
  uint64_t v3;
  id result;

  v3 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v3);
  sub_10004DF54();
  return result;
}

- (id)futureMajorBoundaryCalendarDateForCalendarDate:(id)a3
{
  uint64_t v3;
  id result;

  v3 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v3);
  sub_10004DF54();
  return result;
}

- (id)createInitialViewForDate:(id)a3
{
  uint64_t v3;
  id result;

  v3 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v3);
  sub_10004DF54();
  return result;
}

- (id)newTopViewAboveViewWithCalendarDate:(id)a3
{
  uint64_t v3;
  id result;

  v3 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v3);
  sub_10004DF54();
  return result;
}

- (id)newBottomViewBelowViewWithCalendarDate:(id)a3
{
  uint64_t v3;
  id result;

  v3 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v3);
  sub_10004DF54();
  return result;
}

- (id)calendarDateForSubviewAboveSubviewWithCalendarDate:(id)a3
{
  uint64_t v3;
  id result;

  v3 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v3);
  sub_10004DF54();
  return result;
}

- (id)calendarDateForSubviewBelowSubviewWithCalendarDate:(id)a3
{
  uint64_t v3;
  id result;

  v3 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v3);
  sub_10004DF54();
  return result;
}

- (double)heightForSubviewWithCalendarDate:(id)a3
{
  uint64_t v3;

  v3 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v3);
  return 0.0;
}

- (double)topInsetForSubviewWithCalendarDate:(id)a3
{
  uint64_t v3;

  v3 = sub_10002E49C((uint64_t)self);
  sub_10002E48C(v3);
  return 0.0;
}

@end
