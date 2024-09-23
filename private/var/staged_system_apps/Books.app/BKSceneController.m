@implementation BKSceneController

- (void)setRootBarCoordinator:(id)a3
{
  BKSceneController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100019B10(a3);

  swift_unknownObjectRelease(a3);
}

- (BCEngagementProvider)bc_engagementProvider
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "engagementManager"));

  return (BCEngagementProvider *)v3;
}

- (void)_finishWindowSetup:(id)a3
{
  id v4;
  BKRootViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  NSTimer *v21;
  NSTimer *rotationToSupportedTimer;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30[2];
  id location;
  _QWORD v32[5];
  _QWORD v33[5];
  uint8_t buf[4];
  id v35;

  v4 = a3;
  v5 = objc_alloc_init(BKRootViewController);
  -[BKRootViewController _bk_setSceneController:](v5, "_bk_setSceneController:", self);
  objc_msgSend(v4, "setRootViewController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController upgradeViewController](self, "upgradeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v7, "addSubview:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController ba_analyticsController](self, "ba_analyticsController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "applicationTracker"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));
  objc_msgSend(v12, "ba_setAnalyticsTracker:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));
  objc_msgSend(v13, "setBc_engagementProviderSource:", self);

  if ((id)-[_BKBaseSceneController sceneType](self, "sceneType") == (id)1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController _sceneManager](self, "_sceneManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rootBarCoordinatorForSceneController:", self));
    -[BKSceneController setRootBarCoordinator:](self, "setRootBarCoordinator:", v15);

  }
  v32[4] = self;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000C5F0;
  v33[3] = &unk_1008E72C0;
  v33[4] = self;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000D170;
  v32[3] = &unk_1008E77C8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 5242880, v33, v32, 0.2, 0.0);
  if ((id)-[_BKBaseSceneController sceneType](self, "sceneType") == (id)1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));
    v17 = (unint64_t)objc_msgSend(v16, "supportedInterfaceOrientations");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
    v19 = objc_msgSend(v18, "interfaceOrientation");

    if ((v17 & (1 << v19)) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController launchCoordinator](self, "launchCoordinator"));
      objc_msgSend(v20, "signalConditionSatisfied:", 7);

    }
    else
    {
      objc_initWeak(&location, self);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10007FF08;
      v29[3] = &unk_1008E77F0;
      objc_copyWeak(v30, &location);
      v30[1] = (id)0x3FF0000000000000;
      v21 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v29, 1.0));
      rotationToSupportedTimer = self->_rotationToSupportedTimer;
      self->_rotationToSupportedTimer = v21;

      v23 = BCSceneLog();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
        v26 = objc_msgSend(v25, "interfaceOrientation");
        *(_DWORD *)buf = 134217984;
        v35 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "BKSceneController: Waiting for UIKit to rotate to the supported orientation from current orientation: %li", buf, 0xCu);

      }
      objc_destroyWeak(v30);
      objc_destroyWeak(&location);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController _sceneManager](self, "_sceneManager"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController welcomePresenter](self, "welcomePresenter"));
    objc_msgSend(v27, "_setupWelcomeScreenWithPresenterIfNeeded:", v28);

  }
}

- (id)_sceneManager
{
  return +[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager");
}

- (id)rootViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController bk_window](self, "bk_window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));

  return v3;
}

- (BKMainFlowController)mainFlowController
{
  BKMainFlowController *mainFlowController;
  BKMainFlowController *v4;
  void *v5;
  BKMainFlowController *v6;
  BKMainFlowController *v7;
  void *v8;

  mainFlowController = self->_mainFlowController;
  if (!mainFlowController)
  {
    v4 = [BKMainFlowController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v6 = -[BKMainFlowController initWithLibraryAssetProvider:](v4, "initWithLibraryAssetProvider:", v5);
    v7 = self->_mainFlowController;
    self->_mainFlowController = v6;

    -[BKMainFlowController setDelegate:](self->_mainFlowController, "setDelegate:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController rootBarCoordinator](self, "rootBarCoordinator"));
    -[BKMainFlowController setRootBarCoordinator:](self->_mainFlowController, "setRootBarCoordinator:", v8);

    mainFlowController = self->_mainFlowController;
  }
  return mainFlowController;
}

- (void)welcomePresenterFinishOngoingModalTransitionAnimations:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  BKSceneController *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = sub_10004F5B4;
  v5[3] = &unk_1008E7680;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)BKSceneController;
  v5[0] = _NSConcreteStackBlock;
  v3 = v7;
  -[_BKBaseSceneController welcomePresenterFinishOngoingModalTransitionAnimations:](&v4, "welcomePresenterFinishOngoingModalTransitionAnimations:", v5);

}

