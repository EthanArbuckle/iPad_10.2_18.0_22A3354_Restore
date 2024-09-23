@implementation CHActivitySharingNavigationController

- (CHActivitySharingNavigationController)initWithFriendListManager:(id)a3 friendManager:(id)a4 achievementsDataProvider:(id)a5 workoutsDataProvider:(id)a6 workoutFormattingManager:(id)a7 formattingManager:(id)a8 badgeImageFactory:(id)a9 healthStore:(id)a10 fitnessAppContext:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  CHFriendListViewController *v26;
  id v27;
  void *v28;
  CHFriendListViewController *v29;
  CHActivitySharingNavigationController *v30;
  CHActivitySharingNavigationController *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned __int8 v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  id obj;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  uint8_t v57[8];
  _QWORD handler[4];
  id v59;
  objc_super v60;
  id buf;
  __int16 v62;
  unsigned int v63;
  __int16 v64;
  unsigned int v65;

  v17 = a3;
  obj = a4;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = [CHFriendListViewController alloc];
  v52 = v20;
  v53 = v23;
  v51 = v18;
  v27 = v20;
  v28 = v21;
  v54 = v22;
  v29 = -[CHFriendListViewController initWithFriendListManager:andWithFriendManager:achievementsDataProvider:workoutsDataProvider:workoutFormattingManager:formattingManager:badgeImageFactory:healthStore:fitnessAppContext:](v26, "initWithFriendListManager:andWithFriendManager:achievementsDataProvider:workoutsDataProvider:workoutFormattingManager:formattingManager:badgeImageFactory:healthStore:fitnessAppContext:", v17, v18, v19, v27, v21, v22, v23, v24, v25);
  v60.receiver = self;
  v60.super_class = (Class)CHActivitySharingNavigationController;
  v30 = -[CHActivitySharingNavigationController initWithRootViewController:](&v60, "initWithRootViewController:", v29);
  v31 = v30;
  if (v30)
  {
    -[CHActivitySharingNavigationController setFormattingManager:](v30, "setFormattingManager:", v54);
    objc_storeStrong((id *)&v31->_friendListViewController, v29);
    objc_storeStrong((id *)&v31->_friendManager, obj);
    objc_storeStrong((id *)&v31->_imageFactory, a9);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("SHARING"), &stru_1007AE1D0, CFSTR("Localizable")));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController tabBarItem](v31, "tabBarItem"));
    objc_msgSend(v34, "setTitle:", v33);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("activity.sharing")));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController tabBarItem](v31, "tabBarItem"));
    objc_msgSend(v36, "setImage:", v35);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController navigationBar](v31, "navigationBar"));
    objc_msgSend(v37, "setPrefersLargeTitles:", 1);

    v38 = objc_msgSend(objc_alloc((Class)NSSManager), "initWithQueue:", &_dispatch_main_q);
    -[CHActivitySharingNavigationController setNanoSystemSettingsManager:](v31, "setNanoSystemSettingsManager:", v38);

    v31->_phoneCloudKitAccountIsActive = -[CHActivitySharingNavigationController _cachedPhoneCloudKitAccountStatusIsActive](v31, "_cachedPhoneCloudKitAccountStatusIsActive");
    v31->_watchCloudKitAccountExists = -[CHActivitySharingNavigationController _cachedWatchCloudKitAccountStatusIsActive](v31, "_cachedWatchCloudKitAccountStatusIsActive");
    v31->_watchCloudKitAccountAssumedToExist = -[CHActivitySharingNavigationController _cachedWatchCloudKitAccountAssumedToExist](v31, "_cachedWatchCloudKitAccountAssumedToExist");
    ASLoggingInitialize();
    v39 = (void *)ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v40 = v39;
      v41 = -[CHActivitySharingNavigationController phoneCloudKitAccountIsActive](v31, "phoneCloudKitAccountIsActive");
      v42 = -[CHActivitySharingNavigationController watchCloudKitAccountExists](v31, "watchCloudKitAccountExists");
      v43 = -[CHActivitySharingNavigationController watchCloudKitAccountAssumedToExist](v31, "watchCloudKitAccountAssumedToExist");
      LODWORD(buf) = 67109632;
      HIDWORD(buf) = v41;
      v62 = 1024;
      v63 = v42;
      v64 = 1024;
      v65 = v43;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Initializing account status from cache: [phone=%d], [watch=%d], [watch(assumed)=%d]", (uint8_t *)&buf, 0x14u);

    }
    objc_storeStrong((id *)&v31->_friendListManager, a3);
    v44 = -[CHActivitySharingNavigationController _checkPairedWatchIsMinimumVersion](v31, "_checkPairedWatchIsMinimumVersion");
    v31->_currentlyPairedWatchIsMinimumVersion = v44;
    if ((v44 & 1) != 0
      || (-[ASFriendListSectionManager hasAnyFriendsSetup](v31->_friendListManager, "hasAnyFriendsSetup") & 1) != 0
      || !-[CHActivitySharingNavigationController _fitnessModeRequiresWatchSetup](v31, "_fitnessModeRequiresWatchSetup"))
    {
      if (-[CHActivitySharingNavigationController _activitySharingIsSetup](v31, "_activitySharingIsSetup"))
        -[CHActivitySharingNavigationController _handleWatchStatusAndCloudKitAccountStatusChange](v31, "_handleWatchStatusAndCloudKitAccountStatusChange");
      else
        -[CHActivitySharingNavigationController _showSetupControllerInPhase:animated:](v31, "_showSetupControllerInPhase:animated:", 0, 0);
    }
    else
    {
      -[CHActivitySharingNavigationController _showSetupControllerInPhase:animated:](v31, "_showSetupControllerInPhase:animated:", 2, 0);
    }
    objc_initWeak(&buf, v31);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000892F0;
    handler[3] = &unk_1007791B0;
    objc_copyWeak(&v59, &buf);
    notify_register_dispatch(kASCloudKitAccountStatusChangedNotificationKey, &v31->_activitySharingCloudKitAccountStatusChangedToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    ASLoggingInitialize();
    v45 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v57 = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Registered a callback for CloudKit address changed notifications", v57, 2u);
    }
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100089374;
    v55[3] = &unk_1007791B0;
    objc_copyWeak(&v56, &buf);
    notify_register_dispatch(kASGatewayStatusChangedNotificationKey, &v31->_activitySharingGatewayStatusChangedToken, (dispatch_queue_t)&_dispatch_main_q, v55);

    ASLoggingInitialize();
    v46 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v57 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Registered a callback for Watch pairing changed notifications", v57, 2u);
    }
    -[CHActivitySharingNavigationController _getAndHandlePhoneCloudKitAccountStatus](v31, "_getAndHandlePhoneCloudKitAccountStatus");
    -[CHActivitySharingNavigationController _getAndHandleWatchCloudKitAccountStatus](v31, "_getAndHandleWatchCloudKitAccountStatus");
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v47, "addObserver:selector:name:object:", v31, "_applicationDidBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);

    objc_destroyWeak(&v56);
    objc_destroyWeak(&v59);
    objc_destroyWeak(&buf);
  }

  return v31;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[16];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  ASLoggingInitialize();
  v4 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unregistered for CloudKit address changed notifications", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)CHActivitySharingNavigationController;
  -[CHActivitySharingNavigationController dealloc](&v6, "dealloc");
}

