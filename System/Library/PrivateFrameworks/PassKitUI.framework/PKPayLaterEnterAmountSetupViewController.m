@implementation PKPayLaterEnterAmountSetupViewController

- (PKPayLaterEnterAmountSetupViewController)initWithSetupFlowController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PKPayLaterEnterAmountSetupViewController *v8;
  PKPayLaterEnterAmountSetupViewController *v9;
  uint64_t v10;
  NSString *pageTag;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PKPayLaterDynamicContentPage *dynamicContentPage;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSString *minimumString;
  void *v33;
  uint64_t v34;
  NSString *maximumString;
  objc_super v37;

  v5 = a3;
  objc_msgSend(v5, "financingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payLaterAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v37.receiver = self;
  v37.super_class = (Class)PKPayLaterEnterAmountSetupViewController;
  v8 = -[PKPayLaterEnterAmountViewController initWithPayLaterAccount:](&v37, sel_initWithPayLaterAccount_, v7);
  v9 = v8;
  if (v8)
  {
    -[PKPayLaterEnterAmountSetupViewController setModalInPresentation:](v8, "setModalInPresentation:", 1);
    objc_storeStrong((id *)&v9->_setupController, a3);
    PKPayLaterDynamicContentPageTypeToString();
    v10 = objc_claimAutoreleasedReturnValue();
    pageTag = v9->_pageTag;
    v9->_pageTag = (NSString *)v10;

    objc_msgSend(v5, "financingController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dynamicContent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "selectedProductType");
    objc_msgSend(v5, "selectedFinancingOption");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dynamicContentPageForPageType:productType:optionIdentifier:", 10, v14, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    dynamicContentPage = v9->_dynamicContentPage;
    v9->_dynamicContentPage = (PKPayLaterDynamicContentPage *)v17;

    objc_msgSend(v7, "payLaterDetails");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterDynamicContentPage minimumAmount](v9->_dynamicContentPage, "minimumAmount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = v20;
    }
    else
    {
      objc_msgSend(v19, "minimumSinglePurchaseAmount");
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v22;

    -[PKPayLaterDynamicContentPage maximumAmount](v9->_dynamicContentPage, "maximumAmount");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      objc_msgSend(v19, "maximumSinglePurchaseAmount");
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    v27 = v26;

    objc_msgSend(v23, "amount");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterEnterAmountViewController setMinAllowedAmount:](v9, "setMinAllowedAmount:", v28);

    objc_msgSend(v27, "amount");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterEnterAmountViewController setMaxAllowedAmount:](v9, "setMaxAllowedAmount:", v29);

    if (v23)
    {
      objc_msgSend(v23, "minimalFormattedStringValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCocoonString(CFSTR("ENTER_AMOUNT_MINIMUM"), CFSTR("%@"), v30);
      v31 = objc_claimAutoreleasedReturnValue();
      minimumString = v9->_minimumString;
      v9->_minimumString = (NSString *)v31;

    }
    if (v27)
    {
      objc_msgSend(v27, "minimalFormattedStringValue");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCocoonString(CFSTR("ENTER_AMOUNT_MAXIMUM"), CFSTR("%@"), v33);
      v34 = objc_claimAutoreleasedReturnValue();
      maximumString = v9->_maximumString;
      v9->_maximumString = (NSString *)v34;

    }
  }

  return v9;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterEnterAmountSetupViewController;
  -[PKPayLaterEnterAmountViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[PKPayLaterEnterAmountSetupViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:menu:", 1, 0);
    objc_msgSend(v7, "setTarget:", self);
    objc_msgSend(v7, "setAction:", sel__cancelButtonTapped);
    -[PKPayLaterEnterAmountSetupViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:", v7);

  }
  -[PKPayLaterEnterAmountSetupViewController _reportViewDidAppear:](self, "_reportViewDidAppear:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterEnterAmountSetupViewController;
  -[PKPayLaterEnterAmountViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKPayLaterEnterAmountSetupViewController _reportViewDidAppear:](self, "_reportViewDidAppear:", 0);
}

- (void)willMoveToParentViewController:(id)a3
{
  PKPayLaterSetupFlowController *setupController;
  NSString *pageTag;
  void *v7;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKPayLaterEnterAmountSetupViewController;
  -[PKPayLaterEnterAmountSetupViewController willMoveToParentViewController:](&v8, sel_willMoveToParentViewController_);
  if (!a3)
  {
    setupController = self->_setupController;
    pageTag = self->_pageTag;
    v9 = *MEMORY[0x1E0D68858];
    v10[0] = *MEMORY[0x1E0D687C0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterSetupFlowController reportAnalyticsEventForPageTag:dictionary:](setupController, "reportAnalyticsEventForPageTag:dictionary:", pageTag, v7);

  }
}

- (void)_reportViewDidAppear:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  _QWORD *v6;
  id v7;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v5;
  v6 = (_QWORD *)MEMORY[0x1E0D68C50];
  if (!v3)
    v6 = (_QWORD *)MEMORY[0x1E0D68C58];
  objc_msgSend(v5, "setObject:forKey:", *v6, *MEMORY[0x1E0D68AA0]);
  -[PKPayLaterSetupFlowController reportAnalyticsEventForPageTag:dictionary:](self->_setupController, "reportAnalyticsEventForPageTag:dictionary:", self->_pageTag, v7);

}

- (id)headerTitle
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[PKPayLaterDynamicContentPage headerTitle](self->_dynamicContentPage, "headerTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    PKLocalizedCocoonString(CFSTR("HOW_MUCH_IS_PURCHASE_TITLE"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)headerSubtitle
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[PKPayLaterDynamicContentPage headerSubtitle](self->_dynamicContentPage, "headerSubtitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    PKLocalizedCocoonString(CFSTR("HOW_MUCH_IS_PURCHASE_MESSAGE"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)currencyAmountUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int *v8;
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "amount");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v5)
  {
    -[PKPayLaterEnterAmountViewController minAllowedAmount](self, "minAllowedAmount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterEnterAmountViewController maxAllowedAmount](self, "maxAllowedAmount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && objc_msgSend(v10, "compare:", v6) == -1)
    {
      v8 = &OBJC_IVAR___PKPayLaterEnterAmountSetupViewController__minimumString;
    }
    else
    {
      if (!v7 || objc_msgSend(v10, "compare:", v7) != 1)
      {
        v9 = 0;
LABEL_11:
        -[PKPayLaterEnterAmountViewController setAmountDetailsText:](self, "setAmountDetailsText:", v9);

        goto LABEL_12;
      }
      v8 = &OBJC_IVAR___PKPayLaterEnterAmountSetupViewController__maximumString;
    }
    v9 = *(id *)((char *)&self->super.super.super.super.isa + *v8);
    goto LABEL_11;
  }
LABEL_12:

}

- (BOOL)shouldAllowDecimalInput
{
  return 0;
}

- (void)nextButtonTapped
{
  void *v3;
  void *v4;
  id v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  PKPayLaterSetupFlowController *setupController;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PKPayLaterEnterAmountViewController currencyAmount](self, "currencyAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x1E0D68E58], *MEMORY[0x1E0D68858]);
  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    v7 = v6 / 50.0 + 0.5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)(floorf(v7) * 50.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, *MEMORY[0x1E0D68C38]);

  }
  -[PKPayLaterSetupFlowController reportAnalyticsEventForPageTag:dictionary:](self->_setupController, "reportAnalyticsEventForPageTag:dictionary:", self->_pageTag, v5);
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Updating pay later amount to %@", buf, 0xCu);
  }

  -[PKPayLaterEnterAmountViewController showNavigationBarSpinner:](self, "showNavigationBarSpinner:", 1);
  -[PKPayLaterSetupFlowController financingController](self->_setupController, "financingController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateTransactionAmount:", v4);

  objc_initWeak((id *)buf, self);
  setupController = self->_setupController;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__PKPayLaterEnterAmountSetupViewController_nextButtonTapped__block_invoke;
  v14[3] = &unk_1E3E62598;
  objc_copyWeak(&v15, (id *)buf);
  -[PKPayLaterSetupFlowController nextViewControllerFromState:parentViewController:completion:](setupController, "nextViewControllerFromState:parentViewController:completion:", 3, self, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __60__PKPayLaterEnterAmountSetupViewController_nextButtonTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PKPayLaterEnterAmountSetupViewController_nextButtonTapped__block_invoke_2;
    aBlock[3] = &unk_1E3E61310;
    objc_copyWeak(&v17, v7);
    v10 = _Block_copy(aBlock);
    if (v5)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __60__PKPayLaterEnterAmountSetupViewController_nextButtonTapped__block_invoke_3;
      v14[3] = &unk_1E3E614F0;
      v15 = v10;
      objc_msgSend(v11, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v14);

      v12 = v15;
    }
    else
    {
      if (!v6)
      {
        objc_msgSend(WeakRetained, "_cancelButtonTapped");
        goto LABEL_7;
      }
      PKAccountDisplayableError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = PKAlertForDisplayableErrorWithHandlers(v13, 0, 0, 0);

      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v12, 1, v10);
    }

LABEL_7:
    objc_destroyWeak(&v17);
  }

}

void __60__PKPayLaterEnterAmountSetupViewController_nextButtonTapped__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "showNavigationBarSpinner:", 0);
    WeakRetained = v2;
  }

}

uint64_t __60__PKPayLaterEnterAmountSetupViewController_nextButtonTapped__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_cancelButtonTapped
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x1E0D688E8], *MEMORY[0x1E0D68858]);
  -[PKPayLaterSetupFlowController reportAnalyticsEventForPageTag:dictionary:](self->_setupController, "reportAnalyticsEventForPageTag:dictionary:", self->_pageTag, v3);
  -[PKPayLaterSetupFlowController endSetupFlowFromViewController:shouldDismiss:](self->_setupController, "endSetupFlowFromViewController:shouldDismiss:", self, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageTag, 0);
  objc_storeStrong((id *)&self->_maximumString, 0);
  objc_storeStrong((id *)&self->_minimumString, 0);
  objc_storeStrong((id *)&self->_dynamicContentPage, 0);
  objc_storeStrong((id *)&self->_setupController, 0);
}

@end
