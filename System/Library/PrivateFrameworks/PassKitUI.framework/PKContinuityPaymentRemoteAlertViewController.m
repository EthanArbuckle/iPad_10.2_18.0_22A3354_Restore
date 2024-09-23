@implementation PKContinuityPaymentRemoteAlertViewController

- (PKContinuityPaymentRemoteAlertViewController)init
{
  PKContinuityPaymentRemoteAlertViewController *v2;
  PKContinuityPaymentService *v3;
  PKContinuityPaymentService *continuityService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKContinuityPaymentRemoteAlertViewController;
  v2 = -[PKContinuityPaymentRemoteAlertViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = (PKContinuityPaymentService *)objc_alloc_init(MEMORY[0x1E0D66C78]);
    continuityService = v2->_continuityService;
    v2->_continuityService = v3;

    -[PKContinuityPaymentService setDelegate:](v2->_continuityService, "setDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PKContinuityPaymentViewController setDelegate:](self->_continuityViewController, "setDelegate:", 0);
  -[PKContinuityPaymentService setDelegate:](self->_continuityService, "setDelegate:", 0);
  -[PKContinuityPaymentRemoteAlertViewController _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentRemoteAlertViewController;
  -[SBUIRemoteAlertServiceViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v2;
  double v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKContinuityPaymentRemoteAlertViewController;
  -[PKContinuityPaymentRemoteAlertViewController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStatusBarHeightOverride:", v4);

  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Did load continuity payment alert controller", v6, 2u);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[PKContinuityPaymentRemoteAlertViewController _cancelPayment](self, "_cancelPayment");
  v5.receiver = self;
  v5.super_class = (Class)PKContinuityPaymentRemoteAlertViewController;
  -[PKContinuityPaymentRemoteAlertViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentRemoteAlertViewController;
  -[PKContinuityPaymentRemoteAlertViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  AudioServicesPlaySystemSoundWithCompletion(0x487u, 0);
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result
{
  objc_super v4;

  if (self->_navigationController != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)PKContinuityPaymentRemoteAlertViewController;
    -[PKContinuityPaymentRemoteAlertViewController sizeForChildContentContainer:withParentContainerSize:](&v4, sel_sizeForChildContentContainer_withParentContainerSize_, result.width, result.height);
  }
  return result;
}

- (BOOL)prefersStatusBarHidden
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
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

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)didInvalidateForRemoteAlert
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKContinuityPaymentRemoteAlertViewController;
  -[SBUIRemoteAlertServiceViewController didInvalidateForRemoteAlert](&v3, sel_didInvalidateForRemoteAlert);
  -[PKContinuityPaymentRemoteAlertViewController _invalidate](self, "_invalidate");
  -[PKContinuityPaymentRemoteAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  PKRemotePaymentRequest *v10;
  PKRemotePaymentRequest *v11;
  PKRemotePaymentRequest *v12;
  PKRemotePaymentRequest *remoteRequest;
  NSObject *v14;
  PKContinuityPaymentViewController *v15;
  PKContinuityPaymentViewController *continuityViewController;
  UINavigationController *v17;
  UINavigationController *navigationController;
  UINavigationController *v19;
  void *v20;
  uint8_t v21[16];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(a3, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKContinuityPaymentRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsAlertItems:", 1);
  objc_msgSend(v8, "setAllowsSiri:", 0);
  objc_msgSend(v8, "setAllowsBanners:", 1);
  if (!-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))objc_msgSend(v8, "setLaunchingInterfaceOrientation:", 1);
  objc_msgSend(v8, "setWallpaperStyle:withDuration:", 1, 0.0);
  if (PKDeviceUILocked())
    objc_msgSend(v8, "setWallpaperTunnelActive:", 1);
  objc_msgSend(v8, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v8, "setSwipeDismissalStyle:", 0);
  objc_msgSend(v8, "setDismissalAnimationStyle:", 1);
  if (v6)
    v6[2](v6);
  objc_msgSend(v7, "objectForKey:", CFSTR("remotePaymentRequest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v9)
    {
      v10 = (PKRemotePaymentRequest *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v9, 0);
      if (v10)
      {
        v11 = v10;
        -[PKRemotePaymentRequest decodeTopLevelObjectOfClass:forKey:error:](v10, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), *MEMORY[0x1E0CB2CD0], 0);
        v12 = (PKRemotePaymentRequest *)objc_claimAutoreleasedReturnValue();
        remoteRequest = self->_remoteRequest;
        self->_remoteRequest = v12;

        -[PKRemotePaymentRequest finishDecoding](v11, "finishDecoding");
        goto LABEL_15;
      }
    }
  }
  else
  {

    v9 = 0;
  }
  PKLogFacilityTypeGetObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Could not initialize unarchiver with remotePaymentRequest.", v21, 2u);
  }

  v11 = self->_remoteRequest;
  self->_remoteRequest = 0;
LABEL_15:

  if (self->_remoteRequest)
  {
    if (objc_msgSend(MEMORY[0x1E0D6BFD8], "userIntentStyle") == -1)
    {
      -[PKContinuityPaymentRemoteAlertViewController _cancelPayment](self, "_cancelPayment");
      -[PKContinuityPaymentRemoteAlertViewController _presentEnrollAccessibilityIntentAlert](self, "_presentEnrollAccessibilityIntentAlert");
    }
    else
    {
      v15 = -[PKContinuityPaymentViewController initWithRemotePaymentRequest:]([PKContinuityPaymentViewController alloc], "initWithRemotePaymentRequest:", self->_remoteRequest);
      continuityViewController = self->_continuityViewController;
      self->_continuityViewController = v15;

      -[PKContinuityPaymentViewController setDelegate:](self->_continuityViewController, "setDelegate:", self);
      v17 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithNavigationBarClass:toolbarClass:", objc_opt_class(), 0);
      navigationController = self->_navigationController;
      self->_navigationController = v17;

      -[UINavigationController setModalPresentationStyle:](self->_navigationController, "setModalPresentationStyle:", 6);
      -[UINavigationController setModalInPresentation:](self->_navigationController, "setModalInPresentation:", 1);
      v19 = self->_navigationController;
      v22[0] = self->_continuityViewController;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController setViewControllers:](v19, "setViewControllers:", v20);

      -[PKContinuityPaymentRemoteAlertViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_navigationController, 1, &__block_literal_global_246);
    }
  }
  else
  {
    -[PKContinuityPaymentRemoteAlertViewController _dismiss](self, "_dismiss");
  }

}

void __80__PKContinuityPaymentRemoteAlertViewController_configureWithContext_completion___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  PKLogFacilityTypeGetObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19D178000, v0, OS_LOG_TYPE_DEFAULT, "Presented continuity view controller", v1, 2u);
  }

}

- (void)handleButtonActions:(id)a3
{
  if (!self->_hasAuthorizedPayment)
    -[PKContinuityPaymentRemoteAlertViewController _cancelPayment](self, "_cancelPayment", a3);
  -[PKContinuityPaymentRemoteAlertViewController _dismiss](self, "_dismiss", a3);
}

- (void)_invalidate
{
  -[PKContinuityPaymentViewController invalidate](self->_continuityViewController, "invalidate");
}

- (void)_dismiss
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_resetSharedRootAuthenticationContext");

  -[PKContinuityPaymentRemoteAlertViewController _invalidate](self, "_invalidate");
  -[PKContinuityPaymentRemoteAlertViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__PKContinuityPaymentRemoteAlertViewController__dismiss__block_invoke;
    v6[3] = &unk_1E3E612E8;
    v6[4] = self;
    -[PKContinuityPaymentRemoteAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);
  }
  else
  {
    -[PKContinuityPaymentRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

  }
}

void __56__PKContinuityPaymentRemoteAlertViewController__dismiss__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

- (void)_cancelPayment
{
  PKRemotePaymentRequest *remoteRequest;

  if (!self->_hasSentCancelPaymentRequest)
  {
    self->_hasSentCancelPaymentRequest = 1;
    remoteRequest = self->_remoteRequest;
    if (remoteRequest)
      -[PKContinuityPaymentService cancelRemotePaymentRequest:completion:](self->_continuityService, "cancelRemotePaymentRequest:completion:", remoteRequest, 0);
  }
}

- (void)_presentEnrollAccessibilityIntentAlert
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *AccesibilityIntentUnavailable;
  _QWORD v7[4];
  id v8;
  _QWORD aBlock[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PKContinuityPaymentRemoteAlertViewController__presentEnrollAccessibilityIntentAlert__block_invoke;
  aBlock[3] = &unk_1E3E61310;
  objc_copyWeak(&v10, &location);
  v4 = _Block_copy(aBlock);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __86__PKContinuityPaymentRemoteAlertViewController__presentEnrollAccessibilityIntentAlert__block_invoke_2;
  v7[3] = &unk_1E3E73920;
  objc_copyWeak(&v8, &location);
  v5 = _Block_copy(v7);
  AccesibilityIntentUnavailable = PKAlertCreateAccesibilityIntentUnavailable(v4, v5);
  -[PKContinuityPaymentRemoteAlertViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", AccesibilityIntentUnavailable, 1, 0);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __86__PKContinuityPaymentRemoteAlertViewController__presentEnrollAccessibilityIntentAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_dismiss");
    WeakRetained = v2;
  }

}