- (void)_applicationDidBecomeActive:(id)a3
{
  void *v4;
  id v5;
  double v6;
  double v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  _BYTE v11[24];

  if (!-[CHActivitySharingNavigationController watchCloudKitAccountExists](self, "watchCloudKitAccountExists", a3))
  {
    ((void (*)(void))ASLoggingInitialize)();
    v9 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      v10 = "Application active, watch cloudKit status is inactive";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }
LABEL_12:
    -[CHActivitySharingNavigationController _getAndHandleWatchCloudKitAccountStatus](self, "_getAndHandleWatchCloudKitAccountStatus", *(_QWORD *)v11);
    return;
  }
  if (!self->_lastWatchCloudKitAccountFetchTimestamp)
  {
    ((void (*)(void))ASLoggingInitialize)();
    v9 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      v10 = "Application active, watch cloudKit status has never been successfully fetched";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = objc_msgSend(v4, "timeIntervalSinceDate:", self->_lastWatchCloudKitAccountFetchTimestamp);
  v7 = v6;
  ASLoggingInitialize(v5);
  v8 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v11 = 134217984;
    *(double *)&v11[4] = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Application active, time since last fetch of watch cloudKit status: %f", v11, 0xCu);
  }

  if (v7 > 3600.0)
    goto LABEL_12;
}

