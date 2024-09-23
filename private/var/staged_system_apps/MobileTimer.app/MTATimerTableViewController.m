@implementation MTATimerTableViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MTATimerTableViewController;
  -[MTATableViewController viewDidLoad](&v21, "viewDidLoad");
  v3 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v3, "configureWithOpaqueBackground");
  objc_msgSend(v3, "setShadowColor:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setScrollEdgeAppearance:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setAllowsSelectionDuringEditing:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setAllowsSelection:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setLayoutMarginsFollowReadableWidth:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setEstimatedRowHeight:", 96.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setRowHeight:", UITableViewAutomaticDimension);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", objc_opt_class(MTATimerTableViewCell, v11), CFSTR("MTATimerCellReuseIdentifier"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", objc_opt_class(MTATimerRecentCell, v13), CFSTR("kMTATimerRecentCelldentifier"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
  objc_msgSend(v14, "registerClass:forCellReuseIdentifier:", objc_opt_class(MTASingleTimerTableViewCell, v15), CFSTR("kMTASingleTimerCelldentifier"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
  objc_msgSend(v16, "registerClass:forCellReuseIdentifier:", objc_opt_class(MTATimerTipTableViewCell, v17), CFSTR("kMTATimerTipTableViewCellIdentifier"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
  objc_msgSend(v18, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(UITableViewHeaderFooterView, v19), CFSTR("kMTATimerTableViewHeaderReuseIdentifier"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v20, "addObserver:selector:name:object:", self, "handleEnterBackground", UIApplicationDidEnterBackgroundNotification, 0);

  +[MTAUtilities updateTimerAppShortcuts](MTAUtilities, "updateTimerAppShortcuts");
}

- (void)updateSelectedSoundUI
{
  void *v3;
  void *v4;

  if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController singleTimerCell](self, "singleTimerCell"));
    if (v3)
    {
      v4 = v3;
      -[MTATimerTableViewController updateSelectedSoundCell:](self, "updateSelectedSoundCell:", v3);
      v3 = v4;
    }

  }
}

- (void)updateAddButton
{
  void *v3;
  id v4;

  if (-[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MTATableViewController addButton](self, "addButton"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v3, "setRightBarButtonItem:", v4);

  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v4, "setRightBarButtonItem:", 0);
  }

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  id v6;
  int64_t result;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4));
  v6 = objc_msgSend(v5, "integerValue");

  result = 1;
  switch((unint64_t)v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
      v9 = objc_msgSend(v8, "numberOfActiveTimers");

      result = (int64_t)v9;
      break;
    case 2uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getRecentDurations"));
      v12 = objc_msgSend(v11, "count");

      result = (int64_t)v12;
      break;
    case 3uLL:
      result = self->_siriTipView != 0;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)stopUpdatingTimerUI
{
  uint64_t v3;
  NSObject *v4;
  NSTimer *updateTimer;
  int v6;
  MTATimerTableViewController *v7;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ stopUpdatingTimerUI", (uint8_t *)&v6, 0xCu);
  }

  -[NSTimer invalidate](self->_updateTimer, "invalidate");
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

}

- (MTSound)sound
{
  return self->_sound;
}

- (id)singleTimerCell
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[NSMutableArray indexOfObject:](self->_sections, "indexOfObject:", &off_10009CE18);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cellForRowAtIndexPath:", v5));

  return v6;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (void)setSound:(id)a3
{
  objc_storeStrong((id *)&self->_sound, a3);
}

- (void)setReloadDataFuture:(id)a3
{
  objc_storeStrong((id *)&self->_reloadDataFuture, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void)reloadSections
{
  id v3;
  NSMutableArray *sections;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NSMutableArray removeAllObjects](self->_sections, "removeAllObjects");
  if (self->_siriTipView)
    -[NSMutableArray addObject:](self->_sections, "addObject:", &off_10009CDE8);
  v3 = -[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers");
  sections = self->_sections;
  if (v3)
  {
    -[NSMutableArray addObject:](sections, "addObject:", &off_10009CE00);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATableViewController addButton](self, "addButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v6, "setRightBarButtonItem:", v5);

  }
  else
  {
    -[NSMutableArray addObject:](sections, "addObject:", &off_10009CE18);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "setRightBarButtonItem:", 0);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getRecentDurations](self->_dataSource, "getRecentDurations"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
    -[NSMutableArray addObject:](self->_sections, "addObject:", &off_10009CE30);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)-[NSMutableArray count](self->_sections, "count", a3);
}

