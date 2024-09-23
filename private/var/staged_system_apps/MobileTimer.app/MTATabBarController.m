@implementation MTATabBarController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTATabBarController;
  -[MTATabBarController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController traitCollection](self, "traitCollection"));
  -[MTATabBarController invalidateViewControllersWithTraitCollection:](self, "invalidateViewControllersWithTraitCollection:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void (**v5)(void);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTATabBarController;
  -[MTATabBarController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController deferredEditingAction](self, "deferredEditingAction"));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MTATabBarController deferredEditingAction](self, "deferredEditingAction"));
    v5[2]();

    -[MTATabBarController setDeferredEditingAction:](self, "setDeferredEditingAction:", 0);
  }
}

- (id)topViewControllerForTab:(unint64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController navigationControllerForTab:](self, "navigationControllerForTab:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));

  return v4;
}

- (id)timerViewController
{
  return -[MTATabBarController topViewControllerForTab:](self, "topViewControllerForTab:", 3);
}

- (unint64_t)supportedInterfaceOrientations
{
  if (MTUIIsPadIdiom(self, a2))
    return 30;
  else
    return 2;
}

- (id)stopwatchViewController
{
  return -[MTATabBarController topViewControllerForTab:](self, "topViewControllerForTab:", 2);
}

- (void)restoreWorldClockTabWithEvent:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (MTUIIsPadIdiom(v8, v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPath"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockPadController](self, "worldClockPadController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPath"));
      objc_msgSend(v6, "restoreIndexPath:", v7);

    }
  }

}

- (void)restoreState
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006980;
  v4[3] = &unk_1000993E0;
  v4[4] = self;
  objc_msgSend(v3, "restoreLastEventWithCompletion:", v4);

}

- (void)populateTabIndexes
{
  NSArray *v3;
  NSArray *tabIndexes;
  NSMutableArray *v5;

  v5 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", &off_10009CF10);
  v3 = (NSArray *)-[NSMutableArray copy](v5, "copy");
  tabIndexes = self->_tabIndexes;
  self->_tabIndexes = v3;

}

