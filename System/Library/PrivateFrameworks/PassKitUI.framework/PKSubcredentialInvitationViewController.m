@implementation PKSubcredentialInvitationViewController

- (PKSubcredentialInvitationViewController)initWithFlowController:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  PKSubcredentialInvitationViewController *v9;
  PKSubcredentialInvitationViewController *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  PKContactResolver *contactResolver;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = -[PKPassShareRedemptionViewController init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_flowController, a3);
    objc_storeStrong((id *)&v10->_provisioningContext, a4);
    v11 = objc_alloc(MEMORY[0x1E0D66C60]);
    v12 = objc_alloc_init(MEMORY[0x1E0C97298]);
    -[PKSubcredentialInvitationViewController contactKeysToFetch](v10, "contactKeysToFetch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithContactStore:keysToFetch:", v12, v13);
    contactResolver = v10->_contactResolver;
    v10->_contactResolver = (PKContactResolver *)v14;

    -[PKPassShareRedemptionViewController setAnalyticsEnabled:](v10, "setAnalyticsEnabled:", 1);
    -[PKPassShareRedemptionViewController analyticsReporter](v10, "analyticsReporter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAccessPassType:", 4);

  }
  return v10;
}

- (unint64_t)operation
{
  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  void *v25;
  id v26;
  id v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PKSubcredentialInvitationViewController;
  -[PKPassShareRedemptionViewController viewDidLoad](&v28, sel_viewDidLoad);
  -[PKSubcredentialInvitationViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", 0);

  -[PKPassShareRedemptionViewController cardHeaderView](self, "cardHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3870];
  PKPassKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("SubcredentialInvitation"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSubcredentialInvitationFlowControllerContext localDeviceInvitation](self->_provisioningContext, "localDeviceInvitation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "originalInvitationMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "showLoadingContent");
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __54__PKSubcredentialInvitationViewController_viewDidLoad__block_invoke;
    v25 = &unk_1E3E631A0;
    v26 = v4;
    v27 = v7;
    PKCommonCachedImageFromURL(v11, &v22);

  }
  else
  {
    objc_msgSend(v4, "setCardImage:", v7);
  }
  -[PKSubcredentialInvitationViewController _titleTextForContext:](self, "_titleTextForContext:", self->_provisioningContext, v22, v23, v24, v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v12);

  -[PKSubcredentialInvitationViewController _bodyTextForContext:](self, "_bodyTextForContext:", self->_provisioningContext);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v13);

  PKLocalizedCredentialString(CFSTR("ADD_CAR_KEY"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareRedemptionViewController setContinueButtonText:](self, "setContinueButtonText:", v14);

  PKLocalizedCredentialString(CFSTR("NOT_NOW"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareRedemptionViewController setContinueLaterText:](self, "setContinueLaterText:", v15);

  -[PKSubcredentialInvitationFlowControllerContext localDeviceInvitation](self->_provisioningContext, "localDeviceInvitation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "originalInvitationMessage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "proprietaryData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayableSharedEntitlements");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareRedemptionViewController setDisplayableSharedEntitlements:](self, "setDisplayableSharedEntitlements:", v19);

  objc_msgSend(v17, "activationOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassShareRedemptionViewController setActivationOptions:](self, "setActivationOptions:", v20);

  objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setPrivacyLink:](self, "setPrivacyLink:", v21);
  -[PKPassShareRedemptionViewController showStartingUI](self, "showStartingUI");

}

uint64_t __54__PKSubcredentialInvitationViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (!a3)
    a3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setCardImage:", a3);
  return objc_msgSend(*(id *)(a1 + 32), "hideLoadingContent");
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  PKSubcredentialInvitationFlowControllerContext *provisioningContext;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  PKSubcredentialInvitationFlowControllerContext *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  PKContactResolver *contactResolver;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  id v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  id buf[2];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Preflighting accept invitation view controller...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v7 = (void *)objc_opt_class();
  provisioningContext = self->_provisioningContext;
  v9 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke;
  v28[3] = &unk_1E3E625E8;
  objc_copyWeak(&v30, buf);
  v10 = v6;
  v29 = v10;
  objc_msgSend(v7, "canAttemptLocalDeviceProvisioningWithContext:completion:", provisioningContext, v28);
  dispatch_group_enter(v10);
  v11 = (void *)objc_opt_class();
  v12 = self->_provisioningContext;
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_26;
  v25[3] = &unk_1E3E625E8;
  objc_copyWeak(&v27, buf);
  v13 = v10;
  v26 = v13;
  objc_msgSend(v11, "canAttemptRemoteDeviceProvisioningWithContext:completion:", v12, v25);
  if (self->_contactResolver)
  {
    dispatch_group_enter(v13);
    -[PKSubcredentialInvitationFlowControllerContext localDeviceInvitation](self->_provisioningContext, "localDeviceInvitation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "originatorIDSHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    contactResolver = self->_contactResolver;
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_27;
    v21[3] = &unk_1E3E6F408;
    objc_copyWeak(&v24, buf);
    v17 = v15;
    v22 = v17;
    v23 = v13;
    -[PKContactResolver contactForHandle:withCompletion:](contactResolver, "contactForHandle:withCompletion:", v17, v21);

    objc_destroyWeak(&v24);
  }
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_3;
  block[3] = &unk_1E3E61590;
  v20 = v4;
  v18 = v4;
  dispatch_group_notify(v13, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);

  objc_destroyWeak(buf);
}

void __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id *WeakRetained;
  id *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a2;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Should attempt to accept invite on local device: %ld", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[175], "setAcceptLocalDeviceInvitation:", a2);
    objc_msgSend(v8[175], "setAcceptLocalDeviceInvitationDisplayableError:", v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id *WeakRetained;
  id *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a2;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Should attempt to accept invite on remote device: %ld", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[175], "setAcceptRemoteDeviceInvitation:", a2);
    objc_msgSend(v8[175], "setAcceptRemoteDeviceInvitationDisplayableError:", v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_27(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_2;
  v5[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v9, a1 + 6);
  v6 = a1[4];
  v7 = v3;
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D67400], "displayNameForCounterpartHandle:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)WeakRetained[172];
    WeakRetained[172] = v2;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __67__PKSubcredentialInvitationViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Preflighting accept invitation view controller finished", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)resetState
{
  NSObject *v3;
  PKSubcredentialProvisioningViewModelProtocol *provisioningViewModel;
  PKSubcredentialProvisioningViewModelProtocol *remoteProvisioningViewModel;
  PKAppletSubcredentialSharingSession *session;
  uint8_t v7[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Reseting state of accept invitaiton view controller", v7, 2u);
  }

  provisioningViewModel = self->_provisioningViewModel;
  self->_provisioningViewModel = 0;

  remoteProvisioningViewModel = self->_remoteProvisioningViewModel;
  self->_remoteProvisioningViewModel = 0;

  -[PKAppletSubcredentialSharingSession endSession](self->_session, "endSession");
  session = self->_session;
  self->_session = 0;

  -[PKPassShareRedemptionViewController showStartingUI](self, "showStartingUI");
}

- (id)_titleTextForContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "isShareActivation"))
  {
    PKLocalizedShareableCredentialString(CFSTR("SHARE_ACTIVATION_REENTRY_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "localDeviceInvitation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "issuer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      PKLocalizedCredentialString(CFSTR("INVITATION_TITLE_CAR_MAKE"), CFSTR("%@"), v6);
    else
      PKLocalizedCredentialString(CFSTR("INVITATION_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_bodyTextForContext:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _BOOL4 v14;
  __CFString **v15;
  NSString *p_isa;
  NSString *contactName;

  if (!objc_msgSend(a3, "isShareActivation"))
  {
    -[PKSubcredentialInvitationFlowControllerContext localDeviceInvitation](self->_provisioningContext, "localDeviceInvitation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entitlement");
    v6 = PKAppletSubcredentialEntitlementTypeFromValue();
    objc_msgSend(v5, "deviceModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      PKLocalizedCredentialString(CFSTR("FALLBACK_DEVICE_NAME"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    objc_msgSend(v5, "originatorIDSHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKContactResolver contactForHandle:](self->_contactResolver, "contactForHandle:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = CFSTR("_CONTACT");
    }
    else if (PKIsEmailAddress())
    {
      v13 = CFSTR("_EMAIL");
    }
    else
    {
      v13 = CFSTR("_PHONE");
    }
    v14 = -[PKSubcredentialInvitationFlowControllerContext acceptRemoteDeviceInvitation](self->_provisioningContext, "acceptRemoteDeviceInvitation");
    if (-[PKSubcredentialInvitationFlowControllerContext acceptLocalDeviceInvitation](self->_provisioningContext, "acceptLocalDeviceInvitation")&& v14)
    {
      if (v6 < 7)
      {
        v15 = off_1E3E6F450;
        goto LABEL_18;
      }
    }
    else
    {
      v15 = off_1E3E6F4C0;
      if (v14)
        v15 = off_1E3E6F488;
      if (v6 <= 6)
      {
LABEL_18:
        p_isa = &v15[v6]->isa;
        if (v11)
          goto LABEL_22;
        goto LABEL_21;
      }
    }
    p_isa = 0;
    if (v11)
      goto LABEL_22;
LABEL_21:
    contactName = self->_contactName;
    if (!contactName)
    {
LABEL_23:
      PKLocalizedCredentialString(p_isa, CFSTR("%@%@"), contactName, v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }
LABEL_22:
    -[NSString stringByAppendingString:](p_isa, "stringByAppendingString:", v13);
    p_isa = (NSString *)objc_claimAutoreleasedReturnValue();
    contactName = self->_contactName;
    goto LABEL_23;
  }
  PKLocalizedShareableCredentialString(CFSTR("SHARE_ACTIVATION_REENTRY_SUBTITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)sharingSessionWithDelegate:(id)a3 startSession:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PKAppletSubcredentialSharingSession *session;
  PKAppletSubcredentialSharingSession *v8;
  PKAppletSubcredentialSharingSession *v9;
  PKAppletSubcredentialSharingSession *v10;

  v4 = a4;
  v6 = a3;
  session = self->_session;
  if (!session)
  {
    if (v4)
      objc_msgSend(MEMORY[0x1E0D66AB0], "createSessionWithDelegate:", v6);
    else
      objc_msgSend(MEMORY[0x1E0D66AB0], "createPendingSessionWithDelegate:", v6);
    v8 = (PKAppletSubcredentialSharingSession *)objc_claimAutoreleasedReturnValue();
    v9 = self->_session;
    self->_session = v8;

    session = self->_session;
  }
  v10 = session;

  return v10;
}

- (void)startLocalDeviceProvisioning
{
  PKSubcredentialProvisioningViewModelProtocol *v3;
  PKSubcredentialProvisioningViewModelProtocol *provisioningViewModel;

  if (!self->_provisioningViewModel)
  {
    -[PKSubcredentialInvitationFlowControllerProtocol localDeviceProvisioningViewModelForOperation:](self->_flowController, "localDeviceProvisioningViewModelForOperation:", self);
    v3 = (PKSubcredentialProvisioningViewModelProtocol *)objc_claimAutoreleasedReturnValue();
    provisioningViewModel = self->_provisioningViewModel;
    self->_provisioningViewModel = v3;

    -[PKSubcredentialProvisioningViewModelProtocol startProvisioning](self->_provisioningViewModel, "startProvisioning");
  }
}

- (void)startRemoteDeviceProvisioning
{
  PKSubcredentialProvisioningViewModelProtocol *v3;
  PKSubcredentialProvisioningViewModelProtocol *remoteProvisioningViewModel;

  if (!self->_remoteProvisioningViewModel)
  {
    -[PKSubcredentialInvitationFlowControllerProtocol remoteDeviceProvisioningViewModelForOperation:](self->_flowController, "remoteDeviceProvisioningViewModelForOperation:", self);
    v3 = (PKSubcredentialProvisioningViewModelProtocol *)objc_claimAutoreleasedReturnValue();
    remoteProvisioningViewModel = self->_remoteProvisioningViewModel;
    self->_remoteProvisioningViewModel = v3;

    -[PKSubcredentialProvisioningViewModelProtocol startProvisioning](self->_remoteProvisioningViewModel, "startProvisioning");
  }
}

- (void)advanceToNextState
{
  NSObject *v3;
  PKSubcredentialInvitationFlowControllerProtocol *flowController;
  _QWORD v5[4];
  id v6;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Finished accepting all invitations", buf, 2u);
  }

  flowController = self->_flowController;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__PKSubcredentialInvitationViewController_advanceToNextState__block_invoke;
  v5[3] = &unk_1E3E62638;
  objc_copyWeak(&v6, &location);
  -[PKSubcredentialInvitationFlowControllerProtocol nextViewControllerFromProvisioningOperation:withCompletion:](flowController, "nextViewControllerFromProvisioningOperation:withCompletion:", self, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __61__PKSubcredentialInvitationViewController_advanceToNextState__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "showSuccessUI");
    if (v6)
    {
      objc_msgSend(v4, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pk_presentPaymentSetupViewController:animated:delay:completion:", v6, 1, 2000000000, 0);

    }
    else
    {
      objc_msgSend(v4[176], "provisioningFinishedWithOperation:", v4);
    }
  }

}

- (id)contactKeysToFetch
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C966A8];
  v6[0] = v2;
  v6[1] = v3;
  v6[2] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)continueButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  PKSubcredentialInvitationFlowControllerProtocol *flowController;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[16];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKSubcredentialInvitationViewController;
  -[PKPassShareRedemptionViewController continueButtonPressed](&v16, sel_continueButtonPressed);
  -[PKPassShareRedemptionViewController showLoadingUI](self, "showLoadingUI");
  if (-[PKSubcredentialInvitationFlowControllerContext acceptLocalDeviceInvitation](self->_provisioningContext, "acceptLocalDeviceInvitation"))
  {
    -[PKSubcredentialInvitationViewController startLocalDeviceProvisioning](self, "startLocalDeviceProvisioning");
  }
  else if (-[PKSubcredentialInvitationFlowControllerContext acceptRemoteDeviceInvitation](self->_provisioningContext, "acceptRemoteDeviceInvitation"))
  {
    -[PKSubcredentialProvisioningFlowControllerContext provisionedPass](self->_provisioningContext, "provisionedPass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[PKSubcredentialInvitationFlowControllerContext localDeviceInvitation](self->_provisioningContext, "localDeviceInvitation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pairedReaderIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "localDevicePassMatchingPairedTerminalIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && objc_msgSend((id)objc_opt_class(), "isPassPersonalizedOrPersonalizing:", v6))
        -[PKSubcredentialProvisioningFlowControllerContext setProvisionedPass:](self->_provisioningContext, "setProvisionedPass:", v6);

    }
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Attempting remote device provisioning.", buf, 2u);
    }

    self->_shouldSurfaceRemoteDeviceProvisioningErrors = !-[PKSubcredentialInvitationFlowControllerContext acceptLocalDeviceInvitation](self->_provisioningContext, "acceptLocalDeviceInvitation");
    -[PKSubcredentialInvitationViewController startRemoteDeviceProvisioning](self, "startRemoteDeviceProvisioning");
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Selected continue but neither local nor remote devices can attempt provisioning.", buf, 2u);
    }

    -[PKSubcredentialInvitationFlowControllerContext acceptLocalDeviceInvitationDisplayableError](self->_provisioningContext, "acceptLocalDeviceInvitationDisplayableError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[PKSubcredentialInvitationFlowControllerContext acceptRemoteDeviceInvitationDisplayableError](self->_provisioningContext, "acceptRemoteDeviceInvitationDisplayableError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6B9E8], 16, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    flowController = self->_flowController;
    v11 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__PKSubcredentialInvitationViewController_continueButtonPressed__block_invoke;
    v14[3] = &unk_1E3E612E8;
    v14[4] = self;
    -[PKSubcredentialInvitationFlowControllerProtocol alertForOperation:withError:retryHandler:cancelationHandler:](flowController, "alertForOperation:withError:retryHandler:cancelationHandler:", self, v9, 0, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __64__PKSubcredentialInvitationViewController_continueButtonPressed__block_invoke_2;
    v13[3] = &unk_1E3E612E8;
    v13[4] = self;
    -[PKSubcredentialInvitationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, v13);

  }
}

uint64_t __64__PKSubcredentialInvitationViewController_continueButtonPressed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "provisioningWasCanceledWithOperation:");
}

uint64_t __64__PKSubcredentialInvitationViewController_continueButtonPressed__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showFailureUI");
}

