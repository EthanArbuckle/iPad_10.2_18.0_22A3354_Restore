@implementation MTAAlarmCollectionViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTAAlarmCollectionViewController)initWithAlarmManager:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  MTAAlarmCollectionViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSUserActivity *userActivity;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  v19.receiver = self;
  v19.super_class = (Class)MTAAlarmCollectionViewController;
  v9 = -[MTAAlarmCollectionViewController initWithCollectionViewLayout:](&v19, "initWithCollectionViewLayout:", v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ALARMS_LIST"), &stru_10009A4D0, 0));
    -[MTAAlarmCollectionViewController setTitle:](v9, "setTitle:", v11);

    -[MTAAlarmCollectionViewController setEdgesForExtendedLayout:](v9, "setEdgesForExtendedLayout:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("alarm.fill")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController tabBarItem](v9, "tabBarItem"));
    objc_msgSend(v13, "setImage:", v12);

    -[MTAAlarmCollectionViewController setAlarmManager:](v9, "setAlarmManager:", v6);
    -[MTAAlarmCollectionViewController setDataSource:](v9, "setDataSource:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController dataSource](v9, "dataSource"));
    objc_msgSend(v14, "registerObserver:", v9);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController title](v9, "title"));
    v16 = objc_claimAutoreleasedReturnValue(+[NSUserActivity mtUserActivityWithActivityType:title:](NSUserActivity, "mtUserActivityWithActivityType:title:", CFSTR("com.apple.clock.alarm"), v15));
    userActivity = v9->_userActivity;
    v9->_userActivity = (NSUserActivity *)v16;

    v9->_cellHeight = -1.0;
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MTAAlarmCollectionViewController;
  -[MTAAlarmCollectionViewController viewDidLoad](&v19, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NO_ALARMS"), &stru_10009A4D0, 0));

  v5 = objc_msgSend(objc_alloc((Class)_UIContentUnavailableView), "initWithFrame:title:style:includeBackdrop:", v4, 1, 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MTAAlarmCollectionViewController setNoItemsView:](self, "setNoItemsView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController noItemsView](self, "noItemsView"));
  objc_msgSend(v6, "setVibrantOptions:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController noItemsView](self, "noItemsView"));
  objc_msgSend(v7, "addSubview:", v8);

  -[MTAAlarmCollectionViewController reloadState](self, "reloadState");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v11, "setAllowsSelectionDuringEditing:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController editButtonItem](self, "editButtonItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setLeftBarButtonItem:", v12);

  v14 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 4, self, "addAlarm:");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v15, "setRightBarButtonItem:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v16, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(MTAAlarmCollectionViewCell), CFSTR("Cell"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v17, "addObserver:selector:name:object:", self, "handleContentSizeChange:", UIContentSizeCategoryDidChangeNotification, 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", &off_10009CED8));
  -[MTAAlarmCollectionViewController setSections:](self, "setSections:", v18);

}

- (void)reloadState
{
  -[MTAAlarmCollectionViewController reloadState:](self, "reloadState:", 0);
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
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reloading collection view", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAlarmDataSource reloadAlarms](self->_dataSource, "reloadAlarms"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100057DD0;
  v11[3] = &unk_100099F90;
  v11[4] = self;
  v12 = v4;
  v9 = v4;
  v10 = objc_msgSend(v8, "addCompletionBlock:", v11);

}

