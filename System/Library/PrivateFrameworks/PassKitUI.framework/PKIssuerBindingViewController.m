@implementation PKIssuerBindingViewController

- (PKIssuerBindingViewController)initWithIssuerData:(id)a3 signature:(id)a4 referralSource:(unint64_t)a5
{
  id v9;
  id v10;
  PKIssuerBindingViewController *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *relyingPartyIdentifier;
  uint64_t v19;
  NSString *issuerName;
  int v21;
  void *v22;
  PKIssuerBindingViewController *v23;
  uint64_t v24;
  PKPassLibrary *passLibrary;
  id v27;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PKIssuerBindingViewController;
  v11 = -[PKExplanationViewController init](&v28, sel_init);
  if (!v11)
  {
LABEL_10:
    v23 = v11;
    goto LABEL_11;
  }
  if (PKValidateIssuerBindingData())
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v27;
    v14 = objc_alloc(MEMORY[0x1E0D66DA0]);
    objc_msgSend(v12, "objectForKey:", CFSTR("fidoProfile"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithDictionary:", v15);

    objc_msgSend(v16, "relyingPartyIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    relyingPartyIdentifier = v11->_relyingPartyIdentifier;
    v11->_relyingPartyIdentifier = (NSString *)v17;

    v11->_source = a5;
    objc_msgSend(v12, "PKStringForKey:", CFSTR("displayableName"));
    v19 = objc_claimAutoreleasedReturnValue();
    issuerName = v11->_issuerName;
    v11->_issuerName = (NSString *)v19;

    v21 = PKHasVerifiedPrimaryAppleAccount();
    if (v21)
    {
      PKPrimaryAppleAccountFormattedUsername();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    objc_storeStrong((id *)&v11->_accountName, v22);
    if (v21)

    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v24 = objc_claimAutoreleasedReturnValue();
    passLibrary = v11->_passLibrary;
    v11->_passLibrary = (PKPassLibrary *)v24;

    -[PKPassLibrary addDelegate:](v11->_passLibrary, "addDelegate:", v11);
    objc_storeStrong((id *)&v11->_issuerData, a3);
    -[PKExplanationViewController setExplanationViewControllerDelegate:](v11, "setExplanationViewControllerDelegate:", v11);

    goto LABEL_10;
  }
  v23 = 0;
LABEL_11:

  return v23;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKIssuerBindingViewController;
  -[PKIssuerBindingViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKIssuerBindingViewController _sendAnalyticsViewVisibilityUpdateWithType:](self, "_sendAnalyticsViewVisibilityUpdateWithType:", *MEMORY[0x1E0D68C50]);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int IsAvailable;
  NSString *accountName;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  NSString *issuerName;
  NSString *v14;
  NSString *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKIssuerBindingViewController;
  -[PKExplanationViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 0);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 1);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "setBodyDataDetectorTypes:", 0);
  PKLocalizedString(CFSTR("WALLET"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  v5 = (void *)MEMORY[0x1E0DC3870];
  PKPassKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:withConfiguration:", CFSTR("WalletIconClassic"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setImage:", v7);
  IsAvailable = PKPearlIsAvailable();
  accountName = self->_accountName;
  if (!IsAvailable)
  {
    if (accountName)
    {
      issuerName = self->_issuerName;
      v15 = self->_accountName;
      v10 = CFSTR("ISSUER_DATA_GENERATION_BODY_TEXT_TOUCH_ID");
      goto LABEL_6;
    }
    v14 = self->_issuerName;
    v11 = CFSTR("ISSUER_DATA_GENERATION_BODY_TEXT_TOUCH_ID_MISSING_ACCOUNT");
LABEL_9:
    PKLocalizedPaymentString(&v11->isa, CFSTR("%@"), v14);
    goto LABEL_10;
  }
  if (!accountName)
  {
    v14 = self->_issuerName;
    v11 = CFSTR("ISSUER_DATA_GENERATION_BODY_TEXT_FACE_ID_MISSING_ACCOUNT");
    goto LABEL_9;
  }
  issuerName = self->_issuerName;
  v15 = self->_accountName;
  v10 = CFSTR("ISSUER_DATA_GENERATION_BODY_TEXT_FACE_ID");
LABEL_6:
  PKLocalizedPaymentString(&v10->isa, CFSTR("%@%@"), issuerName, v15);
LABEL_10:
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v12);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKIssuerBindingViewController;
  -[PKIssuerBindingViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PKIssuerBindingViewController _sendAnalyticsViewVisibilityUpdateWithType:](self, "_sendAnalyticsViewVisibilityUpdateWithType:", *MEMORY[0x1E0D68C58]);
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  -[PKIssuerBindingViewController _sendAnalyticsDidTapButton:](self, "_sendAnalyticsDidTapButton:", *MEMORY[0x1E0D688E8]);
  -[PKIssuerBindingViewController _cancel](self, "_cancel");
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id location;

  v4 = a3;
  -[PKIssuerBindingViewController _sendAnalyticsDidTapButton:](self, "_sendAnalyticsDidTapButton:", *MEMORY[0x1E0D68958]);
  -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setButtonsEnabled:", 0);

  if (!self->_accountName)
  {
    -[PKIssuerBindingViewController _enableControls](self, "_enableControls");
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6A418], 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIssuerBindingViewController _presentFailureWithError:](self, "_presentFailureWithError:", v7);

  }
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke;
  v8[3] = &unk_1E3E625E8;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  -[PKIssuerBindingViewController _confirmSecurityCapabilitiesWithCompletion:](self, "_confirmSecurityCapabilitiesWithCompletion:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD block[5];
  id v12;
  _QWORD v13[5];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v8 = (void *)*((_QWORD *)WeakRetained + 132);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_2;
      v13[3] = &unk_1E3E6C0F0;
      v13[4] = v7;
      objc_msgSend(v8, "requestIssuerBoundPassesWithBindingWithData:automaticallyProvision:withCompletion:", v9, 0, v13);
    }
    else if (v5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_4;
      block[3] = &unk_1E3E61388;
      block[4] = WeakRetained;
      v12 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_5;
      v10[3] = &unk_1E3E612E8;
      v10[4] = WeakRetained;
      dispatch_async(MEMORY[0x1E0C80D38], v10);
    }
  }

}