- (id)navigationControllerForTab:(unint64_t)a3
{
  NSArray *tabIndexes;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  tabIndexes = self->_tabIndexes;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = -[NSArray indexOfObject:](tabIndexes, "indexOfObject:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController viewControllers](self, "viewControllers"));
  v8 = objc_msgSend(v7, "count");

  if ((uint64_t)v6 >= (uint64_t)v8)
  {
    v10 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController viewControllers](self, "viewControllers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v6));

  }
  return v10;
}

- (id)navigationControllerForHorizontalSizeClass:(int64_t)a3 verticalSizeClass:(int64_t)a4 atIndex:(unint64_t)a5
{
  UINavigationController *worldClockNavControllerSmall;
  MTAWorldClockTableViewController *v8;
  UINavigationController *v9;
  UINavigationController *v10;
  UINavigationController *v11;
  void *v12;
  void *v13;
  id *p_alarmNavControllerSmall;
  UINavigationController *alarmNavControllerSmall;
  MTAAlarmTableViewController *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  int *v21;
  UINavigationController *stopwatchNavController;
  MTAStopwatchViewController *v23;
  UINavigationController *v24;
  UINavigationController *v25;
  _BOOL8 v26;
  _TtC11MobileTimer18SiriTipsController *v27;
  _TtC11MobileTimer18SiriTipsController *siriTipsController;
  UINavigationController *timerNavController;
  uint64_t v30;
  UINavigationController *worldClockNavController;
  MTAWorldClockPadViewController *v32;
  UINavigationController *v33;
  UINavigationController *v34;
  UINavigationController *alarmNavController;
  MTAAlarmCollectionViewController *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  __objc2_class **v43;
  id v44;
  UINavigationController *v45;
  UINavigationController *v46;

  switch(a5)
  {
    case 0uLL:
      if (a3 == 1)
      {
        worldClockNavControllerSmall = self->_worldClockNavControllerSmall;
        if (!worldClockNavControllerSmall)
        {
          v8 = objc_alloc_init(MTAWorldClockTableViewController);
          v9 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v8);
          v10 = self->_worldClockNavControllerSmall;
          self->_worldClockNavControllerSmall = v9;

          worldClockNavControllerSmall = self->_worldClockNavControllerSmall;
        }
        v11 = worldClockNavControllerSmall;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](v11, "navigationBar"));
        objc_msgSend(v12, "setPrefersLargeTitles:", 1);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationItem](v11, "navigationItem"));
        objc_msgSend(v13, "setLargeTitleDisplayMode:", 1);
        goto LABEL_32;
      }
      worldClockNavController = self->_worldClockNavController;
      if (!worldClockNavController)
      {
        v32 = objc_alloc_init(MTAWorldClockPadViewController);
        v33 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v32);
        v34 = self->_worldClockNavController;
        self->_worldClockNavController = v33;

        worldClockNavController = self->_worldClockNavController;
      }
      v11 = worldClockNavController;
      break;
    case 1uLL:
      if (a3 == 1)
      {
        p_alarmNavControllerSmall = (id *)&self->_alarmNavControllerSmall;
        alarmNavControllerSmall = self->_alarmNavControllerSmall;
        if (!alarmNavControllerSmall)
        {
          v16 = -[MTAAlarmTableViewController initWithAlarmManager:dataSource:]([MTAAlarmTableViewController alloc], "initWithAlarmManager:dataSource:", self->_alarmManager, self->_alarmDataSource);
          v17 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v16);
          v18 = *p_alarmNavControllerSmall;
          *p_alarmNavControllerSmall = v17;

          alarmNavControllerSmall = (UINavigationController *)*p_alarmNavControllerSmall;
        }
        v11 = alarmNavControllerSmall;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](v11, "navigationBar"));
        objc_msgSend(v19, "setPrefersLargeTitles:", 1);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationItem](v11, "navigationItem"));
        objc_msgSend(v20, "setLargeTitleDisplayMode:", 1);

        v21 = &OBJC_IVAR___MTATabBarController__alarmNavController;
      }
      else
      {
        p_alarmNavControllerSmall = (id *)&self->_alarmNavController;
        alarmNavController = self->_alarmNavController;
        if (!alarmNavController)
        {
          v36 = -[MTAAlarmCollectionViewController initWithAlarmManager:dataSource:]([MTAAlarmCollectionViewController alloc], "initWithAlarmManager:dataSource:", self->_alarmManager, self->_alarmDataSource);
          v37 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v36);
          v38 = *p_alarmNavControllerSmall;
          *p_alarmNavControllerSmall = v37;

          alarmNavController = (UINavigationController *)*p_alarmNavControllerSmall;
        }
        v11 = alarmNavController;
        v21 = &OBJC_IVAR___MTATabBarController__alarmNavControllerSmall;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa
                                                                         + *v21), "viewControllers"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "firstObject"));

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_alarmNavControllerSmall, "viewControllers"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "firstObject"));

      if (objc_msgSend(v13, "conformsToProtocol:", &OBJC_PROTOCOL___MTAAlarmEditViewControllerDelegate)
        && objc_msgSend(v41, "conformsToProtocol:", &OBJC_PROTOCOL___MTAAlarmEditViewControllerDelegate))
      {
        objc_msgSend(v41, "handleContentSizeTransitionFrom:", v13);
      }

      goto LABEL_32;
    case 2uLL:
      stopwatchNavController = self->_stopwatchNavController;
      if (!stopwatchNavController)
      {
        v23 = objc_alloc_init(MTAStopwatchViewController);
        v24 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v23);
        v25 = self->_stopwatchNavController;
        self->_stopwatchNavController = v24;

        stopwatchNavController = self->_stopwatchNavController;
      }
      v26 = a3 == 1;
      v11 = stopwatchNavController;
      -[UINavigationController setNavigationBarHidden:](v11, "setNavigationBarHidden:", v26);
      break;
    case 3uLL:
      if (!self->_siriTipsController)
      {
        v27 = objc_alloc_init(_TtC11MobileTimer18SiriTipsController);
        siriTipsController = self->_siriTipsController;
        self->_siriTipsController = v27;

      }
      timerNavController = self->_timerNavController;
      if (timerNavController)
      {
        v30 = 0;
      }
      else
      {
        v42 = MTIdiomIpad(self, a2);
        v43 = off_1000987C0;
        if (!v42)
          v43 = &off_1000987C8;
        v44 = objc_msgSend(objc_alloc(*v43), "initWithTimerManager:dataSource:", self->_timerManager, self->_timerDataSource);
        objc_msgSend(v44, "setSiriTipsController:", self->_siriTipsController);
        v30 = v42 ^ 1u;
        v45 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v44);
        v46 = self->_timerNavController;
        self->_timerNavController = v45;

        timerNavController = self->_timerNavController;
      }
      v11 = timerNavController;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](v11, "navigationBar"));
      objc_msgSend(v13, "setPrefersLargeTitles:", v30);
