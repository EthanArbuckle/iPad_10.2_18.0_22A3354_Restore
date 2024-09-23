@implementation PKAddPaymentPassViewController

+ (BOOL)canAddPaymentPass
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstanceWithRemoteLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66A30]), "initWithType:", 5);
  v4 = objc_msgSend(v2, "canAddSecureElementPassWithConfiguration:", v3);

  return v4;
}

- (PKAddPaymentPassViewController)initWithCoder:(id)a3
{

  return 0;
}

- (PKAddPaymentPassViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (PKAddPaymentPassViewController)initWithRequestConfiguration:(PKAddPaymentPassRequestConfiguration *)configuration delegate:(id)delegate
{
  PKAddPaymentPassRequestConfiguration *v7;
  id v8;
  __SecTask *v9;
  __SecTask *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  PKAddPaymentPassViewController *v16;
  PKAddPaymentPassViewController *v17;
  void *v18;
  int v19;
  NSObject *v20;
  PKCancelingAnimatedTransitioningHandler *v21;
  PKCancelingAnimatedTransitioningHandler *animatedTransitionHandler;
  PKCancelingAnimatedTransitioningHandler *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = configuration;
  v8 = delegate;
  v9 = SecTaskCreateFromSelf(0);
  if (v9)
  {
    v10 = v9;
    v11 = (void *)SecTaskCopyValueForEntitlement(v9, (CFStringRef)*MEMORY[0x1E0D682D0], 0);
    v12 = objc_msgSend(v11, "BOOLValue");
    CFRelease(v10);

  }
  else
  {
    v12 = 1;
  }
  -[PKAddPaymentPassRequestConfiguration cardholderName](v7, "cardholderName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13
    || (-[PKAddPaymentPassRequestConfiguration primaryAccountSuffix](v7, "primaryAccountSuffix"),
        (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[PKAddPaymentPassRequestConfiguration cardDetails](v7, "cardDetails");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (!v25)
      goto LABEL_18;
  }
  -[PKAddPaymentPassRequestConfiguration encryptionScheme](v7, "encryptionScheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = v12;
  else
    v15 = 0;

  if ((v15 & 1) != 0)
  {
    v32.receiver = self;
    v32.super_class = (Class)PKAddPaymentPassViewController;
    v16 = -[PKAddPaymentPassViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, 0, 0);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_configuration, configuration);
      objc_storeWeak((id *)&v17->_delegate, v8);
      objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "passbookHasBeenDeleted");

      if (v19)
      {
        PKLogFacilityTypeGetObject();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "Wallet deleted, prompting user to re-install Wallet", buf, 2u);
        }

        -[PKAddPaymentPassViewController setModalPresentationStyle:](v17, "setModalPresentationStyle:", 4);
        -[PKAddPaymentPassViewController setTransitioningDelegate:](v17, "setTransitioningDelegate:", v17);
        objc_initWeak((id *)buf, v17);
        v21 = objc_alloc_init(PKCancelingAnimatedTransitioningHandler);
        animatedTransitionHandler = v17->_animatedTransitionHandler;
        v17->_animatedTransitionHandler = v21;

        v23 = v17->_animatedTransitionHandler;
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __72__PKAddPaymentPassViewController_initWithRequestConfiguration_delegate___block_invoke;
        v30[3] = &unk_1E3E62638;
        objc_copyWeak(&v31, (id *)buf);
        -[PKCancelingAnimatedTransitioningHandler setCancelationHandler:](v23, "setCancelationHandler:", v30);
        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        -[PKAddPaymentPassViewController loadRemoteViewController](v17, "loadRemoteViewController");
      }
    }
    goto LABEL_23;
  }
LABEL_18:

  if ((v12 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v29;
      _os_log_error_impl(&dword_19D178000, v26, OS_LOG_TYPE_ERROR, "%{public}@ missing entitlement: com.apple.developer.payment-pass-provisioning", buf, 0xCu);

    }
  }
  v17 = 0;
LABEL_23:

  return v17;
}

void __72__PKAddPaymentPassViewController_initWithRequestConfiguration_delegate___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleCanceledPresentationWithPresentingViewController:", v3);

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
  v6.super_class = (Class)PKAddPaymentPassViewController;
  -[PKAddPaymentPassViewController dealloc](&v6, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAddPaymentPassViewController;
  -[PKAddPaymentPassViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (self->_animatedTransitionHandler)
  {
    -[PKAddPaymentPassViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddPaymentPassViewController _handleCanceledPresentationWithPresentingViewController:](self, "_handleCanceledPresentationWithPresentingViewController:", v4);

  }
}

- (void)loadRemoteViewController
{
  _UIAsyncInvocation *v3;
  _UIAsyncInvocation *remoteVCRequest;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[PKAddPaymentPassViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", 0, 10.0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PKAddPaymentPassViewController_loadRemoteViewController__block_invoke;
  v5[3] = &unk_1E3E63410;
  objc_copyWeak(&v6, &location);
  +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](PKRemoteAddPaymentPassViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("PKServiceAddPaymentPassViewController"), CFSTR("com.apple.PassbookUIService"), v5);
  v3 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  remoteVCRequest = self->_remoteVCRequest;
  self->_remoteVCRequest = v3;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__PKAddPaymentPassViewController_loadRemoteViewController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = (void *)*((_QWORD *)WeakRetained + 123);
    *((_QWORD *)WeakRetained + 123) = 0;

    if (v5)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __58__PKAddPaymentPassViewController_loadRemoteViewController__block_invoke_2;
      v14[3] = &unk_1E3E61310;
      objc_copyWeak(&v15, v7);
      objc_msgSend(v9, "_setRemoteVC:completionHandler:", v5, v14);
      objc_destroyWeak(&v15);
    }
    else
    {
      objc_msgSend(v9, "_endDelayingPresentation");
      if (v6)
      {
        v16 = *MEMORY[0x1E0CB3388];
        v17[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], 2, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addPaymentPassViewController:didFinishAddingPaymentPass:error:", v9, 0, v12);

    }
  }

}

