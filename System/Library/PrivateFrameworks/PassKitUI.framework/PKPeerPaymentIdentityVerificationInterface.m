@implementation PKPeerPaymentIdentityVerificationInterface

+ (void)interfaceWithContext:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0D67418]);
  objc_msgSend(v10, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDevSigned:", objc_msgSend(v13, "devSigned"));

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__PKPeerPaymentIdentityVerificationInterface_interfaceWithContext_configuration_completion___block_invoke;
  v17[3] = &unk_1E3E6A260;
  v19 = v8;
  v20 = v9;
  v18 = v7;
  v14 = v8;
  v15 = v7;
  v16 = v9;
  objc_msgSend(v11, "peerPaymentIdentityVerificationRequest:completion:", v12, v17);

}

void __92__PKPeerPaymentIdentityVerificationInterface_interfaceWithContext_configuration_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__PKPeerPaymentIdentityVerificationInterface_interfaceWithContext_configuration_completion___block_invoke_2;
  block[3] = &unk_1E3E66418;
  v10 = v6;
  v11 = v5;
  v14 = a1[6];
  v12 = a1[4];
  v13 = a1[5];
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __92__PKPeerPaymentIdentityVerificationInterface_interfaceWithContext_configuration_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  PKPeerPaymentIdentityVerificationInterface *v2;

  if (a1[4] || !a1[5])
  {
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    v1 = a1[8];
    v2 = -[PKPeerPaymentIdentityVerificationInterface initWithContext:configuration:verificationResponse:]([PKPeerPaymentIdentityVerificationInterface alloc], "initWithContext:configuration:verificationResponse:", a1[6], a1[7], a1[5]);
    (*(void (**)(uint64_t, PKPeerPaymentIdentityVerificationInterface *))(v1 + 16))(v1, v2);

  }
}

- (PKPeerPaymentIdentityVerificationInterface)initWithContext:(id)a3 configuration:(id)a4 verificationResponse:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPeerPaymentIdentityVerificationInterface *v12;
  PKPeerPaymentIdentityVerificationInterface *v13;
  uint64_t v14;
  UIViewController *primaryViewController;
  PKPeerPaymentIdentityVerificationInterface *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentIdentityVerificationInterface;
  v12 = -[PKPeerPaymentIdentityVerificationInterface init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_configuration, a4);
    -[PKPeerPaymentIdentityVerificationInterface createPrimaryViewControllerWithVerificationResponse:](v13, "createPrimaryViewControllerWithVerificationResponse:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v16 = 0;
      goto LABEL_6;
    }
    primaryViewController = v13->_primaryViewController;
    v13->_primaryViewController = (UIViewController *)v14;

  }
  v16 = v13;
LABEL_6:

  return v16;
}

- (id)createPrimaryViewControllerWithVerificationResponse:(id)a3
{
  id v4;
  PKPeerPaymentIdentityVerificationController *v5;
  void *v6;
  PKPeerPaymentIdentityVerificationController *v7;
  void *v8;
  PKNavigationController *v9;

  v4 = a3;
  if (PKDeviceSupportsPeerPaymentIdentityVerification())
  {
    v5 = [PKPeerPaymentIdentityVerificationController alloc];
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKPeerPaymentIdentityVerificationController initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:](v5, "initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:", v6, v4, self, 0, 8);

    -[PKPeerPaymentIdentityVerificationController firstViewController](v7, "firstViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v8);
      -[PKNavigationController setSupportedInterfaceOrientations:](v9, "setSupportedInterfaceOrientations:", 2);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__PKPeerPaymentIdentityVerificationInterface_viewControllerDidTerminateSetupFlow___block_invoke;
  v5[3] = &unk_1E3E654F8;
  v5[4] = self;
  objc_msgSend(v4, "updateAccountWithCompletion:", v5);

}

void __82__PKPeerPaymentIdentityVerificationInterface_viewControllerDidTerminateSetupFlow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__PKPeerPaymentIdentityVerificationInterface_viewControllerDidTerminateSetupFlow___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __82__PKPeerPaymentIdentityVerificationInterface_viewControllerDidTerminateSetupFlow___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "peerPaymentIdentityVerificationDidFinishWithAccount:", *(_QWORD *)(a1 + 40));

}

- (void)viewControllerDidCancelSetupFlow:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  PKPeerPaymentIdentityVerificationInterface *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134349056;
    v7 = self;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentIdentityVerificationInterface (%{public}p): Dismissing because setup was cancelled", (uint8_t *)&v6, 0xCu);
  }

  -[PKPaymentAuthorizationInterfaceConfiguration presenter](self->_configuration, "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissWithReason:error:completion:", 3, 0, 0);

}

- (UIViewController)primaryViewController
{
  return self->_primaryViewController;
}

- (PKPeerPaymentIdentityVerificationInterfaceDelegate)delegate
{
  return (PKPeerPaymentIdentityVerificationInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
