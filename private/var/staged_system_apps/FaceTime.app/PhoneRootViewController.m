@implementation PhoneRootViewController

- (void)loadView
{
  void *v3;
  PhoneRootView *v4;

  v4 = objc_alloc_init(PhoneRootView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[PhoneRootView setBackgroundColor:](v4, "setBackgroundColor:", v3);

  -[PhoneRootView setOpaque:](v4, "setOpaque:", 0);
  -[PhoneRootViewController setView:](self, "setView:", v4);

}

- (void)setupContentViewFullSize
{
  void *v3;

  -[PhoneContentView setOpaque:](self->_contentView, "setOpaque:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[PhoneContentView setBackgroundColor:](self->_contentView, "setBackgroundColor:", v3);

  -[PhoneContentView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
  -[PhoneRootViewController _ensureProperPositionForContentView](self, "_ensureProperPositionForContentView");
}

- (id)_childViewControllerForWhitePointAdaptivityStyle
{
  void *v3;

  if (objc_msgSend(UIApp, "alwaysShowLocalVideo"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController localVideoViewController](self, "localVideoViewController"));
  else
    v3 = 0;
  return v3;
}

- (PHLocalVideoViewController)localVideoViewController
{
  PHLocalVideoViewController *localVideoViewController;
  PHLocalVideoViewController *v4;
  PHLocalVideoViewController *v5;

  localVideoViewController = self->_localVideoViewController;
  if (!localVideoViewController)
  {
    v4 = objc_alloc_init(PHLocalVideoViewController);
    v5 = self->_localVideoViewController;
    self->_localVideoViewController = v4;

    -[PhoneRootViewController addChildViewController:](self, "addChildViewController:", self->_localVideoViewController);
    localVideoViewController = self->_localVideoViewController;
  }
  return localVideoViewController;
}

- (void)handleApplicationWillEnterForegroundNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_10000E6C4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PhoneRootViewController handleApplicationWillEnterForegroundNotification", v6, 2u);
  }

  -[PhoneRootViewController showFaceTimeFirstRunViewIfNeeded](self, "showFaceTimeFirstRunViewIfNeeded");
}

- (void)updateVideoViewControllerWithOrientationMonitor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t v11[16];

  v4 = a3;
  if (objc_msgSend(UIApp, "alwaysShowLocalVideo"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));

    if (v7)
    {
      v8 = objc_msgSend(v4, "makeInterfaceOrientationFrom:whenFailing:", objc_msgSend(v4, "lastValidInterfaceOrientation"), objc_msgSend(v7, "interfaceOrientation"));
      v9 = objc_claimAutoreleasedReturnValue(-[PhoneRootViewController localVideoViewController](self, "localVideoViewController"));
      -[NSObject updateViewControllerForOrientation:](v9, "updateViewControllerForOrientation:", v8);
    }
    else
    {
      v10 = sub_10000E6C4();
      v9 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to orient video view controller because there's no window scene to determine a valid fallback orientation", v11, 2u);
      }
    }

  }
}

- (void)_destroyFirstRunController
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  PHOrientationMonitorComposer *v10;
  void *v11;
  void *v12;
  PHRegistrationViewController *registrationController;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController faceTimeContainerViewController](self, "faceTimeContainerViewController"));
  v4 = objc_msgSend(v3, "hasRecentsListViewController");

  if (v4)
  {
    v5 = sub_10000E6C4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000A334(v6);

  }
  if (self->_registrationController)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "removeObserver:name:object:", self, UIApplicationDidChangeStatusBarFrameNotification, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHOrientationMonitorKeys notificationEvent](PHOrientationMonitorKeys, "notificationEvent"));
    objc_msgSend(v8, "removeObserver:name:object:", self, v9, 0);

    v10 = objc_opt_new(PHOrientationMonitorComposer);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHOrientationMonitorComposer compose](v10, "compose"));
    objc_msgSend(v11, "setOrientationEventsEnabled:", 0);

    if (-[PHRegistrationViewController isViewLoaded](self->_registrationController, "isViewLoaded"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationViewController view](self->_registrationController, "view"));
      objc_msgSend(v12, "removeFromSuperview");

    }
    registrationController = self->_registrationController;
    self->_registrationController = 0;

    self->_faceTimeRegistrationViewIsShowing = 0;
    -[PhoneRootViewController showDetailsViewController](self, "showDetailsViewController");
  }
}