void __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  block[2] = __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_3;
  block[3] = &unk_1E3E61400;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_enableControls");
  if (*(_QWORD *)(a1 + 40) && !*(_QWORD *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1080));
    if (WeakRetained)
    {
      v3 = WeakRetained;
      v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1080));
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1080));
        objc_msgSend(v6, "issuerBindingViewController:didFinishWithPassesData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_enableControls");
    objc_msgSend(*(id *)(a1 + 32), "_sendInternalErrorEventWithError:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_presentFailureWithError:", *(_QWORD *)(a1 + 48));
  }
}

uint64_t __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_enableControls");
  objc_msgSend(*(id *)(a1 + 32), "_sendInternalErrorEventWithError:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_presentFailureWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __66__PKIssuerBindingViewController_explanationViewDidSelectContinue___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enableControls");
}

- (void)_enableControls
{
  void *v3;
  id v4;

  -[PKExplanationViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 0);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setButtonsEnabled:", 1);

}

- (void)_confirmSecurityCapabilitiesWithCompletion:(id)a3
{
  id v4;
  PKSecurityCapabilitiesController *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = -[PKSecurityCapabilitiesController initWithRequirements:context:]([PKSecurityCapabilitiesController alloc], "initWithRequirements:context:", 24, 0);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PKIssuerBindingViewController__confirmSecurityCapabilitiesWithCompletion___block_invoke;
  v7[3] = &unk_1E3E785D0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[PKSecurityCapabilitiesController presentSecurityRepairFlowWithPresentingViewController:completion:](v5, "presentSecurityRepairFlowWithPresentingViewController:completion:", self, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __76__PKIssuerBindingViewController__confirmSecurityCapabilitiesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10[2];

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PKIssuerBindingViewController__confirmSecurityCapabilitiesWithCompletion___block_invoke_2;
  v7[3] = &unk_1E3E62688;
  objc_copyWeak(v10, (id *)(a1 + 40));
  v10[1] = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(v10);
}

void __76__PKIssuerBindingViewController__confirmSecurityCapabilitiesWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      PKSecurityCapabilitiesErrorToString(*(_QWORD *)(a1 + 56));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Finished presenting security repair flow with upgrade error %@, error %@", (uint8_t *)&v8, 0x16u);

    }
    v6 = *(_QWORD *)(a1 + 56);
    if (v6 == 3)
    {
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else if (v6)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Issuer Binding VC - Aborting binding because user failed to upgrade to HSA2", (uint8_t *)&v8, 2u);
      }

      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v7();
  }

}

