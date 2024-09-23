@implementation PhoneSceneDelegate

- (void)aggregator:(id)a3 didUpdateEngagmentBadgeCount:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate seymourNavController](self, "seymourNavController", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tabBarItem"));
  -[PhoneSceneDelegate _setBadgeCount:forTabBarItem:](self, "_setBadgeCount:forTabBarItem:", a4, v6);

}

- (void)aggregator:(id)a3 didUpdateActivitySharingBadgeCount:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activitySharingViewController](self, "activitySharingViewController", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tabBarItem"));
  -[PhoneSceneDelegate _setBadgeCount:forTabBarItem:](self, "_setBadgeCount:forTabBarItem:", a4, v6);

}

- (void)_refreshBadgeCounts
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate appBadgeAggregator](self, "appBadgeAggregator"));
  objc_msgSend(v2, "triggerFetch");

}

- (void)_setBadgeCount:(unint64_t)a3 forTabBarItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSAttributedStringKey v12;
  id v13;

  if (a3)
  {
    v5 = a4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", v6, 1));
    objc_msgSend(v5, "setBadgeValue:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors keyColors](ARUIMetricColors, "keyColors"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nonGradientTextColor"));
    objc_msgSend(v5, "setBadgeColor:", v9);

    v12 = NSForegroundColorAttributeName;
    v10 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    objc_msgSend(v5, "setBadgeTextAttributes:forState:", v11, 0);

  }
  else
  {
    v10 = a4;
    objc_msgSend(v10, "setBadgeValue:", 0);
  }

}

- (void)sceneDidBecomeActive:(id)a3
{
  UIViewController *v4;
  UIViewController *seymourNavController;

  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[CHTabBarController selectedViewController](self->_tabBarController, "selectedViewController", a3));
  seymourNavController = self->_seymourNavController;

  if (v4 == seymourNavController)
    -[CHFitnessAppContext seymourTabSelectedWithSelection:](self->_fitnessAppContext, "seymourTabSelectedWithSelection:", 0);
  -[SeymourAvailabilityManager updateAvailability](self->_seymourAvailabilityManager, "updateAvailability");
  -[PhoneSceneDelegate _refreshBadgeCounts](self, "_refreshBadgeCounts");
  -[ActivityDataProvider updateWidgets](self->_activityDataProvider, "updateWidgets");
  -[SeymourDiscoverySheetCoordinator activate](self->_seymourDiscoverySheetCoordinator, "activate");
  -[PhoneSceneDelegate updateTVDiscovery](self, "updateTVDiscovery");
}

- (void)_setActivityTabBarImage
{
  void *v3;
  unsigned int v4;
  __CFString **v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior"));
  v4 = objc_msgSend(v3, "isStandalonePhoneFitnessMode");
  v5 = &off_10077A798;
  if (!v4)
    v5 = &off_10077A790;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", *v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tabBarItem"));
  objc_msgSend(v7, "setImage:", v8);

}

- (void)_configureWorkoutHandler
{
  void ***v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_10004C61C;
  v7 = &unk_100777C80;
  objc_copyWeak(&v8, &location);
  v3 = objc_retainBlock(&v4);
  -[CHWorkoutDataProvider addUpdateHandler:](self->_workoutsDataProvider, "addUpdateHandler:", v3, v4, v5, v6, v7);
  -[CHWorkoutDataProvider addAnimatedUpdateHandler:](self->_workoutsDataProvider, "addAnimatedUpdateHandler:", v3);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)updateTVDiscovery
{
  NSObject *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  _HKInitializeLogging(self, a2);
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating TV Discovery", v8, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = objc_msgSend(v4, "applicationState") == 0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate tvConnectionManager](self, "tvConnectionManager"));
  objc_msgSend(v6, "setIsDiscoveryAllowed:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate tvConnectionManager](self, "tvConnectionManager"));
  objc_msgSend(v7, "updateDiscoveryStateIfNeeded");

}

- (NLTVConnectionManager)tvConnectionManager
{
  void *v3;
  NLTVConnectionManager *v4;
  NLTVConnectionManager *tvConnectionManager;
  NSObject *v6;
  uint8_t v8[16];

  if (!self->_tvConnectionManager)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
    v4 = -[NLTVConnectionManager presenter:userNotificationCenter:]([NLTVConnectionManager alloc], "presenter:userNotificationCenter:", self, v3);
    tvConnectionManager = self->_tvConnectionManager;
    self->_tvConnectionManager = v4;

  }
  _HKInitializeLogging(self, a2);
  v6 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Initializing TVConnectionManager!", v8, 2u);
  }
  return self->_tvConnectionManager;
}

- (void)_setupActivityAppAndLoadData
{
  AAUIAchievementsDataProvider *v3;
  AAUIAchievementsDataProvider *achievementsDataProvider;
  CHFitnessAppContext *fitnessAppContext;
  CHFitnessAppContext *v6;
  CHFitnessAppContext *v7;
  AAUIBadgeImageFactory *v8;
  AAUIBadgeImageFactory *badgeImageFactory;
  ACHAchievementLocalizationProvider *v10;
  ACHAchievementLocalizationProvider *achievementLocalizationProvider;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  ASActivitySharingClient *v17;
  ASActivitySharingClient *activitySharingClient;
  FIUIModel *v19;
  FIUIModel *model;
  ASFriendListSectionManager *v21;
  ASFriendListSectionManager *friendListManager;
  CHWorkoutDataProvider *v23;
  CHWorkoutDataProvider *workoutsDataProvider;
  _TtC10FitnessApp17ActivityDateCache *v25;
  _TtC10FitnessApp17ActivityDateCache *activityDateCache;
  _TtC10FitnessApp20ActivityDataProvider *v27;
  _TtC10FitnessApp20ActivityDataProvider *activityDataProvider;
  CHNavigator *v29;
  CHNavigator *deeplinkNavigator;
  _TtC10FitnessApp19BalanceDataProvider *v31;
  HKHealthStore *healthStore;
  id v33;
  _TtC10FitnessApp19BalanceDataProvider *v34;
  _TtC10FitnessApp19BalanceDataProvider *balanceDataProvider;
  _TtC10FitnessApp25TrendsAvailabilityManager *v36;
  _TtC10FitnessApp25TrendsAvailabilityManager *trendsAvailabilityManager;
  _TtC10FitnessApp38SeymourNotificationResponseCoordinator *v38;
  _TtC10FitnessApp38SeymourNotificationResponseCoordinator *seymourNotificationResponseCoordinator;
  CHFitnessAppBadgeAggregator *v40;
  CHFitnessAppBadgeAggregator *appBadgeAggregator;
  _TtC10FitnessApp32SeymourDiscoverySheetCoordinator *v42;
  _TtC10FitnessApp32SeymourDiscoverySheetCoordinator *seymourDiscoverySheetCoordinator;
  CHActivityTypeKeyMigrator *v44;
  void *v45;
  CHActivityTypeKeyMigrator *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[5];
  _QWORD v58[5];
  CGAffineTransform v59;
  uint8_t buf[16];

  v3 = (AAUIAchievementsDataProvider *)objc_msgSend(objc_alloc((Class)AAUIAchievementsDataProvider), "initWithHealthStore:layoutMode:", self->_healthStore, 0);
  achievementsDataProvider = self->_achievementsDataProvider;
  self->_achievementsDataProvider = v3;

  -[AAUIAchievementsDataProvider startFetching](self->_achievementsDataProvider, "startFetching");
  fitnessAppContext = self->_fitnessAppContext;
  if (!fitnessAppContext)
  {
    v6 = -[CHFitnessAppContext initWithHealthStore:seymourAvailabilityManager:wheelchairUseCache:formattingManager:pregnancyStateProvider:]([CHFitnessAppContext alloc], "initWithHealthStore:seymourAvailabilityManager:wheelchairUseCache:formattingManager:pregnancyStateProvider:", self->_healthStore, self->_seymourAvailabilityManager, self->_wheelchairUseCache, self->_fitnessUIFormattingManager, self->_pregnancyStateProvider);
    v7 = self->_fitnessAppContext;
    self->_fitnessAppContext = v6;

    fitnessAppContext = self->_fitnessAppContext;
  }
  -[CHFitnessAppContext setNavigationDelegate:](fitnessAppContext, "setNavigationDelegate:", self);
  v8 = (AAUIBadgeImageFactory *)objc_alloc_init((Class)AAUIBadgeImageFactory);
  badgeImageFactory = self->_badgeImageFactory;
  self->_badgeImageFactory = v8;

  v10 = (ACHAchievementLocalizationProvider *)objc_alloc_init((Class)ACHAchievementLocalizationProvider);
  achievementLocalizationProvider = self->_achievementLocalizationProvider;
  self->_achievementLocalizationProvider = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FIUIFormattingManager unitManager](self->_fitnessUIFormattingManager, "unitManager"));
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___ACHUnitManager);
    if ((_DWORD)v14)
    {
      -[ACHAchievementLocalizationProvider setAchUnitManager:](self->_achievementLocalizationProvider, "setAchUnitManager:", v13);
    }
    else
    {
      _HKInitializeLogging(v14, v15);
      v16 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FIUIUnitManager failed to conform to the ACHUnitManager protocol, template's canonical unit will be utilized", buf, 2u);
      }
    }
  }
  -[ACHAchievementLocalizationProvider setWheelchairUser:](self->_achievementLocalizationProvider, "setWheelchairUser:", -[_HKWheelchairUseCharacteristicCache isWheelchairUser](self->_wheelchairUseCache, "isWheelchairUser"));
  v17 = (ASActivitySharingClient *)objc_alloc_init((Class)ASActivitySharingClient);
  activitySharingClient = self->_activitySharingClient;
  self->_activitySharingClient = v17;

  -[ASActivitySharingClient activateWithCompletionHandler:](self->_activitySharingClient, "activateWithCompletionHandler:", &stru_10077A330);
  v19 = (FIUIModel *)objc_msgSend(objc_alloc((Class)FIUIModel), "initWithHealthStore:", self->_healthStore);
  model = self->_model;
  self->_model = v19;

  v21 = (ASFriendListSectionManager *)objc_msgSend(objc_alloc((Class)ASFriendListSectionManager), "initWithModel:activitySharingClient:workoutDataProvider:", self->_model, self->_activitySharingClient, 0);
  friendListManager = self->_friendListManager;
  self->_friendListManager = v21;

  v23 = (CHWorkoutDataProvider *)objc_claimAutoreleasedReturnValue(-[CHHistoryDataProvider workoutDataProvider](self->_historyDataProvider, "workoutDataProvider"));
  workoutsDataProvider = self->_workoutsDataProvider;
  self->_workoutsDataProvider = v23;

  v25 = objc_alloc_init(_TtC10FitnessApp17ActivityDateCache);
  activityDateCache = self->_activityDateCache;
  self->_activityDateCache = v25;

  v27 = -[ActivityDataProvider initWithHealthStore:wheelchairUseCache:workoutDataProvider:achievementsDataProvider:]([_TtC10FitnessApp20ActivityDataProvider alloc], "initWithHealthStore:wheelchairUseCache:workoutDataProvider:achievementsDataProvider:", self->_healthStore, self->_wheelchairUseCache, self->_workoutsDataProvider, self->_achievementsDataProvider);
  activityDataProvider = self->_activityDataProvider;
  self->_activityDataProvider = v27;

  v29 = (CHNavigator *)objc_claimAutoreleasedReturnValue(+[CHNavigator sharedNavigator](CHNavigator, "sharedNavigator"));
  deeplinkNavigator = self->_deeplinkNavigator;
  self->_deeplinkNavigator = v29;

  v31 = [_TtC10FitnessApp19BalanceDataProvider alloc];
  healthStore = self->_healthStore;
  v33 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v34 = -[BalanceDataProvider initWithHealthStore:gregorianCalendar:historyDataProvider:activityDataProvider:isFaking:](v31, "initWithHealthStore:gregorianCalendar:historyDataProvider:activityDataProvider:isFaking:", healthStore, v33, self->_historyDataProvider, self->_activityDataProvider, 0);
  balanceDataProvider = self->_balanceDataProvider;
  self->_balanceDataProvider = v34;

  v36 = -[TrendsAvailabilityManager initWithDataProvider:healthStore:]([_TtC10FitnessApp25TrendsAvailabilityManager alloc], "initWithDataProvider:healthStore:", self->_activityDataProvider, self->_healthStore);
  trendsAvailabilityManager = self->_trendsAvailabilityManager;
  self->_trendsAvailabilityManager = v36;

  v38 = -[SeymourNotificationResponseCoordinator initWithFitnessAppContext:]([_TtC10FitnessApp38SeymourNotificationResponseCoordinator alloc], "initWithFitnessAppContext:", self->_fitnessAppContext);
  seymourNotificationResponseCoordinator = self->_seymourNotificationResponseCoordinator;
  self->_seymourNotificationResponseCoordinator = v38;

  -[PhoneSceneDelegate _updateSeymourNavigationController](self, "_updateSeymourNavigationController");
  v40 = -[CHFitnessAppBadgeAggregator initWithFitnessAppContext:activitySharingClient:]([CHFitnessAppBadgeAggregator alloc], "initWithFitnessAppContext:activitySharingClient:", self->_fitnessAppContext, self->_activitySharingClient);
  appBadgeAggregator = self->_appBadgeAggregator;
  self->_appBadgeAggregator = v40;

  -[CHFitnessAppBadgeAggregator setDelegate:](self->_appBadgeAggregator, "setDelegate:", self);
  -[CHFitnessAppContext setAppBadgeAggregator:](self->_fitnessAppContext, "setAppBadgeAggregator:", self->_appBadgeAggregator);
  v42 = -[SeymourDiscoverySheetCoordinator initWithAppContext:badgingProvider:delegate:]([_TtC10FitnessApp32SeymourDiscoverySheetCoordinator alloc], "initWithAppContext:badgingProvider:delegate:", self->_fitnessAppContext, self->_appBadgeAggregator, self);
  seymourDiscoverySheetCoordinator = self->_seymourDiscoverySheetCoordinator;
  self->_seymourDiscoverySheetCoordinator = v42;

  if (_os_feature_enabled_impl("Workout", "OtherGPSWorkouts"))
  {
    v44 = [CHActivityTypeKeyMigrator alloc];
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[CHFitnessAppActivityTypeMigrationKeys migrationKeys](CHFitnessAppActivityTypeMigrationKeys, "migrationKeys"));
    v46 = -[CHActivityTypeKeyMigrator initWithMigrationKeys:](v44, "initWithMigrationKeys:", v45);

    -[CHActivityTypeKeyMigrator migrateIfNeeded](v46, "migrateIfNeeded");
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  objc_msgSend(v47, "setDelegate:", self);

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[TrendsAvailabilityManager trendsAvailabilityDidChangeNotification](_TtC10FitnessApp25TrendsAvailabilityManager, "trendsAvailabilityDidChangeNotification"));
  objc_msgSend(v48, "addObserver:selector:name:object:", self, "_trendsAvailabilityStatusDidChange:", v49, self->_trendsAvailabilityManager);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate _createRootViewController](self, "_createRootViewController"));
  -[PhoneSceneDelegate setRootViewController:](self, "setRootViewController:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate window](self, "window"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate rootViewController](self, "rootViewController"));
  objc_msgSend(v51, "setRootViewController:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate window](self, "window"));
  objc_msgSend(v53, "makeKeyAndVisible");

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v54, "addObserver:selector:name:object:", self, "updateTVDiscovery", UIApplicationDidBecomeActiveNotification, 0);

  if (self->_loadingView)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CHTabBarController view](self->_tabBarController, "view"));
    CGAffineTransformMakeScale(&v59, 0.9, 0.9);
    objc_msgSend(v55, "setTransform:", &v59);

    v57[4] = self;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_1000BF758;
    v58[3] = &unk_100777E20;
    v58[4] = self;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1000BF7D0;
    v57[3] = &unk_100778DB0;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v58, v57, 0.5);
  }
  else
  {
    -[PhoneSceneDelegate _showCoachingDataCollectionMessageIfNeeded](self, "_showCoachingDataCollectionMessageIfNeeded");
    +[CHNotificationConsentController updateAuthorization](CHNotificationConsentController, "updateAuthorization");
  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[WODataLinkMonitor shared](WODataLinkMonitor, "shared"));
  objc_msgSend(v56, "setDelegate:", self);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _TtC10FitnessApp26SeymourAvailabilityManager *v35;
  void *v36;
  void *v37;
  void *v38;
  CHOnboardingCoordinator *v39;
  void *v40;
  CHOnboardingCoordinator *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  uint8_t v66[128];
  uint8_t buf[4];
  id v68;

  v7 = a3;
  v8 = a5;
  v9 = -[PhoneSceneDelegate isMirroringSessionActive](self, "isMirroringSessionActive");
  if (v9)
  {
    _HKInitializeLogging(v9, v10);
    v11 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Intercepting session because a Mirrored workout is running", buf, 2u);
    }
  }
  else
  {
    v12 = objc_opt_class(UIWindowScene, v10);
    if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
    {
      v13 = v7;
      -[PhoneSceneDelegate setConnectionOptions:](self, "setConnectionOptions:", v8);
      -[PhoneSceneDelegate setWindowScene:](self, "setWindowScene:", v13);
      v14 = objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v13);
      -[PhoneSceneDelegate setWindow:](self, "setWindow:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate window](self, "window"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      objc_msgSend(v15, "setBackgroundColor:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate window](self, "window"));
      objc_msgSend(v17, "_accessibilitySetInterfaceStyleIntent:", 2);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "delegate"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "healthStore"));
      -[PhoneSceneDelegate setHealthStore:](self, "setHealthStore:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "delegate"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "historyDataProvider"));
      -[PhoneSceneDelegate setHistoryDataProvider:](self, "setHistoryDataProvider:", v23);

      v24 = objc_msgSend(objc_alloc((Class)_HKWheelchairUseCharacteristicCache), "initWithHealthStore:", self->_healthStore);
      -[PhoneSceneDelegate setWheelchairUseCache:](self, "setWheelchairUseCache:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "delegate"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "fitnessUIFormattingManager"));
      -[PhoneSceneDelegate setFitnessUIFormattingManager:](self, "setFitnessUIFormattingManager:", v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "delegate"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "workoutFormattingManager"));
      -[PhoneSceneDelegate setWorkoutFormattingManager:](self, "setWorkoutFormattingManager:", v30);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "delegate"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "pauseRingsCoordinator"));
      -[PhoneSceneDelegate setPauseRingsCoordinator:](self, "setPauseRingsCoordinator:", v33);

      v34 = objc_msgSend(objc_alloc((Class)FIUIPregnancyStateProvider), "initWithHealthStore:", self->_healthStore);
      -[PhoneSceneDelegate setPregnancyStateProvider:](self, "setPregnancyStateProvider:", v34);

      v35 = objc_alloc_init(_TtC10FitnessApp26SeymourAvailabilityManager);
      -[PhoneSceneDelegate setSeymourAvailabilityManager:](self, "setSeymourAvailabilityManager:", v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[SeymourAvailabilityManager seymourAvailabilityDidChangeNotification](_TtC10FitnessApp26SeymourAvailabilityManager, "seymourAvailabilityDidChangeNotification"));
      objc_msgSend(v36, "addObserver:selector:name:object:", self, "_seymourAvailabilityStatusDidChange:", v37, 0);

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
      objc_msgSend(v38, "checkInWithCompletion:", 0);

      v39 = [CHOnboardingCoordinator alloc];
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate healthStore](self, "healthStore"));
      v41 = -[CHOnboardingCoordinator initWithHealthStore:](v39, "initWithHealthStore:", v40);
      -[PhoneSceneDelegate setOnboardingCoordinator:](self, "setOnboardingCoordinator:", v41);

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate onboardingCoordinator](self, "onboardingCoordinator"));
      objc_msgSend(v42, "setDelegate:", self);

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
      v65 = 0;
      objc_msgSend(v43, "setCategory:error:", AVAudioSessionCategoryAmbient, &v65);
      v44 = v65;

      if (v44)
      {
        _HKInitializeLogging(v45, v46);
        v47 = HKLogActivity;
        if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v68 = v44;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate failed to set AVAudioSession category to ambient %@", buf, 0xCu);
        }
      }
      if (-[PhoneSceneDelegate activityHasBeenSetup](self, "activityHasBeenSetup"))
      {
        -[PhoneSceneDelegate _setupActivityAppAndLoadData](self, "_setupActivityAppAndLoadData");
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortcutItem"));

        if (v48)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortcutItem"));
          -[PhoneSceneDelegate _handleShortcutItem:didJustLaunch:](self, "_handleShortcutItem:didJustLaunch:", v49, 1);
        }
        else
        {
          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLContexts", 0));
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v62;
            do
            {
              v54 = 0;
              do
              {
                if (*(_QWORD *)v62 != v53)
                  objc_enumerationMutation(v50);
                -[PhoneSceneDelegate openURLContext:](self, "openURLContext:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v54));
                v54 = (char *)v54 + 1;
              }
              while (v52 != v54);
              v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
            }
            while (v52);
          }

          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "notificationResponse"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "notification"));
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "request"));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "content"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "userInfo"));

          if ((-[PhoneSceneDelegate _parseFitnessCoachingNotificationType:](self, "_parseFitnessCoachingNotificationType:", v49) & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            v59 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate rootViewController](self, "rootViewController"));
            objc_msgSend(v59, "hide");

          }
          notify_register_dispatch(kHKFirstDayOfFitnessWeekDidChangeNotification, &self->_fitnessWeekRedefinedChangeToken, (dispatch_queue_t)&_dispatch_main_q, &stru_10077A298);
          v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
          objc_msgSend(v60, "addObserver:selector:name:object:", self, "memoryWarningReceived:", UIApplicationDidReceiveMemoryWarningNotification, 0);

        }
      }
      else
      {
        -[PhoneSceneDelegate _setupOnboarding](self, "_setupOnboarding");
      }

    }
  }

}