void __58__PKAddPaymentPassViewController_loadRemoteViewController__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_endDelayingPresentation");
    WeakRetained = v2;
  }

}

- (void)_setRemoteVC:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  PKRemoteAddPaymentPassViewController *remoteVC;
  id WeakRetained;
  void *v11;
  void *v12;
  PKRemoteAddPaymentPassViewController *v13;
  uint64_t v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  PKAddPaymentPassRequestConfiguration *configuration;
  _QWORD v25[4];
  void (**v26)(_QWORD);
  _QWORD v27[4];
  id v28;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_remoteVC, a3);
  remoteVC = self->_remoteVC;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[PKRemoteAddPaymentPassViewController setDelegate:](remoteVC, "setDelegate:", WeakRetained);

  objc_storeWeak((id *)&self->_delegate, 0);
  -[PKAddPaymentPassViewController addChildViewController:](self, "addChildViewController:", self->_remoteVC);
  -[PKRemoteAddPaymentPassViewController view](self->_remoteVC, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddPaymentPassViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);
  objc_msgSend(v12, "setNeedsLayout");
  objc_msgSend(v12, "layoutIfNeeded");
  -[_UIRemoteViewController didMoveToParentViewController:](self->_remoteVC, "didMoveToParentViewController:", self);
  -[PKAddPaymentPassViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[PKAddPaymentPassViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
  v13 = self->_remoteVC;
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke;
  v27[3] = &unk_1E3E63438;
  v15 = (void (**)(_QWORD))v8;
  v28 = v15;
  -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](v13, "serviceViewControllerProxyWithErrorHandler:", v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fixedCoordinateSpace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v19;
    v22 = v21;
    objc_msgSend(v17, "scale");
    objc_msgSend(v16, "setDisplayPropertiesWithScreenSize:scale:", v20, v22, v23);

    configuration = self->_configuration;
    v25[0] = v14;
    v25[1] = 3221225472;
    v25[2] = __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke_3;
    v25[3] = &unk_1E3E61590;
    v26 = v15;
    objc_msgSend(v16, "setConfiguration:completionHandler:", configuration, v25);

  }
  else if (v15)
  {
    v15[2](v15);
  }

}

void __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke_2;
    block[3] = &unk_1E3E61590;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke_4;
    block[3] = &unk_1E3E61590;
    v3 = v1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __65__PKAddPaymentPassViewController__setRemoteVC_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)modalTransitionStyle
{
  return 0;
}

- (int64_t)modalPresentationStyle
{
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    return 16;
  }
  else
  {
    return 0;
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  PKRemoteAddPaymentPassViewController *remoteVC;

  remoteVC = self->_remoteVC;
  if (remoteVC)
    return -[_UIRemoteViewController supportedInterfaceOrientations](remoteVC, "supportedInterfaceOrientations");
  else
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
    v4.super_class = (Class)PKAddPaymentPassViewController;
    -[PKAddPaymentPassViewController sizeForChildContentContainer:withParentContainerSize:](&v4, sel_sizeForChildContentContainer_withParentContainerSize_, result.width, result.height);
  }
  return result;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAddPaymentPassViewController;
  -[PKAddPaymentPassViewController loadView](&v5, sel_loadView);
  -[PKAddPaymentPassViewController view](self, "view");
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
  v5.super_class = (Class)PKAddPaymentPassViewController;
  -[PKAddPaymentPassViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKAddPaymentPassViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteAddPaymentPassViewController view](self->_remoteVC, "view");
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
  aBlock[2] = __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_2;
  v15[3] = &unk_1E3E61590;
  v7 = _Block_copy(aBlock);
  v16 = v7;
  v8 = PKCreateAlertControllerForWalletUninstalled(v15);
  objc_msgSend(v5, "pkui_frontMostViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_4;
  v12[3] = &unk_1E3E61850;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "presentViewController:animated:completion:", v11, 1, v12);

}

void __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], 2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addPaymentPassViewController:didFinishAddingPaymentPass:error:", *(_QWORD *)(a1 + 32), 0, v3);

}

void __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_3;
  block[3] = &unk_1E3E61590;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__PKAddPaymentPassViewController__handleCanceledPresentationWithPresentingViewController___block_invoke_4(uint64_t a1)
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
  void *WeakRetained;

  if (self->_remoteVC)
  {
    -[PKRemoteAddPaymentPassViewController delegate](self->_remoteVC, "delegate");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
  if (self->_remoteVC)
    -[PKRemoteAddPaymentPassViewController setDelegate:](self->_remoteVC, "setDelegate:", delegate);
  else
    objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedTransitionHandler, 0);
  objc_storeStrong((id *)&self->_remoteVC, 0);
  objc_storeStrong((id *)&self->_remoteVCRequest, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