- (int64_t)numberOfItems
{
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  char *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
  v4 = (char *)objc_msgSend(v3, "numberOfActiveTimers");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getRecentDurations"));
  v7 = &v4[(_QWORD)objc_msgSend(v6, "count")];

  return (int64_t)v7;
}

- (id)noItemsText
{
  return 0;
}

- (MTATimerTableViewController)initWithTimerManager:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  MTATimerTableViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSUserActivity *userActivity;
  NSMutableArray *v17;
  NSMutableArray *sections;
  MTATimerTableViewController *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MTATimerTableViewController;
  v8 = -[MTATableViewController initWithTableViewStyle:](&v21, "initWithTableViewStyle:", 1);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("timer")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tabBarItem](v8, "tabBarItem"));
    objc_msgSend(v10, "setImage:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TIMERS"), &stru_10009A4D0, 0));
    -[MTATimerTableViewController setTitle:](v8, "setTitle:", v12);

    -[MTATimerTableViewController setTimerManager:](v8, "setTimerManager:", v6);
    -[MTATimerTableViewController setDataSource:](v8, "setDataSource:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](v8, "dataSource"));
    objc_msgSend(v13, "registerObserver:", v8);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController title](v8, "title"));
    v15 = objc_claimAutoreleasedReturnValue(+[NSUserActivity mtUserActivityWithActivityType:title:](NSUserActivity, "mtUserActivityWithActivityType:title:", CFSTR("com.apple.clock.timer"), v14));
    userActivity = v8->_userActivity;
    v8->_userActivity = (NSUserActivity *)v15;

    v17 = objc_opt_new(NSMutableArray);
    sections = v8->_sections;
    v8->_sections = v17;

    v19 = v8;
  }

  return v8;
}

- (MTTimerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)dataSourceDidReloadAllDurations:(id)a3
{
  void *v4;

  -[MTATableViewController _reloadUI:](self, "_reloadUI:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController currentTone](self, "currentTone"));
  -[MTATimerTableViewController setSound:](self, "setSound:", v4);

  -[MTATimerTableViewController updateSelectedSoundUI](self, "updateSelectedSoundUI");
}

- (void)dataSourceDidReload:(id)a3
{
  void *v4;

  -[MTATableViewController _reloadUI:](self, "_reloadUI:", 0);
  -[MTATimerTableViewController reloadSections](self, "reloadSections");
  -[MTATimerTableViewController updateAddButton](self, "updateAddButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

  if (-[MTTimerDataSource numberOfActiveTimers](self->_dataSource, "numberOfActiveTimers"))
    -[MTATimerTableViewController startUpdatingTimerUI](self, "startUpdatingTimerUI");
  else
    -[MTATimerTableViewController stopUpdatingTimerUI](self, "stopUpdatingTimerUI");
}

- (id)currentTone
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController sound](self, "sound"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController sound](self, "sound"));
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

- (void)_reloadData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource reloadTimers](self->_dataSource, "reloadTimers"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006890;
  v8[3] = &unk_100099920;
  v9 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "addCompletionBlock:", v8);
  -[MTATimerTableViewController setReloadDataFuture:](self, "setReloadDataFuture:", v5);
  -[MTTimerDataSource reloadTimerDurations](self->_dataSource, "reloadTimerDurations");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTATimerTableViewController;
  -[MTATableViewController viewWillAppear:](&v7, "viewWillAppear:", a3);
  -[MTATimerTableViewController startUpdatingTimerUI](self, "startUpdatingTimerUI");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController timerToEdit](self, "timerToEdit"));

  if (v4)
    -[MTATimerTableViewController setTimerToEdit:](self, "setTimerToEdit:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController siriTipsController](self, "siriTipsController"));
  objc_msgSend(v5, "setDelegate:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController siriTipsController](self, "siriTipsController"));
  objc_msgSend(v6, "checkForSiriTips");

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  UIView *siriTipView;
  objc_super v8;

  v3 = a3;
  -[MTATableViewController saveState](self, "saveState");
  -[MTATimerTableViewController stopUpdatingTimerUI](self, "stopUpdatingTimerUI");
  -[NSUserActivity resignCurrent](self->_userActivity, "resignCurrent");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController siriTipsController](self, "siriTipsController"));
  objc_msgSend(v5, "setDelegate:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController siriTipsController](self, "siriTipsController"));
  objc_msgSend(v6, "cancel");

  siriTipView = self->_siriTipView;
  self->_siriTipView = 0;

  v8.receiver = self;
  v8.super_class = (Class)MTATimerTableViewController;
  -[MTATimerTableViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_updateTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MTATimerTableViewController;
  -[MTATableViewController dealloc](&v3, "dealloc");
}

- (void)_reloadDataIfNecessary
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController reloadDataFuture](self, "reloadDataFuture"));

  if (!v3)
    -[MTATimerTableViewController _reloadData:](self, "_reloadData:", 0);
}

