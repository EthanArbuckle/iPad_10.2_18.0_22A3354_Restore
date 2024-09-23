@implementation CHWorkoutDetailViewController

- (CHWorkoutDetailViewController)initWithWorkout:(id)a3 workoutActivity:(id)a4 healthStore:(id)a5 model:(id)a6 fitnessAppContext:(id)a7 workoutFormattingManager:(id)a8 workoutDataProvider:(id)a9 badgeImageFactory:(id)a10 friendListManager:(id)a11 achievementLocalizationProvider:(id)a12 pauseRingsCoordinator:(id)a13 achievementResourceProvider:(id)a14 formattingManager:(id)a15 awardsDataProvider:(id)a16
{
  CHWorkoutDetailViewController *v21;
  CHWorkoutDetailViewController *v22;
  void *v23;
  UITableView *v24;
  UITableView *tableView;
  void *v26;
  void *v27;
  CHWorkoutDetailDataSource *v28;
  CHWorkoutDetailDataSource *dataSource;
  id v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  objc_super v48;

  v47 = a3;
  v46 = a4;
  v45 = a5;
  v44 = a6;
  v43 = a7;
  v32 = a8;
  v42 = a8;
  v41 = a9;
  v40 = a10;
  v39 = a11;
  v38 = a12;
  v37 = a13;
  v36 = a14;
  v35 = a15;
  v34 = a16;
  v48.receiver = self;
  v48.super_class = (Class)CHWorkoutDetailViewController;
  v21 = -[CHWorkoutDetailViewController init](&v48, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_healthStore, a5);
    objc_storeStrong((id *)&v22->_workout, a3);
    objc_storeStrong((id *)&v22->_workoutActivity, a4);
    objc_storeStrong((id *)&v22->_model, a6);
    objc_storeStrong((id *)&v22->_fitnessAppContext, a7);
    objc_storeStrong((id *)&v22->_workoutFormattingManager, v32);
    objc_storeStrong((id *)&v22->_workoutDataProvider, a9);
    objc_storeStrong((id *)&v22->_badgeImageFactory, a10);
    objc_storeStrong((id *)&v22->_friendListManager, a11);
    objc_storeStrong((id *)&v22->_achievementLocalizationProvider, a12);
    objc_storeStrong((id *)&v22->_pauseRingsCoordinator, a13);
    objc_storeStrong((id *)&v22->_achievementResourceProvider, a14);
    objc_storeStrong((id *)&v22->_formattingManager, a15);
    objc_storeStrong((id *)&v22->_awardsDataProvider, a16);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "addObserver:selector:name:object:", v22, "_workoutWasDeleted:", CFSTR("FitnessWorkoutWasDeletedNotification"), 0);

    v24 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tableView = v22->_tableView;
    v22->_tableView = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[UITableView setBackgroundColor:](v22->_tableView, "setBackgroundColor:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITableView setSeparatorColor:](v22->_tableView, "setSeparatorColor:", v27);

    -[UITableView setAllowsSelection:](v22->_tableView, "setAllowsSelection:", 0);
    -[UITableView _setHeaderAndFooterViewsFloat:](v22->_tableView, "_setHeaderAndFooterViewsFloat:", 0);
    v28 = -[CHWorkoutDetailDataSource initWithTableView:workout:workoutActivity:healthStore:model:fitnessAppContext:formattingManager:badgeImageFactory:achievementLocalizationProvider:awardsDataProvider:fiuiFormattingManager:]([CHWorkoutDetailDataSource alloc], "initWithTableView:workout:workoutActivity:healthStore:model:fitnessAppContext:formattingManager:badgeImageFactory:achievementLocalizationProvider:awardsDataProvider:fiuiFormattingManager:", v22->_tableView, v22->_workout, v22->_workoutActivity, v22->_healthStore, v22->_model, v22->_fitnessAppContext, v22->_workoutFormattingManager, v22->_badgeImageFactory, v22->_achievementLocalizationProvider, v22->_awardsDataProvider, v22->_formattingManager);
    dataSource = v22->_dataSource;
    v22->_dataSource = v28;

    -[CHWorkoutDetailDataSource setDelegate:](v22->_dataSource, "setDelegate:", v22);
    -[CHWorkoutDetailDataSource setLocationFetcherObserver:](v22->_dataSource, "setLocationFetcherObserver:", v22);
  }

  return v22;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHWorkoutDetailViewController;
  -[CHWorkoutDetailViewController loadView](&v6, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  -[UITableView setFrame:](self->_tableView, "setFrame:");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController view](self, "view"));
  objc_msgSend(v4, "addSubview:", self->_tableView);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDetailAnalyticsTracker sharedInstance](CHWorkoutDetailAnalyticsTracker, "sharedInstance"));
  objc_msgSend(v5, "startTrackingWorkout:workoutActivity:", self->_workout, self->_workoutActivity);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CHWorkoutDetailAnalyticsTracker sharedInstance](CHWorkoutDetailAnalyticsTracker, "sharedInstance"));
  objc_msgSend(v3, "stopTrackingWorkout:workoutActivity:", self->_workout, self->_workoutActivity);

  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutDetailViewController;
  -[CHWorkoutDetailViewController dealloc](&v4, "dealloc");
}