- (void)_reloadUI:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MTAAlarmCollectionViewController _handleNumberOfItemsDidChange](self, "_handleNumberOfItemsDidChange");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)dataSourceDidReload:(id)a3
{
  void *v4;
  void (**alarmsLoadedAction)(void);
  id v6;

  -[MTAAlarmCollectionViewController _reloadUI:](self, "_reloadUI:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "reloadData");

  alarmsLoadedAction = (void (**)(void))self->_alarmsLoadedAction;
  if (alarmsLoadedAction)
  {
    alarmsLoadedAction[2]();
    v6 = self->_alarmsLoadedAction;
    self->_alarmsLoadedAction = 0;

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTAAlarmCollectionViewController;
  -[MTAAlarmCollectionViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MTAAlarmCollectionViewController reloadState](self, "reloadState");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTAAlarmCollectionViewController;
  -[MTAAlarmCollectionViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController userActivity](self, "userActivity"));
  objc_msgSend(v4, "becomeCurrent");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController deferredAddingAlarm](self, "deferredAddingAlarm"));
  if (v5)
  {
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController deferredAddingAlarm](self, "deferredAddingAlarm"));
    v6[2]();

    -[MTAAlarmCollectionViewController setDeferredAddingAlarm:](self, "setDeferredAddingAlarm:", 0);
  }
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
  v9.super_class = (Class)MTAAlarmCollectionViewController;
  v7 = a4;
  -[MTAAlarmCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100058028;
  v8[3] = &unk_1000992F8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v4 = a4;
  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTAAlarmCollectionViewController;
  -[MTAAlarmCollectionViewController setEditing:animated:](&v20, "setEditing:animated:");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController collectionView](self, "collectionView", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "visibleCells"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "setEditing:animated:", -[MTAAlarmCollectionViewController isEditing](self, "isEditing"), v4);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v10);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  if (v5)
    v14 = 7;
  else
    v14 = 6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", v14));
  objc_msgSend(v13, "pushEvent:", v15);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTAAlarmCollectionViewController;
  -[MTAAlarmCollectionViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[MTAAlarmCollectionViewController _layoutNoItemsLabel](self, "_layoutNoItemsLabel");
}

- (void)_layoutNoItemsLabel
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController noItemsView](self, "noItemsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_titleLabel"));
  objc_msgSend(v4, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v6 = v5;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController noItemsView](self, "noItemsView"));
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController noItemsView](self, "noItemsView"));
  objc_msgSend(v14, "setFrame:", v11, v13, v6 + 60.0, v8 + 60.0);

  v20 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v20, "center");
  v16 = v15;
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController noItemsView](self, "noItemsView"));
  objc_msgSend(v19, "setCenter:", v16, v18);

}

- (void)_handleNumberOfItemsDidChange
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController dataSource](self, "dataSource"));
  v4 = objc_msgSend(v3, "numberOfAlarms");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController editButtonItem](self, "editButtonItem"));
  v6 = v5;
  if (v4)
    v7 = 0.0;
  else
    v7 = 1.0;
  objc_msgSend(v5, "setEnabled:", v4 != 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController noItemsView](self, "noItemsView"));
  objc_msgSend(v8, "setAlpha:", v7);

  if (!v4)
    -[MTAAlarmCollectionViewController setEditing:](self, "setEditing:", 0);
}

- (void)addAlarm:(id)a3
{
  -[MTAAlarmCollectionViewController showAddViewForAlarm:](self, "showAddViewForAlarm:", 0);
}

