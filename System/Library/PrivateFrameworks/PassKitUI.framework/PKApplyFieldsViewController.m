@implementation PKApplyFieldsViewController

- (PKApplyFieldsViewController)initWithController:(id)a3 setupDelegate:(id)a4 applyPage:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKApplyFieldsViewController *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKApplyFieldsViewController;
  v12 = -[PKDynamicProvisioningFieldsPageViewController initWithWebService:context:setupDelegate:fieldsPage:](&v14, sel_initWithWebService_context_setupDelegate_fieldsPage_, 0, objc_msgSend(v9, "context"), v11, v10);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_controller, a3);
    objc_storeStrong((id *)&v12->_applyPage, a5);
    if (-[PKApplyController featureIdentifier](v12->_controller, "featureIdentifier") == 5)
      -[PKPaymentSetupTableViewController setMoveFooterWithKeyboard:](v12, "setMoveFooterWithKeyboard:", -[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v12, "pkui_userInterfaceIdiomSupportsLargeLayouts") ^ 1);
  }

  return v12;
}

- (void)viewDidLoad
{
  BOOL v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  PKTextRangeHyperlink *v9;
  void *v10;
  PKTextRangeHyperlink *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKMultiHyperlinkView *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id location;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)PKApplyFieldsViewController;
  -[PKDynamicProvisioningFieldsPageViewController viewDidLoad](&v28, sel_viewDidLoad);
  -[PKApplyRequiredFieldsPage footerContent](self->_applyPage, "footerContent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "footerText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    v2 = v18 == 0;
  else
    v2 = 1;
  if (!v2)
  {
    v17 = objc_alloc_init(PKMultiHyperlinkView);
    -[PKMultiHyperlinkView setText:](v17, "setText:", v18);
    -[PKMultiHyperlinkView setTextAlignment:](v17, "setTextAlignment:", 1);
    objc_initWeak(&location, self);
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v19, "links");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v9 = [PKTextRangeHyperlink alloc];
          objc_msgSend(v8, "linkText");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __42__PKApplyFieldsViewController_viewDidLoad__block_invoke;
          v21[3] = &unk_1E3E61B68;
          objc_copyWeak(&v22, &location);
          v21[4] = v8;
          v11 = -[PKTextRangeHyperlink initWithLinkText:action:](v9, "initWithLinkText:action:", v10, v21);

          objc_msgSend(v3, "safelyAddObject:", v11);
          objc_destroyWeak(&v22);
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v5);
    }

    v12 = objc_msgSend(v3, "count");
    if (v12)
      v13 = (void *)objc_msgSend(v3, "copy");
    else
      v13 = 0;
    -[PKMultiHyperlinkView setSources:](v17, "setSources:", v13);
    if (v12)

    objc_msgSend(v16, "setAdditionalLinkView:", v17);
    objc_msgSend(v16, "setAdditionalLinkBottomPadding:", 16.0);

    objc_destroyWeak(&location);
  }
  if ((-[PKApplyController applicationType](self->_controller, "applicationType") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    PKFeatureApplicationHeaderImageWithImage(-[PKApplyController featureIdentifier](self->_controller, "featureIdentifier"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldsViewController headerView](self, "headerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "size");
    objc_msgSend(v15, "setImageViewImage:withSize:animated:", v14, 0);

  }
}

void __42__PKApplyFieldsViewController_viewDidLoad__block_invoke(uint64_t a1)
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
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *controller;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)PKApplyFieldsViewController;
  -[PKPaymentSetupFieldsViewController viewDidAppear:](&v19, sel_viewDidAppear_, a3);
  -[PKApplyController applyFlowDidAppear](self->_controller, "applyFlowDidAppear");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__featureApplicationUpdated, CFSTR("PKApplyControllerUpdatedNotification"), 0);

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKApplyRequiredFieldsPage fieldModel](self->_applyPage, "fieldModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setupFieldAnalytics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  v8 = *MEMORY[0x1E0D68C50];
  v9 = *MEMORY[0x1E0D68AA0];
  objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x1E0D68C50], *MEMORY[0x1E0D68AA0]);
  controller = self->_controller;
  -[PKApplyFieldsViewController currentPage](self, "currentPage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D68658];
  objc_msgSend(controller, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v11, *MEMORY[0x1E0D68658], v5);

  v13 = -[PKApplyController featureIdentifier](self->_controller, "featureIdentifier");
  if (v13 != 3)
  {
    -[PKApplyController featureApplication](self->_controller, "featureApplication");
    controller = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(controller, "feature") != 3)
      goto LABEL_7;
  }
  -[PKApplyController payLaterSetupController](self->_controller, "payLaterSetupController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "controllerContext");

  if (v13 != 3)
  if (!v15)
  {
    v16 = (void *)MEMORY[0x1E0D66A58];
    v17 = *MEMORY[0x1E0D698F8];
    v18 = *MEMORY[0x1E0D68F50];
    v20[0] = v9;
    v20[1] = v18;
    v21[0] = v8;
    v21[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    controller = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "subject:sendEvent:", v17, controller);
LABEL_7:

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  PKApplyController *controller;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKApplyFieldsViewController;
  -[PKApplyFieldsViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("PKApplyControllerUpdatedNotification"), 0);

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKApplyRequiredFieldsPage fieldModel](self->_applyPage, "fieldModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setupFieldAnalytics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x1E0D68C58], *MEMORY[0x1E0D68AA0]);
  controller = self->_controller;
  -[PKApplyFieldsViewController currentPage](self, "currentPage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyController reportAnalyticsDictionaryForPage:pageTag:additionalValues:](controller, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v9, *MEMORY[0x1E0D68658], v5);

}

- (id)currentPage
{
  return self->_applyPage;
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

  -[PKApplyFieldsViewController didTapLink:termsIdentifier:analyticsIdentifier:](self, "didTapLink:termsIdentifier:analyticsIdentifier:", v7, v5, v6);
}

- (void)didTapLink:(id)a3 termsIdentifier:(id)a4 analyticsIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKApplyController *controller;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  PKApplyTermsAndConditionsViewController *v16;
  PKApplyController *v17;
  void *v18;
  PKApplyTermsAndConditionsViewController *v19;
  void *v20;
  void *v21;
  int v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    controller = self->_controller;
    -[PKApplyFieldsViewController currentPage](self, "currentPage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D68B18];
    v14 = *MEMORY[0x1E0D68858];
    v23[0] = *MEMORY[0x1E0D68AA0];
    v23[1] = v14;
    v24[0] = v13;
    v24[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyController reportAnalyticsDictionaryForPage:pageTag:additionalValues:](controller, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v12, 0, v15);

  }
  if (v9)
  {
    v16 = [PKApplyTermsAndConditionsViewController alloc];
    v17 = self->_controller;
    -[PKPaymentSetupFieldsViewController setupDelegate](self, "setupDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PKApplyTermsAndConditionsViewController initWithController:setupDelegate:context:termsIdentifier:](v16, "initWithController:setupDelegate:context:termsIdentifier:", v17, v18, -[PKPaymentSetupTableViewController context](self, "context"), v9);

    -[PKFeatureTermsAndConditionsViewController setUseModalPresentation:](v19, "setUseModalPresentation:", 1);
    -[PKApplyTermsAndConditionsViewController setPreflightPDFTerms:](v19, "setPreflightPDFTerms:", 1);
    -[PKApplyFieldsViewController navigationController](self, "navigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pk_presentPaymentSetupViewController:animated:completion:", v19, 1, 0);

  }
  else
  {
    if (!v8)
      goto LABEL_6;
    objc_msgSend(v8, "scheme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "containsString:", CFSTR("http"));

    if (v22)
    {
      v19 = (PKApplyTermsAndConditionsViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v8);
      -[PKApplyTermsAndConditionsViewController setModalPresentationStyle:](v19, "setModalPresentationStyle:", 2);
      -[PKApplyFieldsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v19 = (PKApplyTermsAndConditionsViewController *)objc_claimAutoreleasedReturnValue();
      -[PKApplyTermsAndConditionsViewController openSensitiveURL:withOptions:](v19, "openSensitiveURL:withOptions:", v8, 0);
    }
  }

LABEL_6:
}

- (void)_featureApplicationUpdated
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  PKApplyController *controller;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[PKDynamicProvisioningFieldsPageViewController isLoading](self, "isLoading");
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%@ Application update received but current view controller is loading - skipping update", buf, 0xCu);

    }
  }
  else
  {
    if (v5)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "%@ Application update received presenting next step", buf, 0xCu);

    }
    controller = self->_controller;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__PKApplyFieldsViewController__featureApplicationUpdated__block_invoke;
    v11[3] = &unk_1E3E612E8;
    v11[4] = self;
    -[PKApplyController applicationUpdatedAlertControllerWithHandler:](controller, "applicationUpdatedAlertControllerWithHandler:", v11);
    v4 = objc_claimAutoreleasedReturnValue();
    -[PKApplyFieldsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
  }

}