- (BKRootBarCoordinating)rootBarCoordinator
{
  BKSceneController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)BKSceneController.rootBarCoordinator.getter();

  return (BKRootBarCoordinating *)v3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController scene](self, "scene"));

  if (v10)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKSceneController.m", 486, "-[BKSceneController scene:willConnectToSession:options:]", "!self.scene", 0);
  v11 = objc_opt_class(_BCWindowScene);
  v12 = BUDynamicCast(v11, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  -[_BKBaseSceneController setScene:](self, "setScene:", v13);
  objc_msgSend(v13, "setController:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController bk_window](self, "bk_window"));
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setWindowScene:", v13);
    objc_msgSend(v15, "makeKeyAndVisible");
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController _windowWithScene:sceneType:](self, "_windowWithScene:sceneType:", v13, -[_BKBaseSceneController sceneType](self, "sceneType")));
    if ((id)-[_BKBaseSceneController sceneType](self, "sceneType") == (id)2)
    {
      -[BKSceneController _setupAccountSceneForWindow:](self, "_setupAccountSceneForWindow:", v16);
    }
    else
    {
      if ((id)-[_BKBaseSceneController sceneType](self, "sceneType") == (id)3)
        -[BKSceneController _setupEndOfBookSceneForWindow:withSession:options:](self, "_setupEndOfBookSceneForWindow:withSession:options:", v16, v17, v8);
      else
        -[BKSceneController _setupWithWindow:](self, "_setupWithWindow:", v16);
      -[BKSceneController setupStatusBar](self, "setupStatusBar");
    }

  }
}

- (BKSceneController)initWithSceneType:(unint64_t)a3 launchCoordinator:(id)a4 criticalAlertCoordinator:(id)a5
{
  id v8;
  id v9;
  BKSceneController *v10;
  BKSceneController *v11;
  BKAppAnalyticsManager *v12;
  void *v13;
  void *v14;
  BKAnalyticsSessionHost *v15;
  void *v16;
  BKAnalyticsSessionHost *v17;
  BKAnalyticsSessionHost *analyticsSessionHost;
  BKBookReaderInteractionCoordinator *v19;
  BKBookReaderInteractionCoordinator *interactionCoordinator;
  objc_super v22;

  v8 = a4;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BKSceneController;
  v10 = -[_BKBaseSceneController initWithSceneType:](&v22, "initWithSceneType:", a3);
  v11 = v10;
  if (v10)
  {
    -[_BKBaseSceneController setLaunchCoordinator:](v10, "setLaunchCoordinator:", v8);
    -[_BKBaseSceneController setCriticalAlertCoordinator:](v11, "setCriticalAlertCoordinator:", v9);
    v12 = objc_alloc_init(BKAppAnalyticsManager);
    -[BKSceneController setAnalyticsManager:](v11, "setAnalyticsManager:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController analyticsManager](v11, "analyticsManager"));
    objc_msgSend(v13, "setDelegate:", v11);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController analyticsManager](v11, "analyticsManager"));
    objc_msgSend(v14, "analyticsSetupTracking");

    v15 = [BKAnalyticsSessionHost alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController analyticsManager](v11, "analyticsManager"));
    v17 = -[BKAnalyticsSessionHost initWithAnalyticsManager:](v15, "initWithAnalyticsManager:", v16);
    analyticsSessionHost = v11->_analyticsSessionHost;
    v11->_analyticsSessionHost = v17;

    v19 = -[BKBookReaderInteractionCoordinator initWithWindow:]([BKBookReaderInteractionCoordinator alloc], "initWithWindow:", 0);
    interactionCoordinator = v11->_interactionCoordinator;
    v11->_interactionCoordinator = v19;

  }
  return v11;
}

