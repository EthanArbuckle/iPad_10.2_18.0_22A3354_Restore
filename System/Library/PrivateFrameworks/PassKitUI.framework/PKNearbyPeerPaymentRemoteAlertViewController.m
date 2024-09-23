@implementation PKNearbyPeerPaymentRemoteAlertViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKNearbyPeerPaymentRemoteAlertViewController;
  -[PKNearbyPeerPaymentRemoteAlertViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (v6)
  {
    objc_msgSend(v6, "bounds");
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    PKSetDisplayProperties();

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  CLInUseAssertion *v6;
  CLInUseAssertion *inUseAssertion;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKNearbyPeerPaymentRemoteAlertViewController;
  -[PKNearbyPeerPaymentRemoteAlertViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[PKNearbyPeerPaymentViewController setModalPresentationStyle:](self->_viewController, "setModalPresentationStyle:", 0);
  -[PKNearbyPeerPaymentViewController setModalTransitionStyle:](self->_viewController, "setModalTransitionStyle:", 2);
  -[PKNearbyPeerPaymentRemoteAlertViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_viewController, 1, 0);
  if (!self->_inUseAssertion)
  {
    v4 = (void *)MEMORY[0x1E0C9E3A8];
    PKPassKitCoreBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (CLInUseAssertion *)objc_msgSend(v4, "newAssertionForBundle:withReason:", v5, CFSTR("Passbook displaying nearby remote UI"));
    inUseAssertion = self->_inUseAssertion;
    self->_inUseAssertion = v6;

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  CLInUseAssertion *inUseAssertion;
  CLInUseAssertion *v5;
  CLInUseAssertion *v6;
  dispatch_time_t v7;
  CLInUseAssertion *v8;
  _QWORD block[4];
  CLInUseAssertion *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKNearbyPeerPaymentRemoteAlertViewController;
  -[PKNearbyPeerPaymentRemoteAlertViewController viewWillDisappear:](&v11, sel_viewWillDisappear_, a3);
  inUseAssertion = self->_inUseAssertion;
  if (inUseAssertion)
  {
    v5 = inUseAssertion;
    v6 = self->_inUseAssertion;
    self->_inUseAssertion = 0;

    v7 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E0D6A4D0] * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__PKNearbyPeerPaymentRemoteAlertViewController_viewWillDisappear___block_invoke;
    block[3] = &unk_1E3E612E8;
    v10 = v5;
    v8 = v5;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);

  }
  -[PKNearbyPeerPaymentRemoteAlertViewController _dismiss:](self, "_dismiss:", 0);
}

uint64_t __66__PKNearbyPeerPaymentRemoteAlertViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKNearbyPeerPaymentRemoteAlertViewController;
  -[PKNearbyPeerPaymentRemoteAlertViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D698D0]);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  uint64_t IsAvailable;
  uint64_t v9;
  NSDictionary *v10;
  NSDictionary *userInfo;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int64_t v16;
  NSObject *v17;
  NSDictionary *v18;
  PKNearbyPeerPaymentSenderViewController *v19;
  NSObject *v20;
  NSDictionary *v21;
  PKNearbyPeerPaymentViewController *viewController;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD aBlock[4];
  id v28;
  id location;
  uint8_t buf[4];
  NSDictionary *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[PKNearbyPeerPaymentRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsAlertItems:", 1);
  objc_msgSend(v7, "setAllowsSiri:", 0);
  objc_msgSend(v7, "setAllowsBanners:", 1);
  objc_msgSend(v7, "setAllowsAlertStacking:", 1);
  IsAvailable = PKHomeButtonIsAvailable();
  if ((_DWORD)IsAvailable)
    v9 = 16;
  else
    v9 = 0;
  objc_msgSend(v7, "setAllowsMenuButtonDismissal:", IsAvailable, v23);
  objc_msgSend(v7, "setDesiredHardwareButtonEvents:", v9);
  objc_msgSend(v7, "setSwipeDismissalStyle:", 0);
  objc_msgSend(v7, "setDismissalAnimationStyle:", 1);
  objc_msgSend(v7, "setWallpaperStyle:withDuration:", 0, 0.0);
  objc_msgSend(v7, "setLaunchingInterfaceOrientation:", 1);
  objc_msgSend(v24, "userInfo");
  v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  userInfo = self->_userInfo;
  self->_userInfo = v10;

  -[NSDictionary valueForKey:](self->_userInfo, "valueForKey:", *MEMORY[0x1E0D6AB58]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:withArchivedParent:", *MEMORY[0x1E0D698D0], v12);
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PKNearbyPeerPaymentRemoteAlertViewController_configureWithContext_completion___block_invoke;
  aBlock[3] = &unk_1E3E61310;
  objc_copyWeak(&v28, &location);
  v14 = _Block_copy(aBlock);
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __80__PKNearbyPeerPaymentRemoteAlertViewController_configureWithContext_completion___block_invoke_2;
  v25[3] = &unk_1E3E77640;
  objc_copyWeak(&v26, &location);
  v15 = _Block_copy(v25);
  v16 = -[PKNearbyPeerPaymentRemoteAlertViewController nearbyContext](self, "nearbyContext");
  if (v16)
  {
    if (v16 != 1)
      goto LABEL_13;
    PKLogFacilityTypeGetObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_userInfo;
      *(_DWORD *)buf = 138412290;
      v31 = v18;
      _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentSenderRemoteAlertViewController: initializing internal controller with user info %@", buf, 0xCu);
    }

    v19 = -[PKNearbyPeerPaymentSenderViewController initWithUserInfo:screenEdgeSwipeAction:dismissAction:]([PKNearbyPeerPaymentSenderViewController alloc], "initWithUserInfo:screenEdgeSwipeAction:dismissAction:", self->_userInfo, v14, v15);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_userInfo;
      *(_DWORD *)buf = 138412290;
      v31 = v21;
      _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentReceiverRemoteAlertViewController: initializing internal controller with user info %@", buf, 0xCu);
    }

    v19 = -[PKNearbyPeerPaymentReceiverViewController initWithUserInfo:screenEdgeSwipeAction:dismissAction:]([PKNearbyPeerPaymentReceiverViewController alloc], "initWithUserInfo:screenEdgeSwipeAction:dismissAction:", self->_userInfo, v14, v15);
  }
  viewController = self->_viewController;
  self->_viewController = &v19->super;

