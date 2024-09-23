@implementation RCDefaultSceneDelegate

- (void)performDeferredInitializationJustOnce
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B530;
  block[3] = &unk_1001AB588;
  block[4] = self;
  if (qword_1001ED8A8 != -1)
    dispatch_once(&qword_1001ED8A8, block);
}

- (void)_setUpCloudSyncAccessManager
{
  RCCloudSyncAccessManager *v3;
  RCCloudSyncAccessManager *cloudSyncAccessManager;

  if (!self->_cloudSyncAccessManager)
  {
    v3 = (RCCloudSyncAccessManager *)objc_opt_new(RCCloudSyncAccessManager, a2);
    cloudSyncAccessManager = self->_cloudSyncAccessManager;
    self->_cloudSyncAccessManager = v3;

    -[RCCloudSyncAccessManager startMonitoringAccountChanges](self->_cloudSyncAccessManager, "startMonitoringAccountChanges");
  }
}

- (void)_setUpLocationManager
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[RCLocationsOfInterestManager defaultManager](RCLocationsOfInterestManager, "defaultManager"));
  objc_msgSend(v3, "prepare");
  if (self->_isActive)
    objc_msgSend(v3, "start");

}

- (void)_activateApplication
{
  void *v3;

  if (!self->_isActive)
  {
    self->_isActive = 1;
    -[RCDefaultSceneDelegate _eraseDeletedRecordingsIfNecessary](self, "_eraseDeletedRecordingsIfNecessary");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCLocationsOfInterestManager defaultManager](RCLocationsOfInterestManager, "defaultManager"));
    objc_msgSend(v3, "start");

    -[RCDefaultSceneDelegate showOnboardingScreensIfNeeded](self, "showOnboardingScreensIfNeeded");
  }
}

- (RCWelcomeViewController)welcomeViewController
{
  return (RCWelcomeViewController *)objc_loadWeakRetained((id *)&self->_welcomeViewController);
}

- (void)_handleSceneConnectionActions
{
  UIApplicationShortcutItem *shortcutItem;
  NSSet *userActivities;
  NSSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSSet *v10;
  NSSet *URLContexts;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (self->_shortcutItem)
  {
    -[RCDefaultSceneDelegate _performActionForShortcutItem:](self, "_performActionForShortcutItem:");
    shortcutItem = self->_shortcutItem;
    self->_shortcutItem = 0;

  }
  userActivities = self->_userActivities;
  if (userActivities)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = userActivities;
    v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          -[RCDefaultSceneDelegate _continueUserActivity:](self, "_continueUserActivity:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), (_QWORD)v12);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    v10 = self->_userActivities;
    self->_userActivities = 0;

  }
  if (self->_URLContexts)
  {
    -[RCDefaultSceneDelegate _openURLContexts:](self, "_openURLContexts:");
    URLContexts = self->_URLContexts;
    self->_URLContexts = 0;

  }
}

- (void)_showWelcomeScreenWithCompletionBlock:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  RCWelcomeViewController *v7;
  RCWelcomeViewController *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  int64_t v16;

  v4 = a3;
  v5 = +[RCWelcomeViewController reasonToShow](RCWelcomeViewController, "reasonToShow");
  if (v5)
  {
    v6 = v5;
    v7 = [RCWelcomeViewController alloc];
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_100047B60;
    v14 = &unk_1001AC048;
    v15 = v4;
    v16 = v6;
    v8 = -[RCWelcomeViewController initWithCompletionBlock:](v7, "initWithCompletionBlock:", &v11);
    -[RCWelcomeViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2, v11, v12, v13, v14);
    -[RCWelcomeViewController setModalInPresentation:](v8, "setModalInPresentation:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rootViewController"));
    objc_msgSend(v10, "presentViewController:animated:completion:", v8, 1, 0);

    -[RCDefaultSceneDelegate setWelcomeViewController:](self, "setWelcomeViewController:", v8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (BOOL)welcomeMustShowOrIsShowing
{
  BOOL v3;
  void *v4;

  if (+[RCWelcomeViewController reasonToShow](RCWelcomeViewController, "reasonToShow"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCDefaultSceneDelegate welcomeViewController](self, "welcomeViewController"));
  v3 = v4 != 0;

  return v3;
}

- (void)sceneDidBecomeActive:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[RCDefaultSceneDelegate _activateApplication](self, "_activateApplication", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v5 = objc_msgSend(v4, "recordingViewHidesBlurEffectsWhenInactive");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController activeFolderViewController](self->_mainViewController, "activeFolderViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v8, "setBlurThroughEffectsActive:", 1);

  }
  -[RCMainViewController setIsInForeground:](self->_mainViewController, "setIsInForeground:", 1);
  if (self->_tccAccessChangedWhileInBackground)
  {
    self->_tccAccessChangedWhileInBackground = 0;
    -[RCDefaultSceneDelegate _promptForCloudKitIfLoggedInAndTCCUnset](self, "_promptForCloudKitIfLoggedInAndTCCUnset");
  }
  -[RCDefaultSceneDelegate _handleSceneConnectionActions](self, "_handleSceneConnectionActions");
  v9 = (id)objc_claimAutoreleasedReturnValue(-[RCDefaultSceneDelegate defaultSceneActivationStateDelegate](self, "defaultSceneActivationStateDelegate"));
  objc_msgSend(v9, "defaultSceneDidBecomeActive");

}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCDefaultSceneDelegate playbackContainerViewController](self, "playbackContainerViewController", a3));
  objc_msgSend(v6, "adjustConstraintsForDisplayMode:", a4);

  LODWORD(a4) = UIAccessibilityLayoutChangedNotification;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCDefaultSceneDelegate playbackContainerViewController](self, "playbackContainerViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  UIAccessibilityPostNotification(a4, v7);

}