uint64_t __57__PKApplyFieldsViewController__featureApplicationUpdated__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "showSpinner:", 1);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1272);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PKApplyFieldsViewController__featureApplicationUpdated__block_invoke_2;
  v5[3] = &unk_1E3E62260;
  v5[4] = v2;
  return objc_msgSend(v3, "nextViewControllerWithCompletion:", v5);
}

uint64_t __57__PKApplyFieldsViewController__featureApplicationUpdated__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD v5[5];

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PKApplyFieldsViewController__featureApplicationUpdated__block_invoke_3;
  v5[3] = &unk_1E3E612E8;
  v5[4] = v3;
  return objc_msgSend(v3, "_handleNextViewController:displayableError:terminationHandler:", a2, a3, v5);
}

uint64_t __57__PKApplyFieldsViewController__featureApplicationUpdated__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateFlow");
}

- (void)_withdrawApplicationTapped
{
  PKApplyController *controller;
  _QWORD v4[4];
  id v5;
  id location;

  -[PKDynamicProvisioningFieldsPageViewController showSpinner:](self, "showSpinner:", 1);
  objc_initWeak(&location, self);
  controller = self->_controller;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PKApplyFieldsViewController__withdrawApplicationTapped__block_invoke;
  v4[3] = &unk_1E3E62598;
  objc_copyWeak(&v5, &location);
  -[PKApplyController withdrawApplicationWithCompletion:](controller, "withdrawApplicationWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__PKApplyFieldsViewController__withdrawApplicationTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id *v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __57__PKApplyFieldsViewController__withdrawApplicationTapped__block_invoke_2;
      v12[3] = &unk_1E3E62288;
      v13 = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v12);

    }
    else
    {
      objc_msgSend(WeakRetained, "showSpinner:", 0);
      if (v6)
      {
        v10 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
        objc_msgSend(v8, "navigationController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

      }
      else
      {
        objc_msgSend(v8[159], "endApplyFlow");
        objc_msgSend(v8, "_terminateFlow");
      }
    }
  }

}