void __86__PKContinuityPaymentRemoteAlertViewController__presentEnrollAccessibilityIntentAlert__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_dismiss");
    v6 = objc_alloc_init(MEMORY[0x1E0CA5938]);
    objc_msgSend(v6, "setSensitive:", 1);
    v8 = *MEMORY[0x1E0D22D88];
    v9[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFrontBoardOptions:", v7);

    PKOpenApplication(v3, v6);
  }

}

- (void)didReceivePaymentResult:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__PKContinuityPaymentRemoteAlertViewController_didReceivePaymentResult_forRemotePaymentRequest___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __96__PKContinuityPaymentRemoteAlertViewController_didReceivePaymentResult_forRemotePaymentRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "authorizationDidAuthorizePaymentCompleteWithResult:", *(_QWORD *)(a1 + 40));
}

- (void)didReceivePaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PKContinuityPaymentRemoteAlertViewController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PKContinuityPaymentRemoteAlertViewController_didReceivePaymentClientUpdate_forRemotePaymentRequest___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __102__PKContinuityPaymentRemoteAlertViewController_didReceivePaymentClientUpdate_forRemotePaymentRequest___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[4];
  objc_msgSend(*(id *)(a1[5] + 976), "remoteRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
    objc_msgSend(*(id *)(a1[5] + 976), "updatePaymentWithClientUpdate:", a1[6]);
}