LABEL_32:

      break;
    default:
      v11 = 0;
      break;
  }
  return v11;
}

- (void)invalidateViewControllersWithTraitCollection:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  NSArray *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = objc_msgSend(v4, "horizontalSizeClass");
  v7 = objc_msgSend(v4, "verticalSizeClass");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = self->_tabIndexes;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(obj);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController navigationControllerForHorizontalSizeClass:verticalSizeClass:atIndex:](self, "navigationControllerForHorizontalSizeClass:verticalSizeClass:atIndex:", v6, v7, objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "integerValue")));
        objc_msgSend(v5, "na_safeAddObject:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
        -[MTATabBarController setOverrideTraitCollection:forChildViewController:](self, "setOverrideTraitCollection:forChildViewController:", v13, v12);

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[MTATabBarController setViewControllers:animated:](self, "setViewControllers:animated:", v5, 0);
}

- (MTATabBarController)initWithAlarmManager:(id)a3 alarmDataSource:(id)a4 timerManager:(id)a5 timerDataSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MTATabBarController *v15;
  MTATabBarController *v16;
  UITabBarAppearance *v17;
  void *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MTATabBarController;
  v15 = -[MTATabBarController init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_alarmManager, a3);
    objc_storeStrong((id *)&v16->_alarmDataSource, a4);
    objc_storeStrong((id *)&v16->_timerManager, a5);
    objc_storeStrong((id *)&v16->_timerDataSource, a6);
    -[MTATabBarController setDelegate:](v16, "setDelegate:", v16);
    v17 = objc_opt_new(UITabBarAppearance);
    -[UITabBarAppearance configureWithTransparentBackground](v17, "configureWithTransparentBackground");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController tabBar](v16, "tabBar"));
    objc_msgSend(v18, "setScrollEdgeAppearance:", v17);

    -[MTATabBarController populateTabIndexes](v16, "populateTabIndexes");
  }

  return v16;
}

- (id)deferredEditingAction
{
  return self->_deferredEditingAction;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTATabBarController;
  v7 = a4;
  -[MTATabBarController willTransitionToTraitCollection:withTransitionCoordinator:](&v11, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100013058;
  v9[3] = &unk_1000992D0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, 0);

}

- (void)showSleepView
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "showSleepView:", 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100013138;
    v5[3] = &unk_100099390;
    objc_copyWeak(&v6, &location);
    -[MTATabBarController setDeferredEditingAction:](self, "setDeferredEditingAction:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

- (void)showAddView
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  v2 = objc_claimAutoreleasedReturnValue(-[MTATabBarController rootViewControllerForTab:](self, "rootViewControllerForTab:", 3));
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector(v2, "showAddView");
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "showAddView");
      v3 = v5;
    }
  }

}

- (id)rootViewControllerForTab:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController navigationControllerForTab:](self, "navigationControllerForTab:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  return v5;
}

- (unint64_t)tabIndexForAppSection:(int64_t)a3
{
  uint64_t v3;
  NSArray *tabIndexes;
  void *v5;
  NSUInteger v6;

  if ((unint64_t)(a3 - 1) > 3)
    v3 = 0;
  else
    v3 = qword_10007A628[a3 - 1];
  tabIndexes = self->_tabIndexes;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3));
  v6 = -[NSArray indexOfObject:](tabIndexes, "indexOfObject:", v5);

  return v6;
}