- (FTRecentsContainerViewControllerProtocol)faceTimeContainerViewController
{
  return self->_faceTimeContainerViewController;
}

- (void)showContentViewAnimated:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  double v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;

  v4 = a3;
  v7 = a4;
  if ((objc_msgSend(UIApp, "tabBarCanSlide") & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneRootViewController.m"), 556, CFSTR("Requested tab bar slide animation when not supported"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController contentView](self, "contentView"));
  objc_msgSend(v8, "setHidden:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));

  if (v10 != v9)
  {
    +[UIView disableAnimation](UIView, "disableAnimation");
    -[PhoneRootViewController _ensureProperPositionForContentView](self, "_ensureProperPositionForContentView");
    objc_msgSend(v9, "addSubview:", v8);
    +[UIView enableAnimation](UIView, "enableAnimation");
  }
  -[PhoneRootViewController showFaceTimeFirstRunViewIfNeeded](self, "showFaceTimeFirstRunViewIfNeeded");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_rootSheetPresentationController"));
  objc_msgSend(v13, "_setShouldScaleDownBehindDescendantSheets:", 0);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100005E00;
  v21[3] = &unk_10008A370;
  v22 = v8;
  v23 = v7;
  v14 = v7;
  v15 = v8;
  v16 = objc_retainBlock(v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100015144;
  v20[3] = &unk_1000898B8;
  v20[4] = self;
  v17 = objc_retainBlock(v20);
  if (v4)
    v18 = 0.300000012;
  else
    v18 = 0.0;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v17, v16, v18);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v17, v16, v18, 0.0);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  PHOrientationMonitorComposer *v11;
  void *v12;
  uint8_t v13[16];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PhoneRootViewController;
  -[PhoneRootViewController viewWillAppear:](&v14, "viewWillAppear:", a3);
  -[PhoneRootViewController startPreviewIfNeeded](self, "startPreviewIfNeeded");
  v4 = sub_10000E6C4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Observing foreground notifications via PhoneRootViewController viewWillAppear", v13, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "handleApplicationWillEnterForegroundNotification:", UIApplicationWillEnterForegroundNotification, 0);

  if (objc_msgSend(UIApp, "alwaysShowLocalVideo"))
  {
    v7 = sub_10000E6C4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Observing orientation notifications via PhoneRootViewController viewWillAppear", v13, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHOrientationMonitorKeys notificationEvent](PHOrientationMonitorKeys, "notificationEvent"));
    objc_msgSend(v9, "addObserver:selector:name:object:", self, "handleOrientationNotification:", v10, 0);

    v11 = objc_opt_new(PHOrientationMonitorComposer);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHOrientationMonitorComposer compose](v11, "compose"));
    objc_msgSend(v12, "setOrientationEventsEnabled:", 1);

  }
}

- (void)startPreviewIfNeeded
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (objc_msgSend(UIApp, "alwaysShowLocalVideo")
    && (objc_msgSend(UIApp, "inCall") & 1) == 0
    && (objc_msgSend(UIApp, "isSuspended") & 1) == 0)
  {
    v3 = sub_10000E6C4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting preview via PhoneRootViewController viewWillAppear", v6, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController localVideoViewController](self, "localVideoViewController"));
    objc_msgSend(v5, "startPreview");

  }
}