- (void)continueLaterButtonPressed
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSubcredentialInvitationViewController;
  -[PKPassShareRedemptionViewController continueLaterButtonPressed](&v3, sel_continueLaterButtonPressed);
  -[PKSubcredentialInvitationFlowControllerProtocol provisioningWasCanceledWithOperation:](self->_flowController, "provisioningWasCanceledWithOperation:", self);
}

- (void)activationCodeDidChangeToCode:(id)a3
{
  PKSubcredentialInvitationFlowControllerContext *provisioningContext;
  id v5;
  void *v6;
  id v7;

  provisioningContext = self->_provisioningContext;
  v5 = a3;
  -[PKSubcredentialInvitationFlowControllerContext localDeviceInvitation](provisioningContext, "localDeviceInvitation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActivationCode:", v5);

  -[PKSubcredentialInvitationFlowControllerContext remoteDeviceInvitation](self->_provisioningContext, "remoteDeviceInvitation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActivationCode:", v5);

}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithError:(id)a4 inState:(int64_t)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke;
  v8[3] = &unk_1E3E61388;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void **v14;
  _BOOL4 v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void (**v24)(_QWORD);
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  BOOL v34;
  _QWORD aBlock[5];
  id v36;
  BOOL v37;
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(v2 + 1360) != 0;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2;
  aBlock[3] = &unk_1E3E64908;
  aBlock[4] = v2;
  v37 = v4;
  v36 = v3;
  v6 = _Block_copy(aBlock);
  v32[0] = v5;
  v32[1] = 3221225472;
  v32[2] = __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_3;
  v32[3] = &unk_1E3E64908;
  v34 = v4;
  v7 = *(void **)(a1 + 40);
  v32[4] = *(_QWORD *)(a1 + 32);
  v33 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(v32);
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v9 + 1360))
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v39 = v11;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Failed to accept local invitation with error: %@", buf, 0xCu);
    }

    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 1360);
    *(_QWORD *)(v12 + 1360) = 0;

    v14 = (void **)(*(_QWORD *)(a1 + 32) + 1352);
    v15 = 1;
  }
  else
  {
    if (!*(_QWORD *)(v9 + 1368))
    {
      v15 = 1;
      goto LABEL_10;
    }
    PKLogFacilityTypeGetObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v39 = v17;
      _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Failed to accepted remote invitation with error: %@", buf, 0xCu);
    }

    v18 = *(_QWORD *)(a1 + 32);
    v15 = *(_BYTE *)(v18 + 1392) != 0;
    v14 = (void **)(v18 + 1368);
  }
  v19 = *v14;
  *v14 = 0;

  v9 = *(_QWORD *)(a1 + 32);
