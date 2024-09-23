@implementation MTATimerCollectionViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTATimerCollectionViewController)initWithTimerManager:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  MTATimerCollectionViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  void *v16;
  uint64_t v17;
  NSUserActivity *userActivity;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  v20.receiver = self;
  v20.super_class = (Class)MTATimerCollectionViewController;
  v9 = -[MTATimerCollectionViewController initWithCollectionViewLayout:](&v20, "initWithCollectionViewLayout:", v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TIMERS"), &stru_10009A4D0, 0));
    -[MTATimerCollectionViewController setTitle:](v9, "setTitle:", v11);

    -[MTATimerCollectionViewController setEdgesForExtendedLayout:](v9, "setEdgesForExtendedLayout:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("timer")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController tabBarItem](v9, "tabBarItem"));
    objc_msgSend(v13, "setImage:", v12);

    -[MTATimerCollectionViewController setTimerManager:](v9, "setTimerManager:", v6);
    -[MTATimerCollectionViewController setDataSource:](v9, "setDataSource:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](v9, "dataSource"));
    objc_msgSend(v14, "registerObserver:", v9);

    v15 = objc_opt_new(NSMutableArray);
    -[MTATimerCollectionViewController setSections:](v9, "setSections:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController title](v9, "title"));
    v17 = objc_claimAutoreleasedReturnValue(+[NSUserActivity mtUserActivityWithActivityType:title:](NSUserActivity, "mtUserActivityWithActivityType:title:", CFSTR("com.apple.clock.timer"), v16));
    userActivity = v9->_userActivity;
    v9->_userActivity = (NSUserActivity *)v17;

    v9->_cellHeight = -1.0;
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NSTimer invalidate](self->_updateTimer, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTATimerCollectionViewController;
  -[MTATimerCollectionViewController dealloc](&v4, "dealloc");
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTATimerCollectionViewController;
  -[MTATimerCollectionViewController viewDidLoad](&v17, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NO_TIMERS"), &stru_10009A4D0, 0));

  -[MTATimerCollectionViewController reloadState](self, "reloadState");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "setAllowsSelectionDuringEditing:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(MTATimerActiveCollectionViewCell), CFSTR("kMTATimerActiveCollectionIdentifier"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(MTASingleTimerCollectionViewCellNew), CFSTR("kMTASingleTimerCellIdentifierNew"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(MTASingleTimerCollectionViewCell), CFSTR("kMTASingleTimerCellIdentifierActive"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v11, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(MTATimerRecentCollectionViewCell), CFSTR("kMTATimerRecentCollectionIdentifier"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v12, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(MTATimerCollectionHeaderView), UICollectionElementKindSectionHeader, CFSTR("kMTATimerCollectionHeaderIdentifier"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v13, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(MTATimerTipCollectionViewCell), CFSTR("kMTATimerTipCollectionViewCellIdentifier"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "addObserver:selector:name:object:", self, "handleContentSizeChange:", UIContentSizeCategoryDidChangeNotification, 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "handleEnterBackground", UIApplicationDidEnterBackgroundNotification, 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "addObserver:selector:name:object:", self, "handleOrientationChange", UIDeviceOrientationDidChangeNotification, 0);

  +[MTAUtilities updateTimerAppShortcuts](MTAUtilities, "updateTimerAppShortcuts");
}

- (void)updateAddButton
{
  id v3;

  if (-[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers"))
  {
    -[MTATimerCollectionViewController setupAddButton](self, "setupAddButton");
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v3, "setRightBarButtonItem:", 0);

  }
}

- (void)setupAddButton
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController navigationItem](self, "navigationItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rightBarButtonItem"));

  if (!v4)
  {
    v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 4, self, "addTimer:");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "setRightBarButtonItem:", v6);

  }
}

- (void)reloadSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _UNKNOWN **v7;
  void *v8;
  id v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sections](self, "sections"));
  objc_msgSend(v3, "removeAllObjects");

  if (self->_siriTipView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sections](self, "sections"));
    objc_msgSend(v4, "addObject:", &off_10009CE78);

  }
  if ((unint64_t)-[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers") <= 1
    && !self->_remainInMultipleTimerMode)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sections](self, "sections"));
    v6 = v5;
    v7 = &off_10009CE90;
    goto LABEL_10;
  }
  if ((unint64_t)-[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers") > 1
    || -[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers") == (id)1
    && self->_remainInMultipleTimerMode)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sections](self, "sections"));
    v6 = v5;
    v7 = &off_10009CEA8;
LABEL_10:
    objc_msgSend(v5, "addObject:", v7);

  }
  if (!-[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers")
    || (unint64_t)-[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers") > 1
    || self->_remainInMultipleTimerMode)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getRecentDurations](self->_dataSource, "getRecentDurations"));
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sections](self, "sections"));
      objc_msgSend(v10, "addObject:", &off_10009CEC0);

    }
  }
}

- (void)handleContentSizeChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  self->_cellHeight = -1.0;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController singleTimerCell](self, "singleTimerCell", a3));
  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "controlsView"));
    objc_msgSend(v4, "handleContentSizeChange");

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionViewLayout](self, "collectionViewLayout"));
  objc_msgSend(v5, "invalidateLayout");

}

- (void)handleOrientationChange
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController singleTimerCell](self, "singleTimerCell"));
  if (v2)
  {
    v4 = v2;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "controlsView"));
    objc_msgSend(v3, "handleContentSizeChange");

    v2 = v4;
  }

}