- (void)dataSourceDidReloadRecentDurations:(id)a3
{
  id v4;

  -[MTATableViewController _reloadUI:](self, "_reloadUI:", 0);
  -[MTATimerTableViewController reloadSections](self, "reloadSections");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTATimerTableViewController;
  -[MTATableViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[NSUserActivity becomeCurrent](self->_userActivity, "becomeCurrent");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  self->_viewVisible = 0;
  -[NSUserActivity resignCurrent](self->_userActivity, "resignCurrent");
  v5.receiver = self;
  v5.super_class = (Class)MTATimerTableViewController;
  -[MTATableViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)startUpdatingTimerUI
{
  NSTimer *updateTimer;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  NSTimer *v9;
  NSTimer *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  updateTimer = self->_updateTimer;
  v4 = MTLogForCategory(8, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (updateTimer)
  {
    if (v6)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NSTimer exists", v11, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating an NSTimer to update the UI", buf, 2u);
    }

    v7 = objc_alloc((Class)NSTimer);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = (NSTimer *)objc_msgSend(v7, "initWithFireDate:interval:target:selector:userInfo:repeats:", v8, self, "updateTimerTick:", 0, 1, 0.25);
    v10 = self->_updateTimer;
    self->_updateTimer = v9;

    v5 = objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    -[NSObject addTimer:forMode:](v5, "addTimer:forMode:", self->_updateTimer, NSDefaultRunLoopMode);
  }

}

- (void)updateTimerTick:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (-[MTATimerTableViewController isViewLoaded](self, "isViewLoaded", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForVisibleRows"));

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellForRowAtIndexPath:", v10));

          v13 = objc_opt_class(MTATimerTableViewCell);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
          {
            v14 = objc_msgSend(v10, "row");
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
            v16 = objc_msgSend(v15, "numberOfActiveTimers");

            if (v14 < v16)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activeTimerAtRow:", objc_msgSend(v10, "row")));

              if (objc_msgSend(v18, "state") == (id)3)
                objc_msgSend(v12, "tickWithTimer:", v18);

            }
          }

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

  }
}

- (void)showAddView
{
  objc_super v3;

  -[MTATimerTableViewController dismissAddEditViewController:](self, "dismissAddEditViewController:", self);
  -[MTATimerTableViewController setTimerToEdit:](self, "setTimerToEdit:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MTATimerTableViewController;
  -[MTATableViewController showAddView](&v3, "showAddView");
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));
  v7 = objc_msgSend(v6, "integerValue");

  switch((unint64_t)v7)
  {
    case 0uLL:
      +[MTATimerControlsView estimatedViewHeight](MTATimerControlsView, "estimatedViewHeight");
      v9 = v8 + 32.0;
      goto LABEL_15;
    case 1uLL:
      v10 = objc_msgSend(v5, "row");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
      v12 = objc_msgSend(v11, "numberOfActiveTimers");

      if (v10 >= v12)
        goto LABEL_14;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeTimerAtRow:", objc_msgSend(v5, "row")));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
      +[MTATimerTableViewCell estimatedCellHeightForTimerWithTitle:](MTATimerTableViewCell, "estimatedCellHeightForTimerWithTitle:", v15);
      v9 = v16;

      goto LABEL_15;
    case 2uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "getRecentDurations"));
      v19 = objc_msgSend(v18, "count");

      if (objc_msgSend(v5, "row") >= v19)
      {
        v30 = MTLogForCategory(8, v20);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          sub_100065540();
        goto LABEL_13;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getRecentDurations](self->_dataSource, "getRecentDurations"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

      if (!v22)
      {
        v32 = MTLogForCategory(8, v23);
        v31 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          sub_1000654C8();
LABEL_13:

        goto LABEL_14;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "title"));
      +[MTATimerRecentCell estimatedCellHeightForTimerWithTitle:](MTATimerRecentCell, "estimatedCellHeightForTimerWithTitle:", v24);
      v9 = v25;

