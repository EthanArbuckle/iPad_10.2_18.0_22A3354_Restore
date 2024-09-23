@implementation PKPeerPaymentAccountResolutionController

- (PKPeerPaymentAccountResolutionController)initWithAccount:(id)a3 webService:(id)a4 context:(int64_t)a5 delegate:(id)a6 passLibraryDataProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPeerPaymentAccountResolutionController *v17;
  PKPeerPaymentAccountResolutionController *v18;
  id v19;
  void **p_passLibraryDataProvider;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)PKPeerPaymentAccountResolutionController;
  v17 = -[PKPeerPaymentAccountResolutionController init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_account, a3);
    objc_storeStrong((id *)&v18->_webService, a4);
    v18->_context = a5;
    v19 = objc_storeWeak((id *)&v18->_delegate, v15);

    if (!v15)
      objc_storeWeak((id *)&v18->_delegate, v18);
    p_passLibraryDataProvider = (void **)&v18->_passLibraryDataProvider;
    objc_storeStrong((id *)&v18->_passLibraryDataProvider, a7);
    if (!v18->_passLibraryDataProvider)
    {
      v21 = objc_alloc_init(MEMORY[0x1E0D66F18]);
      v22 = *p_passLibraryDataProvider;
      *p_passLibraryDataProvider = v21;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0D6B2B8];
    -[PKPeerPaymentWebService targetDevice](v18->_webService, "targetDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v18, sel__peerPaymentAccountChanged_, v24, v25);

  }
  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentAccountResolutionController;
  -[PKPeerPaymentAccountResolutionController dealloc](&v4, sel_dealloc);
}

- (void)presentResolutionForCurrentAccountStateWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPeerPaymentAccountResolutionController presentFlowForAccountResolution:configuration:completion:](self, "presentFlowForAccountResolution:configuration:completion:", -[PKPeerPaymentAccountResolutionController currentPeerPaymentAccountResolution](self, "currentPeerPaymentAccountResolution"), 0, v4);

}

- (void)_presentFlowForAccountResolution:(unint64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    PKPeerPaymentAccountResolutionStateToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v11;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Presenting flow for peer payment account resolution: \"%@\" configuration: %@.", (uint8_t *)&v12, 0x16u);

  }
  switch(a3)
  {
    case 1uLL:
      -[PKPeerPaymentAccountResolutionController _presentActivationFlowWithConfiguration:completion:](self, "_presentActivationFlowWithConfiguration:completion:", v8, v9);
      break;
    case 2uLL:
      -[PKPeerPaymentAccountResolutionController _presentIdentityVerificationWithConfiguration:completion:](self, "_presentIdentityVerificationWithConfiguration:completion:", v8, v9);
      break;
    case 3uLL:
      -[PKPeerPaymentAccountResolutionController _presentContactAppleSupportAlertWithCompletion:](self, "_presentContactAppleSupportAlertWithCompletion:", v9);
      break;
    case 4uLL:
      -[PKPeerPaymentAccountResolutionController _presentReOpenFlowWithCompletion:](self, "_presentReOpenFlowWithCompletion:", v9);
      break;
    case 5uLL:
      -[PKPeerPaymentAccountResolutionController _presentPeerPaymentAction:withCompletion:](self, "_presentPeerPaymentAction:withCompletion:", 1, v9);
      break;
    default:
      if (v9)
        v9[2](v9, 0);
      break;
  }

}

- (unint64_t)currentPeerPaymentAccountResolution
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0D67428], "_peerPaymentPassForAccount:passLibraryDataProvider:", self->_account, self->_passLibraryDataProvider);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass();

  return v3;
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a5;
  v6 = (void *)MEMORY[0x1E0DC3470];
  v7 = a4;
  objc_msgSend(v6, "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "presentViewController:animated:completion:", v7, v5, 0);
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v4, 0);
}

- (BOOL)_hasPeerPaymentPassProvisioned
{
  return objc_msgSend(MEMORY[0x1E0D67428], "_hasPeerPaymentPassProvisionedForAccount:passLibraryDataProvider:", self->_account, self->_passLibraryDataProvider);
}

- (id)_peerPaymentPass
{
  return (id)objc_msgSend(MEMORY[0x1E0D67428], "_peerPaymentPassForAccount:passLibraryDataProvider:", self->_account, self->_passLibraryDataProvider);
}

+ (BOOL)_canShowContactSupportForPass:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v11;

  v3 = a3;
  v4 = PKUserInterfaceIdiom();
  objc_msgSend(v3, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADD8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (v4 & 0xFFFFFFFFFFFFFFFBLL) == 0 && v6 != 0 || v5 != 0 || v7 != 0;
  return v11;
}