- (void)showFaceTimeFirstRunViewIfNeeded
{
  id v3;
  NSObject *v4;
  void *v5;
  UIViewController *detailsViewController;
  void *v7;
  id v8;
  uint8_t buf[16];

  if (+[PHRegistrationViewController shouldShowRegistration](PHRegistrationViewController, "shouldShowRegistration"))
  {
    if (objc_msgSend(UIApp, "isSuspended"))
    {
      v3 = sub_10000E6C4();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Skipping showFaceTimeFirstRunViewIfNeeded since PhoneApp isSuspended.", buf, 2u);
      }

    }
    else
    {
      -[PhoneRootViewController createFaceTimeFirstRunViewIfNeeded](self, "createFaceTimeFirstRunViewIfNeeded");
      v8 = (id)objc_claimAutoreleasedReturnValue(-[PHRegistrationViewController view](self->_registrationController, "view"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController contentView](self, "contentView"));
      if (!self->_faceTimeRegistrationViewIsShowing)
      {
        -[PhoneRootViewController hideDetailsViewController](self, "hideDetailsViewController");
        objc_msgSend(v5, "bounds");
        objc_msgSend(v8, "setFrame:");
        objc_msgSend(v8, "setAutoresizingMask:", objc_msgSend(v5, "autoresizingMask"));
        objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        detailsViewController = self->_detailsViewController;
        if (detailsViewController)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController presentedViewController](detailsViewController, "presentedViewController"));

          if (v7)
            -[UIViewController dismissViewControllerAnimated:completion:](self->_detailsViewController, "dismissViewControllerAnimated:completion:", 0, 0);
        }
        -[PhoneRootViewController _constrainRegistrationView](self, "_constrainRegistrationView");
        self->_faceTimeRegistrationViewIsShowing = 1;
      }
      objc_msgSend(v5, "bringSubviewToFront:", v8);

    }
  }
  else
  {
    -[FTRecentsContainerViewControllerProtocol showContent](self->_faceTimeContainerViewController, "showContent");
    -[PhoneRootViewController _destroyFirstRunController](self, "_destroyFirstRunController");
  }
}

