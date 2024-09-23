@implementation PKPaymentVerificationMethodsViewController

- (PKPaymentVerificationMethodsViewController)initWithVerificationController:(id)a3 fieldsModel:(id)a4
{
  PKPaymentVerificationController *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  PKPaymentVerificationMethodsViewController *v11;
  PKPaymentVerificationController *verificationController;
  PKPaymentVerificationController *v13;
  PKPaymentSetupVerificationMethodTableController *v14;
  PKPaymentSetupVerificationMethodTableController *methodTableController;
  objc_super v17;

  v6 = (PKPaymentVerificationController *)a3;
  v7 = a4;
  -[PKPaymentVerificationController webService](v6, "webService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPaymentVerificationController context](v6, "context");
  -[PKPaymentVerificationController setupDelegate](v6, "setupDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentVerificationMethodsViewController;
  v11 = -[PKPaymentSetupFieldsViewController initWithWebService:context:setupDelegate:setupFieldsModel:](&v17, sel_initWithWebService_context_setupDelegate_setupFieldsModel_, v8, v9, v10, v7);

  verificationController = v11->_verificationController;
  v11->_verificationController = v6;
  v13 = v6;

  v14 = -[PKPaymentSetupVerificationMethodTableController initWithVerificationController:]([PKPaymentSetupVerificationMethodTableController alloc], "initWithVerificationController:", v13);
  methodTableController = v11->_methodTableController;
  v11->_methodTableController = v14;

  return v11;
}

- (PKPaymentVerificationMethodsViewController)initWithVerificationController:(id)a3
{
  return -[PKPaymentVerificationMethodsViewController initWithVerificationController:fieldsModel:](self, "initWithVerificationController:fieldsModel:", a3, 0);
}

- (PKPaymentVerificationMethodsViewController)initWithVerificationController:(id)a3 verificationChannels:(id)a4
{
  id v6;
  PKPaymentVerificationMethodsViewController *v7;
  PKPaymentVerificationMethodsViewController *v8;

  v6 = a4;
  v7 = -[PKPaymentVerificationMethodsViewController initWithVerificationController:](self, "initWithVerificationController:", a3);
  v8 = v7;
  if (v7)
    -[PKPaymentSetupVerificationMethodTableController setVerificationChannels:](v7->_methodTableController, "setVerificationChannels:", v6);

  return v8;
}

- (void)loadView
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPaymentVerificationMethodsViewController;
  -[PKPaymentSetupTableViewController loadView](&v12, sel_loadView);
  -[PKPaymentSetupFieldsViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentVerificationController passSnapshot](self->_verificationController, "passSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
    objc_msgSend(v3, "setPassSnapshotUsingDefaultSize:animated:needsCorners:", v4, 0, 0);
  -[PKPaymentSetupFieldsViewController _setRightBarButtonItems:animated:](self, "_setRightBarButtonItems:animated:", MEMORY[0x1E0C9AA60], 0);
  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "footerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setManualEntryButton:", 0);
  objc_msgSend(v7, "setSetupLaterButton:", 0);
  objc_msgSend(v7, "skipCardButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("ACTIVATION_VERIFY_LATER"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__verifyLaterButtonPressed, 0x2000);
  objc_msgSend(v6, "primaryButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", 1);
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_handleNextButtonTapped_, 0x2000);
  PKLocalizedPaymentString(CFSTR("NEXT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v11, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentVerificationMethodsViewController;
  -[PKPaymentSetupFieldsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKPaymentSetupFieldsViewController setHidesBackButton:animated:](self, "setHidesBackButton:animated:", 1, 0);
  -[PKPaymentVerificationMethodsViewController _configure](self, "_configure");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentVerificationMethodsViewController;
  -[PKPaymentSetupFieldsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentVerificationMethodsViewController;
  -[PKPaymentVerificationMethodsViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetAllPaymentSetupFieldValues");

}

- (void)_configure
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKPaymentVerificationController *verificationController;
  _QWORD v13[4];
  id v14;
  id location;

  -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visiblePaymentSetupFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

LABEL_4:
    -[PKPaymentVerificationMethodsViewController _loadVerificationOptions](self, "_loadVerificationOptions");
    return;
  }
  -[PKPaymentSetupVerificationMethodTableController verificationChannels](self->_methodTableController, "verificationChannels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    goto LABEL_4;
  -[PKPaymentVerificationMethodsViewController defaultHeaderViewTitle](self, "defaultHeaderViewTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentVerificationMethodsViewController showActivitySpinnerWithTitle:subtitle:](self, "showActivitySpinnerWithTitle:subtitle:", v7, &stru_1E3E7D690);

  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setButtonsEnabled:", 0);

  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E0D673B8];
  -[PKPaymentVerificationController pass](self->_verificationController, "pass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestWithPass:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  verificationController = self->_verificationController;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__PKPaymentVerificationMethodsViewController__configure__block_invoke;
  v13[3] = &unk_1E3E634A8;
  objc_copyWeak(&v14, &location);
  -[PKPaymentVerificationController performVerificationOptionsRequest:completion:](verificationController, "performVerificationOptionsRequest:completion:", v11, v13);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __56__PKPaymentVerificationMethodsViewController__configure__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PKPaymentVerificationMethodsViewController__configure__block_invoke_2;
    block[3] = &unk_1E3E63480;
    v9 = WeakRetained;
    v11 = a2;
    v10 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __56__PKPaymentVerificationMethodsViewController__configure__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "hideActivitySpinner");
  objc_msgSend(*(id *)(a1 + 32), "dockView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonsEnabled:", 1);

  if (*(_QWORD *)(a1 + 48) == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1240), "verificationRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "verificationStatus");
    if ((unint64_t)(v4 - 2) < 2 || v4 == 4000)
    {
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Updating verification OTP methods", (uint8_t *)&v13, 2u);
      }

      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 1216);
      objc_msgSend(v3, "allChannels");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setVerificationChannels:", v6);
    }
    else if (v4 == 1)
    {
      PKLogFacilityTypeGetObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Updating verification fields", (uint8_t *)&v13, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "fieldsModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "requiredVerificationFields");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "replaceAllPaymentSetupFields:", v7);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Verification status: unknown, showing error.", (uint8_t *)&v13, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_requestErrorAlertController:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);
    }

    objc_msgSend(*(id *)(a1 + 32), "_loadVerificationOptions");
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Showing error: %@", (uint8_t *)&v13, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_requestErrorAlertController:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v3, 1, 0);
  }

}

