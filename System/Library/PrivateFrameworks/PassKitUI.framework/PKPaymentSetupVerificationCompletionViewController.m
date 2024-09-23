@implementation PKPaymentSetupVerificationCompletionViewController

- (PKPaymentSetupVerificationCompletionViewController)initWithVerificationController:(id)a3 mode:(int64_t)a4 offerOtherMethods:(BOOL)a5
{
  id v9;
  PKPaymentSetupVerificationCompletionViewController *v10;
  PKPaymentSetupVerificationCompletionViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  PKPaymentVerificationObserver *verificationObserver;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKPaymentSetupVerificationCompletionViewController;
  v10 = -[PKPaymentSetupTableViewController initWithContext:](&v30, sel_initWithContext_, objc_msgSend(v9, "context"));
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_verificationController, a3);
    v11->_mode = a4;
    v11->_offerOtherMethods = a5;
    v11->_verificationCodeAccepted = v11->_mode == 1;
    -[PKPaymentSetupVerificationCompletionViewController navigationItem](v11, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "webService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "verificationRequestRecordForUniqueID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "uniqueID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("UI-%@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_alloc(MEMORY[0x1E0D673B0]);
    objc_msgSend(v17, "channel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithPaymentPass:verificationChannel:identifier:", v14, v22, v20);
    verificationObserver = v11->_verificationObserver;
    v11->_verificationObserver = (PKPaymentVerificationObserver *)v23;

    -[PKPaymentVerificationObserver setDelegate:](v11->_verificationObserver, "setDelegate:", v11);
    v25 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithTitle:style:target:action:", v26, 2, v11, sel_next_);

    objc_msgSend(v27, "setEnabled:", 0);
    objc_msgSend(v12, "setRightBarButtonItem:", v27);
    v11->_verificationAlreadyHandled = 0;
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v11, sel__handlePassVerifiedNotification_, *MEMORY[0x1E0D6B0B0], 0);

    -[PKPaymentSetupVerificationCompletionViewController setModalInPresentation:](v11, "setModalInPresentation:", 1);
  }

  return v11;
}