- (id)worldClockViewController
{
  return -[MTATabBarController topViewControllerForTab:](self, "topViewControllerForTab:", 0);
}

- (id)alarmViewController
{
  return -[MTATabBarController topViewControllerForTab:](self, "topViewControllerForTab:", 1);
}

- (void)populateShortcutItems
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;

  v15 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_class(MTAStopwatchViewController, v3);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATabBarController stopwatchViewController](self, "stopwatchViewController"));
  v6 = v5;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;
    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v4, objc_opt_class(v6, v11));

    }
  }
  else
  {
    v8 = 0;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultShortcutItem"));
  -[NSMutableArray na_safeAddObject:](v15, "na_safeAddObject:", v12);

  if (MTUIIsPhoneIdiom())
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTAUtilities startTimerShortcutItem](MTAUtilities, "startTimerShortcutItem"));
    -[NSMutableArray na_safeAddObject:](v15, "na_safeAddObject:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v14, "setShortcutItems:", v15);

}

- (void)performActionForShortcutItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  unsigned int v53;
  void *v54;
  char v55;
  void *v56;
  unsigned int v57;
  id v58;

  v58 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootViewController"));
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "type"));
  LODWORD(v5) = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobiletimer.add-alarm"));

  if ((_DWORD)v5)
  {
    -[MTATabBarController setSelectedIndex:](self, "setSelectedIndex:", -[NSArray indexOfObject:](self->_tabIndexes, "indexOfObject:", &off_10009CD10));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
    v9 = objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___MTAAddItemController);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
      objc_msgSend(v10, "showAddView");
LABEL_4:

      goto LABEL_47;
    }
    goto LABEL_47;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "type"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.mobiletimer.start-stopwatch"));

  if (v12)
  {
    -[MTATabBarController setSelectedIndex:](self, "setSelectedIndex:", -[NSArray indexOfObject:](self->_tabIndexes, "indexOfObject:", &off_10009CD28));
    v14 = objc_opt_class(MTAStopwatchViewController, v13);
    v15 = (id)objc_claimAutoreleasedReturnValue(-[MTATabBarController stopwatchViewController](self, "stopwatchViewController"));
    v16 = v15;
    if (v15)
    {
      if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;
      if (!v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v14, objc_opt_class(v16, v21));

      }
    }
    else
    {
      v18 = 0;
    }

    objc_msgSend(v18, "handleStartStopwatchShortcutAction");