LABEL_13:
  if (v6)
    v6[2](v6);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

void __80__PKNearbyPeerPaymentRemoteAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInitialHome");

}

void __80__PKNearbyPeerPaymentRemoteAlertViewController_configureWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_dismiss:", v3);

}

- (void)handleButtonActions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v16 = (void *)*MEMORY[0x1E0D692F0];
    v8 = (void *)*MEMORY[0x1E0D692F8];
    v26 = *MEMORY[0x1E0D698D0];
    v24 = *MEMORY[0x1E0D69298];
    v25 = *MEMORY[0x1E0D68C90];
    v22 = *MEMORY[0x1E0D68F50];
    v23 = *MEMORY[0x1E0D692E8];
    v20 = *MEMORY[0x1E0D68AA0];
    v21 = *MEMORY[0x1E0D69280];
    v18 = *MEMORY[0x1E0D68858];
    v19 = *MEMORY[0x1E0D68B18];
    v17 = *MEMORY[0x1E0D68CE0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9), "events") & 0x10) != 0)
        {
          if (-[PKNearbyPeerPaymentViewController hideStatusBar](self->_viewController, "hideStatusBar"))
          {
            -[PKNearbyPeerPaymentRemoteAlertViewController _handleInitialHome](self, "_handleInitialHome");
            goto LABEL_19;
          }
          PKLogFacilityTypeGetObject();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "NearbyPeerPayment/PKPeerPaymentRemoteAlertViewController: user initiated dismiss", buf, 2u);
          }

          v11 = -[PKNearbyPeerPaymentRemoteAlertViewController nearbyContext](self, "nearbyContext");
          v12 = v8;
          if (v11 == 1)
          {
LABEL_14:
            v13 = v12;
          }
          else
          {
            if (!v11)
            {
              v12 = v16;
              goto LABEL_14;
            }
            v13 = 0;
          }
          if (objc_msgSend(v13, "length"))
          {
            v14 = (void *)MEMORY[0x1E0D66A58];
            v32[0] = v25;
            v32[1] = v23;
            v33[0] = v24;
            v33[1] = v13;
            v32[2] = v22;
            v32[3] = v20;
            v33[2] = v21;
            v33[3] = v19;
            v32[4] = v18;
            v33[4] = v17;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 5);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "subject:sendEvent:", v26, v15);

          }
          -[PKNearbyPeerPaymentRemoteAlertViewController _dismiss:](self, "_dismiss:", 0);

        }