LABEL_15:
      return v9;
    case 3uLL:
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
      objc_msgSend(v26, "bounds");
      +[MTATimerTipTableViewCell sizeThatFits:siriTipView:](MTATimerTipTableViewCell, "sizeThatFits:siriTipView:", self->_siriTipView, v27, v28);
      v9 = v29;

      goto LABEL_15;
    default:
LABEL_14:
      v9 = 110.0;
      goto LABEL_15;
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  objc_super v22;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4 == 1 && v9)
  {
    v11 = objc_msgSend(v9, "row");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v10, "section")));
    v13 = objc_msgSend(v12, "integerValue");

    if (v13 == (id)2)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getRecentDurations](self->_dataSource, "getRecentDurations"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v10, "row")));

      if (v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController timerManager](self, "timerManager"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "removeRecentDuration:", v15));

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "reschedule:", v19));
        v21 = objc_msgSend(v20, "addCompletionBlock:", &stru_100099D10);

      }
    }
    else
    {
      if (v13 != (id)1)
      {
LABEL_9:
        v22.receiver = self;
        v22.super_class = (Class)MTATimerTableViewController;
        -[MTATableViewController tableView:commitEditingStyle:forRowAtIndexPath:](&v22, "tableView:commitEditingStyle:forRowAtIndexPath:", v8, 1, v10);
        goto LABEL_10;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activeTimerAtRow:", v11));

      -[MTATimerTableViewController _removeTimer:withCompletionBlock:](self, "_removeTimer:withCompletionBlock:", v15, &stru_100099CF0);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void *v35;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
  v9 = objc_msgSend(v8, "integerValue");

  switch((unint64_t)v9)
  {
    case 0uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kMTASingleTimerCelldentifier"), v7));
      objc_msgSend(v10, "updateDelegate:", self);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getLatestDuration](self->_dataSource, "getLatestDuration"));
      objc_msgSend(v10, "updateWithLatestDuration:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "controlsView"));
      objc_msgSend(v12, "setCurrentLabel:", 0);

      -[MTATimerTableViewController updateSelectedSoundCell:](self, "updateSelectedSoundCell:", v10);
      goto LABEL_14;
    case 1uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("MTATimerCellReuseIdentifier"), v7));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
      v14 = objc_msgSend(v13, "numberOfActiveTimers");

      if ((uint64_t)objc_msgSend(v7, "row") >= (uint64_t)v14)
      {
        v31 = MTLogForCategory(8, v15);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          sub_100065614();

      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activeTimerAtRow:", objc_msgSend(v7, "row")));

        if (v17)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject timerIDString](v17, "timerIDString"));
          objc_msgSend(v10, "setAccessibilityIdentifier:", v19);

          objc_msgSend(v10, "setUserInteractionEnabled:", 1);
          objc_msgSend(v10, "setDelegate:", self);
          -[NSObject remainingTime](v17, "remainingTime");
          v21 = v20;
          -[NSObject duration](v17, "duration");
          v23 = v22;
          v24 = -[NSObject state](v17, "state");
          if (-[NSObject hasDefaultTitle](v17, "hasDefaultTitle"))
          {
            objc_msgSend(v10, "setRemainingTime:duration:state:title:forceRefresh:", v24, 0, 1, v21, v23);
          }
          else
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject displayTitle](v17, "displayTitle"));
            objc_msgSend(v10, "setRemainingTime:duration:state:title:forceRefresh:", v24, v35, 1, v21, v23);

          }
          goto LABEL_20;
        }
      }
      v33 = MTLogForCategory(8, v18);
      v17 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1000655A8(v7, (const char *)v17);
LABEL_20:

