@implementation PKPaymentAuthorizationController

+ (BOOL)isPlatformSupported
{
  if (isPlatformSupported_onceToken_0[0] != -1)
    dispatch_once(isPlatformSupported_onceToken_0, &__block_literal_global_239);
  return isPlatformSupported_supported_0;
}

void __55__PKPaymentAuthorizationController_isPlatformSupported__block_invoke()
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
      isPlatformSupported_supported_0 = PKHasImplementationOfSelectorInImage();

    }
    else
    {
      isPlatformSupported_supported_0 = 0;
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
  return +[PKPaymentAuthorizationViewController supportsDisbursements](PKPaymentAuthorizationViewController, "supportsDisbursements");
}

+ (BOOL)supportsDisbursementsUsingNetworks:(NSArray *)supportedNetworks
{
  return +[PKPaymentAuthorizationViewController supportsDisbursementsUsingNetworks:](PKPaymentAuthorizationViewController, "supportsDisbursementsUsingNetworks:", supportedNetworks);
}

+ (BOOL)supportsDisbursementsUsingNetworks:(NSArray *)supportedNetworks capabilities:(PKMerchantCapability)capabilties
{
  return +[PKPaymentAuthorizationViewController supportsDisbursementsUsingNetworks:capabilities:](PKPaymentAuthorizationViewController, "supportsDisbursementsUsingNetworks:capabilities:", supportedNetworks, capabilties);
}

- (PKPaymentAuthorizationController)initWithDisbursementRequest:(PKDisbursementRequest *)request
{
  objc_class *v4;
  PKDisbursementRequest *v5;
  void *v6;
  PKPaymentAuthorizationController *v7;

  v4 = (objc_class *)MEMORY[0x1E0D66CD8];
  v5 = request;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithDisbursementRequest:", v5);

  v7 = -[PKPaymentAuthorizationController initWithPaymentRequest:](self, "initWithPaymentRequest:", v6);
  return v7;
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
  v8[2] = __84__PKPaymentAuthorizationController_paymentServicesMerchantURLForAPIType_completion___block_invoke;
  v8[3] = &unk_1E3E74B38;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "paymentServicesMerchantURLForAPIType:completion:", a3, v8);

}

void __84__PKPaymentAuthorizationController_paymentServicesMerchantURLForAPIType_completion___block_invoke(uint64_t a1, char a2, void *a3)
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

- (PKPaymentAuthorizationController)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This class is not NSCoding compliant"));
  return -[PKPaymentAuthorizationController init](self, "init");
}

- (PKPaymentAuthorizationController)init
{
  id v3;
  PKPaymentAuthorizationController *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D67260]);
  v4 = -[PKPaymentAuthorizationController initWithPaymentRequest:](self, "initWithPaymentRequest:", v3);

  return v4;
}

- (PKPaymentAuthorizationController)initWithPaymentRequest:(PKPaymentRequest *)request
{
  PKPaymentRequest *v4;
  PKPaymentAuthorizationController *v5;
  void *v6;
  NSObject *paymentCoordinator;
  uint8_t v9[16];
  objc_super v10;

  v4 = request;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentAuthorizationController;
  v5 = -[PKPaymentAuthorizationController init](&v10, sel_init);
  if (v5)
  {
    if ((-[PKPaymentAuthorizationController isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67088]), "initWithPaymentRequest:", v4);
      objc_msgSend(v6, "setDelegate:", v5);
      objc_msgSend(v6, "_setPrivateDelegate:", v5);
      paymentCoordinator = v5->_paymentCoordinator;
      v5->_paymentCoordinator = (PKPaymentAuthorizationCoordinator *)v6;
    }
    else
    {
      PKLogFacilityTypeGetObject();
      paymentCoordinator = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(paymentCoordinator, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_error_impl(&dword_19D178000, paymentCoordinator, OS_LOG_TYPE_ERROR, "PKPaymentAuthorizationController does not support subclassing.", v9, 2u);
      }
    }

  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentAuthorizationController;
  -[PKPaymentAuthorizationController dealloc](&v2, sel_dealloc);
}

- (void)presentWithCompletion:(void *)completion
{
  void *v4;
  PKPaymentAuthorizationCoordinator *paymentCoordinator;
  id v6;
  void *v7;
  id v8;
  _QWORD block[4];
  void *v10;
  _QWORD v11[5];
  void *v12;

  v4 = completion;
  kdebug_trace();
  if (self->_paymentCoordinator)
  {
    objc_storeStrong((id *)&self->_retainSelf, self);
    paymentCoordinator = self->_paymentCoordinator;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__PKPaymentAuthorizationController_presentWithCompletion___block_invoke;
    v11[3] = &unk_1E3E669E0;
    v11[4] = self;
    v12 = v4;
    v6 = v4;
    -[PKPaymentAuthorizationCoordinator presentWithCompletion:](paymentCoordinator, "presentWithCompletion:", v11);
    v7 = v12;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PKPaymentAuthorizationController_presentWithCompletion___block_invoke_52;
    block[3] = &unk_1E3E61590;
    v10 = v4;
    v8 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v7 = v10;
  }

}

