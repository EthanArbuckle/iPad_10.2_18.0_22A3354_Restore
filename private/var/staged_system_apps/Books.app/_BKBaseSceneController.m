@implementation _BKBaseSceneController

- (UIWindow)bk_window
{
  return self->_bk_window;
}

- (UIWindowScene)scene
{
  return self->_scene;
}

- (void)welcomePresenterFinishOngoingModalTransitionAnimations:(id)a3
{
  void (**v4)(id);
  void *v5;
  void (**v6)(id);
  id v7;

  v4 = (void (**)(id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController _viewControllerForWelcomePresenting](self, "_viewControllerForWelcomePresenting"));
  v7 = v5;
  if (v5)
  {
    objc_msgSend(v5, "im_finishOngoingModalTransitionAnimations:", v4);
  }
  else
  {
    v6 = objc_retainBlock(v4);

    if (v6)
      v6[2](v6);
    v4 = v6;
  }

}

- (id)_viewControllerForWelcomePresenting
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController bk_window](self, "bk_window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));

  return v3;
}

- (unint64_t)sceneType
{
  return self->_sceneType;
}

- (BOOL)willAttemptBookReopen
{
  return self->_willAttemptBookReopen;
}

- (UIViewController)welcomeViewController
{
  return self->_welcomeViewController;
}

- (BCStatusBarBackgroundController)statusBarBackgroundController
{
  return self->_statusBarBackgroundController;
}

- (void)setWelcomeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_welcomeViewController, a3);
}

- (void)setStatusBarBackgroundController:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarBackgroundController, a3);
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (void)setLaunchCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_launchCoordinator, a3);
}

- (void)setCriticalAlertCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_criticalAlertCoordinator, a3);
}

- (void)setBk_window:(id)a3
{
  objc_storeStrong((id *)&self->_bk_window, a3);
}

- (BKAppLaunchCoordinator)launchCoordinator
{
  return self->_launchCoordinator;
}

- (BOOL)isStateRestorationDisabled
{
  void *v3;

  v3 = (void *)objc_opt_class(self);
  return _objc_msgSend(v3, "isStateRestorationDisabledForSceneType:", -[_BKBaseSceneController sceneType](self, "sceneType"));
}

- (_BKBaseSceneController)initWithSceneType:(unint64_t)a3
{
  _BKBaseSceneController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_BKBaseSceneController;
  result = -[_BKBaseSceneController init](&v5, "init");
  if (result)
    result->_sceneType = a3;
  return result;
}

- (void)dismissWelcomeViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController _viewControllerForWelcomePresenting](self, "_viewControllerForWelcomePresenting"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentedViewController"));
  v9 = BCSceneLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    v20 = 2114;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_BKBaseSceneController: dismissWelcomeViewControllerAnimated: presenter: %{public}@ presented: %{public}@", buf, 0x16u);
  }

  v11 = objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController welcomeViewController](self, "welcomeViewController"));
  if (v11
    && (v12 = (void *)v11,
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController welcomeViewController](self, "welcomeViewController")),
        v13,
        v12,
        v8 == v13))
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000C51C0;
    v16[3] = &unk_1008E7680;
    v16[4] = self;
    v17 = v6;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v4, v16);

  }
  else
  {
    -[_BKBaseSceneController setWelcomeViewController:](self, "setWelcomeViewController:", 0);
    v14 = objc_retainBlock(v6);
    v15 = v14;
    if (v14)
      (*((void (**)(id))v14 + 2))(v14);

  }
}

- (id)_windowWithScene:(id)a3 sceneType:(unint64_t)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screen"));
  objc_msgSend(v5, "setWantsSoftwareDimming:", 1);

  v6 = objc_msgSend(objc_alloc((Class)BSUIWindow), "initWithWindowScene:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v6, "setOpaque:", 0);
  return v6;
}

- (void)_setupStatusBarBlurBackground
{
  id v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController bk_window](self, "bk_window"));
  v3 = objc_msgSend(objc_alloc((Class)BCStatusBarBackgroundController), "initWithWindow:", v5);
  -[_BKBaseSceneController setStatusBarBackgroundController:](self, "setStatusBarBackgroundController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController statusBarBackgroundController](self, "statusBarBackgroundController"));
  objc_msgSend(v4, "setup");

}