- (double)cellHeight
{
  double result;

  result = self->_cellHeight;
  if (result < 0.0)
  {
    +[MTATimerBaseCollectionViewCell cellHeight](MTATimerActiveCollectionViewCell, "cellHeight");
    self->_cellHeight = result;
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTATimerCollectionViewController;
  -[MTATimerCollectionViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  -[MTATimerCollectionViewController reloadState](self, "reloadState");
  -[MTATimerCollectionViewController startUpdatingTimerUI](self, "startUpdatingTimerUI");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController siriTipsController](self, "siriTipsController"));
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController siriTipsController](self, "siriTipsController"));
  objc_msgSend(v5, "checkForSiriTips");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTATimerCollectionViewController;
  -[MTATimerCollectionViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController userActivity](self, "userActivity"));
  objc_msgSend(v4, "becomeCurrent");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController deferredAddingTimer](self, "deferredAddingTimer"));
  if (v5)
  {
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController deferredAddingTimer](self, "deferredAddingTimer"));
    v6[2]();

    -[MTATimerCollectionViewController setDeferredAddingTimer:](self, "setDeferredAddingTimer:", 0);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  UIView *siriTipView;
  objc_super v8;

  v3 = a3;
  -[MTATimerCollectionViewController stopUpdatingTimerUI](self, "stopUpdatingTimerUI");
  -[NSUserActivity resignCurrent](self->_userActivity, "resignCurrent");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController siriTipsController](self, "siriTipsController"));
  objc_msgSend(v5, "setDelegate:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController siriTipsController](self, "siriTipsController"));
  objc_msgSend(v6, "cancel");

  siriTipView = self->_siriTipView;
  self->_siriTipView = 0;

  v8.receiver = self;
  v8.super_class = (Class)MTATimerCollectionViewController;
  -[MTATimerCollectionViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MTATimerCollectionViewController;
  v7 = a4;
  -[MTATimerCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000512E0;
  v8[3] = &unk_1000992F8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)_removeTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "removeTimer:", v4));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000513C8;
  v8[3] = &unk_100099F68;
  v8[4] = self;
  v7 = objc_msgSend(v6, "addSuccessBlock:", v8);

}

- (void)startUpdatingTimerUI
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  NSTimer *v7;
  NSTimer *updateTimer;
  void *v9;
  uint8_t v10[16];

  if (self->_updateTimer)
    -[MTATimerCollectionViewController stopUpdatingTimerUI](self, "stopUpdatingTimerUI");
  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating an NSTimer to update timer collection UI", v10, 2u);
  }

  v5 = objc_alloc((Class)NSTimer);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (NSTimer *)objc_msgSend(v5, "initWithFireDate:interval:target:selector:userInfo:repeats:", v6, self, "updateTimerTick:", 0, 1, 0.25);
  updateTimer = self->_updateTimer;
  self->_updateTimer = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v9, "addTimer:forMode:", self->_updateTimer, NSDefaultRunLoopMode);

}

- (void)startUpdatingSingleTimerUI
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  NSTimer *v7;
  NSTimer *updateTimer;
  void *v9;
  uint8_t v10[16];

  if (self->_updateTimer)
    -[MTATimerCollectionViewController stopUpdatingTimerUI](self, "stopUpdatingTimerUI");
  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Creating an NSTimer to update timer collection UI", v10, 2u);
  }

  v5 = objc_alloc((Class)NSTimer);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (NSTimer *)objc_msgSend(v5, "initWithFireDate:interval:target:selector:userInfo:repeats:", v6, self, "timerTick:", 0, 1, 0.25);
  updateTimer = self->_updateTimer;
  self->_updateTimer = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v9, "addTimer:forMode:", self->_updateTimer, NSDefaultRunLoopMode);

}

- (void)stopUpdatingTimerUI
{
  uint64_t v3;
  NSObject *v4;
  NSTimer *updateTimer;
  uint8_t v6[16];

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating timer collection UI updating NSTimer", v6, 2u);
  }

  -[NSTimer invalidate](self->_updateTimer, "invalidate");
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

}

- (void)updateTimerTick:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForVisibleItems"));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v11, "section", (_QWORD)v21)));
        v13 = objc_msgSend(v12, "integerValue");

        if (v13 == (id)1)
        {
          v14 = objc_msgSend(v11, "row");
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
          v16 = objc_msgSend(v15, "numberOfActiveTimers");

          if (v14 < v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activeTimerAtRow:", objc_msgSend(v11, "row")));

            if (objc_msgSend(v18, "state") == (id)3)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cellForItemAtIndexPath:", v11));

              objc_msgSend(v20, "refreshUI:animated:", v18, 1);
            }

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

}

- (void)reloadState
{
  -[MTATimerCollectionViewController reloadState:](self, "reloadState:", 0);
}

- (void)reloadState:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void **v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  MTATimerCollectionViewController *v15;
  id v16;
  uint8_t buf[16];

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reloading collection view", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource reloadTimers](self->_dataSource, "reloadTimers"));
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10005197C;
  v14 = &unk_100099F90;
  v15 = self;
  v16 = v4;
  v9 = v4;
  v10 = objc_msgSend(v8, "addCompletionBlock:", &v11);

  -[MTTimerDataSource reloadTimerDurations](self->_dataSource, "reloadTimerDurations", v11, v12, v13, v14, v15);
}

- (void)_reloadUI:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MTATimerCollectionViewController _handleNumberOfItemsDidChange](self, "_handleNumberOfItemsDidChange");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)dataSourceDidReload:(id)a3
{
  -[MTATimerCollectionViewController _reloadUI:](self, "_reloadUI:", 0);
  -[MTATimerCollectionViewController updateStateAndReloadData](self, "updateStateAndReloadData");
  if ((unint64_t)-[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers") > 1
    || self->_remainInMultipleTimerMode
    && -[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers") == (id)1)
  {
    -[MTATimerCollectionViewController startUpdatingTimerUI](self, "startUpdatingTimerUI");
  }
  else if (!-[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers"))
  {
    -[MTATimerCollectionViewController stopUpdatingTimerUI](self, "stopUpdatingTimerUI");
  }
}

- (void)updateStateAndReloadData
{
  BOOL v3;
  id v4;

  if (!-[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers"))
  {
    v3 = 0;
    goto LABEL_5;
  }
  if ((unint64_t)-[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers") >= 2)
  {
    v3 = 1;
LABEL_5:
    self->_remainInMultipleTimerMode = v3;
  }
  -[MTATimerCollectionViewController reloadSections](self, "reloadSections");
  -[MTATimerCollectionViewController updateAddButton](self, "updateAddButton");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "reloadData");

}

- (void)dataSourceDidReloadRecentDurations:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  MTATimerCollectionViewController *v8;

  v4 = MTLogForCategory(8, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ dataSourceDidReloadRecentDurations reloading table", (uint8_t *)&v7, 0xCu);
  }

  -[MTATimerCollectionViewController reloadSections](self, "reloadSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "reloadData");

}

- (void)dataSourceDidReloadAllDurations:(id)a3
{
  -[MTATimerCollectionViewController updateLatestDuration](self, "updateLatestDuration", a3);
}

- (void)updateLatestDuration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController singleTimerCell](self, "singleTimerCell"));
  if (v3)
  {
    v8 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "controlsView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getLatestDuration"));
    objc_msgSend(v6, "duration");
    objc_msgSend(v4, "setCountDownDuration:");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController currentTone](self, "currentTone"));
    -[MTATimerCollectionViewController setSound:](self, "setSound:", v7);

    -[MTATimerCollectionViewController updateSelectedTone](self, "updateSelectedTone");
    v3 = v8;
  }

}

- (void)updateSelectedTone
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController singleTimerCell](self, "singleTimerCell"));
  if (v3)
  {
    v4 = v3;
    -[MTATimerCollectionViewController updateSelectedToneForCell:](self, "updateSelectedToneForCell:", v3);
    v3 = v4;
  }

}

