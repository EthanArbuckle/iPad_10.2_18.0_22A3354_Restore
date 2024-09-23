@implementation CHWorkoutsListViewController

- (CHWorkoutsListViewController)initWithDataProvider:(id)a3 healthStore:(id)a4 model:(id)a5 fitnessAppContext:(id)a6 workoutFormattingManager:(id)a7 workoutDataProvider:(id)a8 badgeImageFactory:(id)a9 friendListManager:(id)a10 achievementLocalizationProvider:(id)a11 pauseRingsCoordinator:(id)a12 achievementResourceProvider:(id)a13 formattingManager:(id)a14 awardsDataProvider:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  CHWorkoutsListViewController *v27;
  CHWorkoutsListViewController *v28;
  id v31;
  id v32;
  id v33;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v42 = a3;
  v41 = a4;
  v31 = a5;
  v40 = a5;
  v33 = a6;
  v20 = a6;
  v21 = a7;
  v39 = v20;
  v38 = a7;
  v32 = a8;
  v37 = a8;
  v36 = a9;
  v35 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v25 = a14;
  v26 = a15;
  v43.receiver = self;
  v43.super_class = (Class)CHWorkoutsListViewController;
  v27 = -[CHWorkoutsListViewController init](&v43, "init");
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_dataProvider, a3);
    objc_storeStrong((id *)&v28->_healthStore, a4);
    objc_storeStrong((id *)&v28->_model, v31);
    objc_storeStrong((id *)&v28->_workoutDataProvider, v32);
    objc_storeStrong((id *)&v28->_workoutFormattingManager, v21);
    objc_storeStrong((id *)&v28->_fitnessAppContext, v33);
    objc_storeStrong((id *)&v28->_formattingManager, a14);
    objc_storeStrong((id *)&v28->_badgeImageFactory, a9);
    objc_storeStrong((id *)&v28->_friendListManager, a10);
    objc_storeStrong((id *)&v28->_achievementLocalizationProvider, a11);
    objc_storeStrong((id *)&v28->_pauseRingsCoordinator, a12);
    objc_storeStrong((id *)&v28->_achievementResourceProvider, a13);
    objc_storeStrong((id *)&v28->_awardsDataProvider, a15);
  }

  return v28;
}

- (void)_setupTableView
{
  id v3;
  void *v4;
  UITableView *v5;
  UITableView *tableView;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)UITableView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v5 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 0);
  tableView = self->_tableView;
  self->_tableView = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setSeparatorColor:](self->_tableView, "setSeparatorColor:", v8);

  -[UITableView _setDrawsSeparatorAtTopOfSections:](self->_tableView, "_setDrawsSeparatorAtTopOfSections:", 1);
  -[UITableView setSectionHeaderTopPadding:](self->_tableView, "setSectionHeaderTopPadding:", 0.0);
  -[UITableView setTableHeaderViewShouldAutoHide:](self->_tableView, "setTableHeaderViewShouldAutoHide:", 0);
  -[UITableView _setHeaderAndFooterViewsFloat:](self->_tableView, "_setHeaderAndFooterViewsFloat:", 1);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", self->_tableView);

}

- (id)_filterMenu
{
  id v3;
  NSArray *workoutTypeIDs;
  void *v5;
  id v6;
  void *v7;
  NSArray *workoutTypeNames;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14[2];
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init((Class)NSMutableArray);
  workoutTypeIDs = self->_workoutTypeIDs;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider currentFilteredTypeIdentifier](self->_dataProvider, "currentFilteredTypeIdentifier"));
  v6 = -[NSArray indexOfObject:](workoutTypeIDs, "indexOfObject:", v5);

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = v6;
  workoutTypeNames = self->_workoutTypeNames;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000CD15C;
  v12[3] = &unk_10077A538;
  v14[1] = v7;
  v12[4] = self;
  objc_copyWeak(v14, &location);
  v9 = v3;
  v13 = v9;
  -[NSArray enumerateObjectsUsingBlock:](workoutTypeNames, "enumerateObjectsUsingBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v9));

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  return v10;
}

