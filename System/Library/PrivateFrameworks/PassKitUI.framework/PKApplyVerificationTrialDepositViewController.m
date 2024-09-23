@implementation PKApplyVerificationTrialDepositViewController

- (PKApplyVerificationTrialDepositViewController)initWithSetupDelegate:(id)a3 context:(int64_t)a4 verificationPage:(id)a5 account:(id)a6
{
  id v11;
  id v12;
  PKApplyVerificationTrialDepositViewController *v13;
  PKApplyVerificationTrialDepositViewController *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PKApplyVerificationTrialDepositViewController;
  v13 = -[PKDynamicProvisioningFieldsPageViewController initWithWebService:context:setupDelegate:fieldsPage:](&v23, sel_initWithWebService_context_setupDelegate_fieldsPage_, 0, a4, a3, v11);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_verificationPage, a5);
    objc_storeStrong((id *)&v14->_account, a6);
    -[PKApplyVerificationPage fieldModel](v14->_verificationPage, "fieldModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "paymentSetupFields");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PKLocalizedPaymentString(CFSTR("SUBMIT"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithTitle:style:target:action:", v19, 2, v14, sel__handleNextButtonTapped);

      v24[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupFieldsViewController _setRightBarButtonItems:animated:](v14, "_setRightBarButtonItems:animated:", v21, 0);

    }
    else
    {
      -[PKPaymentSetupFieldsViewController _setNavigationBarEnabled:animated:](v14, "_setNavigationBarEnabled:animated:", 0, 0);
    }
  }

  return v14;
}

