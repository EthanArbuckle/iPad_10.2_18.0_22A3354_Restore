@implementation CHRootViewController

- (void)beginListeningForCloudStatusUpdates
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _HKInitializeLogging(self, a2);
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[cloud-restore] begin listening for health cloud restore status updates.", v5, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHRootViewController cloudSyncObserver](self, "cloudSyncObserver"));
  objc_msgSend(v4, "startSyncIfRestoreNotCompleted");

}

- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  id v10;

  v5 = a4;
  _HKInitializeLogging(v5, v6);
  v7 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[cloud-restore] Cloud sync observer sync failed with error: %@", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C4BC;
  block[3] = &unk_100777E20;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (CHRootViewController)initWithTabBarController:(id)a3 healthStore:(id)a4
{
  id v7;
  id v8;
  CHRootViewController *v9;
  CHRootViewController *v10;
  HKCloudSyncObserver *v11;
  HKCloudSyncObserver *cloudSyncObserver;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHRootViewController;
  v9 = -[CHRootViewController init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tabBarController, a3);
    v11 = (HKCloudSyncObserver *)objc_msgSend(objc_alloc((Class)HKCloudSyncObserver), "initWithHealthStore:delegate:", v8, v10);
    cloudSyncObserver = v10->_cloudSyncObserver;
    v10->_cloudSyncObserver = v11;

    -[CHRootViewController beginListeningForCloudStatusUpdates](v10, "beginListeningForCloudStatusUpdates");
  }

  return v10;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CHRootViewController;
  -[CHRootViewController viewWillLayoutSubviews](&v14, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHRootViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITabBarController view](self->_tabBarController, "view"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[UIStackView bounds](self->_cloudRestoreStackView, "bounds");
  -[CHRootViewController adjustSafeAreaInsetsWithHeight:](self, "adjustSafeAreaInsetsWithHeight:", v13);
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *overlayView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v35;
  objc_super v36;
  _QWORD v37[4];

  v36.receiver = self;
  v36.super_class = (Class)CHRootViewController;
  -[CHRootViewController viewDidLoad](&v36, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHRootViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITabBarController view](self->_tabBarController, "view"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[CHRootViewController addChildViewController:](self, "addChildViewController:", self->_tabBarController);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHRootViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UITabBarController view](self->_tabBarController, "view"));
  objc_msgSend(v13, "addSubview:", v14);

  -[UITabBarController didMoveToParentViewController:](self->_tabBarController, "didMoveToParentViewController:", self);
  v15 = (UIView *)objc_alloc_init((Class)UIView);
  overlayView = self->_overlayView;
  self->_overlayView = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UIView setBackgroundColor:](self->_overlayView, "setBackgroundColor:", v17);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_overlayView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setAlpha:](self->_overlayView, "setAlpha:", 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHRootViewController view](self, "view"));
  objc_msgSend(v18, "addSubview:", self->_overlayView);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_overlayView, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CHRootViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v37[0] = v32;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_overlayView, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CHRootViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v37[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_overlayView, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHRootViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  v37[2] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_overlayView, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHRootViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  v37[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

}

- (BOOL)prefersStatusBarHidden
{
  return self->_hidingStatusBar;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)completeCloudRestore
{
  _QWORD v2[5];
  _QWORD v3[5];

  if (self->_cloudRestoreStackView)
  {
    v2[4] = self;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000A0A40;
    v3[3] = &unk_100777E20;
    v3[4] = self;
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_1000A0A7C;
    v2[3] = &unk_100778DB0;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v3, v2, 0.4, 0.0);
  }
}

- (HKCloudSyncObserver)cloudSyncObserver
{
  return self->_cloudSyncObserver;
}

- (void)setActivitySetUp:(BOOL)a3
{
  if (self->_activitySetUp != a3)
    self->_activitySetUp = a3;
}