- (RCDetailContainerViewController)playbackContainerViewController
{
  return self->_playbackContainerViewController;
}

- (void)_eraseDeletedRecordingsIfNecessary
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationContainer sharedContainer](RCApplicationContainer, "sharedContainer"));
  v3 = objc_msgSend(v2, "newBackgroundModel");

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004AC4;
  v5[3] = &unk_1001AB588;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performBlock:", v5);

}

- (void)_handleWelcomeScreenContinue:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  unsigned int v6;
  RCCloudSyncAccessManager *cloudSyncAccessManager;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  _QWORD block[5];

  v3 = a3;
  if (!-[RCDefaultSceneDelegate welcomeScreenHasContinued](self, "welcomeScreenHasContinued"))
  {
    -[RCDefaultSceneDelegate setWelcomeScreenHasContinued:](self, "setWelcomeScreenHasContinued:", 1);
    -[RCDefaultSceneDelegate _setUpCloudSyncAccessManager](self, "_setUpCloudSyncAccessManager");
    -[RCDefaultSceneDelegate _setUpLocationManager](self, "_setUpLocationManager");
    if (v3)
    {
      if (-[RCCloudSyncAccessManager cloudSyncIsAvailable](self->_cloudSyncAccessManager, "cloudSyncIsAvailable"))
      {
        v5 = objc_msgSend(objc_alloc((Class)MBManager), "initWithDelegate:", 0);
        v6 = objc_msgSend(v5, "isBackupEnabled");

        cloudSyncAccessManager = self->_cloudSyncAccessManager;
        if (v6)
        {
          -[RCCloudSyncAccessManager setTccCloudAccess:](cloudSyncAccessManager, "setTccCloudAccess:", 2);
        }
        else if (-[RCCloudSyncAccessManager tccCloudAccess](cloudSyncAccessManager, "tccCloudAccess") != 2)
        {
          -[RCDefaultSceneDelegate _askUserForPermissionToUseCloudKit](self, "_askUserForPermissionToUseCloudKit");
        }
      }
    }
    else
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v9 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001B5BC;
      block[3] = &unk_1001AB588;
      block[4] = self;
      dispatch_async(v9, block);

    }
    -[RCMainViewController handleEndOfWelcome](self->_mainViewController, "handleEndOfWelcome");
  }
}

- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setIsTransitioningBetweenVisibleColumnStates:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitionCoordinator"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100047C58;
    v7[3] = &unk_1001ABA08;
    v8 = v5;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", &stru_1001AC0F0, v7);

  }
}

- (void)__performDeferredInitialization
{
  void *v3;
  void *v4;
  VMAudioService *v5;
  VMAudioService *audioService;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  _QWORD block[5];

  -[RCSplitViewController registerAppIntentsInteractions](self->_rootSplitViewController, "registerAppIntentsInteractions");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCDefaultSceneDelegate deferredInitializationDelegate](self, "deferredInitializationDelegate"));
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "performDeferredInitialization");
  v5 = (VMAudioService *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance"));
  audioService = self->_audioService;
  self->_audioService = v5;

  -[VMAudioService prepareService](self->_audioService, "prepareService");
  global_queue = dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B540;
  block[3] = &unk_1001AB588;
  block[4] = self;
  dispatch_async(v8, block);

}

- (void)showOnboardingScreensIfNeeded
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (!-[VMAudioService isPlaying](self->_audioService, "isPlaying")
    && !-[VMAudioService isRecording](self->_audioService, "isRecording"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCShareMemoViewController presentedController](RCShareMemoViewController, "presentedController"));

    if (!v3 && !-[RCDefaultSceneDelegate welcomeScreenHasContinued](self, "welcomeScreenHasContinued"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCDefaultSceneDelegate welcomeViewController](self, "welcomeViewController"));

      if (!v4)
      {
        v5[0] = _NSConcreteStackBlock;
        v5[1] = 3221225472;
        v5[2] = sub_10001B5AC;
        v5[3] = &unk_1001AC070;
        v5[4] = self;
        -[RCDefaultSceneDelegate _showWelcomeScreenWithCompletionBlock:](self, "_showWelcomeScreenWithCompletionBlock:", v5);
      }
    }
  }
}

- (BOOL)welcomeScreenHasContinued
{
  return self->_welcomeScreenHasContinued;
}