- (PKApplyVerificationTrialDepositViewController)initWithController:(id)a3 setupDelegate:(id)a4 verificationPage:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  PKApplyVerificationTrialDepositViewController *v14;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = objc_msgSend(v9, "context");
  objc_msgSend(v9, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKApplyVerificationTrialDepositViewController initWithSetupDelegate:context:verificationPage:account:](self, "initWithSetupDelegate:context:verificationPage:account:", v11, v12, v10, v13);

  if (v14)
    objc_storeStrong((id *)&v14->_controller, a3);

  return v14;
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
  UIImage *heroImage;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKApplyVerificationTrialDepositViewController;
  -[PKDynamicProvisioningFieldsPageViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setManualEntryButton:", 0);
  -[PKApplyVerificationPage primaryActionTitle](self->_verificationPage, "primaryActionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "primaryButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forState:", v5, 0);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__primaryButtonPressed, 0x2000);

  }
  else
  {
    objc_msgSend(v3, "setPrimaryButton:", 0);
  }
  -[PKApplyVerificationPage secondaryActionTitle](self->_verificationPage, "secondaryActionTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "secondaryActionButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:forState:", v7, 0);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__secondaryButtonPressed, 0x2000);

  }
  else
  {
    objc_msgSend(v4, "setSecondaryActionButton:", 0);
  }
  -[PKPaymentSetupFieldsViewController headerView](self, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTopPadding:", 20.0);
  objc_msgSend(v9, "setBottomPadding:", 20.0);
  heroImage = self->_heroImage;
  if (heroImage)
  {
    -[PKApplyVerificationTrialDepositViewController _heroImageSize](self, "_heroImageSize");
    objc_msgSend(v9, "setImageViewImage:withSize:animated:", heroImage, 0);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKApplyVerificationTrialDepositViewController;
  -[PKPaymentSetupFieldsViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  if (-[PKApplyVerificationTrialDepositViewController _needsPreflight](self, "_needsPreflight"))
  {
    self->_isPreflighting = 1;
    -[PKApplyVerificationTrialDepositViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __64__PKApplyVerificationTrialDepositViewController_viewWillAppear___block_invoke;
    v4[3] = &unk_1E3E61C58;
    objc_copyWeak(&v5, &location);
    -[PKApplyVerificationTrialDepositViewController preflightWithCompletion:](self, "preflightWithCompletion:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __64__PKApplyVerificationTrialDepositViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKApplyVerificationTrialDepositViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __64__PKApplyVerificationTrialDepositViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (WeakRetained[162])
    {
      objc_msgSend(WeakRetained, "headerView");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v4[162];
      objc_msgSend(v4, "_heroImageSize");
      objc_msgSend(v2, "setImageViewImage:withSize:animated:", v3, 1);

      WeakRetained = v4;
    }
    *((_BYTE *)WeakRetained + 1304) = 0;
    objc_msgSend(v4, "_setNeedsUpdateContentUnavailableConfiguration");
    WeakRetained = v4;
  }

}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(void *, void *);
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(void *, void *);
  _QWORD aBlock[5];
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E98];
  -[PKApplyVerificationPage heroImageURL](self->_verificationPage, "heroImageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PKApplyVerificationTrialDepositViewController_preflightWithCompletion___block_invoke;
    aBlock[3] = &unk_1E3E757D8;
    aBlock[4] = self;
    v16 = v4;
    v9 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0D66EA8], "sharedImageAssetDownloader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cachedDataForURL:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v9[2](v9, v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D66EA8], "sharedImageAssetDownloader");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __73__PKApplyVerificationTrialDepositViewController_preflightWithCompletion___block_invoke_3;
      v13[3] = &unk_1E3E65260;
      v14 = v9;
      objc_msgSend(v12, "downloadFromUrl:completionHandler:", v7, v13);

    }
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

void __73__PKApplyVerificationTrialDepositViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD block[4];
  id v9;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1296);
    *(_QWORD *)(v5 + 1296) = v4;

  }
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__PKApplyVerificationTrialDepositViewController_preflightWithCompletion___block_invoke_2;
    block[3] = &unk_1E3E61590;
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __73__PKApplyVerificationTrialDepositViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__PKApplyVerificationTrialDepositViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_needsPreflight
{
  void *v3;
  BOOL v4;

  -[PKApplyVerificationPage heroImageURL](self->_verificationPage, "heroImageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = self->_heroImage == 0;
  else
    v4 = 0;

  return v4;
}

- (void)_handleNextButtonTapped
{
  const __CFString *v3;

  switch(-[PKApplyVerificationTrialDepositViewController _verificationStatus](self, "_verificationStatus"))
  {
    case 0uLL:
    case 2uLL:
    case 4uLL:
      -[PKApplyVerificationTrialDepositViewController _terminateFlow](self, "_terminateFlow");
      break;
    case 1uLL:
      v3 = CFSTR("triggerTrialDeposits");
      goto LABEL_5;
    case 3uLL:
      v3 = CFSTR("submitTrialDeposits");
LABEL_5:
      -[PKApplyVerificationTrialDepositViewController _performActionForActionIdentifier:](self, "_performActionForActionIdentifier:", v3);
      break;
    default:
      return;
  }
}

- (void)_primaryButtonPressed
{
  void *v3;
  BOOL v4;

  -[PKApplyVerificationPage primaryActionIdentifier](self->_verificationPage, "primaryActionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKApplyVerificationTrialDepositViewController _performActionForActionIdentifier:](self, "_performActionForActionIdentifier:", v3);

  if (!v4)
    -[PKApplyVerificationTrialDepositViewController _terminateFlow](self, "_terminateFlow");
}

- (void)_secondaryButtonPressed
{
  void *v3;
  BOOL v4;

  -[PKApplyVerificationPage secondaryActionIdentifier](self->_verificationPage, "secondaryActionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKApplyVerificationTrialDepositViewController _performActionForActionIdentifier:](self, "_performActionForActionIdentifier:", v3);

  if (!v4)
    -[PKApplyVerificationTrialDepositViewController _terminateFlow](self, "_terminateFlow");
}

- (BOOL)_performActionForActionIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;
  BOOL v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  _QWORD v19[4];
  id v20;
  id location;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("triggerTrialDeposits"))
    goto LABEL_4;
  if (!v4)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("triggerTrialDeposits"));

  if (!v6)
  {
    v8 = v5;
    if (v8 == CFSTR("callSavingsSupport")
      || (v9 = v8,
          v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("callSavingsSupport")),
          v9,
          v10))
    {
      objc_initWeak(&location, self);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __83__PKApplyVerificationTrialDepositViewController__performActionForActionIdentifier___block_invoke;
      v19[3] = &unk_1E3E61310;
      objc_copyWeak(&v20, &location);
      dispatch_async(MEMORY[0x1E0C80D38], v19);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      goto LABEL_5;
    }
    v11 = v9;
    if (v11 == CFSTR("submitTrialDeposits")
      || (v12 = v11,
          v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("submitTrialDeposits")),
          v12,
          v13))
    {
      -[PKApplyVerificationTrialDepositViewController _userEnteredAmounts](self, "_userEnteredAmounts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKApplyVerificationTrialDepositViewController _submitCodes:](self, "_submitCodes:", v14);

      goto LABEL_5;
    }
    v15 = v12;
    if (v15 == CFSTR("skipTrialDeposits")
      || (v16 = v15,
          v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("skipTrialDeposits")),
          v16,
          v17))
    {
      -[PKApplyVerificationTrialDepositViewController _submitCodes:](self, "_submitCodes:", 0);
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_4:
  -[PKApplyVerificationTrialDepositViewController _requestTrialDeposits](self, "_requestTrialDeposits");
LABEL_5:
  v7 = 1;
LABEL_16:

  return v7;
}

void __83__PKApplyVerificationTrialDepositViewController__performActionForActionIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_alertControllerForContactSupport");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(v4, "navigationController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "presentViewController:animated:completion:", v2, 1, 0);

    }
    WeakRetained = v4;
  }

}