- (void)scrollToTop
{
  CHFriendListViewController *v3;
  CHFriendListViewController *friendListViewController;

  v3 = (CHFriendListViewController *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController topViewController](self, "topViewController"));
  friendListViewController = self->_friendListViewController;

  if (v3 == friendListViewController)
    -[CHFriendListViewController scrollToTop](self->_friendListViewController, "scrollToTop");
}

- (void)setPhoneCloudKitAccountIsActive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_phoneCloudKitAccountIsActive != a3)
  {
    v3 = a3;
    self->_phoneCloudKitAccountIsActive = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("CHActivitySharingPhoneHasCloudKitAccountDefaultsKey"));

  }
}

- (void)setWatchCloudKitAccountExists:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_watchCloudKitAccountExists != a3)
  {
    v3 = a3;
    self->_watchCloudKitAccountExists = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("CHActivitySharingWatchHasCloudKitAccountDefaultsKey"));

  }
}

- (void)setWatchCloudKitAccountAssumedToExist:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[5];
  id v10;
  id location;

  if (self->_watchCloudKitAccountAssumedToExist != a3)
  {
    v3 = a3;
    self->_watchCloudKitAccountAssumedToExist = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("CHActivitySharingWatchAssumedToHaveCloudKitAccountDefaultsKey"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("CHActivitySharingWatchAssumedToHaveCloudKitAccountTimesampDefaultsKey"));

    objc_initWeak(&location, self);
    v8 = dispatch_time(0, 600000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000898B8;
    block[3] = &unk_1007780C0;
    objc_copyWeak(&v10, &location);
    block[4] = self;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)handleActivitySharingURL:(id)a3
{
  id v4;
  _BOOL8 v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  int v31;
  id v32;

  v4 = a3;
  v5 = -[CHActivitySharingNavigationController _isSetupViewControllerVisible](self, "_isSetupViewControllerVisible");
  v6 = v5;
  ASLoggingInitialize(v5);
  v7 = ASLogDefault;
  v8 = os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v31 = 138543362;
      v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setup controller is visible, not handling URL: %{public}@", (uint8_t *)&v31, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      v31 = 138543362;
      v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handling URL: %{public}@", (uint8_t *)&v31, 0xCu);
    }
    v9 = -[CHActivitySharingNavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", 0);
    v10 = ASDateFromActivityAppLaunchURL(v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v11)
      v13 = v11;
    else
      v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v14 = v13;

    ASLoggingInitialize(v15);
    v16 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 138412290;
      v32 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Date is %@", (uint8_t *)&v31, 0xCu);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
    v18 = objc_msgSend(v17, "isEqualToString:", kASActivitySharingHostMe);

    if (v18)
    {
      ASLoggingInitialize(v19);
      v20 = ASLogDefault;
      if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Requesting me detail", (uint8_t *)&v31, 2u);
      }
      -[CHFriendListViewController showDetailForMeOnDate:](self->_friendListViewController, "showDetailForMeOnDate:", v14);
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
      v22 = objc_msgSend(v21, "isEqualToString:", kASActivitySharingHostFriendDetail);

      if (v22)
      {
        v23 = ASFriendUUIDFromActivityAppLaunchURL(v4);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        ASLoggingInitialize(v24);
        v25 = ASLogDefault;
        if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 138543362;
          v32 = v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Requesting friend detail with friendUUID=%{public}@", (uint8_t *)&v31, 0xCu);
        }
        -[CHFriendListViewController showDetailForFriendWithUUID:date:](self->_friendListViewController, "showDetailForFriendWithUUID:date:", v24, v14);

      }
      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
        v27 = objc_msgSend(v26, "isEqualToString:", kASActivitySharingHostInbox);

        ASLoggingInitialize(v28);
        v29 = ASLogDefault;
        v30 = os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT);
        if (v27)
        {
          if (v30)
          {
            LOWORD(v31) = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Requesting inbox view", (uint8_t *)&v31, 2u);
          }
          -[CHFriendListViewController showInbox](self->_friendListViewController, "showInbox");
        }
        else if (v30)
        {
          LOWORD(v31) = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Showing friend list", (uint8_t *)&v31, 2u);
        }
      }
    }

  }
}