LABEL_46:

    goto LABEL_47;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "type"));
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.mobiletimer.stop-stopwatch"));

  if (v23)
  {
    -[MTATabBarController setSelectedIndex:](self, "setSelectedIndex:", -[NSArray indexOfObject:](self->_tabIndexes, "indexOfObject:", &off_10009CD28));
    v25 = objc_opt_class(MTAStopwatchViewController, v24);
    v26 = (id)objc_claimAutoreleasedReturnValue(-[MTATabBarController stopwatchViewController](self, "stopwatchViewController"));
    v27 = v26;
    if (v26)
    {
      if ((objc_opt_isKindOfClass(v26, v25) & 1) != 0)
        v28 = v27;
      else
        v28 = 0;
      v18 = v28;
      if (!v18)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
        objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v25, objc_opt_class(v27, v31));

      }
    }
    else
    {
      v18 = 0;
    }

    objc_msgSend(v18, "handleStopStopwatchShortcutAction");
    goto LABEL_46;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "type"));
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.mobiletimer.lap-stopwatch"));

  if (v33)
  {
    -[MTATabBarController setSelectedIndex:](self, "setSelectedIndex:", -[NSArray indexOfObject:](self->_tabIndexes, "indexOfObject:", &off_10009CD28));
    v35 = objc_opt_class(MTAStopwatchViewController, v34);
    v36 = (id)objc_claimAutoreleasedReturnValue(-[MTATabBarController stopwatchViewController](self, "stopwatchViewController"));
    v37 = v36;
    if (v36)
    {
      if ((objc_opt_isKindOfClass(v36, v35) & 1) != 0)
        v38 = v37;
      else
        v38 = 0;
      v18 = v38;
      if (!v18)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
        objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v35, objc_opt_class(v37, v41));

      }
    }
    else
    {
      v18 = 0;
    }

    objc_msgSend(v18, "handleLapStopwatchShortcutAction");
    goto LABEL_46;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "type"));
  v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("com.apple.mobiletimer.reset-stopwatch"));

  if (v43)
  {
    -[MTATabBarController setSelectedIndex:](self, "setSelectedIndex:", -[NSArray indexOfObject:](self->_tabIndexes, "indexOfObject:", &off_10009CD28));
    v45 = objc_opt_class(MTAStopwatchViewController, v44);
    v46 = (id)objc_claimAutoreleasedReturnValue(-[MTATabBarController stopwatchViewController](self, "stopwatchViewController"));
    v47 = v46;
    if (v46)
    {
      if ((objc_opt_isKindOfClass(v46, v45) & 1) != 0)
        v48 = v47;
      else
        v48 = 0;
      v18 = v48;
      if (!v18)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
        objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v45, objc_opt_class(v47, v51));

      }
    }
    else
    {
      v18 = 0;
    }

    objc_msgSend(v18, "handleResetStopwatchShortcutAction");
    goto LABEL_46;
  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "type"));
  v53 = objc_msgSend(v52, "isEqualToString:", kStartTimerActionID);

  if (v53)
  {
    -[MTATabBarController setSelectedIndex:](self, "setSelectedIndex:", -[NSArray indexOfObject:](self->_tabIndexes, "indexOfObject:", &off_10009CD40));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController timerViewController](self, "timerViewController"));
    v55 = objc_opt_respondsToSelector(v54, "handleStartTimerShortcutAction");

    if ((v55 & 1) == 0)
      goto LABEL_47;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController timerViewController](self, "timerViewController"));
    objc_msgSend(v10, "performSelector:", "handleStartTimerShortcutAction");
    goto LABEL_4;
  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "type"));
  v57 = objc_msgSend(v56, "isEqualToString:", kStopTimerActionID);

  if (v57)
    -[MTATabBarController setSelectedIndex:](self, "setSelectedIndex:", -[NSArray indexOfObject:](self->_tabIndexes, "indexOfObject:", &off_10009CD40));
LABEL_47:

}

