@implementation PKAddSecureElementPassViewController

+ (BOOL)canAddSecureElementPassWithConfiguration:(PKAddSecureElementPassConfiguration *)configuration
{
  PKAddSecureElementPassConfiguration *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = configuration;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "canAddSecureElementPassWithConfiguration:", v4);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Failed to initialize pass library in %@", (uint8_t *)&v11, 0xCu);

      }
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PKAddSecureElementPassViewController)initWithConfiguration:(PKAddSecureElementPassConfiguration *)configuration delegate:(id)delegate
{
  PKAddSecureElementPassConfiguration *v7;
  id v8;
  __SecTask *v9;
  __SecTask *v10;
  id v11;
  char v12;
  PKAddSecureElementPassViewController *v13;
  PKAddSecureElementPassViewController *v14;
  void *v15;
  int v16;
  NSObject *v17;
  PKCancelingAnimatedTransitioningHandler *v18;
  PKCancelingAnimatedTransitioningHandler *animatedTransitionHandler;
  PKCancelingAnimatedTransitioningHandler *v20;
  NSObject *v21;
  PKAddSecureElementPassViewController *v22;
  void *v24;
  PKAddSecureElementPassConfiguration *v25;
  uint64_t v26;
  void *v27;
  PKAddSecureElementPassConfiguration *v28;
  _QWORD v29[4];
  id v30;
  objc_super v31;
  uint8_t buf[4];
  PKAddSecureElementPassConfiguration *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = configuration;
  v8 = delegate;
  v9 = SecTaskCreateFromSelf(0);
  if (!v9)
    goto LABEL_17;
  v10 = v9;
  v11 = (id)SecTaskCopyValueForEntitlement(v9, (CFStringRef)*MEMORY[0x1E0D6B550], 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(v11, "BOOLValue");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      CFRelease(v10);

      goto LABEL_17;
    }
    v11 = v11;
    if ((objc_msgSend(v11, "containsObject:", CFSTR("carkey")) & 1) != 0)
    {

      CFRelease(v10);
      goto LABEL_10;
    }
    v12 = objc_msgSend(v11, "containsObject:", CFSTR("shareablecredential"));

  }
  CFRelease(v10);

  if ((v12 & 1) == 0)
  {
LABEL_17:
    PKLogFacilityTypeGetObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bundleIdentifier");
      v25 = (PKAddSecureElementPassConfiguration *)objc_claimAutoreleasedReturnValue();
      v26 = *MEMORY[0x1E0D6B550];
      *(_DWORD *)buf = 138543618;
      v33 = v25;
      v34 = 2114;
      v35 = v26;
      _os_log_error_impl(&dword_19D178000, v21, OS_LOG_TYPE_ERROR, "%{public}@ missing entitlement: %{public}@", buf, 0x16u);

    }
    goto LABEL_19;
  }
LABEL_10:
  if (!v7)
  {
    PKLogFacilityTypeGetObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bundleIdentifier");
      v28 = (PKAddSecureElementPassConfiguration *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v28;
      _os_log_error_impl(&dword_19D178000, v21, OS_LOG_TYPE_ERROR, "%{public}@ missing configuration parameter", buf, 0xCu);

    }
    goto LABEL_19;
  }
  if ((-[PKAddSecureElementPassConfiguration hasRequiredDataForProvisioning](v7, "hasRequiredDataForProvisioning") & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v7;
      _os_log_error_impl(&dword_19D178000, v21, OS_LOG_TYPE_ERROR, "%{public}@ does not have required data for provisioning", buf, 0xCu);
    }
LABEL_19:

    v22 = 0;
    goto LABEL_20;
  }
  v31.receiver = self;
  v31.super_class = (Class)PKAddSecureElementPassViewController;
  v13 = -[PKAddSecureElementPassViewController initWithNibName:bundle:](&v31, sel_initWithNibName_bundle_, 0, 0);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_configuration, configuration);
    objc_storeWeak((id *)&v14->_delegate, v8);
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "passbookHasBeenDeleted");

    if (v16)
    {
      PKLogFacilityTypeGetObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Wallet deleted, prompting user to re-install Wallet", buf, 2u);
      }

      -[PKAddSecureElementPassViewController setModalPresentationStyle:](v14, "setModalPresentationStyle:", 4);
      -[PKAddSecureElementPassViewController setTransitioningDelegate:](v14, "setTransitioningDelegate:", v14);
      objc_initWeak((id *)buf, v14);
      v18 = objc_alloc_init(PKCancelingAnimatedTransitioningHandler);
      animatedTransitionHandler = v14->_animatedTransitionHandler;
      v14->_animatedTransitionHandler = v18;

      v20 = v14->_animatedTransitionHandler;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __71__PKAddSecureElementPassViewController_initWithConfiguration_delegate___block_invoke;
      v29[3] = &unk_1E3E62638;
      objc_copyWeak(&v30, (id *)buf);
      -[PKCancelingAnimatedTransitioningHandler setCancelationHandler:](v20, "setCancelationHandler:", v29);
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[PKAddSecureElementPassViewController loadRemoteViewController](v14, "loadRemoteViewController");
    }
  }
  self = v14;
  v22 = self;