- (void)updateSelectedToneForCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController currentTone](self, "currentTone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toneIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sound](self, "sound"));
  LODWORD(v4) = objc_msgSend(v6, "interruptAudio");

  if ((_DWORD)v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "controlsView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STOP_PLAYING"), &stru_10009A4D0, 0));
    v10 = v7;
    v11 = v9;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager"));
    if ((objc_msgSend(v7, "toneWithIdentifierIsValid:", v5) & 1) == 0)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultToneIdentifierForAlertType:", 13));

      v5 = (void *)v12;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nameForToneIdentifier:", v5));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "controlsView"));
    v9 = v10;
    v11 = v8;
  }
  objc_msgSend(v10, "setTimerToneName:", v11);

}

- (id)singleTimerCell
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sections](self, "sections"));
  v4 = objc_msgSend(v3, "indexOfObject:", &off_10009CE90);

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, v4));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v7));

  }
  return v5;
}

- (void)_handleNumberOfItemsDidChange
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
  v4 = objc_msgSend(v3, "numberOfActiveTimers");

  if (!v4)
    -[MTATimerCollectionViewController setEditing:](self, "setEditing:", 0);
}

- (void)showAddView
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 300000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051F58;
  block[3] = &unk_100099320;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)addTimer:(id)a3
{
  -[MTATimerCollectionViewController showAddViewForTimer:](self, "showAddViewForTimer:", 0);
}

- (void)showAddViewForTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

  if (-[MTATimerCollectionViewController isViewLoaded](self, "isViewLoaded") && v6)
  {
    -[MTATimerCollectionViewController showAddTimerViewWithTimer:](self, "showAddTimerViewWithTimer:", v4);
  }
  else
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000520AC;
    v7[3] = &unk_1000999F8;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    -[MTATimerCollectionViewController setDeferredAddingTimer:](self, "setDeferredAddingTimer:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)showAddTimerViewWithTimer:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[MTATimerCollectionViewController setEditing:](self, "setEditing:", 0);
  if (!v14)
  {
    -[MTATimerCollectionViewController _presentAddEditForTimer:isNewTimer:](self, "_presentAddEditForTimer:isNewTimer:", 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 9));
    objc_msgSend(v12, "pushEvent:", v13);

    goto LABEL_5;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
  v5 = objc_msgSend(v4, "rowForTimer:", v14);

  -[MTATimerCollectionViewController _presentAddEditForTimer:isNewTimer:](self, "_presentAddEditForTimer:isNewTimer:", v14, v5 == (id)0x7FFFFFFFFFFFFFFFLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 9));
  objc_msgSend(v6, "pushEvent:", v7);

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 9));
    objc_msgSend(v8, "pushEvent:", v9);
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timerID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:identifier:](MTAStateStoreEvent, "eventWithType:identifier:", 10, v10));
  objc_msgSend(v8, "pushEvent:", v11);

LABEL_6:
}

- (void)_presentAddEditForTimer:(id)a3 isNewTimer:(BOOL)a4
{
  void *v5;
  void *v6;
  MTAAddSheetNavigationController *v7;
  void *v8;
  MTAAddSheetNavigationController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MTATimerAddViewController *v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController navigationItem](self, "navigationItem", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rightBarButtonItem"));

  if (v6)
  {
    v19 = -[MTATimerAddViewController initWithDataSource:timerManager:delegate:]([MTATimerAddViewController alloc], "initWithDataSource:timerManager:delegate:", self->_dataSource, self->_timerManager, self);
    -[MTATimerCollectionViewController setAddEditTimerController:](self, "setAddEditTimerController:", v19);
    v7 = [MTAAddSheetNavigationController alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController addEditTimerController](self, "addEditTimerController"));
    v9 = -[MTAAddSheetNavigationController initWithRootViewController:](v7, "initWithRootViewController:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController addEditTimerController](self, "addEditTimerController"));
    objc_msgSend(v10, "preferredContentSize");
    -[MTAAddSheetNavigationController setPreferredContentSize:](v9, "setPreferredContentSize:");

    -[MTAAddSheetNavigationController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController navigationItem](self, "navigationItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rightBarButtonItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController popoverPresentationController](v9, "popoverPresentationController"));
    objc_msgSend(v13, "setBarButtonItem:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController popoverPresentationController](v9, "popoverPresentationController"));
    objc_msgSend(v14, "setDelegate:", self);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController popoverPresentationController](v9, "popoverPresentationController"));
    objc_msgSend(v16, "setBackgroundColor:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController view](v9, "view"));
    objc_msgSend(v18, "setBackgroundColor:", v17);

    -[MTATimerCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  }
}

- (void)dismissAddViewController:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v5 = objc_msgSend(v4, "isSuspended") ^ 1;

  -[MTATimerCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v5, &stru_100099FB0);
}

- (void)showAddViewWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MTATimerCollectionViewController showAddViewForTimer:](self, "showAddViewForTimer:", 0);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)didStartTimerWithDuration:(double)a3 title:(id)a4 sound:(id)a5 sender:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = objc_msgSend(objc_alloc((Class)MTMutableTimer), "initWithState:duration:", 3, a3);
  objc_msgSend(v13, "setSound:", v11);
  -[MTATimerCollectionViewController setSound:](self, "setSound:", v11);

  objc_msgSend(v13, "setTitle:", v12);
  +[MTTimerManager setDefaultDuration:](MTTimerManager, "setDefaultDuration:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController timerManager](self, "timerManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "addTimer:", v13));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "reschedule:", v16));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000526C0;
  v21[3] = &unk_100099D60;
  v21[4] = self;
  v22 = v13;
  v23 = v10;
  v18 = v10;
  v19 = v13;
  v20 = objc_msgSend(v17, "addSuccessBlock:", v21);

}