void __58__PKPaymentAuthorizationController_presentWithCompletion___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PKPaymentAuthorizationController_presentWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E66830;
  v5 = a2;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __58__PKPaymentAuthorizationController_presentWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  uint8_t v5[16];

  if (!*(_BYTE *)(a1 + 48))
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_19D178000, v2, OS_LOG_TYPE_ERROR, "Connection to remote alert view service failed", v5, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A758], -1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "paymentAuthorizationCoordinator:willFinishWithError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v3);
    objc_msgSend(*(id *)(a1 + 32), "paymentAuthorizationCoordinatorDidFinish:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

uint64_t __58__PKPaymentAuthorizationController_presentWithCompletion___block_invoke_52(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)dismissWithCompletion:(void *)completion
{
  void (**v4)(_QWORD);
  void *v5;
  PKPaymentAuthorizationCoordinator *paymentCoordinator;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = completion;
  v5 = v4;
  paymentCoordinator = self->_paymentCoordinator;
  if (paymentCoordinator)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__PKPaymentAuthorizationController_dismissWithCompletion___block_invoke;
    v7[3] = &unk_1E3E618A0;
    v7[4] = self;
    v8 = v4;
    -[PKPaymentAuthorizationCoordinator dismissWithCompletion:](paymentCoordinator, "dismissWithCompletion:", v7);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

uint64_t __58__PKPaymentAuthorizationController_dismissWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "_setPrivateDelegate:", 0);
}

- (void)paymentAuthorizationCoordinatorWillAuthorizePayment:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PKPaymentAuthorizationController_paymentAuthorizationCoordinatorWillAuthorizePayment___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __88__PKPaymentAuthorizationController_paymentAuthorizationCoordinatorWillAuthorizePayment___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v4, "paymentAuthorizationControllerWillAuthorizePayment:", *(_QWORD *)(a1 + 32));

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
  block[2] = __96__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __96__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = objc_opt_respondsToSelector();

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "paymentAuthorizationController:didAuthorizePayment:handler:", v5, v6, *(_QWORD *)(a1 + 48));

  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __96__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke_2;
    v8[3] = &unk_1E3E74B88;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v7, "paymentAuthorizationController:didAuthorizePayment:completion:", v5, v6, v8);

  }
}

void __96__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePayment_handler___block_invoke_2(uint64_t a1, uint64_t a2)
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
  block[2] = __77__PKPaymentAuthorizationController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __77__PKPaymentAuthorizationController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "paymentAuthorizationControllerDidFinish:", *(_QWORD *)(a1 + 32));

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "_setPrivateDelegate:", 0);
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
  block[2] = __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke(uint64_t a1)
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

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = objc_opt_respondsToSelector();

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v9 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "paymentAuthorizationController:didSelectShippingMethod:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);
  }
  else
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke_2;
      v11[3] = &unk_1E3E74BB0;
      v12 = *(id *)(a1 + 48);
      objc_msgSend(v6, "paymentAuthorizationController:didSelectShippingMethod:completion:", v7, v8, v11);

      return;
    }
    v10 = objc_alloc_init(MEMORY[0x1E0D67288]);
    objc_msgSend(v10, "setStatus:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingMethod_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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
  PKPaymentAuthorizationController *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke;
  block[3] = &unk_1E3E65388;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __101__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  char v4;
  id v5;
  id v6;
  char v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C48]), "initWithCNContact:", *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  v4 = objc_opt_respondsToSelector();

  v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "paymentAuthorizationController:didSelectShippingContact:handler:", *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 48));
LABEL_6:

    goto LABEL_7;
  }
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D67280]);
    objc_msgSend(v6, "setStatus:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_6;
  }
  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke_2;
  v10[3] = &unk_1E3E74BD8;
  v9 = *(_QWORD *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v8, "paymentAuthorizationController:didSelectShippingContact:completion:", v9, v2, v10);

LABEL_7:
}