- (UIWindow)window
{
  return self->_window;
}

- (BOOL)aggregatorShouldAllowEngagementBadging:(id)a3
{
  return -[SeymourAvailabilityManager available](self->_seymourAvailabilityManager, "available", a3);
}

- (id)_createRootViewController
{
  void *v3;
  void *v4;
  void *v5;
  CHActivityHistoryNavigationController *v6;
  void *v7;
  void *v8;
  CHActivityHistoryNavigationController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  CHFriendManager *v17;
  _TtC10FitnessApp23FriendsSetupCoordinator *v18;
  void *v19;
  void *v20;
  _TtC10FitnessApp23FriendsSetupCoordinator *v21;
  id v22;
  _TtC10FitnessApp31ActivityDashboardViewController *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _TtC10FitnessApp26ActivityTileViewController *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _TtC10FitnessApp26ActivityTileViewController *v38;
  void *v39;
  void *v40;
  void *v41;
  AAUIAchievementsDataProvider *achievementsDataProvider;
  ASActivitySharingClient *activitySharingClient;
  CHFitnessAppContext *fitnessAppContext;
  FIUIFormattingManager *fitnessUIFormattingManager;
  ASFriendListSectionManager *friendListManager;
  _TtC10FitnessApp23FriendsSetupCoordinator *friendsSetupCoordinator;
  CHFriendManager *friendManager;
  HKHealthStore *healthStore;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  CHTabBarController *v61;
  void *v62;
  void *v63;
  void *v64;
  CHNavigationTracker *v65;
  void *v66;
  void *v67;
  CHNavigationTracker *v68;
  CHRootViewController *v69;
  void *v70;
  void *v71;
  CHRootViewController *v72;
  void *v74;
  void *v75;
  void *v76;
  ACHAchievementLocalizationProvider *achievementLocalizationProvider;
  void *v78;
  AAUIBadgeImageFactory *badgeImageFactory;
  void *v80;
  void *v81;
  void *v82;
  _TtC10FitnessApp24ActivityDashboardContext *v83;
  void *v84;
  _QWORD handler[4];
  id v86;
  id location;
  void *v88;
  void *v89;

  +[ActivitySummaryCache setHealthStore:](ActivitySummaryCache, "setHealthStore:", self->_healthStore);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ActivitySummaryCache sharedInstance](ActivitySummaryCache, "sharedInstance"));
  objc_msgSend(v3, "loadDataIfNeeded");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate workoutsDataProvider](self, "workoutsDataProvider"));
  objc_msgSend(v4, "startFetching");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate workoutsDataProvider](self, "workoutsDataProvider"));
  self->_hasCurrentWorkouts = objc_msgSend(v5, "hasWorkouts");

  -[PhoneSceneDelegate _configureWorkoutHandler](self, "_configureWorkoutHandler");
  v6 = [CHActivityHistoryNavigationController alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDateCache](self, "activityDateCache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate pauseRingsCoordinator](self, "pauseRingsCoordinator"));
  v9 = -[CHActivityHistoryNavigationController initWithDateCache:pauseRingsCoordinator:](v6, "initWithDateCache:pauseRingsCoordinator:", v7, v8);
  -[PhoneSceneDelegate setActivityTileNavController:](self, "setActivityTileNavController:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SUMMARY"), &stru_1007AE1D0, CFSTR("Localizable")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tabBarItem"));
  objc_msgSend(v13, "setTitle:", v11);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tabBarItem"));
  objc_msgSend(v15, "setAccessibilityIdentifier:", FIUITabBarSummaryAccessibilityIdentifier);

  -[PhoneSceneDelegate _setActivityTabBarImage](self, "_setActivityTabBarImage");
  objc_initWeak(&location, self);
  v16 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000BFE4C;
  handler[3] = &unk_1007791B0;
  objc_copyWeak(&v86, &location);
  notify_register_dispatch(HKStandalonePhoneFitnessModeDidUpdateNotification, &self->_standalonePhoneFitnessModeChangeToken, (dispatch_queue_t)&_dispatch_main_q, handler);

  v17 = -[CHFriendManager initWithActivitySharingClient:]([CHFriendManager alloc], "initWithActivitySharingClient:", self->_activitySharingClient);
  -[PhoneSceneDelegate setFriendManager:](self, "setFriendManager:", v17);

  v18 = [_TtC10FitnessApp23FriendsSetupCoordinator alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate friendManager](self, "friendManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate friendListManager](self, "friendListManager"));
  v21 = -[FriendsSetupCoordinator initWithFriendManager:friendListSectionManager:](v18, "initWithFriendManager:friendListSectionManager:", v19, v20);
  -[PhoneSceneDelegate setFriendsSetupCoordinator:](self, "setFriendsSetupCoordinator:", v21);

  if (sub_1000D3E9C())
  {
    v22 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    v83 = -[ActivityDashboardContext initWithActivityDataProvider:activityDateCache:achievementsDataProvider:balanceDataProvider:pauseRingsCoordinator:historyDataProvider:workoutFormattingManager:workoutDataProvider:friendListManager:friendsSetupCoordinator:chFriendManager:achievementLocalizationProvider:badgeImageFactory:healthStore:fiuiFormattingManager:fitnessAppContext:wheelchairUseCache:trendsAvailabilityManager:]([_TtC10FitnessApp24ActivityDashboardContext alloc], "initWithActivityDataProvider:activityDateCache:achievementsDataProvider:balanceDataProvider:pauseRingsCoordinator:historyDataProvider:workoutFormattingManager:workoutDataProvider:friendListManager:friendsSetupCoordinator:chFriendManager:achievementLocalizationProvider:badgeImageFactory:healthStore:fiuiFormattingManager:fitnessAppContext:wheelchairUseCache:trendsAvailabilityManager:", self->_activityDataProvider, self->_activityDateCache, self->_achievementsDataProvider, self->_balanceDataProvider, self->_pauseRingsCoordinator, self->_historyDataProvider, self->_workoutFormattingManager, self->_workoutsDataProvider, self->_friendListManager, self->_friendsSetupCoordinator, self->_friendManager, self->_achievementLocalizationProvider, self->_badgeImageFactory, self->_healthStore,
            self->_fitnessUIFormattingManager,
            self->_fitnessAppContext,
            self->_wheelchairUseCache,
            self->_trendsAvailabilityManager);
    v23 = -[ActivityDashboardViewController initWithCollectionViewLayout:context:]([_TtC10FitnessApp31ActivityDashboardViewController alloc], "initWithCollectionViewLayout:context:", v22, v83);
    -[PhoneSceneDelegate setActivityDashboardViewController:](self, "setActivityDashboardViewController:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
    objc_msgSend(v24, "setTrophyCaseViewControllerDelegate:", self);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
    objc_msgSend(v25, "setHistoryPagingViewControllerDelegate:", self);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
    v89 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v89, 1));
    objc_msgSend(v26, "setViewControllers:", v28);

    v81 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityDashboardContext chAwardsDataProvider](v83, "chAwardsDataProvider"));
  }
  else
  {
    v29 = [_TtC10FitnessApp26ActivityTileViewController alloc];
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate healthStore](self, "healthStore"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate fitnessAppContext](self, "fitnessAppContext"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDataProvider](self, "activityDataProvider"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate pauseRingsCoordinator](self, "pauseRingsCoordinator"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate historyDataProvider](self, "historyDataProvider"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate achievementsDataProvider](self, "achievementsDataProvider"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate achievementLocalizationProvider](self, "achievementLocalizationProvider"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate model](self, "model"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate badgeImageFactory](self, "badgeImageFactory"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate friendListManager](self, "friendListManager"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate fitnessUIFormattingManager](self, "fitnessUIFormattingManager"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate workoutFormattingManager](self, "workoutFormattingManager"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDateCache](self, "activityDateCache"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate trendsAvailabilityManager](self, "trendsAvailabilityManager"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate wheelchairUseCache](self, "wheelchairUseCache"));
    v38 = -[ActivityTileViewController initWithHealthStore:fitnessAppContext:activityDataProvider:pauseRingsCoordinator:historyDataProvider:achievementsDataProvider:achievementLocalizationProvider:fiuiModel:badgeImageFactory:friendListManager:fiuiFormattingManager:workoutFormattingManager:activityDateCache:trendsAvailabilityManager:wheelchairUseCache:](v29, "initWithHealthStore:fitnessAppContext:activityDataProvider:pauseRingsCoordinator:historyDataProvider:achievementsDataProvider:achievementLocalizationProvider:fiuiModel:badgeImageFactory:friendListManager:fiuiFormattingManager:workoutFormattingManager:activityDateCache:trendsAvailabilityManager:wheelchairUseCache:", v84, v82, v80, v78, v76, v75, v74, v30, v31, v32, v33, v34, v35, v36, v37);
    -[PhoneSceneDelegate setActivityTileViewController:](self, "setActivityTileViewController:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileViewController](self, "activityTileViewController"));
    v88 = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v88, 1));
    objc_msgSend(v39, "setViewControllers:", v41);

    v81 = (void *)objc_claimAutoreleasedReturnValue(-[ActivityTileViewController awardsDataProviderWrapper](self->_activityTileViewController, "awardsDataProviderWrapper"));
    v83 = 0;
  }
  badgeImageFactory = self->_badgeImageFactory;
  achievementLocalizationProvider = self->_achievementLocalizationProvider;
  achievementsDataProvider = self->_achievementsDataProvider;
  activitySharingClient = self->_activitySharingClient;
  fitnessAppContext = self->_fitnessAppContext;
  fitnessUIFormattingManager = self->_fitnessUIFormattingManager;
  friendListManager = self->_friendListManager;
  friendsSetupCoordinator = self->_friendsSetupCoordinator;
  friendManager = self->_friendManager;
  healthStore = self->_healthStore;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CHFitnessAppContext seymourCatalogItemDataProvider](fitnessAppContext, "seymourCatalogItemDataProvider"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[CHActivitySharingViewControllerFactory makeWithAchievementBadgeImageFactory:achievementLocalizationProvider:achievementsDataProvider:activitySharingClient:awardsDataProvider:fitnessAppContext:fiuiFormattingManager:friendListSectionManager:friendsSetupCoordinator:friendManager:healthStore:seymourCatalogItemDataProvider:wheelchairUseCache:workoutDataProvider:workoutFormattingManager:pauseRingsCoordinator:](CHActivitySharingViewControllerFactory, "makeWithAchievementBadgeImageFactory:achievementLocalizationProvider:achievementsDataProvider:activitySharingClient:awardsDataProvider:fitnessAppContext:fiuiFormattingManager:friendListSectionManager:friendsSetupCoordinator:friendManager:healthStore:seymourCatalogItemDataProvider:wheelchairUseCache:workoutDataProvider:workoutFormattingManager:pauseRingsCoordinator:", badgeImageFactory, achievementLocalizationProvider, achievementsDataProvider, activitySharingClient, v81, fitnessAppContext, fitnessUIFormattingManager, friendListManager, friendsSetupCoordinator, friendManager, healthStore, v50, self->_wheelchairUseCache,
                    self->_workoutsDataProvider,
                    self->_workoutFormattingManager,
                    self->_pauseRingsCoordinator));
  -[PhoneSceneDelegate setActivitySharingViewController:](self, "setActivitySharingViewController:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("person.2.fill")));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activitySharingViewController](self, "activitySharingViewController"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "tabBarItem"));
  objc_msgSend(v54, "setImage:", v52);

  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("SHARING"), &stru_1007AE1D0, CFSTR("Localizable")));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activitySharingViewController](self, "activitySharingViewController"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "tabBarItem"));
  objc_msgSend(v58, "setTitle:", v56);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activitySharingViewController](self, "activitySharingViewController"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "tabBarItem"));
  objc_msgSend(v60, "setAccessibilityIdentifier:", FIUITabBarSharingAccessibilityIdentifier);

  v61 = objc_alloc_init(CHTabBarController);
  -[PhoneSceneDelegate setTabBarController:](self, "setTabBarController:", v61);

  -[PhoneSceneDelegate _setupTabBarViewControllersAndOrbActions](self, "_setupTabBarViewControllersAndOrbActions");
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors keyColors](ARUIMetricColors, "keyColors"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "nonGradientTextColor"));

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate window](self, "window"));
  objc_msgSend(v64, "setTintColor:", v63);

  v65 = [CHNavigationTracker alloc];
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate tabBarController](self, "tabBarController"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate fitnessAppContext](self, "fitnessAppContext"));
  v68 = -[CHNavigationTracker initWithTabBarController:fitnessAppContext:](v65, "initWithTabBarController:fitnessAppContext:", v66, v67);
  -[PhoneSceneDelegate setNavigationTracker:](self, "setNavigationTracker:", v68);

  v69 = [CHRootViewController alloc];
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate tabBarController](self, "tabBarController"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate healthStore](self, "healthStore"));
  v72 = -[CHRootViewController initWithTabBarController:healthStore:](v69, "initWithTabBarController:healthStore:", v70, v71);

  objc_destroyWeak(&v86);
  objc_destroyWeak(&location);
  return v72;
}