LABEL_20:

  return v22;
}

void __71__PKAddSecureElementPassViewController_initWithConfiguration_delegate___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleCanceledPresentationWithPresentingViewController:", v3);

}

- (PKAddSecureElementPassViewController)initWithCoder:(id)a3
{

  return 0;
}

- (PKAddSecureElementPassViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (void)dealloc
{
  _UIAsyncInvocation *remoteVCRequest;
  id v4;
  _UIAsyncInvocation *v5;
  objc_super v6;

  remoteVCRequest = self->_remoteVCRequest;
  if (remoteVCRequest)
  {
    v4 = (id)-[_UIAsyncInvocation invoke](remoteVCRequest, "invoke");
    v5 = self->_remoteVCRequest;
    self->_remoteVCRequest = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)PKAddSecureElementPassViewController;
  -[PKAddSecureElementPassViewController dealloc](&v6, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAddSecureElementPassViewController;
  -[PKAddSecureElementPassViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (self->_animatedTransitionHandler)
  {
    -[PKAddSecureElementPassViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddSecureElementPassViewController _handleCanceledPresentationWithPresentingViewController:](self, "_handleCanceledPresentationWithPresentingViewController:", v4);

  }
}

- (void)loadRemoteViewController
{
  uint64_t v3;
  const __CFString *v5;
  uint64_t v6;
  _UIAsyncInvocation *v7;
  _UIAsyncInvocation *remoteVCRequest;
  NSObject *v9;
  PKAddSecureElementPassConfiguration *configuration;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v3 = -[PKAddSecureElementPassConfiguration configurationType](self->_configuration, "configurationType");
  if (v3 == 1)
  {
    v5 = CFSTR("PKSubcredentialProvisioningServiceViewController");
    goto LABEL_9;
  }
  if (v3 == 4 || v3 == 2)
  {
    v5 = CFSTR("PKPushableCredentialsNavigationController");
LABEL_9:
    objc_initWeak(location, self);
    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__PKAddSecureElementPassViewController_loadRemoteViewController__block_invoke;
    v15[3] = &unk_1E3E66CE8;
    v15[4] = self;
    -[PKAddSecureElementPassViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", v15, 10.0);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __64__PKAddSecureElementPassViewController_loadRemoteViewController__block_invoke_81;
    v13[3] = &unk_1E3E66D10;
    v13[4] = self;
    objc_copyWeak(&v14, location);
    +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](PKRemoteAddSecureElementPassViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", v5, CFSTR("com.apple.PassbookUIService"), v13);
    v7 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
    remoteVCRequest = self->_remoteVCRequest;
    self->_remoteVCRequest = v7;

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
    return;
  }
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = configuration;
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Unknown view controller class for configuration: %@", (uint8_t *)location, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddSecureElementPassViewController didFinishWithPasses:error:](self, "didFinishWithPasses:error:", 0, v12);

}

uint64_t __64__PKAddSecureElementPassViewController_loadRemoteViewController__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  id v5;
  uint8_t v7[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Timed out while presenting add pass view controller", v7, 2u);
  }

  v5 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "invoke");
  return a2 ^ 1u;
}

void __64__PKAddSecureElementPassViewController_loadRemoteViewController__block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 992);
  *(_QWORD *)(v7 + 992) = 0;

  if (!v5 || v6)
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Failed to load remote view controller: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "didFinishWithPasses:error:", 0, v11);

  }
  else
  {
    v9 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__PKAddSecureElementPassViewController_loadRemoteViewController__block_invoke_2;
    v12[3] = &unk_1E3E61310;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    objc_msgSend(v9, "setRemoteVC:completionHandler:", v5, v12);
    objc_destroyWeak(&v13);
  }

}

void __64__PKAddSecureElementPassViewController_loadRemoteViewController__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_endDelayingPresentation");

}