- (void)_cancel
{
  PKIssuerBindingViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (v5 = WeakRetained,
        v6 = objc_loadWeakRetained((id *)p_delegate),
        v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "issuerBindingViewControllerDidCancel:", self);

  }
  else
  {
    -[PKIssuerBindingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)_presentFailureWithError:(id)a3
{
  id v4;

  -[PKIssuerBindingViewController _alertViewControllerForError:](self, "_alertViewControllerForError:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKIssuerBindingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (id)_alertViewControllerForError:(id)a3
{
  id v4;
  id v5;
  _BOOL4 v6;
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
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id location;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_msgSend(v4, "code") == 1;
  PKLocalizedPaymentString(CFSTR("ISSUER_DATA_GENERATION_FAILURE_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    PKLocalizedPaymentString(CFSTR("ISSUER_DATA_GENERATION_ACCOUNT_MISSING_ERROR_MESSAGE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("ISSUER_DATA_GENERATION_ACCOUNT_MISSING_ACTION_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, &__block_literal_global_210);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("CANCEL"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __62__PKIssuerBindingViewController__alertViewControllerForError___block_invoke_2;
    v29[3] = &unk_1E3E63F88;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("ISSUER_DATA_GENERATION_FAILURE_MESSAGE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v17);

  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = v5;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(v18, "addAction:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v22++), (_QWORD)v25);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v20);
  }

  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPreferredAction:", v23);

  }
  return v18;
}

void __62__PKIssuerBindingViewController__alertViewControllerForError___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

void __62__PKIssuerBindingViewController__alertViewControllerForError___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cancel");
    WeakRetained = v2;
  }

}

- (void)_sendAnalyticsViewVisibilityUpdateWithType:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *relyingPartyIdentifier;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D69938];
  v6 = a3;
  objc_msgSend(v4, "reporterForSubject:", v5);

  v7 = (void *)MEMORY[0x1E0D66A58];
  v8 = *MEMORY[0x1E0D68F50];
  v14[0] = *MEMORY[0x1E0D68AA0];
  v14[1] = v8;
  v9 = *MEMORY[0x1E0D68F98];
  v15[0] = v6;
  v15[1] = v9;
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  if (!relyingPartyIdentifier)
    relyingPartyIdentifier = (NSString *)*MEMORY[0x1E0D69618];
  v15[2] = relyingPartyIdentifier;
  v11 = *MEMORY[0x1E0D693B0];
  v14[2] = *MEMORY[0x1E0D69648];
  v14[3] = v11;
  AnalyticsVASReferralSource();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subject:sendEvent:", v5, v13);

}

- (void)_sendAnalyticsDidTapButton:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *relyingPartyIdentifier;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D69938];
  v6 = a3;
  objc_msgSend(v4, "reporterForSubject:", v5);

  v7 = (void *)MEMORY[0x1E0D66A58];
  v8 = *MEMORY[0x1E0D68B18];
  v9 = *MEMORY[0x1E0D68F50];
  v14[0] = *MEMORY[0x1E0D68AA0];
  v14[1] = v9;
  v10 = *MEMORY[0x1E0D68F98];
  v15[0] = v8;
  v15[1] = v10;
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  if (!relyingPartyIdentifier)
    relyingPartyIdentifier = (NSString *)*MEMORY[0x1E0D69618];
  v12 = *MEMORY[0x1E0D68858];
  v14[2] = *MEMORY[0x1E0D69648];
  v14[3] = v12;
  v15[2] = relyingPartyIdentifier;
  v15[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subject:sendEvent:", v5, v13);

}

- (void)_sendInternalErrorEventWithError:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *relyingPartyIdentifier;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D69938];
  v6 = a3;
  objc_msgSend(v4, "reporterForSubject:", v5);

  v7 = (void *)MEMORY[0x1E0D66A58];
  v8 = *MEMORY[0x1E0D68F50];
  v14[0] = *MEMORY[0x1E0D68780];
  v9 = *MEMORY[0x1E0D68A90];
  v13[0] = v8;
  v13[1] = v9;
  AnalyticsVASErrorTypeForError();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[2] = *MEMORY[0x1E0D69648];
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  if (!relyingPartyIdentifier)
    relyingPartyIdentifier = (NSString *)*MEMORY[0x1E0D69618];
  v14[1] = v10;
  v14[2] = relyingPartyIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subject:sendEvent:", v5, v12);

}

- (void)_sendAuthenticationEvent
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *relyingPartyIdentifier;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D69938];
  objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69938]);

  v4 = (void *)MEMORY[0x1E0D66A58];
  v5 = *MEMORY[0x1E0D68B88];
  v6 = *MEMORY[0x1E0D68F50];
  v10[0] = *MEMORY[0x1E0D68AA0];
  v10[1] = v6;
  v7 = *MEMORY[0x1E0D68780];
  v11[0] = v5;
  v11[1] = v7;
  v10[2] = *MEMORY[0x1E0D69648];
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  if (!relyingPartyIdentifier)
    relyingPartyIdentifier = (NSString *)*MEMORY[0x1E0D69618];
  v11[2] = relyingPartyIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject:sendEvent:", v3, v9);

}

- (PKIssuerBindingViewControllerDelegate)delegate
{
  return (PKIssuerBindingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_issuerData, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_issuerName, 0);
}

@end
