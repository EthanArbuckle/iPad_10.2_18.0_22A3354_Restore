@implementation HOBaseController

+ (BOOL)isHomeManagerStatusReady:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "status") & 1) == 0
    && (objc_msgSend(v3, "status") & 0x10) == 0
    && ((unint64_t)objc_msgSend(v3, "status") & 0x20) == 0;

  return v4;
}

- (void)appOnboardingWillFinishForStateController:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = HFLogForCategory(9);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Finished App Onboarding, running Feature Onboarding checks", v6, 2u);
  }

  -[HOBaseController _checkAndRunFeatureOnboardingWithHomeSwitch:](self, "_checkAndRunFeatureOnboardingWithHomeSwitch:", 0);
}

- (void)reloadInitialSetup
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController initialSetupStateController](self, "initialSetupStateController"));
  objc_msgSend(v3, "reloadState");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController initialSetupStateController](self, "initialSetupStateController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "onboardingCompleteFuture"));
  v6 = objc_msgSend(v5, "isFinished");

  if ((v6 & 1) == 0)
  {
    objc_initWeak(&location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController initialSetupStateController](self, "initialSetupStateController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "onboardingCompleteFuture"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100035804;
    v10[3] = &unk_1000B7898;
    objc_copyWeak(&v11, &location);
    v9 = objc_msgSend(v8, "addSuccessBlock:", v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (HOInitialSetupStateController)initialSetupStateController
{
  return self->_initialSetupStateController;
}

- (BOOL)_areHMSettingsValidForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "currentUser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userSettingsForHome:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "settings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootGroup"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "privateSettings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rootGroup"));
    v11 = v10 != 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_checkAndRunFeatureOnboardingWithHomeSwitch:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  NSString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  unsigned int v17;
  const __CFString *v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  NSString *v23;
  void *v24;
  void *v25;
  HOBaseController *v26;
  void *v27;
  id v28;
  uint64_t v29;
  HOBaseController *v30;
  uint8_t buf[4];
  HOBaseController *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;

  v3 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homeManager"));
  v10 = +[HOBaseController isHomeManagerStatusReady:](HOBaseController, "isHomeManagerStatusReady:", v9);

  -[HOBaseController setUserHasValidHMSettings:](self, "setUserHasValidHMSettings:", -[HOBaseController _areHMSettingsValidForHome:](self, "_areHMSettingsValidForHome:", v7));
  v11 = HFLogForCategory(33);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    if (v10)
      v16 = CFSTR("IS");
    else
      v16 = CFSTR("is NOT");
    v17 = -[HOBaseController userHasValidHMSettings](self, "userHasValidHMSettings");
    *(_DWORD *)buf = 138413314;
    v18 = CFSTR("DOES NOT have");
    v32 = self;
    v33 = 2112;
    if (v17)
      v18 = CFSTR("has");
    v34 = v14;
    v35 = 2112;
    v36 = v15;
    v37 = 2112;
    v38 = v16;
    v39 = 2112;
    v40 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ for %@, Home Manager %@ ready, user %@ valid settings", buf, 0x34u);

  }
  v19 = -[HOBaseController userHasValidHMSettings](self, "userHasValidHMSettings") & v10;
  v20 = HFLogForCategory(33);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v19 == 1)
  {
    if (v22)
    {
      v23 = NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
      *(_DWORD *)buf = 138412802;
      v32 = self;
      v33 = 2112;
      v34 = v24;
      v35 = 2112;
      v36 = v25;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@:%@ Running Feature Onboarding with Switch Homes screen: %@", buf, 0x20u);

    }
    v21 = objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
    v26 = (HOBaseController *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3, OnboardingDisplayOption_ShowSwitchHomeScreen));
    v30 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v28 = +[HUHomeFeatureOnboardingUtilities home:onboardAllFeaturesFromPresentingViewController:usageOptions:](HUHomeFeatureOnboardingUtilities, "home:onboardAllFeaturesFromPresentingViewController:usageOptions:", v7, v21, v27);

    goto LABEL_14;
  }
  if (v22)
  {
    v26 = (HOBaseController *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    *(_DWORD *)buf = 138412290;
    v32 = v26;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Did not run Feature Onboarding with Switch Homes screen: %@", buf, 0xCu);
LABEL_14:

  }
}

- (BOOL)userHasValidHMSettings
{
  return self->_userHasValidHMSettings;
}

- (HOBaseController)initWithRootController:(id)a3
{
  id v4;
  HOBaseController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *triggersPendingExecutionConfirmation;
  HOInitialSetupStateController *v13;
  HOInitialSetupStateController *initialSetupStateController;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HOBaseController;
  v5 = -[HOBaseController init](&v16, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "applicationWillEnterForeground", UIApplicationWillEnterForegroundNotification, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance"));
    objc_msgSend(v7, "addObserver:", v5);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v8, "addHomeObserver:", v5);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v9, "addHomeKitSettingsObserver:", v5);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    objc_msgSend(v10, "addHomeManagerObserver:", v5);

    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    triggersPendingExecutionConfirmation = v5->_triggersPendingExecutionConfirmation;
    v5->_triggersPendingExecutionConfirmation = v11;

    v13 = -[HOInitialSetupStateController initWithDelegate:]([HOInitialSetupStateController alloc], "initWithDelegate:", v5);
    initialSetupStateController = v5->_initialSetupStateController;
    v5->_initialSetupStateController = v13;

    objc_storeWeak((id *)&v5->_rootViewController, v4);
  }

  return v5;
}