- (void)setRemoteVC:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  PKRemoteAddSecureElementPassViewController *remoteVC;
  uint64_t v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  PKAddSecureElementPassConfiguration *configuration;
  _QWORD v23[4];
  void (**v24)(_QWORD);
  _QWORD v25[4];
  id v26;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  -[PKAddSecureElementPassViewController addChildViewController:](self, "addChildViewController:", self->_remoteVC);
  -[PKRemoteAddSecureElementPassViewController view](self->_remoteVC, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddSecureElementPassViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);
  objc_msgSend(v10, "setNeedsLayout");
  objc_msgSend(v10, "layoutIfNeeded");
  -[_UIRemoteViewController didMoveToParentViewController:](self->_remoteVC, "didMoveToParentViewController:", self);
  -[PKAddSecureElementPassViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  remoteVC = self->_remoteVC;
  v12 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke;
  v25[3] = &unk_1E3E63438;
  v13 = (void (**)(_QWORD))v8;
  v26 = v13;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](remoteVC, "serviceViewControllerProxyWithErrorHandler:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fixedCoordinateSpace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v15, "scale");
    objc_msgSend(v14, "setDisplayPropertiesWithScreenSize:scale:", v18, v20, v21);

    configuration = self->_configuration;
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_3;
    v23[3] = &unk_1E3E61590;
    v24 = v13;
    objc_msgSend(v14, "setConfiguration:completionHandler:", configuration, v23);

  }
  else if (v13)
  {
    v13[2](v13);
  }

}

void __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_2;
    block[3] = &unk_1E3E61590;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_4;
    block[3] = &unk_1E3E61590;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __70__PKAddSecureElementPassViewController_setRemoteVC_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)didFinishWithPass:(id)a3 error:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAddSecureElementPassViewController didFinishWithPasses:error:](self, "didFinishWithPasses:error:", v9, v7, v10, v11);
}

- (void)didFinishWithPasses:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL *p_finished;
  NSObject *v11;
  NSObject *WeakRetained;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  p_finished = &self->_finished;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_finished))
    {
      __clrex();
      PKLogFacilityTypeGetObject();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_19D178000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Error: didFinishWithPasses:error: called twice", (uint8_t *)&v17, 2u);
      }
      goto LABEL_22;
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_finished));
  if (v7)
  {

    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v8;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Adding secure element passes finished with error: %@", (uint8_t *)&v17, 0xCu);
    }
    v6 = 0;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v6;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Adding secure element passes finished with passes: %@", (uint8_t *)&v17, 0xCu);
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
    goto LABEL_19;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSObject addSecureElementPassViewController:didFinishAddingSecureElementPasses:error:](WeakRetained, "addSecureElementPassViewController:didFinishAddingSecureElementPasses:error:", self, v6, v8);
    goto LABEL_22;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "User is using deprecated delegate method.", (uint8_t *)&v17, 2u);
    }

    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addSecureElementPassViewController:didFinishAddingSecureElementPass:error:](WeakRetained, "addSecureElementPassViewController:didFinishAddingSecureElementPass:error:", self, v14, v8);

  }
  else
  {
LABEL_19:
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Delegate not set, dismissing add secure element passes view controller.", (uint8_t *)&v17, 2u);
    }

    -[PKAddSecureElementPassViewController presentingViewController](self, "presentingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, 0);

  }
LABEL_22:

}

- (int64_t)modalTransitionStyle
{
  return 0;
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_remoteVC;
}

- (id)childViewControllerForStatusBarHidden
{
  return self->_remoteVC;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)result
{
  objc_super v4;

  if (self->_remoteVC != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)PKAddSecureElementPassViewController;
    -[PKAddSecureElementPassViewController sizeForChildContentContainer:withParentContainerSize:](&v4, sel_sizeForChildContentContainer_withParentContainerSize_, result.width, result.height);
  }
  return result;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAddSecureElementPassViewController;
  -[PKAddSecureElementPassViewController loadView](&v5, sel_loadView);
  -[PKAddSecureElementPassViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAddSecureElementPassViewController;
  -[PKAddSecureElementPassViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKAddSecureElementPassViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteAddSecureElementPassViewController view](self->_remoteVC, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void)_handleCanceledPresentationWithPresentingViewController:(id)a3
{
  PKCancelingAnimatedTransitioningHandler *animatedTransitionHandler;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[5];

  animatedTransitionHandler = self->_animatedTransitionHandler;
  self->_animatedTransitionHandler = 0;
  v5 = a3;

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_2;
  v15[3] = &unk_1E3E61590;
  v7 = _Block_copy(aBlock);
  v16 = v7;
  v8 = PKCreateAlertControllerForWalletUninstalled(v15);
  objc_msgSend(v5, "pkui_frontMostViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_4;
  v12[3] = &unk_1E3E61850;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "presentViewController:animated:completion:", v11, 1, v12);

}

void __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D682D8], 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "didFinishWithPasses:error:", 0, v2);

}

void __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_3;
  block[3] = &unk_1E3E61590;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__PKAddSecureElementPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Failed to present download wallet alert!", v4, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return self->_animatedTransitionHandler;
}

- (id)interactionControllerForPresentation:(id)a3
{
  return self->_animatedTransitionHandler;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteVC, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);
  objc_storeStrong((id *)&self->_animatedTransitionHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