void __101__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectShippingAddress_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
  block[2] = __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke(uint64_t a1)
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

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = objc_opt_respondsToSelector();

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v9 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "paymentAuthorizationController:didSelectPaymentMethod:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4);
  }
  else
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke_2;
      v11[3] = &unk_1E3E61828;
      v12 = *(id *)(a1 + 48);
      objc_msgSend(v6, "paymentAuthorizationController:didSelectPaymentMethod:completion:", v7, v8, v11);

      return;
    }
    v10 = objc_alloc_init(MEMORY[0x1E0D67278]);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke_2(uint64_t a1, void *a2)
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
  block[2] = __96__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didChangeCouponCode_handler___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __96__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didChangeCouponCode_handler___block_invoke(_QWORD *a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "paymentAuthorizationController:didChangeCouponCode:handler:", a1[4], a1[5], a1[6]);
  }
  else
  {
    v2 = objc_alloc_init(MEMORY[0x1E0D67268]);
    (*(void (**)(void))(a1[6] + 16))();

  }
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "presentationWindowForPaymentAuthorizationController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sceneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained((id *)&self->_privateDelegate);
  if (!objc_msgSend(v7, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "presentationSceneIdentifierForPaymentAuthorizationController:", self);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }

  return v7;
}

- (id)presentationSceneBundleIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_privateDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "presentationSceneBundleIdentifierForPaymentAuthorizationController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
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
  v7[2] = __88__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_willFinishWithError___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __88__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_willFinishWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v4, "paymentAuthorizationController:willFinishWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

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
  v7[2] = __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke;
  v7[3] = &unk_1E3E61850;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke(uint64_t a1)
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

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = objc_opt_respondsToSelector();

  v4 = *(_QWORD *)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)(v4 + 16));
    objc_msgSend(v9, "paymentAuthorizationController:didRequestMerchantSessionUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    v5 = objc_loadWeakRetained((id *)(v4 + 32));
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke_2;
      v11[3] = &unk_1E3E74B60;
      v8 = *(_QWORD *)(a1 + 32);
      v12 = *(id *)(a1 + 40);
      objc_msgSend(v7, "paymentAuthorizationController:didRequestMerchantSession:", v8, v11);

    }
    else
    {
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D67270]), "initWithStatus:merchantSession:", 1, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }
}

void __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didRequestMerchantSessionUpdate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeContextWithHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke;
  v7[3] = &unk_1E3E61850;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizeContextWithHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  uint64_t v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v6, "paymentAuthorizationController:didAuthorizeContextWithHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = objc_alloc(MEMORY[0x1E0D670A8]);
    v6 = (id)objc_msgSend(v5, "initWithStatus:errors:", 1, MEMORY[0x1E0C9AA60]);
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }

}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5
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
  block[2] = __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __100__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePurchase_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(a1[4] + 32));
    objc_msgSend(v4, "paymentAuthorizationController:didAuthorizePurchase:completion:", a1[4], a1[5], a1[6]);

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePeerPaymentQuote:(id)a4 handler:(id)a5
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
  block[2] = __105__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePeerPaymentQuote_handler___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __105__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizePeerPaymentQuote_handler___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  uint64_t v4;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(a1[4] + 32));
    objc_msgSend(v6, "paymentAuthorizationController:didAuthorizePeerPaymentQuote:handler:", a1[4], a1[5], a1[6]);
  }
  else
  {
    v4 = a1[6];
    v5 = objc_alloc(MEMORY[0x1E0D670A8]);
    v6 = (id)objc_msgSend(v5, "initWithStatus:errors:", 1, MEMORY[0x1E0C9AA60]);
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }

}

- (void)paymentAuthorizationCoordinator:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didEncounterAuthorizationEvent___block_invoke;
  v4[3] = &unk_1E3E62010;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

void __99__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didEncounterAuthorizationEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v4, "paymentAuthorizationController:didEncounterAuthorizationEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5
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
  block[2] = __113__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __113__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(a1[4] + 32));
    objc_msgSend(v4, "paymentAuthorizationController:didUpdateAccountServicePaymentMethod:handler:", a1[4], a1[5], a1[6]);

  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5
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
  block[2] = __111__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __111__PKPaymentAuthorizationController_paymentAuthorizationCoordinator_didAuthorizeApplePayTrustSignature_handler___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(a1[4] + 32));
    objc_msgSend(v4, "paymentAuthorizationController:didAuthorizeApplePayTrustSignature:handler:", a1[4], a1[5], a1[6]);

  }
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

- (PKPaymentAuthorizationControllerPrivateDelegate)privateDelegate
{
  return (PKPaymentAuthorizationControllerPrivateDelegate *)objc_loadWeakRetained((id *)&self->_privateDelegate);
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
  objc_storeStrong((id *)&self->_retainSelf, 0);
}

@end