- (void)navigateToSection:(int64_t)a3
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource navigationActionForHeaderInSection:](self->_dataSource, "navigationActionForHeaderInSection:", a3));
  if (v3)
  {
    v4 = v3;
    v3[2](v3, 1);
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

- (void)pushViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "pushViewController:animated:", v4, 1);

}

- (void)presentViewController:(id)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A5DC8;
  v7[3] = &unk_1007799E8;
  v8 = a4;
  v6 = v8;
  -[CHWorkoutDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, v7);

}

- (void)presentAchievement:(id)a3 badgeRect:(CGRect)a4 cell:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v15;
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v16;
  id v17;
  void *v18;
  id v19;
  AAUIAchievementDetailTransitionAnimator *v20;
  AAUIAchievementDetailTransitionAnimator *achievementTransitionAnimator;
  void *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  v12 = a3;
  v13 = objc_msgSend(v12, "unearned");
  v14 = v13 ^ 1;
  if (AAUIShouldUseNewTrophyCase(v13))
  {
    BYTE3(v23) = 0;
    BYTE2(v23) = v14;
    LOWORD(v23) = 0;
    v15 = -[TrophyCaseAwardDetailViewController initWithAchievement:healthStore:friendListManager:achievementDataProvider:badgeImageFactory:resourceProvider:formattingManager:localizationProvider:pauseRingsCoordinator:fitnessAppContext:workoutFormattingManager:workoutDataProvider:forModalPresentation:shouldShowCelebration:shouldShowEarned:shouldShowAssociatedWorkout:]([_TtC10FitnessApp35TrophyCaseAwardDetailViewController alloc], "initWithAchievement:healthStore:friendListManager:achievementDataProvider:badgeImageFactory:resourceProvider:formattingManager:localizationProvider:pauseRingsCoordinator:fitnessAppContext:workoutFormattingManager:workoutDataProvider:forModalPresentation:shouldShowCelebration:shouldShowEarned:shouldShowAssociatedWorkout:", v12, self->_healthStore, self->_friendListManager, self->_awardsDataProvider, self->_badgeImageFactory, self->_achievementResourceProvider, self->_formattingManager, self->_achievementLocalizationProvider, self->_pauseRingsCoordinator, self->_fitnessAppContext, self->_workoutFormattingManager, self->_workoutDataProvider, v23);
  }
  else
  {
    v15 = -[CHAchievementDetailViewController initWithAchievement:locProvider:formatsForFriend:forDayView:forModalPresentation:shouldShowCelebration:]([CHAchievementDetailViewController alloc], "initWithAchievement:locProvider:formatsForFriend:forDayView:forModalPresentation:shouldShowCelebration:", v12, self->_achievementLocalizationProvider, 0, 1, 0, 0);
  }
  v16 = v15;

  v17 = objc_alloc((Class)AAUIAchievementDetailTransitionAnimator);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "insetView"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000A604C;
  v26[3] = &unk_100777E20;
  v27 = v11;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000A6058;
  v24[3] = &unk_100777E20;
  v25 = v27;
  v19 = v27;
  v20 = (AAUIAchievementDetailTransitionAnimator *)objc_msgSend(v17, "initWithPresentingViewController:detailViewController:shouldPlayFlipInAnimation:initialBadgeFrame:conversionView:didStartAnimationBlock:didFinishAnimationBlock:", self, v16, v14, v18, v26, v24, x, y, width, height);
  achievementTransitionAnimator = self->_achievementTransitionAnimator;
  self->_achievementTransitionAnimator = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController navigationController](self, "navigationController"));
  objc_msgSend(v22, "pushViewController:animated:", v16, 1);

}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  UIViewController *v12;
  uint64_t v13;
  UIViewController *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  AAUIAchievementDetailTransitionAnimator *v18;
  AAUIAchievementDetailTransitionAnimator *achievementTransitionAnimator;

  v10 = a3;
  v11 = a5;
  v12 = (UIViewController *)a6;
  v14 = v12;
  if (a4 == 2)
  {
    if (self->_transitionAnimatorFromViewController != v12)
    {
      achievementTransitionAnimator = 0;
LABEL_10:
      v18 = achievementTransitionAnimator;
      goto LABEL_11;
    }
LABEL_9:
    achievementTransitionAnimator = self->_achievementTransitionAnimator;
    goto LABEL_10;
  }
  if (a4 == 1)
  {
    v15 = objc_opt_class(_TtC10FitnessApp35TrophyCaseAwardDetailViewController, v13);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      v17 = objc_opt_class(CHWorkoutDetailViewController, v16);
      if ((objc_opt_isKindOfClass(v11, v17) & 1) != 0)
      {
        objc_storeStrong((id *)&self->_transitionAnimatorFromViewController, a5);
        goto LABEL_9;
      }
    }
  }
  v18 = 0;
