@implementation PKPaymentAuthorizationProvisioningInterface

- (PKPaymentAuthorizationProvisioningInterface)initWithContext:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  PKPaymentAuthorizationProvisioningInterface *v9;
  PKPaymentAuthorizationProvisioningInterface *v10;
  uint64_t v11;
  UIViewController *primaryViewController;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentAuthorizationProvisioningInterface;
  v9 = -[PKPaymentAuthorizationProvisioningInterface init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    -[PKPaymentAuthorizationProvisioningInterface createPrimaryViewController](v10, "createPrimaryViewController");
    v11 = objc_claimAutoreleasedReturnValue();
    primaryViewController = v10->_primaryViewController;
    v10->_primaryViewController = (UIViewController *)v11;

  }
  return v10;
}

- (id)createPrimaryViewController
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  PKPaymentSetupDismissibleNavigationController *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v3 = objc_alloc(MEMORY[0x1E0D67230]);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithWebService:", v4);

  -[PKPaymentAuthorizationContext request](self->_context, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "supportedNetworks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowedPaymentNetworks:", v7);

  -[PKPaymentAuthorizationContext request](self->_context, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "isPayLaterPaymentRequest");

  if ((_DWORD)v7)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    objc_msgSend(v5, "setAllowedFeatureIdentifiers:", v9);

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67540]), "initWithEnvironment:provisioningController:groupsController:", 8, v5, 0);
  v11 = -[PKPaymentSetupDismissibleNavigationController initWithContext:]([PKPaymentSetupDismissibleNavigationController alloc], "initWithContext:", 8);
  -[PKPaymentSetupDismissibleNavigationController useStandardPlatformPresentationStyle](v11, "useStandardPlatformPresentationStyle");
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__PKPaymentAuthorizationProvisioningInterface_createPrimaryViewController__block_invoke;
  v14[3] = &unk_1E3E61B68;
  objc_copyWeak(&v16, &location);
  v12 = v5;
  v15 = v12;
  +[PKProvisioningFlowBridge startProvisionToPurchaseFlowWithNavController:context:onFirstViewControllerShown:completion:](PKProvisioningFlowBridge, "startProvisionToPurchaseFlowWithNavController:context:onFirstViewControllerShown:completion:", v11, v10, 0, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __74__PKPaymentAuthorizationProvisioningInterface_createPrimaryViewController__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "provisionedPasses");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "secureElementPass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_loadWeakRetained(WeakRetained + 4);
    objc_msgSend(v6, "paymentAuthorizationProvisioningDidFinishWithPass:", v5);

  }
}

- (UIViewController)primaryViewController
{
  return self->_primaryViewController;
}

- (PKPaymentAuthorizationProvisioningInterfaceDelegate)delegate
{
  return (PKPaymentAuthorizationProvisioningInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_primaryViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