- (BOOL)_isSetupViewControllerVisible
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController friendsSetupViewController](self, "friendsSetupViewController"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController viewControllers](self, "viewControllers"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController friendsSetupViewController](self, "friendsSetupViewController"));
    v6 = objc_msgSend(v4, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_showSetupControllerInPhase:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  CHFriendsSetupViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v4 = a4;
  if (-[CHActivitySharingNavigationController _isSetupViewControllerVisible](self, "_isSetupViewControllerVisible"))
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController friendsSetupViewController](self, "friendsSetupViewController"));
    objc_msgSend(v13, "setPhase:animated:", a3, 0);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController viewControllers](self, "viewControllers"));
    -[CHActivitySharingNavigationController setNavigationStackDisplacedBySetupController:](self, "setNavigationStackDisplacedBySetupController:", v7);

    v8 = objc_alloc_init(CHFriendsSetupViewController);
    -[CHActivitySharingNavigationController setFriendsSetupViewController:](self, "setFriendsSetupViewController:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController friendsSetupViewController](self, "friendsSetupViewController"));
    objc_msgSend(v9, "setDelegate:", self);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController friendsSetupViewController](self, "friendsSetupViewController"));
    objc_msgSend(v10, "setPhase:animated:", a3, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController friendsSetupViewController](self, "friendsSetupViewController"));
    v14 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    -[CHActivitySharingNavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v12, v4);

    -[CHActivitySharingNavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", 1, v4);
  }
}

- (void)_hideSetupControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[CHActivitySharingNavigationController _isSetupViewControllerVisible](self, "_isSetupViewControllerVisible"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController navigationStackDisplacedBySetupController](self, "navigationStackDisplacedBySetupController"));
    -[CHActivitySharingNavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v5, v3);

    -[CHActivitySharingNavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", 0, v3);
    -[CHActivitySharingNavigationController setNavigationStackDisplacedBySetupController:](self, "setNavigationStackDisplacedBySetupController:", 0);
    -[CHActivitySharingNavigationController setFriendsSetupViewController:](self, "setFriendsSetupViewController:", 0);
  }
}

- (BOOL)friendsSetupViewControllerShouldTransitionToCloudKitSignInPhase:(id)a3
{
  return !-[CHActivitySharingNavigationController _cloudKitAccountsAreActive](self, "_cloudKitAccountsAreActive", a3);
}

- (void)friendsSetupViewController:(id)a3 didCompletePhase:(int64_t)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController friendsSetupViewController](self, "friendsSetupViewController"));

  if (v7 == v6)
  {
    if (a4 == 2)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
      v8 = CFSTR("bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK");
    }
    else
    {
      if (a4 != 1)
      {
        if (!a4)
          -[CHActivitySharingNavigationController _setActivitySharingIsSetup:](self, "_setActivitySharingIsSetup:", 1);
        return;
      }
      if (-[CHActivitySharingNavigationController phoneCloudKitAccountIsActive](self, "phoneCloudKitAccountIsActive"))
      {
        if (-[CHActivitySharingNavigationController watchCloudKitAccountExists](self, "watchCloudKitAccountExists"))
          return;
        v10 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
        v8 = CFSTR("bridge:root=GENERAL_LINK&path=LINK_WITH_ICLOUD_LINK");
      }
      else
      {
        v10 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
        v8 = CFSTR("settings-navigation://com.apple.Settings.AppleAccount");
      }
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
    objc_msgSend(v10, "openSensitiveURL:withOptions:", v9, 0);

  }
}

- (void)friendsSetupViewControllerDidCompleteSetup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController friendsSetupViewController](self, "friendsSetupViewController"));

  if (v5 == v4)
    -[CHActivitySharingNavigationController _hideSetupControllerAnimated:](self, "_hideSetupControllerAnimated:", 1);
}