- (CHWorkoutDataProvider)workoutsDataProvider
{
  return self->_workoutsDataProvider;
}

- (CHTabBarController)tabBarController
{
  return self->_tabBarController;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (_TtC10FitnessApp26ActivityTileViewController)activityTileViewController
{
  return self->_activityTileViewController;
}

- (CHActivityHistoryNavigationController)activityTileNavController
{
  return self->_activityTileNavController;
}

- (_TtC10FitnessApp17ActivityDateCache)activityDateCache
{
  return self->_activityDateCache;
}

- (void)_updateSeymourNavigationController
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint8_t v30[16];
  uint8_t v31[16];
  uint8_t v32[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate seymourAvailabilityManager](self, "seymourAvailabilityManager"));
  v4 = objc_msgSend(v3, "available");

  if (v4)
  {
    _HKInitializeLogging(v5, v6);
    v7 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[seymour] Updating navigation controller", buf, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate fitnessAppContext](self, "fitnessAppContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "seymourNavigationController"));
    -[PhoneSceneDelegate setSeymourNavController:](self, "setSeymourNavController:", v9);

    v10 = objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate connectionOptions](self, "connectionOptions"));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate windowScene](self, "windowScene"));

      if (v12)
      {
        _HKInitializeLogging(v13, v14);
        v15 = HKLogActivity;
        if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[seymour] Handling Window Scene", v32, 2u);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate fitnessAppContext](self, "fitnessAppContext"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate windowScene](self, "windowScene"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate connectionOptions](self, "connectionOptions"));
        objc_msgSend(v16, "handleWindowScene:with:", v17, v18);

        -[PhoneSceneDelegate _clearWindowSceneAndOptions](self, "_clearWindowSceneAndOptions");
      }
    }
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate seymourAvailabilityManager](self, "seymourAvailabilityManager"));
    if ((objc_msgSend(v19, "unavailable") & 1) != 0
      && (v20 = objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate connectionOptions](self, "connectionOptions"))) != 0)
    {
      v21 = (void *)v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate windowScene](self, "windowScene"));

      if (v22)
      {
        _HKInitializeLogging(v23, v24);
        v25 = HKLogActivity;
        if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[seymour] Handling Window Scene while unavailable", v31, 2u);
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate fitnessAppContext](self, "fitnessAppContext"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate windowScene](self, "windowScene"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate connectionOptions](self, "connectionOptions"));
        objc_msgSend(v26, "handleWindowScene:with:", v27, v28);

        v23 = -[PhoneSceneDelegate _clearWindowSceneAndOptions](self, "_clearWindowSceneAndOptions");
      }
    }
    else
    {

    }
    _HKInitializeLogging(v23, v24);
    v29 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[seymour] Resetting navigation controller", v30, 2u);
    }
    -[PhoneSceneDelegate setSeymourNavController:](self, "setSeymourNavController:", 0);
  }
}

- (CHFitnessAppContext)fitnessAppContext
{
  return self->_fitnessAppContext;
}

- (UISceneConnectionOptions)connectionOptions
{
  return self->_connectionOptions;
}

- (void)_setupTabBarViewControllersAndOrbActions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t v18[16];
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
  v19 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate seymourNavController](self, "seymourNavController"));
  if (v5)
  {
    _HKInitializeLogging(v6, v7);
    v8 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[seymour] Adding navigation controller to tab bar", v18, 2u);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate seymourNavController](self, "seymourNavController"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObject:", v9));

    v11 = FIUITabBarFitnessPlusAccessibilityIdentifier;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate seymourNavController](self, "seymourNavController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tabBarItem"));
    objc_msgSend(v13, "setAccessibilityIdentifier:", v11);

    v4 = (void *)v10;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activitySharingViewController](self, "activitySharingViewController"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activitySharingViewController](self, "activitySharingViewController"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObject:", v15));

    v4 = (void *)v16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate tabBarController](self, "tabBarController"));
  objc_msgSend(v17, "setViewControllers:", v4);

  -[PhoneSceneDelegate _createOrbActions](self, "_createOrbActions");
  -[PhoneSceneDelegate _setupDeeplinks](self, "_setupDeeplinks");

}

- (UIViewController)activitySharingViewController
{
  return self->_activitySharingViewController;
}

- (UIViewController)seymourNavController
{
  return self->_seymourNavController;
}

- (void)_createOrbActions
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;

  v28 = objc_alloc_init((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate trendsAvailabilityManager](self, "trendsAvailabilityManager"));
  if (objc_msgSend(v3, "trendsAvailability") != (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate trendsAvailabilityManager](self, "trendsAvailabilityManager"));
    v5 = objc_msgSend(v4, "trendsAvailability");

    if (!v5)
      goto LABEL_5;
    v6 = objc_alloc((Class)UIApplicationShortcutItem);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ORB_TRENDS_ACTION"), &stru_1007AE1D0, CFSTR("Localizable")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithSystemImageName:](UIApplicationShortcutIcon, "iconWithSystemImageName:", CFSTR("chevron.up.circle")));
    v9 = objc_msgSend(v6, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.Fitness.opentrendsshortcut"), v7, 0, v8, 0);
    objc_msgSend(v28, "addObject:", v9);

  }