LABEL_19:
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v6);
  }

}

- (void)_handleInitialHome
{
  char IsAvailable;
  void *v4;
  void *v5;
  _QWORD v6[5];
  char v7;

  -[PKNearbyPeerPaymentViewController setHideStatusBar:](self->_viewController, "setHideStatusBar:", 0);
  IsAvailable = PKHomeButtonIsAvailable();
  if ((IsAvailable & 1) == 0)
  {
    -[PKNearbyPeerPaymentRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowsMenuButtonDismissal:", 1);
    objc_msgSend(v4, "setDesiredHardwareButtonEvents:", 16);

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 1);
  objc_msgSend(v5, "impactOccurred");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PKNearbyPeerPaymentRemoteAlertViewController__handleInitialHome__block_invoke;
  v6[3] = &unk_1E3E64C10;
  v6[4] = self;
  v7 = IsAvailable;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __66__PKNearbyPeerPaymentRemoteAlertViewController__handleInitialHome__block_invoke(uint64_t a1)
{
  dispatch_source_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  _QWORD handler[4];
  id v13;
  char v14;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 984);
  *(_QWORD *)(v3 + 984) = v2;

  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 984);
  v6 = dispatch_time(0, 8000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 984);
  v8 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __66__PKNearbyPeerPaymentRemoteAlertViewController__handleInitialHome__block_invoke_2;
  handler[3] = &unk_1E3E61C08;
  objc_copyWeak(&v13, &location);
  v14 = *(_BYTE *)(a1 + 40);
  dispatch_source_set_event_handler(v7, handler);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 984);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __66__PKNearbyPeerPaymentRemoteAlertViewController__handleInitialHome__block_invoke_3;
  v10[3] = &unk_1E3E61310;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_cancel_handler(v9, v10);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 984));
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __66__PKNearbyPeerPaymentRemoteAlertViewController__handleInitialHome__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained[123];
  if (v3)
  {
    WeakRetained[123] = 0;
    v5 = WeakRetained;

    objc_msgSend(v5[124], "setHideStatusBar:", 1);
    WeakRetained = v5;
    if (!*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v5, "_remoteViewControllerProxy");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAllowsMenuButtonDismissal:", 0);
      objc_msgSend(v4, "setDesiredHardwareButtonEvents:", 0);

      WeakRetained = v5;
    }
  }

}

void __66__PKNearbyPeerPaymentRemoteAlertViewController__handleInitialHome__block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[123];
  WeakRetained[123] = 0;

}

- (void)_dismiss:(id)a3
{
  id v4;
  NSObject *systemUITimer;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  systemUITimer = self->_systemUITimer;
  if (systemUITimer)
    dispatch_source_cancel(systemUITimer);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PKNearbyPeerPaymentRemoteAlertViewController__dismiss___block_invoke;
  v7[3] = &unk_1E3E61850;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PKNearbyPeerPaymentRemoteAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __57__PKNearbyPeerPaymentRemoteAlertViewController__dismiss___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "invalidate");
  objc_msgSend(v3, "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "_cleanup");
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

- (PKNearbyPeerPaymentViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (int64_t)nearbyContext
{
  return self->_nearbyContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_systemUITimer, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
}

@end
