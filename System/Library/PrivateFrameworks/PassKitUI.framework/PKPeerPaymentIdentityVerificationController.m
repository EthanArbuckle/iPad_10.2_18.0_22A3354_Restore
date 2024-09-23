@implementation PKPeerPaymentIdentityVerificationController

- (PKPeerPaymentIdentityVerificationController)init
{
  return -[PKPeerPaymentIdentityVerificationController initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:](self, "initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:", 0, 0, 0, 0, 0);
}

- (PKPeerPaymentIdentityVerificationController)initWithPeerPaymentWebService:(id)a3 identityVerificationResponse:(id)a4 setupDelegate:(id)a5 hideInitialSplashScreen:(BOOL)a6 context:(int64_t)a7
{
  _BOOL4 v8;
  id v13;
  id v14;
  id v15;
  PKPeerPaymentIdentityVerificationController *v16;
  PKPeerPaymentIdentityVerificationController *v17;
  uint64_t v18;
  UIViewController *firstViewController;
  objc_super v21;

  v8 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentIdentityVerificationController;
  v16 = -[PKPeerPaymentIdentityVerificationController init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_webService, a3);
    objc_storeStrong((id *)&v17->_response, a4);
    objc_storeWeak((id *)&v17->_setupDelegate, v15);
    v17->_viewControllerIndex = 0;
    v17->_context = a7;
    if (v17->_response)
    {
      -[PKPeerPaymentIdentityVerificationController _formViewControllersWithExplanationView:](v17, "_formViewControllersWithExplanationView:", !v8);
      -[PKPeerPaymentIdentityVerificationController _nextLocalViewController](v17, "_nextLocalViewController");
      v18 = objc_claimAutoreleasedReturnValue();
      firstViewController = v17->_firstViewController;
      v17->_firstViewController = (UIViewController *)v18;

    }
    -[PKPeerPaymentWebService prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:](v17->_webService, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", *MEMORY[0x1E0D6B120], 0, 0);
  }

  return v17;
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, _QWORD, unint64_t);
  char isKindOfClass;
  uint64_t v6;
  uint64_t v7;
  unint64_t fatalError;
  uint64_t v9;
  void (**v10)(id, uint64_t, uint64_t, _QWORD, unint64_t);
  void *v11;
  id v12;
  _QWORD v13[5];
  void (**v14)(id, uint64_t, uint64_t, _QWORD, unint64_t);
  id v15;
  _QWORD aBlock[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = (void (**)(id, uint64_t, uint64_t, _QWORD, unint64_t))a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__20;
  v23 = __Block_byref_object_dispose__20;
  -[PKPeerPaymentIdentityVerificationController _nextLocalViewController](self, "_nextLocalViewController");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v20[5])
  {
    if (v4)
    {
      if ((self->_fatalError & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v6 = v20[5];
        if ((isKindOfClass & 1) != 0)
        {
          v7 = 0;
          fatalError = self->_fatalError;
        }
        else
        {
          fatalError = 1;
          v7 = v20[5];
          v6 = 0;
        }
        v4[2](v4, v7, v6, 0, fatalError);
      }
      else
      {
        v4[2](v4, v20[5], 0, 0, 1uLL);
      }
    }
  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PKPeerPaymentIdentityVerificationController_nextViewControllerWithCompletion___block_invoke;
    aBlock[3] = &unk_1E3E6B410;
    aBlock[4] = self;
    v18 = &v19;
    v10 = v4;
    v17 = v10;
    v11 = _Block_copy(aBlock);
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __80__PKPeerPaymentIdentityVerificationController_nextViewControllerWithCompletion___block_invoke_2;
    v13[3] = &unk_1E3E6B438;
    v13[4] = self;
    v14 = v10;
    v12 = v11;
    v15 = v12;
    -[PKPeerPaymentIdentityVerificationController _identityVerificationResquestWithCompletion:](self, "_identityVerificationResquestWithCompletion:", v13);

  }
  _Block_object_dispose(&v19, 8);

}

uint64_t __80__PKPeerPaymentIdentityVerificationController_nextViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_formViewControllersWithExplanationView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_nextLocalViewController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0, 0, 1);
  return result;
}