- (void)timerAddEditControllerDidCancel:(id)a3 reload:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[MTATimerCollectionViewController dismissAddViewController:](self, "dismissAddViewController:", a3);
  if (v4)
    -[MTATimerCollectionViewController reloadState](self, "reloadState");
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat width;
  double height;
  double v17;
  double v18;
  float v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  double v27;
  double v28;
  CGSize result;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v8, "section")));
  v10 = objc_msgSend(v9, "integerValue");

  if (v10 == (id)3)
  {
    objc_msgSend(v7, "bounds");
    +[MTATimerTipCollectionViewCell sizeThatFits:siriTipView:](MTATimerTipCollectionViewCell, "sizeThatFits:siriTipView:", self->_siriTipView, v13, v14);
    goto LABEL_5;
  }
  if (!v10)
  {
    -[MTATimerCollectionViewController singleTimerSectionSize](self, "singleTimerSectionSize");
LABEL_5:
    width = v11;
    height = v12;
    goto LABEL_13;
  }
  objc_msgSend(v7, "bounds");
  width = CGSizeZero.width;
  height = CGSizeZero.height;
  if (v17 != CGSizeZero.width || v18 != height)
  {
    v20 = v17 / 250.0;
    v21 = vcvtms_u32_f32(v20);
    v22 = v17 + -30.0 + (double)(v21 - 1) * -15.0;
    v23 = UIFloorToViewScale(v22 / (double)v21);
    v24 = v22 - v23 * (double)v21;
    v25 = (unint64_t)objc_msgSend(v8, "row");
    v26 = -0.0;
    if (!(v25 % v21))
      v26 = v24;
    height = v23 + v26;
    width = height;
  }
LABEL_13:

  v27 = width;
  v28 = height;
  result.height = v28;
  result.width = v27;
  return result;
}

- (CGSize)singleTimerSectionSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
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
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  if (+[MTAUtilities isLandscape](MTAUtilities, "isLandscape"))
    v8 = 24.0;
  else
    v8 = 8.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController traitCollection](self, "traitCollection"));
  v10 = objc_msgSend(v9, "horizontalSizeClass");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
  objc_msgSend(v12, "size");
  v14 = v13;

  switch(+[MTAUtilities estimatedSplitLayoutForWindowWidth:](MTAUtilities, "estimatedSplitLayoutForWindowWidth:", v14))
  {
    case 0:
      +[MTATimerControlsView estimatedViewHeight](MTATimerControlsView, "estimatedViewHeight");
      v14 = v15;
      goto LABEL_17;
    case 1:
      if (+[MTAUtilities isLandscape](MTAUtilities, "isLandscape"))
      {
        +[MTATimerControlsView estimatedViewHeight](MTATimerControlsView, "estimatedViewHeight");
        v14 = v21;
        if (v10 != (id)1)
          goto LABEL_17;
      }
      else
      {
        if (v10 != (id)1)
          goto LABEL_17;
        +[MTATimerControlsView estimatedNonCountdownElementHeightWithSpacing](MTATimerControlsView, "estimatedNonCountdownElementHeightWithSpacing");
        v14 = v14 + v22;
      }
LABEL_16:
      v14 = v14 + 84.0;
LABEL_17:
      v17 = v8;
LABEL_18:
      v23 = v17 + v14;
      v24 = v5;
      result.height = v23;
      result.width = v24;
      return result;
    case 2:
      +[MTATimerControlsView estimatedViewHeight](MTATimerControlsView, "estimatedViewHeight");
      v14 = v16;
      v17 = 0.0;
      if (v10 != (id)1 || !+[MTAUtilities isLandscape](MTAUtilities, "isLandscape"))
        goto LABEL_18;
      goto LABEL_16;
    case 3:
      +[MTATimerControlsView estimatedViewHeight](MTATimerControlsView, "estimatedViewHeight");
      v19 = v18;
      +[MTATimerControlsView estimatedTonePickerHeight](MTATimerControlsView, "estimatedTonePickerHeight");
      v14 = v19 + v20;
      v17 = 0.0;
      goto LABEL_18;
    default:
      v17 = v8;
      v14 = v7;
      goto LABEL_18;
  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 0.0;
  v6 = 15.0;
  v7 = 0.0;
  v8 = 15.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 15.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 15.0;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  void *v4;
  id v5;

  -[MTATimerCollectionViewController confirmPickingSound](self, "confirmPickingSound", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController navigationItem](self, "navigationItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leftBarButtonItem"));
  objc_msgSend(v4, "setEnabled:", 1);

}

- (void)_addOrEditControllerDidDismissCommitChanges:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController addEditTimerController](self, "addEditTimerController"));

    if (!v4)
      NSLog(CFSTR("Attempting to dismiss add or edit controller when there isn't one."));
  }
  -[MTATimerCollectionViewController setAddEditTimerController:](self, "setAddEditTimerController:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 11));
  objc_msgSend(v6, "pushEvent:", v5);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sections](self, "sections", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  id v6;
  void *v8;
  id v9;
  int64_t v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4));
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
    v9 = objc_msgSend(v8, "numberOfActiveTimers");