- (id)_paymentWebService
{
  if (PKPaymentSetupContextIsBridge())
    -[objc_class watchPaymentWebService](getNPKCompanionAgentConnectionClass_0(), "watchPaymentWebService");
  else
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_presentActivationFlowWithCompletion:(id)a3
{
  -[PKPeerPaymentAccountResolutionController _presentActivationFlowWithConfiguration:completion:](self, "_presentActivationFlowWithConfiguration:completion:", 0, a3);
}

- (void)_presentActivationFlowWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  PKPeerPaymentAccountResolutionController *v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKPeerPaymentAccountResolutionController _paymentWebService](self, "_paymentWebService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67230]), "initWithWebService:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67408]), "initWithPeerPaymentAccount:", self->_account);
  if (v6)
  {
    objc_msgSend(v6, "currencyAmount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAmount:", v11);
    objc_msgSend(v10, "setFlowState:", objc_msgSend(v6, "registrationFlowState"));
    objc_msgSend(v6, "senderAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPendingPaymentSenderAddress:", v12);
    objc_msgSend(v10, "setPaymentMode:", objc_msgSend(v6, "paymentMode"));

  }
  if (v10)
  {
    objc_initWeak(location, self);
    v22[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __95__PKPeerPaymentAccountResolutionController__presentActivationFlowWithConfiguration_completion___block_invoke;
    v15[3] = &unk_1E3E6A0B0;
    objc_copyWeak(&v20, location);
    v16 = v9;
    v17 = self;
    v18 = v10;
    v19 = v7;
    objc_msgSend(v16, "associateCredentials:withCompletionHandler:", v13, v15);

    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Cannot present setup flow with a nil peer payment credential", (uint8_t *)location, 2u);
    }

    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __95__PKPeerPaymentAccountResolutionController__presentActivationFlowWithConfiguration_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__PKPeerPaymentAccountResolutionController__presentActivationFlowWithConfiguration_completion___block_invoke_2;
  block[3] = &unk_1E3E6A088;
  objc_copyWeak(&v16, (id *)(a1 + 64));
  v17 = a2;
  v11 = v5;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v12 = v6;
  v13 = v7;
  v14 = v8;
  v15 = *(id *)(a1 + 56);
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v16);
}

void __95__PKPeerPaymentAccountResolutionController__presentActivationFlowWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  id v5;
  PKPeerPaymentExplanationViewController *v6;
  PKNavigationController *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 80) && !*(_QWORD *)(a1 + 32))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0D66F18]);
      v6 = -[PKPeerPaymentExplanationViewController initWithProvisoningController:setupDelegate:passLibraryDataProvider:context:credential:]([PKPeerPaymentExplanationViewController alloc], "initWithProvisoningController:setupDelegate:passLibraryDataProvider:context:credential:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24), *(_QWORD *)(a1 + 56));
      v7 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v6);
      -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v7, "setCustomFormSheetPresentationStyleForiPad");
      objc_msgSend(*(id *)(a1 + 48), "_presentViewController:", v7);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "description");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v4;
        _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Peer Payment associateCredential failed for local device with error:%@", (uint8_t *)&v9, 0xCu);

      }
      +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", *(_QWORD *)(a1 + 32));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "_presentViewController:", v5);
    }

    v8 = *(_QWORD *)(a1 + 64);
    if (v8)
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
  }

}