LABEL_10:
  objc_msgSend(*(id *)(v9 + 1400), "setError:", *(_QWORD *)(a1 + 40));
  if (!v15)
    goto LABEL_14;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1400), "shouldExitFlowOnError") & 1) != 0)
    goto LABEL_14;
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 40);
  v22 = *(void **)(v20 + 1408);
  v30[0] = v5;
  v30[1] = 3221225472;
  v30[2] = __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_81;
  v30[3] = &unk_1E3E618A0;
  v23 = v6;
  v30[4] = *(_QWORD *)(a1 + 32);
  v31 = v23;
  v28[0] = v5;
  v28[1] = 3221225472;
  v28[2] = __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2_82;
  v28[3] = &unk_1E3E618A0;
  v24 = v8;
  v28[4] = *(_QWORD *)(a1 + 32);
  v29 = v24;
  objc_msgSend(v22, "alertForOperation:withError:retryHandler:cancelationHandler:", v20, v21, v30, v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = *(void **)(a1 + 32);
    v27[0] = v5;
    v27[1] = 3221225472;
    v27[2] = __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_3_83;
    v27[3] = &unk_1E3E612E8;
    v27[4] = v26;
    objc_msgSend(v26, "presentViewController:animated:completion:", v25, 1, v27);

  }
  else
  {
LABEL_14:
    v8[2](v8);
    objc_msgSend(*(id *)(a1 + 32), "advanceToNextState");
  }

}

