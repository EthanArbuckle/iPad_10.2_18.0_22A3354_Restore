@implementation MTAWorldClockTableViewController

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTAWorldClockTableViewController;
  -[MTAWorldClockTableViewController viewWillDisappear:](&v9, "viewWillDisappear:", a3);
  v7 = MTLogForCategory(8, v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100006CD4((uint64_t)self, v8);

  -[NSUserActivity resignCurrent](self->_userActivity, "resignCurrent");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTAWorldClockTableViewController;
  -[MTATableViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "_setMarginWidth:", 1.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setLayoutMarginsFollowReadableWidth:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(MTAWorldClockTableViewCell, v6), CFSTR("MTWorldClockCell"));

  -[MTAWorldClockTableViewController setupEdgeAppearance](self, "setupEdgeAppearance");
}

- (void)setupEdgeAppearance
{
  void *v3;
  id v4;

  v4 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v4, "configureWithOpaqueBackground");
  objc_msgSend(v4, "setShadowColor:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setScrollEdgeAppearance:", v4);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTAWorldClockTableViewController;
  -[MTAWorldClockTableViewController setEditing:animated:](&v8, "setEditing:animated:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  if (v4)
    v6 = 5;
  else
    v6 = 4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", v6));
  objc_msgSend(v5, "pushEvent:", v7);

}

- (void)reloadState
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  objc_msgSend(v3, "loadCities");

  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockTableViewController;
  -[MTATableViewController reloadState](&v4, "reloadState");
}

- (int64_t)numberOfItems
{
  NSArray *pptTestCities;
  NSArray *v3;
  void *v4;
  NSUInteger v5;

  pptTestCities = self->_pptTestCities;
  if (pptTestCities)
  {
    v3 = pptTestCities;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cities"));

  }
  v5 = -[NSArray count](v3, "count");

  return v5;
}

- (float)itemsTableRowHeight
{
  float result;

  +[MTAWorldClockTableViewCell defaultHeight](MTAWorldClockTableViewCell, "defaultHeight");
  return result;
}

- (MTAWorldClockTableViewController)init
{
  MTAWorldClockTableViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSUserActivity *userActivity;
  void *v10;
  void *v11;
  NSString *v12;
  BOOL IsAccessibilityCategory;
  void *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  MTAWorldClockTableViewController *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTAWorldClockTableViewController;
  v2 = -[MTATableViewController initWithTableViewStyle:](&v18, "initWithTableViewStyle:", 1);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("globe")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tabBarItem](v2, "tabBarItem"));
    objc_msgSend(v4, "setImage:", v3);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WORLD_CLOCK"), &stru_10009A4D0, 0));
    -[MTAWorldClockTableViewController setTitle:](v2, "setTitle:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController title](v2, "title"));
    v8 = objc_claimAutoreleasedReturnValue(+[NSUserActivity mtUserActivityWithActivityType:title:](NSUserActivity, "mtUserActivityWithActivityType:title:", CFSTR("com.apple.clock.worldclock"), v7));
    userActivity = v2->_userActivity;
    v2->_userActivity = (NSUserActivity *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_defaultTraitCollection"));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "preferredContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

    v2->_shouldStackViewsInCell = IsAccessibilityCategory;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v2, "handleTextSizeChange:", UIContentSizeCategoryDidChangeNotification, 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_10002F114, CFSTR("NanoMobileTimerWorldClockPreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v16 = v2;
  }

  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("NanoMobileTimerWorldClockPreferencesChangedNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockTableViewController;
  -[MTATableViewController dealloc](&v4, "dealloc");
}

- (void)handleTextSizeChange:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  BOOL IsAccessibilityCategory;
  float v8;
  double v9;
  void *v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_defaultTraitCollection"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  self->_shouldStackViewsInCell = IsAccessibilityCategory;
  -[MTAWorldClockTableViewController itemsTableRowHeight](self, "itemsTableRowHeight");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setRowHeight:", v9);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tableView](self, "tableView"));
  objc_msgSend(v11, "reloadData");

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cities"));
  if (v6)
  {

  }
  else if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    objc_msgSend(v5, "loadCities");
  }
  v21.receiver = self;
  v21.super_class = (Class)MTAWorldClockTableViewController;
  -[MTATableViewController viewWillAppear:](&v21, "viewWillAppear:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("WorldClockTableScrollPoint")));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "floatValue");
    if (v10 >= 0.0)
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tableView](self, "tableView"));
      objc_msgSend(v12, "contentSize");
      v14 = v13;

      if (v14 > v11)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tableView](self, "tableView"));
        objc_msgSend(v15, "setContentOffset:", 0.0, v11);

      }
    }
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("WorldClockTableScrollPoint"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "postNotificationName:object:", MobileTimerUserPreferencesDirty, 0);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController deferAddedCity](self, "deferAddedCity"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController deferAddedCity](self, "deferAddedCity"));
    -[MTAWorldClockTableViewController addCityWithoutUserInteraction:](self, "addCityWithoutUserInteraction:", v18);

    -[MTAWorldClockTableViewController setDeferAddedCity:](self, "setDeferAddedCity:", 0);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController deferRemovedCity](self, "deferRemovedCity"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController deferRemovedCity](self, "deferRemovedCity"));
    -[MTAWorldClockTableViewController removeCityWithoutUserInteraction:](self, "removeCityWithoutUserInteraction:", v20);

    -[MTAWorldClockTableViewController setDeferRemovedCity:](self, "setDeferRemovedCity:", 0);
  }

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "horizontalSizeClass");
  v8 = objc_msgSend(v5, "horizontalSizeClass");

  if (v7 != v8)
    -[MTATableViewController dismissAddViewController:](self, "dismissAddViewController:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTAWorldClockTableViewController;
  -[MTATableViewController viewDidAppear:](&v10, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserActivity keywords](self->_userActivity, "keywords"));
  v6 = v5;
  if (!v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cities"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_map:", &stru_100099B08));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "setByAddingObjectsFromArray:", v8));
  -[NSUserActivity setKeywords:](self->_userActivity, "setKeywords:", v9);

  if (!v5)
  -[NSUserActivity becomeCurrent](self->_userActivity, "becomeCurrent");

}