- (void)_handlePassVerifiedNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__PKPaymentSetupVerificationCompletionViewController__handlePassVerifiedNotification___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __86__PKPaymentSetupVerificationCompletionViewController__handlePassVerifiedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_stopVerificationObserver");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1147) = 1;
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("uniqueID"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "_handleNextStep");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[PKPaymentSetupVerificationCompletionViewController _stopVerificationObserver](self, "_stopVerificationObserver");
  +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupVerificationCompletionViewController;
  -[PKPaymentSetupTableViewController dealloc](&v6, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  PKTableHeaderView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PKTableHeaderView *v9;
  PKTableHeaderView *tableHeader;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PKPaymentSetupFooterView *v20;
  PKPaymentSetupFooterView *tableFooter;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 offerOtherMethods;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)PKPaymentSetupVerificationCompletionViewController;
  -[PKPaymentSetupTableViewController loadView](&v33, sel_loadView);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRowHeight:", 60.0);
  v4 = [PKTableHeaderView alloc];
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  tableHeader = self->_tableHeader;
  self->_tableHeader = v9;

  -[PKPaymentVerificationController passSnapshot](self->_verificationController, "passSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[PKTableHeaderView setPassSnapshotUsingDefaultSize:animated:needsCorners:](self->_tableHeader, "setPassSnapshotUsingDefaultSize:animated:needsCorners:", v11, 0, 0);
  -[PKPaymentVerificationController pass](self->_verificationController, "pass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "supportsBarcodePayment");

  if ((v13 & 1) != 0)
    PKLocalizedAquamanString(CFSTR("ACCOUNT_VERIFICATION_TITLE"));
  else
    PKLocalizedPaymentString(CFSTR("CARD_VERIFICATION_TITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableHeaderView titleLabel](self->_tableHeader, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  -[PKTableHeaderView subtitleLabel](self->_tableHeader, "subtitleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentVerificationController pass](self->_verificationController, "pass");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "organizationName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("ENTER_CODE_TEXT"), CFSTR("%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v19);

  objc_msgSend(v3, "setTableHeaderView:", self->_tableHeader);
  v20 = -[PKPaymentSetupFooterView initWithFrame:context:]([PKPaymentSetupFooterView alloc], "initWithFrame:context:", -[PKPaymentSetupTableViewController context](self, "context"), v5, v6, v7, v8);
  tableFooter = self->_tableFooter;
  self->_tableFooter = v20;

  -[PKPaymentSetupFooterView setSetupLaterButton:](self->_tableFooter, "setSetupLaterButton:", 0);
  -[PKPaymentSetupFooterView skipCardButton](self->_tableFooter, "skipCardButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("ACTIVATION_VERIFY_LATER"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTitle:forState:", v23, 0);

  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel_handleVerifyLater_, 0x2000);
  -[PKPaymentVerificationController alternateMethodButtonTitle](self->_verificationController, "alternateMethodButtonTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24 && (offerOtherMethods = self->_offerOtherMethods, v24, offerOtherMethods))
  {
    -[PKPaymentSetupFooterView manualEntryButton](self->_tableFooter, "manualEntryButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentVerificationController alternateMethodButtonTitle](self->_verificationController, "alternateMethodButtonTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTitle:forState:", v27, 0);

    objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel_selectOtherVerificationMethod, 64);
  }
  else
  {
    -[PKPaymentSetupFooterView setManualEntryButton:](self->_tableFooter, "setManualEntryButton:", 0);
  }
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTableFooterView:", self->_tableFooter);

  +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    self->_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)objc_msgSend(v29, "registerObserver:", self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", self, sel__applicationWillResignActive, *MEMORY[0x1E0DC4868], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActive, *MEMORY[0x1E0DC4750], 0);

  }
  -[PKPaymentSetupVerificationCompletionViewController _startVerificationObserver](self, "_startVerificationObserver");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PKTableHeaderView *tableHeader;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v21;
  PKPaymentSetupFooterView *tableFooter;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKPaymentSetupVerificationCompletionViewController;
  -[PKPaymentSetupTableViewController viewWillLayoutSubviews](&v23, sel_viewWillLayoutSubviews);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[PKTableHeaderView frame](self->_tableHeader, "frame");
  v7 = v6;
  v9 = v8;
  -[PKTableHeaderView sizeThatFits:](self->_tableHeader, "sizeThatFits:", v5, 1.79769313e308);
  if (v7 != v11 || v9 != v10)
  {
    tableHeader = self->_tableHeader;
    objc_msgSend(v3, "_rectForTableHeaderView");
    -[PKTableHeaderView setFrame:](tableHeader, "setFrame:");
    objc_msgSend(v3, "setTableHeaderView:", 0);
    objc_msgSend(v3, "setTableHeaderView:", self->_tableHeader);
  }
  -[PKPaymentSetupFooterView frame](self->_tableFooter, "frame");
  v15 = v14;
  v17 = v16;
  -[PKPaymentSetupFooterView sizeThatFits:](self->_tableFooter, "sizeThatFits:", v5, 1.79769313e308);
  if (v15 != v19 || v17 != v18)
  {
    v21 = v18;
    tableFooter = self->_tableFooter;
    objc_msgSend(v3, "_rectForTableFooterView");
    -[PKPaymentSetupFooterView setFrame:](tableFooter, "setFrame:");
    objc_msgSend(v3, "_tableFooterHeightDidChangeToHeight:", v21);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  PKActivityTableCell *verificationCodeCell;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupVerificationCompletionViewController;
  -[PKPaymentSetupTableViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (!self->_mode && self->_resignedResponder)
  {
    verificationCodeCell = self->_verificationCodeCell;
    if (verificationCodeCell)
    {
      -[PKActivityTableCell editableTextField](verificationCodeCell, "editableTextField");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isFirstResponder") & 1) == 0)
        objc_msgSend(v5, "becomeFirstResponder");

    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  int64_t mode;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupVerificationCompletionViewController;
  -[PKPaymentSetupTableViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
  mode = self->_mode;
  if (mode == 1)
  {
    -[PKPaymentSetupVerificationCompletionViewController _handleNextStep](self, "_handleNextStep");
  }
  else if (!mode)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PKPaymentSetupVerificationCompletionViewController_viewDidAppear___block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __68__PKPaymentSetupVerificationCompletionViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "editableTextField");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return !self->_verificationCodeAccepted;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return !self->_verificationCodeAccepted;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  PKActivityTableCell *verificationCodeCell;
  PKActivityTableCell *v6;
  PKActivityTableCell *v7;
  PKActivityTableCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  verificationCodeCell = self->_verificationCodeCell;
  if (!verificationCodeCell)
  {
    v6 = -[PKActivityTableCell initWithStyle:reuseIdentifier:]([PKActivityTableCell alloc], "initWithStyle:reuseIdentifier:", 1000, 0);
    v7 = self->_verificationCodeCell;
    self->_verificationCodeCell = v6;

    -[PKActivityTableCell setSelectionStyle:](self->_verificationCodeCell, "setSelectionStyle:", 0);
    v8 = self->_verificationCodeCell;
    PKProvisioningSecondaryBackgroundColor();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKActivityTableCell setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[PKActivityTableCell textLabel](self->_verificationCodeCell, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 18.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v11);

    objc_msgSend(v10, "setMinimumScaleFactor:", 0.7);
    objc_msgSend(v10, "setBaselineAdjustment:", 1);
    objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);
    PKLocalizedPaymentString(CFSTR("VERIFICATION_CODE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v12);

    -[PKActivityTableCell editableTextField](self->_verificationCodeCell, "editableTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("ENTER_CODE_BUTTON"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPlaceholder:", v14);

    objc_msgSend(v13, "setDelegate:", self);
    objc_msgSend(v13, "setKeyboardType:", 11);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v15);

    objc_msgSend(v13, "setAdjustsFontSizeToFitWidth:", 0);
    objc_msgSend(v13, "setClearButtonMode:", 1);
    objc_msgSend(v13, "setSecureTextEntry:", 1);
    objc_msgSend(v13, "setDisplaySecureTextUsingPlainText:", 1);
    objc_msgSend(v13, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_textFieldDidChange_, *MEMORY[0x1E0DC54D0], v13);

    verificationCodeCell = self->_verificationCodeCell;
  }
  return verificationCodeCell;
}

- (void)next:(id)a3
{
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 0);
  if (self->_verificationCodeAccepted)
  {
    -[PKPaymentSetupVerificationCompletionViewController _handleNextStep](self, "_handleNextStep");
  }
  else
  {
    -[PKPaymentSetupVerificationCompletionViewController _stopVerificationObserver](self, "_stopVerificationObserver");
    -[PKPaymentSetupVerificationCompletionViewController _submitVerificationCode](self, "_submitVerificationCode");
  }
}

- (void)handleVerifyLater:(id)a3
{
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:](self->_reporter, "reportButtonPressed:", 3);
  -[PKPaymentSetupVerificationCompletionViewController _handleNextStep](self, "_handleNextStep");
}

- (void)selectOtherVerificationMethod
{
  id WeakRetained;
  id v4;

  -[PKPaymentSetupVerificationCompletionViewController _stopVerificationObserver](self, "_stopVerificationObserver");
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
    objc_msgSend(v4, "showVerificationMethodsForVerificationCompletionViewController:", self);

  }
  else
  {
    -[PKPaymentVerificationController selectOtherVerificationMethod](self->_verificationController, "selectOtherVerificationMethod");
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v5, "convertRect:fromView:", v4);
  v7 = v6;
  v9 = v8;

  objc_msgSend(v5, "indexPathForRowAtPoint:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__PKPaymentSetupVerificationCompletionViewController_textFieldDidBeginEditing___block_invoke;
  v13[3] = &unk_1E3E61388;
  v14 = v5;
  v15 = v10;
  v11 = v10;
  v12 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

uint64_t __79__PKPaymentSetupVerificationCompletionViewController_textFieldDidBeginEditing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scrollToRowAtIndexPath:atScrollPosition:animated:", *(_QWORD *)(a1 + 40), 3, 1);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  -[PKActivityTableCell editableTextField](self->_verificationCodeCell, "editableTextField");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v9 && objc_msgSend(v10, "length"))
  {
    objc_msgSend(v9, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", location, length, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (unint64_t)objc_msgSend(v14, "length") < 9;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)textFieldDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKActivityTableCell editableTextField](self->_verificationCodeCell, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[PKPaymentSetupVerificationCompletionViewController navigationItem](self, "navigationItem");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rightBarButtonItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKActivityTableCell editableTextField](self->_verificationCodeCell, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", (unint64_t)objc_msgSend(v8, "length") > 3);

  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[PKActivityTableCell editableTextField](self->_verificationCodeCell, "editableTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7 >= 4)
      -[PKPaymentSetupVerificationCompletionViewController _submitVerificationCode](self, "_submitVerificationCode");
  }

  return 1;
}

- (void)verificationObserver:(id)a3 didObserveVerificationCode:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentSetupVerificationCompletionViewController_verificationObserver_didObserveVerificationCode___block_invoke;
  block[3] = &unk_1E3E61400;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __102__PKPaymentSetupVerificationCompletionViewController_verificationObserver_didObserveVerificationCode___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "OTP captured - updating UI", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "stop");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 48), "verificationChannel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "requiresUserInteraction");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 1);

  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Verification requires no user interaction, performing next step automatically", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "next:", 0);
  }
}

