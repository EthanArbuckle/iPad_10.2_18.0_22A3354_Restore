@implementation PKApplyCollectionViewController

- (PKApplyCollectionViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKApplyCollectionViewController *v14;
  PKApplyCollectionViewController *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKApplyCollectionViewController;
  v14 = -[PKPaymentSetupOptionsViewController initWithProvisioningController:context:delegate:](&v17, sel_initWithProvisioningController_context_delegate_, 0, a5, 0);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_setupDelegate, v12);
    objc_storeStrong((id *)&v15->_page, a6);
    objc_storeStrong((id *)&v15->_controller, a3);
  }

  return v15;
}

- (id)currentPage
{
  return self->_page;
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
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  PKTextRangeHyperlink *v16;
  void *v17;
  PKTextRangeHyperlink *v18;
  uint64_t v19;
  void *v20;
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
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id location;
  objc_super v38;
  _BYTE v39[128];
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)PKApplyCollectionViewController;
  -[PKPaymentSetupOptionsViewController viewDidLoad](&v38, sel_viewDidLoad);
  -[PKPaymentSetupOptionsViewController headerView](self, "headerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTitleAccessoriesEnabled:", 0);
  objc_msgSend(v28, "setAdditionalBottomPadding:", 15.0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelPressed);
  -[PKApplyCollectionViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItems:animated:", v4, 0);

  -[PKApplyCollectionViewController navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setHidesBackButton:", 1);
  -[PKPaymentSetupOptionsViewController dockView](self, "dockView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "footerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setManualEntryButton:", 0);
  -[PKDynamicProvisioningPageContent title](self->_page, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setTitleText:](self, "setTitleText:", v5);

  -[PKDynamicProvisioningPageContent subtitle](self->_page, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupOptionsViewController setSubtitleText:](self, "setSubtitleText:", v6);

  -[PKDynamicProvisioningPageContent primaryActionTitle](self->_page, "primaryActionTitle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v30, "primaryButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v26, 0);

    objc_msgSend(v30, "primaryButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_primaryButtonTapped, 64);

  }
  else
  {
    objc_msgSend(v30, "setPrimaryButton:", 0);
  }
  -[PKDynamicProvisioningPageContent secondaryActionTitle](self->_page, "secondaryActionTitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[PKApplyCollectionViewController _secondaryButton](self, "_secondaryButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSetupLaterButton:", v9);
    objc_msgSend(v9, "setTitle:forState:", v25, 0);
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_secondaryButtonTapped, 64);

  }
  else
  {
    objc_msgSend(v27, "setSetupLaterButton:", 0);
  }
  -[PKDynamicProvisioningPageContent footerContent](self->_page, "footerContent");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "footerText");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 && v24)
  {
    v21 = objc_alloc_init(PKMultiHyperlinkView);
    -[PKMultiHyperlinkView setText:](v21, "setText:", v24);
    -[PKMultiHyperlinkView setTextAlignment:](v21, "setTextAlignment:", 1);
    objc_initWeak(&location, self);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v29, "links");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v16 = [PKTextRangeHyperlink alloc];
          objc_msgSend(v15, "linkText");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __46__PKApplyCollectionViewController_viewDidLoad__block_invoke;
          v31[3] = &unk_1E3E61B68;
          objc_copyWeak(&v32, &location);
          v31[4] = v15;
          v18 = -[PKTextRangeHyperlink initWithLinkText:action:](v16, "initWithLinkText:action:", v17, v31);

          objc_msgSend(v10, "safelyAddObject:", v18);
          objc_destroyWeak(&v32);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v12);
    }

    v19 = objc_msgSend(v10, "count");
    if (v19)
      v20 = (void *)objc_msgSend(v10, "copy");
    else
      v20 = 0;
    -[PKMultiHyperlinkView setSources:](v21, "setSources:", v20);
    if (v19)

    objc_msgSend(v30, "setAdditionalLinkView:", v21);
    objc_destroyWeak(&location);

  }
}