- (unint64_t)splitViewControllerSupportedInterfaceOrientations:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider", a3));
  v4 = objc_msgSend(v3, "supportedInterfaceOrientations");

  return (unint64_t)v4;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UIApplicationShortcutItem *v14;
  UIApplicationShortcutItem *shortcutItem;
  NSSet *v16;
  NSSet *userActivities;
  NSSet *v18;
  NSSet *URLContexts;
  void *v20;
  void *v21;
  id v22;
  RCSplitViewController *v23;
  RCSplitViewController *rootSplitViewController;
  RCMainViewController *v25;
  RCMainViewController *mainViewController;
  void *v27;
  UINavigationController *v28;
  UINavigationController *primaryNavigationController;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  RCPlaybackViewController *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  RCDetailContainerViewController *v40;
  UINavigationController *v41;
  UINavigationController *secondaryNavigationController;
  RCMainViewController *v43;
  _BOOL8 v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[5];

  v7 = a3;
  v8 = a5;
  if ((RCIsBeingUnitTested(v8, v9, v10, v11) & 1) == 0)
  {
    v13 = objc_opt_class(UIWindowScene, v12);
    if ((objc_opt_isKindOfClass(v7, v13) & 1) != 0)
    {
      v14 = (UIApplicationShortcutItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortcutItem"));
      shortcutItem = self->_shortcutItem;
      self->_shortcutItem = v14;

      v16 = (NSSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userActivities"));
      userActivities = self->_userActivities;
      self->_userActivities = v16;

      v18 = (NSSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLContexts"));
      URLContexts = self->_URLContexts;
      self->_URLContexts = v18;

      if (self->_shortcutItem
        || -[NSSet count](self->_userActivities, "count")
        || -[NSSet count](self->_URLContexts, "count"))
      {
        -[RCDefaultSceneDelegate _clearTemporaryAudioFilesOnce](self, "_clearTemporaryAudioFilesOnce");
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "delegate"));

      if (objc_msgSend(v21, "conformsToProtocol:", &OBJC_PROTOCOL___RCDeferredInitializationDelegate))
        -[RCDefaultSceneDelegate setDeferredInitializationDelegate:](self, "setDeferredInitializationDelegate:", v21);
      if (objc_msgSend(v21, "conformsToProtocol:", &OBJC_PROTOCOL___RCDefaultSceneActivationStateDelegate))-[RCDefaultSceneDelegate setDefaultSceneActivationStateDelegate:](self, "setDefaultSceneActivationStateDelegate:", v21);
      v22 = v7;
      notify_register_dispatch("com.apple.VoiceMemos.internal.settings.WillRemoveAllRecordings", &self->_removeAllRecordingsToken, (dispatch_queue_t)&_dispatch_main_q, &stru_1001ABFD8);
      notify_register_dispatch("com.apple.VoiceMemos.internal.settings.WillResetDefaults", &self->_resetDefaultsToken, (dispatch_queue_t)&_dispatch_main_q, &stru_1001ABFF8);

      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v54, "addObserver:selector:name:object:", self, "_failedToCreateDatabase:", RCSavedRecordingsModelDidFailToCreateDatabaseNotification, 0);
      v23 = -[RCSplitViewController initWithStyle:]([RCSplitViewController alloc], "initWithStyle:", 2);
      rootSplitViewController = self->_rootSplitViewController;
      self->_rootSplitViewController = v23;

      v25 = objc_alloc_init(RCMainViewController);
      mainViewController = self->_mainViewController;
      self->_mainViewController = v25;

      -[RCMainViewController setMainViewControllerDelegate:](self->_mainViewController, "setMainViewControllerDelegate:", self);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RCMainViewController mainControllerHelper](self->_mainViewController, "mainControllerHelper"));
      v55 = v22;
      objc_msgSend(v27, "defaultSceneDidConnect:", v22);

      v28 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_mainViewController);
      primaryNavigationController = self->_primaryNavigationController;
      self->_primaryNavigationController = v28;

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController interactivePopGestureRecognizer](self->_primaryNavigationController, "interactivePopGestureRecognizer"));
      objc_msgSend(v30, "setDelegate:", self);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      if (objc_msgSend(v31, "clipUnderlapWhileTransitioning"))
        -[UINavigationController _setClipUnderlapWhileTransitioning:](self->_primaryNavigationController, "_setClipUnderlapWhileTransitioning:", 1);
      -[UINavigationController setDelegate:](self->_primaryNavigationController, "setDelegate:", self->_mainViewController);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](self->_primaryNavigationController, "navigationBar"));
      if (objc_msgSend(v31, "usesLargeTitles"))
        objc_msgSend(v32, "setPrefersLargeTitles:", 1);
      v53 = v32;
      -[RCSplitViewController setViewController:forColumn:](self->_rootSplitViewController, "setViewController:forColumn:", self->_primaryNavigationController, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      v34 = objc_msgSend(v33, "hasPlaybackCard");

      v35 = 0;
      if (v34)
        v35 = objc_opt_new(RCPlaybackViewController);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
      objc_msgSend(v36, "safeAreaInsets");
      v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackViewController view](v35, "view"));
      objc_msgSend(v39, "setStatusBarHeight:", v38);

      -[RCRecordingViewController setRecordingViewControllerDelegate:](v35, "setRecordingViewControllerDelegate:", self->_mainViewController);
      v40 = objc_opt_new(RCDetailContainerViewController);
      -[RCDefaultSceneDelegate setPlaybackContainerViewController:](self, "setPlaybackContainerViewController:", v40);
      -[RCDetailContainerViewController setHostedViewController:](v40, "setHostedViewController:", v35);
      v41 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v40);
      secondaryNavigationController = self->_secondaryNavigationController;
      self->_secondaryNavigationController = v41;

      if (objc_msgSend(v31, "alwaysHidesDetailNavBar"))
        -[UINavigationController setNavigationBarHidden:](self->_secondaryNavigationController, "setNavigationBarHidden:", 1);
      -[RCMainViewController setPlaybackViewController:](self->_mainViewController, "setPlaybackViewController:", v35);
      -[RCSplitViewController setViewController:forColumn:](self->_rootSplitViewController, "setViewController:forColumn:", self->_secondaryNavigationController, 2);
      v43 = self->_mainViewController;
      v44 = self->_shortcutItem == 0;
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_10001B538;
      v56[3] = &unk_1001AB588;
      v56[4] = self;
      -[RCMainViewController finishInitialSetup:goToAllRecordings:](v43, "finishInitialSetup:goToAllRecordings:", v56, v44);
      -[RCSplitViewController setResizingDelegate:](self->_rootSplitViewController, "setResizingDelegate:", self);
      -[RCSplitViewController setMainViewController:](self->_rootSplitViewController, "setMainViewController:", self->_mainViewController);
      -[RCSplitViewController setDelegate:](self->_rootSplitViewController, "setDelegate:", self);
      -[RCSplitViewController setPresentsWithGesture:](self->_rootSplitViewController, "setPresentsWithGesture:", objc_msgSend(v31, "sidebarPresentsWithGesture"));
      -[RCSplitViewController setTransitioningDelegate:](self->_rootSplitViewController, "setTransitioningDelegate:", self->_mainViewController);
      objc_msgSend(v31, "maximumPrimaryColumnWidth");
      -[RCSplitViewController setMaximumPrimaryColumnWidth:](self->_rootSplitViewController, "setMaximumPrimaryColumnWidth:");
      objc_msgSend(v31, "minimumPrimaryColumnWidth");
      -[RCSplitViewController setMinimumPrimaryColumnWidth:](self->_rootSplitViewController, "setMinimumPrimaryColumnWidth:");
      objc_msgSend(v31, "maximumSupplementaryColumnWidth");
      -[RCSplitViewController setMaximumSupplementaryColumnWidth:](self->_rootSplitViewController, "setMaximumSupplementaryColumnWidth:");
      objc_msgSend(v31, "minimumSupplementaryColumnWidth");
      -[RCSplitViewController setMinimumSupplementaryColumnWidth:](self->_rootSplitViewController, "setMinimumSupplementaryColumnWidth:");
      -[RCPlaybackViewController setParentSplitViewController:](v35, "setParentSplitViewController:", self->_rootSplitViewController);
      v45 = objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v55);
      -[RCSceneDelegate setWindow:](self, "setWindow:", v45);

      v46 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
      objc_msgSend(v46, "setAccessibilityIdentifier:", CFSTR("Main Window"));

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "standardInteractionTintColor"));
      objc_msgSend(v47, "setTintColor:", v48);

      if (objc_msgSend(v31, "supportsPointerInteractions"))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "layer"));
        objc_msgSend(v50, "setHitTestsAsOpaque:", 1);

      }
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
      objc_msgSend(v51, "setRootViewController:", self->_rootSplitViewController);

      v52 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
      objc_msgSend(v52, "makeKeyAndVisible");

      -[RCDefaultSceneDelegate performDeferredInitializationJustOnce](self, "performDeferredInitializationJustOnce");
      -[RCDefaultSceneDelegate showOnboardingScreensIfNeeded](self, "showOnboardingScreensIfNeeded");

    }
  }

}