LABEL_11:

  return v18;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

- (void)pushWorkoutActivity:(id)a3
{
  id v4;
  void *v5;
  CHWorkoutDetailViewController *v6;

  v4 = a3;
  v6 = -[CHWorkoutDetailViewController initWithWorkout:workoutActivity:healthStore:model:fitnessAppContext:workoutFormattingManager:workoutDataProvider:badgeImageFactory:friendListManager:achievementLocalizationProvider:pauseRingsCoordinator:achievementResourceProvider:formattingManager:awardsDataProvider:]([CHWorkoutDetailViewController alloc], "initWithWorkout:workoutActivity:healthStore:model:fitnessAppContext:workoutFormattingManager:workoutDataProvider:badgeImageFactory:friendListManager:achievementLocalizationProvider:pauseRingsCoordinator:achievementResourceProvider:formattingManager:awardsDataProvider:", self->_workout, v4, self->_healthStore, self->_model, self->_fitnessAppContext, self->_workoutFormattingManager, self->_workoutDataProvider, self->_badgeImageFactory, self->_friendListManager, self->_achievementLocalizationProvider, self->_pauseRingsCoordinator, self->_achievementResourceProvider, self->_formattingManager, self->_awardsDataProvider);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CHWorkoutDetailViewController;
  -[CHWorkoutDetailViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager formattedDateForWorkout:context:](self->_workoutFormattingManager, "formattedDateForWorkout:context:", self->_workout, CFSTR("WorkoutDetailDisplayContext")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "string"));
  -[CHWorkoutDetailViewController setTitle:](self, "setTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setLargeTitleDisplayMode:", 2);

  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 9, self, "shareTapped:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutDetailViewController;
  -[CHWorkoutDetailViewController viewWillLayoutSubviews](&v4, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  -[UITableView setFrame:](self->_tableView, "setFrame:");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CHWorkoutDetailViewController;
  -[CHWorkoutDetailViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController navigationController](self, "navigationController"));
  v5 = objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___CHActivityHistoryPaletteNavigationController);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController navigationController](self, "navigationController"));
    objc_msgSend(v6, "detachPalette");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "refreshWorkoutLocations", UIApplicationDidBecomeActiveNotification, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController navigationController](self, "navigationController"));
  objc_msgSend(v8, "setDelegate:", self);

  -[CHWorkoutDetailViewController annotateView](self, "annotateView");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHWorkoutDetailViewController;
  -[CHWorkoutDetailViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIApplicationDidBecomeActiveNotification, 0);

}

- (void)refreshWorkoutLocations
{
  -[CHWorkoutDetailDataSource fetchLocations](self->_dataSource, "fetchLocations");
}

- (void)shareTapped:(id)a3
{
  void *v4;
  unsigned int v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHFitnessAppContext seymourCatalogItemDataProvider](self->_fitnessAppContext, "seymourCatalogItemDataProvider", a3));
  v5 = objc_msgSend(v4, "isSeymourWorkout:", self->_workout);

  if (v5)
    -[CHWorkoutDetailViewController _shareSeymourWorkout](self, "_shareSeymourWorkout");
  else
    -[CHWorkoutDetailViewController _shareWorkout](self, "_shareWorkout");
}