void __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "analyticsReporter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sendEventForPage:error:specifics:", 0, *(_QWORD *)(a1 + 40), 0);

  }
}

void __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "analyticsReporter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    v5 = *MEMORY[0x1E0D697F0];
    v6[0] = *MEMORY[0x1E0D68BE0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sendEventForPage:error:specifics:", 2, v3, v4);

  }
}

uint64_t __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_81(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "showStartingUI");
}

uint64_t __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_2_82(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "provisioningWasCanceledWithOperation:");
}

uint64_t __106__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithError_inState___block_invoke_3_83(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showFailureUI");
}

- (void)subcredentialProvisioningController:(id)a3 didFinishWithPass:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __97__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __97__PKSubcredentialInvitationViewController_subcredentialProvisioningController_didFinishWithPass___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint8_t v15[8];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "analyticsReporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0D697F0];
  v17[0] = *MEMORY[0x1E0D68BE8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendEventForPage:specifics:", 2, v3);

  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v4 + 1360))
  {
    if (!*(_QWORD *)(v4 + 1368))
      return;
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Successfully accepted remote invitation.", v15, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1400), "setProvisionedRemotePass:", *(_QWORD *)(a1 + 40));
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 1368);
    *(_QWORD *)(v13 + 1368) = 0;

    goto LABEL_12;
  }
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Successfully accepted local invitation.", v15, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1400), "setProvisionedPass:", *(_QWORD *)(a1 + 40));
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1400), "acceptRemoteDeviceInvitation");
  v7 = v6;
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "startRemoteDeviceProvisioning");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 1360);
  *(_QWORD *)(v8 + 1360) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 1352);
  *(_QWORD *)(v10 + 1352) = 0;

  if ((v7 & 1) == 0)