- (void)_interruptReadAloud:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController launchCoordinator](self, "launchCoordinator"));
  if (objc_msgSend(v5, "appLaunchCoordinatorIsConditionSatisfied:", 6))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100063DA4;
    v6[3] = &unk_1008E9C48;
    v6[4] = self;
    v7 = a3;
    objc_msgSend(v5, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 1, CFSTR("Interrupt ReadAloud"), v6);
  }

}

- (void)_doInterruptReadAloud:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;

  v3 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController bk_window](self, "bk_window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rootViewController"));
  if (!v5)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/_BKBaseSceneController.m", 261, "-[_BKBaseSceneController _doInterruptReadAloud:]", "rootViewController", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKBookPresenting));
  if (!v6)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/_BKBaseSceneController.m", 264, "-[_BKBaseSceneController _doInterruptReadAloud:]", "bookPresenter", 0);
  v7 = BUProtocolCast(&OBJC_PROTOCOL___BKSceneControlling, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/_BKBaseSceneController.m", 267, "-[_BKBaseSceneController _doInterruptReadAloud:]", "sceneController", 0);
  v9 = objc_opt_class(BKBookViewController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bookPresenterCurrentlyOpenBookForSingleScene:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetPresenterAssetViewController"));
  v12 = BUDynamicCast(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "book"));
    v15 = objc_msgSend(v14, "hasMediaOverlayElements");

    if (v3)
    {
      if (v15)
        objc_msgSend(v13, "pauseReadAloud");
      objc_msgSend(v13, "stopSoundtrack");
      objc_msgSend(v13, "stopPlayingMedia:", 0);
    }
    else
    {
      if (v15)
        objc_msgSend(v13, "resumeReadAloud");
      objc_msgSend(v13, "playCurrentSoundtrack");
    }
  }

}

+ (id)sceneInfoFromSceneSession:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _BKBaseSceneInfo *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_lastKnownStateRestorationUserInfoForSceneSession:", v3));

  v6 = -[_BKBaseSceneInfo initWithSceneSession:userData:]([_BKBaseSceneInfo alloc], "initWithSceneSession:userData:", v3, v5);
  return v6;
}

+ (BOOL)isStateRestorationDisabledForSceneType:(unint64_t)a3
{
  return +[BKSceneFlowController isStateRestorationDisabledForThisLaunch](BKSceneFlowController, "isStateRestorationDisabledForThisLaunch", a3);
}

- (id)newTransactionWithName:(id)a3
{
  return -[_BKBaseSceneController newTransactionWithName:targetSceneDescriptor:](self, "newTransactionWithName:targetSceneDescriptor:", a3, 0);
}

- (id)newTransactionWithName:(id)a3 targetSceneDescriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v9 = objc_msgSend(v8, "newTransactionWithName:originatingSceneController:targetSceneDescriptor:", v7, self, v6);

  return v9;
}

- (id)newShowAssetTransactionWithTargetSceneDescriptor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v6 = objc_msgSend(v5, "newShowAssetTransactionWithOriginatingSceneController:targetSceneDescriptor:", self, v4);

  return v6;
}

- (id)newShowAssetTransaction
{
  return -[_BKBaseSceneController newShowAssetTransactionWithTargetSceneDescriptor:](self, "newShowAssetTransactionWithTargetSceneDescriptor:", 0);
}

- (id)newShowURLTransactionWithTargetSceneDescriptor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v6 = objc_msgSend(v5, "newShowURLTransactionWithOriginatingSceneController:targetSceneDescriptor:", self, v4);

  return v6;
}

- (id)newShowURLTransaction
{
  return -[_BKBaseSceneController newShowURLTransactionWithTargetSceneDescriptor:](self, "newShowURLTransactionWithTargetSceneDescriptor:", 0);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  int v6;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  char v19;
  uint8_t buf[4];
  id v21;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = BCSceneLog(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "_BKBaseSceneController: presentViewController: %{public}@", buf, 0xCu);
  }

  if (v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController launchCoordinator](self, "launchCoordinator"));
    LOBYTE(v6) = objc_msgSend(v12, "appLaunchCoordinatorHasAppLaunched");

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController launchCoordinator](self, "launchCoordinator"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000C3730;
  v16[3] = &unk_1008E96C0;
  v16[4] = self;
  v17 = v8;
  v19 = v6;
  v18 = v9;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v13, "appLaunchCoordinatorPerformWhenLaunched:block:", CFSTR("presentVC"), v16);

}

