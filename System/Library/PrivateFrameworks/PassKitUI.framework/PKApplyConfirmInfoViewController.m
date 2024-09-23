@implementation PKApplyConfirmInfoViewController

- (PKApplyConfirmInfoViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6
{
  id v10;
  id v11;
  PKApplyConfirmInfoViewController *v12;
  PKApplyConfirmInfoSectionController *v13;
  PKApplyConfirmInfoSectionController *sectionController;
  objc_super v16;

  v10 = a3;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PKApplyConfirmInfoViewController;
  v12 = -[PKApplyCollectionViewController initWithController:setupDelegate:context:applyPage:](&v16, sel_initWithController_setupDelegate_context_applyPage_, v10, a4, a5, v11);
  if (v12)
  {
    v13 = -[PKApplyConfirmInfoSectionController initWithController:applyPage:delegate:]([PKApplyConfirmInfoSectionController alloc], "initWithController:applyPage:delegate:", v10, v11, v12);
    sectionController = v12->_sectionController;
    v12->_sectionController = v13;

  }
  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)PKApplyConfirmInfoViewController;
  -[PKApplyCollectionViewController viewDidLoad](&v7, sel_viewDidLoad);
  v8[0] = self->_sectionController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:", v3, 0);

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__PKApplyConfirmInfoViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E3E63AE8;
  objc_copyWeak(&v5, &location);
  -[PKApplyCollectionViewController setPrimaryButtonAction:](self, "setPrimaryButtonAction:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __47__PKApplyConfirmInfoViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_continueAction");

  return 0;
}

- (id)pageTag
{
  return (id)*MEMORY[0x1E0D68F30];
}

- (id)additionalAnalyticsDictionaryForViewAppearing:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PKApplyCollectionViewController currentPage](self, "currentPage", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)didSelectActionItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "contextPrimaryActionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PKApplyCollectionViewController controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyCollectionViewController page](self, "page");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyConfirmInfoViewController pageTag](self, "pageTag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D68C08];
    v10 = *MEMORY[0x1E0D69438];
    v19[0] = *MEMORY[0x1E0D68AA0];
    v19[1] = v10;
    v20[0] = v9;
    v20[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v7, v8, v11);

    -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
    objc_initWeak(&location, self);
    -[PKApplyCollectionViewController controller](self, "controller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyCollectionViewController currentPage](self, "currentPage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "footerContent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "termsIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__PKApplyConfirmInfoViewController_didSelectActionItem___block_invoke;
    v16[3] = &unk_1E3E62598;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v12, "submitActionIdentifier:termsIdentifiers:odiAttributesDictionary:completion:", v5, v15, 0, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

void __56__PKApplyConfirmInfoViewController_didSelectActionItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "handleNextViewController:displayableError:", v8, v5);

}

- (void)_continueAction
{
  void *v3;
  id v4;
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
  id v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  void *v23;
  PKApplyVerifyingViewController *v24;
  void *v25;
  void *v26;
  PKApplyVerifyingViewController *v27;
  _QWORD v28[4];
  id v29;
  id location;

  -[PKApplyCollectionViewController currentPage](self, "currentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadingPageContent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[PKApplyCollectionViewController controller](self, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "featureIdentifier"))
    {
      -[PKApplyCollectionViewController controller](self, "controller");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "featureApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "feature");

    }
    -[PKApplyCollectionViewController controller](self, "controller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredLanguage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_alloc_init(MEMORY[0x1E0D66D20]);
    PKLocalizedApplyFeatureString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v10);

    PKLocalizedApplyFeatureString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSubtitle:", v11);

  }
  objc_msgSend(v4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    objc_msgSend(v4, "setIdentifier:", CFSTR("ApplyConfirmInfoVerifying"));
  v27 = [PKApplyVerifyingViewController alloc];
  -[PKApplyCollectionViewController controller](self, "controller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyCollectionViewController setupDelegate](self, "setupDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v4;
  v16 = -[PKPaymentSetupOptionsViewController context](self, "context");
  objc_msgSend(v3, "primaryActionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footerContent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "termsIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v3;
  objc_msgSend(v3, "actionContent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "odiAttributesDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v16;
  v23 = v15;
  v24 = -[PKApplyVerifyingViewController initWithController:setupDelegate:context:applyPage:actionIdentifierToSubmit:termsIdentifiersToSubmit:odiAttributesDictionaryToSubmit:](v27, "initWithController:setupDelegate:context:applyPage:actionIdentifierToSubmit:termsIdentifiersToSubmit:odiAttributesDictionaryToSubmit:", v13, v14, v22, v15, v17, v19, v21);

  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  -[PKApplyConfirmInfoViewController navigationController](self, "navigationController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __51__PKApplyConfirmInfoViewController__continueAction__block_invoke;
  v28[3] = &unk_1E3E61C58;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v25, "pk_presentPaymentSetupViewController:animated:completion:", v24, 1, v28);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __51__PKApplyConfirmInfoViewController__continueAction__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setShowNavigationBarSpinner:", 0);
    WeakRetained = v4;
    if ((a2 & 1) == 0)
    {
      objc_msgSend(v4, "terminateSetupFlow");
      WeakRetained = v4;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);
}

@end