- (void)_presentIdentityVerificationWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  PKPeerPaymentGraduationExplanationViewController *v8;
  PKNavigationController *v9;
  void *v10;
  PKPeerPaymentWebService *webService;
  _QWORD v12[4];
  id v13;
  PKPeerPaymentAccountResolutionController *v14;
  void (**v15)(id, uint64_t);

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if ((PKDeviceSupportsPeerPaymentIdentityVerification() & 1) != 0)
  {
    if (objc_msgSend(v6, "isGraduation"))
    {
      v8 = -[PKPeerPaymentGraduationExplanationViewController initWithPeerPaymentWebService:peerPaymentAccount:passLibraryDataProvider:setupDelegate:context:]([PKPeerPaymentGraduationExplanationViewController alloc], "initWithPeerPaymentWebService:peerPaymentAccount:passLibraryDataProvider:setupDelegate:context:", self->_webService, self->_account, self->_passLibraryDataProvider, self, self->_context);
      v9 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v8);
      -[PKNavigationController setModalInPresentation:](v9, "setModalInPresentation:", 1);
      -[PKNavigationController setSupportedInterfaceOrientations:](v9, "setSupportedInterfaceOrientations:", 2);
      PKPaymentSetupApplyContextAppearance(self->_context, v9);
      -[PKPeerPaymentAccountResolutionController _presentViewController:](self, "_presentViewController:", v9);
      if (v7)
        v7[2](v7, 1);

    }
    else
    {
      v8 = (PKPeerPaymentGraduationExplanationViewController *)objc_alloc_init(MEMORY[0x1E0D67418]);
      -[PKPeerPaymentWebService context](self->_webService, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentGraduationExplanationViewController setDevSigned:](v8, "setDevSigned:", objc_msgSend(v10, "devSigned"));

      -[PKPeerPaymentGraduationExplanationViewController setVerificationContext:](v8, "setVerificationContext:", objc_msgSend(v6, "verificationContext"));
      webService = self->_webService;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __101__PKPeerPaymentAccountResolutionController__presentIdentityVerificationWithConfiguration_completion___block_invoke;
      v12[3] = &unk_1E3E6A0D8;
      v13 = v6;
      v14 = self;
      v15 = v7;
      -[PKPeerPaymentWebService peerPaymentIdentityVerificationRequest:completion:](webService, "peerPaymentIdentityVerificationRequest:completion:", v8, v12);

    }
  }
  else
  {
    PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(0);
    v8 = (PKPeerPaymentGraduationExplanationViewController *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAccountResolutionController _presentViewController:](self, "_presentViewController:", v8);
    if (v7)
      v7[2](v7, 1);
  }

}

void __101__PKPeerPaymentAccountResolutionController__presentIdentityVerificationWithConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__PKPeerPaymentAccountResolutionController__presentIdentityVerificationWithConfiguration_completion___block_invoke_2;
  block[3] = &unk_1E3E669B8;
  v13 = v5;
  v14 = v6;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __101__PKPeerPaymentAccountResolutionController__presentIdentityVerificationWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  PKPeerPaymentIdentityVerificationController *v3;
  void *v4;
  PKNavigationController *v5;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  if (v2 && !*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v2, "setVerificationContext:", objc_msgSend(*(id *)(a1 + 48), "verificationContext"));
    v3 = -[PKPeerPaymentIdentityVerificationController initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:]([PKPeerPaymentIdentityVerificationController alloc], "initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 32), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 24));
    -[PKPeerPaymentIdentityVerificationController firstViewController](v3, "firstViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v4);
      -[PKNavigationController setModalInPresentation:](v5, "setModalInPresentation:", 1);
      -[PKNavigationController setSupportedInterfaceOrientations:](v5, "setSupportedInterfaceOrientations:", 2);
      PKPaymentSetupApplyContextAppearance(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 24), v5);
      objc_msgSend(*(id *)(a1 + 56), "_presentViewController:", v5);

    }
  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (id)_contactAppleSupportAlertControllerForPass:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "_canShowContactSupportForPass:", v4))
  {
    v5 = PKUserInterfaceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
    objc_msgSend(v4, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADD8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADE8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedValueForFieldKey:", *MEMORY[0x1E0D6ADF0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "organizationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("CONTACT_ISSUER"), CFSTR("%@"), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (v5 && v7)
    {
      PKLocalizedPaymentString(CFSTR("CONTACT_ISSUER_BY_PHONE_MESSAGE"), CFSTR("%1$@%2$@"), v9, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v27 = (void *)v10;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v10, v11, v5 != 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v13 = v5 == 0;
    else
      v13 = 0;
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONTACT_SUPPORT_CALL"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __87__PKPeerPaymentAccountResolutionController__contactAppleSupportAlertControllerForPass___block_invoke;
      v32[3] = &unk_1E3E61D90;
      v32[4] = self;
      v33 = v7;
      objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v32);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v16);

    }
    if (v6)
    {
      v17 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONTACT_SUPPORT_EMAIL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __87__PKPeerPaymentAccountResolutionController__contactAppleSupportAlertControllerForPass___block_invoke_2;
      v30[3] = &unk_1E3E61D90;
      v30[4] = self;
      v31 = v6;
      objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v19);

    }
    if (v8)
    {
      v20 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONTACT_SUPPORT_OPEN_URL"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __87__PKPeerPaymentAccountResolutionController__contactAppleSupportAlertControllerForPass___block_invoke_3;
      v28[3] = &unk_1E3E61D90;
      v28[4] = self;
      v29 = v8;
      objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, v28);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v22);

    }
    v23 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONTACT_SUPPORT_CANCEL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 1, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v25);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __87__PKPeerPaymentAccountResolutionController__contactAppleSupportAlertControllerForPass___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callSupportWithPhoneNumber:", *(_QWORD *)(a1 + 40));
}