- (void)_loadVerificationOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PKPaymentVerificationController verificationRecord](self->_verificationController, "verificationRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_verificationStatus = objc_msgSend(v3, "verificationStatus");

  -[PKPaymentVerificationMethodsViewController defaultHeaderViewTitle](self, "defaultHeaderViewTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentVerificationMethodsViewController defaultHeaderViewSubTitle](self, "defaultHeaderViewSubTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController setHeaderViewTitle:subtitle:](self, "setHeaderViewTitle:subtitle:", v4, v5);

  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setButtonsEnabled:", 1);

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (id)defaultHeaderViewTitle
{
  int64_t verificationStatus;
  void *v3;
  void *v5;
  char v6;

  verificationStatus = self->_verificationStatus;
  if ((unint64_t)(verificationStatus - 2) < 2 || verificationStatus == 4000)
  {
    -[PKPaymentSetupVerificationMethodTableController defaultHeaderViewTitle](self->_methodTableController, "defaultHeaderViewTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentVerificationController pass](self->_verificationController, "pass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsBarcodePayment");

    if ((v6 & 1) != 0)
      PKLocalizedAquamanString(CFSTR("ACCOUNT_VERIFICATION_TITLE"));
    else
      PKLocalizedPaymentString(CFSTR("CARD_VERIFICATION_TITLE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)defaultHeaderViewSubTitle
{
  int64_t verificationStatus;
  void *v3;

  verificationStatus = self->_verificationStatus;
  if ((unint64_t)(verificationStatus - 2) < 2 || verificationStatus == 4000)
  {
    -[PKPaymentSetupVerificationMethodTableController defaultHeaderViewSubTitle](self->_methodTableController, "defaultHeaderViewSubTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("ENTER_VERIFICATION_DETAILS"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)visibleFieldIdentifiers
{
  void *v2;
  void *v3;

  -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleSetupFieldIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)presentationContext
{
  void *v2;
  void *v3;

  -[PKPaymentVerificationMethodsViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)showActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4
{
  -[PKPaymentSetupFieldsViewController setHeaderViewTitle:subtitle:](self, "setHeaderViewTitle:subtitle:", a3, a4);
  -[PKPaymentVerificationMethodsViewController showLoadingUI:animated:](self, "showLoadingUI:animated:", 1, 1);
}

- (void)hideActivitySpinner
{
  -[PKPaymentVerificationMethodsViewController showLoadingUI:animated:](self, "showLoadingUI:animated:", 0, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v4;

  if (self->_verificationStatus != 1)
    return -[PKPaymentSetupVerificationMethodTableController numberOfSectionsInTableView:](self->_methodTableController, "numberOfSectionsInTableView:", a3);
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentVerificationMethodsViewController;
  return -[PKPaymentSetupFieldsViewController numberOfSectionsInTableView:](&v4, sel_numberOfSectionsInTableView_, a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v5;

  if (self->_verificationStatus != 1)
    return -[PKPaymentSetupVerificationMethodTableController tableView:numberOfRowsInSection:](self->_methodTableController, "tableView:numberOfRowsInSection:", a3, a4);
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentVerificationMethodsViewController;
  return -[PKPaymentSetupFieldsViewController tableView:numberOfRowsInSection:](&v5, sel_tableView_numberOfRowsInSection_, a3, a4);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;
  objc_super v5;

  if (self->_verificationStatus == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaymentVerificationMethodsViewController;
    -[PKPaymentSetupFieldsViewController tableView:heightForRowAtIndexPath:](&v5, sel_tableView_heightForRowAtIndexPath_, a3, a4);
  }
  else
  {
    -[PKPaymentSetupVerificationMethodTableController tableView:heightForRowAtIndexPath:](self->_methodTableController, "tableView:heightForRowAtIndexPath:", a3, a4);
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  objc_super v6;

  if (self->_verificationStatus == 1)
  {
    v6.receiver = self;
    v6.super_class = (Class)PKPaymentVerificationMethodsViewController;
    -[PKPaymentSetupFieldsViewController tableView:cellForRowAtIndexPath:](&v6, sel_tableView_cellForRowAtIndexPath_, a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentSetupVerificationMethodTableController tableView:cellForRowAtIndexPath:](self->_methodTableController, "tableView:cellForRowAtIndexPath:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_super v4;

  if (self->_verificationStatus == 1)
  {
    v4.receiver = self;
    v4.super_class = (Class)PKPaymentVerificationMethodsViewController;
    -[PKPaymentSetupFieldsViewController tableView:didSelectRowAtIndexPath:](&v4, sel_tableView_didSelectRowAtIndexPath_, a3, a4);
  }
  else
  {
    -[PKPaymentSetupVerificationMethodTableController tableView:didSelectRowAtIndexPath:](self->_methodTableController, "tableView:didSelectRowAtIndexPath:", a3, a4);
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  objc_super v5;

  if (self->_verificationStatus == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaymentVerificationMethodsViewController;
    -[PKPaymentSetupFieldsViewController tableView:willDisplayCell:forRowAtIndexPath:](&v5, sel_tableView_willDisplayCell_forRowAtIndexPath_, a3, a4, a5);
  }
  else
  {
    -[PKPaymentSetupVerificationMethodTableController tableView:willDisplayCell:forRowAtIndexPath:](self->_methodTableController, "tableView:willDisplayCell:forRowAtIndexPath:", a3, a4, a5);
  }
}

- (void)_verifyLaterButtonPressed
{
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 3);
  -[PKPaymentVerificationMethodsViewController _handleVerificationFinished](self, "_handleVerificationFinished");
}

- (void)_handleVerificationFinished
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  objc_msgSend(WeakRetained, "verificationMethodsViewControllerDidFinish:", self);

}

- (void)_terminateSetupFlow
{
  NSObject *v3;
  void *v4;
  id WeakRetained;
  id v6;
  void *v7;
  uint8_t v8[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Terminating setup flow", v8, 2u);
  }

  -[PKPaymentSetupFieldsViewController setupDelegate](self, "setupDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
    objc_msgSend(v6, "verificationMethodsViewControllerDidFinish:", self);

  }
  else if (v4)
  {
    objc_msgSend(v4, "viewControllerDidTerminateSetupFlow:", self);
    -[PKPaymentSetupFieldsViewController setHidesBackButton:animated:](self, "setHidesBackButton:animated:", 0, 0);
  }
  else
  {
    -[PKPaymentVerificationMethodsViewController presentingViewController](self, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)handleNextButtonTapped:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  PKPaymentVerificationController *verificationController;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentVerificationMethodsViewController showActivitySpinnerWithTitle:subtitle:](self, "showActivitySpinnerWithTitle:subtitle:", 0, 0);
  v5 = -[PKPaymentVerificationMethodsViewController _newVerificationRequest](self, "_newVerificationRequest");
  objc_msgSend(v5, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Performing verification update request for channel: %@", buf, 0xCu);
  }

  if (v6 && objc_msgSend(v6, "type") == 2)
  {
    if (objc_msgSend(v6, "requiresUserInteraction"))
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "User interaction required by verification channel. Skipping background observation.", buf, 2u);
      }
    }
    else
    {
      -[PKPaymentVerificationController webService](self->_verificationController, "webService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "targetDevice");
      v7 = objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[PKPaymentVerificationController pass](self->_verificationController, "pass");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject startBackgroundVerificationObserverForPass:verificationMethod:](v7, "startBackgroundVerificationObserverForPass:verificationMethod:", v9, v6);

      }
    }

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v6, "typeDescriptionUnlocalized");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safelySetObject:forKey:", v11, *MEMORY[0x1E0D696A0]);

  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:context:](self->_reporter, "reportButtonPressed:context:", 0, v10);
  objc_initWeak((id *)buf, self);
  verificationController = self->_verificationController;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke;
  v14[3] = &unk_1E3E634F8;
  objc_copyWeak(&v16, (id *)buf);
  v14[4] = self;
  v13 = v5;
  v15 = v13;
  -[PKPaymentVerificationController performVerificationUpdateRequest:completion:](verificationController, "performVerificationUpdateRequest:completion:", v13, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

void __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15[2];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke_2;
    v10[3] = &unk_1E3E634D0;
    v15[1] = a2;
    v8 = WeakRetained;
    v9 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    objc_copyWeak(v15, (id *)(a1 + 48));
    v13 = *(id *)(a1 + 40);
    v14 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

    objc_destroyWeak(v15);
  }

}

void __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  PKPaymentVerificationMethodsViewController *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BYTE *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  id WeakRetained;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  uint64_t v31;
  int IsSetupAssistant;
  void *v33;
  PKPaymentVerificationMethodsViewController *v34;
  id *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  PKPaymentVerificationMethodsViewController *v42;
  id *v43;
  uint64_t v44;
  PKPaymentVerificationMethodsViewController *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  id v49;
  PKPaymentSetupVerificationCompletionViewController *v50;
  id *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  uint8_t buf[4];
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(id **)(a1 + 32);
  if (v2 == 1)
  {
    objc_msgSend(v3[155], "verificationRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "verificationStatus");
    if (v5 <= 2)
    {
      if (v5 == 1)
      {
        PKLogFacilityTypeGetObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "Presenting verification fields", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "hideActivitySpinner");
        objc_msgSend(*(id *)(a1 + 40), "setHidesBackButton:animated:", 0, 0);
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1256));

        if (!WeakRetained)
        {
          v40 = objc_alloc(MEMORY[0x1E0D67300]);
          objc_msgSend(v4, "requiredVerificationFields");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (PKPaymentVerificationMethodsViewController *)objc_msgSend(v40, "initWithPaymentSetupFields:", v41);

          v42 = [PKPaymentVerificationMethodsViewController alloc];
          v44 = *(_QWORD *)(a1 + 32);
          v43 = (id *)(a1 + 32);
          v45 = -[PKPaymentVerificationMethodsViewController initWithVerificationController:fieldsModel:](v42, "initWithVerificationController:fieldsModel:", *(_QWORD *)(v44 + 1240), v8);
          -[PKPaymentVerificationMethodsViewController setProvisioningController:](v45, "setProvisioningController:", *((_QWORD *)*v43 + 156));
          objc_msgSend(*v43, "navigationController");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "pushViewController:animated:", v45, 1);

          goto LABEL_51;
        }
        goto LABEL_8;
      }
      if (v5 == 2)
      {
        PKLogFacilityTypeGetObject();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Presenting verification OTP methods", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "hideActivitySpinner");
        objc_msgSend(*(id *)(a1 + 32), "setHidesBackButton:animated:", 0, 0);
        v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1256));

        if (!v7)
        {
          v34 = [PKPaymentVerificationMethodsViewController alloc];
          v36 = *(_QWORD *)(a1 + 32);
          v35 = (id *)(a1 + 32);
          v37 = *(_QWORD *)(v36 + 1240);
          objc_msgSend(v4, "allChannels");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[PKPaymentVerificationMethodsViewController initWithVerificationController:verificationChannels:](v34, "initWithVerificationController:verificationChannels:", v37, v38);

          -[PKPaymentVerificationMethodsViewController setProvisioningController:](v8, "setProvisioningController:", *((_QWORD *)*v35 + 156));
          objc_msgSend(*v35, "navigationController");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "pushViewController:animated:", v8, 1);

          goto LABEL_51;
        }
LABEL_8:
        v8 = (PKPaymentVerificationMethodsViewController *)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1256));
        -[PKPaymentVerificationMethodsViewController showVerificationMethodsForVerificationMethodsViewController:](v8, "showVerificationMethodsForVerificationMethodsViewController:", *(_QWORD *)(a1 + 32));
LABEL_51:

        goto LABEL_53;
      }
LABEL_25:
      PKLogFacilityTypeGetObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 56), "description");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v59 = v22;
        _os_log_impl(&dword_19D178000, v21, OS_LOG_TYPE_DEFAULT, "Showing error: %@", buf, 0xCu);

      }
      v24 = *(void **)(a1 + 32);
      v23 = a1 + 32;
      objc_msgSend(v24, "_requestErrorAlertController:", *(_QWORD *)(v23 + 24));
      v8 = (PKPaymentVerificationMethodsViewController *)objc_claimAutoreleasedReturnValue();
      v25 = *(void **)v23;
      if (v8)
        objc_msgSend(v25, "presentViewController:animated:completion:", v8, 1, 0);
      else
        objc_msgSend(v25, "_handleVerificationFinished");
      goto LABEL_51;
    }
    if (v5 == 3)
      goto LABEL_30;
    if (v5 != 4000)
      goto LABEL_25;
    v14 = *(_BYTE **)(a1 + 32);
    if (v14[1232])
    {
      PKLogFacilityTypeGetObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Attempting to perform external validation without checking if it can be performed inline", buf, 2u);
      }

      v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1256));
      v17 = *(_QWORD *)(a1 + 32);
      if (v16)
      {
        v18 = objc_loadWeakRetained((id *)(v17 + 1256));
        objc_msgSend(v18, "showExternalVerificationForVerificationMethodsViewController:", *(_QWORD *)(a1 + 32));

      }
      else
      {
        objc_msgSend(*(id *)(v17 + 1240), "continueVerification");
      }
      goto LABEL_53;
    }
    objc_msgSend(v14, "context");
    if ((PKPaymentSetupContextIsSetupAssistant() & 1) != 0)
    {
LABEL_30:
      objc_msgSend(*(id *)(a1 + 32), "hideActivitySpinner");
      objc_msgSend(*(id *)(a1 + 32), "context");
      if ((PKPaymentSetupContextIsiOSSetupAssistant() & 1) == 0)
      {
        objc_msgSend(v4, "channel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "type");

        if (v27 == 2)
        {
          objc_msgSend(*(id *)(a1 + 48), "channel");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          PKLogFacilityTypeGetObject();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
          if (v28)
          {
            if (v30)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D178000, v29, OS_LOG_TYPE_DEFAULT, "Presenting verification OTP method entry", buf, 2u);
            }
            v31 = 0;
          }
          else
          {
            if (v30)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D178000, v29, OS_LOG_TYPE_DEFAULT, "Presenting verification completion", buf, 2u);
            }
            v31 = 1;
          }

          objc_msgSend(*(id *)(a1 + 32), "setHidesBackButton:animated:", 0, 0);
          v49 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1256));

          if (v49)
          {
            v8 = (PKPaymentVerificationMethodsViewController *)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1256));
            -[PKPaymentVerificationMethodsViewController showVerificationCompletionForVerificationMethodsViewController:](v8, "showVerificationCompletionForVerificationMethodsViewController:", *(_QWORD *)(a1 + 32));
          }
          else
          {
            v50 = [PKPaymentSetupVerificationCompletionViewController alloc];
            v52 = *(void **)(a1 + 32);
            v51 = (id *)(a1 + 32);
            objc_msgSend(v52, "verificationController");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = -[PKPaymentSetupVerificationCompletionViewController initWithVerificationController:mode:offerOtherMethods:](v50, "initWithVerificationController:mode:offerOtherMethods:", v53, v31, 0);

            -[PKPaymentVerificationMethodsViewController setProvisioningController:](v8, "setProvisioningController:", *((_QWORD *)*v51 + 156));
            objc_msgSend(*v51, "setupDelegate");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKPaymentSetupFieldsViewController setSetupDelegate:](v8, "setSetupDelegate:", v54);

            objc_msgSend(*v51, "navigationController");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "pushViewController:animated:", v8, 1);

          }
          goto LABEL_51;
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "context");
      IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
      v33 = *(void **)(a1 + 32);
      if (IsSetupAssistant)
        objc_msgSend(v33, "_showSetupAssistantVerifyLaterAlertAndTerminate");
      else
        objc_msgSend(v33, "_handleVerificationFinished");
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v47, OS_LOG_TYPE_DEFAULT, "Attempting to perform external validation", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "verificationController");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke_51;
      v56[3] = &unk_1E3E61C58;
      objc_copyWeak(&v57, (id *)(a1 + 64));
      objc_msgSend(v48, "canPerformVerificationInline:", v56);

      objc_destroyWeak(&v57);
    }
  }
  else
  {
    objc_msgSend(v3, "hideActivitySpinner");
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 56), "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v59 = v10;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Showing error: %@", buf, 0xCu);

    }
    v12 = *(void **)(a1 + 32);
    v11 = a1 + 32;
    objc_msgSend(v12, "_requestErrorAlertController:", *(_QWORD *)(v11 + 24));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)v11;
    if (v4)
    {
      objc_msgSend(v13, "presentViewController:animated:completion:", v4, 1, 0);
    }
    else
    {
      objc_msgSend(v13, "_handleVerificationFinished");
      v4 = 0;
    }
  }