void __46__PKApplyCollectionViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "didTapFooterLink:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKApplyCollectionViewController;
  -[PKPaymentSetupOptionsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKApplyCollectionViewController _reportViewDidAppear:](self, "_reportViewDidAppear:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKApplyCollectionViewController;
  -[PKApplyCollectionViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PKApplyCollectionViewController _reportViewDidAppear:](self, "_reportViewDidAppear:", 0);
}

- (void)_reportViewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v5 = (id *)MEMORY[0x1E0D68C50];
  if (!a3)
    v5 = (id *)MEMORY[0x1E0D68C58];
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = *v5;
  v12 = objc_alloc_init(v6);
  -[PKApplyCollectionViewController additionalAnalyticsDictionaryForViewAppearing:](self, "additionalAnalyticsDictionaryForViewAppearing:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addEntriesFromDictionary:", v8);

  objc_msgSend(v12, "setObject:forKey:", v7, *MEMORY[0x1E0D68AA0]);
  -[PKApplyCollectionViewController controller](self, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyCollectionViewController currentPage](self, "currentPage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyCollectionViewController pageTag](self, "pageTag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v10, v11, v12);

}

- (id)pageTag
{
  return 0;
}

- (BOOL)shouldDisplayErrorOnWithdraw
{
  return 1;
}

- (id)additionalAnalyticsDictionaryForViewAppearing:(BOOL)a3
{
  return 0;
}

- (void)primaryButtonTapped
{
  PKApplyController *controller;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned int (**primaryButtonAction)(void);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  controller = self->_controller;
  -[PKApplyCollectionViewController currentPage](self, "currentPage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyCollectionViewController pageTag](self, "pageTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D68858];
  v16[0] = *MEMORY[0x1E0D68AA0];
  v16[1] = v6;
  v7 = *MEMORY[0x1E0D68958];
  v17[0] = *MEMORY[0x1E0D68B18];
  v17[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyController reportAnalyticsDictionaryForPage:pageTag:additionalValues:](controller, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v4, v5, v8);

  primaryButtonAction = (unsigned int (**)(void))self->_primaryButtonAction;
  if (!primaryButtonAction || primaryButtonAction[2]())
  {
    -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
    -[PKApplyCollectionViewController currentPage](self, "currentPage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyCollectionViewController controller](self, "controller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "primaryActionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "footerContent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "termsIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__PKApplyCollectionViewController_primaryButtonTapped__block_invoke;
    v15[3] = &unk_1E3E62260;
    v15[4] = self;
    objc_msgSend(v11, "submitActionIdentifier:termsIdentifiers:odiAttributesDictionary:completion:", v12, v14, 0, v15);

  }
}

uint64_t __54__PKApplyCollectionViewController_primaryButtonTapped__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNextViewController:displayableError:", a2, a3);
}

- (void)secondaryButtonTapped
{
  PKPaymentSetupViewControllerDelegate **p_setupDelegate;
  id WeakRetained;
  id v5;

  p_setupDelegate = &self->_setupDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_setupDelegate);
    objc_msgSend(v5, "viewControllerDidTerminateSetupFlow:", self);

  }
}

- (id)_secondaryButton
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExclusiveTouch:", 1);
  objc_msgSend(v3, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 0);
  objc_msgSend(v4, "setTextAlignment:", 1);
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48F0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_secondaryButtonTapped, 64);
  return v3;
}

- (void)_cancelPressed
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PKApplyCollectionViewController__cancelPressed__block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PKApplyController cancelAlertWithContinueAction:](self->_controller, "cancelAlertWithContinueAction:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKApplyCollectionViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

  }
  else
  {
    v3[2](v3);
  }

}