- (void)verificationObserverDidTimeout:(id)a3
{
  NSObject *v4;
  PKPaymentVerificationObserver *verificationObserver;
  uint8_t v6[16];

  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Verification observer timed out...", v6, 2u);
  }

  verificationObserver = self->_verificationObserver;
  self->_verificationObserver = 0;

}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  id v6;
  BOOL foregroundActive;
  id v8;

  v6 = a3;
  foregroundActive = self->_foregroundActiveState.foregroundActive;
  self->_foregroundActiveState = ($77BFE790A1370D46B4241309C9753022)a4;
  if (!foregroundActive && (*(_WORD *)&a4 & 0x100) != 0)
  {
    v8 = v6;
    -[PKPaymentSetupVerificationCompletionViewController _startVerificationObserver](self, "_startVerificationObserver");
LABEL_7:
    v6 = v8;
    goto LABEL_8;
  }
  if (foregroundActive && (*(_WORD *)&a4 & 0x100) == 0)
  {
    v8 = v6;
    -[PKPaymentSetupVerificationCompletionViewController _stopVerificationObserver](self, "_stopVerificationObserver");
    goto LABEL_7;
  }
LABEL_8:

}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
    -[PKPaymentSetupVerificationCompletionViewController _disableUI](self, "_disableUI", a3, a4);
  else
    -[PKPaymentSetupVerificationCompletionViewController _enableUI](self, "_enableUI", a3, a4);
}