- (void)_terminateFlow
{
  void *v3;
  void *v4;
  id v5;

  -[PKApplyController endApplyFlow](self->_controller, "endApplyFlow");
  -[PKPaymentSetupFieldsViewController setupDelegate](self, "setupDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKApplyVerificationTrialDepositViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_submitCodes:(id)a3
{
  id v4;
  _BOOL8 v5;
  id v6;
  PKApplyController *controller;
  PKApplyVerificationPage *verificationPage;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  v5 = objc_msgSend(v4, "count") == 0;
  -[PKDynamicProvisioningFieldsPageViewController showSpinner:](self, "showSpinner:", 1);
  v6 = objc_alloc_init(MEMORY[0x1E0D66B18]);
  objc_msgSend(v6, "setTrialDeposits:", v4);
  objc_msgSend(v6, "setSkippedVerification:", v5);
  objc_initWeak(&location, self);
  controller = self->_controller;
  verificationPage = self->_verificationPage;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PKApplyVerificationTrialDepositViewController__submitCodes___block_invoke;
  v9[3] = &unk_1E3E62598;
  objc_copyWeak(&v10, &location);
  -[PKApplyController submitVerificationPage:verificationInfo:completion:](controller, "submitVerificationPage:verificationInfo:completion:", verificationPage, v6, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __62__PKApplyVerificationTrialDepositViewController__submitCodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKApplyVerificationTrialDepositViewController__submitCodes___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __62__PKApplyVerificationTrialDepositViewController__submitCodes___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PKApplyVerificationTrialDepositViewController__submitCodes___block_invoke_3;
    aBlock[3] = &unk_1E3E62288;
    aBlock[4] = WeakRetained;
    v4 = _Block_copy(aBlock);
    v5 = (void (**)(_QWORD, _QWORD))v4;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v3, "_alertControllerForError:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(v3, "presentViewController:animated:completion:", v6, 1, 0);
      ((void (**)(_QWORD, BOOL))v5)[2](v5, v6 != 0);

    }
    else if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v3, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pk_presentPaymentSetupViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, v5);

    }
    else
    {
      (*((void (**)(void *, _QWORD))v4 + 2))(v4, 0);
    }

  }
}

uint64_t __62__PKApplyVerificationTrialDepositViewController__submitCodes___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "showSpinner:", 0);
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "endApplyFlow");
    return objc_msgSend(*(id *)(a1 + 32), "_terminateFlow");
  }
  return result;
}