uint64_t __87__PKPeerPaymentAccountResolutionController__contactAppleSupportAlertControllerForPass___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_emailSupportWithEmailAddress:", *(_QWORD *)(a1 + 40));
}

uint64_t __87__PKPeerPaymentAccountResolutionController__contactAppleSupportAlertControllerForPass___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openSupportWebsiteWithWebsiteURL:", *(_QWORD *)(a1 + 40));
}

- (void)_presentContactAppleSupportAlertWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, BOOL);

  v6 = (void (**)(id, BOOL))a3;
  -[PKPeerPaymentAccountResolutionController _peerPaymentPass](self, "_peerPaymentPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccountResolutionController _contactAppleSupportAlertControllerForPass:](self, "_contactAppleSupportAlertControllerForPass:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[PKPeerPaymentAccountResolutionController _presentViewController:](self, "_presentViewController:", v5);
  if (v6)
    v6[2](v6, v5 != 0);

}

- (void)_presentReOpenFlowWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD aBlock[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke;
  aBlock[3] = &unk_1E3E6A150;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v7 = v6;
  if (self->_context == 3)
  {
    v8 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACCOUNT_CLOSED_ALERT_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACCOUNT_CLOSED_ALERT_MESSAGE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACCOUNT_CLOSED_ALERT_CANCEL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v5;
    v25[1] = 3221225472;
    v25[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_3;
    v25[3] = &unk_1E3E61CA8;
    v14 = v4;
    v26 = v14;
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v15);

    v16 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACCOUNT_CLOSED_ALERT_REOPEN_CARD"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v5;
    v20 = 3221225472;
    v21 = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_4;
    v22 = &unk_1E3E6A178;
    v23 = v7;
    v24 = v14;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, &v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v18, v19, v20, v21, v22);

    -[PKPeerPaymentAccountResolutionController _presentViewController:](self, "_presentViewController:", v11);
  }
  else
  {
    (*((void (**)(void *, id))v6 + 2))(v6, v4);
  }

}

void __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__17;
  v10[4] = __Block_byref_object_dispose__17;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "cloudStoreZoneNames");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_46;
  v7[3] = &unk_1E3E6A128;
  v9 = v10;
  v7[4] = v4;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v5, "peerPaymentReOpenAccountWithCompletion:", v7);

  _Block_object_dispose(v10, 8);
}

void __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_46(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD block[5];
  id v10;
  __int128 v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E6A100;
  v12 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 40);
  v6 = (id)v8;
  v11 = v8;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v20 = v3;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Reseting cloud store container for zone names %@...", buf, 0xCu);
    }

    v4 = objc_alloc_init(MEMORY[0x1E0D66C20]);
    PKCurrentCloudStoreApplePayContainerName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 48);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_48;
    v17[3] = &unk_1E3E642A8;
    v8 = *(_QWORD *)(v7 + 40);
    v17[1] = 3221225472;
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v6;
    objc_msgSend(v4, "resetContainerWithIdentifier:zoneNames:completion:", v5, v8, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    PKTitleForDisplayableError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1AE46BC](v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_2_58;
    v15[3] = &unk_1E3E61CA8;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v14);

    objc_msgSend(*(id *)(a1 + 32), "_presentViewController:", v11);
  }

}

void __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_48(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_2_49;
  block[3] = &unk_1E3E66830;
  v5 = a2;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_2_49(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v2 = *(unsigned __int8 *)(a1 + 48);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Cloud store reset succuessful. Presenting activation flow.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_presentActivationFlowWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Error reseting the cloud store container.", buf, 2u);
    }

    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACTIVATION_FAILED_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACTIVATION_FAILED_MESSAGE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_56;
    v11[3] = &unk_1E3E61CA8;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v10);

    objc_msgSend(*(id *)(a1 + 32), "_presentViewController:", v7);
  }
}