- (void)restoreWithUserActivity:(id)a3
{
  +[MTAAddClockViewController addCityFromUserActivity:parentViewController:](MTAAddClockViewController, "addCityFromUserActivity:parentViewController:", a3, self);
}

- (void)saveState
{
  -[MTAWorldClockTableViewController saveScrollPoint](self, "saveScrollPoint");
}

- (void)setupForTest:(id)a3 options:(id)a4
{
  void *v5;
  NSMutableArray *v6;
  char v7;
  char v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  NSArray *v15;
  NSArray *pptTestCities;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ALCityManager sharedManager](ALCityManager, "sharedManager", a3, a4));
  v6 = objc_opt_new(NSMutableArray);
  v7 = 1;
  do
  {
    v8 = v7;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultCitiesShownInWorldClock", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_msgSend(objc_alloc((Class)WorldClockCity), "initWithALCity:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i));
          -[NSMutableArray addObject:](v6, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    v7 = 0;
  }
  while ((v8 & 1) != 0);
  v15 = (NSArray *)-[NSMutableArray copy](v6, "copy");
  pptTestCities = self->_pptTestCities;
  self->_pptTestCities = v15;

  -[MTAWorldClockTableViewController reloadState](self, "reloadState");
}

- (id)noItemsText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NO_WORLD_CLOCKS"), &stru_10009A4D0, 0));

  return v3;
}

- (void)saveScrollPoint
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  if (-[MTAWorldClockTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tableView](self, "tableView"));
    objc_msgSend(v3, "contentOffset");
    *(float *)&v5 = v4;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("WorldClockTableScrollPoint"));

  }
}

- (void)showAddView
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v4 = objc_msgSend(v3, "canAddCity");

  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)MTAWorldClockTableViewController;
    -[MTATableViewController showAddViewWithCompletion:](&v13, "showAddViewWithCompletion:", &stru_100099B28);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TOO_MANY_WORLD_CLOCKS_TITLE"), &stru_10009A4D0, 0));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TOO_MANY_WORLD_CLOCKS_BODY"), &stru_10009A4D0, 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v12, v7, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_10009A4D0, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, 0));
    objc_msgSend(v8, "addAction:", v11);

    -[MTAWorldClockTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }
}

- (id)addViewController
{
  MTAAddClockViewController *v3;
  MTAAddSheetNavigationController *v4;

  v3 = objc_alloc_init(MTAAddClockViewController);
  -[MTAAddClockViewController setDelegate:](v3, "setDelegate:", self);
  v4 = -[MTAAddSheetNavigationController initWithRootViewController:]([MTAAddSheetNavigationController alloc], "initWithRootViewController:", v3);

  return v4;
}

