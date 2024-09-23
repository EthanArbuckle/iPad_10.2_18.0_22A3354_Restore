@implementation PKAccountVerifySSNPageViewController

- (PKAccountVerifySSNPageViewController)initWithAccount:(id)a3 context:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKAccountVerifySSNPageViewController *v14;
  void *v15;
  void *v16;
  id v19;
  objc_super v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v19 = a3;
  objc_msgSend(MEMORY[0x1E0D672C8], "paymentSetupFieldWithIdentifier:", *MEMORY[0x1E0D6AF60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D672C8], "paymentSetupFieldWithIdentifier:", *MEMORY[0x1E0D6AED8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D67300]);
  v26[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v7;
  v24 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithPaymentSetupFields:footerFields:", v10, v12);

  v20.receiver = self;
  v20.super_class = (Class)PKAccountVerifySSNPageViewController;
  v14 = -[PKPaymentSetupFieldsViewController initWithWebService:context:setupDelegate:setupFieldsModel:](&v20, sel_initWithWebService_context_setupDelegate_setupFieldsModel_, 0, a4, 0, v13);
  if (v14)
  {
    v21 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldsViewController setSectionIdentifiers:](v14, "setSectionIdentifiers:", v16);

    objc_storeStrong((id *)&v14->_account, a3);
  }

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PKAccountVerifySSNPageViewController;
  -[PKPaymentSetupFieldsViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[PKPaymentSetupFieldsViewController setHidesBackButton:animated:](self, "setHidesBackButton:animated:", 1, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelPressed);
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController _setLeftBarButtonItems:animated:](self, "_setLeftBarButtonItems:animated:", v4, 0);

  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedString(CFSTR("DONE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 2, self, sel__handleNextStep);

  v10 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController _setRightBarButtonItems:animated:](self, "_setRightBarButtonItems:animated:", v8, 0);

}

- (void)_showSpinner:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  self->_isLoading = a3;
  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[PKPaymentSetupFieldsViewController showActivitySpinnerWithTitle:subtitle:](self, "showActivitySpinnerWithTitle:subtitle:", 0, 0);
  else
    -[PKPaymentSetupFieldsViewController hideActivitySpinner](self, "hideActivitySpinner");
  objc_msgSend(v5, "setButtonsEnabled:", !v3);

}

- (id)defaultHeaderViewTitle
{
  return (id)PKLocalizedMadisonString(CFSTR("VERIFY_SSN_TITLE"));
}

- (id)defaultHeaderViewSubTitle
{
  return (id)PKLocalizedMadisonString(CFSTR("VERIFY_SSN_MESSAGE"));
}

- (void)_handleNextStep
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD aBlock[5];

  -[PKAccountVerifySSNPageViewController _showSpinner:](self, "_showSpinner:", 1);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke;
  aBlock[3] = &unk_1E3E62288;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0D66978]);
  objc_msgSend(v6, "setDestination:", 3);
  -[PKAccount accountBaseURL](self->_account, "accountBaseURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBaseURL:", v7);

  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_2;
  v10[3] = &unk_1E3E71828;
  v11 = v5;
  v12 = v4;
  v10[4] = self;
  v8 = v5;
  v9 = v4;
  objc_msgSend(v8, "accountServiceCertificatesWithRequest:completion:", v6, v10);

}

uint64_t __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_showSpinner:", 0);
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_terminateFlow");
  return result;
}

void __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[4];
  id v21;
  uint64_t v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_3;
    block[3] = &unk_1E3E65388;
    v16 = v6;
    v17 = *(_QWORD *)(a1 + 32);
    v21 = v16;
    v22 = v17;
    v23 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v8 = v21;
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D66948]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "accountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccountIdentifier:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "accountBaseURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBaseURL:", v10);

    objc_msgSend(*(id *)(a1 + 32), "fieldForIdentifier:", *MEMORY[0x1E0D6AF60]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "submissionString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setSsn:", v12);
    objc_msgSend(v8, "setFeatureIdentifier:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "feature"));
    objc_msgSend(v5, "encryptionCertificates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCertificates:", v13);

    objc_msgSend(v5, "encryptionVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEncryptionVersion:", v14);

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_5;
    v18[3] = &unk_1E3E71800;
    v15 = *(void **)(a1 + 40);
    v18[4] = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v15, "accountUpdateUserInfoWithRequest:completion:", v8, v18);

  }
}

void __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  PKAccountDisplayableError();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKAlertForDisplayableErrorWithHandlers(v2, 0, 0, 0);

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_4;
    v5[3] = &unk_1E3E61590;
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  _QWORD v15[2];
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_6;
    block[3] = &unk_1E3E65388;
    v6 = (id *)v15;
    v7 = v4;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v15[0] = v7;
    v15[1] = v8;
    v16 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "accountIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_8;
    v12[3] = &unk_1E3E717D8;
    v6 = &v13;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v10, "updateAccountUsersForAccountWithIdentifier:completion:", v11, v12);

  }
}

void __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  PKAccountDisplayableError();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PKAlertForDisplayableErrorWithHandlers(v2, 0, 0, 0);

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_7;
    v5[3] = &unk_1E3E61590;
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_8(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_9;
  block[3] = &unk_1E3E61590;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_cancelPressed
{
  void *v3;
  void *v4;
  id v5;

  -[PKPaymentSetupFieldsViewController setupDelegate](self, "setupDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "viewControllerDidCancelSetupFlow:", self);
  }
  else
  {
    -[PKAccountVerifySSNPageViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_terminateFlow
{
  void *v3;
  void *v4;
  id v5;

  -[PKPaymentSetupFieldsViewController setupDelegate](self, "setupDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKAccountVerifySSNPageViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_aboutCreditReportingField, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