- (void)_addDataProviderUpdateHandlers
{
  CHWorkoutDataProvider *dataProvider;
  CHWorkoutDataProvider *v4;
  CHWorkoutDataProvider *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  dataProvider = self->_dataProvider;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000CD4E0;
  v10[3] = &unk_100777C80;
  objc_copyWeak(&v11, &location);
  -[CHWorkoutDataProvider addUpdateHandler:](dataProvider, "addUpdateHandler:", v10);
  v4 = self->_dataProvider;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000CD540;
  v8[3] = &unk_100777C80;
  objc_copyWeak(&v9, &location);
  -[CHWorkoutDataProvider addAnimatedUpdateHandler:](v4, "addAnimatedUpdateHandler:", v8);
  v5 = self->_dataProvider;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000CD58C;
  v6[3] = &unk_100777C80;
  objc_copyWeak(&v7, &location);
  -[CHWorkoutDataProvider addFilterActionFinishedHandler:](v5, "addFilterActionFinishedHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_popViewControllerIfNeeded
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t v8[16];

  v3 = -[CHWorkoutDataProvider hasWorkouts](self->_dataProvider, "hasWorkouts");
  if (!v3)
  {
    _HKInitializeLogging(v3, v4);
    v5 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Data provider doesn't have any workouts; popping view controller",
        v8,
        2u);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController navigationController](self, "navigationController"));
    v7 = objc_msgSend(v6, "popViewControllerAnimated:", 1);

  }
}

- (void)_setupDataSource
{
  CHWorkoutsListDataSource *v3;
  CHWorkoutsListDataSource *dataSource;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[CHWorkoutsListDataSource initWithTableView:dataProvider:fitnessAppContext:formattingManager:badgeImageFactory:awardsDataProvider:]([CHWorkoutsListDataSource alloc], "initWithTableView:dataProvider:fitnessAppContext:formattingManager:badgeImageFactory:awardsDataProvider:", self->_tableView, self->_dataProvider, self->_fitnessAppContext, self->_workoutFormattingManager, self->_badgeImageFactory, self->_awardsDataProvider);
  dataSource = self->_dataSource;
  self->_dataSource = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController navigationController](self, "navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationBar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_backdropViewLayerGroupName"));
  -[CHWorkoutsListDataSource setNavBarBackdropGroupName:](self->_dataSource, "setNavBarBackdropGroupName:", v7);

  -[CHWorkoutsListDataSource setDelegate:](self->_dataSource, "setDelegate:", self);
}

- (void)_stopActivityIndicator
{
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
}

- (void)scrollToWorkoutAtIndexPath:(id)a3 animated:(BOOL)a4
{
  -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](self->_tableView, "scrollToRowAtIndexPath:atScrollPosition:animated:", a3, 1, a4);
}

- (void)_updateFiltersList
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *workoutTypeIDs;
  id v8;
  NSArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *workoutTypeNames;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  void *v44;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutTypeKey emptyKey](CHWorkoutTypeKey, "emptyKey"));
  v44 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider sortedTypeIdentifiers](self->_dataProvider, "sortedTypeIdentifiers"));
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5));
  workoutTypeIDs = self->_workoutTypeIDs;
  self->_workoutTypeIDs = v6;

  v8 = objc_alloc_init((Class)NSMutableArray);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = self->_workoutTypeIDs;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDataProvider localizedNameForWorkoutTypeKey:](CHWorkoutDataProvider, "localizedNameForWorkoutTypeKey:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v13), (_QWORD)v39));
        objc_msgSend(v8, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v11);
  }

  v15 = (NSArray *)objc_msgSend(v8, "copy");
  workoutTypeNames = self->_workoutTypeNames;
  self->_workoutTypeNames = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController _filterMenu](self, "_filterMenu"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController navigationItem](self, "navigationItem"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "rightBarButtonItem"));
  objc_msgSend(v19, "setMenu:", v17);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider currentFilteredTypeIdentifier](self->_dataProvider, "currentFilteredTypeIdentifier"));
  -[CHWorkoutsListViewController _updateFilterButtonTitleForWorkoutTypeKey:](self, "_updateFilterButtonTitleForWorkoutTypeKey:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDataProvider sortedDateComponentKeys](self->_dataProvider, "sortedDateComponentKeys"));
  v22 = objc_msgSend(v21, "count");

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController navigationController](self, "navigationController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "navigationBar"));
  v25 = v24;
  if (v22)
  {
    objc_msgSend(v24, "setUserInteractionEnabled:", 1);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "windows"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstObject"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "tintColor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController navigationController](self, "navigationController"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "navigationBar"));
    objc_msgSend(v31, "setTintColor:", v29);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController navigationController](self, "navigationController"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "interactivePopGestureRecognizer"));
    v34 = v33;
    v35 = 1;
  }
  else
  {
    objc_msgSend(v24, "setUserInteractionEnabled:", 0);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](UIColor, "darkGrayColor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController navigationController](self, "navigationController"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "navigationBar"));
    objc_msgSend(v38, "setTintColor:", v36);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController navigationController](self, "navigationController"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "interactivePopGestureRecognizer"));
    v34 = v33;
    v35 = 0;
  }
  objc_msgSend(v33, "setEnabled:", v35, (_QWORD)v39);

}