- (void)_startVerificationObserver
{
  NSObject *v2;
  void *v4;
  id v5;
  uint8_t buf[16];

  if (self->_verificationAlreadyHandled)
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Pass verification already handled, so skipping starting observer", buf, 2u);
    }

  }
  else
  {
    -[PKPaymentVerificationController webService](self->_verificationController, "webService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetDevice");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "noteForegroundVerificationObserverActive:", 1);
    -[PKPaymentVerificationObserver setDelegate:](self->_verificationObserver, "setDelegate:", self);
    -[PKPaymentVerificationObserver startObservingVerificationSourceWithTimeout:](self->_verificationObserver, "startObservingVerificationSourceWithTimeout:", 0.0);

  }
}

- (void)_stopVerificationObserver
{
  void *v3;
  id v4;

  -[PKPaymentVerificationObserver setDelegate:](self->_verificationObserver, "setDelegate:", 0);
  -[PKPaymentVerificationObserver stop](self->_verificationObserver, "stop");
  -[PKPaymentVerificationController webService](self->_verificationController, "webService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetDevice");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "noteForegroundVerificationObserverActive:", 0);

}

- (void)_handleNextStep
{
  NSObject *v3;
  const __CFString *v4;
  id WeakRetained;
  _QWORD v6[5];
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_verificationCodeAccepted)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupVerificationCompletionViewController: handling next step with accepted code: %@", buf, 0xCu);
  }

  -[PKProvisioningAnalyticsSessionUIReporter reportPageCompleted:context:](self->_reporter, "reportPageCompleted:context:", self->_verificationCodeAccepted, 0);
  if (self->_verificationCodeAccepted)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__PKPaymentSetupVerificationCompletionViewController__handleNextStep__block_invoke;
    v6[3] = &unk_1E3E612E8;
    v6[4] = self;
    -[PKPaymentSetupVerificationCompletionViewController _showCompletedUIWithNextHandler:](self, "_showCompletedUIWithNextHandler:", v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
    objc_msgSend(WeakRetained, "verificationCompletionViewControllerDidFinish:", self);

  }
}