LABEL_53:

}

void __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke_51(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke_2_52;
  v3[3] = &unk_1E3E61C08;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __69__PKPaymentVerificationMethodsViewController_handleNextButtonTapped___block_invoke_2_52(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "hideActivitySpinner");
    if (*(_BYTE *)(a1 + 40))
    {
      v3 = objc_loadWeakRetained(v5 + 157);

      if (v3)
      {
        v4 = objc_loadWeakRetained(v5 + 157);
        objc_msgSend(v4, "showExternalVerificationForVerificationMethodsViewController:", v5);

      }
      else
      {
        objc_msgSend(v5[155], "continueVerification");
      }
    }
    else
    {
      objc_msgSend(v5, "context");
      if (PKPaymentSetupContextIsSetupAssistant())
        objc_msgSend(v5, "_showSetupAssistantVerifyLaterAlertAndTerminate");
      else
        objc_msgSend(v5, "_handleVerificationFinished");
    }
    WeakRetained = v5;
  }

}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  void *v2;
  BOOL v3;

  -[PKPaymentVerificationController verificationRecord](self->_verificationController, "verificationRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verificationStatus") == 1;

  return v3;
}

- (id)_newVerificationRequest
{
  int64_t verificationStatus;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  verificationStatus = self->_verificationStatus;
  if ((unint64_t)(verificationStatus - 2) < 2 || verificationStatus == 4000)
    return -[PKPaymentSetupVerificationMethodTableController newVerificationRequest](self->_methodTableController, "newVerificationRequest");
  v5 = objc_alloc_init(MEMORY[0x1E0D673C0]);
  -[PKPaymentVerificationController pass](self->_verificationController, "pass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPass:", v6);

  -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D6AF90];
  objc_msgSend(v7, "submissionValuesForDestination:", *MEMORY[0x1E0D6AF90]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setOverlayParameters:", v9);
  -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "secureSubmissionValuesForDestination:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSecureOverlayParameters:", v11);
  return v5;
}