- (void)presentModalViewController:(id)a3 animated:(BOOL)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;

  v5 = a3;
  v6 = BCSceneLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_BKBaseSceneController: presentModalViewController: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController _viewControllerFromWhichToPresentAlerts](self, "_viewControllerFromWhichToPresentAlerts"));
  objc_msgSend(v8, "presentModalViewController:withTransition:", v5, 8);

}

- (BCExternalURLOpenPrompter)externalURLOpenPrompter
{
  BCExternalURLOpenPrompter *externalURLOpenPrompter;
  id v4;
  void *v5;
  BCExternalURLOpenPrompter *v6;
  BCExternalURLOpenPrompter *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  externalURLOpenPrompter = self->_externalURLOpenPrompter;
  if (!externalURLOpenPrompter)
  {
    v4 = objc_alloc((Class)BCExternalURLOpenPrompter);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BCExternalURLOpenPrompterContext sharedContextForOpening](BCExternalURLOpenPrompterContext, "sharedContextForOpening"));
    v6 = (BCExternalURLOpenPrompter *)objc_msgSend(v4, "initWithContext:", v5);
    v7 = self->_externalURLOpenPrompter;
    self->_externalURLOpenPrompter = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Leave Books and open this link?"), &stru_10091C438, 0));
    -[BCExternalURLOpenPrompter setPromptTitle:](self->_externalURLOpenPrompter, "setPromptTitle:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_10091C438, 0));
    -[BCExternalURLOpenPrompter setCancelButtonTitle:](self->_externalURLOpenPrompter, "setCancelButtonTitle:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Open"), &stru_10091C438, 0));
    -[BCExternalURLOpenPrompter setOkButtonTitle:](self->_externalURLOpenPrompter, "setOkButtonTitle:", v13);

    -[BCExternalURLOpenPrompter setDelegate:](self->_externalURLOpenPrompter, "setDelegate:", self);
    externalURLOpenPrompter = self->_externalURLOpenPrompter;
  }
  return externalURLOpenPrompter;
}

- (BCExternalURLOpenPrompter)externalURLLoadPrompter
{
  BCExternalURLOpenPrompter *externalURLLoadPrompter;
  BCExternalURLOpenPrompter *v4;
  BCExternalURLOpenPrompter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  externalURLLoadPrompter = self->_externalURLLoadPrompter;
  if (!externalURLLoadPrompter)
  {
    v4 = (BCExternalURLOpenPrompter *)objc_alloc_init((Class)BCExternalURLOpenPrompter);
    v5 = self->_externalURLLoadPrompter;
    self->_externalURLLoadPrompter = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Allow Online Content?"), &stru_10091C438, 0));
    -[BCExternalURLOpenPrompter setPromptTitle:](self->_externalURLLoadPrompter, "setPromptTitle:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("This book needs to access online content, or it may not display as the publisher intended."), &stru_10091C438, 0));
    -[BCExternalURLOpenPrompter setPromptMessage:](self->_externalURLLoadPrompter, "setPromptMessage:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Don’t Allow"), &stru_10091C438, 0));
    -[BCExternalURLOpenPrompter setCancelButtonTitle:](self->_externalURLLoadPrompter, "setCancelButtonTitle:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Allow"), &stru_10091C438, 0));
    -[BCExternalURLOpenPrompter setOkButtonTitle:](self->_externalURLLoadPrompter, "setOkButtonTitle:", v13);

    -[BCExternalURLOpenPrompter setCacheResponses:](self->_externalURLLoadPrompter, "setCacheResponses:", 0);
    -[BCExternalURLOpenPrompter setDelegate:](self->_externalURLLoadPrompter, "setDelegate:", self);
    externalURLLoadPrompter = self->_externalURLLoadPrompter;
  }
  return externalURLLoadPrompter;
}

- (id)_viewControllerFromWhichToPresentAlerts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController bk_window](self, "bk_window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bc_deepestPresentedViewController"));

  if (objc_msgSend(v4, "isBeingDismissed"))
  {
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewController"));

      v4 = v5;
    }
    while ((objc_msgSend(v5, "isBeingDismissed") & 1) != 0);
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (id)_lastOpenBookManager
{
  return +[BKLastOpenBookManager sharedInstance](BKLastOpenBookManager, "sharedInstance");
}