- (void)setContentViewNormalPosition
{
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  if (-[PhoneRootViewController isContentViewLoaded](self, "isContentViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController contentView](self, "contentView"));
    if (objc_msgSend(UIApp, "contentViewAnimationsFadeInsteadOfMove"))
    {
      objc_msgSend(v3, "setAlpha:", 1.0);
    }
    else
    {
      v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v5[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v5[1] = v4;
      v5[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      objc_msgSend(v3, "setTransform:", v5);
    }

  }
}

- (BOOL)isContentViewLoaded
{
  return self->_contentView != 0;
}

- (PhoneContentView)contentView
{
  PhoneContentView *contentView;
  PhoneContentView *v4;
  PhoneContentView *v5;
  id v6;
  _UIVisualEffectBackdropView *v7;
  _UIVisualEffectBackdropView *backdropView;
  void *v9;
  id v10;
  void *v11;
  UIVisualEffectView *v12;
  UIVisualEffectView *backgroundBlurView;
  void *v14;
  void *v15;
  FTRecentsContainerViewController *v16;
  FTRecentsContainerViewControllerProtocol *faceTimeContainerViewController;
  void *v18;
  void *v19;
  unsigned int v20;
  double v21;
  double v22;
  double MaxX;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  CGRect v31;

  contentView = self->_contentView;
  if (!contentView)
  {
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
    v4 = -[PhoneContentView initWithFrame:]([PhoneContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_contentView;
    self->_contentView = v4;

    -[PhoneContentView setContentMode:](self->_contentView, "setContentMode:", 3);
    -[PhoneContentView setAutoresizesSubviews:](self->_contentView, "setAutoresizesSubviews:", 1);
    if (objc_msgSend(UIApp, "tabBarFillsScreen"))
      -[PhoneRootViewController setupContentViewFullSize](self, "setupContentViewFullSize");
    else
      -[PhoneRootViewController setupContentViewSidebar](self, "setupContentViewSidebar");
    if (objc_msgSend(UIApp, "userInterfaceStyle") == 1)
    {
      if (!self->_backdropView)
      {
        v6 = objc_alloc((Class)_UIVisualEffectBackdropView);
        -[PhoneContentView bounds](self->_contentView, "bounds");
        v7 = (_UIVisualEffectBackdropView *)objc_msgSend(v6, "initWithFrame:");
        backdropView = self->_backdropView;
        self->_backdropView = v7;

        -[_UIVisualEffectBackdropView setAutoresizingMask:](self->_backdropView, "setAutoresizingMask:", 18);
        -[_UIVisualEffectBackdropView setRenderMode:](self->_backdropView, "setRenderMode:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[_UIVisualEffectBackdropView captureGroup](self->_backdropView, "captureGroup"));
        objc_msgSend(v9, "setGroupName:", CFSTR("RootControllerBackgroundBackdrop"));

      }
      if (!self->_backgroundBlurView)
      {
        v10 = objc_alloc((Class)UIVisualEffectView);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 2));
        v12 = (UIVisualEffectView *)objc_msgSend(v10, "initWithEffect:", v11);
        backgroundBlurView = self->_backgroundBlurView;
        self->_backgroundBlurView = v12;

        -[PhoneContentView bounds](self->_contentView, "bounds");
        -[UIVisualEffectView setFrame:](self->_backgroundBlurView, "setFrame:");
        -[UIVisualEffectView setAutoresizingMask:](self->_backgroundBlurView, "setAutoresizingMask:", 18);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[_UIVisualEffectBackdropView captureGroup](self->_backdropView, "captureGroup"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "groupName"));
        -[UIVisualEffectView _setGroupName:](self->_backgroundBlurView, "_setGroupName:", v15);

        -[UIVisualEffectView _setCaptureView:](self->_backgroundBlurView, "_setCaptureView:", self->_backdropView);
      }
      -[PhoneContentView addSubview:](self->_contentView, "addSubview:", self->_backdropView);
      -[PhoneContentView addSubview:](self->_contentView, "addSubview:", self->_backgroundBlurView);
    }
    if (objc_msgSend(UIApp, "usesUnifiedInterface"))
    {
      v16 = objc_alloc_init(FTRecentsContainerViewController);
      faceTimeContainerViewController = self->_faceTimeContainerViewController;
      self->_faceTimeContainerViewController = (FTRecentsContainerViewControllerProtocol *)v16;

      objc_storeStrong((id *)&self->_detailsViewController, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self->_detailsViewController, "view"));
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController baseViewController](self, "baseViewController"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));

    }
    v20 = objc_msgSend(UIApp, "tabBarFillsScreen");
    -[PhoneContentView bounds](self->_contentView, "bounds");
    v22 = v21;
    if (v20)
    {
      objc_msgSend(v18, "setFrame:");
    }
    else
    {
      -[PhoneContentView bounds](self->_contentView, "bounds");
      objc_msgSend(v18, "setBounds:", 0.0, 0.0, v22);
      -[PhoneContentView bounds](self->_contentView, "bounds");
      MaxX = CGRectGetMaxX(v31);
      objc_msgSend(v18, "bounds");
      v25 = MaxX - floor(v24 * 0.5);
      -[PhoneContentView bounds](self->_contentView, "bounds");
      objc_msgSend(v18, "setCenter:", v25, floor(v26 * 0.5));
    }
    objc_msgSend(v18, "setAutoresizingMask:", 18);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController detailsViewController](self, "detailsViewController"));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController detailsViewController](self, "detailsViewController"));
      -[PhoneRootViewController addChildViewController:](self, "addChildViewController:", v28);

      -[PhoneContentView addSubview:](self->_contentView, "addSubview:", v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController detailsViewController](self, "detailsViewController"));
      objc_msgSend(v29, "didMoveToParentViewController:", self);

    }
    else
    {
      -[PhoneContentView addSubview:](self->_contentView, "addSubview:", v18);
    }
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 1);

    contentView = self->_contentView;
  }
  return contentView;
}

- (UIViewController)detailsViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 64, 1);
}

