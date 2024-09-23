@implementation PKPayLaterUpdateUserInfoFieldsViewController

- (PKPayLaterUpdateUserInfoFieldsViewController)initWithPayLaterAccount:(id)a3 webService:(id)a4 context:(int64_t)a5 setupDelegate:(id)a6 encryptionCertificates:(id)a7 encryptionVerion:(id)a8 fieldsPage:(id)a9
{
  id v16;
  id v17;
  PKPayLaterUpdateUserInfoFieldsViewController *v18;
  PKPayLaterUpdateUserInfoFieldsViewController *v19;
  uint64_t v20;
  PKAccountService *accountService;
  id v23;
  objc_super v24;

  v23 = a3;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PKPayLaterUpdateUserInfoFieldsViewController;
  v18 = -[PKDynamicProvisioningFieldsPageViewController initWithWebService:context:setupDelegate:fieldsPage:](&v24, sel_initWithWebService_context_setupDelegate_fieldsPage_, a4, a5, a6, a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_payLaterAccount, a3);
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v20 = objc_claimAutoreleasedReturnValue();
    accountService = v19->_accountService;
    v19->_accountService = (PKAccountService *)v20;

    objc_storeStrong((id *)&v19->_encryptionVerion, a8);
    objc_storeStrong((id *)&v19->_encryptionCertificates, a7);
  }

  return v19;
}

- (void)handleNextButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id location;

  v4 = a3;
  -[PKDynamicProvisioningFieldsPageViewController fieldsPage](self, "fieldsPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fieldModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0D66948]);
  v8 = *MEMORY[0x1E0D69A30];
  objc_msgSend(v6, "submissionValuesForDestination:", *MEMORY[0x1E0D69A30]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOverlayParameters:", v9);

  objc_msgSend(v6, "secureSubmissionValuesForDestination:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSecureOverlayParameters:", v10);

  objc_msgSend(v7, "setCertificates:", self->_encryptionCertificates);
  objc_msgSend(v7, "setEncryptionVersion:", self->_encryptionVerion);
  -[PKAccount accountIdentifier](self->_payLaterAccount, "accountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccountIdentifier:", v11);

  -[PKAccount accountBaseURL](self->_payLaterAccount, "accountBaseURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseURL:", v12);

  objc_msgSend(v7, "setFeatureIdentifier:", -[PKAccount feature](self->_payLaterAccount, "feature"));
  -[PKDynamicProvisioningFieldsPageViewController showSpinner:](self, "showSpinner:", 1);
  v13 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  objc_initWeak(&location, self);
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke;
  v22[3] = &unk_1E3E64410;
  v22[4] = self;
  v15 = v7;
  v23 = v15;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v13, "addOperation:", v22);
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_5;
  v20[3] = &unk_1E3E677A0;
  v20[4] = self;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v13, "addOperation:", v20);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_9;
  v18[3] = &unk_1E3E6BDD0;
  objc_copyWeak(&v19, &location);
  v17 = (id)objc_msgSend(v13, "evaluateWithInput:completion:", v16, v18);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&location);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "webService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_2;
  v14[3] = &unk_1E3E73D48;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v14[4] = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v15 = v13;
  objc_msgSend(v10, "accountUpdateUserInfoWithRequest:completion:", v11, v14);

  objc_destroyWeak(&v17);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_3;
  block[3] = &unk_1E3E643C0;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v11 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_3(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    PKAccountDisplayableError();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    if (v4)
    {
      objc_msgSend(a1[5], "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_4;
      v6[3] = &unk_1E3E618A0;
      v8 = a1[7];
      v7 = a1[6];
      objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, v6);

    }
    else
    {
      (*((void (**)(void))a1[7] + 2))();
    }

  }
}

uint64_t __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 1);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 1280);
  objc_msgSend(*(id *)(v10 + 1272), "accountIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_6;
  v15[3] = &unk_1E3E73D70;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  v15[4] = *(_QWORD *)(a1 + 32);
  v13 = v9;
  v17 = v13;
  v14 = v8;
  v16 = v14;
  objc_msgSend(v11, "updateAccountWithIdentifier:extended:completion:", v12, 0, v15);

  objc_destroyWeak(&v18);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_7;
  block[3] = &unk_1E3E643C0;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v11 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_7(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    PKAccountDisplayableError();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    if (v4)
    {
      objc_msgSend(a1[5], "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_8;
      v6[3] = &unk_1E3E618A0;
      v8 = a1[7];
      v7 = a1[6];
      objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, v6);

    }
    else
    {
      (*((void (**)(void))a1[7] + 2))();
    }

  }
}

uint64_t __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 1);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_10;
  v7[3] = &unk_1E3E61B68;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v9);
}

void __71__PKPayLaterUpdateUserInfoFieldsViewController_handleNextButtonTapped___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "showSpinner:", 0);
    v4 = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
    v3 = v5;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
      v3 = v5;
    }
  }

}

- (void)handleCancelTapped
{
  -[PKPayLaterUpdateUserInfoFieldsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionVerion, 0);
  objc_storeStrong((id *)&self->_encryptionCertificates, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
}

@end