- (BKSceneInfo)sceneInfo
{
  void *v3;
  void *v4;
  _BKBaseSceneInfo *v5;
  void *v6;
  void *v7;
  _BKBaseSceneInfo *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController scene](self, "scene"));

  if (!v3)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/_BKBaseSceneController.m", 297, "-[_BKBaseSceneController sceneInfo]", "self.scene", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController dataForStateRestoration](self, "dataForStateRestoration"));
  v5 = [_BKBaseSceneInfo alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController scene](self, "scene"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
  v8 = -[_BKBaseSceneInfo initWithSceneSession:userData:](v5, "initWithSceneSession:userData:", v7, v4);

  v9 = BUProtocolCast(&OBJC_PROTOCOL___BKSceneControlling, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[_BKBaseSceneInfo setSceneController:](v8, "setSceneController:", v10);

  return (BKSceneInfo *)v8;
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;

  v5 = a4;
  v6 = BCSceneLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = 138543362;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "scene willContinueUserActivityWithType: Preparing for activity with type %{public}@", (uint8_t *)&v11, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKUserActivityManager sharedInstance](BKUserActivityManager, "sharedInstance"));
  v9 = BUProtocolCast(&OBJC_PROTOCOL___BKSceneControlling, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v8, "willContinueActivityWithType:sceneController:", v5, v10);

}

- (BOOL)willContinueActivityWithType:(id)a3 sceneController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController scene](self, "scene"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stateRestorationActivity"));
  if (v8 && objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.iBooks.sceneStateRestoration")))
    v9 = !-[_BKBaseSceneController isStateRestorationDisabled](self, "isStateRestorationDisabled");
  else
    LOBYTE(v9) = 0;

  return v9;
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  v5 = a4;
  v6 = BCSceneLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "scene continueUserActivity: Handling activity activityType=%{public}@, userInfo=%@", (uint8_t *)&v13, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKUserActivityManager sharedInstance](BKUserActivityManager, "sharedInstance"));
  v11 = BUProtocolCast(&OBJC_PROTOCOL___BKSceneControlling, self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v10, "continueActivity:sceneController:", v5, v12);

}

- (BOOL)continueActivity:(id)a3 sceneController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  unsigned __int8 v10;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.iBooks.sceneStateRestoration"));
  if (!v9)
  {
LABEL_6:

    goto LABEL_7;
  }
  v10 = -[_BKBaseSceneController isStateRestorationDisabled](self, "isStateRestorationDisabled");

  if ((v10 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
    -[_BKBaseSceneController handleStateRestorationFromData:](self, "handleStateRestorationFromData:", v8);
    goto LABEL_6;
  }
LABEL_4:
  LOBYTE(v9) = 0;
LABEL_7:

  return v9;
}

- (void)_handleStateRestorationCompleted
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController scene](self, "scene"));
  objc_msgSend(v4, "_didFinishSceneStateRestoration:", v3);

}

- (void)handleStateRestorationFromData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _DWORD v27[2];

  v4 = a3;
  if (-[_BKBaseSceneController handledStateRestoration](self, "handledStateRestoration"))
    goto LABEL_16;
  -[_BKBaseSceneController setHandledStateRestoration:](self, "setHandledStateRestoration:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", BCContinuationActivityAssetIDKey));
  if (!v5)
    goto LABEL_10;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController _lastOpenBookManager](self, "_lastOpenBookManager"));
  v7 = objc_msgSend(v6, "shouldAutoOpenAsset:", v5);

  v9 = BCSceneLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v27[0] = 67109120;
    v27[1] = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "handleStateRestorationFromData: lastKnownSuccessfullyOpenedBook=%d", (uint8_t *)v27, 8u);
  }

  if (!v7)
  {
    v13 = BCSceneLog(v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10069F1E8((uint64_t)v5, v14, v15, v16, v17, v18, v19, v20);

LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v12 = 1;
  -[_BKBaseSceneController setWillAttemptBookReopen:](self, "setWillAttemptBookReopen:", 1);
  -[_BKBaseSceneController _handleOpenBookActivityWithAssetID:isStateRestoration:](self, "_handleOpenBookActivityWithAssetID:isStateRestoration:", v5, 1);
LABEL_11:
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", BCBookDisplayTitle));

  if (v21)
  {
    v22 = objc_opt_class(NSString);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", BCBookDisplayTitle));
    v24 = BUDynamicCast(v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController scene](self, "scene"));
    objc_msgSend(v26, "setTitle:", v25);

  }
  if ((v12 & 1) == 0)
    -[_BKBaseSceneController _handleStateRestorationCompleted](self, "_handleStateRestorationCompleted");

LABEL_16:
}