- (BKAppAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)_setupWithWindow:(id)a3
{
  BKUpgradeViewController *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[BKSceneController setBk_window:](self, "setBk_window:", v7);
  v4 = objc_alloc_init(BKUpgradeViewController);
  -[BKSceneController setUpgradeViewController:](self, "setUpgradeViewController:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController upgradeViewController](self, "upgradeViewController"));
  objc_msgSend(v5, "_bk_setSceneController:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController upgradeViewController](self, "upgradeViewController"));
  objc_msgSend(v7, "setRootViewController:", v6);

  objc_msgSend(v7, "makeKeyAndVisible");
  -[BKSceneController _finishWindowSetup:](self, "_finishWindowSetup:", v7);

}

- (BKUpgradeViewController)upgradeViewController
{
  return self->_upgradeViewController;
}

- (id)flowControllers
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController mainFlowController](self, "mainFlowController"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (void)updateCloseTypeState:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController bookFlowAssetPresenting](self, "bookFlowAssetPresenting", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presenterViewControllersConformingToProtocol:", &OBJC_PROTOCOL___BKAssetPresenting));

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "assetPresenterUpdateCloseTypeState", (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setupStatusBar
{
  -[_BKBaseSceneController _setupStatusBarBlurBackground](self, "_setupStatusBarBlurBackground");
}

- (void)setupRootViewController
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_opt_class(BKRootViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController bk_window](self, "bk_window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));
  v6 = BUDynamicCast(v3, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController rootBarCoordinator](self, "rootBarCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootViewController"));
  objc_msgSend(v9, "setRootViewController:", v8);

}

- (void)setUpgradeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_upgradeViewController, a3);
}

- (void)setBk_window:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKSceneController;
  v4 = a3;
  -[_BKBaseSceneController setBk_window:](&v6, "setBk_window:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController interactionCoordinator](self, "interactionCoordinator", v6.receiver, v6.super_class));
  objc_msgSend(v5, "setWindow:", v4);

}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (void)sceneWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController analyticsManager](self, "analyticsManager", a3));
  objc_msgSend(v4, "analyticsStartSession");

  -[_BKBaseSceneController _interruptReadAloud:](self, "_interruptReadAloud:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController _sceneManager](self, "_sceneManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController welcomePresenter](self, "welcomePresenter"));
  objc_msgSend(v5, "_setCurrentWelcomePresenterIfNeeded:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController launchCoordinator](self, "launchCoordinator"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000124BC;
  v8[3] = &unk_1008E77C8;
  v8[4] = self;
  objc_msgSend(v7, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 32, CFSTR("sceneWillEnterForeground"), v8);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController bk_window](self, "bk_window", a3));
  objc_msgSend(v3, "makeKeyAndVisible");

}

- (BKBookReaderInteractionCoordinator)interactionCoordinator
{
  return self->_interactionCoordinator;
}

- (BAAnalyticsController)ba_analyticsController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController analyticsManager](self, "analyticsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "analyticsController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  if (!v4)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKSceneController.m", 101, "-[BKSceneController ba_analyticsController]", "analyticsController.delegate", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationTracker"));

  if (!v5)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKSceneController.m", 102, "-[BKSceneController ba_analyticsController]", "analyticsController.applicationTracker", 0);
  return (BAAnalyticsController *)v3;
}

- (id)analyticsManagerLibrary:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainLibrary"));

  return v4;
}

- (BKMainFlowController)_mainFlowControllerIfCreated
{
  return self->_mainFlowController;
}

- (void)saveStateClosing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKSceneController mainFlowController](self, "mainFlowController"));
  objc_msgSend(v4, "saveStateClosing:", v3);

}

- (id)_mainViewControllerForModalPresenting
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController rootBarCoordinator](self, "rootBarCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController bk_window](self, "bk_window"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootViewController"));

  }
  return v6;
}

- (BSUINativeFeedCardsPresenting)feedCardPresenting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController rootBarCoordinator](self, "rootBarCoordinator"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController rootBarCoordinator](self, "rootBarCoordinator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedNavigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController flowControllerModalPresentingViewController](self, "flowControllerModalPresentingViewController"));
  }

  return (BSUINativeFeedCardsPresenting *)v6;
}

