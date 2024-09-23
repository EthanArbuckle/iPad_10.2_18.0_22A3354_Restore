@implementation PKPayLaterUserInfoViewController

- (PKPayLaterUserInfoViewController)initWithPayLaterAccount:(id)a3
{
  id v4;
  PKPayLaterUserInfoViewController *v5;
  PKPayLaterUserInfoSectionController *v6;
  PKPayLaterUserInfoSectionController *sectionController;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterUserInfoViewController;
  v5 = -[PKPayLaterViewController initWithPayLaterAccount:](&v9, sel_initWithPayLaterAccount_, v4);
  if (v5)
  {
    v6 = -[PKPayLaterUserInfoSectionController initWithPayLaterAccount:delegate:]([PKPayLaterUserInfoSectionController alloc], "initWithPayLaterAccount:delegate:", v4, v5);
    sectionController = v5->_sectionController;
    v5->_sectionController = v6;

    -[PKPayLaterSectionController setDynamicCollectionDelegate:](v5->_sectionController, "setDynamicCollectionDelegate:", v5);
    -[PKDynamicCollectionViewController setUseItemIdentityWhenUpdating:](v5, "setUseItemIdentityWhenUpdating:", 1);
  }

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterUserInfoViewController;
  -[PKPayLaterViewController viewDidLoad](&v7, sel_viewDidLoad);
  v8[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v3, 0);

  -[PKPayLaterUserInfoViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("PERSONAL_INFORMATION_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  -[PKPayLaterUserInfoViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E90]);

}

- (id)pageTag
{
  return (id)*MEMORY[0x1E0D68F88];
}

- (void)updateUserInfoForType:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PKApplyControllerConfiguration *v10;
  void *v11;
  void *v12;
  PKApplyController *v13;
  PKApplyController *applyController;
  PKApplyController *v15;
  void *v16;
  void *v17;
  PKApplyController *v18;
  void *v19;
  void *v20;
  void *v21;
  PKApplyController *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D67230]);
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithWebService:", v8);

    v10 = -[PKApplyControllerConfiguration initWithSetupDelegate:context:provisioningController:]([PKApplyControllerConfiguration alloc], "initWithSetupDelegate:context:provisioningController:", 0, 0, v9);
    -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyControllerConfiguration setFeature:](v10, "setFeature:", objc_msgSend(v11, "feature"));

    -[PKApplyControllerConfiguration setApplicationType:](v10, "setApplicationType:", 4);
    -[PKApplyControllerConfiguration setUpdateUserInfoSubType:](v10, "setUpdateUserInfoSubType:", a3);
    -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyControllerConfiguration setAccount:](v10, "setAccount:", v12);

    v13 = -[PKApplyController initWithApplyConfiguration:]([PKApplyController alloc], "initWithApplyConfiguration:", v10);
    applyController = self->_applyController;
    self->_applyController = v13;

    -[PKApplyController setParentFlowController:](self->_applyController, "setParentFlowController:", self);
    v15 = self->_applyController;
    -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateUserInfoBaseURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyController setApplyServiceURL:](v15, "setApplyServiceURL:", v17);

    v18 = self->_applyController;
    v19 = (void *)MEMORY[0x1E0D66820];
    -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "analyticsAccountTypeForAccount:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyController setAnalyticsExistingAccountType:](v18, "setAnalyticsExistingAccountType:", v21);

    objc_initWeak(&location, self);
    v22 = self->_applyController;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __69__PKPayLaterUserInfoViewController_updateUserInfoForType_completion___block_invoke;
    v23[3] = &unk_1E3E6C220;
    objc_copyWeak(&v25, &location);
    v24 = v6;
    -[PKApplyController nextViewControllerWithCompletion:](v22, "nextViewControllerWithCompletion:", v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
}

void __69__PKPayLaterUserInfoViewController_updateUserInfoForType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  PKNavigationController *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      v8 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __69__PKPayLaterUserInfoViewController_updateUserInfoForType_completion___block_invoke_2;
      v12[3] = &unk_1E3E61590;
      v13 = *(id *)(a1 + 32);
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, v12);
      v9 = v13;
    }
    else
    {
      v8 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
      if (!v8)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        goto LABEL_7;
      }
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __69__PKPayLaterUserInfoViewController_updateUserInfoForType_completion___block_invoke_3;
      v10[3] = &unk_1E3E61590;
      v11 = *(id *)(a1 + 32);
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, v10);
      v9 = v11;
    }

LABEL_7:
  }

}

uint64_t __69__PKPayLaterUserInfoViewController_updateUserInfoForType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__PKPayLaterUserInfoViewController_updateUserInfoForType_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PKPayLaterViewController accountService](self, "accountService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterViewController payLaterAccount](self, "payLaterAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__PKPayLaterUserInfoViewController_nextViewControllerWithCompletion___block_invoke;
  v9[3] = &unk_1E3E6C248;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v5, "updateAccountWithIdentifier:extended:completion:", v7, 0, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __69__PKPayLaterUserInfoViewController_nextViewControllerWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKPayLaterUserInfoViewController_nextViewControllerWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E61478;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __69__PKPayLaterUserInfoViewController_nextViewControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

- (void)didUpdatePayLaterAccount:(id)a3
{
  -[PKPayLaterUserInfoSectionController setPayLaterAccount:](self->_sectionController, "setPayLaterAccount:", a3);
  -[PKDynamicCollectionViewController reloadDataAnimated:](self, "reloadDataAnimated:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end