- (void)_updateFilterButtonTitleForWorkoutTypeKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[CHWorkoutDataProvider localizedShortNameForWorkoutTypeKey:](CHWorkoutDataProvider, "localizedShortNameForWorkoutTypeKey:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController navigationItem](self, "navigationItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rightBarButtonItem"));
  objc_msgSend(v5, "setTitle:", v6);

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  UIActivityIndicatorView *v9;
  void *v10;
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[2];

  v19.receiver = self;
  v19.super_class = (Class)CHWorkoutsListViewController;
  -[CHWorkoutsListViewController loadView](&v19, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("WORKOUTS"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[CHWorkoutsListViewController setTitle:](self, "setTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController _filterMenu](self, "_filterMenu"));
  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:menu:", 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  -[CHWorkoutsListViewController _updateFiltersList](self, "_updateFiltersList");
  -[CHWorkoutsListViewController _setupTableView](self, "_setupTableView");
  v8 = -[CHWorkoutsListViewController _filterMenu](self, "_filterMenu");
  -[CHWorkoutsListViewController _addDataProviderUpdateHandlers](self, "_addDataProviderUpdateHandlers");
  -[CHWorkoutsListViewController _setupDataSource](self, "_setupDataSource");
  v9 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView setHidesWhenStopped:](v9, "setHidesWhenStopped:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController view](self, "view"));
  objc_msgSend(v10, "addSubview:", v9);

  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v9;
  v12 = v9;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 9, 0, v13, 9, 1.0, 0.0));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 10, 0, v15, 10, 1.0, 0.0));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController view](self, "view"));
  v20[0] = v14;
  v20[1] = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));

  objc_msgSend(v17, "addConstraints:", v18);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHWorkoutsListViewController;
  -[CHWorkoutsListViewController viewDidLoad](&v3, "viewDidLoad");
  if (!-[CHWorkoutDataProvider dataAvailable](self->_dataProvider, "dataAvailable"))
    -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutsListViewController;
  -[CHWorkoutsListViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  if (-[CHWorkoutDataProvider dataAvailable](self->_dataProvider, "dataAvailable"))
    -[CHWorkoutsListViewController _updateFiltersList](self, "_updateFiltersList");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutsListViewController;
  -[CHWorkoutsListViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[UITableView setEditing:animated:](self->_tableView, "setEditing:animated:", 0, 1);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutsListViewController;
  -[CHWorkoutsListViewController viewWillLayoutSubviews](&v4, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  -[UITableView setFrame:](self->_tableView, "setFrame:");

}

- (void)_presentDetailViewForWorkout:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController detailViewControllerForWorkout:](self, "detailViewControllerForWorkout:", v4));
  _HKInitializeLogging(v5, v6);
  v7 = (void *)HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fiui_activityType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
    v14 = 138412802;
    v15 = v9;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WLVC] Selected workout: %@, %@ %@", (uint8_t *)&v14, 0x20u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController navigationController](self, "navigationController"));
  objc_msgSend(v13, "pushViewController:animated:", v5, 1);

}

- (id)_dateStringForComponents:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = qword_10083E138;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_10083E138, &stru_10077A558);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromComponents:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10083E130, "stringFromDate:", v6));
  return v7;
}

- (void)workoutsListDataSource:(id)a3 didSelectWorkout:(id)a4 atIndexPath:(id)a5
{
  -[CHWorkoutsListViewController _presentDetailViewForWorkout:](self, "_presentDetailViewForWorkout:", a4);
}