- (void)_showSetupAssistantVerifyLaterAlertAndTerminate
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int IsBridge;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  NSString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Showing setup assistant OTP enter later alert", buf, 2u);
  }

  -[PKPaymentVerificationController verificationRecord](self->_verificationController, "verificationRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "channel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  -[PKPaymentSetupTableViewController context](self, "context");
  IsBridge = PKPaymentSetupContextIsBridge();
  switch(v6)
  {
    case 8:
      -[PKPaymentVerificationController pass](self->_verificationController, "pass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "organizationName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("SETUP_ASSISTANT_URL_VERIFICATION_ALERT_TITLE"), CFSTR("%@"), v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("SETUP_ASSISTANT_URL_VERIFICATION_ALERT_MESSAGE");
      goto LABEL_9;
    case 5:
      -[PKPaymentVerificationController pass](self->_verificationController, "pass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "organizationName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("SETUP_ASSISTANT_BANK_APP_VERIFICATION_ALERT_TITLE"), CFSTR("%@"), v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("SETUP_ASSISTANT_BANK_APP_VERIFICATION_ALERT_MESSAGE");
      goto LABEL_9;
    case 4:
      -[PKPaymentVerificationController pass](self->_verificationController, "pass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "organizationName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("SETUP_ASSISTANT_OUTBOUND_CALL_VERIFICATION_ALERT_TITLE"), CFSTR("%@"), v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("SETUP_ASSISTANT_OUTBOUND_CALL_VERIFICATION_ALERT_MESSAGE");
LABEL_9:

      PKDeviceSpecificLocalizedStringKeyForKey(v11, IsBridge);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(v12);
      v13 = objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
  }
  v10 = 0;
  v13 = 0;
LABEL_11:
  if (!(v10 | v13))
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "no title or message to show cannot create alert", buf, 2u);
    }

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v10, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__PKPaymentVerificationMethodsViewController__showSetupAssistantVerifyLaterAlertAndTerminate__block_invoke;
  v18[3] = &unk_1E3E61D68;
  v18[4] = self;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v17);

  if (!v14)
  {
LABEL_17:
    -[PKPaymentVerificationMethodsViewController _handleVerificationFinished](self, "_handleVerificationFinished");
    goto LABEL_18;
  }
  -[PKPaymentVerificationMethodsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

LABEL_18:
}

uint64_t __93__PKPaymentVerificationMethodsViewController__showSetupAssistantVerifyLaterAlertAndTerminate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleVerificationFinished");
}