- (void)_requestTrialDeposits
{
  void *v3;
  void *v4;
  PKApplyController *controller;
  PKApplyVerificationPage *verificationPage;
  id v7;
  _QWORD v8[4];
  id v9;
  PKApplyVerificationTrialDepositViewController *v10;
  id v11;
  id location;

  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setShowSpinner:", 1);
  objc_msgSend(v4, "setEnabled:", 0);
  objc_initWeak(&location, self);
  controller = self->_controller;
  verificationPage = self->_verificationPage;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKApplyVerificationTrialDepositViewController__requestTrialDeposits__block_invoke;
  v8[3] = &unk_1E3E63548;
  objc_copyWeak(&v11, &location);
  v7 = v4;
  v9 = v7;
  v10 = self;
  -[PKApplyController resendVerificationForPage:completion:](controller, "resendVerificationForPage:completion:", verificationPage, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __70__PKApplyVerificationTrialDepositViewController__requestTrialDeposits__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKApplyVerificationTrialDepositViewController__requestTrialDeposits__block_invoke_2;
  v8[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v10 = v6;
  v11 = v4;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

  objc_destroyWeak(&v12);
}

void __70__PKApplyVerificationTrialDepositViewController__requestTrialDeposits__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "setShowSpinner:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
    objc_msgSend(*(id *)(a1 + 40), "_alertControllerForError:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, 0);
    else
      objc_msgSend(v4, "_terminateFlow");

    WeakRetained = v4;
  }

}

- (CGSize)_heroImageSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  if (self->_heroImage)
  {
    v3 = PKUIPixelLength();
    -[UIImage size](self->_heroImage, "size");
    v5 = v3 * v4;
    v7 = v3 * v6;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v5;
  result.width = v7;
  return result;
}

- (unint64_t)_verificationStatus
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[PKApplyController fundingSource](self->_controller, "fundingSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fundingDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "verificationDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "status");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_userEnteredAmounts
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKApplyVerificationPage fieldModel](self->_verificationPage, "fieldModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "visiblePaymentSetupFields", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentSetupFieldsViewController cellForIdentifier:](self, "cellForIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "updatePaymentSetupFieldWithFormatting");

        objc_msgSend(v10, "submissionString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v3, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)_clearAllTextFields
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PKApplyVerificationPage fieldModel](self->_verificationPage, "fieldModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "visiblePaymentSetupFields", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentSetupFieldsViewController cellForIdentifier:](self, "cellForIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "editableTextField");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setText:", 0);

        objc_msgSend(v10, "updatePaymentSetupFieldWithCurrentCellValue");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[PKPaymentSetupFieldsViewController firstEmptyCell](self, "firstEmptyCell");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "editableTextField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "becomeFirstResponder");

}

- (id)_alertControllerForError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  char v40;
  _QWORD v41[4];
  id v42;
  id location;

  v4 = a3;
  if (!v4)
    return 0;
  v5 = v4;
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D69DC8]);

  v8 = (_QWORD *)MEMORY[0x1E0CB3388];
  if (v7)
  {
    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  objc_msgSend(v5, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)*MEMORY[0x1E0D6B0B8];
  v13 = v11;
  v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_11;
  }
  v15 = v14;
  if (v13 && v14)
  {
    v16 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v16 & 1) == 0)
      goto LABEL_17;