LABEL_7:
    v10 = (int64_t)v9;

    return v10;
  }
  if (v6 == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getRecentDurations](self->_dataSource, "getRecentDurations"));
    v9 = objc_msgSend(v8, "count");
    goto LABEL_7;
  }
  return v6 != (id)3 || self->_siriTipView != 0;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(a4, "isEqualToString:", UICollectionElementKindSectionHeader)
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v9, "section"))), v11 = objc_msgSend(v10, "integerValue"), v10, v11 == (id)2))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, CFSTR("kMTATimerCollectionHeaderIdentifier"), v9));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TIMER_HEADER_RECENT"), &stru_10009A4D0, 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "headerTitle"));
    objc_msgSend(v15, "setText:", v14);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  void *v6;
  id v7;
  uint64_t v8;
  double height;
  CGFloat width;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  CGSize result;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a5, a4));
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == (id)3 || (unint64_t)v7 <= 1)
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  else if (v7 == (id)2
         && MTUIShouldUseLargePadLayout(v8)
         && !+[MTAUtilities isLandscape](MTAUtilities, "isLandscape")
         && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource")),
             v12 = objc_msgSend(v11, "numberOfActiveTimers"),
             v11,
             !v12))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
    objc_msgSend(v16, "frame");
    width = v17;

    height = 114.0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
    objc_msgSend(v13, "frame");
    width = v14;

    height = 64.0;
  }
  v15 = width;
  result.height = height;
  result.width = v15;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  unsigned int v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
  v9 = objc_msgSend(v8, "integerValue");

  switch((unint64_t)v9)
  {
    case 0uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController traitCollection](self, "traitCollection"));
      v12 = objc_msgSend(v11, "horizontalSizeClass");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));
      objc_msgSend(v14, "frame");
      v16 = +[MTAUtilities shouldUseCompactLayoutForSizeClass:windowWidth:](MTAUtilities, "shouldUseCompactLayoutForSizeClass:windowWidth:", v12, v15);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
      v18 = objc_msgSend(v17, "numberOfActiveTimers");

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
        v20 = objc_msgSend(v19, "numberOfActiveTimers");

        if ((unint64_t)v20 >= 2)
        {
          v22 = MTLogForCategory(8, v21);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            sub_10006589C(self, v23);

        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kMTASingleTimerCellIdentifierActive"), v7));
        v25 = v24;
        if (v16)
          v26 = 5;
        else
          v26 = 4;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "controlsView"));
        objc_msgSend(v27, "setStyle:", v26);

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "activeTimerAtRow:", 0));
        -[MTATimerCollectionViewController prepareUIForState:inCell:forceRefresh:](self, "prepareUIForState:inCell:forceRefresh:", objc_msgSend(v29, "state"), v25, 1);

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource activeTimerAtRow:](self->_dataSource, "activeTimerAtRow:", 0));
        v31 = v30;
        if (v30)
        {
          objc_msgSend(v30, "remainingTime");
          v33 = v32;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "controlsView"));
          objc_msgSend(v34, "setTime:", v33);

          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "title"));
          -[MTATimerCollectionViewController setCurrentTitle:](self, "setCurrentTitle:", v35);

        }
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kMTASingleTimerCellIdentifierNew"), v7));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "controlsView"));
        objc_msgSend(v45, "setTimerControlState:", 0);

        if (v16)
          v46 = 2;
        else
          v46 = 4;
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "controlsView"));
        objc_msgSend(v47, "setStyle:", v46);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "controlsView"));
        objc_msgSend(v31, "setState:", 1);
      }

      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "controlsView"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController currentTitle](self, "currentTitle"));
      objc_msgSend(v48, "setCurrentLabel:", v49);

      objc_msgSend(v25, "setAccessibilityIdentifier:", CFSTR("single-timer-1"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "controlsView"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "getLatestDuration"));
      objc_msgSend(v52, "duration");
      objc_msgSend(v50, "setCountDownDuration:");

      -[MTATimerCollectionViewController updateSelectedToneForCell:](self, "updateSelectedToneForCell:", v25);
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "controlsView"));
      objc_msgSend(v39, "setControlsViewDelegate:", self);
      goto LABEL_25;
    case 1uLL:
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kMTATimerActiveCollectionIdentifier"), v7));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "activeTimerAtRow:", objc_msgSend(v7, "row")));

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "timerIDString"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("active-timer-%@"), v40));
      objc_msgSend(v25, "setAccessibilityIdentifier:", v41);

      objc_msgSend(v25, "refreshUI:animated:", v39, 0);
LABEL_25:

      break;
    case 2uLL:
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kMTATimerRecentCollectionIdentifier"), v7));
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("recent-timer-%ld"), objc_msgSend(v7, "row")));
      objc_msgSend(v25, "setAccessibilityIdentifier:", v42);

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getRecentDurations](self->_dataSource, "getRecentDurations"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

      if (v44)
        objc_msgSend(v25, "updateWithDuration:", v44);

      break;
    case 3uLL:
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kMTATimerTipCollectionViewCellIdentifier"), v7));
      objc_msgSend(v25, "setSiriTipView:", self->_siriTipView);
      break;
    default:
      v36 = MTLogForCategory(8, v10);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        sub_100065838();

      v25 = 0;
      break;
  }

  return v25;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v7;
  id v8;
  BOOL v9;
  id v10;

  v10 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(a5, "section")));
  v8 = objc_msgSend(v7, "integerValue");

  if (v8)
    v9 = v8 == (id)3;
  else
    v9 = 1;
  if (!v9)
    objc_msgSend(v10, "setDelegate:", self);

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  MTATimerCollectionViewController *v16;
  __int16 v17;
  void *v18;

  v6 = a4;
  v7 = objc_opt_class(MTATimerBaseCollectionViewCell);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    objc_msgSend(v6, "setDelegate:", 0);
  }
  else
  {
    v8 = objc_opt_class(MTASingleTimerCollectionViewCell);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    {
      v10 = MTLogForCategory(8, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController singleTimerVC](self, "singleTimerVC"));
        v15 = 138543618;
        v16 = self;
        v17 = 2114;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ didEndDisplayingCell, current vc: %{public}@", (uint8_t *)&v15, 0x16u);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController singleTimerVC](self, "singleTimerVC"));
      objc_msgSend(v13, "stopUpdatingTimerUI");

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController singleTimerVC](self, "singleTimerVC"));
      objc_msgSend(v14, "removeNotificationObserver");

    }
  }

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(a4, "section", a3)));
  v5 = objc_msgSend(v4, "integerValue");

  return v5 == (id)1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  MTATimerViewController *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
  v7 = objc_msgSend(v5, "row");

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeTimerAtRow:", v7));
  v8 = -[MTATimerViewController initWithTimer:timerManager:dataSource:delegate:]([MTATimerViewController alloc], "initWithTimer:timerManager:dataSource:delegate:", v10, self->_timerManager, self->_dataSource, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController navigationController](self, "navigationController"));
  objc_msgSend(v9, "pushViewController:animated:", v8, 1);

}

- (void)startTimerForCell:(id)a3 withDuration:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForCell:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeTimerAtRow:", objc_msgSend(v8, "row")));
  v11 = objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "setDuration:", a4);
  objc_msgSend(v11, "setState:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController timerManager](self, "timerManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "updateTimer:", v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "reschedule:", v14));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100053928;
  v18[3] = &unk_100099578;
  v18[4] = self;
  v19 = v11;
  v16 = v11;
  v17 = objc_msgSend(v15, "addSuccessBlock:", v18);

}