- (id)screen
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController scene](self, "scene"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController scene](self, "scene"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screen"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  }

  return v5;
}

- (id)ubiquityStatusMonitor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ubiquityStatusMonitor"));

  return v3;
}

- (void)_showWelcomeScreen:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  BKWelcomeNavigationController *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  BKWelcomeNavigationController *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController genericPresenting](self, "genericPresenting"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presenterModalPresentingViewController"));
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController rootBarCoordinator](self, "rootBarCoordinator"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rootViewController"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentedViewController"));

  if (v13)
  {
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentedViewController"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "presentedViewController"));
      v11 = v14;
    }
    while (v15);
  }
  else
  {
    v14 = v11;
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000802D8;
  v29[3] = &unk_1008E7840;
  v16 = v14;
  v30 = v16;
  v17 = v7;
  v32 = v17;
  v18 = v6;
  v31 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "welcomeScreenViewControllerWithCompletion:", v29));
  v20 = BCSceneLog(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v18;
    v35 = 2112;
    v36 = v16;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Showing the welcome screen for %@ on presenter %@", buf, 0x16u);
  }

  v22 = -[BKWelcomeNavigationController initWithRootViewController:]([BKWelcomeNavigationController alloc], "initWithRootViewController:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeNavigationController navigationBar](v22, "navigationBar"));
  objc_msgSend(v23, "setHidden:", 1);

  -[BKWelcomeNavigationController setModalPresentationStyle:](v22, "setModalPresentationStyle:", 2);
  -[BKWelcomeNavigationController setModalTransitionStyle:](v22, "setModalTransitionStyle:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeNavigationController presentationController](v22, "presentationController"));
  objc_msgSend(v24, "setDelegate:", self);

  -[BKWelcomeNavigationController setBkDelegate:](v22, "setBkDelegate:", self);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "transitionCoordinator"));
  if (v25)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000803A0;
    v26[3] = &unk_1008E7868;
    v27 = v16;
    v28 = v22;
    objc_msgSend(v25, "animateAlongsideTransition:completion:", 0, v26);

  }
  else
  {
    objc_msgSend(v16, "presentViewController:withTransition:completion:", v22, 0, 0);
  }

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (CGSize)preferredContentSizeForNavigationController:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "viewControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  objc_msgSend(v4, "preferredContentSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)analyticsManagerSceneManager:(id)a3
{
  return +[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager", a3);
}

- (void)analyticsManagerForceEndSession:(id)a3
{
  -[BKSceneController analyticsManagerForceEndSession:reason:](self, "analyticsManagerForceEndSession:reason:", a3, 3);
}

- (void)analyticsManagerForceEndSession:(id)a3 reason:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD block[4];
  _QWORD *v10;
  _QWORD v11[4];
  id v12;
  id v13[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100080570;
  v11[3] = &unk_1008E7890;
  objc_copyWeak(v13, &location);
  v7 = v6;
  v12 = v7;
  v13[1] = (id)a4;
  v8 = objc_retainBlock(v11);
  if (v8)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v8[2])(v8);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100080644;
      block[3] = &unk_1008E7818;
      v10 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

}

- (void)analyticsManagerDidRestoreSession:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager", a3));
  objc_msgSend(v3, "analyticsVisibilityUpdate");

}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  return +[BKCrossFadeTransition transitionWithDuration:](BKCrossFadeTransition, "transitionWithDuration:", a3, a4, a5, a6, 0.1);
}

- (BOOL)sceneSupportsMinifiedPresenting
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController rootBarCoordinator](self, "rootBarCoordinator"));
  v3 = v2 != 0;

  return v3;
}