- (void)workoutsListDataSource:(id)a3 requestsDeleteConfirmationForWorkout:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;

  v6 = a5;
  v7 = objc_msgSend(a4, "_activityMoveMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  if (v7 == (id)2)
  {
    v10 = CFSTR("Localizable-tinker");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE_WORKOUT_ALERT_TITLE_TINKER"), &stru_1007AE1D0, CFSTR("Localizable-tinker")));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = v12;
    v14 = CFSTR("DELETE_WORKOUT_ALERT_DESCRIPTION_TINKER");
  }
  else
  {
    v10 = CFSTR("Localizable");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE_WORKOUT_ALERT_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = v12;
    v14 = CFSTR("DELETE_WORKOUT_ALERT_DESCRIPTION");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1007AE1D0, v10));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v11, v15, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DELETE_WORKOUT_ALERT_CANCEL"), &stru_1007AE1D0, CFSTR("Localizable")));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000CE594;
  v36[3] = &unk_100779BD0;
  v19 = v6;
  v37 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 1, v36));
  objc_msgSend(v16, "addAction:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = v21;
  if (v7 == (id)2)
  {
    v23 = CFSTR("DELETE_WORKOUT_ALERT_YES_TINKER");
    v24 = CFSTR("Localizable-tinker");
  }
  else
  {
    v23 = CFSTR("DELETE_WORKOUT_ALERT_YES");
    v24 = CFSTR("Localizable");
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_1007AE1D0, v24));

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000CE5A8;
  v34[3] = &unk_100779BD0;
  v26 = v19;
  v35 = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v25, 0, v34));
  objc_msgSend(v16, "addAction:", v27);

  if (v7 != (id)2)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("DELETE_WORKOUT_ALERT_WORKOUT_ONLY"), &stru_1007AE1D0, CFSTR("Localizable")));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000CE5BC;
    v32[3] = &unk_100779BD0;
    v33 = v26;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v29, 0, v32));
    objc_msgSend(v16, "addAction:", v30);

  }
  -[CHWorkoutsListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);

}

- (void)workoutsListDataSource:(id)a3 didScrollToSectionWithDateComponents:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController delegate](self, "delegate"));
  objc_msgSend(v6, "workoutsListViewController:didScrollToDateComponents:", self, v5);

}

- (void)workoutsListDataSource:(id)a3 didEncounterReloadingException:(id)a4
{
  id v5;

  -[UITableView removeFromSuperview](self->_tableView, "removeFromSuperview", a3, a4);
  -[CHWorkoutsListViewController _setupTableView](self, "_setupTableView");
  -[CHWorkoutsListViewController _setupDataSource](self, "_setupDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutsListViewController view](self, "view"));
  objc_msgSend(v5, "layoutIfNeeded");

}

- (id)detailViewControllerForWorkout:(id)a3
{
  id v4;
  CHWorkoutDetailViewController *v5;

  v4 = a3;
  v5 = -[CHWorkoutDetailViewController initWithWorkout:workoutActivity:healthStore:model:fitnessAppContext:workoutFormattingManager:workoutDataProvider:badgeImageFactory:friendListManager:achievementLocalizationProvider:pauseRingsCoordinator:achievementResourceProvider:formattingManager:awardsDataProvider:]([CHWorkoutDetailViewController alloc], "initWithWorkout:workoutActivity:healthStore:model:fitnessAppContext:workoutFormattingManager:workoutDataProvider:badgeImageFactory:friendListManager:achievementLocalizationProvider:pauseRingsCoordinator:achievementResourceProvider:formattingManager:awardsDataProvider:", v4, 0, self->_healthStore, self->_model, self->_fitnessAppContext, self->_workoutFormattingManager, self->_workoutDataProvider, self->_badgeImageFactory, self->_friendListManager, self->_achievementLocalizationProvider, self->_pauseRingsCoordinator, self->_achievementResourceProvider, self->_formattingManager, self->_awardsDataProvider);

  return v5;
}

- (CHWorkoutsListViewControllerDelegate)delegate
{
  return (CHWorkoutsListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_awardsDataProvider, 0);
  objc_storeStrong((id *)&self->_achievementResourceProvider, 0);
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
  objc_storeStrong((id *)&self->_achievementLocalizationProvider, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_workoutDataProvider, 0);
  objc_storeStrong((id *)&self->_workoutFormattingManager, 0);
  objc_storeStrong((id *)&self->_previewingContext, 0);
  objc_storeStrong((id *)&self->_workoutTypeNames, 0);
  objc_storeStrong((id *)&self->_workoutTypeIDs, 0);
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItem, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