LABEL_5:
  if (-[PhoneSceneDelegate hasCurrentWorkouts](self, "hasCurrentWorkouts"))
  {
    v10 = objc_msgSend(objc_alloc((Class)SBSApplicationShortcutSystemPrivateIcon), "initWithSystemImageName:", CFSTR("figure.run"));
    v11 = objc_alloc((Class)UIApplicationShortcutItem);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ORB_HISTORY_ACTION"), &stru_1007AE1D0, CFSTR("Localizable")));
    v14 = objc_msgSend(objc_alloc((Class)UIApplicationShortcutIcon), "initWithSBSApplicationShortcutIcon:", v10);
    v15 = objc_msgSend(v11, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.Fitness.openhistorylistshortcut"), v13, 0, v14, 0);
    objc_msgSend(v28, "addObject:", v15);

  }
  v16 = objc_msgSend(objc_alloc((Class)SBSApplicationShortcutSystemPrivateIcon), "initWithSystemImageName:", CFSTR("person.2"));
  v17 = objc_alloc((Class)UIApplicationShortcutItem);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ORB_SHARING_ACTION"), &stru_1007AE1D0, CFSTR("Localizable")));
  v20 = objc_msgSend(objc_alloc((Class)UIApplicationShortcutIcon), "initWithSBSApplicationShortcutIcon:", v16);
  v21 = objc_msgSend(v17, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.Fitness.opensocialshortcut"), v19, 0, v20, 0);
  objc_msgSend(v28, "addObject:", v21);

  v22 = objc_alloc((Class)UIApplicationShortcutItem);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("ORB_SEND_RINGS_ACTION"), &stru_1007AE1D0, CFSTR("Localizable")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithSystemImageName:](UIApplicationShortcutIcon, "iconWithSystemImageName:", CFSTR("square.and.arrow.up")));
  v26 = objc_msgSend(v22, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.Fitness.sharetodayactivityshortcut"), v24, 0, v25, 0);
  objc_msgSend(v28, "addObject:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v27, "setShortcutItems:", v28);

}

- (_TtC10FitnessApp25TrendsAvailabilityManager)trendsAvailabilityManager
{
  return self->_trendsAvailabilityManager;
}

- (CHWorkoutFormattingManager)workoutFormattingManager
{
  return self->_workoutFormattingManager;
}

- (_HKWheelchairUseCharacteristicCache)wheelchairUseCache
{
  return self->_wheelchairUseCache;
}

- (_TtC10FitnessApp26SeymourAvailabilityManager)seymourAvailabilityManager
{
  return self->_seymourAvailabilityManager;
}

- (void)setWorkoutFormattingManager:(id)a3
{
  objc_storeStrong((id *)&self->_workoutFormattingManager, a3);
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void)setWheelchairUseCache:(id)a3
{
  objc_storeStrong((id *)&self->_wheelchairUseCache, a3);
}

- (void)setTabBarController:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarController, a3);
}

- (void)setSeymourNavController:(id)a3
{
  objc_storeStrong((id *)&self->_seymourNavController, a3);
}

- (void)setSeymourAvailabilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_seymourAvailabilityManager, a3);
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (void)setOnboardingCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingCoordinator, a3);
}

- (void)setNavigationTracker:(id)a3
{
  objc_storeStrong((id *)&self->_navigationTracker, a3);
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (void)setFriendManager:(id)a3
{
  objc_storeStrong((id *)&self->_friendManager, a3);
}

- (void)setFitnessUIFormattingManager:(id)a3
{
  objc_storeStrong((id *)&self->_fitnessUIFormattingManager, a3);
}

- (void)setConnectionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_connectionOptions, a3);
}

- (void)setActivityTileViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activityTileViewController, a3);
}

- (void)setActivityTileNavController:(id)a3
{
  objc_storeStrong((id *)&self->_activityTileNavController, a3);
}

- (void)setActivitySharingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activitySharingViewController, a3);
}

- (CHRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (CHOnboardingCoordinator)onboardingCoordinator
{
  return self->_onboardingCoordinator;
}

- (FIUIModel)model
{
  return self->_model;
}

- (BOOL)isMirroringSessionActive
{
  return self->_mirrorViewController != 0;
}

- (CHHistoryDataProvider)historyDataProvider
{
  return self->_historyDataProvider;
}

- (BOOL)hasCurrentWorkouts
{
  return self->_hasCurrentWorkouts;
}

- (ASFriendListSectionManager)friendListManager
{
  return self->_friendListManager;
}

- (FIUIFormattingManager)fitnessUIFormattingManager
{
  return self->_fitnessUIFormattingManager;
}

- (AAUIBadgeImageFactory)badgeImageFactory
{
  return self->_badgeImageFactory;
}

- (CHFitnessAppBadgeAggregator)appBadgeAggregator
{
  return self->_appBadgeAggregator;
}

- (BOOL)activityHasBeenSetup
{
  return (id)-[CHOnboardingCoordinator currentPhase](self->_onboardingCoordinator, "currentPhase") == (id)5;
}

- (_TtC10FitnessApp20ActivityDataProvider)activityDataProvider
{
  return self->_activityDataProvider;
}

- (AAUIAchievementsDataProvider)achievementsDataProvider
{
  return self->_achievementsDataProvider;
}

- (ACHAchievementLocalizationProvider)achievementLocalizationProvider
{
  return self->_achievementLocalizationProvider;
}

- (void)_showCoachingDataCollectionMessageIfNeeded
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  if (+[_HKBehavior isAppleInternalInstall](_HKBehavior, "isAppleInternalInstall")
    && (+[UIApplication isRunningInStoreDemoMode](UIApplication, "isRunningInStoreDemoMode") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate _fitnessDataCollectionEnabledPreference](self, "_fitnessDataCollectionEnabledPreference"));
    _HKInitializeLogging(v3, v4);
    v5 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEBUG))
    {
      sub_1005F2E5C((uint64_t)v3, v5);
      if (v3)
        goto LABEL_6;
    }
    else if (v3)
    {
LABEL_6:

      return;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Apple Activity Data"), CFSTR("[Internal only] Do you want to help the Motion and Health teams by sending Apple your workouts, activity, and physical details to help improve health and fitness features? Your Apple email address may be associated with your data. You can learn more in Activity internal settings."), 1));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000C1458;
    v11[3] = &unk_100778E60;
    v11[4] = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Don't Send"), 1, v11));
    objc_msgSend(v6, "addAction:", v7);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C1464;
    v10[3] = &unk_100778E60;
    v10[4] = self;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Send"), 0, v10));
    objc_msgSend(v6, "addAction:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
    objc_msgSend(v9, "presentViewController:animated:completion:", v6, 1, 0);

    goto LABEL_6;
  }
}

- (int64_t)_parseFitnessCoachingNotificationType:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t isKindOfClass;
  uint64_t v7;
  id v8;

  if (!a3)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", FCCNotificationTypeUserInfoKey));
  v5 = objc_opt_class(NSNumber, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);
  if ((isKindOfClass & 1) != 0)
  {
    v8 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    _HKInitializeLogging(isKindOfClass, v7);
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR))
      sub_1005F3048();
    v8 = 0;
  }

  return (int64_t)v8;
}

- (void)memoryWarningReceived:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate badgeImageFactory](self, "badgeImageFactory", a3));
  objc_msgSend(v3, "clearAllCachedImages");

}

- (void)_setupOnboarding
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  v3 = -[SeymourAvailabilityManager stateKnown](self->_seymourAvailabilityManager, "stateKnown");
  if (!v3)
  {
    _HKInitializeLogging(v3, v4);
    v5 = HKLogActivity;
    if (!os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v6 = "Waiting to show onboarding until initial queries complete";
    goto LABEL_7;
  }
  if (self->_presentingOnboarding)
  {
    _HKInitializeLogging(v3, v4);
    v5 = HKLogActivity;
    if (!os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v6 = "Already presenting onboarding";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    return;
  }
  self->_presentingOnboarding = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BECB0;
  v8[3] = &unk_10077A2C0;
  v8[4] = self;
  objc_msgSend(v7, "getNotificationSettingsWithCompletionHandler:", v8);

}

- (void)_presentWelcomeViewsSetupOnboarding:(BOOL)a3
{
  CHOnboardingNavigationController *v5;
  _QWORD *v6;
  _BOOL8 v7;
  _QWORD *v8;
  _QWORD *v9;
  CHASActivitySetupMetricsCollectionViewController *v10;
  CHWelcomeViewController *v11;
  CHOnboardingNavigationController *v12;
  CHASActivitySetupMetricsCollectionViewController *v13;
  _QWORD *v14;
  CHWelcomeViewController *v15;
  void *v16;
  _QWORD v17[4];
  CHOnboardingNavigationController *v18;
  CHASActivitySetupMetricsCollectionViewController *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  BOOL v25;
  BOOL v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id from;
  id location;
  CHWelcomeViewController *v32;

  objc_initWeak(&location, self);
  v5 = objc_alloc_init(CHOnboardingNavigationController);
  objc_initWeak(&from, v5);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000BF0FC;
  v27[3] = &unk_100779F80;
  objc_copyWeak(&v28, &location);
  objc_copyWeak(&v29, &from);
  v6 = objc_retainBlock(v27);
  v7 = -[SeymourAvailabilityManager available](self->_seymourAvailabilityManager, "available");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000BF1C4;
  v22[3] = &unk_10077A2E8;
  v25 = a3;
  v26 = v7;
  v8 = v6;
  v23 = v8;
  objc_copyWeak(&v24, &from);
  v9 = objc_retainBlock(v22);
  -[CHOnboardingNavigationController setBuddyControllerDoneAction:](v5, "setBuddyControllerDoneAction:", v9);
  v10 = -[CHASActivitySetupMetricsCollectionViewController initWithPresentationContext:pregnancyStateProvider:]([CHASActivitySetupMetricsCollectionViewController alloc], "initWithPresentationContext:pregnancyStateProvider:", 1, self->_pregnancyStateProvider);
  -[CHASActivitySetupMetricsCollectionViewController setDelegate:](v10, "setDelegate:", v5);
  v11 = [CHWelcomeViewController alloc];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000BF2A4;
  v17[3] = &unk_10077A310;
  objc_copyWeak(&v21, &location);
  v12 = v5;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  v15 = -[CHWelcomeViewController initWithFitnessPlusAvailable:buttonHandler:](v11, "initWithFitnessPlusAvailable:buttonHandler:", v7, v17);
  v32 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
  -[CHOnboardingNavigationController setViewControllers:animated:](v12, "setViewControllers:animated:", v16, 0);

  -[PhoneSceneDelegate _presentOnboardingNavigationController:](self, "_presentOnboardingNavigationController:", v12);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

- (void)_presentOnboardingNavigationController:(id)a3
{
  id v4;
  CHOnboardingNavigationController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CHLoadingView *v12;
  void *v13;
  CHLoadingView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  v5 = objc_alloc_init(CHOnboardingNavigationController);
  -[PhoneSceneDelegate setSetupNavigationController:](self, "setSetupNavigationController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate window](self, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate setupNavigationController](self, "setupNavigationController"));
  objc_msgSend(v6, "setRootViewController:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate window](self, "window"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors keyColors](ARUIMetricColors, "keyColors"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nonGradientTextColor"));
  objc_msgSend(v8, "setTintColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate window](self, "window"));
  objc_msgSend(v11, "makeKeyAndVisible");

  v12 = [CHLoadingView alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate window](self, "window"));
  objc_msgSend(v13, "frame");
  v14 = -[CHLoadingView initWithFrame:](v12, "initWithFrame:");
  -[PhoneSceneDelegate setLoadingView:](self, "setLoadingView:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate window](self, "window"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate loadingView](self, "loadingView"));
  objc_msgSend(v15, "addSubview:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate loadingView](self, "loadingView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "indicatorView"));
  objc_msgSend(v18, "startAnimating");

  objc_msgSend(v4, "setNavigationBarHidden:animated:", 1, 0);
  objc_msgSend(v4, "setModalPresentationStyle:", 0);
  v19 = (id)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate setupNavigationController](self, "setupNavigationController"));
  objc_msgSend(v19, "presentViewController:animated:completion:", v4, 0, 0);

}

- (void)_presentMoveGoalSetupOnboarding
{
  CHOnboardingNavigationController *v3;
  CHASActivitySetupMetricsCollectionViewController *v4;

  v4 = -[CHASActivitySetupMetricsCollectionViewController initWithPresentationContext:pregnancyStateProvider:]([CHASActivitySetupMetricsCollectionViewController alloc], "initWithPresentationContext:pregnancyStateProvider:", 1, self->_pregnancyStateProvider);
  v3 = -[CHOnboardingNavigationController initWithRootViewController:]([CHOnboardingNavigationController alloc], "initWithRootViewController:", v4);
  -[PhoneSceneDelegate _presentOnboardingNavigationController:](self, "_presentOnboardingNavigationController:", v3);

}

- (void)_presentExerciseAndStandGoalsSetupOnboarding
{
  CHOnboardingNavigationController *v3;
  CHASActivitySetupThreeRingsOnboardingViewController *v4;

  v4 = -[CHASActivitySetupThreeRingsOnboardingViewController initWithPresentationContext:]([CHASActivitySetupThreeRingsOnboardingViewController alloc], "initWithPresentationContext:", 2);
  v3 = -[CHOnboardingNavigationController initWithRootViewController:]([CHOnboardingNavigationController alloc], "initWithRootViewController:", v4);
  -[PhoneSceneDelegate _presentOnboardingNavigationController:](self, "_presentOnboardingNavigationController:", v3);

}