- (void)setUserHasValidHMSettings:(BOOL)a3
{
  self->_userHasValidHMSettings = a3;
}

- (id)loadLoadingViewController
{
  HOMainLoadingViewController *v3;
  id v4;

  v3 = objc_alloc_init(HOMainLoadingViewController);
  v4 = -[HOBaseController _populateWallpaperForLoadingViewController:](self, "_populateWallpaperForLoadingViewController:", v3);
  return v3;
}

- (id)_populateWallpaperForLoadingViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultWallpaperForCollectionType:", 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wallpaperView"));
  objc_msgSend(v6, "populateWallpaper:withAnimation:onlyIfNeeded:", v5, 1, 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  return v7;
}

- (id)presentConfirmationAlertForExecutingTriggerWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController triggersPendingExecutionConfirmation](self, "triggersPendingExecutionConfirmation"));
  objc_msgSend(v5, "addObject:", v4);

  -[HOBaseController _presentLocationTriggerAlertsIfNeeded](self, "_presentLocationTriggerAlertsIfNeeded");
  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

- (void)_presentLocationTriggerAlertsIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController triggersPendingExecutionConfirmation](self, "triggersPendingExecutionConfirmation"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController triggersPendingExecutionConfirmation](self, "triggersPendingExecutionConfirmation", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          -[HOBaseController _presentLocationAlertForTriggerWithIdentifier:](self, "_presentLocationAlertForTriggerWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9));
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController triggersPendingExecutionConfirmation](self, "triggersPendingExecutionConfirmation"));
    objc_msgSend(v10, "removeAllObjects");

  }
}

- (void)_presentLocationAlertForTriggerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HOBaseController *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100035B08;
  v8[3] = &unk_1000B78E8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  objc_msgSend(v6, "fetchTriggerNameForTriggerIdentifier:completionHandler:", v7, v8);

}

- (void)_userDidConfirmExection:(BOOL)a3 ofTriggerWithIdentifier:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100035E90;
  v10[3] = &unk_1000B5C88;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v7, "userDidConfirmExecution:ofTriggerWithIdentifier:completionHandler:", v4, v8, v10);

}

- (void)showOnboardingIfNeededForHomeInvitation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HOBaseController initialSetupStateController](self, "initialSetupStateController"));
  objc_msgSend(v5, "showOnboardingIfNeededForHomeInvitation:", v4);

}

- (id)onboardingPresentationFuture
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController initialSetupStateController](self, "initialSetupStateController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "onboardingCompleteFuture"));

  return v3;
}

- (id)stateController:(id)a3 presentViewController:(id)a4 forState:(unint64_t)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;

  v6 = a4;
  v7 = objc_opt_class(HOMainLoadingViewController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentViewController"));
  if ((objc_opt_isKindOfClass(v9, v7) & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = -[HOBaseController _populateWallpaperForLoadingViewController:](self, "_populateWallpaperForLoadingViewController:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
    v14 = objc_msgSend((id)objc_opt_class(v13), "instancesRespondToSelector:", "didLoadLoadingViewController");

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
      objc_msgSend(v15, "didLoadLoadingViewController");

    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "presentedViewController"));

  if (v18)
  {
    v19 = HFLogForCategory(9);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presentedViewController"));
      *(_DWORD *)buf = 138412546;
      v31 = v22;
      v32 = 2112;
      v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Dismissing unexpected presented VC %@ in preparation of presenting initial setup VC %@", buf, 0x16u);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "hu_dismissViewControllerAnimated:", 1));

    v16 = (void *)v24;
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000361E4;
  v28[3] = &unk_1000B7910;
  v28[4] = self;
  v29 = v6;
  v25 = v6;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "flatMap:", v28));

  return v26;
}

