@implementation PKPeerPaymentIdentityVerificationPickerViewController

- (PKPeerPaymentIdentityVerificationPickerViewController)initWithController:(id)a3 pickerField:(id)a4 footerText:(id)a5
{
  return -[PKPeerPaymentIdentityVerificationPickerViewController initWithController:setupDelegate:pickerField:footerText:](self, "initWithController:setupDelegate:pickerField:footerText:", a3, 0, a4, a5);
}

- (PKPeerPaymentIdentityVerificationPickerViewController)initWithController:(id)a3 setupDelegate:(id)a4 pickerField:(id)a5 footerText:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKPeerPaymentIdentityVerificationPickerViewController *v15;
  PKPeerPaymentIdentityVerificationPickerViewController *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)PKPeerPaymentIdentityVerificationPickerViewController;
  v15 = -[PKPaymentSetupTableViewController initWithContext:](&v25, sel_initWithContext_, objc_msgSend(v11, "context"));
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_controller, a3);
    objc_storeStrong((id *)&v16->_pickerField, a5);
    objc_storeStrong((id *)&v16->_footerText, a6);
    objc_storeWeak((id *)&v16->_delegate, v12);
    v16->_navigationEnabled = 1;
    v16->_rightBarButtonItemsEnabled = 0;
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v16, sel__handleCancelButtonTapped_);
    v18 = (void *)v17;
    if (v17)
    {
      v27[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    objc_storeStrong((id *)&v16->_leftBarButtonItems, v19);
    if (v18)

    v20 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithTitle:style:target:action:", v21, 2, v16, sel__handleNextButtonTapped_);

    objc_msgSend(v22, "setEnabled:", v16->_rightBarButtonItemsEnabled);
    if (v22)
    {
      v26 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    objc_storeStrong((id *)&v16->_rightBarButtonItems, v23);
    if (v22)

    -[PKPeerPaymentIdentityVerificationPickerViewController _updateNavigationItemAnimated:](v16, "_updateNavigationItemAnimated:", 0);
  }

  return v16;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentIdentityVerificationPickerViewController;
  -[PKPeerPaymentIdentityVerificationPickerViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPeerPaymentIdentityVerificationPickerViewControllerCellIdentifier"));

  -[PKPeerPaymentIdentityVerificationPickerViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTableHeaderView:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentIdentityVerificationPickerViewController;
  -[PKPaymentSetupTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKPeerPaymentIdentityVerificationPickerViewController _setRightBarButtonItemsEnabled:](self, "_setRightBarButtonItemsEnabled:", -[PKPeerPaymentIdentityVerificationPickerViewController isComplete](self, "isComplete"));
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentIdentityVerificationPickerViewController;
  -[PKPeerPaymentIdentityVerificationPickerViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[PKPeerPaymentIdentityVerificationPickerViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentIdentityVerificationPickerViewController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "_tableHeaderHeightDidChangeToHeight:", CGRectGetHeight(v7));

}

- (BOOL)isComplete
{
  void *v2;
  BOOL v3;

  -[PKPaymentSetupTableViewController selectedIndexPath](self, "selectedIndexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PKPaymentSetupFieldPicker pickerItems](self->_pickerField, "pickerItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKPeerPaymentIdentityVerificationPickerViewControllerCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldPicker pickerItems](self->_pickerField, "pickerItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedDisplayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v11);

  -[PKPaymentSetupTableViewController selectedIndexPath](self, "selectedIndexPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v12, "isEqual:", v6);

  if ((_DWORD)v10)
    v13 = 3;
  else
    v13 = 0;
  objc_msgSend(v7, "setAccessoryType:", v13);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v6 = a4;
  v7 = a3;
  -[PKPaymentSetupTableViewController selectedIndexPath](self, "selectedIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentIdentityVerificationPickerViewController;
  -[PKPaymentSetupTableViewController tableView:didSelectRowAtIndexPath:](&v15, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

  objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessoryType:", 0);
  -[PKPaymentSetupTableViewController selectedIndexPath](self, "selectedIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAccessoryType:", 3);
  -[PKPaymentSetupFieldPicker pickerItems](self->_pickerField, "pickerItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupTableViewController selectedIndexPath](self, "selectedIndexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v13, "row"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentSetupFieldPicker setCurrentValue:](self->_pickerField, "setCurrentValue:", v14);
  -[PKPeerPaymentIdentityVerificationPickerViewController _setRightBarButtonItemsEnabled:](self, "_setRightBarButtonItemsEnabled:", -[PKPeerPaymentIdentityVerificationPickerViewController isComplete](self, "isComplete"));

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return self->_footerText;
}

- (void)showActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4
{
  -[PKPeerPaymentIdentityVerificationPickerViewController _setTableViewHeaderActivitySpinnerAnimated:title:subtitle:](self, "_setTableViewHeaderActivitySpinnerAnimated:title:subtitle:", 1, a3, a4);
}

- (void)hideActivitySpinner
{
  -[PKPeerPaymentIdentityVerificationPickerViewController hideActivitySpinnerWithTitle:subtitle:](self, "hideActivitySpinnerWithTitle:subtitle:", 0, self->_headerSubtitle);
}

- (void)hideActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4
{
  -[PKPeerPaymentIdentityVerificationPickerViewController _setTableViewHeaderActivitySpinnerAnimated:title:subtitle:](self, "_setTableViewHeaderActivitySpinnerAnimated:title:subtitle:", 0, a3, a4);
}

- (void)_setTableViewHeaderActivitySpinnerAnimated:(BOOL)a3 title:(id)a4 subtitle:(id)a5
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v8 = !a3;
  v9 = a5;
  v10 = a4;
  -[PKPeerPaymentIdentityVerificationPickerViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInteractionEnabled:", v8);

  -[PKPeerPaymentIdentityVerificationPickerViewController _setNavigationBarEnabled:](self, "_setNavigationBarEnabled:", v8);
  -[PKPeerPaymentIdentityVerificationPickerViewController headerView](self, "headerView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activityIndicator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
  {
    objc_msgSend(v12, "stopAnimating");
  }
  else if ((objc_msgSend(v12, "isAnimating") & 1) == 0)
  {
    objc_msgSend(v13, "startAnimating");
  }
  objc_msgSend(v14, "setNeedsLayout");
  -[PKPeerPaymentIdentityVerificationPickerViewController setHeaderViewTitle:subtitle:](self, "setHeaderViewTitle:subtitle:", v10, v9);
  -[PKPeerPaymentIdentityVerificationPickerViewController _setIdleTimerDisabled:title:subtitle:](self, "_setIdleTimerDisabled:title:subtitle:", v6, v10, v9);

}

- (id)headerView
{
  PKTableHeaderView *headerView;
  PKTableHeaderView *v4;
  PKTableHeaderView *v5;
  PKTableHeaderView *v6;
  void *v7;
  uint64_t v8;
  PKTableHeaderView *v9;
  uint64_t IsSetupAssistant;
  void *v11;
  void *v12;
  PKTableHeaderView *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v20;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = [PKTableHeaderView alloc];
    v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_headerView;
    self->_headerView = v5;

    -[PKPeerPaymentIdentityVerificationPickerViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    v9 = self->_headerView;
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[PKPaymentSetupTableViewController context](self, "context");
      IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
    }
    else
    {
      IsSetupAssistant = 0;
    }
    -[PKTableHeaderView setStyle:](v9, "setStyle:", IsSetupAssistant);
    -[PKTableHeaderView titleLabel](self->_headerView, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", self->_headerTitle);

    -[PKTableHeaderView subtitleLabel](self->_headerView, "subtitleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", self->_headerSubtitle);

    v13 = self->_headerView;
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    -[PKTableHeaderView sizeThatFits:](v13, "sizeThatFits:", CGRectGetWidth(v20), 3.40282347e38);
    v16 = v15;
    v18 = v17;

    -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v16, v18);
    headerView = self->_headerView;
  }
  return headerView;
}

- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4
{
  NSString *v6;
  void *v7;
  NSString *headerTitle;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a4;
  v6 = (NSString *)a3;
  -[PKPeerPaymentIdentityVerificationPickerViewController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  headerTitle = v6;
  if (!v6)
    headerTitle = self->_headerTitle;
  v9 = headerTitle;

  objc_msgSend(v7, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  if (v18)
  {
    objc_msgSend(v7, "subtitleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v18);

  }
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v14 = v13;
  objc_msgSend(v12, "bounds");
  objc_msgSend(v7, "sizeThatFits:", v15, 1.79769313e308);
  if (v16 > v14)
  {
    v17 = v16;
    objc_msgSend(v12, "_rectForTableHeaderView");
    objc_msgSend(v7, "setFrame:");
    objc_msgSend(v12, "_tableHeaderHeightDidChangeToHeight:", v17);
  }
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  -[PKPeerPaymentIdentityVerificationPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, a5, 0);
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  -[PKPeerPaymentIdentityVerificationPickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  PKPeerPaymentAccountResolutionController *v18;
  NSObject *v19;
  _QWORD v20[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  switch(self->_identityVerificaionError)
  {
    case 2uLL:
      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __90__PKPeerPaymentIdentityVerificationPickerViewController_explanationViewDidSelectContinue___block_invoke_37;
      v20[3] = &unk_1E3E612E8;
      v20[4] = self;
      v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, v20, 0);
      -[PKPeerPaymentIdentityVerificationPickerViewController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentViewController:animated:completion:", v9, 1, 0);

      goto LABEL_8;
    case 3uLL:
      objc_msgSend(v4, "dockView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setButtonsEnabled:", 0);

      objc_msgSend(v5, "dockView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "primaryButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShowSpinner:", 1);

      objc_msgSend(v5, "dockView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "footerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setButtonsEnabled:", 0);

      -[PKPeerPaymentIdentityVerificationPickerViewController _processNextViewController](self, "_processNextViewController");
      break;
    case 5uLL:
      -[PKPeerPaymentIdentityVerificationController webService](self->_controller, "webService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "peerPaymentService");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "account");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc_init(MEMORY[0x1E0D66F18]);
      v18 = -[PKPeerPaymentAccountResolutionController initWithAccount:webService:context:delegate:passLibraryDataProvider:]([PKPeerPaymentAccountResolutionController alloc], "initWithAccount:webService:context:delegate:passLibraryDataProvider:", v9, v8, -[PKPaymentSetupTableViewController context](self, "context"), self, v17);
      PKLogFacilityTypeGetObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "Presenting contact apple support alert...", buf, 2u);
      }

      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68540], 0);
      -[PKPeerPaymentAccountResolutionController presentFlowForAccountResolution:configuration:completion:](v18, "presentFlowForAccountResolution:configuration:completion:", 3, 0, &__block_literal_global_2);

LABEL_8:
      break;
    default:
      -[PKPeerPaymentIdentityVerificationPickerViewController _terminateFlow](self, "_terminateFlow");
      break;
  }

}

void __90__PKPeerPaymentIdentityVerificationPickerViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (a2)
      v4 = CFSTR("YES");
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Presented contact apple support alert with success %@", (uint8_t *)&v5, 0xCu);
  }

}

uint64_t __90__PKPeerPaymentIdentityVerificationPickerViewController_explanationViewDidSelectContinue___block_invoke_37(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCancelButtonTapped:", 0);
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  -[PKPeerPaymentIdentityVerificationPickerViewController _handleCancelButtonTapped:](self, "_handleCancelButtonTapped:", 0);
}

- (void)_processNextViewController
{
  PKPeerPaymentIdentityVerificationController *controller;
  _QWORD v4[5];
  id v5;
  id location;

  -[PKPeerPaymentIdentityVerificationPickerViewController _showNavigationBarSpinner:](self, "_showNavigationBarSpinner:", 1);
  objc_initWeak(&location, self);
  controller = self->_controller;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke;
  v4[3] = &unk_1E3E61E48;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  -[PKPeerPaymentIdentityVerificationController nextViewControllerWithCompletion:](controller, "nextViewControllerWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke_2;
    v13[3] = &unk_1E3E61E20;
    v13[4] = *(_QWORD *)(a1 + 32);
    v18 = a5;
    v14 = v9;
    v15 = WeakRetained;
    v16 = v11;
    v17 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v13);

  }
}

void __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  dispatch_time_t v18;
  id v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[5];

  objc_msgSend(*(id *)(a1 + 32), "_showNavigationBarSpinner:", 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1120) = *(_QWORD *)(a1 + 72);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v2;
    v3 = *(_QWORD *)(a1 + 40);
LABEL_3:
    objc_msgSend(v2, "pushViewController:animated:", v3, 1);

    return;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke_3;
    v22[3] = &unk_1E3E612E8;
    v22[4] = *(_QWORD *)(a1 + 32);
    v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, v22, 0);
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

LABEL_6:
    return;
  }
  v7 = *(void **)(a1 + 64);
  if (v7)
  {
    objc_msgSend(v7, "explanationView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v2;
    v3 = *(_QWORD *)(a1 + 64);
    goto LABEL_3;
  }
  v9 = *(_QWORD **)(a1 + 32);
  if (v9[140] == 1)
  {
    objc_msgSend(v9, "headerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "checkmarkLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRevealed:animated:", 1, 0);

    v11 = *(void **)(a1 + 32);
    PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_VERIFIED"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHeaderViewTitle:subtitle:", v12, &stru_1E3E7D690);

    objc_msgSend(v4, "setNeedsLayout");
    objc_msgSend(*(id *)(a1 + 32), "_setNavigationBarEnabled:", 0);
    objc_msgSend(*(id *)(a1 + 32), "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUserInteractionEnabled:", 0);

    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 1136);
    *(_QWORD *)(v14 + 1136) = 0;

    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 1128);
    *(_QWORD *)(v16 + 1128) = 0;

    v18 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke_4;
    block[3] = &unk_1E3E612E8;
    v21 = *(id *)(a1 + 48);
    dispatch_after(v18, MEMORY[0x1E0C80D38], block);

    goto LABEL_6;
  }
}

uint64_t __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCancelButtonTapped:", 0);
}

uint64_t __83__PKPeerPaymentIdentityVerificationPickerViewController__processNextViewController__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateFlow");
}

- (void)_handleNextButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  _QWORD block[5];

  if (self->_rightBarButtonItemsEnabled)
  {
    -[PKPaymentSetupTableViewController tableView](self, "tableView", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeAreaInsets");
    objc_msgSend(v4, "setContentOffset:animated:", 1, 0.0, -v6);

    -[PKPeerPaymentIdentityVerificationPickerViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInteractionEnabled:", 0);

    v9 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__PKPeerPaymentIdentityVerificationPickerViewController__handleNextButtonTapped___block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_after(v9, MEMORY[0x1E0C80D38], block);
  }
}

void __81__PKPeerPaymentIdentityVerificationPickerViewController__handleNextButtonTapped___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_processNextViewController");
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

}

- (void)_handleError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PKPeerPaymentIdentityVerificationPickerViewController__handleError___block_invoke;
  v7[3] = &unk_1E3E612E8;
  v7[4] = self;
  v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, v7, 0);
  -[PKPeerPaymentIdentityVerificationPickerViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

}

uint64_t __70__PKPeerPaymentIdentityVerificationPickerViewController__handleError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateFlow");
}

- (void)_terminateFlow
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKPeerPaymentIdentityVerificationPickerViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_handleCancelButtonTapped:(id)a3
{
  id WeakRetained;

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68538], 0, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "viewControllerDidCancelSetupFlow:", self);
  else
    -[PKPeerPaymentIdentityVerificationPickerViewController _terminateFlow](self, "_terminateFlow");

}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_navigationEnabled != a3)
  {
    v3 = a3;
    self->_navigationEnabled = a3;
    -[PKPeerPaymentIdentityVerificationPickerViewController navigationController](self, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", v3);

    objc_msgSend(v7, "interactivePopGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v3);

    -[PKPeerPaymentIdentityVerificationPickerViewController _updateNavigationItemAnimated:](self, "_updateNavigationItemAnimated:", 1);
  }
}

- (void)_setRightBarButtonItemsEnabled:(BOOL)a3
{
  if (self->_rightBarButtonItemsEnabled != a3)
  {
    self->_rightBarButtonItemsEnabled = a3;
    -[PKPeerPaymentIdentityVerificationPickerViewController _updateRightBarButtonState](self, "_updateRightBarButtonState");
  }
}

- (void)_updateNavigationItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL4 navigationEnabled;
  NSArray *leftBarButtonItems;
  NSArray *v8;
  void *v9;
  char v10;
  NSArray *rightBarButtonItems;
  NSArray *v12;
  void *v13;
  char v14;
  id v15;

  v3 = a3;
  -[PKPeerPaymentIdentityVerificationPickerViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  navigationEnabled = self->_navigationEnabled;
  v15 = v5;
  if (((navigationEnabled ^ objc_msgSend(v5, "hidesBackButton")) & 1) == 0)
    objc_msgSend(v15, "setHidesBackButton:animated:", !self->_navigationEnabled, v3);
  if (self->_navigationEnabled)
    leftBarButtonItems = self->_leftBarButtonItems;
  else
    leftBarButtonItems = 0;
  v8 = leftBarButtonItems;
  objc_msgSend(v15, "leftBarButtonItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = PKEqualObjects();

  if ((v10 & 1) == 0)
    objc_msgSend(v15, "setLeftBarButtonItems:animated:", v8, v3);
  if (self->_navigationEnabled)
    rightBarButtonItems = self->_rightBarButtonItems;
  else
    rightBarButtonItems = 0;
  v12 = rightBarButtonItems;

  objc_msgSend(v15, "rightBarButtonItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = PKEqualObjects();

  if ((v14 & 1) == 0)
    objc_msgSend(v15, "setRightBarButtonItems:animated:", v12, v3);
  -[PKPeerPaymentIdentityVerificationPickerViewController _updateRightBarButtonState](self, "_updateRightBarButtonState");

}

- (void)_updateRightBarButtonState
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_rightBarButtonItems;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setEnabled:", self->_rightBarButtonItemsEnabled, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_setIdleTimerDisabled:(BOOL)a3 title:(id)a4 subtitle:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v6 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("enabled");
    v12 = 138413058;
    if (v6)
      v10 = CFSTR("disabled");
    v13 = v10;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = CFSTR("PeerPaymentIdentityVerification");
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Payment Setup has %@ the Idle Timer. (For: %@ - %@) - %@.", (uint8_t *)&v12, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setIdleTimerDisabled:forReason:", v6, CFSTR("PeerPaymentIdentityVerification"));

}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitle, a3);
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (void)setHeaderSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerSubtitle, a3);
}

- (PKPaymentSetupViewControllerDelegate)delegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_pickerField, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