LABEL_12:
    objc_msgSend(*(id *)(a1 + 32), "advanceToNextState");
}

- (void)subcredentialProvisioningController:(id)a3 shouldFailAfterError:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  void (**v18)(id, uint64_t);
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  if (!v10)
    goto LABEL_12;
  objc_msgSend(v9, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = PKEqualObjects();

  if ((v12 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Unexpected error while checking for hard failure: %@", buf, 0xCu);
    }

    goto LABEL_11;
  }
  v13 = objc_msgSend(v9, "code");
  if (v13 != 19 && v13 != 7)
  {
LABEL_11:
    v10[2](v10, 1);
    goto LABEL_12;
  }
  PKLogFacilityTypeGetObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Asking if registration error should cause failure.", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__PKSubcredentialInvitationViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke;
  block[3] = &unk_1E3E65388;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_12:
}

void __115__PKSubcredentialInvitationViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke(id *a1)
{
  id v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  __int16 v10[8];
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  objc_initWeak(&location, a1[4]);
  v3 = a1[4];
  v2 = a1[5];
  v4 = (void *)v3[176];
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __115__PKSubcredentialInvitationViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_2;
  v15[3] = &unk_1E3E61850;
  v6 = v2;
  v16 = v6;
  v17 = a1[6];
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __115__PKSubcredentialInvitationViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_84;
  v11[3] = &unk_1E3E6F430;
  v12 = a1[5];
  objc_copyWeak(&v14, &location);
  v13 = a1[6];
  objc_msgSend(v4, "alertForOperation:withError:retryHandler:cancelationHandler:", v3, v6, v15, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1[4], "analyticsReporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendEventForPage:error:specifics:", 0, a1[5], 0);

    objc_msgSend(a1[4], "presentViewController:animated:completion:", v7, 1, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 0;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "No alert for registration error", (uint8_t *)v10, 2u);
    }

    (*((void (**)(void))a1[6] + 2))();
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __115__PKSubcredentialInvitationViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "User choose to try accepting again after error: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __115__PKSubcredentialInvitationViewController_subcredentialProvisioningController_shouldFailAfterError_withCompletion___block_invoke_84(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "User choose to cancel accepting after error: %@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "provisioningContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldExitFlowOnError:", 1);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (PKSubcredentialInvitationFlowControllerContext)provisioningContext
{
  return self->_provisioningContext;
}

- (void)setProvisioningContext:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningContext, a3);
}

- (PKSubcredentialInvitationFlowControllerProtocol)flowController
{
  return self->_flowController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowController, 0);
  objc_storeStrong((id *)&self->_provisioningContext, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
  objc_storeStrong((id *)&self->_remoteProvisioningViewModel, 0);
  objc_storeStrong((id *)&self->_provisioningViewModel, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