- (void)_ensureProperPositionForContentView
{
  unsigned int v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double x;
  double y;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;

  v3 = objc_msgSend(UIApp, "tabBarFillsScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  v9 = v7;
  v10 = v8;
  if (v3)
  {
    x = v5;
    y = v6;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
    objc_msgSend(v13, "center");
    v15 = v14;
    v17 = v16;
  }
  else
  {
    -[PhoneRootViewController _contentViewWidthForApplicationBoundsSize:](self, "_contentViewWidthForApplicationBoundsSize:", v7, v8);
    v9 = v18;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
    objc_msgSend(v19, "bounds");
    v10 = v20;

    if (objc_msgSend(UIApp, "userInterfaceLayoutDirection"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
      objc_msgSend(v21, "bounds");
      v15 = floor(v22 + v9 * -0.5);

    }
    else
    {
      v15 = floor(v9 * 0.5);
    }
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
    objc_msgSend(v13, "bounds");
    v17 = floor(v23 * 0.5);
  }

  -[PhoneContentView setBounds:](self->_contentView, "setBounds:", x, y, v9, v10);
  -[PhoneContentView setCenter:](self->_contentView, "setCenter:", v15, v17);
}

- (void)displayUIAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  PHOrientationMonitorComposer *v25;
  void *v26;
  double v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  const char *v32;
  id v33;
  uint8_t v34[16];
  _QWORD v35[4];
  id v36;
  PhoneRootViewController *v37;
  id v38;
  BOOL v39;
  _OWORD v40[3];

  v3 = a3;
  if (objc_msgSend(UIApp, "alwaysShowLocalVideo")
    && (+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController localVideoViewController](self, "localVideoViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v40[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v40[1] = v8;
    v40[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v7, "setTransform:", v40);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v9, "setAlpha:", 1.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));

    if (v11 != v5)
    {
      objc_msgSend(v6, "viewWillAppear:", 1);
      objc_msgSend(v5, "insertSubview:atIndex:", v10, 0);
      objc_msgSend(v6, "viewDidAppear:", 1);
    }
    objc_msgSend(v5, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = v16 * 0.5;
    v21 = v18 * 0.5;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v22, "setBounds:", v13, v15, v17, v19);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v23, "setCenter:", v20, v21);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v24, "setAutoresizingMask:", 18);

    v25 = objc_opt_new(PHOrientationMonitorComposer);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHOrientationMonitorComposer compose](v25, "compose"));

    if (v3)
      v27 = 0.300000012;
    else
      v27 = 0.0;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000153DC;
    v35[3] = &unk_10008A3C0;
    v39 = v3;
    v36 = v6;
    v37 = self;
    v38 = v26;
    v28 = v26;
    v29 = v6;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v35, v27);

  }
  if (objc_msgSend(UIApp, "tabBarCanSlide"))
  {
    -[PhoneRootViewController showContentViewAnimated:completionBlock:](self, "showContentViewAnimated:completionBlock:", 0, 0);
    v30 = sub_10000E6C4();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      v32 = "Showing contents view of PhoneRootViewController.";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v32, v34, 2u);
    }
  }
  else
  {
    v33 = sub_10000E6C4();
    v31 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      v32 = "Skipping showing contents view of PhoneRootViewController.";
      goto LABEL_14;
    }
  }

}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PhoneRootViewController;
  -[PhoneRootViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[PhoneRootViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[PhoneRootViewController startPreviewIfNeeded](self, "startPreviewIfNeeded");
}

- (_UIVisualEffectBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  height = a3.height;
  width = a3.width;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003D1E4;
  v9[3] = &unk_10008A348;
  v9[4] = self;
  v7 = a4;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, 0);
  v8.receiver = self;
  v8.super_class = (Class)PhoneRootViewController;
  -[PhoneRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return objc_msgSend(UIApp, "contentViewCanRotate");
}

- (void)_getRotationContentSettings:(id *)a3
{
  void *v5;
  unsigned int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PhoneRootViewController;
  -[PhoneRootViewController _getRotationContentSettings:](&v7, "_getRotationContentSettings:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController baseViewController](self, "baseViewController"));
  v6 = objc_msgSend(v5, "shouldDisableEdgeClip");

  if (v6)
    a3->var6 = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[16];

  v3 = a3;
  if (objc_msgSend(UIApp, "alwaysShowLocalVideo"))
  {
    v5 = sub_10000E6C4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopping preview via PhoneRootViewController viewDidDisappear", buf, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController localVideoViewController](self, "localVideoViewController"));
    objc_msgSend(v7, "stopPreview");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)PhoneRootViewController;
  -[PhoneRootViewController viewDidDisappear:](&v9, "viewDidDisappear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PhoneRootViewController;
  -[PhoneRootViewController viewWillDisappear:](&v3, "viewWillDisappear:", a3);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PhoneRootViewController;
  -[PhoneRootViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)handleOrientationNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  PHOrientationMonitorComposer *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_screen"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  if (objc_msgSend(UIApp, "alwaysShowLocalVideo"))
    v7 = v5 == v6;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = sub_10000E6C4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PhoneRootViewController handleOrientationNotification", buf, 2u);
    }

    v10 = objc_opt_new(PHOrientationMonitorComposer);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHOrientationMonitorComposer compose](v10, "compose"));

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003D508;
    v13[3] = &unk_100089980;
    v13[4] = self;
    v14 = v11;
    v12 = v11;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v13, 0.300000012);

  }
}