- (void)_shareWorkout
{
  CHWorkoutFormattingManager *workoutFormattingManager;
  HKWorkout *workout;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  workoutFormattingManager = self->_workoutFormattingManager;
  workout = self->_workout;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource routeImageForSharing](self->_dataSource, "routeImageForSharing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutFormattingManager shareImageForWorkout:routeImage:](workoutFormattingManager, "shareImageForWorkout:routeImage:", workout, v5));

  if (v6)
  {
    -[CHWorkoutDetailViewController setSharingImage:](self, "setSharingImage:", v6);
    v8[0] = v6;
    v8[1] = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));
    -[CHWorkoutDetailViewController _presentActivityViewControllerForItems:](self, "_presentActivityViewControllerForItems:", v7);

  }
}

- (void)_shareSeymourWorkout
{
  CHFitnessAppContext *fitnessAppContext;
  HKWorkout *workout;
  _QWORD v4[5];

  fitnessAppContext = self->_fitnessAppContext;
  workout = self->_workout;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A670C;
  v4[3] = &unk_1007797A8;
  v4[4] = self;
  -[CHFitnessAppContext shareSheetActivityItemsWithWorkout:completion:](fitnessAppContext, "shareSheetActivityItemsWithWorkout:completion:", workout, v4);
}

- (void)_presentActivityViewControllerForItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = objc_msgSend(objc_alloc((Class)UIActivityViewController), "initWithActivityItems:applicationActivities:", v4, 0);

  v5 = sub_10005FD28();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v12, "setExcludedActivityTypes:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController navigationController](self, "navigationController"));
  if (v7)
  {
    -[CHWorkoutDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windows"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootViewController"));

    objc_msgSend(v11, "presentViewController:animated:completion:", v12, 1, 0);
  }

}

- (void)_presentConfigurationData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A6988;
  v6[3] = &unk_100779A10;
  v5 = (id)objc_opt_new(WKUIRemoteViewServiceAdaptor);
  v7 = v5;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "presentRemoteViewControllerOnHostController:workoutPlanData:dismissHandler:completionHandler:", self, v4, v6, &stru_100779A30);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1007AE1D0;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  HKWorkoutActivityType v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  UIImage *v23;
  NSData *v24;
  void *v25;
  id v26;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController sharingImage](self, "sharingImage", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout metadata](self->_workout, "metadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", HKMetadataKeyWorkoutBrandName));

    if (!objc_msgSend(v6, "length"))
    {
      v7 = -[HKWorkout workoutActivityType](self->_workout, "workoutActivityType");
      v8 = -[HKWorkout fi_swimmingLocationType](self->_workout, "fi_swimmingLocationType");
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout metadata](self->_workout, "metadata"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", HKMetadataKeyIndoorWorkout));
      v11 = objc_msgSend(v10, "BOOLValue");

      v12 = FILocalizedNameForActivityType(v7, v8, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);

      v6 = (void *)v13;
    }
    v14 = objc_alloc_init((Class)LPLinkMetadata);
    objc_msgSend(v14, "setTitle:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource routeImageForSharing](self->_dataSource, "routeImageForSharing"));

    if (v15)
    {
      v16 = objc_alloc_init((Class)LPAppStoreStoryMetadata);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("WORKOUT_SHARING_SUBTITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
      objc_msgSend(v16, "setSubtitle:", v18);

      objc_msgSend(v14, "setSpecialization:", v16);
    }
    else
    {
      v19 = objc_alloc((Class)LPImage);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController sharingImage](self, "sharingImage"));
      v16 = objc_msgSend(v19, "initWithPlatformImage:", v20);

      v21 = objc_alloc_init((Class)LPFileMetadata);
      objc_msgSend(v21, "setName:", v6);
      objc_msgSend(v21, "setThumbnail:", v16);
      objc_msgSend(v14, "setSpecialization:", v21);

    }
    v22 = objc_alloc((Class)LPImage);
    v23 = (UIImage *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController sharingImage](self, "sharingImage"));
    v24 = UIImagePNGRepresentation(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_msgSend(v22, "initWithData:MIMEType:", v25, CFSTR("image/png"));
    objc_msgSend(v14, "setImage:", v26);

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)_workoutWasDeleted:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  HKWorkout *workout;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  _QWORD block[5];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CHDeletedWorkoutKey")));

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v30;
    *(_QWORD *)&v8 = 138543362;
    v26 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "UUID", v26));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout UUID](self->_workout, "UUID"));
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if (v14)
        {
          _HKInitializeLogging(v15, v16);
          v17 = (void *)HKLogActivity;
          if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
          {
            workout = self->_workout;
            v19 = v17;
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout UUID](workout, "UUID"));
            *(_DWORD *)buf = v26;
            v34 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Workout %{public}@ was deleted while in workout detail view.", buf, 0xCu);

          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController navigationController](self, "navigationController"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "viewControllers"));

          v23 = (uint64_t)objc_msgSend(v22, "indexOfObjectPassingTest:", &stru_100779A70);
          if (v23 >= 1)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndex:", v23 - 1));
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000A6F20;
            block[3] = &unk_100777EE0;
            block[4] = self;
            v28 = v24;
            v25 = v24;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

          }
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v9);
  }

}