- (void)cancelTimerForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  uint8_t buf[4];
  MTATimerCollectionViewController *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTimerAtRow:", objc_msgSend(v6, "row")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timerByUpdatingWithState:", 1));

  v11 = MTLogForCategory(8, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timerID"));
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping a timer: %{public}@", buf, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController timerManager](self, "timerManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "updateTimer:", v9));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "reschedule:", v16));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100053C08;
  v19[3] = &unk_100099F68;
  v19[4] = self;
  v18 = objc_msgSend(v17, "addSuccessBlock:", v19);

}

- (void)pauseResumeTimerForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTimerAtRow:", objc_msgSend(v6, "row")));
  v9 = objc_msgSend(v8, "mutableCopy");

  if (objc_msgSend(v9, "state") == (id)3)
    v10 = 2;
  else
    v10 = 3;
  objc_msgSend(v9, "setState:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController timerManager](self, "timerManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "updateTimer:", v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reschedule:", v13));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100053E48;
  v17[3] = &unk_100099578;
  v17[4] = self;
  v18 = v9;
  v15 = v9;
  v16 = objc_msgSend(v14, "addSuccessBlock:", v17);

}

- (void)deleteRecentTimerForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getRecentDurations](self->_dataSource, "getRecentDurations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v13, "row")));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController timerManager](self, "timerManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "removeRecentDuration:", v7));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reschedule:", v10));
    v12 = objc_msgSend(v11, "addCompletionBlock:", &stru_100099FD0);

  }
}

- (void)startRecentTimerForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getRecentDurations](self->_dataSource, "getRecentDurations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v12, "row")));

  if (v7)
  {
    objc_msgSend(v7, "duration");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sound"));
    -[MTATimerCollectionViewController didStartTimerWithDuration:title:sound:sender:](self, "didStartTimerWithDuration:title:sound:sender:", v10, v11, 0, v9);

  }
}

- (void)didCancelTimerWithSender:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController navigationController](self, "navigationController", a3));
  v5 = objc_msgSend(v4, "popViewControllerAnimated:", 1);

  -[MTATimerCollectionViewController reloadState](self, "reloadState");
}

- (void)didReceiveStartTimerShortcutAction
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController navigationController](self, "navigationController"));
  v4 = objc_msgSend(v3, "popViewControllerAnimated:", 1);

  -[MTATimerCollectionViewController handleStartTimerShortcutAction](self, "handleStartTimerShortcutAction");
}

- (id)defaultEditLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Timer"), &stru_10009A4D0, 0));

  return v3;
}

- (void)startTimer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  MTATimerCollectionViewController *v27;
  __int16 v28;
  void *v29;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController singleTimerCell](self, "singleTimerCell", a3));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "controlsView"));
    objc_msgSend(v6, "countDownDuration");
    v8 = v7;

    if (v8 > 0.0)
    {
      v9 = objc_msgSend(objc_alloc((Class)MTMutableTimer), "initWithState:duration:", 3, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "controlsView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getCurrentLabel"));

      if (objc_msgSend(v11, "length"))
        objc_msgSend(v9, "setTitle:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sound](self, "sound"));
      if (v12)
      {
        objc_msgSend(v9, "setSound:", v12);
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTSound defaultSoundForCategory:](MTSound, "defaultSoundForCategory:", 1));
        objc_msgSend(v9, "setSound:", v13);

      }
      v15 = MTLogForCategory(8, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timerID"));
        *(_DWORD *)buf = 138543618;
        v27 = self;
        v28 = 2114;
        v29 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@ starting new timer: %{public}@ and dismissing add controller", buf, 0x16u);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "addTimer:reload:", v9, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "reschedule:", v20));

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100054488;
      v24[3] = &unk_100099FF8;
      v24[4] = self;
      v25 = v9;
      v22 = v9;
      v23 = objc_msgSend(v21, "addCompletionBlock:", v24);

    }
  }

}

- (void)deleteRecentSection
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sections](self, "sections"));
  v4 = objc_msgSend(v3, "indexOfObject:", &off_10009CEC0);

  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sections](self, "sections"));
    objc_msgSend(v5, "removeObjectAtIndex:", v4);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v4));
    objc_msgSend(v7, "deleteSections:", v6);

  }
}

- (void)prepareUIForState:(unint64_t)a3 forceRefresh:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController singleTimerCell](self, "singleTimerCell"));
  if (v7)
  {
    v8 = v7;
    -[MTATimerCollectionViewController prepareUIForState:inCell:forceRefresh:](self, "prepareUIForState:inCell:forceRefresh:", a3, v7, v4);
    v7 = v8;
  }

}

- (void)prepareUIForState:(unint64_t)a3 inCell:(id)a4 forceRefresh:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  MTATimerCollectionViewController *v22;
  __int16 v23;
  unint64_t v24;

  v5 = a5;
  v8 = a4;
  v10 = MTLogForCategory(8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = self;
    v23 = 2048;
    v24 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Preparing UI for state %lu", buf, 0x16u);
  }

  if (-[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers"))
  {
    v13 = objc_claimAutoreleasedReturnValue(-[MTTimerDataSource activeTimerAtRow:](self->_dataSource, "activeTimerAtRow:", 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "controlsView"));
    -[NSObject remainingTime](v13, "remainingTime");
    v16 = v15;
    -[NSObject duration](v13, "duration");
    v18 = v17;
    if (-[NSObject isCurrentTimer](v13, "isCurrentTimer"))
    {
      objc_msgSend(v14, "setRemainingTime:duration:state:title:forceRefresh:", a3, 0, v5, v16, v18);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject title](v13, "title"));
      objc_msgSend(v14, "setRemainingTime:duration:state:title:forceRefresh:", a3, v20, v5, v16, v18);

    }
    -[MTATimerCollectionViewController updateAddButton](self, "updateAddButton");
    switch(a3)
    {
      case 0uLL:
      case 4uLL:
        NSLog(CFSTR("Unexpected timer state %ld"), a3);
        break;
      case 1uLL:
        -[MTATimerCollectionViewController stopUpdatingTimerUI](self, "stopUpdatingTimerUI");
        break;
      case 2uLL:
        -[MTATimerCollectionViewController stopUpdatingTimerUI](self, "stopUpdatingTimerUI");
        -[MTATimerCollectionViewController timerTick:](self, "timerTick:", 0);
        break;
      case 3uLL:
        -[MTATimerCollectionViewController timerTick:](self, "timerTick:", 0);
        -[MTATimerCollectionViewController startUpdatingSingleTimerUI](self, "startUpdatingSingleTimerUI");
        break;
      default:
        break;
    }
  }
  else
  {
    v19 = MTLogForCategory(8, v12);
    v13 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100065920();
  }

}