void __80__PKPeerPaymentIdentityVerificationController_nextViewControllerWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void (*v16)(void);
  uint64_t v17;
  void *v18;

  v3 = a2;
  v18 = v3;
  if (!v3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (v4)
    {
      if (objc_msgSend(v4, "complete"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "account");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        if (v5)
        {
          v7 = objc_msgSend(v5, "state");
          if (objc_msgSend(v6, "identityVerificationRequired"))
          {
            objc_msgSend(*(id *)(a1 + 32), "_resetViewControllers");
            objc_msgSend(*(id *)(a1 + 32), "nextViewControllerWithCompletion:", *(_QWORD *)(a1 + 40));
LABEL_26:

            goto LABEL_27;
          }
          v13 = *MEMORY[0x1E0D68560];
          if (v7 == 3)
          {
            MEMORY[0x1A1AE3A74](v13, 0);
            MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68550], 0);
            objc_msgSend(*(id *)(a1 + 32), "_accountLockedErrorViewController");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "_resetViewControllers");
            v17 = *(_QWORD *)(a1 + 40);
            if (v17)
            {
              v16 = *(void (**)(void))(v17 + 16);
              goto LABEL_22;
            }
LABEL_23:

            goto LABEL_26;
          }
          if (v7 == 2)
          {
            MEMORY[0x1A1AE3A74](v13, 0);
            MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68558], 0);
            objc_msgSend(*(id *)(a1 + 32), "_accountRestrictedErrorViewController");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "_resetViewControllers");
            v15 = *(_QWORD *)(a1 + 40);
            if (v15)
            {
              v16 = *(void (**)(void))(v15 + 16);
LABEL_22:
              v16();
              goto LABEL_23;
            }
            goto LABEL_23;
          }
          MEMORY[0x1A1AE3A74](v13, 0);
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        goto LABEL_26;
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_27:
      v11 = v18;
      goto LABEL_28;
    }
  }
  objc_msgSend(v3, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68548], 0);
  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_verificationErrorViewControllerWithError:", v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_resetViewControllers");
    if (*(_QWORD *)(a1 + 40))
    {
      if (objc_msgSend(v18, "code") == 40331)
        v12 = 6;
      else
        v12 = 3;
      (*(void (**)(_QWORD, _QWORD, void *, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v6, 0, v12);
    }
    goto LABEL_26;
  }
  v10 = *(_QWORD *)(a1 + 40);
  v11 = v18;
  if (v10)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *, uint64_t))(v10 + 16))(v10, 0, 0, v18, 2);
    goto LABEL_27;
  }
LABEL_28:

}

- (void)didDismissViewController
{
  --self->_viewControllerIndex;
}