- (id)backgroundColorAnimation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCSceneDelegate window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "animationForKey:", CFSTR("backgroundColor")));

  v8 = objc_opt_class(CABasicAnimation, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    v9 = v6;
  else
    v9 = 0;

  return v9;
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  return 1;
}

- (void)setWelcomeScreenHasContinued:(BOOL)a3
{
  self->_welcomeScreenHasContinued = a3;
}

- (void)setPlaybackContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playbackContainerViewController, a3);
}

- (void)setDeferredInitializationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_deferredInitializationDelegate, a3);
}

- (void)setDefaultSceneActivationStateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_defaultSceneActivationStateDelegate, a3);
}

- (RCDeferredInitializationDelegate)deferredInitializationDelegate
{
  return (RCDeferredInitializationDelegate *)objc_loadWeakRetained((id *)&self->_deferredInitializationDelegate);
}

- (RCDefaultSceneActivationStateDelegate)defaultSceneActivationStateDelegate
{
  return (RCDefaultSceneActivationStateDelegate *)objc_loadWeakRetained((id *)&self->_defaultSceneActivationStateDelegate);
}

- (void)_initialViewDidLoad
{
  if (!-[RCDefaultSceneDelegate welcomeMustShowOrIsShowing](self, "welcomeMustShowOrIsShowing"))
    -[RCDefaultSceneDelegate performDeferredInitializationJustOnce](self, "performDeferredInitializationJustOnce");
  -[RCMainViewController performDelayedSetup](self->_mainViewController, "performDelayedSetup");
}