uint64_t __49__PKApplyCollectionViewController__cancelPressed__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[160];
  objc_msgSend(v2, "currentPage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pageTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D68858];
  v12[0] = *MEMORY[0x1E0D68AA0];
  v12[1] = v6;
  v7 = *MEMORY[0x1E0D688C0];
  v13[0] = *MEMORY[0x1E0D68B18];
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v4, v5, v8);

  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1280), "featureIdentifier");
  v10 = *(id **)(a1 + 32);
  if (v9 != 5)
    return objc_msgSend(v10, "_withdrawApplicationTapped");
  objc_msgSend(v10[160], "endApplyFlow");
  return objc_msgSend(*(id *)(a1 + 32), "terminateSetupFlow");
}

- (void)_withdrawApplicationTapped
{
  PKApplyController *controller;
  _QWORD v4[5];
  id v5;
  id location;

  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  controller = self->_controller;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__PKApplyCollectionViewController__withdrawApplicationTapped__block_invoke;
  v4[3] = &unk_1E3E63C50;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  -[PKApplyController withdrawApplicationWithCompletion:](controller, "withdrawApplicationWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __61__PKApplyCollectionViewController__withdrawApplicationTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  id *v8;
  id v9;
  void *v10;
  _QWORD v11[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __61__PKApplyCollectionViewController__withdrawApplicationTapped__block_invoke_2;
      v11[3] = &unk_1E3E62288;
      v11[4] = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v11);
    }
    else
    {
      objc_msgSend(WeakRetained, "setShowNavigationBarSpinner:", 0);
      if (!v6 || !objc_msgSend(*(id *)(a1 + 32), "shouldDisplayErrorOnWithdraw"))
      {
        objc_msgSend(v8[160], "endApplyFlow");
        objc_msgSend(v8, "terminateSetupFlow");
        goto LABEL_9;
      }
      v9 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
      objc_msgSend(v8, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentViewController:animated:completion:", v9, 1, 0);

    }
  }
LABEL_9:

}

uint64_t __61__PKApplyCollectionViewController__withdrawApplicationTapped__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "terminateSetupFlow");
  return result;
}

- (void)handleNextStep
{
  PKApplyController *controller;
  _QWORD v4[4];
  id v5;
  id location;

  -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  controller = self->_controller;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__PKApplyCollectionViewController_handleNextStep__block_invoke;
  v4[3] = &unk_1E3E62598;
  objc_copyWeak(&v5, &location);
  -[PKApplyController nextViewControllerWithCompletion:](controller, "nextViewControllerWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__PKApplyCollectionViewController_handleNextStep__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)handleNextViewController:(id)a3 displayableError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    -[PKApplyCollectionViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__PKApplyCollectionViewController_handleNextViewController_displayableError___block_invoke;
    v10[3] = &unk_1E3E62288;
    v10[4] = self;
    objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v6, 1, v10);

  }
  else if (v7)
  {
    -[PKApplyCollectionViewController displayDisplayableError:](self, "displayDisplayableError:", v7);
  }
  else
  {
    -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 0);
    -[PKApplyCollectionViewController terminateSetupFlow](self, "terminateSetupFlow");
  }

}

uint64_t __77__PKApplyCollectionViewController_handleNextViewController_displayableError___block_invoke(uint64_t a1, char a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "terminateSetupFlow");
  return result;
}

- (void)displayDisplayableError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "underlyingErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0D69A20];
  v9 = v7;
  v10 = v8;
  if (v9 == v10)
  {

  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
    {

LABEL_10:
      goto LABEL_11;
    }
    v12 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v12)
      goto LABEL_10;
  }
  v13 = objc_msgSend(v6, "code");

  if (v13 == 1)
  {
    -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 0);
    goto LABEL_17;
  }
LABEL_11:
  v14 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
  if (v14)
  {
    -[PKApplyCollectionViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__PKApplyCollectionViewController_displayDisplayableError___block_invoke;
    v17[3] = &unk_1E3E612E8;
    v17[4] = self;
    objc_msgSend(v15, "presentViewController:animated:completion:", v14, 1, v17);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Error could not generate alertController for: %@", buf, 0xCu);
    }

    -[PKPaymentSetupOptionsViewController setShowNavigationBarSpinner:](self, "setShowNavigationBarSpinner:", 0);
    -[PKApplyCollectionViewController terminateSetupFlow](self, "terminateSetupFlow");
  }