LABEL_11:
    objc_msgSend(v5, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)*MEMORY[0x1E0D6BCB8];
    v22 = v20;
    v23 = v21;
    if (v22 == v23)
    {

    }
    else
    {
      v24 = v23;
      if (!v22 || !v23)
      {

LABEL_21:
        v28 = 0;
        v27 = 0;
LABEL_22:
        v29 = objc_msgSend(v5, "code");
        v30 = 0;
        v31 = 1;
        if (v29 > 40455)
        {
          if (v29 != 40457)
          {
            if (v29 == 40456)
            {
              if (!(v27 | v28))
              {
                -[PKAccount feature](self->_account, "feature");
                PKLocalizedFeatureString();
                v27 = objc_claimAutoreleasedReturnValue();
                PKLocalizedFeatureString();
                v28 = objc_claimAutoreleasedReturnValue();
              }
              v30 = 1;
              goto LABEL_34;
            }
            goto LABEL_31;
          }
        }
        else if (v29 != 40423 && v29 != 40454)
        {
LABEL_31:
          if (!(v27 | v28))
          {
            objc_msgSend(v5, "localizedFailureReason");
            v27 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "localizedRecoverySuggestion");
            v28 = objc_claimAutoreleasedReturnValue();
          }
          v30 = 0;
          v31 = 0;
        }
LABEL_34:
        if (v27 | v28)
        {
          objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v27, v28, 1);
          v26 = (id)objc_claimAutoreleasedReturnValue();
          v32 = MEMORY[0x1E0C809B0];
          if (v30)
          {
            objc_initWeak(&location, self);
            v33 = (void *)MEMORY[0x1E0DC3448];
            PKLocalizedPaymentString(CFSTR("TRY_AGAIN_BUTTON_TITLE"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __74__PKApplyVerificationTrialDepositViewController__alertControllerForError___block_invoke;
            v41[3] = &unk_1E3E63F88;
            objc_copyWeak(&v42, &location);
            objc_msgSend(v33, "actionWithTitle:style:handler:", v34, 0, v41);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "addAction:", v35);
            objc_msgSend(v26, "setPreferredAction:", v35);

            objc_destroyWeak(&v42);
            objc_destroyWeak(&location);
            v32 = MEMORY[0x1E0C809B0];
          }
          v36 = (void *)MEMORY[0x1E0DC3448];
          PKLocalizedString(CFSTR("CANCEL"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = v32;
          v39[1] = 3221225472;
          v39[2] = __74__PKApplyVerificationTrialDepositViewController__alertControllerForError___block_invoke_2;
          v39[3] = &unk_1E3E680E8;
          v40 = v31;
          v39[4] = self;
          objc_msgSend(v36, "actionWithTitle:style:handler:", v37, 1, v39);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addAction:", v38);

        }
        else
        {
          v26 = 0;
        }

        goto LABEL_40;
      }
      v25 = objc_msgSend(v22, "isEqualToString:", v23);

      if (!v25)
        goto LABEL_21;
    }
    objc_msgSend(v19, "localizedFailureReason");
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedRecoverySuggestion");
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }

LABEL_17:
  v26 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
LABEL_40:

  return v26;
}

void __74__PKApplyVerificationTrialDepositViewController__alertControllerForError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_clearAllTextFields");
    WeakRetained = v2;
  }

}

uint64_t __74__PKApplyVerificationTrialDepositViewController__alertControllerForError___block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_performActionForActionIdentifier:", CFSTR("skipTrialDeposits"));
  return result;
}

- (id)_alertControllerForContactSupport
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
  _QWORD v13[4];
  id v14;

  -[PKAccount savingsDetails](self->_account, "savingsDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PKAccount feature](self->_account, "feature");
    PKLocalizedFeatureString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC3448];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82__PKApplyVerificationTrialDepositViewController__alertControllerForContactSupport__block_invoke;
    v13[3] = &unk_1E3E61D68;
    v14 = v4;
    objc_msgSend(v7, "actionWithTitle:style:handler:", v14, 0, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v8);

    v9 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("CANCEL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v11);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __82__PKApplyVerificationTrialDepositViewController__alertControllerForContactSupport__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  PKTelephoneURLFromPhoneNumber();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_isPreflighting)
  {
    v4 = (void *)MEMORY[0x1E0DC3698];
    v5 = a3;
    objc_msgSend(v4, "loadingConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatedConfigurationForState:", v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "background");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyVerificationTrialDepositViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v9);

  }
  else
  {
    v10 = 0;
  }
  -[PKApplyVerificationTrialDepositViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroImage, 0);
  objc_storeStrong((id *)&self->_verificationPage, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