LABEL_21:
      return v10;
    case 2uLL:
      v17 = objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getRecentDurations](self->_dataSource, "getRecentDurations"));
      v25 = objc_msgSend(v7, "row");
      if (v25 >= -[NSObject count](v17, "count"))
      {
        v27 = MTLogForCategory(8, v26);
        v28 = (char *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
          sub_10006567C(v7, v28);

      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kMTATimerRecentCelldentifier"), v7));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("recent-timer-%ld"), objc_msgSend(v7, "row")));
      objc_msgSend(v10, "setAccessibilityIdentifier:", v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
      objc_msgSend(v10, "setDelegate:duration:", self, v30);

      objc_msgSend(v10, "setSelectionStyle:", 0);
      goto LABEL_20;
    case 3uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kMTATimerTipTableViewCellIdentifier"), v7));
      objc_msgSend(v10, "setSiriTipView:", self->_siriTipView);
LABEL_14:
      objc_msgSend(v10, "setSelectionStyle:", 0);
      goto LABEL_21;
    default:
      v10 = 0;
      goto LABEL_21;
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  id v22;

  v22 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
  v9 = objc_msgSend(v8, "integerValue");

  if (v9 == (id)1)
  {
    v10 = objc_msgSend(v7, "row");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
    v12 = objc_msgSend(v11, "numberOfActiveTimers");

    if (v10 < v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeTimerAtRow:", objc_msgSend(v7, "row")));

      v15 = v22;
      objc_msgSend(v14, "remainingTime");
      v17 = v16;
      objc_msgSend(v14, "duration");
      v19 = v18;
      v20 = objc_msgSend(v14, "state");
      if (objc_msgSend(v14, "isCurrentTimer"))
      {
        objc_msgSend(v15, "setRemainingTime:duration:state:title:forceRefresh:", v20, 0, 1, v17, v19);
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
        objc_msgSend(v15, "setRemainingTime:duration:state:title:forceRefresh:", v20, v21, 1, v17, v19);

      }
    }
  }

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("kMTATimerTableViewHeaderReuseIdentifier")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4));
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 == (id)2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TIMER_ADD_SHEET_RECENTS"), &stru_10009A4D0, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController view](self, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTAUtilities sectionHeaderConfigurationWithTitle:isRTL:](MTAUtilities, "sectionHeaderConfigurationWithTitle:isRTL:", v10, objc_msgSend(v11, "mtui_isRTL")));

    objc_msgSend(v6, "setContentConfiguration:", v12);
    v13 = v6;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v4;
  id v5;
  double result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4));
  v5 = objc_msgSend(v4, "integerValue");

  result = UITableViewAutomaticDimension;
  if (v5 == (id)1)
    return 0.0;
  return result;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  void *v4;
  id v5;
  BOOL v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4));
  v5 = objc_msgSend(v4, "integerValue");

  if (v5)
    v6 = v5 == (id)3;
  else
    v6 = 1;
  return !v6;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  void *v4;
  id v5;
  BOOL v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4));
  v5 = objc_msgSend(v4, "integerValue");

  if (v5)
    v6 = v5 == (id)3;
  else
    v6 = 1;
  return !v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v11, "section")));
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTimerAtRow:", objc_msgSend(v11, "row")));
    -[MTATimerTableViewController setTimerToEdit:](self, "setTimerToEdit:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController navigationController](self, "navigationController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController timerAddEditController](self, "timerAddEditController"));
    objc_msgSend(v9, "pushViewController:animated:", v10, 1);

  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  void *v4;
  char *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(a4, "section", a3)));
  v5 = (char *)objc_msgSend(v4, "integerValue");

  return (unint64_t)(v5 - 1) < 2;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTATimerTableViewController;
  -[MTATimerTableViewController setEditing:animated:](&v4, "setEditing:animated:", a3, a4);
}

- (void)_removeTimer:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;

  v6 = a3;
  v7 = a4;
  v9 = MTLogForCategory(8, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timerID"));
    *(_DWORD *)buf = 138543362;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing timer %{public}@", buf, 0xCu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "removeTimer:", v6));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100043B80;
  v16[3] = &unk_100099D38;
  v17 = v7;
  v14 = v7;
  v15 = objc_msgSend(v13, "addSuccessBlock:", v16);

}

- (id)addViewController
{
  MTAAddSheetNavigationController *v3;
  void *v4;
  MTAAddSheetNavigationController *v5;
  void *v6;
  void *v7;

  v3 = [MTAAddSheetNavigationController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController timerAddEditController](self, "timerAddEditController"));
  v5 = -[MTAAddSheetNavigationController initWithRootViewController:](v3, "initWithRootViewController:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController view](v5, "view"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  return v5;
}