- (void)_identityVerificationResquestWithCompletion:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  PKPeerPaymentWebService *webService;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init(MEMORY[0x1E0D67418]);
  v6 = *MEMORY[0x1E0D6B2A0];
  -[PKPaymentSetupFieldsModel submissionValuesForDestination:](self->_fieldsModel, "submissionValuesForDestination:", *MEMORY[0x1E0D6B2A0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverlayParameters:", v7);
  -[PKPaymentSetupFieldsModel secureSubmissionValuesForDestination:](self->_fieldsModel, "secureSubmissionValuesForDestination:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecureOverlayParameters:", v8);
  -[PKPeerPaymentIdentityVerificationResponse encryptionCertificates](self->_response, "encryptionCertificates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCertificates:", v9);

  webService = self->_webService;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__PKPeerPaymentIdentityVerificationController__identityVerificationResquestWithCompletion___block_invoke;
  v12[3] = &unk_1E3E6B460;
  objc_copyWeak(&v14, &location);
  v12[4] = self;
  v11 = v4;
  v13 = v11;
  -[PKPeerPaymentWebService peerPaymentIdentityVerificationRequest:completion:](webService, "peerPaymentIdentityVerificationRequest:completion:", v5, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __91__PKPeerPaymentIdentityVerificationController__identityVerificationResquestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __91__PKPeerPaymentIdentityVerificationController__identityVerificationResquestWithCompletion___block_invoke_2;
    v8[3] = &unk_1E3E65E08;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v11 = *(id *)(a1 + 40);
    v10 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

uint64_t __91__PKPeerPaymentIdentityVerificationController__identityVerificationResquestWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_resetViewControllers
{
  NSArray *viewControllers;
  PKPaymentSetupFieldsModel *fieldsModel;

  viewControllers = self->_viewControllers;
  self->_viewControllers = 0;

  self->_viewControllerIndex = 0;
  fieldsModel = self->_fieldsModel;
  self->_fieldsModel = 0;

}

- (id)_verificationErrorViewControllerWithError:(id)a3
{
  id v4;
  PKExplanationViewController *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  PKMultiHyperlinkView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  PKTextRangeHyperlink *v36;
  void *v37;
  void *v38;

  v4 = a3;
  v5 = -[PKExplanationViewController initWithContext:]([PKExplanationViewController alloc], "initWithContext:", self->_context);
  -[PKExplanationViewController setShowDoneButton:](v5, "setShowDoneButton:", 0);
  -[PKExplanationViewController setShowCancelButton:](v5, "setShowCancelButton:", 0);
  v6 = objc_msgSend(v4, "code");
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v4;
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D6B2D8])
    || ((unint64_t)(v6 - 40320) > 0xB || ((1 << (v6 + 0x80)) & 0xC01) == 0) && v6 != 40014)
  {

    v8 = 0;
    v10 = 0;
LABEL_9:
    PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_FAILED_TITLE"));
    v11 = objc_claimAutoreleasedReturnValue();

    PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_COULD_NOT_BE_COMPLETED_MESSAGE"));
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
    v8 = (void *)v11;
    goto LABEL_10;
  }

  objc_msgSend(v4, "localizedFailureReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedRecoverySuggestion");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8 || !v9)
    goto LABEL_9;
LABEL_10:
  -[PKExplanationViewController explanationView](v5, "explanationView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitleText:", v8);
  objc_msgSend(v13, "setBodyText:", v10);
  objc_msgSend(v13, "setTitleLineBreakStrategy:", 1);
  objc_msgSend(v13, "setShowPrivacyView:", 0);
  objc_msgSend(v13, "dockView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "footerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == 40331)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = v10;
    PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_LEARN_MORE_BUTTON"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_FAILED_NOMO_FORMAT"), CFSTR("%@%@"), v19, v37);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = -[PKTextRangeHyperlink initWithLinkText:action:]([PKTextRangeHyperlink alloc], "initWithLinkText:action:", v37, &__block_literal_global_83);
    v20 = v18;
    objc_msgSend(v18, "addObject:", v36);
    v21 = objc_alloc_init(PKMultiHyperlinkView);
    -[PKMultiHyperlinkView setText:](v21, "setText:", v35);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultiHyperlinkView setTextColor:](v21, "setTextColor:", v22);

    -[PKMultiHyperlinkView setTextAlignment:](v21, "setTextAlignment:", 1);
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultiHyperlinkView setTextFont:](v21, "setTextFont:", v23);

    v24 = v20;
    -[PKMultiHyperlinkView setSources:](v21, "setSources:", v20);
    objc_msgSend(v13, "setBodyView:", v21);
    objc_msgSend(v13, "setBodyText:", 0);
    objc_msgSend(v13, "setForceShowSetupLaterButton:", 1);
    objc_msgSend(v14, "primaryButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_FAILED_CONTACT_SUPPORT_BUTTON"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTitle:forState:", v26, 0);

    objc_msgSend(v15, "setupLaterButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_NOT_NOW_BUTTON"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTitle:forState:", v28, 0);

    objc_msgSend(v15, "setManualEntryButton:", 0);
  }
  else
  {
    if (v6 == 40330)
    {
      objc_msgSend(v14, "primaryButton");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedString(CFSTR("DONE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:forState:", v17, 0);

      objc_msgSend(v15, "setSetupLaterButton:", 0);
    }
    else
    {
      objc_msgSend(v13, "setForceShowSetupLaterButton:", 1);
      objc_msgSend(v14, "primaryButton");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_TRY_AGAIN_BUTTON"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTitle:forState:", v30, 0);

      objc_msgSend(v15, "setupLaterButton");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_VERIFY_LATER_BUTTON"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setTitle:forState:", v32, 0);

    }
    objc_msgSend(v15, "setManualEntryButton:", 0);
  }
  -[PKExplanationViewController navigationItem](v5, "navigationItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setHidesBackButton:", 1);

  return v5;
}

