@implementation PKPeerPaymentGraduationExplanationViewController

- (PKPeerPaymentGraduationExplanationViewController)initWithPeerPaymentWebService:(id)a3 peerPaymentAccount:(id)a4 passLibraryDataProvider:(id)a5 setupDelegate:(id)a6 context:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPeerPaymentGraduationExplanationViewController *v17;
  PKPeerPaymentGraduationExplanationViewController *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  PKPassView *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  objc_super v33;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v33.receiver = self;
  v33.super_class = (Class)PKPeerPaymentGraduationExplanationViewController;
  v17 = -[PKExplanationViewController initWithContext:](&v33, sel_initWithContext_, a7);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_peerPaymentWebService, a3);
    objc_storeStrong((id *)&v18->_peerPaymentAccount, a4);
    objc_storeWeak((id *)&v18->_setupDelegate, v16);
    objc_storeWeak((id *)&v18->_passLibraryDataProvider, v15);
    -[PKPeerPaymentAccount associatedPassUniqueID](v18->_peerPaymentAccount, "associatedPassUniqueID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&v18->_passLibraryDataProvider);
      objc_msgSend(WeakRetained, "passWithUniqueID:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "loadImageSetSync:preheat:", 0, 1);
      v22 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", v21, 5, 512);
      -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v22, "snapshotOfFrontFaceWithRequestedSize:", 257.0, 157.0);
      v32 = v19;
      v23 = v16;
      v24 = v15;
      v25 = v14;
      v26 = v13;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKExplanationViewController explanationView](v18, "explanationView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setImage:", v27);
      objc_msgSend(v28, "imageView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAccessibilityIgnoresInvertColors:", 1);

      v13 = v26;
      v14 = v25;
      v15 = v24;
      v16 = v23;
      v19 = v32;

    }
    objc_msgSend(MEMORY[0x1E0D65190], "pk_privacyLinkForContext:", 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExplanationViewController setPrivacyLinkController:](v18, "setPrivacyLinkController:", v30);

    -[PKExplanationViewController setShowDoneButton:](v18, "setShowDoneButton:", 0);
    -[PKExplanationViewController setShowCancelButton:](v18, "setShowCancelButton:", 1);
    -[PKExplanationViewController setExplanationViewControllerDelegate:](v18, "setExplanationViewControllerDelegate:", v18);

  }
  return v18;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentGraduationExplanationViewController;
  -[PKExplanationViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_VERIFY_YOUR_IDENTITY_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_GRADUTION_IDENTITY_VERIFICATION_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v5);

  objc_msgSend(v3, "setShowPrivacyView:", 1);
  objc_msgSend(v3, "setTopMargin:", 12.0);
  objc_msgSend(v3, "setBodyDataDetectorTypes:", 0);
  objc_msgSend(v3, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "footerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSetupLaterButton:", 0);
  objc_msgSend(v7, "setManualEntryButton:", 0);

}

- (void)explanationViewDidSelectContinue:(id)a3
{
  -[PKPeerPaymentGraduationExplanationViewController _presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier:](self, "_presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier:", 1);
}

- (void)_presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  PKPeerPaymentWebService *peerPaymentWebService;
  _QWORD v9[5];

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D67418]);
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "setPrerequisiteIdentifier:", *MEMORY[0x1E0D6B188]);
  -[PKPeerPaymentWebService context](self->_peerPaymentWebService, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDevSigned:", objc_msgSend(v7, "devSigned"));

  -[PKPeerPaymentGraduationExplanationViewController _showSpinner:](self, "_showSpinner:", 1);
  peerPaymentWebService = self->_peerPaymentWebService;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __121__PKPeerPaymentGraduationExplanationViewController__presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier___block_invoke;
  v9[3] = &unk_1E3E6F390;
  v9[4] = self;
  -[PKPeerPaymentWebService peerPaymentIdentityVerificationRequest:completion:](peerPaymentWebService, "peerPaymentIdentityVerificationRequest:completion:", v6, v9);

}

void __121__PKPeerPaymentGraduationExplanationViewController__presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__PKPeerPaymentGraduationExplanationViewController__presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier___block_invoke_2;
  block[3] = &unk_1E3E61400;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __121__PKPeerPaymentGraduationExplanationViewController__presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  PKPeerPaymentIdentityVerificationController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  PKPeerPaymentIdentityVerificationController *v14;
  void *v15;
  PKNavigationController *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
  if (PKPeerPaymentWebServiceErrorIsTermsAcceptanceRequiredError())
  {
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v18, "domain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D69DC8]);

    if (v3)
    {
      objc_msgSend(v18, "userInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v5 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v5;
    }
    else
    {
      v6 = v18;
    }
    v19 = v6;
    objc_msgSend(v6, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D6BA30]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_presentTermsWithTermsResponse:", v8);
  }
  else if (*(_QWORD *)(a1 + 48) && !*(_QWORD *)(a1 + 40))
  {
    v9 = [PKPeerPaymentIdentityVerificationController alloc];
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(v10 + 1032);
    v12 = *(_QWORD *)(a1 + 48);
    WeakRetained = objc_loadWeakRetained((id *)(v10 + 1048));
    v14 = -[PKPeerPaymentIdentityVerificationController initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:](v9, "initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:", v11, v12, WeakRetained, 1, objc_msgSend(*(id *)(a1 + 32), "context"));

    -[PKPeerPaymentIdentityVerificationController firstViewController](v14, "firstViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v15);
      -[PKNavigationController setModalInPresentation:](v16, "setModalInPresentation:", 1);
      -[PKNavigationController setSupportedInterfaceOrientations:](v16, "setSupportedInterfaceOrientations:", 2);
      PKPaymentSetupApplyContextAppearance(objc_msgSend(*(id *)(a1 + 32), "context"), v16);
      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v16, 1, 0);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Error: no view controller defined for identity verification flow", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_presentGenericError");
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentGenericError");
  }
}