- (id)timerAddEditController
{
  void *v3;
  MTATimerViewController *v4;
  void *v5;
  MTATimerAddViewController *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController timerToEdit](self, "timerToEdit"));

  if (v3)
  {
    v4 = [MTATimerViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController timerToEdit](self, "timerToEdit"));
    v6 = -[MTATimerViewController initWithTimer:timerManager:dataSource:delegate:](v4, "initWithTimer:timerManager:dataSource:delegate:", v5, self->_timerManager, self->_dataSource, self);

  }
  else
  {
    v6 = -[MTATimerAddViewController initWithDataSource:timerManager:delegate:]([MTATimerAddViewController alloc], "initWithDataSource:timerManager:delegate:", self->_dataSource, self->_timerManager, self);
  }
  return v6;
}

- (void)didCancelTimerWithSender:(id)a3
{
  -[MTATimerTableViewController dismissAddEditViewController:](self, "dismissAddEditViewController:", a3);
  -[MTATimerTableViewController _reloadData:](self, "_reloadData:", 0);
}

- (void)didReceiveStartTimerShortcutAction
{
  -[MTATimerTableViewController handleStartTimerShortcutAction](self, "handleStartTimerShortcutAction");
}

- (void)dismissAddEditViewController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController timerToEdit](self, "timerToEdit"));

  if (v4)
    -[MTATimerTableViewController popTimerViewController](self, "popTimerViewController");
  else
    -[MTATableViewController dismissAddViewController:](self, "dismissAddViewController:", v5);

}

- (void)popTimerViewController
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = objc_msgSend(v3, "isSuspended") ^ 1;

  -[MTATableViewController finishAddViewControllerDismissal:](self, "finishAddViewControllerDismissal:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController navigationController](self, "navigationController"));
  v5 = objc_msgSend(v6, "popViewControllerAnimated:", v4);

}

- (void)didSendPauseAction:(id)a3
{
  -[MTATimerTableViewController updateTimerWithSender:state:](self, "updateTimerWithSender:state:", a3, 2);
}

- (void)didSendResumeAction:(id)a3
{
  -[MTATimerTableViewController updateTimerWithSender:state:](self, "updateTimerWithSender:state:", a3, 3);
}

- (void)updateTimerWithSender:(id)a3 state:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  MTATimerTableViewController *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unint64_t v30;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForCell:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeTimerAtRow:", objc_msgSend(v8, "row")));

  v12 = MTLogForCategory(8, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timerID"));
    *(_DWORD *)buf = 138543874;
    v26 = self;
    v27 = 2114;
    v28 = v14;
    v29 = 2048;
    v30 = a4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ updating timer:%{public}@ with state: %li", buf, 0x20u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timerByUpdatingWithState:", a4));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource updateTimer:reload:](self->_dataSource, "updateTimer:reload:", v15, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "reschedule:", v17));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100044020;
  v22[3] = &unk_100099D60;
  v22[4] = self;
  v23 = v6;
  v24 = v15;
  v19 = v15;
  v20 = v6;
  v21 = objc_msgSend(v18, "addSuccessBlock:", v22);

}

- (void)didStartTimerWithDuration:(double)a3 title:(id)a4 sound:(id)a5 sender:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  MTATimerTableViewController *v30;
  __int16 v31;
  void *v32;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(objc_alloc((Class)MTMutableTimer), "initWithState:duration:", 3, a3);
  v15 = v13;
  if (v10)
    objc_msgSend(v13, "setTitle:", v10);
  if (v11)
    objc_msgSend(v15, "setSound:", v11);
  v16 = MTLogForCategory(8, v14);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timerID"));
    *(_DWORD *)buf = 138543618;
    v30 = self;
    v31 = 2114;
    v32 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@ starting new timer: %{public}@ and dismissing add controller", buf, 0x16u);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController dataSource](self, "dataSource"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "addTimer:", v15));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "reschedule:", v21));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100044378;
  v26[3] = &unk_100099D88;
  v26[4] = self;
  v27 = v15;
  v28 = v12;
  v23 = v12;
  v24 = v15;
  v25 = objc_msgSend(v22, "addCompletionBlock:", v26);

}

- (void)handleStartTimerShortcutAction
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004447C;
  v2[3] = &unk_100099320;
  v2[4] = self;
  -[MTATableViewController reloadState:](self, "reloadState:", v2);
}

