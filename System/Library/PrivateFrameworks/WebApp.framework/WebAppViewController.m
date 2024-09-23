@implementation WebAppViewController

- (WebAppViewController)initWithWebClip:(id)a3
{
  id v5;
  WebAppViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  LoadingViewController *v11;
  LoadingViewController *loadingViewController;
  uint64_t v13;
  NSTimer *hideSnapshotTimer;
  void *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WebAppViewController;
  v6 = -[WebAppViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v6->_orientation = objc_msgSend((id)*MEMORY[0x24BDF74F8], "interfaceOrientation");
  objc_storeStrong((id *)&v6->_webClip, a3);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebAppViewController view](v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[UIWebClip pageURL](v6->_webClip, "pageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "safari_hasCustomScheme"))
  {
    v10 = objc_msgSend(v9, "safari_isDataURL");
    v6->_hasCustomScheme = v10 ^ 1;
    if ((v10 & 1) == 0)
      goto LABEL_6;
  }
  else
  {
    v6->_hasCustomScheme = 0;
  }
  v11 = -[LoadingViewController initWithWebClip:orientation:]([LoadingViewController alloc], "initWithWebClip:orientation:", v5, v6->_orientation);
  loadingViewController = v6->_loadingViewController;
  v6->_loadingViewController = v11;

  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v6, sel_timeLimitForLoadCompletionExpired, 0, 0, 10.0);
  v13 = objc_claimAutoreleasedReturnValue();
  hideSnapshotTimer = v6->_hideSnapshotTimer;
  v6->_hideSnapshotTimer = (NSTimer *)v13;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNetworkActivityIndicatorVisible:", 1);

  -[WebAppViewController _connectToService](v6, "_connectToService");
LABEL_6:

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[WebAppViewController _cancelHideSnapshotTimer](self, "_cancelHideSnapshotTimer");
  v3.receiver = self;
  v3.super_class = (Class)WebAppViewController;
  -[WebAppViewController dealloc](&v3, sel_dealloc);
}

- (void)_connectToService
{
  id v3;
  _UIAsyncInvocation *v4;
  _UIAsyncInvocation *cancelViewServiceRequest;
  _QWORD v6[5];

  v3 = (id)-[_UIAsyncInvocation invoke](self->_cancelViewServiceRequest, "invoke");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__WebAppViewController__connectToService__block_invoke;
  v6[3] = &unk_24FA28518;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BDE81E0], "requestViewControllerWithConnectionHandler:", v6);
  v4 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  cancelViewServiceRequest = self->_cancelViewServiceRequest;
  self->_cancelViewServiceRequest = v4;

}

void __41__WebAppViewController__connectToService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setUpContentViewController:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "finishWithResult:", v5);
  }
  else
  {
    viewServiceLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __41__WebAppViewController__connectToService__block_invoke_cold_1(v6, v7);

    objc_msgSend(*(id *)(a1 + 32), "webAppViewController:viewServiceDidTerminateWithError:", 0, 0);
  }

}

- (void)_removeRemoteView
{
  void *v3;
  _SFWebAppViewController *contentViewController;

  -[_SFWebAppViewController view](self->_contentViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[_SFWebAppViewController removeFromParentViewController](self->_contentViewController, "removeFromParentViewController");
  contentViewController = self->_contentViewController;
  self->_contentViewController = 0;

}

- (void)_setUpContentViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_contentViewController, a3);
  objc_msgSend(v10, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebAppViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "setFrame:");

  objc_msgSend(v10, "setDelegate:", self);
  if (!self->_wasLaunchedForWebPush)
  {
    -[WebAppViewController webClip](self, "webClip");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadWebAppWithIdentifier:", v8);

  }
  -[WebAppViewController addChildViewController:](self, "addChildViewController:", v10);
  -[WebAppViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v5);

  objc_msgSend(v10, "didMoveToParentViewController:", self);
  -[WebAppViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[WebAppViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
  -[WebAppViewController setNeedsUpdateOfScreenEdgesDeferringSystemGestures](self, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");
  -[WebAppViewController setNeedsWhitePointAdaptivityStyleUpdate](self, "setNeedsWhitePointAdaptivityStyleUpdate");

}

- (void)_cancelHideSnapshotTimer
{
  NSTimer *hideSnapshotTimer;
  NSTimer *v4;

  hideSnapshotTimer = self->_hideSnapshotTimer;
  if (hideSnapshotTimer)
  {
    -[NSTimer invalidate](hideSnapshotTimer, "invalidate");
    v4 = self->_hideSnapshotTimer;
    self->_hideSnapshotTimer = 0;

  }
}

- (void)timeLimitForLoadCompletionExpired
{
  -[WebAppViewController _cancelHideSnapshotTimer](self, "_cancelHideSnapshotTimer");
  -[WebAppViewController hideLoadingView](self, "hideLoadingView");
}

- (void)hideLoadingView
{
  LoadingViewController *v3;
  LoadingViewController *loadingViewController;
  LoadingViewController *v5;

  if (self->_loadingViewController)
  {
    -[WebAppViewController presentedViewController](self, "presentedViewController");
    v3 = (LoadingViewController *)objc_claimAutoreleasedReturnValue();
    loadingViewController = self->_loadingViewController;

    if (v3 == loadingViewController)
      -[WebAppViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  v5 = self->_loadingViewController;
  self->_loadingViewController = 0;

}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_contentViewController;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_contentViewController;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_contentViewController;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_contentViewController;
}

- (id)childViewControllerForWhitePointAdaptivityStyle
{
  return self->_contentViewController;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WebAppViewController;
  -[WebAppViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (!*(_WORD *)&self->_hasShownLoadingViewController)
  {
    self->_hasShownLoadingViewController = 1;
    -[WebAppViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_loadingViewController, 0, 0);
  }
}

- (void)openURLWithCustomSchemeIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_hasCustomScheme)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDC15A0]);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24FA28608);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReferrerURL:", v3);

    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWebClip pageURL](self->_webClip, "pageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openURL:configuration:completionHandler:", v5, v6, 0);

  }
}