- (void)setupPlaceholderWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController bk_window](self, "bk_window"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate anySceneController](BKAppDelegate, "anySceneController"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scene"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController screen](self, "screen"));
    objc_msgSend(v5, "setWantsSoftwareDimming:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController _windowWithScene:sceneType:](self, "_windowWithScene:sceneType:", v7, -[_BKBaseSceneController sceneType](self, "sceneType")));
    -[BKSceneController _setupWithWindow:](self, "_setupWithWindow:", v6);
    objc_msgSend(v6, "setHidden:", 1);

  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  BKSceneController *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController bk_window](self, "bk_window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rootViewController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKSceneHosting));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController bk_window](self, "bk_window"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKBookPresenting));

  v10 = -[_BKBaseSceneController newShowAssetTransaction](self, "newShowAssetTransaction");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentAssetPresentersForSingleSceneWithTransaction:", v10));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i), "assetPresenterPrepareForTermination");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v13);
  }
  objc_msgSend(v5, "setHidden:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController _sceneManager](self, "_sceneManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController welcomePresenter](self, "welcomePresenter"));
  objc_msgSend(v16, "_welcomePresenterDidDisconnect:", v17);

  if ((id)-[_BKBaseSceneController sceneType](self, "sceneType") == (id)2)
  {
    v18 = v29;
    objc_msgSend(v29, "didDisconnectScene:", v4);
    -[BKSceneController setBk_window:](self, "setBk_window:", 0);
LABEL_14:
    -[_BKBaseSceneController setScene:](self, "setScene:", 0);
    goto LABEL_15;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController rootBarCoordinator](self, "rootBarCoordinator"));
  v18 = v29;
  if (v19)
  {

LABEL_13:
    objc_msgSend(v29, "didDisconnectScene:", v4);
    goto LABEL_14;
  }
  if ((id)-[_BKBaseSceneController sceneType](self, "sceneType") == (id)3)
    goto LABEL_13;
  v27 = v5;
  v28 = v4;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v20 = v11;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "assetPresenterAssetID", v27));
        objc_msgSend(v9, "requestOpenBookMinified:transaction:force:", v26, v10, 1);

        objc_msgSend(v25, "assetPresenterPrepareForDismissal");
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v22);
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100080B28;
  v30[3] = &unk_1008E78B8;
  v31 = v20;
  v18 = v29;
  v32 = v29;
  v4 = v28;
  v33 = v28;
  v5 = v27;
  v34 = v27;
  v35 = self;
  objc_msgSend(v9, "closeAllPresentersForSingleSceneWithTransaction:animated:completion:", v10, 0, v30);

LABEL_15:
}

- (void)sceneDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[_BKBaseSceneController _interruptReadAloud:](self, "_interruptReadAloud:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController analyticsManager](self, "analyticsManager"));
  -[BKSceneController analyticsManagerForceEndSession:reason:](self, "analyticsManagerForceEndSession:reason:", v4, 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController launchCoordinator](self, "launchCoordinator"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100080D44;
  v6[3] = &unk_1008E77C8;
  v6[4] = self;
  objc_msgSend(v5, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 32, CFSTR("sceneDidEnterBackground"), v6);

}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSTimer *rotationToSupportedTimer;
  uint8_t v21[16];

  v8 = a3;
  v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController rootBarCoordinator](self, "rootBarCoordinator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitCollection"));
  objc_msgSend(v10, "windowSceneTraitCollectionDidChangeFrom:to:", v9, v11);

  if ((id)-[_BKBaseSceneController sceneType](self, "sceneType") == (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyWindow"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rootViewController"));
    v14 = (unint64_t)objc_msgSend(v13, "supportedInterfaceOrientations");
    v15 = v14 & (1 << (char)objc_msgSend(v8, "interfaceOrientation"));

    if (v15)
    {
      v17 = BCSceneLog(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "BKSceneController: UIKit rotated to the supported orientation", v21, 2u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController launchCoordinator](self, "launchCoordinator"));
      objc_msgSend(v19, "signalConditionSatisfied:", 7);

      -[NSTimer invalidate](self->_rotationToSupportedTimer, "invalidate");
      rotationToSupportedTimer = self->_rotationToSupportedTimer;
      self->_rotationToSupportedTimer = 0;

    }
  }

}