- (void)showAddViewForAlarm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));

  if (v6)
  {
    -[MTAAlarmCollectionViewController showAddAlarmViewPopUpWithAlarm:](self, "showAddAlarmViewPopUpWithAlarm:", v4);
  }
  else
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000584F8;
    v7[3] = &unk_1000999F8;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    -[MTAAlarmCollectionViewController setDeferredAddingAlarm:](self, "setDeferredAddingAlarm:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)showAddAlarmViewPopUpWithAlarm:(id)a3
{
  void *v4;
  _BOOL8 v5;
  MTAAlarmEditViewController *v6;
  void *v7;
  MTAAddSheetNavigationController *v8;
  void *v9;
  MTAAddSheetNavigationController *v10;
  void *v11;
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
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  -[MTAAlarmCollectionViewController setEditing:](self, "setEditing:", 0);
  if (v25)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController dataSource](self, "dataSource"));
    v5 = objc_msgSend(v4, "rowForAlarm:", v25) == (id)0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v5 = 1;
  }
  v6 = -[MTAAlarmEditViewController initWithAlarm:isNewAlarm:]([MTAAlarmEditViewController alloc], "initWithAlarm:isNewAlarm:", v25, v5);
  -[MTAAlarmCollectionViewController setAddEditAlarmController:](self, "setAddEditAlarmController:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController addEditAlarmController](self, "addEditAlarmController"));
  objc_msgSend(v7, "setDelegate:", self);

  v8 = [MTAAddSheetNavigationController alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController addEditAlarmController](self, "addEditAlarmController"));
  v10 = -[MTAAddSheetNavigationController initWithRootViewController:](v8, "initWithRootViewController:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController addEditAlarmController](self, "addEditAlarmController"));
  objc_msgSend(v11, "preferredContentSize");
  -[MTAAddSheetNavigationController setPreferredContentSize:](v10, "setPreferredContentSize:");

  -[MTAAddSheetNavigationController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController navigationItem](self, "navigationItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rightBarButtonItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController popoverPresentationController](v10, "popoverPresentationController"));
  objc_msgSend(v14, "setBarButtonItem:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController popoverPresentationController](v10, "popoverPresentationController"));
  objc_msgSend(v15, "setDelegate:", self);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController popoverPresentationController](v10, "popoverPresentationController"));
  objc_msgSend(v17, "setBackgroundColor:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController view](v10, "view"));
  objc_msgSend(v19, "setBackgroundColor:", v18);

  -[MTAAlarmCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 1));
  objc_msgSend(v20, "pushEvent:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  if (v5)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 1));
    objc_msgSend(v22, "pushEvent:", v23);
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "alarmIDString"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:identifier:](MTAStateStoreEvent, "eventWithType:identifier:", 2, v23));
    objc_msgSend(v22, "pushEvent:", v24);

  }
}

- (void)showAddViewForAlarmWithID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController dataSource](self, "dataSource"));
  v6 = objc_msgSend(v5, "rowForAlarmWithID:", v4);

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    -[MTAAlarmCollectionViewController _showAddViewForAlarmAtRow:](self, "_showAddViewForAlarmAtRow:", v6);
}

- (void)_showAddViewForAlarmAtRow:(unint64_t)a3
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  MTAAlarmEditViewController *v11;
  void *v12;
  MTAAddSheetNavigationController *v13;
  void *v14;
  MTAAddSheetNavigationController *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController dataSource](self, "dataSource"));
  v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alarmAtRow:", a3));

  v7 = -[NSMutableArray indexOfObject:](self->_sections, "indexOfObject:", &off_10009CED8);
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTAAlarmCollectionViewController.m"), 346, CFSTR("Invalid section for Alarm"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3, v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cellForItemAtIndexPath:", v9));

  v11 = -[MTAAlarmEditViewController initWithAlarm:isNewAlarm:]([MTAAlarmEditViewController alloc], "initWithAlarm:isNewAlarm:", v34, 0);
  -[MTAAlarmCollectionViewController setAddEditAlarmController:](self, "setAddEditAlarmController:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController addEditAlarmController](self, "addEditAlarmController"));
  objc_msgSend(v12, "setDelegate:", self);

  v13 = [MTAAddSheetNavigationController alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController addEditAlarmController](self, "addEditAlarmController"));
  v15 = -[MTAAddSheetNavigationController initWithRootViewController:](v13, "initWithRootViewController:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController addEditAlarmController](self, "addEditAlarmController"));
  objc_msgSend(v16, "preferredContentSize");
  -[MTAAddSheetNavigationController setPreferredContentSize:](v15, "setPreferredContentSize:");

  -[MTAAddSheetNavigationController setModalPresentationStyle:](v15, "setModalPresentationStyle:", 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController popoverPresentationController](v15, "popoverPresentationController"));
  objc_msgSend(v17, "setSourceView:", v10);

  objc_msgSend(v10, "editingPopoverSourceRect");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController popoverPresentationController](v15, "popoverPresentationController"));
  objc_msgSend(v26, "setSourceRect:", v19, v21, v23, v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController popoverPresentationController](v15, "popoverPresentationController"));
  objc_msgSend(v27, "setPermittedArrowDirections:", 3);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController popoverPresentationController](v15, "popoverPresentationController"));
  objc_msgSend(v28, "setDelegate:", self);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController popoverPresentationController](v15, "popoverPresentationController"));
  objc_msgSend(v30, "setBackgroundColor:", v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController view](v15, "view"));
  objc_msgSend(v32, "setBackgroundColor:", v31);

  -[MTAAlarmCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
}