- (BOOL)_activitySharingIsSetup
{
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  _DWORD v7[2];

  v2 = objc_alloc((Class)NSUserDefaults);
  v3 = objc_msgSend(v2, "initWithSuiteName:", kASDomain);
  v4 = objc_msgSend(v3, "BOOLForKey:", kASActivitySharingIsSetup);
  ASLoggingInitialize(v4);
  v5 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = (_DWORD)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking defaults for fitness friends setup: %{BOOL}d", (uint8_t *)v7, 8u);
  }

  return (char)v4;
}

- (void)_setActivitySharingIsSetup:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  const __CFString *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _DWORD v12[2];

  v3 = a3;
  v4 = objc_alloc((Class)NSUserDefaults);
  v5 = (const __CFString *)kASDomain;
  v6 = objc_msgSend(v4, "initWithSuiteName:", kASDomain);
  ASLoggingInitialize(v6);
  v7 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109120;
    v12[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting defaults for fitness friends setup: %{BOOL}d", (uint8_t *)v12, 8u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  v9 = kASActivitySharingIsSetup;
  objc_msgSend(v6, "setObject:forKey:", v8, kASActivitySharingIsSetup);

  CFPreferencesAppSynchronize(v5);
  v10 = (void *)objc_opt_new(NPSManager);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
  objc_msgSend(v10, "synchronizeUserDefaultsDomain:keys:", v5, v11);

}

- (void)_getAndHandlePhoneCloudKitAccountStatus
{
  NSObject *v3;
  CHFriendManager *friendManager;
  _QWORD v5[5];
  id v6;
  id buf[2];

  ASLoggingInitialize(self);
  v3 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Asking for phone account", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  friendManager = self->_friendManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008A49C;
  v5[3] = &unk_100779200;
  objc_copyWeak(&v6, buf);
  v5[4] = self;
  -[CHFriendManager cloudKitAccountStatusWithCompletion:](friendManager, "cloudKitAccountStatusWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)_getAndHandleWatchCloudKitAccountStatus
{
  _BOOL8 v3;
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id buf[2];

  v3 = -[CHActivitySharingNavigationController watchCloudKitAccountFetchInProgress](self, "watchCloudKitAccountFetchInProgress");
  v4 = v3;
  ASLoggingInitialize(v3);
  v5 = ASLogDefault;
  v6 = os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NSS fetch already in progress", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asking NSS for watch accounts", (uint8_t *)buf, 2u);
    }
    -[CHActivitySharingNavigationController setWatchCloudKitAccountFetchInProgress:](self, "setWatchCloudKitAccountFetchInProgress:", 1);
    objc_initWeak(buf, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController nanoSystemSettingsManager](self, "nanoSystemSettingsManager"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10008A91C;
    v8[3] = &unk_100777CA8;
    objc_copyWeak(&v9, buf);
    objc_msgSend(v7, "getAccountsInfo:", v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

- (BOOL)_fitnessModeRequiresWatchSetup
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior"));
  v3 = (unint64_t)objc_msgSend(v2, "fitnessMode");

  return (v3 & 0xFFFFFFFFFFFFFFFELL) != 2;
}

- (void)_handleWatchStatusAndCloudKitAccountStatusChange
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  _BOOL8 v6;
  NSObject *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL8 v12;
  CHActivitySharingNavigationController *v13;
  uint64_t v14;
  _BOOL8 v15;
  _BOOL8 v16;
  NSObject *v17;
  _BOOL8 v18;
  NSObject *v19;
  NSObject *v20;
  _DWORD v21[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController viewIfLoaded](self, "viewIfLoaded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  v5 = -[CHActivitySharingNavigationController _cloudKitAccountsAreActive](self, "_cloudKitAccountsAreActive");
  v6 = -[CHActivitySharingNavigationController _checkPairedWatchIsMinimumVersion](self, "_checkPairedWatchIsMinimumVersion");
  self->_currentlyPairedWatchIsMinimumVersion = v6;
  ASLoggingInitialize(v6);
  v7 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v21[0] = 67109120;
    v21[1] = v4 != 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handling account status change (view currently visible: %d)", (uint8_t *)v21, 8u);
  }
  if (!self->_currentlyPairedWatchIsMinimumVersion)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHActivitySharingNavigationController friendListManager](self, "friendListManager"));
    if (objc_msgSend(v8, "hasAnyFriendsSetup"))
    {

    }
    else
    {
      v9 = -[CHActivitySharingNavigationController _fitnessModeRequiresWatchSetup](self, "_fitnessModeRequiresWatchSetup");

      if (v9)
      {
        ASLoggingInitialize(v10);
        v11 = ASLogDefault;
        if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Showing upgrade watch page.", (uint8_t *)v21, 2u);
        }
        v12 = v4 != 0;
        v13 = self;
        v14 = 2;
        goto LABEL_24;
      }
    }
  }
  v15 = -[CHActivitySharingNavigationController _isSetupViewControllerVisible](self, "_isSetupViewControllerVisible");
  if ((v5 & 1) == 0)
  {
    if (v15)
    {
LABEL_17:
      v18 = -[CHActivitySharingNavigationController _activitySharingIsSetup](self, "_activitySharingIsSetup");
      if (v18)
        return;
      ASLoggingInitialize(v18);
      v19 = ASLogDefault;
      if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Showing introduction setup page.", (uint8_t *)v21, 2u);
      }
      v13 = self;
      v14 = 0;
      v12 = 0;
      goto LABEL_24;
    }
    ASLoggingInitialize(v15);
    v20 = ASLogDefault;
    if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Showing iCloud signin page.", (uint8_t *)v21, 2u);
    }
    v12 = v4 != 0;
    v13 = self;
    v14 = 1;