- (void)performActionForIntent:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  MTATabBarController *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char isKindOfClass;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  id v70;

  v70 = a3;
  v5 = objc_opt_class(MTCreateAlarmIntent, v4);
  if ((objc_opt_isKindOfClass(v70, v5) & 1) != 0)
  {
    v7 = objc_opt_class(MTCreateAlarmIntent, v6);
    v8 = v70;
    v9 = v8;
    if (v8)
    {
      if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;
      if (!v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class(v9, v14));

      }
    }
    else
    {
      v11 = 0;
    }

    -[MTATabBarController setSelectedIndex:](self, "setSelectedIndex:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
    v29 = objc_opt_class(MTAAlarmTableViewController, v28);
    isKindOfClass = objc_opt_isKindOfClass(v27, v29);

    if ((isKindOfClass & 1) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "time"));

      if (!v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateComponents"));

        if (v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateComponents"));
          v34 = objc_msgSend(v33, "hour");

          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateComponents"));
          v36 = objc_msgSend(v35, "minute");

          v37 = (void *)objc_claimAutoreleasedReturnValue(+[MTMutableAlarm alarmWithHour:minute:](MTMutableAlarm, "alarmWithHour:minute:", v34, v36));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "label"));
          objc_msgSend(v37, "setTitle:", v38);

          v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
          objc_msgSend(v39, "showAddViewForAlarm:", v37);

        }
        else
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
          objc_msgSend(v37, "showAddView");
        }
        goto LABEL_25;
      }
    }
    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
      v42 = objc_opt_class(MTAAlarmCollectionViewController, v41);
      v43 = objc_opt_isKindOfClass(v40, v42);

      if ((v43 & 1) == 0)
      {
LABEL_26:

        goto LABEL_27;
      }
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "time"));

      if (!v44)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
        objc_msgSend(v37, "showAddViewForAlarm:", 0);
        goto LABEL_25;
      }
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "time"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "identifier"));
    objc_msgSend(v46, "doubleValue");
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[MTMutableAlarm alarmWithHour:minute:](MTMutableAlarm, "alarmWithHour:minute:", objc_msgSend(v47, "component:fromDate:", 32, v37), objc_msgSend(v47, "component:fromDate:", 64, v37)));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "label"));
    objc_msgSend(v48, "setTitle:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
    objc_msgSend(v50, "showAddViewForAlarm:", v48);

LABEL_24:
LABEL_25:

    goto LABEL_26;
  }
  v15 = objc_opt_class(MTEnableAlarmIntent, v6);
  if ((objc_opt_isKindOfClass(v70, v15) & 1) != 0
    || (v17 = objc_opt_class(MTDisableAlarmIntent, v16), (objc_opt_isKindOfClass(v70, v17) & 1) != 0))
  {
    v18 = objc_opt_class(MTEnableAlarmIntent, v16);
    if ((objc_opt_isKindOfClass(v70, v18) & 1) != 0
      || (v20 = objc_opt_class(MTDisableAlarmIntent, v19), (objc_opt_isKindOfClass(v70, v20) & 1) != 0))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "alarmID"));
    }
    else
    {
      v60 = objc_opt_class(MTToggleAlarmIntent, v21);
      if ((objc_opt_isKindOfClass(v70, v60) & 1) == 0)
        goto LABEL_14;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "alarm"));
    }
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));

LABEL_14:
    v25 = self;
    v26 = 1;
    goto LABEL_15;
  }
  v51 = objc_opt_class(MTUpdateAlarmIntent, v16);
  if ((objc_opt_isKindOfClass(v70, v51) & 1) != 0)
  {
    v53 = objc_opt_class(MTUpdateAlarmIntent, v52);
    v54 = v70;
    v55 = v54;
    if (v54)
    {
      if ((objc_opt_isKindOfClass(v54, v53) & 1) != 0)
        v56 = v55;
      else
        v56 = 0;
      v11 = v56;
      if (!v11)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
        objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v53, objc_opt_class(v55, v59));

      }
    }
    else
    {
      v11 = 0;
    }

    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "alarmID"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "identifier"));

    -[MTATabBarController setSelectedIndex:](self, "setSelectedIndex:", 1);
    if (!v37)
      goto LABEL_25;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
    v65 = objc_opt_class(MTAAlarmTableViewController, v64);
    v66 = objc_opt_isKindOfClass(v63, v65);

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
    if ((v66 & 1) == 0)
    {
      v68 = objc_opt_class(MTAAlarmCollectionViewController, v67);
      v69 = objc_opt_isKindOfClass(v47, v68);

      if ((v69 & 1) == 0)
        goto LABEL_25;
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
    }
    objc_msgSend(v47, "showAddViewForAlarmWithID:", v37);
    goto LABEL_24;
  }
  v61 = objc_opt_class(INCreateTimerIntent, v52);
  if ((objc_opt_isKindOfClass(v70, v61) & 1) == 0)
    goto LABEL_27;
  v25 = self;
  v26 = 3;
LABEL_15:
  -[MTATabBarController setSelectedIndex:](v25, "setSelectedIndex:", v26);
LABEL_27:

}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "selectedViewController"));
  if (v6 != v5)
  {
LABEL_2:

    goto LABEL_7;
  }
  v7 = MTUIIsPhoneIdiom();

  if (v7)
  {
    v9 = objc_opt_class(UINavigationController, v8);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
      v11 = objc_opt_class(MTATableViewController, v10);
      if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
        objc_msgSend(v6, "scrollToTop");
      goto LABEL_2;
    }
  }
LABEL_7:

  return 1;
}

