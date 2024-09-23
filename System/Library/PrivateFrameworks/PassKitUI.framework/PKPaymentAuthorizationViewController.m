@implementation PKPaymentAuthorizationViewController

+ (BOOL)isPlatformSupported
{
  if (isPlatformSupported_onceToken != -1)
    dispatch_once(&isPlatformSupported_onceToken, &__block_literal_global_175);
  return isPlatformSupported_supported;
}

void __59__PKPaymentAuthorizationViewController_isPlatformSupported__block_invoke()
{
  void *v0;
  id v1;

  if (PKProcessIsiOSOnMac())
  {
    if ((dyld_program_sdk_at_least() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v1 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "executablePath");
      v0 = (void *)objc_claimAutoreleasedReturnValue();
      isPlatformSupported_supported = PKHasImplementationOfSelectorInImage();

    }
    else
    {
      isPlatformSupported_supported = 0;
    }
  }
}

+ (BOOL)canMakePayments
{
  int v2;

  v2 = objc_msgSend(a1, "isPlatformSupported");
  if (v2)
    LOBYTE(v2) = objc_msgSend(MEMORY[0x1E0D67088], "canMakePayments");
  return v2;
}

+ (BOOL)canMakePaymentsUsingNetworks:(NSArray *)supportedNetworks
{
  NSArray *v4;
  char v5;

  v4 = supportedNetworks;
  if (objc_msgSend(a1, "isPlatformSupported"))
    v5 = objc_msgSend(MEMORY[0x1E0D67088], "canMakePaymentsUsingNetworks:webDomain:", v4, 0);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)canMakePaymentsUsingNetworks:(NSArray *)supportedNetworks capabilities:(PKMerchantCapability)capabilties
{
  NSArray *v6;
  char v7;

  v6 = supportedNetworks;
  if (objc_msgSend(a1, "isPlatformSupported"))
    v7 = objc_msgSend(MEMORY[0x1E0D67088], "canMakePaymentsUsingNetworks:capabilities:webDomain:", v6, capabilties, 0);
  else
    v7 = 0;

  return v7;
}

+ (BOOL)supportsDisbursements
{
  return objc_msgSend(MEMORY[0x1E0D67088], "supportsDisbursements");
}

+ (BOOL)supportsDisbursementsUsingNetworks:(NSArray *)supportedNetworks
{
  return objc_msgSend(MEMORY[0x1E0D67088], "supportsDisbursementsUsingNetworks:", supportedNetworks);
}

+ (BOOL)supportsDisbursementsUsingNetworks:(NSArray *)supportedNetworks capabilities:(PKMerchantCapability)capabilities
{
  return objc_msgSend(MEMORY[0x1E0D67088], "supportsDisbursementsUsingNetworks:capabilities:", supportedNetworks, capabilities);
}

- (PKPaymentAuthorizationViewController)initWithDisbursementRequest:(PKDisbursementRequest *)request
{
  objc_class *v4;
  PKDisbursementRequest *v5;
  void *v6;
  PKPaymentAuthorizationViewController *v7;

  v4 = (objc_class *)MEMORY[0x1E0D66CD8];
  v5 = request;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithDisbursementRequest:", v5);

  v7 = -[PKPaymentAuthorizationViewController initWithPaymentRequest:](self, "initWithPaymentRequest:", v6);
  return v7;
}

+ (void)paymentServicesMerchantURL:(id)a3
{
  objc_msgSend(a1, "paymentServicesMerchantURLForAPIType:completion:", 1, a3);
}

+ (void)paymentServicesMerchantURLForAPIType:(int64_t)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0D66E10]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__PKPaymentAuthorizationViewController_paymentServicesMerchantURLForAPIType_completion___block_invoke;
  v8[3] = &unk_1E3E74B38;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "paymentServicesMerchantURLForAPIType:completion:", a3, v8);

}

void __88__PKPaymentAuthorizationViewController_paymentServicesMerchantURLForAPIType_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v8 = v5;
    if ((a2 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], -1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
    }
    (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v8, v7);

    v5 = v8;
  }

}