- (void)handleContentSizeChange:(id)a3
{
  id v3;

  self->_cellHeight = -1.0;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController collectionViewLayout](self, "collectionViewLayout", a3));
  objc_msgSend(v3, "invalidateLayout");

}

- (double)cellHeight
{
  double result;

  result = self->_cellHeight;
  if (result < 0.0)
  {
    +[MTAAlarmCollectionViewCell cellHeight](MTAAlarmCollectionViewCell, "cellHeight");
    self->_cellHeight = result;
  }
  return result;
}

- (void)alarmEditControllerDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100058C10;
  v3[3] = &unk_100099320;
  v3[4] = self;
  -[MTAAlarmCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;

  v5 = a4;
  v7 = MTLogForCategory(8, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alarmID"));
    *(_DWORD *)buf = 138543362;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding alarm %{public}@", buf, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController dataSource](self, "dataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addAlarm:", v5));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100058D90;
  v14[3] = &unk_100099F68;
  v14[4] = self;
  v12 = objc_msgSend(v11, "addSuccessBlock:", v14);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100058D9C;
  v13[3] = &unk_100099320;
  v13[4] = self;
  -[MTAAlarmCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v13);

}

- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4
{
  _QWORD v5[5];

  -[MTAAlarmCollectionViewController _updateAlarm:reload:withCompletionBlock:](self, "_updateAlarm:reload:withCompletionBlock:", a4, 1, 0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100058E1C;
  v5[3] = &unk_100099320;
  v5[4] = self;
  -[MTAAlarmCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
}

- (void)_updateAlarm:(id)a3 reload:(BOOL)a4 withCompletionBlock:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;

  v7 = a3;
  v8 = a5;
  v10 = MTLogForCategory(8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alarmID"));
    *(_DWORD *)buf = 138543362;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating alarm %{public}@", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController dataSource](self, "dataSource"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "updateAlarm:", v7));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100058FAC;
  v17[3] = &unk_100099970;
  v17[4] = self;
  v18 = v8;
  v15 = v8;
  v16 = objc_msgSend(v14, "addSuccessBlock:", v17);

}

- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4
{
  _QWORD v5[5];

  -[MTAAlarmCollectionViewController _removeAlarm:](self, "_removeAlarm:", a4);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100059024;
  v5[3] = &unk_100099320;
  v5[4] = self;
  -[MTAAlarmCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);
}

- (void)_removeAlarm:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alarmID"));
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing alarm %{public}@", buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController dataSource](self, "dataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "removeAlarm:", v4));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100059164;
  v12[3] = &unk_100099F68;
  v12[4] = self;
  v11 = objc_msgSend(v10, "addSuccessBlock:", v12);

}

- (void)handleContentSizeTransitionFrom:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "currentAlarmEditController"));
  -[MTAAlarmCollectionViewController setAddEditAlarmController:](self, "setAddEditAlarmController:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController addEditAlarmController](self, "addEditAlarmController"));
  objc_msgSend(v5, "setDelegate:", self);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController sections](self, "sections", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController dataSource](self, "dataSource", a3, a4));
  v5 = objc_msgSend(v4, "numberOfAlarms");

  return (int64_t)v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("Cell"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController dataSource](self, "dataSource"));
  v9 = objc_msgSend(v6, "row");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alarmAtRow:", v9));
  objc_msgSend(v7, "refreshUI:animated:", v10, 0);

  return v7;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;

  v6 = a4;
  objc_msgSend(v6, "setEditing:", -[MTAAlarmCollectionViewController isEditing](self, "isEditing"));
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  objc_msgSend(a4, "setDelegate:", 0);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  -[MTAAlarmCollectionViewController _showAddViewForAlarmAtRow:](self, "_showAddViewForAlarmAtRow:", objc_msgSend(a4, "row", a3));
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double width;
  double height;
  float v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "bounds");
  width = CGSizeZero.width;
  height = CGSizeZero.height;
  if (v9 != CGSizeZero.width || v10 != height)
  {
    v14 = v9 / 250.0;
    v15 = vcvtms_u32_f32(v14);
    v16 = v9 + -30.0 + (double)(v15 - 1) * -15.0;
    v17 = UIFloorToViewScale(v16 / (double)v15);
    v18 = v16 - v17 * (double)v15;
    v19 = (unint64_t)objc_msgSend(v8, "row");
    v20 = -0.0;
    if (!(v19 % v15))
      v20 = v18;
    width = v17 + v20;
    -[MTAAlarmCollectionViewController cellHeight](self, "cellHeight");
    height = v21;
  }

  v22 = width;
  v23 = height;
  result.height = v23;
  result.width = v22;
  return result;
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
  -[MTAAlarmCollectionViewController _addOrEditControllerDidDismissCommitChanges:](self, "_addOrEditControllerDidDismissCommitChanges:", 1);
}