uint64_t __57__PKApplyFieldsViewController__withdrawApplicationTapped__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "showSpinner:", 0);
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_terminateFlow");
  return result;
}

- (void)_completeInWalletLater
{
  -[PKApplyController endApplyFlow](self->_controller, "endApplyFlow");
  -[PKApplyFieldsViewController _handleNextStep](self, "_handleNextStep");
}

- (void)fieldCellDidTapButton:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyFieldsViewController;
  v4 = a3;
  -[PKPaymentSetupFieldsViewController fieldCellDidTapButton:](&v5, sel_fieldCellDidTapButton_, v4);
  -[PKApplyFieldsViewController _analyticsReportRowTapForFieldCell:](self, "_analyticsReportRowTapForFieldCell:", v4, v5.receiver, v5.super_class);

}

- (BOOL)fieldCellEditableTextFieldShouldBeginEditing:(id)a3
{
  id v4;
  objc_super v6;

  v4 = a3;
  -[PKApplyFieldsViewController _analyticsReportRowTapForFieldCell:](self, "_analyticsReportRowTapForFieldCell:", v4);
  v6.receiver = self;
  v6.super_class = (Class)PKApplyFieldsViewController;
  LOBYTE(self) = -[PKPaymentSetupFieldsViewController fieldCellEditableTextFieldShouldBeginEditing:](&v6, sel_fieldCellEditableTextFieldShouldBeginEditing_, v4);

  return (char)self;
}

- (BOOL)shouldAppearWithFirstEmptyFieldAsFirstResponder
{
  void *v2;
  void *v3;
  char v4;

  -[PKPaymentSetupFieldsViewController firstEmptySetupField](self, "firstEmptySetupField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D6AF20]);

  return v4 ^ 1;
}

- (id)defaultHeaderViewTitle
{
  return (id)-[PKApplyRequiredFieldsPage title](self->_applyPage, "title");
}

- (id)defaultHeaderViewSubTitle
{
  return (id)-[PKApplyRequiredFieldsPage subtitle](self->_applyPage, "subtitle");
}

- (void)handleCancelTapped
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PKApplyFieldsViewController_handleCancelTapped__block_invoke;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PKApplyController cancelAlertWithContinueAction:](self->_controller, "cancelAlertWithContinueAction:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKApplyFieldsViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

  }
  else
  {
    v3[2](v3);
  }

}

uint64_t __49__PKApplyFieldsViewController_handleCancelTapped__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[159];
  objc_msgSend(v2, "currentPage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D68658];
  v6 = *MEMORY[0x1E0D68858];
  v12[0] = *MEMORY[0x1E0D68AA0];
  v12[1] = v6;
  v7 = *MEMORY[0x1E0D688C0];
  v13[0] = *MEMORY[0x1E0D68B18];
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v4, v5, v8);

  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "featureIdentifier");
  v10 = *(id **)(a1 + 32);
  if (v9 != 5)
    return objc_msgSend(v10, "_withdrawApplicationTapped");
  objc_msgSend(v10[159], "endApplyFlow");
  return objc_msgSend(*(id *)(a1 + 32), "_terminateFlow");
}