- (BOOL)_cloudSyncPromptNeedsShowing
{
  unsigned int v3;

  if (self->_cloudSyncAccessManager)
  {
    v3 = -[RCDefaultSceneDelegate welcomeScreenHasContinued](self, "welcomeScreenHasContinued");
    if (v3)
    {
      v3 = -[RCCloudSyncAccessManager cloudSyncIsAvailable](self->_cloudSyncAccessManager, "cloudSyncIsAvailable");
      if (v3)
        LOBYTE(v3) = -[RCCloudSyncAccessManager tccCloudAccess](self->_cloudSyncAccessManager, "tccCloudAccess") == 0;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[UINavigationController setDelegate:](self->_primaryNavigationController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RCDefaultSceneDelegate;
  -[RCDefaultSceneDelegate dealloc](&v3, "dealloc");
}

- (void)sceneWillResignActive:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;

  -[RCMainViewController updateQuickActions](self->_mainViewController, "updateQuickActions", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v5 = objc_msgSend(v4, "recordingViewHidesBlurEffectsWhenInactive");

  if (v5)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[RCMainViewController activeFolderViewController](self->_mainViewController, "activeFolderViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordingViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v7, "setBlurThroughEffectsActive:", 0);

  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (self->_fatalErrorAlertController)
    exit(0);
  -[RCMainViewController setIsInForeground:](self->_mainViewController, "setIsInForeground:", 0);
  self->_isActive = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
  objc_msgSend(v4, "saveIfNecessary");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCLocationsOfInterestManager defaultManager](RCLocationsOfInterestManager, "defaultManager"));
  objc_msgSend(v5, "stop");

}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (+[RCSceneDelegate instancesRespondToSelector:](RCSceneDelegate, "instancesRespondToSelector:", "windowScene:didUpdateCoordinateSpace:interfaceOrientation:traitCollection:"))
  {
    v13.receiver = self;
    v13.super_class = (Class)RCDefaultSceneDelegate;
    -[RCSceneDelegate windowScene:didUpdateCoordinateSpace:interfaceOrientation:traitCollection:](&v13, "windowScene:didUpdateCoordinateSpace:interfaceOrientation:traitCollection:", v10, v11, a5, v12);
  }
  if (objc_msgSend(v10, "interfaceOrientation") != (id)a5)
    -[VMAudioService interfaceOrientationDidUpdate:](self->_audioService, "interfaceOrientationDidUpdate:", objc_msgSend(v10, "interfaceOrientation"));

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  -[RCDefaultSceneDelegate _continueUserActivity:](self, "_continueUserActivity:", a4);
}

- (void)_continueUserActivity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;

  v4 = a3;
  if (!-[RCDefaultSceneDelegate modalMustShowOrIsShowing](self, "modalMustShowOrIsShowing"))
  {
    -[RCDefaultSceneDelegate performDeferredInitializationJustOnce](self, "performDeferredInitializationJustOnce");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activityType"));
    v7 = (objc_class *)objc_opt_class(RecordVoiceMemoIntent, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v5, "isEqualToString:", v9);

    if (v10)
    {
      v12 = OSLogForCategory(kVMLogCategoryDefault);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        sub_10010B064(v13, v14, v15, v16, v17, v18, v19, v20);

      -[RCDefaultSceneDelegate recordNewVoiceMemoFromIntent](self, "recordNewVoiceMemoFromIntent");
    }
    else
    {
      v21 = (objc_class *)objc_opt_class(PlaybackVoiceMemoIntent, v11);
      v22 = NSStringFromClass(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = objc_msgSend(v5, "isEqualToString:", v23);

      if (v24)
      {
        v25 = OSLogForCategory(kVMLogCategoryDefault);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          sub_10010B0D4(v26, v27, v28, v29, v30, v31, v32, v33);

        -[RCDefaultSceneDelegate playbackMostRecentRecordingFromIntent](self, "playbackMostRecentRecordingFromIntent");
      }
      else
      {
        v34 = objc_msgSend(v5, "isEqualToString:", CSSearchableItemActionType);
        v35 = kVMLogCategoryDefault;
        v36 = OSLogForCategory(kVMLogCategoryDefault);
        v37 = objc_claimAutoreleasedReturnValue(v36);
        v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG);
        if (v34)
        {
          if (v38)
            sub_10010B21C(v37, v39, v40, v41, v42, v43, v44, v45);

          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
          v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CSSearchableItemActivityIdentifier));

          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v37));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "scheme"));
          if (objc_msgSend(v48, "isEqualToString:", CFSTR("x-coredata")))
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
            v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "recordingWithURIRepresentation:", v47));

            if (v50)
            {
              v51 = objc_claimAutoreleasedReturnValue(-[NSObject uuid](v50, "uuid"));
              -[RCDefaultSceneDelegate _delayedSelectRecordingWithUUID:](self, "_delayedSelectRecordingWithUUID:", v51);
            }
            else
            {
              v53 = OSLogForCategory(v35);
              v51 = objc_claimAutoreleasedReturnValue(v53);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                sub_10010B144();
            }

          }
          else
          {
            v52 = OSLogForCategory(v35);
            v50 = objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              sub_10010B1B0();
          }

        }
        else if (v38)
        {
          sub_10010B28C();
        }

      }
    }

  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  -[RCDefaultSceneDelegate _openURLContexts:](self, "_openURLContexts:", a4);
}