- (PKPaymentAuthorizationViewController)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This class is not NSCoding compliant"));
  return -[PKPaymentAuthorizationViewController init](self, "init");
}

- (PKPaymentAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  PKPaymentAuthorizationViewController *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0D67260]);
  v6 = -[PKPaymentAuthorizationViewController initWithPaymentRequest:](self, "initWithPaymentRequest:", v5);

  return v6;
}

- (PKPaymentAuthorizationViewController)initWithPaymentRequest:(PKPaymentRequest *)request
{
  objc_class *v4;
  PKPaymentRequest *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];
  objc_super v10;

  v4 = (objc_class *)MEMORY[0x1E0D67088];
  v5 = request;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithPaymentRequest:", v5);

  if (!v6)
    goto LABEL_8;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentAuthorizationViewController;
  self = -[PKPaymentAuthorizationViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  if (self)
  {
    if ((-[PKPaymentAuthorizationViewController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    {
      objc_msgSend(v6, "setDelegate:", self);
      objc_msgSend(v6, "_setPrivateDelegate:", self);
      objc_storeStrong((id *)&self->_paymentCoordinator, v6);
      goto LABEL_9;
    }
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_19D178000, v7, OS_LOG_TYPE_ERROR, "PKPaymentAuthorizationViewController does not support subclassing.", v9, 2u);
    }

LABEL_8:
    self = 0;
  }
LABEL_9:

  return self;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentAuthorizationViewController;
  -[PKPaymentAuthorizationViewController dealloc](&v2, sel_dealloc);
}

- (int64_t)modalPresentationStyle
{
  return 5;
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

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  kdebug_trace();
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAuthorizationViewController;
  -[PKPaymentAuthorizationViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  if (!self->_viewHasAppeared)
  {
    self->_viewHasAppeared = 1;
    if (!-[PKPaymentAuthorizationViewController _requiresPresentationContext](self, "_requiresPresentationContext"))
      -[PKPaymentAuthorizationViewController _presentInAppPaymentInterface](self, "_presentInAppPaymentInterface");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentAuthorizationViewController;
  -[PKPaymentAuthorizationViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (-[PKPaymentAuthorizationViewController _requiresPresentationContext](self, "_requiresPresentationContext"))
  {
    -[PKPaymentAuthorizationViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationViewController _presentInAppPaymentInterfaceWithWindow:](self, "_presentInAppPaymentInterfaceWithWindow:", v5);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationViewController;
  -[PKPaymentAuthorizationViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if ((-[PKPaymentAuthorizationViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || (-[PKPaymentAuthorizationViewController isMovingFromParentViewController](self, "isMovingFromParentViewController") & 1) == 0)
  {
    -[PKPaymentAuthorizationCoordinator setDelegate:](self->_paymentCoordinator, "setDelegate:", 0);
    -[PKPaymentAuthorizationCoordinator _setPrivateDelegate:](self->_paymentCoordinator, "_setPrivateDelegate:", 0);
    -[PKPaymentAuthorizationCoordinator dismissWithCompletion:](self->_paymentCoordinator, "dismissWithCompletion:", 0);
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didRequestMerchantSessionUpdate:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke;
  v7[3] = &unk_1E3E61850;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  uint64_t v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  v3 = objc_opt_respondsToSelector();

  v4 = *(_QWORD *)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)(v4 + 976));
    objc_msgSend(v9, "paymentAuthorizationViewController:didRequestMerchantSessionUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    v5 = objc_loadWeakRetained((id *)(v4 + 992));
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 992));
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke_2;
      v11[3] = &unk_1E3E74B60;
      v8 = *(_QWORD *)(a1 + 32);
      v12 = *(id *)(a1 + 40);
      objc_msgSend(v7, "paymentAuthorizationViewController:didRequestMerchantSession:", v8, v11);

    }
    else
    {
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D67270]), "initWithStatus:merchantSession:", 1, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }
}

void __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  id v8;

  if (a2)
    v4 = a3 == 0;
  else
    v4 = 0;
  v5 = !v4;
  v6 = (objc_class *)MEMORY[0x1E0D67270];
  v7 = a2;
  v8 = (id)objc_msgSend([v6 alloc], "initWithStatus:merchantSession:", v5, v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)paymentAuthorizationCoordinatorWillAuthorizePayment:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinatorWillAuthorizePayment___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __92__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinatorWillAuthorizePayment___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
    objc_msgSend(v4, "paymentAuthorizationViewControllerWillAuthorizePayment:", *(_QWORD *)(a1 + 32));

  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __100__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  v3 = objc_opt_respondsToSelector();

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "paymentAuthorizationViewController:didAuthorizePayment:handler:", v5, v6, *(_QWORD *)(a1 + 48));

  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __100__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke_2;
    v8[3] = &unk_1E3E74B88;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v7, "paymentAuthorizationViewController:didAuthorizePayment:completion:", v5, v6, v8);

  }
}