- (void)addCityWithoutUserInteraction:(id)a3
{
  -[MTAWorldClockTableViewController addClockViewController:addCity:](self, "addClockViewController:addCity:", 0, a3);
  -[MTAWorldClockTableViewController finishAddViewControllerDismissal:](self, "finishAddViewControllerDismissal:", 0);
}

- (void)removeCityWithoutUserInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cities"));
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v7, 0));
    -[MTAWorldClockTableViewController removeCityAtIndexPath:](self, "removeCityAtIndexPath:", v8);

  }
}

- (void)addClockViewController:(id)a3 addCity:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cities"));
  v8 = objc_msgSend(v7, "count");

  v9 = objc_msgSend(v6, "addCity:", v5);
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cities"));
    v12 = objc_msgSend(v11, "count");

    if (v8 != v12)
    {
      objc_msgSend(v6, "saveCities");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tableView](self, "tableView"));
      v15 = v10;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
      objc_msgSend(v13, "insertRowsAtIndexPaths:withRowAnimation:", v14, 5);

      +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", kMTCAWorldClockAdds);
    }
    -[MTAWorldClockTableViewController scrollToCityAtIndex:animated:](self, "scrollToCityAtIndex:animated:", v9, 0);

  }
}

- (void)scrollToCityAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3, 0));
  objc_msgSend(v7, "scrollToRowAtIndexPath:atScrollPosition:animated:", v6, 3, v4);

}

- (void)finishAddViewControllerDismissal:(BOOL)a3
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTAWorldClockTableViewController;
  -[MTATableViewController finishAddViewControllerDismissal:](&v5, "finishAddViewControllerDismissal:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 4));
  objc_msgSend(v3, "pushEvent:", v4);

}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a5;
  v9 = v8;
  if (a4 == 1 && v8 && !self->_pptTestCities)
    -[MTAWorldClockTableViewController removeCityAtIndexPath:](self, "removeCityAtIndexPath:", v8);

}

- (void)removeCityAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "beginUpdates");

  objc_msgSend(v5, "removeCityAtIndex:", objc_msgSend(v4, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v4));
  objc_msgSend(v7, "deleteRowsAtIndexPaths:withRowAnimation:", v8, 2);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tableView](self, "tableView"));
  v11.receiver = self;
  v11.super_class = (Class)MTAWorldClockTableViewController;
  -[MTATableViewController tableView:commitEditingStyle:forRowAtIndexPath:](&v11, "tableView:commitEditingStyle:forRowAtIndexPath:", v9, 1, v4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockTableViewController tableView](self, "tableView"));
  objc_msgSend(v10, "endUpdates");

  objc_msgSend(v5, "saveCities");
  +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", kMTCAWorldClockRemoves);

}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v13;

  if (!self->_pptTestCities)
  {
    v6 = a5;
    v7 = a4;
    v13 = (id)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cities"));
    v9 = objc_msgSend(v8, "count");

    v10 = objc_msgSend(v7, "row");
    v11 = objc_msgSend(v6, "row");

    if (v10 != v11 && (uint64_t)v10 < (uint64_t)v9 && (uint64_t)v11 < (uint64_t)v9)
    {
      objc_msgSend(v13, "moveCityFromIndex:toIndex:", v10, v11);
      objc_msgSend(v13, "saveCities");
    }

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSArray *pptTestCities;
  NSArray *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  pptTestCities = self->_pptTestCities;
  if (pptTestCities)
  {
    v9 = pptTestCities;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cities"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("MTWorldClockCell"), v7));
  objc_msgSend(v11, "updateShouldStackViewInCell:", self->_shouldStackViewsInCell);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v9, "objectAtIndex:", objc_msgSend(v7, "row")));
  objc_msgSend(v11, "setCity:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "city"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
  objc_msgSend(v11, "setAccessibilityIdentifier:", v14);

  return v11;
}

- (WorldClockCity)deferAddedCity
{
  return self->deferAddedCity;
}

- (void)setDeferAddedCity:(id)a3
{
  objc_storeStrong((id *)&self->deferAddedCity, a3);
}

- (WorldClockCity)deferRemovedCity
{
  return self->deferRemovedCity;
}

- (void)setDeferRemovedCity:(id)a3
{
  objc_storeStrong((id *)&self->deferRemovedCity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->deferRemovedCity, 0);
  objc_storeStrong((id *)&self->deferAddedCity, 0);
  objc_storeStrong((id *)&self->_pptTestCities, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end