- (void)_openURLContexts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  NSObject *v37;
  _BYTE v38[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService recordingController](self->_audioService, "recordingController"));

  if (!v5)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v24 = v4;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      v26 = kVMLogCategoryDefault;
      v27 = kVMLogCategoryService;
      do
      {
        v9 = 0;
        v25 = v7;
        do
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(obj);
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1)
                                                                                 + 8 * (_QWORD)v9), "URL"));
          if (-[RCDefaultSceneDelegate _isCoreDataURL:](self, "_isCoreDataURL:", v10))
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject absoluteString](v10, "absoluteString"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByRemovingPercentEncoding"));

            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v12, "rangeOfString:options:", CFSTR("x-coredata"), 1)));
            if (objc_msgSend(v13, "length")
              && (v14 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13))) != 0)
            {
              v15 = v14;
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recordingWithURIRepresentation:", v15));

              if (v17)
              {
                -[RCDefaultSceneDelegate _selectSharedRecording:](self, "_selectSharedRecording:", v17);
              }
              else
              {
                v22 = OSLogForCategory(v27);
                v23 = objc_claimAutoreleasedReturnValue(v22);
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315394;
                  v35 = "-[RCDefaultSceneDelegate _openURLContexts:]";
                  v36 = 2112;
                  v37 = v15;
                  _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s -- WARNING: no recording matching URI: '%@'", buf, 0x16u);
                }

              }
              v7 = v25;
            }
            else
            {
              v20 = OSLogForCategory(v27);
              v15 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                v21 = objc_claimAutoreleasedReturnValue(-[NSObject path](v10, "path"));
                *(_DWORD *)buf = 136315394;
                v35 = "-[RCDefaultSceneDelegate _openURLContexts:]";
                v36 = 2112;
                v37 = v21;
                _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s -- WARNING: request to open a URL we can't handle: '%@'", buf, 0x16u);

              }
            }

          }
          else if (v10 && -[NSObject isFileURL](v10, "isFileURL"))
          {
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_1000479A4;
            v29[3] = &unk_1001AC020;
            v29[4] = self;
            +[RCSavedRecordingsModel importFileWithURL:shouldUseMetadataTitle:completionHandler:](RCSavedRecordingsModel, "importFileWithURL:shouldUseMetadataTitle:completionHandler:", v10, 1, v29);
          }
          else
          {
            v18 = OSLogForCategory(v26);
            v19 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v35 = "-[RCDefaultSceneDelegate _openURLContexts:]";
              v36 = 2112;
              v37 = v10;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s -- URL not suitable for opening in Voice Memos - %@", buf, 0x16u);
            }

          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v7);
    }

    v4 = v24;
  }

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  -[RCDefaultSceneDelegate _performActionForShortcutItem:](self, "_performActionForShortcutItem:", a4);
}

- (void)_performActionForShortcutItem:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  if (!-[RCDefaultSceneDelegate modalMustShowOrIsShowing](self, "modalMustShowOrIsShowing"))
  {
    -[RCDefaultSceneDelegate performDeferredInitializationJustOnce](self, "performDeferredInitializationJustOnce");
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "type"));
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.VoiceMemos.NewRecording"));

    if (v5)
    {
      -[RCDefaultSceneDelegate _startNewRecordingQuickAction](self, "_startNewRecordingQuickAction");
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "type"));
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.VoiceMemos.PlayRecording"));

      if (v7)
      {
        v9 = objc_opt_class(NSString, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("uniqueID")));
        if ((objc_opt_isKindOfClass(v11, v9) & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
        v13 = v12;

        -[RCDefaultSceneDelegate _startPlaybackQuickActionForRecordingWithUniqueID:](self, "_startPlaybackQuickActionForRecordingWithUniqueID:", v13);
      }
    }
  }

}

- (void)_clearTemporaryAudioFilesOnce
{
  if (qword_1001ED8B0 != -1)
    dispatch_once(&qword_1001ED8B0, &stru_1001AC0D0);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return -[RCMainViewController navigationController:animationControllerForOperation:fromViewController:toViewController:](self->_mainViewController, "navigationController:animationControllerForOperation:fromViewController:toViewController:", a3, a4, a5, a6);
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setIsTransitioningBetweenVisibleColumnStates:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitionCoordinator"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100047D10;
    v7[3] = &unk_1001ABA08;
    v8 = v5;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", &stru_1001AC110, v7);

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;

  v4 = a3;
  v6 = objc_opt_class(UIScreenEdgePanGestureRecognizer, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  return -[RCMainViewController canSwipeToNavigateBack](self->_mainViewController, "canSwipeToNavigateBack")
      || (isKindOfClass & 1) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  Class v10;
  char v11;

  v5 = a4;
  v6 = a3;
  v8 = objc_opt_class(UIScreenEdgePanGestureRecognizer, v7);
  isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = NSClassFromString(CFSTR("UIScrollViewPanGestureRecognizer"));
    v11 = objc_opt_isKindOfClass(v5, v10) ^ 1;
  }
  else
  {
    v11 = 1;
  }

  return v11 & 1;
}

- (BOOL)performActionForMagicTap
{
  return -[RCMainViewController toggleRecording](self->_mainViewController, "toggleRecording");
}

- (BOOL)modalMustShowOrIsShowing
{
  if (-[RCDefaultSceneDelegate welcomeMustShowOrIsShowing](self, "welcomeMustShowOrIsShowing"))
    return 1;
  else
    return -[RCDefaultSceneDelegate cloudSyncPromptMustShowOrIsShowing](self, "cloudSyncPromptMustShowOrIsShowing");
}