void __89__PKPeerPaymentIdentityVerificationController__verificationErrorViewControllerWithError___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/102636"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "openURL:configuration:completionHandler:", v1, 0, 0);

  }
}

- (id)_accountRestrictedErrorViewController
{
  PKExplanationViewController *v2;
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = -[PKExplanationViewController initWithContext:]([PKExplanationViewController alloc], "initWithContext:", self->_context);
  -[PKExplanationViewController setShowDoneButton:](v2, "setShowDoneButton:", 0);
  -[PKExplanationViewController setShowCancelButton:](v2, "setShowCancelButton:", 0);
  -[PKExplanationViewController explanationView](v2, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_FAILED_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("IDENTITY_VERIFICATION_FAILED_SPEND_DOWN_MESSAGE"), 0);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v6);

  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "dockView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_FAILED_CONTINUE_BUTTON"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  -[PKExplanationViewController navigationItem](v2, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidesBackButton:", 1);

  return v2;
}

- (id)_accountLockedErrorViewController
{
  PKExplanationViewController *v2;
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

  v2 = -[PKExplanationViewController initWithContext:]([PKExplanationViewController alloc], "initWithContext:", self->_context);
  -[PKExplanationViewController setShowDoneButton:](v2, "setShowDoneButton:", 0);
  -[PKExplanationViewController setShowCancelButton:](v2, "setShowCancelButton:", 0);
  -[PKExplanationViewController explanationView](v2, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_FAILED_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_FAILED_CONTACT_SUPPORT_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v5);

  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "setForceShowSetupLaterButton:", 1);
  objc_msgSend(v3, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_FAILED_CONTACT_SUPPORT_BUTTON"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

  objc_msgSend(v6, "footerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setupLaterButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_FAILED_DO_LATER_BUTTON"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v11, 0);

  objc_msgSend(v9, "setManualEntryButton:", 0);
  -[PKExplanationViewController navigationItem](v2, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidesBackButton:", 1);

  return v2;
}

- (void)_formViewControllersWithExplanationView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  PKPaymentSetupFieldsModel *v9;
  PKPaymentSetupFieldsModel *fieldsModel;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PKPeerPaymentIdentityVerificationResponse *response;
  void *v17;
  uint64_t v18;
  PKPeerPaymentIdentityVerificationResponse *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  int v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  PKAddressSearcherViewController *v33;
  id WeakRetained;
  PKAddressSearcherViewController *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  PKPeerPaymentIdentityVerificationViewController *v45;
  id v46;
  void *v47;
  PKPeerPaymentIdentityVerificationViewController *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  id v53;
  PKPeerPaymentIdentityVerificationPickerViewController *v54;
  id v55;
  void *v56;
  PKPeerPaymentIdentityVerificationPickerViewController *v57;
  void *v58;
  PKPeerPaymentIdentityVerificationViewController *v59;
  id v60;
  void *v61;
  PKPeerPaymentIdentityVerificationViewController *v62;
  void *v63;
  uint64_t v64;
  _BOOL4 v65;
  PKPeerPaymentDocumentSubmissionController *v66;
  PKPeerPaymentWebService *webService;
  PKPeerPaymentIdentityVerificationResponse *v68;
  id v69;
  PKPeerPaymentDocumentSubmissionController *v70;
  PKPeerPaymentDocumentSubmissionController *captureController;
  void *v72;
  void *v73;
  uint64_t v74;
  PKPeerPaymentIdentityVerificationExplanationViewController *v75;
  int64_t context;
  id v77;
  PKPeerPaymentIdentityVerificationExplanationViewController *v78;
  NSArray *v79;
  NSArray *viewControllers;
  _BOOL4 v81;
  id obj;
  uint64_t v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  char v90;
  id *location;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v3 = a3;
  v104 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[PKPeerPaymentIdentityVerificationResponse complete](self->_response, "complete") & 1) != 0)
  {
    -[PKPeerPaymentIdentityVerificationResponse account](self->_response, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "state");
      if (v7 == 3)
      {
        self->_fatalError = 5;
        -[PKPeerPaymentIdentityVerificationController _accountLockedErrorViewController](self, "_accountLockedErrorViewController");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_63;
      }
      if (v7 == 2)
      {
        self->_fatalError = 4;
        -[PKPeerPaymentIdentityVerificationController _accountRestrictedErrorViewController](self, "_accountRestrictedErrorViewController");
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_63:
        v73 = (void *)v8;
        objc_msgSend(v92, "addObject:", v8);

      }
    }

    goto LABEL_65;
  }
  if (-[PKPeerPaymentIdentityVerificationController _hasRequiredFields](self, "_hasRequiredFields"))
  {
    v81 = v3;
    -[PKPeerPaymentIdentityVerificationController _generateFieldsModel](self, "_generateFieldsModel");
    v9 = (PKPaymentSetupFieldsModel *)objc_claimAutoreleasedReturnValue();
    fieldsModel = self->_fieldsModel;
    self->_fieldsModel = v9;

    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    -[PKPeerPaymentIdentityVerificationResponse requiredFieldsByPage](self->_response, "requiredFieldsByPage");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
    if (!v84)
      goto LABEL_57;
    v85 = 0;
    v83 = *(_QWORD *)v99;
    location = (id *)&self->_setupDelegate;
    v87 = *MEMORY[0x1E0D6B280];
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v99 != v83)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");
        response = (PKPeerPaymentIdentityVerificationResponse *)v12;
        if (!v15)
          response = self->_response;
        v86 = v11;
        -[PKPeerPaymentIdentityVerificationResponse localizedTitle](response, "localizedTitle");
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "localizedDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length");
        v19 = (PKPeerPaymentIdentityVerificationResponse *)v12;
        if (!v18)
          v19 = self->_response;
        -[PKPeerPaymentIdentityVerificationResponse localizedDescription](v19, "localizedDescription");
        v89 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "requiredFields");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v95;
          while (2)
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v95 != v24)
                objc_enumerationMutation(v21);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "supportsAddressAutofill") & 1) != 0)
              {
                v26 = 0;
                goto LABEL_26;
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
            if (v23)
              continue;
            break;
          }
        }
        v26 = 1;