- (void)_handleNextStep
{
  PKApplyController *controller;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  PKApplyController *v9;
  PKApplyRequiredFieldsPage *applyPage;
  _QWORD v11[4];
  id v12;
  id location;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[PKDynamicProvisioningFieldsPageViewController showSpinner:](self, "showSpinner:", 1);
  controller = self->_controller;
  -[PKApplyFieldsViewController currentPage](self, "currentPage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D68B18];
  v6 = *MEMORY[0x1E0D68858];
  v14[0] = *MEMORY[0x1E0D68AA0];
  v14[1] = v6;
  v7 = *MEMORY[0x1E0D68E58];
  v15[0] = v5;
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyController reportAnalyticsDictionaryForPage:pageTag:additionalValues:](controller, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v4, *MEMORY[0x1E0D68658], v8);

  objc_initWeak(&location, self);
  v9 = self->_controller;
  applyPage = self->_applyPage;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__PKApplyFieldsViewController__handleNextStep__block_invoke;
  v11[3] = &unk_1E3E62598;
  objc_copyWeak(&v12, &location);
  -[PKApplyController submitFieldsPage:completion:](v9, "submitFieldsPage:completion:", applyPage, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __46__PKApplyFieldsViewController__handleNextStep__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  _QWORD v9[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__PKApplyFieldsViewController__handleNextStep__block_invoke_2;
    v9[3] = &unk_1E3E612E8;
    v9[4] = WeakRetained;
    objc_msgSend(WeakRetained, "_handleNextViewController:displayableError:terminationHandler:", v5, v6, v9);
  }

}

uint64_t __46__PKApplyFieldsViewController__handleNextStep__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Error: No next step to take. Terminating setup flow - File a radar", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_terminateFlow");
}

- (void)_handleNextViewController:(id)a3 displayableError:(id)a4 terminationHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  id v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (v8)
  {
    -[PKApplyFieldsViewController navigationController](self, "navigationController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __93__PKApplyFieldsViewController__handleNextViewController_displayableError_terminationHandler___block_invoke;
    v14[3] = &unk_1E3E62288;
    v14[4] = self;
    objc_msgSend(v11, "pk_presentPaymentSetupViewController:animated:delay:completion:", v8, 1, 0, v14);
LABEL_5:

    goto LABEL_6;
  }
  -[PKDynamicProvisioningFieldsPageViewController showSpinner:](self, "showSpinner:", 0);
  if (v9)
  {
    -[PKApplyFieldsViewController _analyticsReportError:](self, "_analyticsReportError:", v9);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __93__PKApplyFieldsViewController__handleNextViewController_displayableError_terminationHandler___block_invoke_2;
    v13[3] = &unk_1E3E612E8;
    v13[4] = self;
    v11 = PKAlertForDisplayableErrorWithHandlers(v9, 0, v13, 0);
    -[PKApplyFieldsViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentViewController:animated:completion:", v11, 1, 0);

    goto LABEL_5;
  }
  if (v10)
    v10[2](v10);
LABEL_6:

}

uint64_t __93__PKApplyFieldsViewController__handleNextViewController_displayableError_terminationHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "showSpinner:", 0);
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_terminateFlow");
  return result;
}

void __93__PKApplyFieldsViewController__handleNextViewController_displayableError_terminationHandler___block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[159];
  objc_msgSend(v1, "currentPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D68658];
  v5 = *MEMORY[0x1E0D68858];
  v8[0] = *MEMORY[0x1E0D68AA0];
  v8[1] = v5;
  v6 = *MEMORY[0x1E0D68EC0];
  v9[0] = *MEMORY[0x1E0D68B18];
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v3, v4, v7);

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
    -[PKApplyFieldsViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_analyticsReportRowTapForFieldCell:(id)a3
{
  void *v4;
  void *v5;
  PKApplyController *controller;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "paymentSetupField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    controller = self->_controller;
    -[PKApplyFieldsViewController currentPage](self, "currentPage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0D69438];
    v11[0] = *MEMORY[0x1E0D68AA0];
    v11[1] = v8;
    v9 = *MEMORY[0x1E0D68658];
    v12[0] = *MEMORY[0x1E0D68C08];
    v12[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyController reportAnalyticsDictionaryForPage:pageTag:additionalValues:](controller, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", v7, v9, v10);

  }
}

- (void)_analyticsReportError:(id)a3
{
  PKApplyController *controller;
  id v5;
  id v6;

  controller = self->_controller;
  v5 = a3;
  -[PKApplyFieldsViewController currentPage](self, "currentPage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKApplyController reportAnalyticsError:page:pageTag:additionalValues:](controller, "reportAnalyticsError:page:pageTag:additionalValues:", v5, v6, *MEMORY[0x1E0D68658], 0);

}

- (unint64_t)onPresentationRemoveViewControllersAfterMarker
{
  return 3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyPage, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