- (void)cloudSyncAvailabilityChanged
{
  RCCloudSyncAccessManager *cloudSyncAccessManager;
  void *v4;
  id v5;
  void *v6;
  id v7;

  cloudSyncAccessManager = self->_cloudSyncAccessManager;
  if (cloudSyncAccessManager)
  {
    if (-[RCCloudSyncAccessManager cloudSyncIsAvailable](cloudSyncAccessManager, "cloudSyncIsAvailable"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v5 = objc_msgSend(v4, "applicationState");

      if (v5)
        self->_tccAccessChangedWhileInBackground = 1;
      else
        -[RCDefaultSceneDelegate _promptForCloudKitIfLoggedInAndTCCUnset](self, "_promptForCloudKitIfLoggedInAndTCCUnset");
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCDefaultSceneDelegate iCloudSyncConfirmationAlertController](self, "iCloudSyncConfirmationAlertController"));
      if (v6)
      {
        v7 = v6;
        objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
        v6 = v7;
      }

    }
  }
}

- (void)handleRestyleRequest
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  -[UINavigationController _setClipUnderlapWhileTransitioning:](self->_primaryNavigationController, "_setClipUnderlapWhileTransitioning:", objc_msgSend(v4, "clipUnderlapWhileTransitioning"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](self->_primaryNavigationController, "navigationBar"));
  objc_msgSend(v3, "_setHidesShadow:", 0);
  objc_msgSend(v3, "setPrefersLargeTitles:", objc_msgSend(v4, "usesLargeTitles"));
  -[RCMainViewController restyle](self->_mainViewController, "restyle");

}

- (void)splitViewController:(id)a3 willTransitionFromHorizontalSizeClass:(int64_t)a4 toHorizontalSizeClass:(int64_t)a5
{
  -[RCMainViewController willTransitionFromHorizontalSizeClass:toHorizontalSizeClass:](self->_mainViewController, "willTransitionFromHorizontalSizeClass:toHorizontalSizeClass:", a4, a5);
}

- (BOOL)isAnimatingBackgroundColor
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCDefaultSceneDelegate backgroundColorAnimation](self, "backgroundColorAnimation"));
  v3 = v2 != 0;

  return v3;
}

- (void)playbackMostRecentRecordingFromIntent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mostRecentRecording"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
    -[RCDefaultSceneDelegate _startPlaybackQuickActionForRecordingWithUniqueID:](self, "_startPlaybackQuickActionForRecordingWithUniqueID:", v5);

  }
}

- (void)_startNewRecordingQuickAction
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self->_mainViewController);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004812C;
  v3[3] = &unk_1001AC138;
  objc_copyWeak(&v4, &location);
  -[RCMainViewController setForegroundCompletionBlock:](self->_mainViewController, "setForegroundCompletionBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_startPlaybackQuickActionForRecordingWithUniqueID:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService recordingController](self->_audioService, "recordingController"));

  if (v4 && !v5)
  {
    objc_initWeak(&location, self->_mainViewController);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100048264;
    v6[3] = &unk_1001AC160;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    -[RCMainViewController setForegroundCompletionBlock:](self->_mainViewController, "setForegroundCompletionBlock:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (BOOL)cloudSyncPromptMustShowOrIsShowing
{
  BOOL v3;
  void *v4;

  if (-[RCDefaultSceneDelegate _cloudSyncPromptNeedsShowing](self, "_cloudSyncPromptNeedsShowing"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCDefaultSceneDelegate iCloudSyncConfirmationAlertController](self, "iCloudSyncConfirmationAlertController"));
  v3 = v4 != 0;

  return v3;
}

- (void)_promptForCloudKitIfLoggedInAndTCCUnset
{
  if (-[RCDefaultSceneDelegate _cloudSyncPromptNeedsShowing](self, "_cloudSyncPromptNeedsShowing"))
    -[RCDefaultSceneDelegate _askUserForPermissionToUseCloudKit](self, "_askUserForPermissionToUseCloudKit");
}

- (void)_askUserForPermissionToUseCloudKit
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
  _QWORD v15[5];
  _QWORD v16[5];

  if (self->_cloudSyncAccessManager)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCDefaultSceneDelegate iCloudSyncConfirmationAlertController](self, "iCloudSyncConfirmationAlertController"));

    if (!v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("POST_WELCOME_ICLOUD_CONFIRMATION_ALERT_TITLE"), &stru_1001B2BC0, 0));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("POST_WELCOME_ICLOUD_CONFIRMATION_ALERT_DESCRIPTION"), &stru_1001B2BC0, 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1));

      -[RCDefaultSceneDelegate setICloudSyncConfirmationAlertController:](self, "setICloudSyncConfirmationAlertController:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1001B2BC0, 0));

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100048548;
      v16[3] = &unk_1001AC188;
      v16[4] = self;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 1, v16));
      objc_msgSend(v8, "addAction:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("POST_WELCOME_ICLOUD_CONFIRMATION_ALERT_BUTTON_TITLE_ENABLE"), &stru_1001B2BC0, 0));

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100048560;
      v15[3] = &unk_1001AC188;
      v15[4] = self;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 0, v15));
      objc_msgSend(v8, "addAction:", v14);
      objc_msgSend(v8, "rc_showInMainWindow");

    }
  }
}