- (void)completedFetchWithLocationReadings:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  UIImage *v18;
  UIImage *v19;
  HKWorkout *workout;
  NSData *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id *v33;
  id *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  UIImage *v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id location;
  _QWORD v64[2];
  _QWORD v65[2];

  v4 = a3;
  if (+[_HKBehavior isAppleInternalInstall](_HKBehavior, "isAppleInternalInstall")
    && _os_feature_enabled_impl("WorkoutUI", "OpenWorkoutButtonInViewer"))
  {
    v5 = objc_opt_new(NSMutableArray);
    v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 9, self, "shareTapped:");
    -[NSMutableArray addObject:](v5, "addObject:", v6);
    objc_initWeak(&location, self);
    v7 = objc_opt_new(NSMutableArray);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout serializedConfigurationDataIncludingRoute:](self->_workout, "serializedConfigurationDataIncludingRoute:", 0));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("doc.text.magnifyingglass")));
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_1000A77C0;
      v60[3] = &unk_100779A98;
      objc_copyWeak(&v62, &location);
      v61 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Preview Configuration"), v9, CFSTR("preview.configuration"), v60));
      -[NSMutableArray addObject:](v7, "addObject:", v10);

      if (_os_feature_enabled_impl("WorkoutKit", "WorkoutPlanRoute"))
      {
        if (-[HKWorkout serializedConfigurationContainsRoute](self->_workout, "serializedConfigurationContainsRoute"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout serializedConfigurationDataIncludingRoute:](self->_workout, "serializedConfigurationDataIncludingRoute:", 1));
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout serializedConfigurationRouteSnapshotData](self->_workout, "serializedConfigurationRouteSnapshotData"));
          v42 = v11;
          if (v11 && v44)
          {
            v12 = objc_msgSend(objc_alloc((Class)UIImage), "initWithData:", v44);
            if (v12)
            {
              v35 = v12;
              v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("route")));
              v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("doc.text.magnifyingglass")));
              v57[0] = _NSConcreteStackBlock;
              v57[1] = 3221225472;
              v57[2] = sub_1000A77FC;
              v57[3] = &unk_100779A98;
              objc_copyWeak(&v59, &location);
              v13 = v11;
              v58 = v13;
              v14 = objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Preview Configuration with Embedded Route"), v40, CFSTR("embedded.route.preview.configuration"), v57));
              v65[0] = v14;
              v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("square.and.arrow.up")));
              v34 = (id *)v14;
              v53[0] = _NSConcreteStackBlock;
              v53[1] = 3221225472;
              v53[2] = sub_1000A7838;
              v53[3] = &unk_100779AC0;
              v33 = &v56;
              objc_copyWeak(&v56, &location);
              v54 = v35;
              v55 = v13;
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Share Configuration with Embedded Route"), v38, CFSTR("embedded.route.share.configuration"), v53));
              v65[1] = v15;
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 2));
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", CFSTR("Embedded Route"), v37, CFSTR("menu.embedded.route"), 0, v16));

              -[NSMutableArray addObject:](v7, "addObject:", v17);
              objc_destroyWeak(&v56);

              objc_destroyWeak(&v59);
              v12 = v35;
            }

          }
        }
        v18 = (UIImage *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailDataSource routeImageForSharing](self->_dataSource, "routeImageForSharing", v33));
        v19 = v18;
        if (v18)
        {
          workout = self->_workout;
          v21 = UIImagePNGRepresentation(v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[HKWorkout serializedConfigurationWithEmbedding:snapshot:](workout, "serializedConfigurationWithEmbedding:snapshot:", v4, v22));

          if (v45)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("location.circle")));
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("doc.text.magnifyingglass")));
            v50[0] = _NSConcreteStackBlock;
            v50[1] = 3221225472;
            v50[2] = sub_1000A787C;
            v50[3] = &unk_100779A98;
            objc_copyWeak(&v52, &location);
            v23 = v45;
            v51 = v23;
            v24 = objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Preview Configuration with Completed Route"), v43, CFSTR("completed.route.preview.configuration"), v50));
            v64[0] = v24;
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("square.and.arrow.up")));
            v36 = (id)v24;
            v46[0] = _NSConcreteStackBlock;
            v46[1] = 3221225472;
            v46[2] = sub_1000A78B8;
            v46[3] = &unk_100779AC0;
            objc_copyWeak(&v49, &location);
            v47 = v19;
            v48 = v23;
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Share Configuration with Completed Route"), v41, CFSTR("completed.route.share.configuration"), v46));
            v64[1] = v25;
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 2));
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", CFSTR("Completed Route"), v39, CFSTR("menu.completed.route"), 0, v26));

            -[NSMutableArray addObject:](v7, "addObject:", v27);
            objc_destroyWeak(&v49);

            objc_destroyWeak(&v52);
          }

        }
      }

      objc_destroyWeak(&v62);
    }
    if (-[NSMutableArray count](v7, "count"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", CFSTR("[Internal Only] Debug Options"), v7));
      v29 = objc_alloc((Class)UIBarButtonItem);
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("ellipsis.circle")));
      v31 = objc_msgSend(v29, "initWithImage:menu:", v30, v28);

      -[NSMutableArray addObject:](v5, "addObject:", v31);
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v32, "setRightBarButtonItems:", v5);

    objc_destroyWeak(&location);
  }

}