LABEL_26:

        v27 = v26 | v85 | -[PKPeerPaymentIdentityVerificationResponse useDeviceValidation](self->_response, "useDeviceValidation") ^ 1;
        if ((v27 & 1) == 0)
        {
          -[PKPeerPaymentIdentityVerificationResponse account](self->_response, "account");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "countryCode");
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)v29;
          v31 = CFSTR("US");
          if (v29)
            v31 = (__CFString *)v29;
          v32 = v31;

          v33 = [PKAddressSearcherViewController alloc];
          WeakRetained = objc_loadWeakRetained(location);
          v85 = 1;
          v35 = -[PKAddressSearcherViewController initWithIdentityVerificationController:setupDelegate:style:](v33, "initWithIdentityVerificationController:setupDelegate:style:", self, WeakRetained, 1);

          objc_msgSend(v12, "localizedTitle");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKAddressSearcherViewController setHeaderTitle:](v35, "setHeaderTitle:", v36);

          objc_msgSend(v12, "localizedDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKAddressSearcherViewController setHeaderSubtitle:](v35, "setHeaderSubtitle:", v37);

          objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKAddressSearcherViewController setBackgroundColor:](v35, "setBackgroundColor:", v38);

          -[PKAddressSearcherViewController setSupportsSearchBarCancelButton:](v35, "setSupportsSearchBarCancelButton:", 0);
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v32);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          -[PKAddressSearcherViewController setSupportedCountryCodes:](v35, "setSupportedCountryCodes:", v39);
          -[PKAddressSearcherViewController setDelegate:](v35, "setDelegate:", self);
          objc_msgSend(v92, "addObject:", v35);

        }
        v90 = v27 ^ 1;
        if (objc_msgSend(v21, "count"))
        {
          v40 = 0;
          v88 = v13;
          do
          {
            objc_msgSend(v21, "objectAtIndex:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "identifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v41, "isFieldTypePicker"))
            {
              objc_msgSend(v41, "pickerFieldObject");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "pickerType");

              if ((unint64_t)(v44 - 1) < 2)
              {
                if (objc_msgSend(v13, "count"))
                {
                  v45 = [PKPeerPaymentIdentityVerificationViewController alloc];
                  v46 = objc_loadWeakRetained(location);
                  v47 = (void *)objc_msgSend(v13, "copy");
                  v48 = -[PKPeerPaymentIdentityVerificationViewController initWithController:setupDelegate:visibleFieldIdentifiers:](v45, "initWithController:setupDelegate:visibleFieldIdentifiers:", self, v46, v47);

                  -[PKPeerPaymentIdentityVerificationViewController setHeaderTitle:](v48, "setHeaderTitle:", v93);
                  -[PKPeerPaymentIdentityVerificationViewController setHeaderSubtitle:](v48, "setHeaderSubtitle:", v89);
                  if ((v90 & 1) != 0)
                    -[PKPeerPaymentIdentityVerificationViewController setShowCancelButton:](v48, "setShowCancelButton:", 0);
                  objc_msgSend(v92, "addObject:", v48);

                  v90 = 0;
                }
                if (v40 + 1 >= objc_msgSend(v21, "count"))
                {
                  v53 = 0;
                }
                else
                {
                  objc_msgSend(v21, "objectAtIndex:", v40 + 1);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "identifier");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "lowercaseString");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = objc_msgSend(v51, "isEqualToString:", v87);

                  if (v52)
                  {
                    v53 = v49;
                    ++v40;
                  }
                  else
                  {
                    v53 = 0;
                  }

                }
                v54 = [PKPeerPaymentIdentityVerificationPickerViewController alloc];
                v55 = objc_loadWeakRetained(location);
                objc_msgSend(v53, "defaultValue");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = -[PKPeerPaymentIdentityVerificationPickerViewController initWithController:setupDelegate:pickerField:footerText:](v54, "initWithController:setupDelegate:pickerField:footerText:", self, v55, v41, v56);

                -[PKPeerPaymentIdentityVerificationPickerViewController setHeaderTitle:](v57, "setHeaderTitle:", v93);
                objc_msgSend(v41, "localizedDisplayName");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKPeerPaymentIdentityVerificationPickerViewController setHeaderSubtitle:](v57, "setHeaderSubtitle:", v58);

                objc_msgSend(v92, "addObject:", v57);
                v13 = v88;
                objc_msgSend(v88, "removeAllObjects");

                goto LABEL_50;
              }
              if (!v44 || v44 == 3)