- (void)_failedToCreateDatabase:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIAlertController *v8;
  UIAlertController *fatalErrorAlertController;
  _QWORD v10[5];

  if (!self->_fatalErrorAlertController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CREATE_DATABASE_FAILED_ALERT_TITLE"), &stru_1001B2BC0, 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CREATE_DATABASE_FAILED_ALERT_MESSAGE"), &stru_1001B2BC0, 0));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004869C;
    v10[3] = &unk_1001AB588;
    v10[4] = self;
    v8 = (UIAlertController *)objc_claimAutoreleasedReturnValue(+[UIAlertController rc_OKAlertControllerWithTitle:message:handler:](UIAlertController, "rc_OKAlertControllerWithTitle:message:handler:", v5, v7, v10));
    fatalErrorAlertController = self->_fatalErrorAlertController;
    self->_fatalErrorAlertController = v8;

    -[UIAlertController rc_showInMainWindow](self->_fatalErrorAlertController, "rc_showInMainWindow");
  }
}

- (void)_delayedSelectRecordingWithUUID:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = dispatch_time(0, 500000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100048770;
  v7[3] = &unk_1001AB6E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);

}

- (void)_selectSharedRecording:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "uuid"));
  +[RCAnalyticsUtilities sendReceivedSharedRecording](RCAnalyticsUtilities, "sendReceivedSharedRecording");
  -[RCDefaultSceneDelegate _delayedSelectRecordingWithUUID:](self, "_delayedSelectRecordingWithUUID:", v4);

}

- (BOOL)_isCoreDataURL:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "scheme"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("x-coredata"));

  return v4;
}

- (RCMainViewController)mainViewController
{
  return self->_mainViewController;
}

- (void)setMainViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mainViewController, a3);
}

- (RCSplitViewController)rootSplitViewController
{
  return self->_rootSplitViewController;
}

- (void)setRootSplitViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootSplitViewController, a3);
}

- (void)setWelcomeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_welcomeViewController, a3);
}

- (UIAlertController)fatalErrorAlertController
{
  return self->_fatalErrorAlertController;
}

- (void)setFatalErrorAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_fatalErrorAlertController, a3);
}

- (UINavigationController)primaryNavigationController
{
  return self->_primaryNavigationController;
}

- (void)setPrimaryNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_primaryNavigationController, a3);
}

- (UINavigationController)secondaryNavigationController
{
  return self->_secondaryNavigationController;
}

- (void)setSecondaryNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryNavigationController, a3);
}

- (RCCloudSyncAccessManager)cloudSyncAccessManager
{
  return self->_cloudSyncAccessManager;
}

- (void)setCloudSyncAccessManager:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSyncAccessManager, a3);
}

- (UIAlertController)iCloudSyncConfirmationAlertController
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_iCloudSyncConfirmationAlertController);
}

- (void)setICloudSyncConfirmationAlertController:(id)a3
{
  objc_storeWeak((id *)&self->_iCloudSyncConfirmationAlertController, a3);
}

- (UIApplicationShortcutItem)shortcutItem
{
  return self->_shortcutItem;
}

- (void)setShortcutItem:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutItem, a3);
}

- (NSSet)userActivities
{
  return self->_userActivities;
}

- (void)setUserActivities:(id)a3
{
  objc_storeStrong((id *)&self->_userActivities, a3);
}

- (NSSet)URLContexts
{
  return self->_URLContexts;
}

- (void)setURLContexts:(id)a3
{
  objc_storeStrong((id *)&self->_URLContexts, a3);
}

- (VMAudioService)audioService
{
  return self->_audioService;
}

- (void)setAudioService:(id)a3
{
  objc_storeStrong((id *)&self->_audioService, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)tccAccessChangedWhileInBackground
{
  return self->_tccAccessChangedWhileInBackground;
}

- (void)setTccAccessChangedWhileInBackground:(BOOL)a3
{
  self->_tccAccessChangedWhileInBackground = a3;
}

- (int)removeAllRecordingsToken
{
  return self->_removeAllRecordingsToken;
}

- (void)setRemoveAllRecordingsToken:(int)a3
{
  self->_removeAllRecordingsToken = a3;
}

- (int)resetDefaultsToken
{
  return self->_resetDefaultsToken;
}

- (void)setResetDefaultsToken:(int)a3
{
  self->_resetDefaultsToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioService, 0);
  objc_storeStrong((id *)&self->_URLContexts, 0);
  objc_storeStrong((id *)&self->_userActivities, 0);
  objc_storeStrong((id *)&self->_shortcutItem, 0);
  objc_destroyWeak((id *)&self->_iCloudSyncConfirmationAlertController);
  objc_storeStrong((id *)&self->_cloudSyncAccessManager, 0);
  objc_storeStrong((id *)&self->_secondaryNavigationController, 0);
  objc_storeStrong((id *)&self->_primaryNavigationController, 0);
  objc_storeStrong((id *)&self->_fatalErrorAlertController, 0);
  objc_destroyWeak((id *)&self->_welcomeViewController);
  objc_storeStrong((id *)&self->_playbackContainerViewController, 0);
  objc_storeStrong((id *)&self->_rootSplitViewController, 0);
  objc_destroyWeak((id *)&self->_defaultSceneActivationStateDelegate);
  objc_destroyWeak((id *)&self->_deferredInitializationDelegate);
  objc_storeStrong((id *)&self->_mainViewController, 0);
}

@end