LABEL_17:
}

uint64_t __59__PKApplyCollectionViewController_displayDisplayableError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowNavigationBarSpinner:", 0);
}

- (void)terminateSetupFlow
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint8_t v7[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKApplyCollectionViewController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)didTapLearnMore:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "buttonURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "termsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKApplyCollectionViewController didTapLink:termsIdentifier:analyticsIdentifier:](self, "didTapLink:termsIdentifier:analyticsIdentifier:", v6, v5, 0);
}

- (void)didTapFooterLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "linkURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "termsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKApplyCollectionViewController didTapLink:termsIdentifier:analyticsIdentifier:](self, "didTapLink:termsIdentifier:analyticsIdentifier:", v7, v5, v6);
}

- (void)didTapLink:(id)a3 termsIdentifier:(id)a4 analyticsIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  PKAccountTermsAndConditionsController *v19;
  void *v20;
  PKAccountTermsAndConditionsController *v21;
  PKAccountTermsAndConditionsController *termsController;
  PKAccountTermsAndConditionsController *v23;
  void *v24;
  int v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id location[3];
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PKApplyCollectionViewController controller](self, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PKApplyCollectionViewController controller](self, "controller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyCollectionViewController currentPage](self, "currentPage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyCollectionViewController pageTag](self, "pageTag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0D68B18];
    v17 = *MEMORY[0x1E0D68858];
    v32[0] = *MEMORY[0x1E0D68AA0];
    v32[1] = v17;
    v33[0] = v16;
    v33[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v14, v15, v18);

  }
  if (v9)
  {
    if (v12)
    {
      v19 = [PKAccountTermsAndConditionsController alloc];
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[PKAccountTermsAndConditionsController initWithAccount:webService:context:termsIdentifier:](v19, "initWithAccount:webService:context:termsIdentifier:", v12, v20, -[PKPaymentSetupOptionsViewController context](self, "context"), v9);
      termsController = self->_termsController;
      self->_termsController = v21;

      objc_initWeak(location, self);
      v23 = self->_termsController;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __82__PKApplyCollectionViewController_didTapLink_termsIdentifier_analyticsIdentifier___block_invoke;
      v29[3] = &unk_1E3E62598;
      objc_copyWeak(&v30, location);
      -[PKAccountTermsAndConditionsController termsViewControllerWithCompletion:](v23, "termsViewControllerWithCompletion:", v29);
      objc_destroyWeak(&v30);
      objc_destroyWeak(location);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v9;
        _os_log_impl(&dword_19D178000, v27, OS_LOG_TYPE_DEFAULT, "Error: there is no account on PKApplyController in order to open termsIdentifier %@", (uint8_t *)location, 0xCu);
      }

    }
  }
  else if (v8)
  {
    objc_msgSend(v8, "scheme");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "containsString:", CFSTR("http"));

    if (v25)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v8);
      objc_msgSend(v26, "setModalPresentationStyle:", 2);
      -[PKApplyCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v26, 1, 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "openSensitiveURL:withOptions:", v8, 0);

    }
  }

}

void __82__PKApplyCollectionViewController_didTapLink_termsIdentifier_analyticsIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      objc_msgSend(WeakRetained, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

    }
    else if (v9)
    {
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);
    }
  }

}

- (PKApplyController)controller
{
  return self->_controller;
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (PKDynamicProvisioningPageContent)page
{
  return self->_page;
}

- (void)setPage:(id)a3
{
  objc_storeStrong((id *)&self->_page, a3);
}

- (id)primaryButtonAction
{
  return self->_primaryButtonAction;
}

- (void)setPrimaryButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_primaryButtonAction, 0);
  objc_storeStrong((id *)&self->_page, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
}

@end