LABEL_38:
                objc_msgSend(v13, "addObject:", v42);
            }
            else if ((objc_msgSend(v41, "isFieldTypeFooter") & 1) == 0)
            {
              goto LABEL_38;
            }
LABEL_50:

            ++v40;
          }
          while (v40 < objc_msgSend(v21, "count"));
        }
        if (objc_msgSend(v13, "count"))
        {
          v59 = [PKPeerPaymentIdentityVerificationViewController alloc];
          v60 = objc_loadWeakRetained(location);
          v61 = (void *)objc_msgSend(v13, "copy");
          v62 = -[PKPeerPaymentIdentityVerificationViewController initWithController:setupDelegate:visibleFieldIdentifiers:](v59, "initWithController:setupDelegate:visibleFieldIdentifiers:", self, v60, v61);

          -[PKPeerPaymentIdentityVerificationViewController setHeaderTitle:](v62, "setHeaderTitle:", v93);
          -[PKPeerPaymentIdentityVerificationViewController setHeaderSubtitle:](v62, "setHeaderSubtitle:", v89);
          if ((v90 & 1) != 0)
            -[PKPeerPaymentIdentityVerificationViewController setShowCancelButton:](v62, "setShowCancelButton:", 0);
          objc_msgSend(v92, "addObject:", v62);

        }
        v11 = v86 + 1;
      }
      while (v86 + 1 != v84);
      v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
      if (!v84)
      {
LABEL_57:

        v3 = v81;
        goto LABEL_65;
      }
    }
  }
  -[PKPeerPaymentIdentityVerificationResponse acceptableDocuments](self->_response, "acceptableDocuments");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "count");

  if (v64)
  {
    v65 = v3;
    v66 = [PKPeerPaymentDocumentSubmissionController alloc];
    webService = self->_webService;
    v68 = self->_response;
    v69 = objc_loadWeakRetained((id *)&self->_setupDelegate);
    v70 = -[PKPeerPaymentDocumentSubmissionController initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:context:](v66, "initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:context:", webService, v68, v69, self->_context);
    captureController = self->_captureController;
    self->_captureController = v70;

    -[PKPaymentDocumentSubmissionController nextViewController](self->_captureController, "nextViewController");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
      objc_msgSend(v92, "addObject:", v72);

    v3 = v65;
  }