- (void)processWebPushWithIdentifier:(id)a3
{
  id v4;
  _SFWebAppViewController *contentViewController;
  CPSPromise *connectionPromiseForPush;
  CPSPromise *v7;
  CPSPromise *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    -[_SFWebAppViewController processWebPushForWebAppWithIdentifier:](contentViewController, "processWebPushForWebAppWithIdentifier:", v4);
  }
  else
  {
    connectionPromiseForPush = self->_connectionPromiseForPush;
    if (!connectionPromiseForPush)
    {
      v7 = (CPSPromise *)objc_alloc_init((Class)getCPSPromiseClass());
      v8 = self->_connectionPromiseForPush;
      self->_connectionPromiseForPush = v7;

      connectionPromiseForPush = self->_connectionPromiseForPush;
    }
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__WebAppViewController_processWebPushWithIdentifier___block_invoke;
    v9[3] = &unk_24FA28540;
    v10 = v4;
    -[CPSPromise addCompletionBlock:](connectionPromiseForPush, "addCompletionBlock:", v9);

  }
}

uint64_t __53__WebAppViewController_processWebPushWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processWebPushForWebAppWithIdentifier:", *(_QWORD *)(a1 + 32));
}

- (void)notificationActivated:(id)a3
{
  id v4;
  _SFWebAppViewController *contentViewController;
  CPSPromise *connectionPromiseForPush;
  CPSPromise *v7;
  CPSPromise *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    -[_SFWebAppViewController handlePushNotificationActivation:](contentViewController, "handlePushNotificationActivation:", v4);
  }
  else
  {
    connectionPromiseForPush = self->_connectionPromiseForPush;
    if (!connectionPromiseForPush)
    {
      v7 = (CPSPromise *)objc_alloc_init((Class)getCPSPromiseClass());
      v8 = self->_connectionPromiseForPush;
      self->_connectionPromiseForPush = v7;

      connectionPromiseForPush = self->_connectionPromiseForPush;
    }
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__WebAppViewController_notificationActivated___block_invoke;
    v9[3] = &unk_24FA28540;
    v10 = v4;
    -[CPSPromise addCompletionBlock:](connectionPromiseForPush, "addCompletionBlock:", v9);

  }
}

uint64_t __46__WebAppViewController_notificationActivated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handlePushNotificationActivation:", *(_QWORD *)(a1 + 32));
}

- (void)webAppViewController:(id)a3 didChangeLoadingState:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNetworkActivityIndicatorVisible:", v4);

}

- (void)webAppViewController:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  id v6;
  id v7;
  LoadingViewController *v8;
  LoadingViewController *loadingViewController;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[WebAppViewController _removeRemoteView](self, "_removeRemoteView");
  if (!self->_loadingViewController)
  {
    v8 = -[LoadingViewController initWithWebClip:orientation:]([LoadingViewController alloc], "initWithWebClip:orientation:", self->_webClip, self->_orientation);
    loadingViewController = self->_loadingViewController;
    self->_loadingViewController = v8;

    -[WebAppViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_loadingViewController, 0, 0);
  }
  v10 = dispatch_time(0, 1500000000);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__WebAppViewController_webAppViewController_viewServiceDidTerminateWithError___block_invoke;
  v11[3] = &unk_24FA28568;
  objc_copyWeak(&v12, &location);
  dispatch_after(v10, MEMORY[0x24BDAC9B8], v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __78__WebAppViewController_webAppViewController_viewServiceDidTerminateWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectToService");

}

- (UIWebClip)webClip
{
  return self->_webClip;
}

- (BOOL)wasLaunchedForWebPush
{
  return self->_wasLaunchedForWebPush;
}

- (void)setWasLaunchedForWebPush:(BOOL)a3
{
  self->_wasLaunchedForWebPush = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClip, 0);
  objc_storeStrong((id *)&self->_connectionPromiseForPush, 0);
  objc_storeStrong((id *)&self->_hideSnapshotTimer, 0);
  objc_storeStrong((id *)&self->_loadingViewController, 0);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

void __41__WebAppViewController__connectToService__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_fault_impl(&dword_22E28F000, a2, OS_LOG_TYPE_FAULT, "failed to connect to SafariViewService for Web.app: %{public}@; trying again…",
    (uint8_t *)&v4,
    0xCu);

}

@end