- (void)_presentWhatsNewViewSetupOnboarding
{
  _BOOL8 v3;
  CHWhatsNewViewController *v4;
  CHWhatsNewViewController *v5;
  CHOnboardingNavigationController *v6;
  CHOnboardingNavigationController *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v3 = -[SeymourAvailabilityManager available](self->_seymourAvailabilityManager, "available");
  objc_initWeak(&location, self);
  v4 = [CHWhatsNewViewController alloc];
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1000BF71C;
  v11 = &unk_100777C80;
  objc_copyWeak(&v12, &location);
  v5 = -[CHWhatsNewViewController initWithFitnessPlusAvailable:buttonHandler:](v4, "initWithFitnessPlusAvailable:buttonHandler:", v3, &v8);
  v6 = [CHOnboardingNavigationController alloc];
  v7 = -[CHOnboardingNavigationController initWithRootViewController:](v6, "initWithRootViewController:", v5, v8, v9, v10, v11);
  -[PhoneSceneDelegate _presentOnboardingNavigationController:](self, "_presentOnboardingNavigationController:", v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];

  v5 = a4;
  v6 = -[PhoneSceneDelegate isMirroringSessionActive](self, "isMirroringSessionActive");
  if (v6)
  {
    _HKInitializeLogging(v6, v7);
    v8 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Intercepting URL contexts because a Mirrored workout is running", buf, 2u);
    }
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          -[PhoneSceneDelegate openURLContext:](self, "openURLContext:", v14, (_QWORD)v15);
          -[CHFitnessAppContext openURLContext:](self->_fitnessAppContext, "openURLContext:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v11);
    }

  }
}

- (void)openURLContext:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint8_t v22[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "URL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("activitytoday"));

  if (v6)
  {
    -[PhoneSceneDelegate _handleTodayShortcut](self, "_handleTodayShortcut");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
    v8 = objc_msgSend(v7, "isEqualToString:", kASActivitySharingScheme);

    if (v8)
    {
      -[PhoneSceneDelegate _handleActivitySharingURL:](self, "_handleActivitySharingURL:", v4);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("fitness-badging"));

      if (v10)
      {
        _HKInitializeLogging(v11, v12);
        v13 = HKLogActivity;
        if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Refreshing badge count for URL launch", v22, 2u);
        }
        -[PhoneSceneDelegate _refreshBadgeCounts](self, "_refreshBadgeCounts");
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("fitnessapp-settings"));

        if (v15)
        {
          -[PhoneSceneDelegate _handleSettingsShortcut](self, "_handleSettingsShortcut");
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
          if ((objc_msgSend(v16, "isEqualToString:", CFSTR("file")) & 1) != 0)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));
            v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("workout"));

            if (v18)
            {
              -[PhoneSceneDelegate _handleWorkoutConfigurationURL:](self, "_handleWorkoutConfigurationURL:", v4);
              goto LABEL_17;
            }
          }
          else
          {

          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[CHNavigator scheme](CHNavigator, "scheme"));
          v21 = objc_msgSend(v19, "isEqualToString:", v20);

          if (v21)
            -[CHNavigator navigateToURL:](self->_deeplinkNavigator, "navigateToURL:", v4);
        }
      }
    }
  }
LABEL_17:

}

- (void)sceneWillResignActive:(id)a3
{
  void *v4;
  UIViewController *v5;
  UIViewController *seymourNavController;
  CHFitnessAppContext *fitnessAppContext;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDataProvider](self, "activityDataProvider", a3));
  objc_msgSend(v4, "updateWidgets");

  v5 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[CHTabBarController selectedViewController](self->_tabBarController, "selectedViewController"));
  seymourNavController = self->_seymourNavController;

  fitnessAppContext = self->_fitnessAppContext;
  if (v5 == seymourNavController)
    -[CHFitnessAppContext seymourAppWillResignActive](fitnessAppContext, "seymourAppWillResignActive");
  else
    -[CHFitnessAppContext flushMetricEvents](fitnessAppContext, "flushMetricEvents");
  -[PhoneSceneDelegate updateTVDiscovery](self, "updateTVDiscovery");
}

- (void)sceneDidEnterBackground:(id)a3
{
  -[PhoneSceneDelegate updateTVDiscovery](self, "updateTVDiscovery", a3);
}

- (void)sceneWillEnterForeground:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "summaryCoordinator"));
  objc_msgSend(v3, "logCardConfigurationAnalytics");

}

- (void)sceneDidDisconnect:(id)a3
{
  UIViewController *v4;
  UIViewController *seymourNavController;
  CHFitnessAppContext *fitnessAppContext;

  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue(-[CHTabBarController selectedViewController](self->_tabBarController, "selectedViewController", a3));
  seymourNavController = self->_seymourNavController;

  fitnessAppContext = self->_fitnessAppContext;
  if (v4 == seymourNavController)
    -[CHFitnessAppContext seymourAppWillTerminate](fitnessAppContext, "seymourAppWillTerminate");
  else
    -[CHFitnessAppContext flushMetricEvents](fitnessAppContext, "flushMetricEvents");
  -[PhoneSceneDelegate endDiscovery](self, "endDiscovery");
}

- (void)endDiscovery
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate tvConnectionManager](self, "tvConnectionManager"));
  objc_msgSend(v3, "setIsDiscoveryAllowed:", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate tvConnectionManager](self, "tvConnectionManager"));
  objc_msgSend(v4, "endDiscovery");

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  _BOOL8 v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[4];
  void (**v13)(id, _QWORD);
  uint8_t buf[16];

  v7 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  v9 = -[PhoneSceneDelegate isMirroringSessionActive](self, "isMirroringSessionActive");
  if (v9)
  {
    _HKInitializeLogging(v9, v10);
    v11 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Intercepting shortcut because a Mirrored workout is running", buf, 2u);
    }
    v8[2](v8, 0);
  }
  else
  {
    -[PhoneSceneDelegate _handleShortcutItem:didJustLaunch:](self, "_handleShortcutItem:didJustLaunch:", v7, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BFE3C;
    block[3] = &unk_1007799E8;
    v13 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)_resetToViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate tabBarController](self, "tabBarController"));
  objc_msgSend(v6, "setSelectedViewController:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
  objc_msgSend(v7, "detachPalette");

  v9 = (id)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
  v8 = objc_msgSend(v9, "popToRootViewControllerAnimated:", 0);

}

- (id)summaryDeeplinkViewController
{
  void *v3;

  if (sub_1000D3E9C())
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileViewController](self, "activityTileViewController"));
  return v3;
}

- (void)_setupDeeplinks
{
  CHNavigator *deeplinkNavigator;
  CHNavigator *v4;
  CHNavigator *v5;
  CHNavigator *v6;
  CHNavigator *v7;
  CHNavigator *v8;
  CHNavigator *v9;
  CHNavigator *v10;
  CHNavigator *v11;
  CHNavigator *v12;
  CHNavigator *v13;
  CHNavigator *v14;
  CHNavigator *v15;
  CHNavigator *v16;
  CHNavigator *v17;
  CHNavigator *v18;
  CHNavigator *v19;
  CHNavigator *v20;
  CHNavigator *v21;
  CHNavigator *v22;
  void *v23;
  void *v24;
  id v25;
  CHNavigator *v26;
  CHNavigator *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];

  deeplinkNavigator = self->_deeplinkNavigator;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000C0444;
  v49[3] = &unk_10077A358;
  v49[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](deeplinkNavigator, "registerURLHandlerWithSlug:completion:", CFSTR("activity"), v49);
  v4 = self->_deeplinkNavigator;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1000C044C;
  v48[3] = &unk_10077A358;
  v48[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v4, "registerURLHandlerWithSlug:completion:", CFSTR("activity/:date:"), v48);
  v5 = self->_deeplinkNavigator;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000C0594;
  v47[3] = &unk_10077A358;
  v47[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v5, "registerURLHandlerWithSlug:completion:", CFSTR("activity/goals/(move|exercise|stand)"), v47);
  v6 = self->_deeplinkNavigator;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000C0704;
  v46[3] = &unk_10077A358;
  v46[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v6, "registerURLHandlerWithSlug:completion:", CFSTR("activity/share"), v46);
  v7 = self->_deeplinkNavigator;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000C070C;
  v45[3] = &unk_10077A358;
  v45[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v7, "registerURLHandlerWithSlug:completion:", CFSTR("awards"), v45);
  v8 = self->_deeplinkNavigator;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000C078C;
  v44[3] = &unk_10077A358;
  v44[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v8, "registerURLHandlerWithSlug:completion:", CFSTR("awards/:word:"), v44);
  v9 = self->_deeplinkNavigator;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000C0814;
  v43[3] = &unk_10077A358;
  v43[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v9, "registerURLHandlerWithSlug:completion:", CFSTR("awards/(:word:/:word:)"), v43);
  v10 = self->_deeplinkNavigator;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000C08C4;
  v42[3] = &unk_10077A358;
  v42[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v10, "registerURLHandlerWithSlug:completion:", CFSTR("balance(/.*)?"), v42);
  v11 = self->_deeplinkNavigator;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000C0948;
  v41[3] = &unk_10077A358;
  v41[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v11, "registerURLHandlerWithSlug:completion:", CFSTR("history"), v41);
  v12 = self->_deeplinkNavigator;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000C0950;
  v40[3] = &unk_10077A358;
  v40[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v12, "registerURLHandlerWithSlug:completion:", CFSTR("history/(dives|mindfulness|workouts)"), v40);
  v13 = self->_deeplinkNavigator;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000C0AB8;
  v39[3] = &unk_10077A358;
  v39[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v13, "registerURLHandlerWithSlug:completion:", CFSTR("history/workouts/:id:/(indoor|outdoor)"), v39);
  v14 = self->_deeplinkNavigator;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000C0BC4;
  v38[3] = &unk_10077A358;
  v38[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v14, "registerURLHandlerWithSlug:completion:", CFSTR("history/mindfulness/:uuid:"), v38);
  v15 = self->_deeplinkNavigator;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000C0C64;
  v37[3] = &unk_10077A358;
  v37[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v15, "registerURLHandlerWithSlug:completion:", CFSTR("history/workouts/M?:uuid:"), v37);
  v16 = self->_deeplinkNavigator;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000C0D0C;
  v36[3] = &unk_10077A358;
  v36[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v16, "registerURLHandlerWithSlug:completion:", CFSTR("history/workouts/M?:uuid:/:uuid:"), v36);
  v17 = self->_deeplinkNavigator;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000C0DF8;
  v35[3] = &unk_10077A358;
  v35[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v17, "registerURLHandlerWithSlug:completion:", CFSTR("history/workouts/M?:uuid:/:uuid:/:word:"), v35);
  v18 = self->_deeplinkNavigator;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000C0F04;
  v34[3] = &unk_10077A358;
  v34[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v18, "registerURLHandlerWithSlug:completion:", CFSTR("history/workouts/M?:uuid:/:word:"), v34);
  v19 = self->_deeplinkNavigator;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000C0FD4;
  v33[3] = &unk_10077A358;
  v33[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v19, "registerURLHandlerWithSlug:completion:", CFSTR("settings"), v33);
  v20 = self->_deeplinkNavigator;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000C1040;
  v32[3] = &unk_10077A358;
  v32[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v20, "registerURLHandlerWithSlug:completion:", CFSTR("settings/:word:"), v32);
  v21 = self->_deeplinkNavigator;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000C1130;
  v31[3] = &unk_10077A358;
  v31[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v21, "registerURLHandlerWithSlug:completion:", CFSTR("sharing"), v31);
  v22 = self->_deeplinkNavigator;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000C1138;
  v30[3] = &unk_10077A358;
  v30[4] = self;
  -[CHNavigator registerURLHandlerWithSlug:completion:](v22, "registerURLHandlerWithSlug:completion:", CFSTR("summary/:id:"), v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate trendsAvailabilityManager](self, "trendsAvailabilityManager"));
  if (objc_msgSend(v23, "trendsAvailability") == (id)1)
  {

  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate trendsAvailabilityManager](self, "trendsAvailabilityManager"));
    v25 = objc_msgSend(v24, "trendsAvailability");

    if (v25)
    {
      v26 = self->_deeplinkNavigator;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000C11D4;
      v29[3] = &unk_10077A358;
      v29[4] = self;
      -[CHNavigator registerURLHandlerWithSlug:completion:](v26, "registerURLHandlerWithSlug:completion:", CFSTR("trends"), v29);
      v27 = self->_deeplinkNavigator;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000C11DC;
      v28[3] = &unk_10077A358;
      v28[4] = self;
      -[CHNavigator registerURLHandlerWithSlug:completion:](v27, "registerURLHandlerWithSlug:completion:", CFSTR("trends/:id:"), v28);
    }
  }
}

- (void)_trendsAvailabilityStatusDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate trendsAvailabilityManager](self, "trendsAvailabilityManager", a3));
  if (objc_msgSend(v6, "trendsAvailability"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate trendsAvailabilityManager](self, "trendsAvailabilityManager"));
    v5 = objc_msgSend(v4, "trendsAvailability");

    if (v5 != (id)1)
      -[PhoneSceneDelegate _createOrbActions](self, "_createOrbActions");
  }
  else
  {

  }
}

- (void)_seymourAvailabilityStatusDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  _HKInitializeLogging(self, a2);
  v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[seymour] Seymour availability updated", v6, 2u);
  }
  if ((id)-[CHOnboardingCoordinator currentPhase](self->_onboardingCoordinator, "currentPhase") == (id)5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));

    if (v5)
    {
      -[PhoneSceneDelegate _updateSeymourNavigationController](self, "_updateSeymourNavigationController");
      -[PhoneSceneDelegate _setupTabBarViewControllersAndOrbActions](self, "_setupTabBarViewControllersAndOrbActions");
      -[PhoneSceneDelegate _clearWindowSceneAndOptions](self, "_clearWindowSceneAndOptions");
    }
  }
  else
  {
    -[PhoneSceneDelegate _setupOnboarding](self, "_setupOnboarding");
  }
}

- (void)_clearWindowSceneAndOptions
{
  NSObject *v3;
  uint8_t v4[16];

  _HKInitializeLogging(self, a2);
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[seymour] _clearWindowSceneAndOptions", v4, 2u);
  }
  -[PhoneSceneDelegate setConnectionOptions:](self, "setConnectionOptions:", 0);
  -[PhoneSceneDelegate setWindowScene:](self, "setWindowScene:", 0);
}

- (void)_setFitnessDataCollectionEnabled:(BOOL)a3
{
  const __CFString *v3;
  NSNumber *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = (const __CFString *)FIAppleInternalDataCollectionEnabledKey;
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3);
  v5 = (const __CFString *)FINanoLifestylePreferencesDomain;
  CFPreferencesSetAppValue(v3, v4, FINanoLifestylePreferencesDomain);
  CFPreferencesAppSynchronize(v5);
  v6 = (void *)objc_opt_new(NPSManager);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v3));
  objc_msgSend(v6, "synchronizeUserDefaultsDomain:keys:", v5, v7);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, FIAppleInternalDataCollectionEnabledDidChangeNotification, 0, 0, 1u);
}

- (id)_fitnessDataCollectionEnabledPreference
{
  return (id)(id)CFPreferencesCopyAppValue(FIAppleInternalDataCollectionEnabledKey, FINanoLifestylePreferencesDomain);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v5 = a4;
  v6 = -[PhoneSceneDelegate isMirroringSessionActive](self, "isMirroringSessionActive");
  if (v6)
  {
    _HKInitializeLogging(v6, v7);
    v8 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Intercepting user activity because a Mirrored workout is running", v12, 2u);
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityType"));
    if (objc_msgSend(v9, "isEqualToString:", FIUIActivityContinuityKey))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate tabBarController](self, "tabBarController"));
      objc_msgSend(v10, "setSelectedIndex:", 0);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate fitnessAppContext](self, "fitnessAppContext"));
    objc_msgSend(v11, "continueUserActivity:", v5);

  }
}

- (void)dealloc
{
  int fitnessWeekRedefinedChangeToken;
  int standalonePhoneFitnessModeChangeToken;
  objc_super v5;

  fitnessWeekRedefinedChangeToken = self->_fitnessWeekRedefinedChangeToken;
  if (fitnessWeekRedefinedChangeToken != -1)
    notify_cancel(fitnessWeekRedefinedChangeToken);
  standalonePhoneFitnessModeChangeToken = self->_standalonePhoneFitnessModeChangeToken;
  if (standalonePhoneFitnessModeChangeToken != -1)
    notify_cancel(standalonePhoneFitnessModeChangeToken);
  v5.receiver = self;
  v5.super_class = (Class)PhoneSceneDelegate;
  -[PhoneSceneDelegate dealloc](&v5, "dealloc");
}

- (void)_handleShortcutItem:(id)a3 didJustLaunch:(BOOL)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  id v13;

  v13 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "type"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Fitness.opentrendsshortcut"));

  if (v6)
  {
    -[PhoneSceneDelegate _handleTrendsShortcut](self, "_handleTrendsShortcut");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "type"));
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.Fitness.openhistorylistshortcut"));

    if (v8)
    {
      -[PhoneSceneDelegate _handleHistoryShortcut](self, "_handleHistoryShortcut");
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "type"));
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.Fitness.opensocialshortcut"));

      if (v10)
      {
        -[PhoneSceneDelegate _handleFriendsShortcut](self, "_handleFriendsShortcut");
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "type"));
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.Fitness.sharetodayactivityshortcut"));

        if (v12)
          -[PhoneSceneDelegate _handleActivityShareShortcut](self, "_handleActivityShareShortcut");
      }
    }
  }

}

- (void)_handleTrendsShortcut
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  _HKInitializeLogging(self, a2);
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handling trends shortcut", v6, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
  -[PhoneSceneDelegate _resetToViewController:](self, "_resetToViewController:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate summaryDeeplinkViewController](self, "summaryDeeplinkViewController"));
  objc_msgSend(v5, "showAllTrendsAnimated:", 1);

}

- (void)_handleHistoryShortcut
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  _HKInitializeLogging(self, a2);
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handling history shortcut", v6, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
  -[PhoneSceneDelegate _resetToViewController:](self, "_resetToViewController:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate summaryDeeplinkViewController](self, "summaryDeeplinkViewController"));
  objc_msgSend(v5, "navigateToHistoryAnimated:", 1);

}

- (void)_handleSettingsShortcut
{
  NSObject *v3;
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  _HKInitializeLogging(self, a2);
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handling settings shortcut", buf, 2u);
  }
  v4 = -[PhoneSceneDelegate activityHasBeenSetup](self, "activityHasBeenSetup");
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
    -[PhoneSceneDelegate _resetToViewController:](self, "_resetToViewController:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate summaryDeeplinkViewController](self, "summaryDeeplinkViewController"));
    objc_msgSend(v7, "presentAppSettingsShowingPane:", 2);

  }
  else
  {
    _HKInitializeLogging(v4, v5);
    v8 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Ignoring request to launch to health settings as we have not been set up yet.", v9, 2u);
    }
  }
}

- (void)_handleFriendsShortcut
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t v7[16];

  _HKInitializeLogging(self, a2);
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handling friends shortcut", v7, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activitySharingViewController](self, "activitySharingViewController"));
  -[PhoneSceneDelegate _resetToViewController:](self, "_resetToViewController:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activitySharingViewController](self, "activitySharingViewController"));
  v6 = objc_msgSend(v5, "popToRootViewControllerAnimated:", 0);

}

- (void)_handleActivityShareShortcut
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t v7[16];

  _HKInitializeLogging(self, a2);
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handling activity share shortcut", v7, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
  -[PhoneSceneDelegate _resetToViewController:](self, "_resetToViewController:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate summaryDeeplinkViewController](self, "summaryDeeplinkViewController"));
  v6 = objc_msgSend(v5, "showTodayAndShareImmediately:animated:forGoalCompleteNotification:goalRecommendation:", 1, 0, 0, 0);

}

- (void)_handleTodayShortcut
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t v7[16];

  _HKInitializeLogging(self, a2);
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Opening Today view", v7, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
  -[PhoneSceneDelegate _resetToViewController:](self, "_resetToViewController:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate summaryDeeplinkViewController](self, "summaryDeeplinkViewController"));
  v6 = objc_msgSend(v5, "showTodayAndShareImmediately:animated:forGoalCompleteNotification:goalRecommendation:", 0, 1, 0, 0);

}

- (void)_handleActivitySharingURL:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  _HKInitializeLogging(v4, v5);
  v6 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Handling activity sharing URL: %@", (uint8_t *)&v9, 0xCu);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activitySharingViewController](self, "activitySharingViewController"));
  -[PhoneSceneDelegate _resetToViewController:](self, "_resetToViewController:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activitySharingViewController](self, "activitySharingViewController"));
  objc_msgSend(v8, "handleActivitySharingURL:", v4);

}

- (void)_handleWorkoutConfigurationURL:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;

  v4 = a3;
  _HKInitializeLogging(v4, v5);
  v6 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Handling workout sharing URL: %@", buf, 0xCu);
  }
  v7 = objc_msgSend(v4, "startAccessingSecurityScopedResource");
  v9 = (int)v7;
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging(v7, v8);
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR))
      sub_1005F2F54();
  }
  v17 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v4, 0, &v17));
  v11 = v17;
  v13 = v11;
  if (v11)
  {
    _HKInitializeLogging(v11, v12);
    v14 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR))
      sub_1005F2ED0((uint64_t)v4, (uint64_t)v13, v14);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
    -[PhoneSceneDelegate _resetToViewController:](self, "_resetToViewController:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
    objc_msgSend(v16, "presentWorkoutConfigurationWithData:", v10);

  }
  if (v9)
    objc_msgSend(v4, "stopAccessingSecurityScopedResource");

}

- (BOOL)navigateToSeymourTab
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate seymourNavController](self, "seymourNavController"));

  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate seymourNavController](self, "seymourNavController"));
    -[PhoneSceneDelegate _setSelectedViewController:](self, "_setSelectedViewController:", v6);

  }
  else
  {
    _HKInitializeLogging(v4, v5);
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR))
      sub_1005F2F80();
  }
  return v3 != 0;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  id v26;

  v7 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "categoryIdentifier"));
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.fitcored.guestpairing")) & 1) != 0
    || (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Fitness.WorkoutPlanCreationNotification")) & 1) != 0
    || (objc_msgSend(v10, "isEqualToString:", FCCFitnessPlusPlanNotificationCategoryIdentifier) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", kASBulletinsActivityDataCategoryIdentifier) & 1) != 0
    || (v14 = objc_msgSend(v13, "isEqualToString:", FCCNotificationCategoryIdentifier), (_DWORD)v14)
    && (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo")),
        v17 = -[PhoneSceneDelegate _parseFitnessCoachingNotificationType:](self, "_parseFitnessCoachingNotificationType:", v16), v16, v17 == 2))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate fitnessAppContext](self, "fitnessAppContext"));
    v19 = objc_msgSend(v18, "isSessionViewControllerPresented");

    if (v19)
    {
      _HKInitializeLogging(v20, v21);
      v22 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sending notification to notification center during Fitness+ session", (uint8_t *)&v25, 2u);
      }
      v23 = 8;
    }
    else
    {
      v23 = 27;
    }
    v8[2](v8, v23);
  }
  else
  {
    _HKInitializeLogging(v14, v15);
    v24 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412290;
      v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Incoming notification not allowed to post over foregrounded app: %@", (uint8_t *)&v25, 0xCu);
    }
  }

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  NSObject *v10;
  _BOOL8 v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  _TtC10FitnessApp38SeymourNotificationResponseCoordinator *seymourNotificationResponseCoordinator;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  ASActivitySharingClient *activitySharingClient;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  _QWORD v81[4];
  void (**v82)(_QWORD);
  _QWORD v83[5];
  void (**v84)(_QWORD);
  uint64_t v85;
  void *v86;
  uint8_t buf[4];
  id v88;

  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  _HKInitializeLogging(v8, v9);
  v10 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v88 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Fitness received notification response %{public}@", buf, 0xCu);
  }
  v11 = -[PhoneSceneDelegate isMirroringSessionActive](self, "isMirroringSessionActive");
  if (v11)
  {
    _HKInitializeLogging(v11, v12);
    v13 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "Intercepting notification because a Mirrored workout is running";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!+[AMSUserNotification shouldHandleNotificationResponse:](AMSUserNotification, "shouldHandleNotificationResponse:", v7))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate fitnessAppContext](self, "fitnessAppContext"));
    v17 = objc_msgSend(v16, "isSessionViewControllerPresented");

    if (v17)
    {
      _HKInitializeLogging(v18, v19);
      v13 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v14 = "Preventing navigation for notification while in Fitness+ session";
        goto LABEL_11;
      }
LABEL_12:
      v8[2](v8);
      goto LABEL_13;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notification"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "request"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "content"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "categoryIdentifier"));

    if ((objc_msgSend(v23, "isEqualToString:", kASBulletinsInviteCategoryIdentifier) & 1) != 0
      || (objc_msgSend(v23, "isEqualToString:", kASBulletinsActivityDataCategoryIdentifier) & 1) != 0)
    {
      v80 = 1;
    }
    else
    {
      v80 = objc_msgSend(v23, "isEqualToString:", kASBulletinsGenericCategoryIdentifier);
    }
    v78 = objc_msgSend(v23, "isEqualToString:", FCCNotificationCategoryIdentifier);
    v24 = +[CHMoveModeNotificationResponseCoordinator shouldHandleNotificationCategoryIdentifier:](CHMoveModeNotificationResponseCoordinator, "shouldHandleNotificationCategoryIdentifier:", v23);
    v76 = objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.Fitness.GuestPairingNotification"));
    v74 = objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.Fitness.WorkoutPlanCreationNotification"));
    v73 = objc_msgSend(v23, "isEqualToString:", FCCFitnessPlusPlanNotificationCategoryIdentifier);
    v25 = objc_msgSend(v23, "isEqualToString:", FCCPauseRingsReminderNotificationCategoryIdentifier);
    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionIdentifier"));
      v79 = objc_msgSend(v26, "isEqualToString:", CFSTR("PAUSE_YOUR_RINGS"));

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionIdentifier"));
      v77 = objc_msgSend(v27, "isEqualToString:", CFSTR("EDIT_PAUSE_RINGS"));

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionIdentifier"));
      v75 = objc_msgSend(v28, "isEqualToString:", CFSTR("VIEW_PAUSE_RINGS"));

    }
    else
    {
      v75 = 0;
      v79 = 0;
      v77 = 0;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionIdentifier"));
    if ((objc_msgSend(v29, "isEqualToString:", UNNotificationDefaultActionIdentifier) & 1) != 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notification"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "request"));
      if (v31)
        v32 = v24;
      else
        v32 = 1;

      if ((v32 & 1) == 0)
      {
        _HKInitializeLogging(v33, v34);
        v35 = HKLogActivity;
        v36 = os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT);
        if (v80)
        {
          if (v36)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Handling notification response for default action - activity sharing", buf, 2u);
          }
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activitySharingViewController](self, "activitySharingViewController"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activitySharingViewController](self, "activitySharingViewController"));
          v39 = objc_msgSend(v38, "popToRootViewControllerAnimated:", 0);

          goto LABEL_73;
        }
        if (v78)
        {
          if (v36)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Handling notification response for default action - fitness coaching", buf, 2u);
          }
          -[PhoneSceneDelegate handleFitnessCoachingNotificationResponse:](self, "handleFitnessCoachingNotificationResponse:", v7);