void __100__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0D670A8]);
  objc_msgSend(v4, "setStatus:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __81__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  objc_msgSend(WeakRetained, "paymentAuthorizationViewControllerDidFinish:", *(_QWORD *)(a1 + 32));

}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  v3 = objc_opt_respondsToSelector();

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  v9 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "paymentAuthorizationViewController:didSelectShippingMethod:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);
  }
  else
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke_2;
      v11[3] = &unk_1E3E74BB0;
      v12 = *(id *)(a1 + 48);
      objc_msgSend(v6, "paymentAuthorizationViewController:didSelectShippingMethod:completion:", v7, v8, v11);

      return;
    }
    v10 = objc_alloc_init(MEMORY[0x1E0D67288]);
    objc_msgSend(v10, "setStatus:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __104__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;

  v5 = (objc_class *)MEMORY[0x1E0D67288];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setStatus:", a2);
  objc_msgSend(v7, "setPaymentSummaryItems:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectShippingAddress:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PKPaymentAuthorizationViewController *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke;
  block[3] = &unk_1E3E65388;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __105__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  char v4;
  id v5;
  id v6;
  char v7;
  id v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C48]), "initWithCNContact:", *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 976));
  v4 = objc_opt_respondsToSelector();

  v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 976));
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "paymentAuthorizationViewController:didSelectShippingContact:handler:", *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 48));
LABEL_9:

    goto LABEL_10;
  }
  v7 = objc_opt_respondsToSelector();

  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 976));
  if ((v7 & 1) != 0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __105__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke_2;
    v17[3] = &unk_1E3E74BD8;
    v9 = *(_QWORD *)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v8, "paymentAuthorizationViewController:didSelectShippingContact:completion:", v9, v2, v17);

    v10 = v18;
  }
  else
  {
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0D67280]);
      objc_msgSend(v6, "setStatus:", 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_9;
    }
    v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 976));
    v13 = *(_QWORD *)(a1 + 40);
    v14 = objc_msgSend(*(id *)(a1 + 32), "ABPerson");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __105__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke_3;
    v15[3] = &unk_1E3E74BD8;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v12, "paymentAuthorizationViewController:didSelectShippingAddress:completion:", v13, v14, v15);

    v10 = v16;
  }

LABEL_10:
}