- (id)_requestErrorAlertController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  PKLocalizedPaymentString(CFSTR("ACTIVATION_NOT_AVAILABLE_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("ACTIVATION_NOT_AVAILABLE_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (v7)
  {
    PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"));
    v8 = objc_claimAutoreleasedReturnValue();

    PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v14 = v5;
    v4 = (void *)v8;
    v5 = (void *)v9;
    goto LABEL_11;
  }
  objc_msgSend(v3, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D6BCB8]);

  if (v11)
  {
    v12 = objc_msgSend(v3, "code");
    if ((unint64_t)(v12 - 2) >= 4)
    {
      if (v12 == 1)
      {
        v16 = 0;
        goto LABEL_13;
      }
      if (v12)
        goto LABEL_12;
    }
    objc_msgSend(v3, "localizedFailureReason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_12;
LABEL_9:
    objc_msgSend(v3, "localizedFailureReason");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "localizedRecoverySuggestion");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v3, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D6B0B8]))
  {
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v3, "localizedFailureReason");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    goto LABEL_9;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v19);

LABEL_13:
  return v16;
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PKPaymentVerificationMethodsViewController view](self, "view", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v4 ^ 1);

  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setButtonsEnabled:", v4 ^ 1);
  objc_msgSend(v8, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowSpinner:", v4);

}

- (PKPaymentVerificationController)verificationController
{
  return self->_verificationController;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningController, a3);
}

- (BOOL)alwaysPerformExternalVerificationInline
{
  return self->_alwaysPerformExternalVerificationInline;
}

- (void)setAlwaysPerformExternalVerificationInline:(BOOL)a3
{
  self->_alwaysPerformExternalVerificationInline = a3;
}

- (PKPaymentVerificationMethodsViewControllerFlowItemDelegate)flowItemDelegate
{
  return (PKPaymentVerificationMethodsViewControllerFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_flowItemDelegate);
}

- (void)setFlowItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowItemDelegate, a3);
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_verificationController, 0);
  objc_storeStrong((id *)&self->_methodTableController, 0);
}

@end