uint64_t __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_56(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_2_58(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __77__PKPeerPaymentAccountResolutionController__presentReOpenFlowWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_presentPeerPaymentAction:(unint64_t)a3 withCompletion:(id)a4
{
  void (**v6)(id, _BOOL8);
  void *v7;
  _BOOL8 v8;
  id v9;
  PKPeerPaymentActionViewController *v10;
  PKPeerPaymentActionViewController *peerPaymentActionViewController;
  PKPeerPaymentActionViewController *v12;
  PKNavigationController *v13;
  id v14;
  uint64_t v15;

  v6 = (void (**)(id, _BOOL8))a4;
  -[PKPeerPaymentAccountResolutionController _peerPaymentPass](self, "_peerPaymentPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  v8 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:account:unableReason:displayableError:](PKPeerPaymentActionController, "canPerformPeerPaymentAction:account:unableReason:displayableError:", a3, self->_account, &v15, &v14);
  v9 = v14;
  if (v8)
  {
    +[PKPeerPaymentActionViewController peerPaymentActionViewControllerForAction:paymentPass:webService:passLibraryDataProvider:context:](PKPeerPaymentActionViewController, "peerPaymentActionViewControllerForAction:paymentPass:webService:passLibraryDataProvider:context:", a3, v7, self->_webService, self->_passLibraryDataProvider, self->_context);
    v10 = (PKPeerPaymentActionViewController *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionViewController setDelegate:](v10, "setDelegate:", self);
    peerPaymentActionViewController = self->_peerPaymentActionViewController;
    self->_peerPaymentActionViewController = v10;
    v12 = v10;

    v13 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v12);
    -[PKNavigationController setSupportedInterfaceOrientations:](v13, "setSupportedInterfaceOrientations:", 2);
    if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v13, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      -[PKNavigationController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 2);
    }
  }
  else
  {
    +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:](PKPeerPaymentActionController, "alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:", v15, v9, 0);
    v13 = (PKNavigationController *)objc_claimAutoreleasedReturnValue();
  }
  -[PKPeerPaymentAccountResolutionController _presentViewController:](self, "_presentViewController:", v13);
  if (v6)
    v6[2](v6, v8);

}

- (void)peerPaymentActionViewControllerDidCancel:(id)a3
{
  PKPeerPaymentActionViewController *peerPaymentActionViewController;

  -[PKPeerPaymentAccountResolutionController _dismissViewController](self, "_dismissViewController", a3);
  peerPaymentActionViewController = self->_peerPaymentActionViewController;
  self->_peerPaymentActionViewController = 0;

}

- (void)peerPaymentActionViewControllerDidPerformAction:(id)a3
{
  PKPeerPaymentActionViewController *peerPaymentActionViewController;

  -[PKPeerPaymentAccountResolutionController _dismissViewController](self, "_dismissViewController", a3);
  peerPaymentActionViewController = self->_peerPaymentActionViewController;
  self->_peerPaymentActionViewController = 0;

}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4;
  PKPaymentSetupNavigationController *v5;
  id WeakRetained;

  v4 = a3;
  v5 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", v4, self->_context);

  -[PKPaymentSetupNavigationController setPaymentSetupMode:](v5, "setPaymentSetupMode:", 1);
  -[PKNavigationController setCustomFormSheetPresentationStyleForiPad](v5, "setCustomFormSheetPresentationStyleForiPad");
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  -[PKPaymentSetupNavigationController setSetupDelegate:](v5, "setSetupDelegate:", WeakRetained);

  -[PKPaymentSetupNavigationController setShowsWelcomeViewController:](v5, "setShowsWelcomeViewController:", 0);
  -[PKPaymentSetupNavigationController setAllowsManualEntry:](v5, "setAllowsManualEntry:", 0);
  return v5;
}

- (void)_presentViewController:(id)a3
{
  PKPeerPaymentAccountResolutionControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "peerPaymentAccountResolutionController:requestsPresentViewController:animated:", self, v5, 1);

}

- (void)_dismissViewController
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "peerPaymentAccountResolutionController:requestsDismissCurrentViewControllerAnimated:", self, 1);

}

- (void)_peerPaymentAccountChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKPeerPaymentAccountResolutionController__peerPaymentAccountChanged___block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __71__PKPeerPaymentAccountResolutionController__peerPaymentAccountChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "targetDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v3;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)_emailSupportWithEmailAddress:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (Class (__cdecl *)())getMFMailComposeViewControllerClass;
  v5 = a3;
  if (-[objc_class canSendMail](v4(), "canSendMail"))
  {
    v6 = objc_alloc_init((Class)getMFMailComposeViewControllerClass());
    objc_msgSend(v6, "setMailComposeDelegate:", self);
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setToRecipients:", v7);
    -[PKPeerPaymentAccountResolutionController _presentViewController:](self, "_presentViewController:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mailto:%@"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "openURL:withOptions:", v10, 0);
  }
}

- (void)_callSupportWithPhoneNumber:(id)a3
{
  void *v3;
  id v4;

  PKTelephoneURLFromPhoneNumber();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v4, 0);

}

- (void)_openSupportWebsiteWithWebsiteURL:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "openURL:withOptions:", v4, 0);

  }
}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (PKPeerPaymentAccountResolutionControllerDelegate)delegate
{
  return (PKPeerPaymentAccountResolutionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaymentSetupDelegate)setupDelegate
{
  return (PKPaymentSetupDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_peerPaymentActionViewController, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