- (void)adjustSafeAreaInsetsWithHeight:(double)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITabBarController viewControllers](self->_tabBarController, "viewControllers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "additionalSafeAreaInsets");
        objc_msgSend(v8, "setAdditionalSafeAreaInsets:");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)hide
{
  NSObject *v3;
  uint8_t v4[16];

  _HKInitializeLogging(self, a2);
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[RootViewController] hiding root view controller", v4, 2u);
  }
  -[UIView setAlpha:](self->_overlayView, "setAlpha:", 1.0);
  self->_hidingStatusBar = 1;
  -[CHRootViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)unhide
{
  NSObject *v3;
  uint8_t v4[16];

  _HKInitializeLogging(self, a2);
  v3 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[RootViewController] showing root view controller", v4, 2u);
  }
  -[UIView setAlpha:](self->_overlayView, "setAlpha:", 0.0);
  self->_hidingStatusBar = 0;
  -[CHRootViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (id)_ppt_tabBarController
{
  return self->_tabBarController;
}

- (void)_setupCloudRestoreUI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIProgressView *v8;
  UIProgressView *progressView;
  id v10;
  UIProgressView *v11;
  void *v12;
  UIStackView *v13;
  UIStackView *cloudRestoreStackView;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v35;
  void *v36;
  _QWORD v37[2];

  v3 = objc_alloc_init((Class)UILabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
  objc_msgSend(v3, "setFont:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v3, "setTextColor:", v5);

  objc_msgSend(v3, "setNumberOfLines:", 0);
  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RESTORING_FROM_ICLOUD"), &stru_1007AE1D0, CFSTR("Localizable")));
  objc_msgSend(v3, "setText:", v7);

  objc_msgSend(v3, "setTextAlignment:", 1);
  v8 = (UIProgressView *)objc_alloc_init((Class)UIProgressView);
  progressView = self->_progressView;
  self->_progressView = v8;

  v10 = objc_alloc((Class)UIStackView);
  v11 = self->_progressView;
  v37[0] = v3;
  v37[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));
  v13 = (UIStackView *)objc_msgSend(v10, "initWithArrangedSubviews:", v12);
  cloudRestoreStackView = self->_cloudRestoreStackView;
  self->_cloudRestoreStackView = v13;

  -[UIStackView setAxis:](self->_cloudRestoreStackView, "setAxis:", 1);
  -[UIStackView setDistribution:](self->_cloudRestoreStackView, "setDistribution:", 0);
  -[UIStackView setAlignment:](self->_cloudRestoreStackView, "setAlignment:", 3);
  -[UIStackView setSpacing:](self->_cloudRestoreStackView, "setSpacing:", 8.0);
  -[UIStackView setBaselineRelativeArrangement:](self->_cloudRestoreStackView, "setBaselineRelativeArrangement:", 1);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_cloudRestoreStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setLayoutMargins:](self->_cloudRestoreStackView, "setLayoutMargins:", 11.5, 0.0, 11.5, 0.0);
  -[UIStackView setLayoutMarginsRelativeArrangement:](self->_cloudRestoreStackView, "setLayoutMarginsRelativeArrangement:", 1);
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UIStackView setBackgroundColor:](self->_cloudRestoreStackView, "setBackgroundColor:", v15);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIStackView setBackgroundColor:](self->_cloudRestoreStackView, "setBackgroundColor:", v16);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 10));
    v17 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v15);
    -[UIStackView bounds](self->_cloudRestoreStackView, "bounds");
    objc_msgSend(v17, "setFrame:");
    objc_msgSend(v17, "setAutoresizingMask:", 18);
    -[UIStackView insertSubview:atIndex:](self->_cloudRestoreStackView, "insertSubview:atIndex:", v17, 0);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHRootViewController view](self, "view"));
  objc_msgSend(v18, "addSubview:", self->_cloudRestoreStackView);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_cloudRestoreStackView, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UITabBarController tabBar](self->_tabBarController, "tabBar"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
  objc_msgSend(v22, "setActive:", 1);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_cloudRestoreStackView, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CHRootViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
  objc_msgSend(v26, "setActive:", 1);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_cloudRestoreStackView, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CHRootViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
  objc_msgSend(v30, "setActive:", 1);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIProgressView leadingAnchor](self->_progressView, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_cloudRestoreStackView, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 22.0));
  objc_msgSend(v33, "setActive:", 1);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIProgressView trailingAnchor](self->_progressView, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_cloudRestoreStackView, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, -22.0));
  objc_msgSend(v36, "setActive:", 1);

}

- (void)showCloudStatusWithProgress:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!self->_cloudRestoreStackView)
  {
    -[CHRootViewController _setupCloudRestoreUI](self, "_setupCloudRestoreUI");
    v4 = v5;
  }
  -[UIProgressView setObservedProgress:](self->_progressView, "setObservedProgress:", v4);

}

- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v5 = a4;
  _HKInitializeLogging(v5, v6);
  v7 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[cloud-restore] Receieved cloud sync observer progress", buf, 2u);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A0BA0;
  v9[3] = &unk_100777EE0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

}

- (void)cloudSyncObserverSyncCompleted:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  _HKInitializeLogging(self, a2);
  v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[cloud-restore] Cloud sync observer sync completed", buf, 2u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A0C5C;
  block[3] = &unk_100777E20;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)activitySetUp
{
  return self->_activitySetUp;
}

- (void)setCloudSyncObserver:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSyncObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSyncObserver, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_cloudRestoreStackView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
}

@end