- (void)didReceiveCancellationForRemotePaymentRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKContinuityPaymentRemoteAlertViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__PKContinuityPaymentRemoteAlertViewController_didReceiveCancellationForRemotePaymentRequest___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __94__PKContinuityPaymentRemoteAlertViewController_didReceiveCancellationForRemotePaymentRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 976), "remoteRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
    objc_msgSend(*(id *)(a1 + 40), "_dismiss");
}

- (void)authorizationWillStart
{
  NSObject *v2;
  uint8_t v3[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Authorization will start", v3, 2u);
  }

}

- (void)authorizationDidFinishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Authorization did finish with error", v6, 2u);
  }

  if (!self->_hasAuthorizedPayment)
    -[PKContinuityPaymentRemoteAlertViewController _cancelPayment](self, "_cancelPayment");
  -[PKContinuityPaymentRemoteAlertViewController _dismiss](self, "_dismiss");

}

- (void)authorizationDidAuthorizePayment:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Authorization did authorize payment", v6, 2u);
  }

  if (!self->_hasSentCancelPaymentRequest)
  {
    self->_hasAuthorizedPayment = 1;
    -[PKContinuityPaymentService sendPayment:forRemotePaymentRequest:completion:](self->_continuityService, "sendPayment:forRemotePaymentRequest:completion:", v4, self->_remoteRequest, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuityService, 0);
  objc_storeStrong((id *)&self->_remoteRequest, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_continuityViewController, 0);
}

@end
