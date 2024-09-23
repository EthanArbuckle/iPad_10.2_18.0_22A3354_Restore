@implementation PKPaymentAuthorizationRemoteAlertViewController

- (void)dealloc
{
  objc_super v3;

  -[PKPaymentAuthorizationPresentersCoordinator viewControllerDidInvalidate:](self->_presentersCoordinator, "viewControllerDidInvalidate:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
  -[SBUIRemoteAlertServiceViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
  -[PKPaymentAuthorizationRemoteAlertViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PKPaymentAuthorizationRemoteAlertViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", self->_blocksInput);

}

- (void)setBlocksInput
{
  void *v3;
  id v4;

  self->_blocksInput = 1;
  -[PKPaymentAuthorizationRemoteAlertViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHitTestsAsOpaque:", self->_blocksInput);

}

- (void)presentersCoordinatorDidInvalidate
{
  PKPaymentAuthorizationPresentersCoordinator *presentersCoordinator;
  id v4;

  -[PKPaymentAuthorizationRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");
  -[PKPaymentAuthorizationRemoteAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  presentersCoordinator = self->_presentersCoordinator;
  self->_presentersCoordinator = 0;

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[PKPaymentAuthorizationRemoteAlertViewController presentedViewController](self, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "sizeForChildContentContainer:withParentContainerSize:", v7, width, height);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
    -[PKPaymentAuthorizationRemoteAlertViewController sizeForChildContentContainer:withParentContainerSize:](&v16, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
  }
  v12 = v10;
  v13 = v11;

  v14 = v12;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
  -[PKPaymentAuthorizationRemoteAlertViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKPaymentAuthorizationPresentersCoordinator viewControllerWillAppear:](self->_presentersCoordinator, "viewControllerWillAppear:", self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
  -[PKPaymentAuthorizationRemoteAlertViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PKPaymentAuthorizationPresentersCoordinator viewControllerWillDisappear:](self->_presentersCoordinator, "viewControllerWillDisappear:", self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
  -[PKPaymentAuthorizationRemoteAlertViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  if (-[NSString length](self->_analyticsSubject, "length"))
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", self->_analyticsSubject);
}

- (unint64_t)supportedInterfaceOrientations
{
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (void)askForDismissalWithReason:(unint64_t)a3 error:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  PKPaymentAuthorizationPresentersCoordinator *presentersCoordinator;
  id v10;

  v10 = a4;
  v8 = (void (**)(_QWORD))a5;
  presentersCoordinator = self->_presentersCoordinator;
  if (presentersCoordinator)
  {
    -[PKPaymentAuthorizationPresentersCoordinator askForDismissalWithReason:error:completion:](presentersCoordinator, "askForDismissalWithReason:error:completion:", a3, v10, v8);
  }
  else if (v8)
  {
    v8[2](v8);
  }

}

- (void)didInvalidateForRemoteAlert
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
  -[SBUIRemoteAlertServiceViewController didInvalidateForRemoteAlert](&v3, sel_didInvalidateForRemoteAlert);
  -[PKPaymentAuthorizationPresentersCoordinator viewControllerDidInvalidate:](self->_presentersCoordinator, "viewControllerDidInvalidate:", self);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationRemoteAlertViewController configureWithUserInfo:dismissalHandler:completion:](self, "configureWithUserInfo:dismissalHandler:completion:", v7, 0, v6);

}

- (void)configureWithUserInfo:(id)a3 dismissalHandler:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  id v9;
  PKPaymentAuthorizationPresentersCoordinator *v10;
  PKPaymentAuthorizationPresentersCoordinator *presentersCoordinator;
  id v12;

  v12 = a4;
  v8 = (void (**)(_QWORD))a5;
  v9 = a3;
  -[PKPaymentAuthorizationRemoteAlertViewController configureAppearance](self, "configureAppearance");
  -[PKPaymentAuthorizationRemoteAlertViewController configureAnalyticsWithUserInfo:](self, "configureAnalyticsWithUserInfo:", v9);
  -[PKPaymentAuthorizationRemoteAlertViewController initializePresentersCoordinatorWithUserInfo:](self, "initializePresentersCoordinatorWithUserInfo:", v9);
  v10 = (PKPaymentAuthorizationPresentersCoordinator *)objc_claimAutoreleasedReturnValue();

  presentersCoordinator = self->_presentersCoordinator;
  self->_presentersCoordinator = v10;

  if (v12)
    -[PKPaymentAuthorizationPresentersCoordinator notifyOnInvalidated:](self->_presentersCoordinator, "notifyOnInvalidated:", v12);
  if (v8)
    v8[2](v8);

}

- (void)configureAppearance
{
  id v2;

  -[PKPaymentAuthorizationRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsBanners:", 1);
  objc_msgSend(v2, "setAllowsSiri:", 0);
  objc_msgSend(v2, "setAllowsAlertItems:", 1);
  objc_msgSend(v2, "setLaunchingInterfaceOrientation:", PKUserInterfaceIdiomSupportsLargeLayouts() ^ 1);
  if (PKUserInterfaceIdiomSupportsLargeLayouts() && (PKUserIntentIsAvailable() & 1) == 0)
    objc_msgSend(v2, "setOrientationChangedEventsEnabled:", 0);
  objc_msgSend(v2, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v2, "setSwipeDismissalStyle:", 0);
  objc_msgSend(v2, "setDismissalAnimationStyle:", 1);
  objc_msgSend(v2, "setWallpaperStyle:withDuration:", 1, 0.0);

}

- (void)configureAnalyticsWithUserInfo:(id)a3
{
  NSString *v4;
  NSString *analyticsSubject;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D6AB60]);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  analyticsSubject = self->_analyticsSubject;
  self->_analyticsSubject = v4;

  if (-[NSString length](self->_analyticsSubject, "length"))
  {
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D6AB58]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:withArchivedParent:", self->_analyticsSubject, v6);

  }
}

- (id)initializePresentersCoordinatorWithUserInfo:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  +[PKPaymentAuthorizationPresentersCoordinator coordinatorForHostWithUserInfo:](PKPaymentAuthorizationPresentersCoordinator, "coordinatorForHostWithUserInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__PKPaymentAuthorizationRemoteAlertViewController_initializePresentersCoordinatorWithUserInfo___block_invoke;
  v7[3] = &unk_1E3E61310;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "notifyOnInvalidated:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

void __95__PKPaymentAuthorizationRemoteAlertViewController_initializePresentersCoordinatorWithUserInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentersCoordinatorDidInvalidate");

}

- (void)noteActivatedWithPresentationMode:(int64_t)a3
{
  -[PKPaymentAuthorizationPresentersCoordinator viewController:didActivateWithPresentationMode:](self->_presentersCoordinator, "viewController:didActivateWithPresentationMode:", self, a3);
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (int)_preferredStatusBarVisibility
{
  void *v2;
  void *v3;
  int v4;

  -[PKPaymentAuthorizationRemoteAlertViewController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "_preferredStatusBarVisibility");
  else
    v4 = 1;

  return v4;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentAuthorizationRemoteAlertViewController;
  -[PKPaymentAuthorizationRemoteAlertViewController presentViewController:animated:completion:](&v6, sel_presentViewController_animated_completion_, a3, a4, a5);
  -[PKPaymentAuthorizationRemoteAlertViewController updateStatusBarVisibility](self, "updateStatusBarVisibility");
}

- (void)updateStatusBarVisibility
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __76__PKPaymentAuthorizationRemoteAlertViewController_updateStatusBarVisibility__block_invoke;
  v2[3] = &unk_1E3E612E8;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v2, 0.0);
}

uint64_t __76__PKPaymentAuthorizationRemoteAlertViewController_updateStatusBarVisibility__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PKPaymentAuthorizationRemoteAlertViewController_handleButtonActions___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __71__PKPaymentAuthorizationRemoteAlertViewController_handleButtonActions___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "handleHomeButtonPressedInViewController:") & 1) == 0)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6), "sendResponseWithUnHandledEvents:", objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6), "events", (_QWORD)v7));
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

- (PKPaymentAuthorizationPresentersCoordinator)presentersCoordinator
{
  return self->_presentersCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentersCoordinator, 0);
  objc_storeStrong((id *)&self->_analyticsSubject, 0);
}

@end