- (void)_handleOpenBookActivityWithAssetID:(id)a3 isStateRestoration:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _BKBaseSceneController *v11;
  BOOL v12;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C4324;
  v8[3] = &unk_1008E9C70;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController launchCoordinator](self, "launchCoordinator"));
  v11 = self;
  v12 = a4;
  v6 = v10;
  v7 = v9;
  objc_msgSend(v6, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 1, CFSTR("handle openBookActivity"), v8);

}

- (id)_optionsForContinueOpenBookActivity:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, AEAudiobookOptionsShouldNotAutoplayKey);
  return v5;
}

- (BOOL)_assetSupportsSnapshots:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "libraryAssetOnMainQueueWithAssetID:", v3));

    v6 = +[BKAssetUtilities supportsRestorationSnapshots:](BKAssetUtilities, "supportsRestorationSnapshots:", objc_msgSend(v5, "contentType"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_continueOpenBookActivity:(id)a3 assetLogID:(id)a4 isStateRestoration:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BKRestorationScrimView *v15;
  BKRestorationScrimView *v16;
  _QWORD v17[5];
  BKRestorationScrimView *v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController bk_window](self, "bk_window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL____BKEnqueuedBookPresenting));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController _optionsForContinueOpenBookActivity:](self, "_optionsForContinueOpenBookActivity:", v5));
  v14 = objc_msgSend(v13, "mutableCopy");

  if (-[_BKBaseSceneController _assetSupportsSnapshots:](self, "_assetSupportsSnapshots:", v8))
  {
    v15 = -[BKRestorationScrimView initWithAssetID:window:]([BKRestorationScrimView alloc], "initWithAssetID:window:", v8, v10);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("BKBookPresentWithoutAnimations"));
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, AEAssetLogID);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000C4758;
  v17[3] = &unk_1008E9C98;
  v19 = v20;
  v17[4] = self;
  v16 = v15;
  v18 = v16;
  objc_msgSend(v12, "enqueueShowAssetWithTransactionProvider:assetID:location:options:completion:", self, v8, 0, v14, v17);
  -[BKRestorationScrimView show](v16, "show");

  _Block_object_dispose(v20, 8);
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v6 = BCSceneLog(self);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "scene: Failure to get activity", v8, 2u);
  }

  -[_BKBaseSceneController _handleStateRestorationCompleted](self, "_handleStateRestorationCompleted");
}

- (id)dataForStateRestoration
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("BKSceneInfoIsAudiobookKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("BKSceneInfoIsSupplementalContentKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController launchCoordinator](self, "launchCoordinator"));
  v5 = objc_msgSend(v4, "appLaunchCoordinatorIsConditionSatisfied:", 0);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController bk_window](self, "bk_window"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKBookPresenting));

    v9 = BUProtocolCast(&OBJC_PROTOCOL___BKSceneControlling, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bookPresenterCurrentlyOpenBookForSingleScene:", v10));
    v12 = v11;
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetPresenterAssetID"));
      if (v13)
      {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, BCContinuationActivityAssetIDKey);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v12, "assetPresenterIsAudiobook")));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("BKSceneInfoIsAudiobookKey"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v12, "isSupplementalContent")));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("BKSceneInfoIsSupplementalContentKey"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetPresenterAssetViewController"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "asset"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "displayTitle"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, BCBookDisplayTitle);

      }
    }

  }
  return v3;
}