- (double)_contentViewWidthForApplicationBoundsSize:(CGSize)a3
{
  unint64_t v3;

  v3 = +[PHUIConfiguration contentViewSizeForFaceTime](PHUIConfiguration, "contentViewSizeForFaceTime", a3.width, a3.height);
  if (v3 > 2)
    return 320.0;
  else
    return dbl_100067508[v3];
}

- (void)setupContentViewSidebar
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[PhoneContentView setBackgroundColor:](self->_contentView, "setBackgroundColor:", v3);

  -[PhoneContentView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 20);
  -[PhoneRootViewController _ensureProperPositionForContentView](self, "_ensureProperPositionForContentView");
  if ((objc_msgSend(UIApp, "tabBarFillsScreen") & 1) == 0)
  {
    -[PhoneRootViewController setContentViewHiddenPosition](self, "setContentViewHiddenPosition");
    -[PhoneContentView setHidden:](self->_contentView, "setHidden:", 1);
  }
}

- (void)setContentViewHiddenPosition
{
  void *v3;
  id v4;
  unsigned int v5;
  uint64_t v6;
  double Height;
  CGFloat v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  if (-[PhoneRootViewController isContentViewLoaded](self, "isContentViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController contentView](self, "contentView"));
    if (objc_msgSend(UIApp, "contentViewAnimationsFadeInsteadOfMove"))
    {
      objc_msgSend(v3, "setAlpha:", 0.0);
    }
    else
    {
      v4 = objc_msgSend(UIApp, "userInterfaceLayoutDirection");
      v5 = objc_msgSend(UIApp, "contentViewOffscreenEdge");
      objc_msgSend(v3, "bounds");
      if (v5 == 1)
      {
        Height = CGRectGetHeight(*(CGRect *)&v6);
        v11 = Height;
      }
      else
      {
        Height = CGRectGetWidth(*(CGRect *)&v6);
        v11 = 0.0;
      }
      if (v4 != (id)1)
        Height = -Height;
      memset(&v13.c, 0, 32);
      if (v5 == 1)
        Height = 0.0;
      *(_OWORD *)&v13.a = 0uLL;
      CGAffineTransformMakeTranslation(&v13, Height, v11);
      v12 = v13;
      objc_msgSend(v3, "setTransform:", &v12);
    }

  }
}

- (void)hideContentViewAnimated:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  double v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v7 = a4;
  if ((objc_msgSend(UIApp, "tabBarCanSlide") & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneRootViewController.m"), 624, CFSTR("Requested tab bar slide animation when not supported"));

  }
  if (-[PhoneRootViewController isContentViewLoaded](self, "isContentViewLoaded"))
  {

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003D83C;
    v13[3] = &unk_10008A370;
    v13[4] = self;
    v14 = v7;
    v8 = objc_retainBlock(v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003D8CC;
    v12[3] = &unk_1000898B8;
    v12[4] = self;
    v9 = objc_retainBlock(v12);
    v10 = 0.300000012;
    if (!v4)
      v10 = 0.0;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v9, v8, v10);

  }
}

- (void)showVideoConferenceBackgroundViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  _QWORD *v13;
  double v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  BOOL v19;

  v3 = a3;
  if ((objc_msgSend(UIApp, "alwaysShowLocalVideo") & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneRootViewController.m"), 651, CFSTR("Requested show of video conference controller when not supported"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController localVideoViewController](self, "localVideoViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController contentView](self, "contentView"));
  objc_msgSend(v9, "insertSubview:below:", v7, v10);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003DAA8;
  v18[3] = &unk_10008A278;
  v18[4] = self;
  v19 = v3;
  v11 = objc_retainBlock(v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003DAC4;
  v16[3] = &unk_1000898B8;
  v17 = v7;
  v12 = v7;
  v13 = objc_retainBlock(v16);
  if (v3)
    v14 = 0.300000012;
  else
    v14 = 0.0;
  -[PHLocalVideoViewController viewWillAppear:](self->_localVideoViewController, "viewWillAppear:", v3);
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v13, v11, v14);

}

- (void)hideVideoConferenceBackgroundViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  id v7;
  _QWORD *v8;
  id v9;
  void ***v10;
  double v11;
  void *v12;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  PhoneRootViewController *v20;
  BOOL v21;

  v3 = a3;
  if ((objc_msgSend(UIApp, "alwaysShowLocalVideo") & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhoneRootViewController.m"), 671, CFSTR("Requested hide of video conference controller when not supported"));

  }
  if (-[PHLocalVideoViewController isViewLoaded](self->_localVideoViewController, "isViewLoaded"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHLocalVideoViewController view](self->_localVideoViewController, "view"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003DC54;
    v18[3] = &unk_10008A398;
    v7 = v6;
    v19 = v7;
    v20 = self;
    v21 = v3;
    v8 = objc_retainBlock(v18);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_10003DC8C;
    v16 = &unk_1000898B8;
    v17 = v7;
    v9 = v7;
    v10 = objc_retainBlock(&v13);
    if (v3)
      v11 = 0.300000012;
    else
      v11 = 0.0;
    -[PHLocalVideoViewController viewWillDisappear:](self->_localVideoViewController, "viewWillDisappear:", v3, v13, v14, v15, v16);
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v10, v8, v11);

  }
}

- (void)showDetailsViewController
{
  uint64_t v3;
  void *v4;
  _BOOL4 faceTimeRegistrationViewIsShowing;
  void *v6;
  unsigned int v7;
  id v8;

  if (objc_msgSend(UIApp, "userInterfaceStyle") == 1)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController detailsViewController](self, "detailsViewController"));
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
    if (v3)
    {
      v4 = (void *)v3;
LABEL_4:

      return;
    }
    faceTimeRegistrationViewIsShowing = self->_faceTimeRegistrationViewIsShowing;

    if (!faceTimeRegistrationViewIsShowing)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController detailsViewController](self, "detailsViewController"));
      v7 = objc_msgSend(v6, "isViewLoaded");

      if (v7)
      {
        v8 = (id)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController detailsViewController](self, "detailsViewController"));
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
        objc_msgSend(v4, "setAlpha:", 1.0);
        goto LABEL_4;
      }
    }
  }
}

- (void)hideDetailsViewController
{
  void *v3;
  id v4;

  if (objc_msgSend(UIApp, "userInterfaceStyle") == 1)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController detailsViewController](self, "detailsViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    objc_msgSend(v3, "setAlpha:", 0.0);

  }
}

- (void)ensureBaseViewControllerIsShowing
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  if ((objc_msgSend(UIApp, "alwaysShowLocalVideo") & 1) == 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController view](self, "view"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController contentView](self, "contentView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController baseViewController](self, "baseViewController"));
    objc_msgSend(v4, "resetViewController");

    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
    if (v5 != v6)
    {
      -[PhoneRootViewController _ensureProperPositionForContentView](self, "_ensureProperPositionForContentView");
      objc_msgSend(v6, "addSubview:", v3);
    }

  }
}