void __105__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (objc_class *)MEMORY[0x1E0D67280];
  v8 = a4;
  v9 = a3;
  v10 = [v7 alloc];
  v11 = (id)objc_msgSend(v10, "initWithErrors:paymentSummaryItems:shippingMethods:", MEMORY[0x1E0C9AA60], v8, v9);

  objc_msgSend(v11, "setStatus:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __105__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (objc_class *)MEMORY[0x1E0D67280];
  v8 = a4;
  v9 = a3;
  v10 = [v7 alloc];
  v11 = (id)objc_msgSend(v10, "initWithErrors:paymentSummaryItems:shippingMethods:", MEMORY[0x1E0C9AA60], v8, v9);

  objc_msgSend(v11, "setStatus:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __103__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  v3 = objc_opt_respondsToSelector();

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  v9 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "paymentAuthorizationViewController:didSelectPaymentMethod:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);
  }
  else
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __103__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke_2;
      v11[3] = &unk_1E3E61828;
      v12 = *(id *)(a1 + 48);
      objc_msgSend(v6, "paymentAuthorizationViewController:didSelectPaymentMethod:completion:", v7, v8, v11);

      return;
    }
    v10 = objc_alloc_init(MEMORY[0x1E0D67278]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __103__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D67278];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setPaymentSummaryItems:", v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)paymentAuthorizationCoordinator:(id)a3 didChangeCouponCode:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didChangeCouponCode_handler___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __100__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didChangeCouponCode_handler___block_invoke(_QWORD *a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 976));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "paymentAuthorizationViewController:didChangeCouponCode:handler:", a1[4], a1[5], a1[6]);
  }
  else
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D67268]);
    (*(void (**)(void))(a1[6] + 16))();

  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 willFinishWithError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_willFinishWithError___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __92__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_willFinishWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 992));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 992));
    objc_msgSend(v4, "paymentAuthorizationViewController:willFinishWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __103__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didEncounterAuthorizationEvent___block_invoke;
  v4[3] = &unk_1E3E62010;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

void __103__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didEncounterAuthorizationEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 992));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 992));
    objc_msgSend(v4, "paymentAuthorizationViewController:didEncounterAuthorizationEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __117__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke;
  v14[3] = &unk_1E3E622D8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __117__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 992));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(a1[4] + 992));
    objc_msgSend(v4, "paymentAuthorizationCoordinator:didUpdateAccountServicePaymentMethod:handler:", a1[5], a1[6], a1[7]);

  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __115__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke;
  v14[3] = &unk_1E3E622D8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __115__PKPaymentAuthorizationViewController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 992));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(a1[4] + 992));
    objc_msgSend(v4, "paymentAuthorizationCoordinator:didAuthorizeApplePayTrustSignature:handler:", a1[5], a1[6], a1[7]);

  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPaymentAuthorizationViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_presentInAppPaymentInterface
{
  -[PKPaymentAuthorizationViewController _presentInAppPaymentInterfaceWithWindow:](self, "_presentInAppPaymentInterfaceWithWindow:", 0);
}

- (void)_presentInAppPaymentInterfaceWithWindow:(id)a3
{
  uint64_t v4;
  void *v5;
  PKPaymentAuthorizationCoordinator *paymentCoordinator;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD aBlock[5];

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PKPaymentAuthorizationViewController__presentInAppPaymentInterfaceWithWindow___block_invoke;
  aBlock[3] = &unk_1E3E65130;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  paymentCoordinator = self->_paymentCoordinator;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __80__PKPaymentAuthorizationViewController__presentInAppPaymentInterfaceWithWindow___block_invoke_71;
  v8[3] = &unk_1E3E614F0;
  v9 = v5;
  v7 = v5;
  -[PKPaymentAuthorizationCoordinator presentWithCompletion:](paymentCoordinator, "presentWithCompletion:", v8);

}

void __80__PKPaymentAuthorizationViewController__presentInAppPaymentInterfaceWithWindow___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __80__PKPaymentAuthorizationViewController__presentInAppPaymentInterfaceWithWindow___block_invoke_2;
    v7[3] = &unk_1E3E61388;
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __80__PKPaymentAuthorizationViewController__presentInAppPaymentInterfaceWithWindow___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_19D178000, v2, OS_LOG_TYPE_ERROR, "Connection to remote alert view service failed", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "paymentAuthorizationCoordinator:willFinishWithError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "paymentAuthorizationCoordinatorDidFinish:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984));
}

void __80__PKPaymentAuthorizationViewController__presentInAppPaymentInterfaceWithWindow___block_invoke_71(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], -1, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

- (BOOL)_requiresPresentationContext
{
  return 0;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (PKPaymentAuthorizationCoordinator)paymentCoordinator
{
  return self->_paymentCoordinator;
}

- (void)setPaymentCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_paymentCoordinator, a3);
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (PKPaymentAuthorizationViewControllerPrivateDelegate)privateDelegate
{
  return (PKPaymentAuthorizationViewControllerPrivateDelegate *)objc_loadWeakRetained((id *)&self->_privateDelegate);
}

- (void)setPrivateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_privateDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privateDelegate);
  objc_storeStrong((id *)&self->_paymentCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