LABEL_47:
          v57 = objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
LABEL_72:
          v37 = (void *)v57;
LABEL_73:
          -[PhoneSceneDelegate _setSelectedViewController:](self, "_setSelectedViewController:", v37);
          v8[2](v8);
LABEL_74:

          goto LABEL_75;
        }
        if (v76)
        {
          if (v36)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Handling notification response for guest pairing action - fitness+", buf, 2u);
          }
          -[NLTVConnectionManager updateDiscoveryStateIfNeeded](self->_tvConnectionManager, "updateDiscoveryStateIfNeeded");
          -[NLTVConnectionManager connectAutomatically](self->_tvConnectionManager, "connectAutomatically");
          v37 = 0;
          goto LABEL_73;
        }
        if (v74)
        {
          if (v36)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Handling notification response for create plan action - fitness+", buf, 2u);
          }
          -[CHFitnessAppContext navigateToWorkoutPlanCreation](self->_fitnessAppContext, "navigateToWorkoutPlanCreation");
        }
        else
        {
          if (!v73)
          {
            if (v36)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Handling notification response for default action - trends", buf, 2u);
            }
            v69 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
            objc_msgSend(v69, "detachPalette");

            v70 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
            v71 = objc_msgSend(v70, "popToRootViewControllerAnimated:", 0);

            v72 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
            objc_msgSend(v72, "showAllTrendsAnimated:", 0);

            goto LABEL_47;
          }
          if (v36)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Handling notification response for plan detail action - fitness+", buf, 2u);
          }
          -[CHFitnessAppContext navigateToWorkoutPlanDetail](self->_fitnessAppContext, "navigateToWorkoutPlanDetail");
        }
        v57 = objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate seymourNavController](self, "seymourNavController"));
        goto LABEL_72;
      }
    }
    else
    {

    }
    if (v80)
    {
      _HKInitializeLogging(v33, v34);
      v40 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Handling notification response for activity sharing", buf, 2u);
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionIdentifier"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notification"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "request"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "content"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "userInfo"));

      objc_opt_class(UNTextInputNotificationResponse, v45);
      if ((objc_opt_isKindOfClass(v7, v46) & 1) != 0)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userText"));
        v85 = kASNotificationReplyKey;
        v86 = v47;
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1));
        v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "hk_dictionaryByAddingEntriesFromDictionary:", v48));

        v44 = (void *)v49;
      }
      v50 = objc_msgSend(objc_alloc((Class)ASUserNotificationResponse), "initWithActionIdentifier:userInfo:", v37, v44);
      activitySharingClient = self->_activitySharingClient;
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_1000C2C68;
      v81[3] = &unk_100779F58;
      v82 = v8;
      -[ASActivitySharingClient handleNotificationResponse:completion:](activitySharingClient, "handleNotificationResponse:completion:", v50, v81);

      goto LABEL_74;
    }
    if (v24)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate healthStore](self, "healthStore"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate fitnessUIFormattingManager](self, "fitnessUIFormattingManager"));
      +[CHMoveModeNotificationResponseCoordinator handleNotificationResponse:presentingNavigationController:healthStore:formattingManager:](CHMoveModeNotificationResponseCoordinator, "handleNotificationResponse:presentingNavigationController:healthStore:formattingManager:", v7, v52, v53, v54);

    }
    if (!v25)
    {
LABEL_54:
      v8[2](v8);
LABEL_75:

      goto LABEL_13;
    }
    if (v79)
    {
      _HKInitializeLogging(v33, v34);
      v55 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v56 = "Presenting day view for notification with pause rings menu";
LABEL_51:
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, v56, buf, 2u);
      }
    }
    else
    {
      if (!v77)
      {
        if (!v75)
          goto LABEL_54;
        _HKInitializeLogging(v33, v34);
        v65 = HKLogActivity;
        if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Presenting day view for notification with just the rings", buf, 2u);
        }
        v66 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
        objc_msgSend(v66, "dismissViewControllerAnimated:completion:", 0, 0);

        v67 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
        v68 = objc_msgSend(v67, "popToRootViewControllerAnimated:", 0);

        v61 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
        v62 = v61;
        v63 = 0;
        goto LABEL_53;
      }
      _HKInitializeLogging(v33, v34);
      v55 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v56 = "Presenting day view for notification with edit pause rings";
        goto LABEL_51;
      }
    }
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
    objc_msgSend(v58, "dismissViewControllerAnimated:completion:", 0, 0);

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
    v60 = objc_msgSend(v59, "popToRootViewControllerAnimated:", 0);

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
    v62 = v61;
    v63 = 1;
LABEL_53:
    v64 = objc_msgSend(v61, "showTodayAndShareImmediately:animated:forGoalCompleteNotification:goalRecommendation:withPauseRingsEditing:", 0, 0, 0, 0, v63);

    goto LABEL_54;
  }
  seymourNotificationResponseCoordinator = self->_seymourNotificationResponseCoordinator;
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_1000C2BCC;
  v83[3] = &unk_100779CB8;
  v83[4] = self;
  v84 = v8;
  -[SeymourNotificationResponseCoordinator handleNotificationResponse:completion:](seymourNotificationResponseCoordinator, "handleNotificationResponse:completion:", v7, v83);

LABEL_13:
}

- (void)handleFitnessCoachingNotificationResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  NSObject *v49;
  uint8_t v50[16];
  uint8_t v51[16];
  uint8_t v52[16];
  uint8_t v53[16];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "notification"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));

  v8 = -[PhoneSceneDelegate _parseFitnessCoachingNotificationType:](self, "_parseFitnessCoachingNotificationType:", v7);
  v10 = v8;
  switch(v8)
  {
    case 1:
      _HKInitializeLogging(v8, v9);
      v11 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Presenting day view for notification", buf, 2u);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
      objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 0, 0);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
      v14 = objc_msgSend(v13, "popToRootViewControllerAnimated:", 0);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
      v16 = v15;
      v17 = 0;
      goto LABEL_11;
    case 2:
      _HKInitializeLogging(v8, v9);
      v18 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v53 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Presenting achievement with celebration for notification", v53, 2u);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate rootViewController](self, "rootViewController"));
      objc_msgSend(v19, "hide");

      v20 = ACHDecodeAchievementFromUserInfoDictionary(v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
      objc_msgSend(v22, "dismissViewControllerAnimated:completion:", 0, 0);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
      v24 = objc_msgSend(v23, "popToRootViewControllerAnimated:", 0);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
      v26 = v25;
      v27 = v21;
      v28 = 1;
      goto LABEL_15;
    case 3:
      _HKInitializeLogging(v8, v9);
      v29 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Presenting goal completion celebration", v51, 2u);
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate rootViewController](self, "rootViewController"));
      objc_msgSend(v30, "hide");

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
      objc_msgSend(v31, "dismissViewControllerAnimated:completion:", 0, 0);

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
      v33 = objc_msgSend(v32, "popToRootViewControllerAnimated:", 0);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
      v16 = v15;
      v17 = 1;
LABEL_11:
      v34 = objc_msgSend(v15, "showTodayAndShareImmediately:animated:forGoalCompleteNotification:goalRecommendation:", 0, 0, v17, 0);

      goto LABEL_21;
    case 4:
      _HKInitializeLogging(v8, v9);
      v35 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Presenting achievement without celebration for notification", v52, 2u);
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate rootViewController](self, "rootViewController"));
      objc_msgSend(v36, "hide");

      v37 = ACHDecodeAchievementFromUserInfoDictionary(v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
      objc_msgSend(v38, "dismissViewControllerAnimated:completion:", 0, 0);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
      v40 = objc_msgSend(v39, "popToRootViewControllerAnimated:", 0);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
      v26 = v25;
      v27 = v21;
      v28 = 0;
LABEL_15:
      v41 = objc_msgSend(v25, "navigateToTrophyCaseAnimated:initialAchievement:shouldShowCelebration:forModalPresentation:", 0, v27, v28, 1);

      goto LABEL_21;
    case 5:
      _HKInitializeLogging(v8, v9);
      v42 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v50 = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Presenting for goal update", v50, 2u);
      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate _parseGoalRecommendation:](self, "_parseGoalRecommendation:", v7));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
      objc_msgSend(v44, "dismissViewControllerAnimated:completion:", 0, 0);

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
      v46 = objc_msgSend(v45, "popToRootViewControllerAnimated:", 0);

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
      v48 = objc_msgSend(v47, "showTodayAndShareImmediately:animated:forGoalCompleteNotification:goalRecommendation:", 0, 0, 0, v43);

      -[PhoneSceneDelegate _clearWeeklyGoalDisplayContext](self, "_clearWeeklyGoalDisplayContext");
      goto LABEL_19;
    default:
LABEL_19:
      _HKInitializeLogging(v8, v9);
      v49 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR))
        sub_1005F2FD8(v10, v49);
LABEL_21:

      return;
  }
}

- (id)_parseGoalRecommendation:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t isKindOfClass;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", FCCNotificationTypeUserInfoGoalRecommendationKey));
    objc_opt_class(NSNumber, v4);
    isKindOfClass = objc_opt_isKindOfClass(v3, v5);
    if ((isKindOfClass & 1) != 0)
    {
      v8 = v3;
    }
    else
    {
      _HKInitializeLogging(isKindOfClass, v7);
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_ERROR))
        sub_1005F3074();
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_clearWeeklyGoalDisplayContext
{
  id v2;

  v2 = objc_alloc_init((Class)FCCWeeklyGoalStore);
  objc_msgSend(v2, "clearContext");

}

- (void)_setSelectedViewController:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = dispatch_time(0, 50000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C334C;
  v7[3] = &unk_100777EE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);

}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[16];

  v5 = -[PhoneSceneDelegate isMirroringSessionActive](self, "isMirroringSessionActive", a3, a4);
  if (v5)
  {
    _HKInitializeLogging(v5, v6);
    v7 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Intercepting Navigation to Settings because a Mirrored workout is running", buf, 2u);
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
    -[PhoneSceneDelegate _resetToViewController:](self, "_resetToViewController:", v8);

    v9 = (id)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
    objc_msgSend(v9, "presentAppSettingsShowingPane:", 1);

  }
}

- (void)_ppt_showSharingTab
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activitySharingViewController](self, "activitySharingViewController"));
  -[PhoneSceneDelegate _resetToViewController:](self, "_resetToViewController:", v3);

}

- (void)presentModelOnSummaryTabWithViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

  if (v6)
  {
    _HKInitializeLogging(v7, v8);
    v9 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Summary tab is already presenting modal view %@, can't present discovery sheet", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
    objc_msgSend(v10, "presentViewController:animated:completion:", v4, 1, 0);

  }
}

- (void)presentBrowsingConsentAlertWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;

  v4 = a3;
  -[PhoneSceneDelegate setBrowsingConsentAlertCompletion:](self, "setBrowsingConsentAlertCompletion:", v4);
  objc_initWeak(&location, self);
  *(_QWORD *)&v6 = objc_opt_class(self, v5).n128_u64[0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v7, v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CONNECT_BUTTON"), &stru_1007AE1D0, CFSTR("Localizable-seymour")));
  *(_QWORD *)&v11 = objc_opt_class(self, v10).n128_u64[0];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v12, v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PHONE_TV_CONSENT"), &stru_1007AE1D0, CFSTR("Localizable-seymour")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, v14, 1));
  -[PhoneSceneDelegate setBrowsingConsentAlertController:](self, "setBrowsingConsentAlertController:", v15);

  *(_QWORD *)&v17 = objc_opt_class(self, v16).n128_u64[0];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v18, v17));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CONTINUE_BUTTON"), &stru_1007AE1D0, CFSTR("Localizable-seymour")));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000C393C;
  v34[3] = &unk_100779E80;
  objc_copyWeak(&v35, &location);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 0, v34));

  *(_QWORD *)&v23 = objc_opt_class(self, v22).n128_u64[0];
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v24, v23));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CANCEL_BUTTON"), &stru_1007AE1D0, CFSTR("Localizable-seymour")));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000C39E4;
  v32[3] = &unk_100779E80;
  objc_copyWeak(&v33, &location);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v26, 1, v32));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate browsingConsentAlertController](self, "browsingConsentAlertController"));
  objc_msgSend(v28, "addAction:", v21);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate browsingConsentAlertController](self, "browsingConsentAlertController"));
  objc_msgSend(v29, "addAction:", v27);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate tabBarController](self, "tabBarController"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate browsingConsentAlertController](self, "browsingConsentAlertController"));
  objc_msgSend(v30, "presentViewController:animated:completion:", v31, 1, 0);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