- (void)createFaceTimeFirstRunViewIfNeeded
{
  void *v3;
  void *v4;
  PHRegistrationViewController *v5;
  PHRegistrationViewController *registrationController;
  PHRegistrationViewController *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, char);
  void *v12;
  id v13;
  id location;

  if (+[PHRegistrationViewController shouldShowRegistration](PHRegistrationViewController, "shouldShowRegistration"))
  {
    if (!self->_registrationController)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
      objc_msgSend(v3, "addListenerID:capabilities:", CFSTR("com.apple.FaceTime"), kFZListenerCapAccounts);

      v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"));
      objc_msgSend(v4, "blockUntilConnected");

      objc_initWeak(&location, self);
      v5 = objc_alloc_init(PHRegistrationViewController);
      registrationController = self->_registrationController;
      self->_registrationController = v5;

      v7 = self->_registrationController;
      v9 = _NSConcreteStackBlock;
      v10 = 3221225472;
      v11 = sub_10003E038;
      v12 = &unk_10008A3E8;
      objc_copyWeak(&v13, &location);
      -[PHRegistrationViewController setCompletionBlock:](v7, "setCompletionBlock:", &v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", v9, v10, v11, v12));
      objc_msgSend(v8, "addObserver:selector:name:object:", self, "_stausBarDidChangeFrame:", UIApplicationDidChangeStatusBarFrameNotification, 0);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_constrainRegistrationView
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[PHRegistrationViewController view](self->_registrationController, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PhoneRootViewController contentView](self, "contentView"));
  if (v13)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "superview"));

    if (v5 != v3)
      objc_msgSend(v3, "addSubview:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v6, "statusBarFrame");
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 7, 0, v3, 7, 1.0, 0.0));
    objc_msgSend(v3, "addConstraint:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 8, 0, v3, 8, 1.0, -v8));
    objc_msgSend(v3, "addConstraint:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 9, 0, v3, 9, 1.0, 0.0));
    objc_msgSend(v3, "addConstraint:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 10, 0, v3, 10, 1.0, v8));
    objc_msgSend(v3, "addConstraint:", v12);

    -[FTRecentsContainerViewControllerProtocol hideContent](self->_faceTimeContainerViewController, "hideContent");
  }

}

- (PhoneBaseViewController)baseViewController
{
  return self->_baseViewController;
}

- (void)setDetailsViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (STLockoutViewController)lockoutViewController
{
  return self->_lockoutViewController;
}

- (void)setLockoutViewController:(id)a3
{
  objc_storeStrong((id *)&self->_lockoutViewController, a3);
}

- (void)setFaceTimeContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_faceTimeContainerViewController, a3);
}

- (UIVisualEffectView)backgroundBlurView
{
  return self->_backgroundBlurView;
}

- (void)setBackgroundBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBlurView, a3);
}

- (BOOL)hasUpdateStatusLayoutGuide
{
  return self->_hasUpdateStatusLayoutGuide;
}

- (void)setHasUpdateStatusLayoutGuide:(BOOL)a3
{
  self->_hasUpdateStatusLayoutGuide = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
  objc_storeStrong((id *)&self->_faceTimeContainerViewController, 0);
  objc_storeStrong((id *)&self->_lockoutViewController, 0);
  objc_storeStrong((id *)&self->_detailsViewController, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_baseViewController, 0);
  objc_storeStrong((id *)&self->_localVideoViewController, 0);
  objc_storeStrong((id *)&self->_registrationController, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)showScreenTimeShieldForRequest:(id)a3
{
  uint64_t v5;
  PhoneRootViewController *v6;

  swift_unknownObjectRetain(a3);
  v6 = self;
  sub_1000428BC(a3);
  swift_unknownObjectRelease(a3, v5);

}

- (void)lockoutViewControllerDidFinishDismissing:(id)a3
{
  id v4;
  PhoneRootViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10004312C(1);

}

@end