LABEL_65:
  v74 = objc_msgSend(v92, "count");
  if (v3 && v74)
  {
    v75 = [PKPeerPaymentIdentityVerificationExplanationViewController alloc];
    context = self->_context;
    v77 = objc_loadWeakRetained((id *)&self->_setupDelegate);
    v78 = -[PKPeerPaymentIdentityVerificationExplanationViewController initWithContext:setupDelegate:identityVerificationController:](v75, "initWithContext:setupDelegate:identityVerificationController:", context, v77, self);

    objc_msgSend(v92, "insertObject:atIndex:", v78, 0);
LABEL_69:
    -[PKPeerPaymentWebService prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:](self->_webService, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", *MEMORY[0x1E0D6B120], 0, 0);
    goto LABEL_70;
  }
  if (v74)
    goto LABEL_69;
LABEL_70:
  v79 = (NSArray *)objc_msgSend(v92, "copy");
  viewControllers = self->_viewControllers;
  self->_viewControllers = v79;

  self->_viewControllerIndex = 0;
}

- (id)_generateFieldsModel
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PKPeerPaymentIdentityVerificationResponse requiredFieldsByPage](self->_response, "requiredFieldsByPage", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "requiredFields");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67300]), "initWithPaymentSetupFields:", v3);
  else
    v10 = 0;

  return v10;
}

- (id)_nextLocalViewController
{
  unint64_t viewControllerIndex;
  NSArray *viewControllers;
  void *v5;

  viewControllerIndex = self->_viewControllerIndex;
  if (viewControllerIndex >= -[NSArray count](self->_viewControllers, "count"))
  {
    v5 = 0;
  }
  else
  {
    viewControllers = self->_viewControllers;
    ++self->_viewControllerIndex;
    -[NSArray objectAtIndex:](viewControllers, "objectAtIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)_hasRequiredFields
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PKPeerPaymentIdentityVerificationResponse requiredFieldsByPage](self->_response, "requiredFieldsByPage", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "requiredFields");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count");

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)addressSearcherViewController:(id)a3 selectedContact:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a4, "postalAddresses", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    -[PKPaymentSetupFieldsModel prefillDefaultValuesWithPostalAddress:](self->_fieldsModel, "prefillDefaultValuesWithPostalAddress:", v8);
    v7 = v8;
  }

}

- (PKPaymentSetupFieldsModel)fieldsModel
{
  return self->_fieldsModel;
}

- (int64_t)context
{
  return self->_context;
}

- (UIViewController)firstViewController
{
  return self->_firstViewController;
}

- (PKPeerPaymentWebService)webService
{
  return self->_webService;
}

- (PKPeerPaymentIdentityVerificationResponse)response
{
  return self->_response;
}

- (PKPeerPaymentDocumentSubmissionController)captureController
{
  return self->_captureController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureController, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_firstViewController, 0);
  objc_storeStrong((id *)&self->_fieldsModel, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
}

@end