- (void)_presentShareSheetWithTitle:(id)a3 image:(id)a4 workoutData:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = NSTemporaryDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v12, 1));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("Workout.workout")));
  LODWORD(v12) = objc_msgSend(v10, "writeToURL:atomically:", v14, 1);

  if ((_DWORD)v12)
  {
    v15 = objc_alloc((Class)UIActivityViewController);
    v23[0] = v8;
    v23[1] = v9;
    v23[2] = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 3));
    v17 = objc_msgSend(v15, "initWithActivityItems:applicationActivities:", v16, 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHWorkoutDetailViewController navigationController](self, "navigationController"));
    if (v18)
    {
      -[CHWorkoutDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "windows"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "rootViewController"));

      objc_msgSend(v22, "presentViewController:animated:completion:", v17, 1, 0);
    }

  }
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (void)setWorkout:(id)a3
{
  objc_storeStrong((id *)&self->_workout, a3);
}

- (HKWorkoutActivity)workoutActivity
{
  return self->_workoutActivity;
}

- (void)setWorkoutActivity:(id)a3
{
  objc_storeStrong((id *)&self->_workoutActivity, a3);
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
  objc_storeStrong((id *)&self->_formattingManager, a3);
}

- (CHWorkoutFormattingManager)workoutFormattingManager
{
  return self->_workoutFormattingManager;
}

- (void)setWorkoutFormattingManager:(id)a3
{
  objc_storeStrong((id *)&self->_workoutFormattingManager, a3);
}

- (UIImage)sharingImage
{
  return self->_sharingImage;
}

- (void)setSharingImage:(id)a3
{
  objc_storeStrong((id *)&self->_sharingImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingImage, 0);
  objc_storeStrong((id *)&self->_workoutFormattingManager, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_workoutActivity, 0);
  objc_storeStrong((id *)&self->_workout, 0);
  objc_storeStrong((id *)&self->_transitionAnimatorFromViewController, 0);
  objc_storeStrong((id *)&self->_achievementTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_achievementResourceProvider, 0);
  objc_storeStrong((id *)&self->_awardsDataProvider, 0);
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
  objc_storeStrong((id *)&self->_achievementLocalizationProvider, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_workoutDataProvider, 0);
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

- (void)annotateView
{
  CHWorkoutDetailViewController *v2;

  v2 = self;
  sub_10020B08C();

}

@end