- (void)timerTick:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  double v18;
  int v19;
  MTATimerCollectionViewController *v20;
  __int16 v21;
  double v22;

  v4 = MTLogForCategory(8, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138543362;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ timerTick", (uint8_t *)&v19, 0xCu);
  }

  if (-[MTATimerCollectionViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (-[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers"))
    {
      v7 = objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController singleTimerCell](self, "singleTimerCell"));
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource activeTimerAtRow:](self->_dataSource, "activeTimerAtRow:", 0));
        objc_msgSend(v8, "remainingTime");
        v10 = v9;
        switch((unint64_t)objc_msgSend(v8, "state"))
        {
          case 0uLL:
          case 4uLL:
            v12 = MTLogForCategory(8, v11);
            v13 = objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              sub_100065984((uint64_t)self, v8, v13);
            goto LABEL_16;
          case 1uLL:
            -[MTATimerCollectionViewController prepareUIForState:forceRefresh:](self, "prepareUIForState:forceRefresh:", 1, 0);
            v17 = objc_claimAutoreleasedReturnValue(-[NSObject controlsView](v7, "controlsView"));
            v13 = v17;
            v18 = 0.0;
            goto LABEL_15;
          case 2uLL:
          case 3uLL:
            v15 = MTLogForCategory(8, v11);
            v16 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v19 = 138543618;
              v20 = self;
              v21 = 2048;
              v22 = v10;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ remainingTime: %f", (uint8_t *)&v19, 0x16u);
            }

            v17 = objc_claimAutoreleasedReturnValue(-[NSObject controlsView](v7, "controlsView"));
            v13 = v17;
            v18 = v10;
LABEL_15:
            -[NSObject setTime:](v17, "setTime:", v18);
LABEL_16:

            break;
          default:
            break;
        }

      }
    }
    else
    {
      v14 = MTLogForCategory(8, v6);
      v7 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_100065920();
    }

  }
}

- (void)cancelTimer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  MTATimerCollectionViewController *v19;
  __int16 v20;
  void *v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController singleTimerCell](self, "singleTimerCell", a3));
  if (v4 && -[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource activeTimerAtRow:](self->_dataSource, "activeTimerAtRow:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timerByUpdatingWithState:", 1));

    v8 = MTLogForCategory(8, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timerID"));
      *(_DWORD *)buf = 138543618;
      v19 = self;
      v20 = 2114;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping a timer: %{public}@", buf, 0x16u);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController dataSource](self, "dataSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "updateTimer:", v6));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reschedule:", v13));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100054CF0;
    v16[3] = &unk_100099578;
    v16[4] = self;
    v17 = v4;
    v15 = objc_msgSend(v14, "addSuccessBlock:", v16);

  }
}

- (void)pauseResumeTimer:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[6];
  uint8_t buf[4];
  MTATimerCollectionViewController *v20;
  __int16 v21;
  void *v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController singleTimerCell](self, "singleTimerCell", a3));
  if (v4 && -[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource activeTimerAtRow:](self->_dataSource, "activeTimerAtRow:", 0));
    if (objc_msgSend(v5, "state") == (id)3)
      v6 = 2;
    else
      v6 = 3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timerByUpdatingWithState:", v6));
    v9 = MTLogForCategory(8, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timerID"));
      *(_DWORD *)buf = 138543618;
      v20 = self;
      v21 = 2114;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Pausing a timer: %{public}@", buf, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource updateTimer:reload:](self->_dataSource, "updateTimer:reload:", v7, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reschedule:", v13));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100054FEC;
    v18[3] = &unk_10009A020;
    v18[4] = self;
    v18[5] = v6;
    v15 = objc_msgSend(v14, "addSuccessBlock:", v18);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000550CC;
    v17[3] = &unk_1000996A8;
    v17[4] = self;
    v16 = objc_msgSend(v14, "addFailureBlock:", v17);

  }
}

- (void)showSoundPicker:(id)a3
{
  TKTonePickerViewController *v4;
  TKTonePickerViewController *tonePickerViewController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  double v26;
  double x;
  double v28;
  double y;
  double v30;
  double width;
  double v32;
  double height;
  void *v34;
  id v35;

  v35 = a3;
  if (!self->_tonePickerViewController)
  {
    v4 = (TKTonePickerViewController *)objc_msgSend(objc_alloc((Class)TKTonePickerViewController), "_initWithAlertType:tableViewStyle:", 13, 2);
    tonePickerViewController = self->_tonePickerViewController;
    self->_tonePickerViewController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultToneIdentifierForAlertType:", 14));
    -[TKTonePickerViewController setDefaultToneIdentifier:](self->_tonePickerViewController, "setDefaultToneIdentifier:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STOP_PLAYING"), &stru_10009A4D0, 0));
    -[TKTonePickerViewController setNoneString:](self->_tonePickerViewController, "setNoneString:", v9);

    -[TKTonePickerViewController setShowsNone:](self->_tonePickerViewController, "setShowsNone:", 1);
    -[TKTonePickerViewController setDelegate:](self->_tonePickerViewController, "setDelegate:", self);
    v10 = (void *)objc_opt_new(MTUITonePickerStyleProvider);
    -[TKTonePickerViewController setStyleProvider:](self->_tonePickerViewController, "setStyleProvider:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TKTonePickerViewController navigationItem](self->_tonePickerViewController, "navigationItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("WHEN_TIMER_ENDS"), &stru_10009A4D0, 0));
    objc_msgSend(v11, "setTitle:", v13);

    v14 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "dismissSoundPicker");
    objc_msgSend(v11, "setLeftBarButtonItem:", v14);

    v15 = objc_alloc((Class)UIBarButtonItem);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SET"), &stru_10009A4D0, 0));
    v18 = objc_msgSend(v15, "initWithTitle:style:target:action:", v17, 2, self, "confirmPickingSound");
    objc_msgSend(v11, "setRightBarButtonItem:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController currentTone](self, "currentTone"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "toneIdentifier"));
  -[TKTonePickerViewController setSelectedToneIdentifier:](self->_tonePickerViewController, "setSelectedToneIdentifier:", v20);

  -[TKTonePickerViewController setShowsToneStore:](self->_tonePickerViewController, "setShowsToneStore:", MTShouldAllowToneStore());
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v21, "addObserver:selector:name:object:", self, "confirmPickingSound", UIApplicationSuspendedNotification, 0);

  v22 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_tonePickerViewController);
  objc_msgSend(v22, "setDelegate:", self);
  objc_msgSend(v22, "setModalPresentationStyle:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "popoverPresentationController"));
  objc_msgSend(v23, "setDelegate:", self);
  v24 = objc_opt_class(UIView);
  if ((objc_opt_isKindOfClass(v35, v24) & 1) != 0)
  {
    v25 = v35;
    objc_msgSend(v25, "bounds");
    x = v26;
    y = v28;
    width = v30;
    height = v32;
  }
  else
  {
    v25 = 0;
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  objc_msgSend(v23, "setSourceView:", v25);
  objc_msgSend(v23, "setSourceRect:", x, y, width, height);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  objc_msgSend(v23, "setBackgroundColor:", v34);

  -[MTATimerCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);
}

- (id)currentTone
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sound](self, "sound"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sound](self, "sound"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getLatestDuration](self->_dataSource, "getLatestDuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sound"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getLatestDuration](self->_dataSource, "getLatestDuration"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sound"));

      return v5;
    }
    v4 = objc_claimAutoreleasedReturnValue(+[MTSound defaultSoundForCategory:](MTSound, "defaultSoundForCategory:", 1));
  }
  v5 = (void *)v4;
  return v5;
}