- (id)worldClockPadController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController viewControllers](self->_worldClockNavController, "viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return v3;
}

- (id)worldClockTableViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController viewControllers](self->_worldClockNavControllerSmall, "viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return v3;
}

- (id)alarmTableViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController viewControllers](self->_alarmNavControllerSmall, "viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return v3;
}

- (void)restoreWorldClockAdd
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (MTUIIsPadIdiom(self, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockPadController](self, "worldClockPadController"));
    objc_initWeak(&location, v3);

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000142B8;
    v6[3] = &unk_100099390;
    objc_copyWeak(&v7, &location);
    v4 = objc_loadWeakRetained(&location);
    objc_msgSend(v4, "setViewLoadedAction:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockTableViewController](self, "worldClockTableViewController"));
    objc_msgSend(v5, "showAddView");

  }
}

- (void)restoreAddNewAlarm
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
  v5 = objc_opt_class(MTAAlarmCollectionViewController, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmsCollectionViewController](self, "alarmsCollectionViewController"));
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmTableViewController](self, "alarmTableViewController"));
  v8 = v7;
  objc_msgSend(v7, "showAddView");

}

- (void)restoreAlarmEditWithEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
  v7 = objc_opt_class(MTAAlarmCollectionViewController, v6);
  isKindOfClass = objc_opt_isKindOfClass(v5, v7);

  if ((isKindOfClass & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmTableViewController](self, "alarmTableViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      objc_msgSend(v11, "showAddViewForAlarmWithID:", v12);

    }
    else
    {
      v13 = MTLogForCategory(8, v10);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_100064CCC((uint64_t)self, v14);

    }
  }

}

- (void)restoreSleepEdit
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmTableViewController](self, "alarmTableViewController"));
  objc_msgSend(v2, "showSleepView:", 0);

}

- (void)restoreWorldClockEdit
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (MTUIIsPadIdiom(self, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockPadController](self, "worldClockPadController"));
    objc_initWeak(&location, v3);

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100014578;
    v6[3] = &unk_100099390;
    objc_copyWeak(&v7, &location);
    v4 = objc_loadWeakRetained(&location);
    objc_msgSend(v4, "setViewLoadedAction:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockTableViewController](self, "worldClockTableViewController"));
    objc_msgSend(v5, "setEditing:animated:", 1, 0);

  }
}

- (void)restoreAlarmTabEditMode
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmViewController](self, "alarmViewController"));
  v5 = objc_opt_class(MTAAlarmCollectionViewController, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmsCollectionViewController](self, "alarmsCollectionViewController"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000146FC;
    v13[3] = &unk_100099320;
    v13[4] = self;
    objc_msgSend(v7, "setAlarmsLoadedAction:", v13);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATabBarController alarmTableViewController](self, "alarmTableViewController"));
    objc_initWeak(&location, v8);

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100014730;
    v10[3] = &unk_100099390;
    objc_copyWeak(&v11, &location);
    v9 = objc_loadWeakRetained(&location);
    objc_msgSend(v9, "setAlarmsLoadedAction:", v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)prepareStateForUrlLaunch
{
  id v3;

  if (MTUIIsPadIdiom(self, a2))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[MTATabBarController worldClockPadController](self, "worldClockPadController"));
    objc_msgSend(v3, "prepareStateForUrlLaunch");

  }
}

- (void)setDeferredEditingAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deferredEditingAction, 0);
  objc_storeStrong((id *)&self->_tabIndexes, 0);
  objc_storeStrong((id *)&self->_timerDataSource, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_alarmDataSource, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong((id *)&self->_siriTipsController, 0);
  objc_storeStrong((id *)&self->_worldClockNavController, 0);
  objc_storeStrong((id *)&self->_worldClockNavControllerSmall, 0);
  objc_storeStrong((id *)&self->_alarmNavController, 0);
  objc_storeStrong((id *)&self->_alarmNavControllerSmall, 0);
  objc_storeStrong((id *)&self->_timerNavController, 0);
  objc_storeStrong((id *)&self->_stopwatchNavController, 0);
}

@end