void __69__PKPaymentSetupVerificationCompletionViewController__handleNextStep__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1176));
  objc_msgSend(WeakRetained, "verificationCompletionViewControllerDidFinish:", *(_QWORD *)(a1 + 32));

}

- (void)_showCompletedUIWithNextHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Showing completed UI for verified pass", buf, 2u);
  }

  -[PKActivityTableCell activityIndicator](self->_verificationCodeCell, "activityIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopAnimating");
  objc_msgSend(v6, "removeFromSuperview");
  -[PKActivityTableCell setAccessoryType:](self->_verificationCodeCell, "setAccessoryType:", 3);
  -[PKActivityTableCell setNeedsLayout](self->_verificationCodeCell, "setNeedsLayout");
  v7 = dispatch_time(0, 1000000000);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__PKPaymentSetupVerificationCompletionViewController__showCompletedUIWithNextHandler___block_invoke;
  v9[3] = &unk_1E3E61850;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_after(v7, MEMORY[0x1E0C80D38], v9);

}

void __86__PKPaymentSetupVerificationCompletionViewController__showCompletedUIWithNextHandler___block_invoke(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[4];
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_showCompletedUIForPass:", v2);
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__PKPaymentSetupVerificationCompletionViewController__showCompletedUIWithNextHandler___block_invoke_2;
    block[3] = &unk_1E3E61590;
    v9 = *(id *)(a1 + 40);
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedString(CFSTR("DONE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 2, *(_QWORD *)(a1 + 32), sel__terminateFlow);

    objc_msgSend(v6, "setEnabled:", 1);
    objc_msgSend(*(id *)(a1 + 32), "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:animated:", v6, 1);

  }
}

uint64_t __86__PKPaymentSetupVerificationCompletionViewController__showCompletedUIWithNextHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Completed UI presentation finished handleing next action", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_submitVerificationCode
{
  void *v3;
  void *v4;
  void *v5;
  PKPaymentVerificationController *verificationController;
  _QWORD v7[4];
  id v8;
  id location;

  -[PKPaymentSetupVerificationCompletionViewController _disableUI](self, "_disableUI");
  objc_initWeak(&location, self);
  -[PKActivityTableCell editableTextField](self->_verificationCodeCell, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pk_zString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  verificationController = self->_verificationController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__PKPaymentSetupVerificationCompletionViewController__submitVerificationCode__block_invoke;
  v7[3] = &unk_1E3E7B698;
  objc_copyWeak(&v8, &location);
  -[PKPaymentVerificationController submitVerificationCode:completion:](verificationController, "submitVerificationCode:completion:", v5, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __77__PKPaymentSetupVerificationCompletionViewController__submitVerificationCode__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PKPaymentSetupVerificationCompletionViewController__submitVerificationCode__block_invoke_2;
    block[3] = &unk_1E3E63480;
    v12 = a2;
    v10 = WeakRetained;
    v11 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __77__PKPaymentSetupVerificationCompletionViewController__submitVerificationCode__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BYTE *v3;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_BYTE **)(a1 + 32);
  if (v2 == 1)
  {
    v3[1096] = 1;
    return objc_msgSend(*(id *)(a1 + 32), "_handleNextStep");
  }
  else
  {
    objc_msgSend(v3, "_showActivationError:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_enableUI");
  }
}

- (void)_disableUI
{
  PKActivityTableCell **p_verificationCodeCell;
  void *v4;
  void *v5;
  uint64_t v6;
  id *p_tableHeader;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIColor *v12;
  UIColor *editableTextFieldColor;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[PKPaymentSetupFooterView setButtonsEnabled:](self->_tableFooter, "setButtonsEnabled:", 0);
  p_verificationCodeCell = &self->_verificationCodeCell;
  -[PKActivityTableCell editableTextField](self->_verificationCodeCell, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_zString");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v19, "length");
  p_tableHeader = (id *)&self->_verificationCodeCell;
  if (!v6)
  {
    p_tableHeader = (id *)&self->_verificationCodeCell;
    if (!self->_verificationCodeAccepted)
      p_tableHeader = (id *)&self->_tableHeader;
  }
  objc_msgSend(*p_tableHeader, "activityIndicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startAnimating");

  -[PKActivityTableCell editableTextField](*p_verificationCodeCell, "editableTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!self->_resignedResponder)
    self->_resignedResponder = objc_msgSend(v9, "isFirstResponder");
  objc_msgSend(v10, "resignFirstResponder");
  -[PKActivityTableCell editableTextField](*p_verificationCodeCell, "editableTextField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", 0);

  if (!self->_editableTextFieldColor)
  {
    objc_msgSend(v10, "textColor");
    v12 = (UIColor *)objc_claimAutoreleasedReturnValue();
    editableTextFieldColor = self->_editableTextFieldColor;
    self->_editableTextFieldColor = v12;

    objc_msgSend(MEMORY[0x1E0DC3658], "placeholderTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v14);

  }
  -[PKActivityTableCell textLabel](*p_verificationCodeCell, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEnabled:", 0);

  -[PKPaymentSetupVerificationCompletionViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rightBarButtonItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEnabled:", 0);

  objc_msgSend(v16, "leftBarButtonItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEnabled:", 0);

  objc_msgSend(v16, "setHidesBackButton:", 1);
}

- (void)_enableUI
{
  void *v3;
  void *v4;
  UIColor *editableTextFieldColor;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PKPaymentSetupFooterView setButtonsEnabled:](self->_tableFooter, "setButtonsEnabled:", 1);
  -[PKActivityTableCell activityIndicator](self->_verificationCodeCell, "activityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimating");

  -[PKTableHeaderView activityIndicator](self->_tableHeader, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

  -[PKActivityTableCell editableTextField](self->_verificationCodeCell, "editableTextField");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", 1);
  if (self->_editableTextFieldColor)
  {
    objc_msgSend(v10, "setTextColor:");
    editableTextFieldColor = self->_editableTextFieldColor;
    self->_editableTextFieldColor = 0;

  }
  -[PKActivityTableCell textLabel](self->_verificationCodeCell, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

  -[PKPaymentSetupVerificationCompletionViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 1);

  objc_msgSend(v7, "leftBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

  objc_msgSend(v7, "setHidesBackButton:", 0);
}

- (void)_terminateFlow
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;

  -[PKPaymentSetupVerificationCompletionViewController _stopVerificationObserver](self, "_stopVerificationObserver");
  -[PKPaymentVerificationController setupDelegate](self->_verificationController, "setupDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
    objc_msgSend(v4, "verificationCompletionViewControllerDidFinish:", self);

  }
  if (v7)
  {
    objc_msgSend(v7, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKPaymentSetupVerificationCompletionViewController presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  -[PKPaymentSetupVerificationCompletionViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidesBackButton:", 0);

}

- (void)_showCompletedUIForPass:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  -[PKPaymentVerificationController webService](self->_verificationController, "webService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secureElementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "primaryPaymentApplicationForSecureElementIdentifiers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "state") == 2)
  {
    PKLocalizedPaymentString(CFSTR("CODE_ACCEPTED_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("WAITING_FOR_ACTIVATION_FORMAT");
  }
  else
  {
    v10 = objc_msgSend(v22, "supportsBarcodePayment");
    v11 = v10;
    if ((v10 & 1) != 0)
      PKLocalizedAquamanString(CFSTR("ACCOUNT_ACTIVATED_TITLE"));
    else
      PKLocalizedPaymentString(CFSTR("CARD_ACTIVATED_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isAccessPass"))
    {
      v9 = CFSTR("GENERIC_READY_TO_USE_FORMAT");
    }
    else
    {
      if (objc_msgSend(v22, "hasActiveVirtualCard"))
      {
        PKLocalizedVirtualCardString(CFSTR("VIRTUAL_CARD_PAYMENT_READY_TO_USE_FORMAT"));
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      if (v11)
        v9 = CFSTR("PAYMENT_READY_TO_USE_WALLET_FORMAT");
      else
        v9 = CFSTR("PAYMENT_READY_TO_USE_FORMAT");
    }
  }
  PKLocalizedPaymentString(&v9->isa);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v13 = (void *)v12;
  -[PKPaymentSetupVerificationCompletionViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLeftBarButtonItem:", 0);
  objc_msgSend(v14, "setHidesBackButton:", 1);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tableHeaderView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v8);

  objc_msgSend(v16, "subtitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PKStringWithValidatedFormat();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v20, v19);

  objc_msgSend(v16, "setNeedsLayout");
  objc_msgSend(v15, "setTableHeaderView:", v16);
  objc_msgSend(v15, "setTableFooterView:", 0);
  if (objc_msgSend(v15, "numberOfSections") >= 1)
  {
    objc_msgSend(v15, "beginUpdates");
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deleteSections:withRowAnimation:", v21, 0);

    objc_msgSend(v15, "endUpdates");
  }

}

- (void)_showActivationError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLocalizedPaymentString(CFSTR("ACTIVATION_FAILED_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("ACTIVATION_FAILED_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (v8)
  {
    PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"));
    v9 = objc_claimAutoreleasedReturnValue();

    PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v11 = v6;
    v6 = (void *)v10;
    v5 = (void *)v9;
LABEL_4:

LABEL_5:
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    v13 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75__PKPaymentSetupVerificationCompletionViewController__showActivationError___block_invoke;
    v22[3] = &unk_1E3E63F88;
    objc_copyWeak(&v23, location);
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addAction:](v12, "addAction:", v15);

    -[PKPaymentSetupVerificationCompletionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
    objc_destroyWeak(&v23);
    objc_destroyWeak(location);
    goto LABEL_6;
  }
  objc_msgSend(v4, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D6BCB8]);

  if (!v17)
  {
    objc_msgSend(v4, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D6B0B8]))
      goto LABEL_4;
    objc_msgSend(v4, "localizedFailureReason");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_5;
    goto LABEL_10;
  }
  v18 = objc_msgSend(v4, "code");
  if ((unint64_t)(v18 - 2) < 4)
  {
LABEL_9:
    objc_msgSend(v4, "localizedFailureReason");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(v4, "localizedFailureReason");
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "localizedRecoverySuggestion");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (v18 != 1)
  {
    if (v18)
      goto LABEL_5;
    goto LABEL_9;
  }
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "description");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = v21;
    _os_log_error_impl(&dword_19D178000, v12, OS_LOG_TYPE_ERROR, "Skipping alert for error :%{public}@", (uint8_t *)location, 0xCu);

  }
LABEL_6:

}

void __75__PKPaymentSetupVerificationCompletionViewController__showActivationError___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((_BYTE *)WeakRetained + 1097))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[136], "editableTextField");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "becomeFirstResponder");

    WeakRetained = v3;
  }

}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
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

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (PKPaymentSetupVerificationCompletionViewControllerFlowItemDelegate)flowItemDelegate
{
  return (PKPaymentSetupVerificationCompletionViewControllerFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_flowItemDelegate);
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
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_verificationController, 0);
  objc_storeStrong((id *)&self->_editableTextFieldColor, 0);
  objc_storeStrong((id *)&self->_tableFooter, 0);
  objc_storeStrong((id *)&self->_tableHeader, 0);
  objc_storeStrong((id *)&self->_verificationObserver, 0);
  objc_storeStrong((id *)&self->_verificationCodeCell, 0);
}

@end