- (id)stateController:(id)a3 dismissViewController:(id)a4 forState:(unint64_t)a5
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController", a3, a4, a5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hu_dismissViewControllerAnimated:", 1));

  return v6;
}

- (id)currentlyPresentedViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));

  return v3;
}

- (void)executionEnvironmentWillEnterForeground:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = HFLogForCategory(33);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "App entering foreground, running Feature Onboarding checks", v6, 2u);
  }

  -[HOBaseController _checkAndRunFeatureOnboardingWithHomeSwitch:](self, "_checkAndRunFeatureOnboardingWithHomeSwitch:", 0);
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a4;
  v6 = HFLogForCategory(33);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Accessory added (%@), running Feature Onboarding checks", (uint8_t *)&v8, 0xCu);
  }

  -[HOBaseController _checkAndRunFeatureOnboardingWithHomeSwitch:](self, "_checkAndRunFeatureOnboardingWithHomeSwitch:", 0);
}

- (void)settingsDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));

  if (-[HOBaseController userHasValidHMSettings](self, "userHasValidHMSettings")
    || !-[HOBaseController _areHMSettingsValidForHome:](self, "_areHMSettingsValidForHome:", v6))
  {
    v9 = HFLogForCategory(33);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_100078698(self, (uint64_t)v6, v10);

  }
  else
  {
    v7 = HFLogForCategory(33);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User transitioned from no settings to valid settings (%@), now running Feature Onboarding checks", (uint8_t *)&v11, 0xCu);
    }

    -[HOBaseController setUserHasValidHMSettings:](self, "setUserHasValidHMSettings:", 1);
    -[HOBaseController _checkAndRunFeatureOnboardingWithHomeSwitch:](self, "_checkAndRunFeatureOnboardingWithHomeSwitch:", 0);
  }

}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  id v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  HOBaseController *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  HOMainLoadingViewController *v22;
  void *v23;
  HOMainLoadingViewController *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  HOBaseController *v28;
  HOMainLoadingViewController *v29;
  uint8_t buf[4];
  HOBaseController *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  unsigned int v39;

  v8 = a3;
  v9 = a5;
  v10 = -[HOBaseController userHasValidHMSettings](self, "userHasValidHMSettings");
  -[HOBaseController setUserHasValidHMSettings:](self, "setUserHasValidHMSettings:", -[HOBaseController _areHMSettingsValidForHome:](self, "_areHMSettingsValidForHome:", v9));
  v11 = HFLogForCategory(33);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    *(_DWORD *)buf = 138413314;
    v31 = self;
    v32 = 2112;
    v33 = v14;
    v34 = 2112;
    v35 = v15;
    v36 = 1024;
    v37 = v10;
    v38 = 1024;
    v39 = -[HOBaseController userHasValidHMSettings](self, "userHasValidHMSettings");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Changing homes to %@. Settings validity was %{BOOL}d, now is %{BOOL}d", buf, 0x2Cu);

  }
  if (v9)
  {
    v16 = HFLogForCategory(33);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (HOBaseController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      *(_DWORD *)buf = 138412290;
      v31 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Switched homes, running Feature Onboarding checks for %@", buf, 0xCu);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
    v20 = objc_msgSend((id)objc_opt_class(v19), "instancesRespondToSelector:", "didLoadHome:");

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
      objc_msgSend(v21, "didLoadHome:", v9);

    }
    -[HOBaseController _checkAndRunFeatureOnboardingWithHomeSwitch:](self, "_checkAndRunFeatureOnboardingWithHomeSwitch:", 1);
  }
  else
  {
    v22 = objc_alloc_init(HOMainLoadingViewController);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController _populateWallpaperForLoadingViewController:](self, "_populateWallpaperForLoadingViewController:", v22));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000367D4;
    v26[3] = &unk_1000B7938;
    v27 = v8;
    v28 = self;
    v29 = v22;
    v24 = v22;
    v25 = objc_msgSend(v23, "addSuccessBlock:", v26);

  }
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __objc2_prot *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  int v29;
  id v30;
  __int16 v31;
  void *v32;

  v5 = a4;
  v6 = HFLogForCategory(33);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 138412290;
    v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "HomeKit Removed Home [%@]", (uint8_t *)&v29, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));

  v10 = HFLogForCategory(33);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childViewControllers"));
    v29 = 138412546;
    v30 = v9;
    v31 = 2112;
    v32 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "presentedViewController:[%@] with childViewControllers:[%@]", (uint8_t *)&v29, 0x16u);

  }
  if (v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childViewControllers"));
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childViewControllers"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
      v17 = &OBJC_PROTOCOL___HUConfigurationViewControllerFlow;
      if (objc_msgSend(v16, "conformsToProtocol:", v17))
        v18 = v16;
      else
        v18 = 0;
      v19 = v18;

      if ((objc_opt_respondsToSelector(v19, "onboardingFlowClass") & 1) != 0)
      {
        v20 = objc_msgSend(v19, "onboardingFlowClass");
        v21 = HFLogForCategory(33);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 138412290;
          v30 = v20;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "onboardingFlow = [%@]", (uint8_t *)&v29, 0xCu);
        }

        if (v20)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "home"));
          v25 = objc_msgSend(v5, "isEqual:", v24);

          if (v25)
          {
            v26 = HFLogForCategory(33);
            v27 = objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v29 = 138412290;
              v30 = v19;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Now dismissing presented View Controller = [%@]", (uint8_t *)&v29, 0xCu);
            }

            v28 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
            objc_msgSend(v28, "dismissViewControllerAnimated:completion:", 1, 0);

          }
        }
      }

    }
  }

}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  int v12;
  void *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  const __CFString *v17;

  v6 = +[HOBaseController isHomeManagerStatusReady:](HOBaseController, "isHomeManagerStatusReady:", a3);
  v7 = HFLogForCategory(33);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = HMHomeManagerStatusToString(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = CFSTR("so not yet running");
    v12 = 138412802;
    v13 = v10;
    if (v6)
      v11 = CFSTR("running");
    v14 = 2048;
    v15 = a4;
    v16 = 2112;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "HMHomeManager status updated to %@ (%lu), %@ Feature Onboarding checks...", (uint8_t *)&v12, 0x20u);

  }
  if (v6)
    -[HOBaseController _checkAndRunFeatureOnboardingWithHomeSwitch:](self, "_checkAndRunFeatureOnboardingWithHomeSwitch:", 0);
}

- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint8_t v11[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "home"));

  if (v5)
  {
    v6 = HFLogForCategory(33);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Refresh home view after initial databse load has finished", v11, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
    v9 = objc_msgSend((id)objc_opt_class(v8), "instancesRespondToSelector:", "didLoadHome:");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
      objc_msgSend(v10, "didLoadHome:", v5);

    }
    -[HOBaseController _checkAndRunFeatureOnboardingWithHomeSwitch:](self, "_checkAndRunFeatureOnboardingWithHomeSwitch:", 1);
  }

}

- (id)selectTabWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController _overridingTabIdentifier](self, "_overridingTabIdentifier"));
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    v7 = HFLogForCategory(9);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "-[HOBaseController selectTabWithIdentifier:]";
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) Using '%@' as an override instead of '%@' for the tab identifier", (uint8_t *)&v13, 0x20u);
    }

    v9 = v6;
    v4 = v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController rootViewController](self, "rootViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectTabWithIdentifier:", v4));

  return v11;
}

- (id)selectCurrentTab
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFStateRestorationSettings sharedInstance](HFStateRestorationSettings, "sharedInstance"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedHomeAppTabIdentifier"));
  v5 = (void *)v4;
  v6 = (void *)HFHomeAppTabIdentifierHome;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOBaseController selectTabWithIdentifier:](self, "selectTabWithIdentifier:", v7));
  return v8;
}

- (id)_overridingTabIdentifier
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "home"));

  if (objc_msgSend(v3, "hf_currentUserIsRestrictedGuest"))
    v4 = HFHomeAppTabIdentifierHome;
  else
    v4 = 0;

  return v4;
}

- (void)setInitialSetupStateController:(id)a3
{
  objc_storeStrong((id *)&self->_initialSetupStateController, a3);
}

- (NSMutableArray)triggersPendingExecutionConfirmation
{
  return self->_triggersPendingExecutionConfirmation;
}

- (void)setTriggersPendingExecutionConfirmation:(id)a3
{
  objc_storeStrong((id *)&self->_triggersPendingExecutionConfirmation, a3);
}

- (HOBaseControllerDelegate)rootViewController
{
  return (HOBaseControllerDelegate *)objc_loadWeakRetained((id *)&self->_rootViewController);
}

- (void)setRootViewController:(id)a3
{
  objc_storeWeak((id *)&self->_rootViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rootViewController);
  objc_storeStrong((id *)&self->_triggersPendingExecutionConfirmation, 0);
  objc_storeStrong((id *)&self->_initialSetupStateController, 0);
}

@end