- (void)confirmPickingSound
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_claimAutoreleasedReturnValue(-[TKTonePickerViewController selectedToneIdentifier](self->_tonePickerViewController, "selectedToneIdentifier"));
  if (!v3)
    v3 = objc_claimAutoreleasedReturnValue(-[TKTonePickerViewController defaultToneIdentifier](self->_tonePickerViewController, "defaultToneIdentifier"));
  v9 = (id)v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sound](self, "sound"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vibrationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController sound](self, "sound"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "soundVolume"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v9, v5, v7));
  -[MTATimerCollectionViewController setSound:](self, "setSound:", v8);

  -[MTATimerCollectionViewController updateSelectedTone](self, "updateSelectedTone");
  -[MTATimerCollectionViewController dismissSoundPicker](self, "dismissSoundPicker");

}

- (void)dismissSoundPicker
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIApplicationSuspendedNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController presentedViewController](self, "presentedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "popoverPresentationController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController navigationItem](self, "navigationItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leftBarButtonItem"));
    objc_msgSend(v7, "setEnabled:", 1);

  }
  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  -[MTATimerCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", objc_msgSend(v8, "isSuspended") ^ 1, 0);

}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  if (MTUIIsPadIdiom(self, a2))
    return 30;
  else
    return 2;
}

- (void)tipViewControllerDidBecomeAvailableWithSiriTipsController:(id)a3 tipView:(id)a4
{
  _TtC11MobileTimer18SiriTipsController *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v7 = (_TtC11MobileTimer18SiriTipsController *)a3;
  v9 = a4;
  if (self->_siriTipsController != v7)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTATimerCollectionViewController.m"), 1422, CFSTR("Unexpected Siri tips controller instance"));

  }
  v10 = MTLogForCategory(8, v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Siri tip became available", v14, 2u);
  }

  objc_storeStrong((id *)&self->_siriTipView, a4);
  if ((-[NSMutableArray containsObject:](self->_sections, "containsObject:", &off_10009CE78) & 1) == 0)
  {
    -[NSMutableArray insertObject:atIndex:](self->_sections, "insertObject:atIndex:", &off_10009CE78, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
    objc_msgSend(v12, "reloadData");

  }
}

- (void)tipViewControllerWasInvalidatedWithSiriTipsController:(id)a3
{
  uint64_t v5;
  _TtC11MobileTimer18SiriTipsController *v6;
  uint64_t v7;
  NSObject *v8;
  UIView *siriTipView;
  id v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v6 = (_TtC11MobileTimer18SiriTipsController *)a3;
  if (self->_siriTipsController != v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTATimerCollectionViewController.m"), 1440, CFSTR("Unexpected Siri tips controller instance"));

  }
  if (self->_siriTipView)
  {
    v7 = MTLogForCategory(8, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dismissing Siri tip section", v13, 2u);
    }

    siriTipView = self->_siriTipView;
    self->_siriTipView = 0;

    v10 = -[NSMutableArray indexOfObject:](self->_sections, "indexOfObject:", &off_10009CE78);
    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_sections, "removeObjectAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerCollectionViewController collectionView](self, "collectionView"));
      objc_msgSend(v11, "reloadData");

    }
  }

}

- (MTSound)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
  objc_storeStrong((id *)&self->_sound, a3);
}

- (_TtC11MobileTimer18SiriTipsController)siriTipsController
{
  return self->_siriTipsController;
}

- (void)setSiriTipsController:(id)a3
{
  objc_storeStrong((id *)&self->_siriTipsController, a3);
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (MTTimerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (MTATimerAddViewController)addEditTimerController
{
  return self->_addEditTimerController;
}

- (void)setAddEditTimerController:(id)a3
{
  objc_storeStrong((id *)&self->_addEditTimerController, a3);
}

- (_UIContentUnavailableView)noItemsView
{
  return self->_noItemsView;
}

- (void)setNoItemsView:(id)a3
{
  objc_storeStrong((id *)&self->_noItemsView, a3);
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_userActivity, a3);
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (MTATimerViewController)singleTimerVC
{
  return self->_singleTimerVC;
}

- (void)setSingleTimerVC:(id)a3
{
  objc_storeStrong((id *)&self->_singleTimerVC, a3);
}

- (id)deferredAddingTimer
{
  return self->_deferredAddingTimer;
}

- (void)setDeferredAddingTimer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)remainInMultipleTimerMode
{
  return self->_remainInMultipleTimerMode;
}

- (void)setRemainInMultipleTimerMode:(BOOL)a3
{
  self->_remainInMultipleTimerMode = a3;
}

- (NSString)currentTitle
{
  return self->_currentTitle;
}

- (void)setCurrentTitle:(id)a3
{
  objc_storeStrong((id *)&self->_currentTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTitle, 0);
  objc_storeStrong(&self->_deferredAddingTimer, 0);
  objc_storeStrong((id *)&self->_singleTimerVC, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_noItemsView, 0);
  objc_storeStrong((id *)&self->_addEditTimerController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_siriTipsController, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_siriTipView, 0);
  objc_storeStrong((id *)&self->_tonePickerViewController, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
}

@end