- (void)_addOrEditControllerDidDismissCommitChanges:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController addEditAlarmController](self, "addEditAlarmController"));

    if (!v4)
      NSLog(CFSTR("Attempting to dismiss add or edit controller when there isn't one."));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController addEditAlarmController](self, "addEditAlarmController"));
    objc_msgSend(v5, "saveAlarmOnlyIfEdited:", 1);

  }
  -[MTAAlarmCollectionViewController setAddEditAlarmController:](self, "setAddEditAlarmController:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 6));
  objc_msgSend(v7, "pushEvent:", v6);

}

- (void)deleteCell:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController collectionView](self, "collectionView"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  -[MTAAlarmCollectionViewController removeAlarmAtIndexPath:](self, "removeAlarmAtIndexPath:", v6);
}

- (void)removeAlarmAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController dataSource](self, "dataSource"));
  v6 = objc_msgSend(v4, "row");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alarmAtRow:", v6));
  -[MTAAlarmCollectionViewController _removeAlarm:](self, "_removeAlarm:", v7);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100059670;
  v8[3] = &unk_100099320;
  v8[4] = self;
  -[MTAAlarmCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (void)setAlarmEnabled:(BOOL)a3 forCell:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  BOOL v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  _BOOL4 v25;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForCell:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmCollectionViewController dataSource](self, "dataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "alarmAtRow:", objc_msgSend(v8, "row")));
  v11 = objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "setEnabled:", v4);
  v13 = MTLogForCategory(8, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "alarmID"));
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    v24 = 1024;
    v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Setting alarm %{public}@ to enabled: %d", buf, 0x12u);

  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100059844;
  v18[3] = &unk_100099A20;
  v19 = v11;
  v20 = v6;
  v21 = v4;
  v16 = v6;
  v17 = v11;
  -[MTAAlarmCollectionViewController _updateAlarm:reload:withCompletionBlock:](self, "_updateAlarm:reload:withCompletionBlock:", v17, 1, v18);

}

- (void)showAddView
{
  -[MTAAlarmCollectionViewController showAddViewForAlarm:](self, "showAddViewForAlarm:", 0);
}

- (void)dismissAddViewController:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v5 = objc_msgSend(v4, "isSuspended") ^ 1;

  -[MTAAlarmCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v5, &stru_10009A058);
}

- (id)alarmsLoadedAction
{
  return self->_alarmsLoadedAction;
}

- (void)setAlarmsLoadedAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
  objc_storeStrong((id *)&self->_alarmManager, a3);
}

- (MTAlarmDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (MTAAlarmEditViewController)addEditAlarmController
{
  return self->_addEditAlarmController;
}

- (void)setAddEditAlarmController:(id)a3
{
  objc_storeStrong((id *)&self->_addEditAlarmController, a3);
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
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

- (id)deferredAddingAlarm
{
  return self->_deferredAddingAlarm;
}

- (void)setDeferredAddingAlarm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deferredAddingAlarm, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_noItemsView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_addEditAlarmController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong(&self->_alarmsLoadedAction, 0);
}

@end