- (void)handleCreateSceneUserActivityWhenReady:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = objc_opt_class(NSString);
  v6 = BCContinuationActivityAssetIDKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", BCContinuationActivityAssetIDKey));
  v8 = BUDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (objc_msgSend(v9, "length"))
  {
    -[BKSceneController setRequestAssetID:](self, "setRequestAssetID:", v9);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v6);
  }
  v10 = objc_opt_class(NSString);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", BCBookDisplayTitle));
  v12 = BUDynamicCast(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (objc_msgSend(v13, "length"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, BCBookDisplayTitle);
  -[BKSceneController _handleOpenBookActivityWithAssetID:isStateRestoration:](self, "_handleOpenBookActivityWithAssetID:isStateRestoration:", v9, 0);

}

- (void)handleStateRestorationFromData:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = BCContinuationActivityAssetIDKey;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));
  -[BKSceneController setRequestAssetID:](self, "setRequestAssetID:", v6);

  v7.receiver = self;
  v7.super_class = (Class)BKSceneController;
  -[_BKBaseSceneController handleStateRestorationFromData:](&v7, "handleStateRestorationFromData:", v5);

}

- (id)_optionsForContinueOpenBookActivity:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  __CFString **v9;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKSceneController;
  v5 = -[_BKBaseSceneController _optionsForContinueOpenBookActivity:](&v11, "_optionsForContinueOpenBookActivity:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v6, "mutableCopy");

  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController rootBarCoordinator](self, "rootBarCoordinator"));

    v9 = off_1008EAA38;
    if (v8)
      v9 = off_1008EAA20;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, *v9);
  }
  return v7;
}

- (void)_handleOpenBookActivityWithAssetID:(id)a3 isStateRestoration:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BKSceneController *v11;
  BOOL v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController launchCoordinator](self, "launchCoordinator"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008123C;
  v9[3] = &unk_1008E78E0;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 65, CFSTR("_handleOpenBookActivityWithAssetID"), v9);

}

- (id)dataForStateRestoration
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BKSceneController;
  v3 = -[_BKBaseSceneController dataForStateRestoration](&v15, "dataForStateRestoration");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController rootBarCoordinator](self, "rootBarCoordinator"));
  if (!v6)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[BKSceneController requestAssetID](self, "requestAssetID"));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = BCContinuationActivityAssetIDKey;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCContinuationActivityAssetIDKey));

      if (!v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController requestAssetID](self, "requestAssetID"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v12);

      }
    }
  }
  if ((id)-[_BKBaseSceneController sceneType](self, "sceneType") == (id)3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController userInfoForStateRestoration](self, "userInfoForStateRestoration"));
    v8 = objc_msgSend(v7, "copy");

    v5 = v8;
  }
  return v5;
}

- (BOOL)isHostingRootBar
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController rootBarCoordinator](self, "rootBarCoordinator"));
  v3 = v2 != 0;

  return v3;
}

- (id)flowControllerModalPresentingViewController
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKSceneController rootViewController](self, "rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));
  v4 = objc_opt_class(UIViewController);
  v5 = BUClassAndProtocolCast(v3, v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
  {
    v7 = v6;

    v2 = v7;
  }

  return v2;
}

- (void)storeDidAttemptSignOut:(id)a3
{
  _QWORD block[5];

  if ((id)-[_BKBaseSceneController sceneType](self, "sceneType", a3) == (id)2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000814C4;
    block[3] = &unk_1008E72C0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (NSString)requestAssetID
{
  return self->_requestAssetID;
}

- (void)setRequestAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (UIView)statusBarFade
{
  return self->_statusBarFade;
}

- (void)setStatusBarFade:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarFade, a3);
}

- (NSDictionary)userInfoForStateRestoration
{
  return self->_userInfoForStateRestoration;
}

- (void)setUserInfoForStateRestoration:(id)a3
{
  objc_storeStrong((id *)&self->_userInfoForStateRestoration, a3);
}

- (BKAnalyticsSessionHost)analyticsSessionHost
{
  return self->_analyticsSessionHost;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsSessionHost, 0);
  objc_storeStrong((id *)&self->_interactionCoordinator, 0);
  objc_storeStrong((id *)&self->_userInfoForStateRestoration, 0);
  objc_storeStrong((id *)&self->_upgradeViewController, 0);
  objc_storeStrong((id *)&self->_statusBarFade, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_requestAssetID, 0);
  objc_storeStrong((id *)&self->_mainFlowController, 0);
  objc_storeStrong((id *)&self->_rotationToSupportedTimer, 0);
}

- (BKMachineAuthorizationService)machineAuthorizationService
{
  BKSceneController *v2;
  id v3;

  v2 = self;
  v3 = sub_1006511E0();

  return (BKMachineAuthorizationService *)v3;
}

@end