- (void)didSelectRecentDuration:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "duration");
  v6 = v5;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sound"));

  -[MTATimerTableViewController didStartTimerWithDuration:title:sound:sender:](self, "didStartTimerWithDuration:title:sound:sender:", v8, v7, 0, v6);
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
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController currentTone](self, "currentTone", a3));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "toneIdentifier"));
  -[TKTonePickerViewController setSelectedToneIdentifier:](self->_tonePickerViewController, "setSelectedToneIdentifier:", v20);

  -[TKTonePickerViewController setShowsToneStore:](self->_tonePickerViewController, "setShowsToneStore:", MTShouldAllowToneStore());
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v21, "addObserver:selector:name:object:", self, "confirmPickingSound", UIApplicationSuspendedNotification, 0);

  v22 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_tonePickerViewController);
  objc_msgSend(v22, "setDelegate:", self);
  -[MTATimerTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);

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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController sound](self, "sound"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vibrationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController sound](self, "sound"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "soundVolume"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v9, v5, v7));
  -[MTATimerTableViewController setSound:](self, "setSound:", v8);

  -[MTATimerTableViewController updateSelectedSoundUI](self, "updateSelectedSoundUI");
  -[MTATimerTableViewController dismissSoundPicker](self, "dismissSoundPicker");

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

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController presentedViewController](self, "presentedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "popoverPresentationController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController navigationItem](self, "navigationItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leftBarButtonItem"));
    objc_msgSend(v7, "setEnabled:", 1);

  }
  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  -[MTATimerTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", objc_msgSend(v8, "isSuspended") ^ 1, 0);

}

- (void)updateSelectedSoundCell:(id)a3
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController currentTone](self, "currentTone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toneIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController sound](self, "sound"));
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

- (void)startTimer:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController singleTimerCell](self, "singleTimerCell", a3));
  if (v4)
  {
    v11 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "controlsView"));
    objc_msgSend(v5, "countDownDuration");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "controlsView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getCurrentLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController currentTone](self, "currentTone"));
    -[MTATimerTableViewController didStartTimerWithDuration:title:sound:sender:](self, "didStartTimerWithDuration:title:sound:sender:", v9, v10, 0, v7);

    v4 = v11;
  }

}

- (id)defaultEditLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Timer"), &stru_10009A4D0, 0));

  return v3;
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
  void *v14;
  uint8_t v15[16];

  v7 = (_TtC11MobileTimer18SiriTipsController *)a3;
  v9 = a4;
  if (self->_siriTipsController != v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTATimerTableViewController.m"), 836, CFSTR("Unexpected Siri tips controller instance"));

  }
  v10 = MTLogForCategory(8, v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Siri tip became available", v15, 2u);
  }

  objc_storeStrong((id *)&self->_siriTipView, a4);
  if ((-[NSMutableArray containsObject:](self->_sections, "containsObject:", &off_10009CDE8) & 1) == 0)
  {
    -[NSMutableArray insertObject:atIndex:](self->_sections, "insertObject:atIndex:", &off_10009CDE8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 0));
    objc_msgSend(v12, "insertSections:withRowAnimation:", v13, 3);

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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v6 = (_TtC11MobileTimer18SiriTipsController *)a3;
  if (self->_siriTipsController != v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTATimerTableViewController.m"), 853, CFSTR("Unexpected Siri tips controller instance"));

  }
  if (self->_siriTipView)
  {
    v7 = MTLogForCategory(8, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dismissing Siri tip section", v15, 2u);
    }

    siriTipView = self->_siriTipView;
    self->_siriTipView = 0;

    v10 = -[NSMutableArray indexOfObject:](self->_sections, "indexOfObject:", &off_10009CDE8);
    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v10;
      -[NSMutableArray removeObjectAtIndex:](self->_sections, "removeObjectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerTableViewController tableView](self, "tableView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v11));
      objc_msgSend(v12, "deleteSections:withRowAnimation:", v13, 3);

    }
  }

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

- (NAFuture)reloadDataFuture
{
  return self->_reloadDataFuture;
}

- (MTTimer)timerToEdit
{
  return self->_timerToEdit;
}

- (void)setTimerToEdit:(id)a3
{
  objc_storeStrong((id *)&self->_timerToEdit, a3);
}

- (TKTonePickerViewController)tonePickerViewController
{
  return self->_tonePickerViewController;
}

- (void)setTonePickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tonePickerViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tonePickerViewController, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_timerToEdit, 0);
  objc_storeStrong((id *)&self->_reloadDataFuture, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_siriTipsController, 0);
  objc_storeStrong((id *)&self->_siriTipView, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end