- (void)_presentTermsWithTermsResponse:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PKPeerPaymentTermsController *v11;
  PKPeerPaymentTermsController *v12;
  PKPeerPaymentTermsController *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "termsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "termsIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5 || !v6)
  {
    -[PKPeerPaymentAccount termsURL](self->_peerPaymentAccount, "termsURL");
    v8 = objc_claimAutoreleasedReturnValue();

    -[PKPeerPaymentAccount termsIdentifier](self->_peerPaymentAccount, "termsIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
    v5 = (void *)v8;
  }
  -[PKPeerPaymentAccount associatedPassUniqueID](self->_peerPaymentAccount, "associatedPassUniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v7)
  {
    -[PKPeerPaymentGraduationExplanationViewController _showSpinner:](self, "_showSpinner:", 1);
    v11 = [PKPeerPaymentTermsController alloc];
    v12 = v11;
    if (self->_peerPaymentWebService)
    {
      v13 = -[PKPeerPaymentTermsController initWithTermsURL:termsIdentifier:passUniqueID:webService:](v11, "initWithTermsURL:termsIdentifier:passUniqueID:webService:", v5, v7, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[PKPeerPaymentTermsController initWithTermsURL:termsIdentifier:passUniqueID:webService:](v12, "initWithTermsURL:termsIdentifier:passUniqueID:webService:", v5, v7, v10, v15);

    }
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__PKPeerPaymentGraduationExplanationViewController__presentTermsWithTermsResponse___block_invoke;
    v16[3] = &unk_1E3E634A8;
    objc_copyWeak(&v17, (id *)buf);
    -[PKPeerPaymentTermsController presentTermsOverController:showInterstitialViewController:withCompletionHandler:](v13, "presentTermsOverController:showInterstitialViewController:withCompletionHandler:", self, 0, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Error cannot present terms for url %@ and terms identifier %@", buf, 0x16u);
    }

    -[PKPeerPaymentGraduationExplanationViewController _presentGenericError](self, "_presentGenericError");
  }

}

void __83__PKPeerPaymentGraduationExplanationViewController__presentTermsWithTermsResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_showSpinner:", 0);
    if (a2 == 1)
    {
      v7 = MEMORY[0x1E0C809B0];
      v5 = __83__PKPeerPaymentGraduationExplanationViewController__presentTermsWithTermsResponse___block_invoke_3;
      v6 = &v7;
      goto LABEL_6;
    }
    if (a2 == 2)
    {
      v8 = MEMORY[0x1E0C809B0];
      v5 = __83__PKPeerPaymentGraduationExplanationViewController__presentTermsWithTermsResponse___block_invoke_2;
      v6 = &v8;
LABEL_6:
      v6[1] = 3221225472;
      v6[2] = (uint64_t)v5;
      v6[3] = (uint64_t)&unk_1E3E612E8;
      v6[4] = (uint64_t)v4;
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v7);
    }
  }

}

uint64_t __83__PKPeerPaymentGraduationExplanationViewController__presentTermsWithTermsResponse___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentIdentityVerificationFlowWithGraduationPrerequisiteIdentifier:", 0);
}

void __83__PKPeerPaymentGraduationExplanationViewController__presentTermsWithTermsResponse___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1048));
  objc_msgSend(WeakRetained, "viewControllerDidCancelSetupFlow:", *(_QWORD *)(a1 + 32));

}

- (void)_presentGenericError
{
  void *v3;
  id v4;
  id WeakRetained;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PKPeerPaymentGraduationExplanationViewController__presentGenericError__block_invoke;
  v6[3] = &unk_1E3E612E8;
  v6[4] = self;
  v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, v6, 0);
  if (v4)
  {
    -[PKPeerPaymentGraduationExplanationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
    objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", self);

  }
}

void __72__PKPeerPaymentGraduationExplanationViewController__presentGenericError__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1048));
  objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", *(_QWORD *)(a1 + 32));

}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[PKExplanationViewController explanationView](self, "explanationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dockView");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "primaryButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShowSpinner:", v3);

  v7 = v3 ^ 1;
  objc_msgSend(v11, "setButtonsEnabled:", v7);
  -[PKPeerPaymentGraduationExplanationViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

  objc_msgSend(v8, "rightBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v7);

}

- (BOOL)allowsManualEntry
{
  return self->_allowsManualEntry;
}

- (void)setAllowsManualEntry:(BOOL)a3
{
  self->_allowsManualEntry = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_passLibraryDataProvider);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
}

@end