LABEL_24:
    -[CHActivitySharingNavigationController _showSetupControllerInPhase:animated:](v13, "_showSetupControllerInPhase:animated:", v14, v12);
    return;
  }
  if (!v15)
    goto LABEL_17;
  v16 = -[CHActivitySharingNavigationController _activitySharingIsSetup](self, "_activitySharingIsSetup");
  if (!v16)
    goto LABEL_17;
  ASLoggingInitialize(v16);
  v17 = ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Hiding iCloud signin page.", (uint8_t *)v21, 2u);
  }
  -[CHActivitySharingNavigationController _hideSetupControllerAnimated:](self, "_hideSetupControllerAnimated:", v4 != 0);
}

- (void)_updateActivitySharingWatchPairingStatus
{
  _BOOL4 v3;

  v3 = -[CHActivitySharingNavigationController _checkPairedWatchIsMinimumVersion](self, "_checkPairedWatchIsMinimumVersion");
  if (self->_currentlyPairedWatchIsMinimumVersion != v3)
  {
    self->_currentlyPairedWatchIsMinimumVersion = v3;
    -[CHActivitySharingNavigationController _handleWatchStatusAndCloudKitAccountStatusChange](self, "_handleWatchStatusAndCloudKitAccountStatusChange");
  }
}

- (BOOL)_cloudKitAccountsAreActive
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  _DWORD v7[2];
  __int16 v8;
  unsigned int v9;
  __int16 v10;
  unsigned int v11;

  ASLoggingInitialize(self);
  v3 = (void *)ASLogDefault;
  if (os_log_type_enabled(ASLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v7[0] = 67109632;
    v7[1] = -[CHActivitySharingNavigationController phoneCloudKitAccountIsActive](self, "phoneCloudKitAccountIsActive");
    v8 = 1024;
    v9 = -[CHActivitySharingNavigationController watchCloudKitAccountExists](self, "watchCloudKitAccountExists");
    v10 = 1024;
    v11 = -[CHActivitySharingNavigationController watchCloudKitAccountAssumedToExist](self, "watchCloudKitAccountAssumedToExist");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deriving account status from: [phone=%d], [watch=%d], [watch(assumed)=%d]", (uint8_t *)v7, 0x14u);

  }
  v5 = -[CHActivitySharingNavigationController phoneCloudKitAccountIsActive](self, "phoneCloudKitAccountIsActive");
  if (v5)
  {
    if (-[CHActivitySharingNavigationController watchCloudKitAccountExists](self, "watchCloudKitAccountExists")
      || -[CHActivitySharingNavigationController watchCloudKitAccountAssumedToExist](self, "watchCloudKitAccountAssumedToExist"))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = !-[CHActivitySharingNavigationController _fitnessModeRequiresWatchSetup](self, "_fitnessModeRequiresWatchSetup");
    }
  }
  return v5;
}