- (void)cleanupGuestAuthentication
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  void (**v7)(void);
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate browsingConsentAlertCompletion](self, "browsingConsentAlertCompletion"));

  if (v3)
  {
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate browsingConsentAlertCompletion](self, "browsingConsentAlertCompletion"));
    v4[2](v4, 0);

    -[PhoneSceneDelegate setBrowsingConsentAlertCompletion:](self, "setBrowsingConsentAlertCompletion:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate tabBarController](self, "tabBarController"));
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate passwordEnteredHandler](self, "passwordEnteredHandler"));

  if (v6)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate passwordController](self, "passwordController"));
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "passwordEntryCancelledHandler"));
    v7[2]();

  }
}

- (void)promptForPasscodeWithLength:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22[2];
  id location;

  v6 = a4;
  -[PhoneSceneDelegate setPasswordEnteredHandler:](self, "setPasswordEnteredHandler:", v6);
  objc_initWeak(&location, self);
  v7 = objc_alloc((Class)SMUPasswordController);
  *(_QWORD *)&v9 = objc_opt_class(self, v8).n128_u64[0];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v10, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TV_CODE_TITLE"), &stru_1007AE1D0, CFSTR("Localizable-seymour")));
  v13 = objc_msgSend(v7, "initWithTitle:passwordLength:supportedOrientations:", v12, a3, 2);
  -[PhoneSceneDelegate setPasswordController:](self, "setPasswordController:", v13);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000C3D98;
  v21[3] = &unk_10077A380;
  v22[1] = (id)a3;
  objc_copyWeak(v22, &location);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate passwordController](self, "passwordController"));
  objc_msgSend(v14, "setPasswordEnteredHandler:", v21);

  objc_copyWeak(&v20, &location);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate passwordController](self, "passwordController", _NSConcreteStackBlock, 3221225472, sub_1000C3E8C, &unk_100777C80));
  objc_msgSend(v15, "setPasswordEntryCancelledHandler:", &v19);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate tabBarController](self, "tabBarController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate passwordController](self, "passwordController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "viewController"));
  objc_msgSend(v16, "presentViewController:animated:completion:", v18, 1, 0);

  objc_destroyWeak(&v20);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

}

- (void)ringCelebrationDidBegin
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _HKInitializeLogging(self, a2);
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[HistoryPagingViewControllerDelegate] unhidding rootViewController because celebration video did begin", v5, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate rootViewController](self, "rootViewController"));
  objc_msgSend(v4, "unhide");

}

- (void)trophyCaseDidBeginCelebration:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  _HKInitializeLogging(self, a2);
  v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[TrophyCaseViewControllerDelegate] unhidding rootViewController because celebration video did begin", v6, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate rootViewController](self, "rootViewController"));
  objc_msgSend(v5, "unhide");

}

- (void)onboardingCoordinatorPhaseDidChangeTo:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  _BOOL4 presentingOnboarding;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  int64_t v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;

  _HKInitializeLogging(self, a2);
  v5 = (void *)HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
    presentingOnboarding = self->_presentingOnboarding;
    *(_DWORD *)buf = 134218496;
    v14 = a3;
    v15 = 1024;
    v16 = v7 != 0;
    v17 = 1024;
    v18 = presentingOnboarding;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Setup] onboarding coordinator phase did change: %ld, activity app is set up: %d, is presenting onboarding: %d", buf, 0x18u);

  }
  if (a3 == 5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityDashboardViewController](self, "activityDashboardViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewIfLoaded"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));

    if (!v11)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C41FC;
      block[3] = &unk_100777E20;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else if (!self->_presentingOnboarding)
  {
    -[PhoneSceneDelegate _setupOnboarding](self, "_setupOnboarding");
  }
}

- (void)updateWorkoutState:(int64_t)a3 shouldShowTimeout:(BOOL)a4
{
  NSObject *v5;
  WOMirrorViewController *mirrorViewController;
  NSObject *v7;
  WOMirrorViewController *v8;
  void *v9;
  WOMirrorViewController *v10;
  WOMirrorViewController *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[16];

  if (a3)
  {
    if (a4)
    {
      _HKInitializeLogging(self, a2);
      v5 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[dataLink] Showing timeout then bringing down the controller", buf, 2u);
      }
      mirrorViewController = self->_mirrorViewController;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000C4438;
      v16[3] = &unk_100777E20;
      v16[4] = self;
      -[WOMirrorViewController showTimeoutDialogWithDismissCompletion:](mirrorViewController, "showTimeoutDialogWithDismissCompletion:", v16);
    }
    else
    {
      -[PhoneSceneDelegate dismissMirrorViewController](self, "dismissMirrorViewController");
    }
  }
  else
  {
    _HKInitializeLogging(self, a2);
    v7 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[dataLink] We are bringing up our controller", buf, 2u);
    }
    v8 = [WOMirrorViewController alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[WODataLinkMonitor shared](WODataLinkMonitor, "shared"));
    v10 = -[WOMirrorViewController initWithDataLinkMonitor:](v8, "initWithDataLinkMonitor:", v9);
    v11 = self->_mirrorViewController;
    self->_mirrorViewController = v10;

    -[WOMirrorViewController setModalPresentationStyle:](self->_mirrorViewController, "setModalPresentationStyle:", 0);
    v12 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_mirrorViewController);
    objc_msgSend(v12, "setModalPresentationStyle:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationBar"));
    objc_msgSend(v13, "setHidden:", 1);

    objc_msgSend(v12, "setDelegate:", self->_mirrorViewController);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
    -[PhoneSceneDelegate _resetToViewController:](self, "_resetToViewController:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneSceneDelegate activityTileNavController](self, "activityTileNavController"));
    objc_msgSend(v15, "presentViewController:animated:completion:", v12, 1, 0);

  }
}

- (void)displayWorkoutNotification:(id)a3
{
  -[WOMirrorViewController showNotification:](self->_mirrorViewController, "showNotification:", a3);
}

- (void)dismissMirrorViewController
{
  NSObject *v3;
  void *v4;
  WOMirrorViewController *mirrorViewController;
  uint8_t v6[16];

  _HKInitializeLogging(self, a2);
  v3 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[dataLink] Bringing down the controller", v6, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WOMirrorViewController presentedViewController](self->_mirrorViewController, "presentedViewController"));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  -[WOMirrorViewController dismissViewControllerAnimated:completion:](self->_mirrorViewController, "dismissViewControllerAnimated:completion:", 1, 0);
  mirrorViewController = self->_mirrorViewController;
  self->_mirrorViewController = 0;

}

- (_TtC10FitnessApp31ActivityDashboardViewController)activityDashboardViewController
{
  return self->_activityDashboardViewController;
}

- (void)setActivityDashboardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activityDashboardViewController, a3);
}

- (void)setFitnessAppContext:(id)a3
{
  objc_storeStrong((id *)&self->_fitnessAppContext, a3);
}

- (void)setAchievementsDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_achievementsDataProvider, a3);
}

- (void)setBadgeImageFactory:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImageFactory, a3);
}

- (void)setAchievementLocalizationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_achievementLocalizationProvider, a3);
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void)setWorkoutsDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_workoutsDataProvider, a3);
}

- (void)setHistoryDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_historyDataProvider, a3);
}

- (void)setFriendListManager:(id)a3
{
  objc_storeStrong((id *)&self->_friendListManager, a3);
}

- (CHFriendManager)friendManager
{
  return self->_friendManager;
}

- (_TtC10FitnessApp23FriendsSetupCoordinator)friendsSetupCoordinator
{
  return self->_friendsSetupCoordinator;
}

- (void)setFriendsSetupCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_friendsSetupCoordinator, a3);
}

- (ASActivitySharingClient)activitySharingClient
{
  return self->_activitySharingClient;
}

- (void)setActivitySharingClient:(id)a3
{
  objc_storeStrong((id *)&self->_activitySharingClient, a3);
}

- (void)setActivityDateCache:(id)a3
{
  objc_storeStrong((id *)&self->_activityDateCache, a3);
}

- (void)setActivityDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_activityDataProvider, a3);
}

- (CHNavigator)deeplinkNavigator
{
  return self->_deeplinkNavigator;
}

- (void)setDeeplinkNavigator:(id)a3
{
  objc_storeStrong((id *)&self->_deeplinkNavigator, a3);
}

- (_TtC10FitnessApp19BalanceDataProvider)balanceDataProvider
{
  return self->_balanceDataProvider;
}

- (void)setBalanceDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_balanceDataProvider, a3);
}

- (FIPauseRingsCoordinator)pauseRingsCoordinator
{
  return self->_pauseRingsCoordinator;
}

- (void)setPauseRingsCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, a3);
}

- (FIUIPregnancyStateProvider)pregnancyStateProvider
{
  return self->_pregnancyStateProvider;
}

- (void)setPregnancyStateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_pregnancyStateProvider, a3);
}

- (UINavigationController)setupNavigationController
{
  return self->_setupNavigationController;
}

- (void)setSetupNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_setupNavigationController, a3);
}

- (BOOL)presentingOnboarding
{
  return self->_presentingOnboarding;
}

- (void)setPresentingOnboarding:(BOOL)a3
{
  self->_presentingOnboarding = a3;
}

- (_TtC10FitnessApp32SeymourDiscoverySheetCoordinator)seymourDiscoverySheetCoordinator
{
  return self->_seymourDiscoverySheetCoordinator;
}

- (void)setSeymourDiscoverySheetCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_seymourDiscoverySheetCoordinator, a3);
}

- (void)setTrendsAvailabilityManager:(id)a3
{
  objc_storeStrong((id *)&self->_trendsAvailabilityManager, a3);
}

- (_TtC10FitnessApp38SeymourNotificationResponseCoordinator)seymourNotificationResponseCoordinator
{
  return self->_seymourNotificationResponseCoordinator;
}

- (void)setSeymourNotificationResponseCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_seymourNotificationResponseCoordinator, a3);
}

- (void)setAppBadgeAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_appBadgeAggregator, a3);
}

- (CHNavigationTracker)navigationTracker
{
  return self->_navigationTracker;
}

- (CHLoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (UIWindowScene)windowScene
{
  return self->_windowScene;
}

- (void)setWindowScene:(id)a3
{
  objc_storeStrong((id *)&self->_windowScene, a3);
}

- (int)fitnessWeekRedefinedChangeToken
{
  return self->_fitnessWeekRedefinedChangeToken;
}

- (void)setFitnessWeekRedefinedChangeToken:(int)a3
{
  self->_fitnessWeekRedefinedChangeToken = a3;
}

- (int)standalonePhoneFitnessModeChangeToken
{
  return self->_standalonePhoneFitnessModeChangeToken;
}

- (void)setStandalonePhoneFitnessModeChangeToken:(int)a3
{
  self->_standalonePhoneFitnessModeChangeToken = a3;
}

- (id)browsingConsentAlertCompletion
{
  return self->_browsingConsentAlertCompletion;
}

- (void)setBrowsingConsentAlertCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (id)passwordEnteredHandler
{
  return self->_passwordEnteredHandler;
}

- (void)setPasswordEnteredHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (UIAlertController)browsingConsentAlertController
{
  return self->_browsingConsentAlertController;
}

- (void)setBrowsingConsentAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_browsingConsentAlertController, a3);
}

- (SMUPasswordController)passwordController
{
  return self->_passwordController;
}

- (void)setPasswordController:(id)a3
{
  objc_storeStrong((id *)&self->_passwordController, a3);
}

- (WOMirrorViewController)mirrorViewController
{
  return self->_mirrorViewController;
}

- (void)setMirrorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mirrorViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirrorViewController, 0);
  objc_storeStrong((id *)&self->_passwordController, 0);
  objc_storeStrong((id *)&self->_browsingConsentAlertController, 0);
  objc_storeStrong(&self->_passwordEnteredHandler, 0);
  objc_storeStrong(&self->_browsingConsentAlertCompletion, 0);
  objc_storeStrong((id *)&self->_onboardingCoordinator, 0);
  objc_storeStrong((id *)&self->_connectionOptions, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_seymourNavController, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_activityTileNavController, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_navigationTracker, 0);
  objc_storeStrong((id *)&self->_appBadgeAggregator, 0);
  objc_storeStrong((id *)&self->_seymourNotificationResponseCoordinator, 0);
  objc_storeStrong((id *)&self->_seymourAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_trendsAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_seymourDiscoverySheetCoordinator, 0);
  objc_storeStrong((id *)&self->_setupNavigationController, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCache, 0);
  objc_storeStrong((id *)&self->_pregnancyStateProvider, 0);
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
  objc_storeStrong((id *)&self->_balanceDataProvider, 0);
  objc_storeStrong((id *)&self->_deeplinkNavigator, 0);
  objc_storeStrong((id *)&self->_activityDataProvider, 0);
  objc_storeStrong((id *)&self->_activityDateCache, 0);
  objc_storeStrong((id *)&self->_activitySharingClient, 0);
  objc_storeStrong((id *)&self->_friendsSetupCoordinator, 0);
  objc_storeStrong((id *)&self->_friendManager, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);
  objc_storeStrong((id *)&self->_historyDataProvider, 0);
  objc_storeStrong((id *)&self->_workoutsDataProvider, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_workoutFormattingManager, 0);
  objc_storeStrong((id *)&self->_fitnessUIFormattingManager, 0);
  objc_storeStrong((id *)&self->_achievementLocalizationProvider, 0);
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_achievementsDataProvider, 0);
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_activitySharingViewController, 0);
  objc_storeStrong((id *)&self->_activityTileViewController, 0);
  objc_storeStrong((id *)&self->_activityDashboardViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_tvConnectionManager, 0);
}

@end