- (id)stateRestorationActivityForScene:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  unint64_t v27;
  __int16 v28;
  void *v29;

  v4 = -[_BKBaseSceneController isStateRestorationDisabled](self, "isStateRestorationDisabled", a3);
  if (v4)
  {
    v5 = BCSceneLog(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 134217984;
      v27 = -[_BKBaseSceneController sceneType](self, "sceneType");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not Saving Scene activity for scene type=%lu", (uint8_t *)&v26, 0xCu);
    }

    return 0;
  }
  else if ((id)-[_BKBaseSceneController sceneType](self, "sceneType") == (id)2)
  {
    return objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.iBooks.sceneStateRestorationForAccountInfo"));
  }
  else
  {
    v8 = -[_BKBaseSceneController sceneType](self, "sceneType");
    v9 = objc_alloc((Class)NSUserActivity);
    if (v8 == 3)
    {
      v10 = objc_msgSend(v9, "initWithActivityType:", CFSTR("com.apple.iBooks.sceneStateRestorationForEndOfBook"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController dataForStateRestoration](self, "dataForStateRestoration"));
      objc_msgSend(v10, "setUserInfo:", v11);
    }
    else
    {
      v10 = objc_msgSend(v9, "initWithActivityType:", CFSTR("com.apple.iBooks.sceneStateRestoration"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController dataForStateRestoration](self, "dataForStateRestoration"));
      objc_msgSend(v10, "setUserInfo:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", BCContinuationActivityAssetIDKey));

      v14 = objc_opt_class(NSNumber);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("BKSceneInfoIsSupplementalContentKey")));
      v17 = BUDynamicCast(v14, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = objc_msgSend(v18, "BOOLValue");

      if (v13 && (v19 & 1) == 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController _lastOpenBookManager](self, "_lastOpenBookManager"));
        objc_msgSend(v21, "updateSuccessfullyOpenedBookForAssetID:successfullyOpenedBook:", v13, 1);

      }
      v22 = BCSceneLog(v20);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityType"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
        v26 = 138543618;
        v27 = (unint64_t)v24;
        v28 = 2112;
        v29 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Scene save user activity: activityType=%{public}@, userInfo=%@", (uint8_t *)&v26, 0x16u);

      }
    }

    return v10;
  }
}

- (void)presentAlertController:(id)a3 promptContext:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a3;
  v6 = BCSceneLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_BKBaseSceneController: presentAlertController: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[_BKBaseSceneController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v9 = BUProtocolCast(&OBJC_PROTOCOL___BKSceneControlling, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v11, "performActionForShortcutItem:sceneController:completionHandler:", v8, v10, v7);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKSceneUtilities URLContextOpenURLOptions:](BKSceneUtilities, "URLContextOpenURLOptions:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
        -[_BKBaseSceneController openURL:options:](self, "openURL:options:", v12, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)openURL:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = BUProtocolCast(&OBJC_PROTOCOL___BKSceneControlling, self);
  v10 = (id)objc_claimAutoreleasedReturnValue(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  objc_msgSend(v9, "applicationOpenURL:options:sceneController:", v7, v6, v10);

}

- (void)presentWelcomeViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = BCSceneLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_BKBaseSceneController: presentWelcomeViewController: %{public}@", buf, 0xCu);
  }

  -[_BKBaseSceneController setWelcomeViewController:](self, "setWelcomeViewController:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController _viewControllerForWelcomePresenting](self, "_viewControllerForWelcomePresenting"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController welcomeViewController](self, "welcomeViewController"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C518C;
  v13[3] = &unk_1008E7818;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v10, "presentViewController:animated:completion:", v11, 0, v13);

}

- (BOOL)welcomePresenterIsPresentingWelcome
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController _viewControllerForWelcomePresenting](self, "_viewControllerForWelcomePresenting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneController welcomeViewController](self, "welcomeViewController"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));
    v6 = v4 == v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_assetPresenters
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = BUProtocolCast(&OBJC_PROTOCOL___BKSceneControlling, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookFlowAssetPresenting"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presenterViewControllersConformingToProtocol:", &OBJC_PROTOCOL___BKAssetPresenting));
  return v5;
}

- (BKCriticalAlertCoordinating)criticalAlertCoordinator
{
  return self->_criticalAlertCoordinator;
}

- (void)setExternalURLOpenPrompter:(id)a3
{
  objc_storeStrong((id *)&self->_externalURLOpenPrompter, a3);
}

- (void)setExternalURLLoadPrompter:(id)a3
{
  objc_storeStrong((id *)&self->_externalURLLoadPrompter, a3);
}

- (void)setIsStateRestorationDisabled:(BOOL)a3
{
  self->_isStateRestorationDisabled = a3;
}

- (BOOL)handledStateRestoration
{
  return self->_handledStateRestoration;
}

- (void)setHandledStateRestoration:(BOOL)a3
{
  self->_handledStateRestoration = a3;
}

- (void)setWillAttemptBookReopen:(BOOL)a3
{
  self->_willAttemptBookReopen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarBackgroundController, 0);
  objc_storeStrong((id *)&self->_welcomeViewController, 0);
  objc_storeStrong((id *)&self->_externalURLLoadPrompter, 0);
  objc_storeStrong((id *)&self->_externalURLOpenPrompter, 0);
  objc_storeStrong((id *)&self->_criticalAlertCoordinator, 0);
  objc_storeStrong((id *)&self->_launchCoordinator, 0);
  objc_storeStrong((id *)&self->_bk_window, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