- (BOOL)_cachedPhoneCloudKitAccountStatusIsActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CHActivitySharingPhoneHasCloudKitAccountDefaultsKey"));

  return v3;
}

- (BOOL)_cachedWatchCloudKitAccountStatusIsActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CHActivitySharingWatchHasCloudKitAccountDefaultsKey"));

  return v3;
}

- (BOOL)_cachedWatchCloudKitAccountAssumedToExist
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CHActivitySharingWatchAssumedToHaveCloudKitAccountDefaultsKey"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("CHActivitySharingWatchAssumedToHaveCloudKitAccountTimesampDefaultsKey")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v6, "timeIntervalSinceDate:", v5);
  if (v7 >= 600.0)
    v3 = 0;

  return v3;
}

- (id)_ppt_scrollView
{
  return -[CHFriendListViewController _ppt_scrollView](self->_friendListViewController, "_ppt_scrollView");
}

- (CHFriendsSetupViewController)friendsSetupViewController
{
  return self->_friendsSetupViewController;
}

- (void)setFriendsSetupViewController:(id)a3
{
  objc_storeStrong((id *)&self->_friendsSetupViewController, a3);
}

- (NSArray)navigationStackDisplacedBySetupController
{
  return self->_navigationStackDisplacedBySetupController;
}

- (void)setNavigationStackDisplacedBySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationStackDisplacedBySetupController, a3);
}

- (FIUIFormattingManager)formattingManager
{
  return self->_formattingManager;
}

- (void)setFormattingManager:(id)a3
{
  objc_storeStrong((id *)&self->_formattingManager, a3);
}

- (NSSManager)nanoSystemSettingsManager
{
  return self->_nanoSystemSettingsManager;
}

- (void)setNanoSystemSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_nanoSystemSettingsManager, a3);
}

- (BOOL)phoneCloudKitAccountIsActive
{
  return self->_phoneCloudKitAccountIsActive;
}

- (BOOL)watchCloudKitAccountExists
{
  return self->_watchCloudKitAccountExists;
}

- (BOOL)watchCloudKitAccountAssumedToExist
{
  return self->_watchCloudKitAccountAssumedToExist;
}

- (BOOL)watchCloudKitAccountFetchInProgress
{
  return self->_watchCloudKitAccountFetchInProgress;
}

- (void)setWatchCloudKitAccountFetchInProgress:(BOOL)a3
{
  self->_watchCloudKitAccountFetchInProgress = a3;
}

- (NSDate)lastPhoneCloudKitAccountFetchTimestamp
{
  return self->_lastPhoneCloudKitAccountFetchTimestamp;
}

- (void)setLastPhoneCloudKitAccountFetchTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastPhoneCloudKitAccountFetchTimestamp, a3);
}

- (NSDate)lastWatchCloudKitAccountFetchTimestamp
{
  return self->_lastWatchCloudKitAccountFetchTimestamp;
}

- (void)setLastWatchCloudKitAccountFetchTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastWatchCloudKitAccountFetchTimestamp, a3);
}

- (ASFriendListSectionManager)friendListManager
{
  return self->_friendListManager;
}

- (void)setFriendListManager:(id)a3
{
  objc_storeStrong((id *)&self->_friendListManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendListManager, 0);
  objc_storeStrong((id *)&self->_lastWatchCloudKitAccountFetchTimestamp, 0);
  objc_storeStrong((id *)&self->_lastPhoneCloudKitAccountFetchTimestamp, 0);
  objc_storeStrong((id *)&self->_nanoSystemSettingsManager, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_navigationStackDisplacedBySetupController, 0);
  objc_storeStrong((id *)&self->_friendsSetupViewController, 0);
  objc_storeStrong((id *)&self->_imageFactory, 0);
  objc_storeStrong((id *)&self->_friendManager, 0);
  objc_storeStrong((id *)&self->_friendListViewController, 0);
}

@end
