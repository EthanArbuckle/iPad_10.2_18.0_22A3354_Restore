@implementation PKAddBankAccountInformationViewController

- (PKAddBankAccountInformationViewController)init
{
  return -[PKAddBankAccountInformationViewController initWithDelegate:bankInformation:accountCountryCode:](self, "initWithDelegate:bankInformation:accountCountryCode:", 0, 0, CFSTR("US"));
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (PKAddBankAccountInformationViewController)initWithDelegate:(id)a3 bankInformation:(id)a4 accountCountryCode:(id)a5
{
  return -[PKAddBankAccountInformationViewController initWithState:delegate:bankInformation:accountCountryCode:featureAccount:](self, "initWithState:delegate:bankInformation:accountCountryCode:featureAccount:", 1, a3, a4, a5, 0);
}

- (PKAddBankAccountInformationViewController)initWithDelegate:(id)a3 bankInformation:(id)a4 accountCountryCode:(id)a5 featureAccount:(id)a6
{
  return -[PKAddBankAccountInformationViewController initWithState:delegate:bankInformation:accountCountryCode:featureAccount:](self, "initWithState:delegate:bankInformation:accountCountryCode:featureAccount:", 1, a3, a4, a5, a6);
}

- (PKAddBankAccountInformationViewController)initWithState:(unint64_t)a3 delegate:(id)a4 bankInformation:(id)a5 accountCountryCode:(id)a6 featureAccount:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PKAddBankAccountInformationViewController *v16;
  PKAddBankAccountInformationViewController *v17;
  uint64_t v18;
  NSMutableDictionary *cells;
  id v20;
  id *p_bankInformation;
  FKWalletBankCredentialImporter *v22;
  FKWalletBankCredentialImporter *fkCredentialImporter;
  uint64_t v24;
  NSString *accountCountryCode;
  uint64_t v26;
  NSMutableDictionary *userEnteredValues;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSArray *cellText;
  uint64_t v41;
  NSArray *cellPlaceholderText;
  objc_super v44;
  _QWORD v45[2];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v44.receiver = self;
  v44.super_class = (Class)PKAddBankAccountInformationViewController;
  v16 = -[PKPaymentSetupTableViewController initWithContext:](&v44, sel_initWithContext_, 0);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_featureAccount, a7);
    v17->_state = a3;
    objc_storeWeak((id *)&v17->_delegate, v12);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    cells = v17->_cells;
    v17->_cells = (NSMutableDictionary *)v18;

    v20 = v13;
    if (!v13)
      v20 = objc_alloc_init(MEMORY[0x1E0D66BC8]);
    p_bankInformation = (id *)&v17->_bankInformation;
    objc_storeStrong((id *)&v17->_bankInformation, v20);
    if (!v13)

    v17->_saveToBankCredentialCenter = 1;
    v17->_showDeleteButton = 1;
    if (PKBankCredentialCenterEnabled())
    {
      v22 = (FKWalletBankCredentialImporter *)objc_alloc_init(MEMORY[0x1E0CADD30]);
      fkCredentialImporter = v17->_fkCredentialImporter;
      v17->_fkCredentialImporter = v22;

    }
    objc_msgSend(v14, "uppercaseString");
    v24 = objc_claimAutoreleasedReturnValue();
    accountCountryCode = v17->_accountCountryCode;
    v17->_accountCountryCode = (NSString *)v24;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    userEnteredValues = v17->_userEnteredValues;
    v17->_userEnteredValues = (NSMutableDictionary *)v26;

    v17->_isEditingBankInformation = objc_msgSend(*p_bankInformation, "isValid");
    -[PKAddBankAccountInformationViewController _setNavigationBarItemsHidden:](v17, "_setNavigationBarItemsHidden:", 0);
    if (v17->_isEditingBankInformation)
    {
      v28 = v17->_userEnteredValues;
      v45[0] = CFSTR("PKAddBankAccountRoutingNumberKey");
      objc_msgSend(*p_bankInformation, "routingNumber");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = CFSTR("PKAddBankAccountAccountNumberKey");
      v46[0] = v29;
      objc_msgSend(*p_bankInformation, "accountNumber");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17->_state);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v31, v32);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddBankAccountInformationViewController _textForRow:](v17, "_textForRow:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v35);

    -[PKAddBankAccountInformationViewController _placeholderTextForRow:](v17, "_placeholderTextForRow:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v36);

    -[PKAddBankAccountInformationViewController _textForRow:](v17, "_textForRow:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v37);

    -[PKAddBankAccountInformationViewController _placeholderTextForRow:](v17, "_placeholderTextForRow:", 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v38);

    v39 = objc_msgSend(v33, "copy");
    cellText = v17->_cellText;
    v17->_cellText = (NSArray *)v39;

    v41 = objc_msgSend(v34, "copy");
    cellPlaceholderText = v17->_cellPlaceholderText;
    v17->_cellPlaceholderText = (NSArray *)v41;

  }
  return v17;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKAddBankAccountInformationViewController;
  -[PKPaymentSetupTableViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  PKCollapsibleHeaderView *v4;
  PKCollapsibleHeaderView *v5;
  PKCollapsibleHeaderView *headerView;
  PKCollapsibleHeaderView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKAddBankAccountInformationViewController;
  -[PKPaymentSetupTableViewController loadView](&v16, sel_loadView);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PKCollapsibleHeaderView alloc];
  v5 = -[PKCollapsibleHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  headerView = self->_headerView;
  self->_headerView = v5;

  v7 = self->_headerView;
  -[PKAddBankAccountInformationViewController _headerTitle](self, "_headerTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddBankAccountInformationViewController _headerSubTitle](self, "_headerSubTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCollapsibleHeaderView setTitle:subtitle:](v7, "setTitle:subtitle:", v8, v9);

  -[PKCollapsibleHeaderView setTitleAccessoriesEnabled:](self->_headerView, "setTitleAccessoriesEnabled:", 0);
  -[PKCollapsibleHeaderView setAdditionalBottomPadding:](self->_headerView, "setAdditionalBottomPadding:", 11.0);
  objc_msgSend(v3, "setTableHeaderView:", self->_headerView);
  if (self->_isEditingBankInformation && self->_showDeleteButton)
  {
    -[PKPaymentSetupTableViewController dockView](self, "dockView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "footerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "secondaryActionButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_INFO_DELETE_BANK_INFORMATION_BUTTON_TITLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:forState:", v13, 0);

    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__deleteBankInformation, 0x2000);
  }
  -[PKAddBankAccountInformationViewController _setTableFooterView](self, "_setTableFooterView");
  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "footerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setManualEntryButton:", 0);

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
  PKCollapsibleHeaderView *headerView;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PKAddBankAccountInformationViewController;
  -[PKPaymentSetupTableViewController viewWillLayoutSubviews](&v21, sel_viewWillLayoutSubviews);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[PKCollapsibleHeaderView frame](self->_headerView, "frame");
  v7 = v6;
  v9 = v8;
  -[PKCollapsibleHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v5, 1.79769313e308);
  if (v7 != v11 || v9 != v10)
  {
    headerView = self->_headerView;
    objc_msgSend(v3, "_rectForTableHeaderView");
    -[PKCollapsibleHeaderView setFrame:](headerView, "setFrame:");
    objc_msgSend(v3, "setTableHeaderView:", 0);
    objc_msgSend(v3, "setTableHeaderView:", self->_headerView);
  }
  objc_msgSend(v3, "tableFooterView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v14, "sizeThatFits:", v5, 1.79769313e308);
  if (v14 && (v16 != v19 || v18 != v20))
  {
    objc_msgSend(v3, "_rectForTableFooterView");
    objc_msgSend(v14, "setFrame:");
    objc_msgSend(v3, "setTableFooterView:", 0);
    objc_msgSend(v3, "setTableFooterView:", v14);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAddBankAccountInformationViewController;
  -[PKPaymentSetupTableViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[PKAddBankAccountInformationViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", -[PKAddBankAccountInformationViewController _cellValuesAreValid](self, "_cellValuesAreValid"));

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKSavingsAccountAssessmentManager *v17;
  PKSavingsAccountAssessmentManager *assessmentManager;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  PKAddBankAccountInformationViewController *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PKAddBankAccountInformationViewController;
  -[PKPaymentSetupTableViewController viewDidAppear:](&v25, sel_viewDidAppear_, a3);
  if (!self->_isEditingBankInformation)
  {
    -[NSMutableDictionary objectForKey:](self->_cells, "objectForKey:", &unk_1E3FADAB0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "editableTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "becomeFirstResponder");

  }
  if (-[PKBankAccountInformation type](self->_bankInformation, "type") == 1
    && -[PKAddBankAccountInformationViewController offerKeychainPreFill](self, "offerKeychainPreFill"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D66BC8]);
    if (objc_msgSend(v6, "isValid"))
    {
      -[PKAccount feature](self->_featureAccount, "feature");
      v7 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedFeatureString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedFeatureString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v13);

      v14 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedFeatureString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __59__PKAddBankAccountInformationViewController_viewDidAppear___block_invoke;
      v22 = &unk_1E3E61D90;
      v23 = v6;
      v24 = self;
      objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, &v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "addAction:", v16, v19, v20, v21, v22);
      objc_msgSend(v10, "setPreferredAction:", v16);
      -[PKAddBankAccountInformationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

    }
  }
  if (-[PKAccount type](self->_featureAccount, "type") == 4)
  {
    v17 = (PKSavingsAccountAssessmentManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D675E0]), "initWithType:", 1);
    assessmentManager = self->_assessmentManager;
    self->_assessmentManager = v17;

  }
}

void __59__PKAddBankAccountInformationViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("PKAddBankAccountRoutingNumberKey");
  objc_msgSend(*(id *)(a1 + 32), "routingNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("PKAddBankAccountAccountNumberKey");
  v7[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "accountNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1160), "setObject:forKey:", v4, &unk_1E3FADAC8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1160), "setObject:forKey:", v4, &unk_1E3FADAE0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1160), "setObject:forKey:", v4, &unk_1E3FADAF8);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1170) = 1;
  objc_msgSend(*(id *)(a1 + 40), "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1104) = 3;
  objc_msgSend(*(id *)(a1 + 40), "_setState:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1104));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2 * !self->_shouldHideContent;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  PKPeerPaymentBankAccountDetailCell *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSMutableDictionary *cells;
  void *v31;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKPeerPaymentBankAccountDetailCell"));
  v7 = (PKPeerPaymentBankAccountDetailCell *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  if (v7)
  {
    -[PKPeerPaymentBankAccountDetailCell editableTextField](v7, "editableTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 1);

  }
  else
  {
    v7 = -[PKPeerPaymentBankAccountDetailCell initWithStyle:reuseIdentifier:]([PKPeerPaymentBankAccountDetailCell alloc], "initWithStyle:reuseIdentifier:", 1000, CFSTR("PKPeerPaymentBankAccountDetailCell"));
    -[PKPeerPaymentBankAccountDetailCell editableTextField](v7, "editableTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

    -[PKPeerPaymentBankAccountDetailCell editableTextField](v7, "editableTextField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setKeyboardType:", 11);

    -[PKPeerPaymentBankAccountDetailCell setShouldDrawSeperator:](v7, "setShouldDrawSeperator:", 1);
  }
  -[PKPeerPaymentBankAccountDetailCell editableTextField](v7, "editableTextField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], 0, 0, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v13);

  -[PKPeerPaymentBankAccountDetailCell editableTextField](v7, "editableTextField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddBankAccountInformationViewController _bankInformationTextForRow:](self, "_bankInformationTextForRow:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v15);

  -[PKPeerPaymentBankAccountDetailCell textLabel](v7, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_cellText, "objectAtIndex:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v17);

  -[PKPeerPaymentBankAccountDetailCell editableTextField](v7, "editableTextField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->_cellPlaceholderText, "objectAtIndex:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPlaceholder:", v19);

  -[PKPeerPaymentBankAccountDetailCell editableTextField](v7, "editableTextField");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v22 = (uint64_t *)MEMORY[0x1E0D67FA0];
  v23 = (uint64_t *)MEMORY[0x1E0D67810];
  if (v8 != 1)
    v23 = (uint64_t *)MEMORY[0x1E0D68188];
  if (v8)
    v22 = v23;
  v24 = *v22;
  objc_msgSend(v20, "setAccessibilityIdentifier:", *v22);

  -[PKPeerPaymentBankAccountDetailCell textLabel](v7, "textLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "font");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAddBankAccountInformationViewController _minimumRequiredWidthForCellText:withFont:](self, "_minimumRequiredWidthForCellText:withFont:", self->_cellText, v26);
  PKFloatCeilToPixel();
  -[PKPeerPaymentBankAccountDetailCell setMinimumTextLabelWidth:](v7, "setMinimumTextLabelWidth:");
  -[PKPeerPaymentBankAccountDetailCell setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v24);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x1E0DC54D0];
  -[PKPeerPaymentBankAccountDetailCell editableTextField](v7, "editableTextField");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_textFieldDidChange_, v28, v29);

  cells = self->_cells;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](cells, "setObject:forKey:", v7, v31);

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKAddBankAccountInformationViewController;
  v8 = a4;
  -[PKPaymentSetupTableViewController tableView:willDisplayCell:forRowAtIndexPath:](&v11, sel_tableView_willDisplayCell_forRowAtIndexPath_, a3, v8, a5);
  objc_msgSend(v8, "textLabel", v11.receiver, v11.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAddBankAccountInformationViewController _minimumRequiredWidthForCellText:withFont:](self, "_minimumRequiredWidthForCellText:withFont:", self->_cellText, v10);
  PKFloatCeilToPixel();
  objc_msgSend(v8, "setMinimumTextLabelWidth:");

}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (self->_isEditingBankInformation && self->_state == 1)
  {
    v8 = v4;
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddBankAccountInformationViewController _footerView](self, "_footerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTableFooterView:", v6);

    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

    if (!self->_hasInteractedWithCell)
    {
      -[PKAddBankAccountInformationViewController _setText:forForCellAtRow:](self, "_setText:forForCellAtRow:", 0, 1);
      -[PKAddBankAccountInformationViewController _setText:forForCellAtRow:](self, "_setText:forForCellAtRow:", 0, 0);
    }
    self->_hasInteractedWithCell = 1;
    v4 = v8;
  }

}

- (void)textFieldDidChange:(id)a3
{
  void *v4;
  id v5;

  -[PKAddBankAccountInformationViewController navigationItem](self, "navigationItem", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", -[PKAddBankAccountInformationViewController _cellValuesAreValid](self, "_cellValuesAreValid"));

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  int v19;
  _BOOL4 v20;
  id v21;
  id v22;
  void *v23;
  int v24;
  _BOOL8 v25;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pk_zString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[PKAddBankAccountInformationViewController _rowWithTextField:](self, "_rowWithTextField:", v10);
  v15 = objc_msgSend(v13, "length");
  v16 = -[PKAddBankAccountInformationViewController _maxTextLengthForRow:](self, "_maxTextLengthForRow:", v14);
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isSupersetOfSet:", v18);
  if (v15 <= v16)
    v20 = v19;
  else
    v20 = 0;
  if (v20)
  {
    v21 = v13;
    v22 = v9;
    v23 = v22;
    if (v21 == v22)
    {

    }
    else
    {
      if (!v22 || !v21)
      {

LABEL_13:
        v25 = 0;
        goto LABEL_14;
      }
      v24 = objc_msgSend(v21, "isEqualToString:", v22);

      if (!v24)
        goto LABEL_13;
    }
    v25 = (unint64_t)objc_msgSend(v23, "length") > 1;
LABEL_14:
    -[PKAddBankAccountInformationViewController _setCellHasPastedContent:forRow:](self, "_setCellHasPastedContent:forRow:", v25, v14);
  }

  return v20;
}

- (void)cancel:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "bankAccountInformationViewControllerChangedBankAccountInformation:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "addBankAccountInformationViewControllerDidFinish:", self);
  }
  else
  {
    -[PKAddBankAccountInformationViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)next:(id)a3
{
  -[PKAddBankAccountInformationViewController _setState:](self, "_setState:", self->_state + 1);
}

- (id)_cellHasPastedContent
{
  NSMutableDictionary *cellHasPastedContent;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  cellHasPastedContent = self->_cellHasPastedContent;
  if (!cellHasPastedContent)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    v9[0] = &unk_1E3FADAC8;
    v9[1] = &unk_1E3FADAB0;
    v10[0] = MEMORY[0x1E0C9AAA0];
    v10[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithDictionary:", v5);
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cellHasPastedContent;
    self->_cellHasPastedContent = v6;

    cellHasPastedContent = self->_cellHasPastedContent;
  }
  return cellHasPastedContent;
}

- (void)_setCellHasPastedContent:(BOOL)a3 forRow:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  if (a4 <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PKAddBankAccountInformationViewController _cellHasPastedContent](self, "_cellHasPastedContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

  }
}

- (BOOL)_allCellsHavePastedContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[PKAddBankAccountInformationViewController _cellHasPastedContent](self, "_cellHasPastedContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E3FADAC8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAddBankAccountInformationViewController _cellHasPastedContent](self, "_cellHasPastedContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E3FADAB0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "BOOLValue"))
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 0;

  return v7;
}

- (void)_setTableFooterView
{
  void *v3;
  id v4;

  if (self->_state != 1 || self->_isEditingBankInformation || self->_shouldHideContent)
  {
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTableFooterView:", 0);
  }
  else
  {
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PKAddBankAccountInformationViewController _footerView](self, "_footerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTableFooterView:", v3);

  }
}

- (unint64_t)_rowWithTextField:(id)a3
{
  id v4;
  NSMutableDictionary *cells;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  cells = self->_cells;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__PKAddBankAccountInformationViewController__rowWithTextField___block_invoke;
  v9[3] = &unk_1E3E74698;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cells, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __63__PKAddBankAccountInformationViewController__rowWithTextField___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(a3, "editableTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v9, "unsignedIntegerValue");
    *a4 = 1;
  }

}

- (double)_minimumRequiredWidthForCellText:(id)a3 withFont:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v21 = *MEMORY[0x1E0DC1138];
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "sizeWithAttributes:", v7, (_QWORD)v16);
        if (v14 > v12)
          v12 = v14;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

- (void)textFieldDidClear:(id)a3
{
  -[PKAddBankAccountInformationViewController _setCellHasPastedContent:forRow:](self, "_setCellHasPastedContent:forRow:", 0, -[PKAddBankAccountInformationViewController _rowWithTextField:](self, "_rowWithTextField:", a3));
}

- (BOOL)_cellValuesAreValid
{
  _BOOL4 v3;

  v3 = -[PKAddBankAccountInformationViewController _isAccountNumberCellValid](self, "_isAccountNumberCellValid");
  if (v3)
    LOBYTE(v3) = -[PKAddBankAccountInformationViewController _isRoutingNumberCellValid](self, "_isRoutingNumberCellValid");
  return v3;
}

- (BOOL)_isAccountNumberCellValid
{
  return -[PKAddBankAccountInformationViewController _isCellValidAtRow:](self, "_isCellValidAtRow:", 1);
}

- (BOOL)_isRoutingNumberCellValid
{
  return -[PKAddBankAccountInformationViewController _isCellValidAtRow:](self, "_isCellValidAtRow:", 0);
}

- (BOOL)_isCellValidAtRow:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;

  -[PKAddBankAccountInformationViewController _userEnteredTextForCellAtRow:](self, "_userEnteredTextForCellAtRow:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  if (v6 >= -[PKAddBankAccountInformationViewController _minTextLengthForRow:](self, "_minTextLengthForRow:", a3))
  {
    v8 = objc_msgSend(v5, "length");
    v7 = v8 <= -[PKAddBankAccountInformationViewController _maxTextLengthForRow:](self, "_maxTextLengthForRow:", a3);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_userEnteredTextForCellAtRow:(unint64_t)a3
{
  NSMutableDictionary *cells;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  cells = self->_cells;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cells, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "editableTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_setText:(id)a3 forForCellAtRow:(unint64_t)a4
{
  NSMutableDictionary *cells;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  cells = self->_cells;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a3;
  objc_msgSend(v7, "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](cells, "objectForKey:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "editableTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v8);

  -[PKAddBankAccountInformationViewController _setCellHasPastedContent:forRow:](self, "_setCellHasPastedContent:forRow:", 0, a4);
}

- (void)_setState:(unint64_t)a3
{
  unint64_t state;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *userEnteredValues;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  void *v44;
  PKAddBankAccountInformationViewController *v45;
  id v46;
  _QWORD aBlock[5];
  id v48;
  _QWORD v49[5];
  _QWORD v50[4];
  id v51;
  id v52;
  uint8_t *v53;
  uint8_t buf[8];
  uint8_t *v55;
  uint64_t v56;
  BOOL v57;
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[3];

  state = a3;
  v61[2] = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    -[PKAddBankAccountInformationViewController _userEnteredTextForCellAtRow:](self, "_userEnteredTextForCellAtRow:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKAddBankAccountInformationViewController _userEnteredTextForCellAtRow:](self, "_userEnteredTextForCellAtRow:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (state == 1)
    {
      self->_state = 1;
    }
    else
    {
      userEnteredValues = self->_userEnteredValues;
      v60[0] = CFSTR("PKAddBankAccountRoutingNumberKey");
      v60[1] = CFSTR("PKAddBankAccountAccountNumberKey");
      v61[0] = v10;
      v61[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_state);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](userEnteredValues, "setObject:forKey:", v12, v13);

      self->_state = state;
      if (state == 2
        && -[PKAddBankAccountInformationViewController _allCellsHavePastedContent](self, "_allCellsHavePastedContent"))
      {
        self->_state = 3;
        PKLogFacilityTypeGetObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Skipping Bank Account 'confirm' step since both fields have were pasted into", buf, 2u);
        }

      }
    }

    state = self->_state;
  }
  if (state == 4)
  {
    self->_state = 2;
    -[PKAddBankAccountInformationViewController _updateHeaderAndNavigationItems](self, "_updateHeaderAndNavigationItems");
    -[PKAddBankAccountInformationViewController _setTableFooterView](self, "_setTableFooterView");
  }
  else if (state == 3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v55 = buf;
    v56 = 0x2020000000;
    v57 = 0;
    v57 = -[NSMutableDictionary count](self->_userEnteredValues, "count") != 0;
    v17 = self->_userEnteredValues;
    v18 = MEMORY[0x1E0C809B0];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __55__PKAddBankAccountInformationViewController__setState___block_invoke;
    v50[3] = &unk_1E3E746C0;
    v19 = v15;
    v51 = v19;
    v20 = v16;
    v52 = v20;
    v53 = buf;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v17, "enumerateKeysAndObjectsUsingBlock:", v50);
    if (v55[24])
    {
      -[PKPaymentSetupTableViewController tableView](self, "tableView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAddBankAccountInformationViewController _showHeaderActivitySpinner](self, "_showHeaderActivitySpinner");
      -[PKAddBankAccountInformationViewController _setNavigationBarItemsHidden:](self, "_setNavigationBarItemsHidden:", 1);
      objc_msgSend(v21, "setUserInteractionEnabled:", 0);
      -[NSMutableDictionary objectForKey:](self->_cells, "objectForKey:", &unk_1E3FADAC8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "editableTextField");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setEnabled:", 0);

      -[NSMutableDictionary objectForKey:](self->_cells, "objectForKey:", &unk_1E3FADAB0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "editableTextField");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setEnabled:", 0);

      v58[0] = CFSTR("PKAddBankAccountAccountNumberKey");
      objc_msgSend(v19, "anyObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = CFSTR("PKAddBankAccountRoutingNumberKey");
      v59[0] = v26;
      objc_msgSend(v20, "anyObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v59[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      aBlock[0] = v18;
      aBlock[1] = 3221225472;
      aBlock[2] = __55__PKAddBankAccountInformationViewController__setState___block_invoke_3;
      aBlock[3] = &unk_1E3E746E8;
      aBlock[4] = self;
      v29 = v21;
      v48 = v29;
      v41 = v18;
      v42 = 3221225472;
      v43 = __55__PKAddBankAccountInformationViewController__setState___block_invoke_6;
      v44 = &unk_1E3E61850;
      v45 = self;
      v30 = _Block_copy(aBlock);
      v46 = v30;
      -[PKAddBankAccountInformationViewController _updateBankAccountInformationWithValues:completion:](self, "_updateBankAccountInformationWithValues:completion:", v28, &v41);

    }
    else
    {
      v31 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_INFO_ACCOUNT_ROUTING_ENTERED_ERROR_TITLE"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_INFO_ACCOUNT_ROUTING_ENTERED_ERROR_MESSAGE"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "alertControllerWithTitle:message:preferredStyle:", v32, v33, 1);
      v29 = (id)objc_claimAutoreleasedReturnValue();

      v34 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_INFO_TRY_AGAIN"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v18;
      v49[1] = 3221225472;
      v49[2] = __55__PKAddBankAccountInformationViewController__setState___block_invoke_2;
      v49[3] = &unk_1E3E61D68;
      v49[4] = self;
      objc_msgSend(v34, "actionWithTitle:style:handler:", v35, 0, v49);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addAction:", v36);

      -[PKAddBankAccountInformationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v29, 1, 0);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    -[PKAddBankAccountInformationViewController _updateHeaderAndNavigationItems](self, "_updateHeaderAndNavigationItems");
    -[PKAddBankAccountInformationViewController _setTableFooterView](self, "_setTableFooterView");
    -[PKAddBankAccountInformationViewController _reloadTableSection](self, "_reloadTableSection");
  }
  -[PKPaymentSetupTableViewController dockView](self, "dockView", v41, v42, v43, v44, v45);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "footerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setSecondaryActionButton:", 0);

  -[PKAddBankAccountInformationViewController navigationItem](self, "navigationItem");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rightBarButtonItem");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setEnabled:", -[PKAddBankAccountInformationViewController _cellValuesAreValid](self, "_cellValuesAreValid"));

}

void __55__PKAddBankAccountInformationViewController__setState___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("PKAddBankAccountAccountNumberKey"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("PKAddBankAccountRoutingNumberKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  if (objc_msgSend(*(id *)(a1 + 32), "count") != 1 || objc_msgSend(*(id *)(a1 + 40), "count") != 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }

}

uint64_t __55__PKAddBankAccountInformationViewController__setState___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "_setText:forForCellAtRow:", 0, 1);
  objc_msgSend(*(id *)(a1 + 32), "_setText:forForCellAtRow:", 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setState:", 1);
}

void __55__PKAddBankAccountInformationViewController__setState___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__PKAddBankAccountInformationViewController__setState___block_invoke_4;
  v10[3] = &unk_1E3E62460;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v5;
  v13 = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __55__PKAddBankAccountInformationViewController__setState___block_invoke_4(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  dispatch_time_t v10;
  PKApplyVerificationTrialDepositViewController *v11;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "_hideHeaderActivitySpinner");
  v2 = *(id **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    if (v2[148])
    {
      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v3, objc_msgSend(v2[148], "feature"), 0, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 32), "_setState:", 1);
      objc_msgSend(*(id *)(a1 + 32), "_updateHeaderAndNavigationItems");
      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);

      v2 = *(id **)(a1 + 32);
    }
    objc_msgSend(v2, "_setContentHidden:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_setNavigationBarItemsHidden:", 0);
    objc_msgSend(*(id *)(a1 + 56), "setUserInteractionEnabled:", 1);
  }
  else
  {
    objc_msgSend(v2, "_addToBankCredentialCenter");
    v6 = *(void **)(a1 + 48);
    if (v6 && objc_msgSend(v6, "verificationType") == 2)
    {
      v11 = -[PKApplyVerificationTrialDepositViewController initWithSetupDelegate:context:verificationPage:account:]([PKApplyVerificationTrialDepositViewController alloc], "initWithSetupDelegate:context:verificationPage:account:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1184));
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pushViewController:animated:", v11, 1);

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setTitleAccessoriesEnabled:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "showCheckmark:animated:", 1, 1);
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1168))
        v8 = CFSTR("PEER_PAYMENT_BANK_DONE");
      else
        v8 = CFSTR("PEER_PAYMENT_BANK_INFO_ADDED");
      PKLocalizedPeerPaymentString(&v8->isa);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setHeaderViewTitle:subtitle:", v9, &stru_1E3E7D690);
      v10 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__PKAddBankAccountInformationViewController__setState___block_invoke_5;
      block[3] = &unk_1E3E612E8;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_after(v10, MEMORY[0x1E0C80D38], block);

    }
  }
}

void __55__PKAddBankAccountInformationViewController__setState___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1208));
  objc_msgSend(WeakRetained, "bankAccountInformationViewControllerChangedBankAccountInformation:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "cancel:", 0);

}

uint64_t __55__PKAddBankAccountInformationViewController__setState___block_invoke_6(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "type") == 1)
    return objc_msgSend(*(id *)(a1 + 32), "_addPaymentFundingSourceWithCompletion:", *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_reloadTableSection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSections:withRowAnimation:", v4, 2);

  -[NSMutableDictionary objectForKey:](self->_cells, "objectForKey:", &unk_1E3FADAB0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "becomeFirstResponder");

}

- (id)_bankInformationTextForRow:(unint64_t)a3
{
  NSMutableDictionary *userEnteredValues;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;

  userEnteredValues = self->_userEnteredValues;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](userEnteredValues, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a3)
  {
    v8 = CFSTR("PKAddBankAccountRoutingNumberKey");
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v8 = CFSTR("PKAddBankAccountAccountNumberKey");
LABEL_5:
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:
  if (self->_state == 1 && objc_msgSend(v9, "length") || self->_prefilledFromKeychain)
  {
    PKSanitizedBankAccountNumber();
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }

  return v9;
}

- (id)_textForRow:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    v5 = CFSTR("PEER_PAYMENT_BANK_INFO_ACCOUNT_NUMBER_FIELD_TITLE");
  }
  else
  {
    v5 = CFSTR("PEER_PAYMENT_BANK_INFO_ROUTING_NUMBER_FIELD_TITLE");
  }
  -[PKAddBankAccountInformationViewController _countrySpecificLocalizedStringKeyForKey:](self, "_countrySpecificLocalizedStringKeyForKey:", v5, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_placeholderTextForRow:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    -[PKAddBankAccountInformationViewController _countrySpecificLocalizedStringKeyForKey:minDigits:maxDigits:](self, "_countrySpecificLocalizedStringKeyForKey:minDigits:maxDigits:", CFSTR("PEER_PAYMENT_BANK_INFO_ACCOUNT_NUMBER_FIELD_PLACEHOLDER"), 4, 17);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[PKAddBankAccountInformationViewController _countrySpecificLocalizedStringKeyForKey:numberOfDigits:](self, "_countrySpecificLocalizedStringKeyForKey:numberOfDigits:", CFSTR("PEER_PAYMENT_BANK_INFO_ROUTING_NUMBER_FIELD_PLACEHOLDER"), 9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_showHeaderActivitySpinner
{
  id v3;

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_INFO_ADDING_BANK_ACCOUNT_TITLE"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKAddBankAccountInformationViewController _setTableViewHeaderActivitySpinnerAnimated:title:subtitle:](self, "_setTableViewHeaderActivitySpinnerAnimated:title:subtitle:", 1, v3, &stru_1E3E7D690);

}

- (void)_hideHeaderActivitySpinner
{
  -[PKAddBankAccountInformationViewController _setTableViewHeaderActivitySpinnerAnimated:title:subtitle:](self, "_setTableViewHeaderActivitySpinnerAnimated:title:subtitle:", 0, &stru_1E3E7D690, &stru_1E3E7D690);
}

- (void)_setTableViewHeaderActivitySpinnerAnimated:(BOOL)a3 title:(id)a4 subtitle:(id)a5
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v9;
  void *v10;
  id v11;

  v6 = a3;
  v8 = !a3;
  v9 = a5;
  v11 = a4;
  -[PKAddBankAccountInformationViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInteractionEnabled:", v8);

  -[PKAddBankAccountInformationViewController _setNavigationBarEnabled:](self, "_setNavigationBarEnabled:", v8);
  if (!v8)
    -[PKAddBankAccountInformationViewController _setContentHidden:](self, "_setContentHidden:", 1);
  if (-[PKCollapsibleHeaderView showSpinner](self->_headerView, "showSpinner") != v6)
    -[PKCollapsibleHeaderView setTitleAccessoriesEnabled:](self->_headerView, "setTitleAccessoriesEnabled:", v6);
  -[PKCollapsibleHeaderView setShowSpinner:](self->_headerView, "setShowSpinner:", v6);
  -[PKAddBankAccountInformationViewController setHeaderViewTitle:subtitle:](self, "setHeaderViewTitle:subtitle:", v11, v9);
  -[PKAddBankAccountInformationViewController _setIdleTimerDisabled:title:subtitle:](self, "_setIdleTimerDisabled:title:subtitle:", v6, v11, v9);

}

- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4
{
  PKCollapsibleHeaderView *headerView;
  double v6;
  double v7;
  double v8;
  PKCollapsibleHeaderView *v9;
  id v10;

  -[PKCollapsibleHeaderView setTitle:subtitle:](self->_headerView, "setTitle:subtitle:", a3, a4);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  headerView = self->_headerView;
  objc_msgSend(v10, "bounds");
  -[PKCollapsibleHeaderView sizeThatFits:](headerView, "sizeThatFits:", v6, 1.79769313e308);
  v8 = v7;
  v9 = self->_headerView;
  objc_msgSend(v10, "_rectForTableHeaderView");
  -[PKCollapsibleHeaderView setFrame:](v9, "setFrame:");
  objc_msgSend(v10, "_tableHeaderHeightDidChangeToHeight:", v8);
  -[PKCollapsibleHeaderView setNeedsLayout](self->_headerView, "setNeedsLayout");

}

- (void)_setContentHidden:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_shouldHideContent != a3)
  {
    self->_shouldHideContent = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __63__PKAddBankAccountInformationViewController__setContentHidden___block_invoke;
    v3[3] = &unk_1E3E612E8;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
  }
}

uint64_t __63__PKAddBankAccountInformationViewController__setContentHidden___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSections:withRowAnimation:", v3, 5);

  return objc_msgSend(*(id *)(a1 + 32), "_setTableFooterView");
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
    v19 = CFSTR("PKAddBankAccountInformation");
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Payment Setup has %@ the Idle Timer. (For: %@ - %@) - %@.", (uint8_t *)&v12, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setIdleTimerDisabled:forReason:", v6, CFSTR("PKAddBankAccountInformation"));

}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  v3 = a3;
  -[PKAddBankAccountInformationViewController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  objc_msgSend(v10, "interactivePopGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[PKAddBankAccountInformationViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = !v3 || self->_state == 3;
  objc_msgSend(v7, "setHidesBackButton:animated:", v9, 1);

}

- (void)_setNavigationBarItemsHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[PKAddBankAccountInformationViewController navigationItem](self, "navigationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v9, "setLeftBarButtonItem:", 0);
    objc_msgSend(v9, "setRightBarButtonItem:", 0);
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
    objc_msgSend(v9, "setLeftBarButtonItem:", v5);
    v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 2, self, sel_next_);

    objc_msgSend(v9, "setRightBarButtonItem:", v8);
  }

}

- (void)_deleteBankInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_INFO_DELETE_BANK_INFORMATION_BUTTON_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_INFO_DELETE_BANK_INFORMATION_ALERT_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_INFO_CANCEL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  v10 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_INFO_DELETE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__PKAddBankAccountInformationViewController__deleteBankInformation__block_invoke;
  v13[3] = &unk_1E3E61D68;
  v13[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 2, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v12);

  -[PKAddBankAccountInformationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

void __67__PKAddBankAccountInformationViewController__deleteBankInformation__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "deleteAllBankInformation");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1208));
  objc_msgSend(WeakRetained, "bankAccountInformationViewControllerChangedBankAccountInformation:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_updateBankAccountInformationWithValues:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  NSString *accountCountryCode;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  PKAddBankAccountInformationViewController *v25;
  id v26;
  _QWORD aBlock[5];
  id v28;
  id v29;
  id v30;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("PKAddBankAccountAccountNumberKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("PKAddBankAccountRoutingNumberKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKAddBankAccountInformationViewController__updateBankAccountInformationWithValues_completion___block_invoke;
  aBlock[3] = &unk_1E3E74710;
  aBlock[4] = self;
  v11 = v9;
  v28 = v11;
  v12 = v8;
  v29 = v12;
  v13 = v6;
  v30 = v13;
  v14 = _Block_copy(aBlock);
  if (self->_featureAccount)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0D66968]);
    objc_msgSend(v15, "setCountryCode:", self->_accountCountryCode);
    objc_msgSend(v15, "setQuery:", v11);
    -[PKAccount accountBaseURL](self->_featureAccount, "accountBaseURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBaseURL:", v16);

    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __96__PKAddBankAccountInformationViewController__updateBankAccountInformationWithValues_completion___block_invoke_2;
    v23[3] = &unk_1E3E74738;
    v24 = v11;
    v25 = self;
    v26 = v14;
    v18 = v14;
    objc_msgSend(v17, "accountBankLookupWithRequest:completion:", v15, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    accountCountryCode = self->_accountCountryCode;
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __96__PKAddBankAccountInformationViewController__updateBankAccountInformationWithValues_completion___block_invoke_158;
    v20[3] = &unk_1E3E74760;
    v21 = v11;
    v22 = v14;
    v17 = v14;
    objc_msgSend(v15, "peerPaymentBankLookupWithCountryCode:query:completion:", accountCountryCode, v21, v20);

    v18 = v21;
  }

}

uint64_t __96__PKAddBankAccountInformationViewController__updateBankAccountInformationWithValues_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t result;

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 1112);
  v5 = a2;
  objc_msgSend(v4, "setRoutingNumber:", v3);
  objc_msgSend(*(id *)(a1[4] + 1112), "setAccountNumber:", a1[6]);
  objc_msgSend(*(id *)(a1[4] + 1112), "setBankName:", v5);

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __96__PKAddBankAccountInformationViewController__updateBankAccountInformationWithValues_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "success");
  if (v6 || (v7 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[4];
      v14 = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Error looking up bank name with query: %@, error: %@", (uint8_t *)&v14, 0x16u);
    }

  }
  objc_msgSend(v5, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(*(id *)(a1[5] + 1184), "feature");
    PKLocalizedFeatureString();
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  (*(void (**)(void))(a1[6] + 16))();
}

void __96__PKAddBankAccountInformationViewController__updateBankAccountInformationWithValues_completion___block_invoke_158(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "success");
  if (v6 || (v7 & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Error looking up bank name with query: %@, error: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  objc_msgSend(v5, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v5, "displayName");
  else
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_INFO_DEFAULT_BANK_NAME"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_addPaymentFundingSourceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0D66978]);
  objc_msgSend(v6, "setDestination:", 2);
  -[PKAccount accountBaseURL](self->_featureAccount, "accountBaseURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBaseURL:", v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke;
  v10[3] = &unk_1E3E74850;
  v10[4] = self;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v9, "accountServiceCertificatesWithRequest:completion:", v6, v10);

}

void __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[6];
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__46;
    v23[4] = __Block_byref_object_dispose__46;
    v24 = 0;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__46;
    v21[4] = __Block_byref_object_dispose__46;
    v22 = 0;
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "type");
    v10 = MEMORY[0x1E0C809B0];
    if (v9 == 4)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_164;
      v20[3] = &unk_1E3E747B0;
      v20[4] = v23;
      objc_msgSend(v8, "addOperation:", v20);
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_3;
      v19[3] = &unk_1E3E64F70;
      v19[4] = *(_QWORD *)(a1 + 32);
      v19[5] = v21;
      objc_msgSend(v8, "addOperation:", v19);
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_5;
    v13[3] = &unk_1E3E74828;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v5;
    v17 = v23;
    v18 = v21;
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    v12 = (id)objc_msgSend(v8, "evaluateWithInput:completion:", v11, v13);

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v23, 8);

  }
}

void __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_164(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "targetDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_2;
    v10[3] = &unk_1E3E74788;
    v13 = *(_QWORD *)(a1 + 32);
    v12 = v7;
    v11 = v6;
    objc_msgSend(v9, "paymentWebService:deviceMetadataWithFields:completion:", v8, 251, v10);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 1192);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_4;
  v12[3] = &unk_1E3E747D8;
  v14 = v7;
  v15 = v8;
  v13 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "waitForAssessmentWithCompletion:", v12);

}

void __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "accountIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66890]), "initWithType:", 1);
  v4 = objc_alloc_init(MEMORY[0x1E0D66888]);
  objc_msgSend(v4, "setAccountIdentifier:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "bankName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "accountNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccountNumber:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "routingNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRoutingNumber:", v7);

  objc_msgSend(v3, "setFundingDetails:", v4);
  v8 = objc_alloc_init(MEMORY[0x1E0D66958]);
  objc_msgSend(v8, "setAccountIdentifier:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "accountBaseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBaseURL:", v9);

  objc_msgSend(v8, "setFundingSource:", v3);
  objc_msgSend(v8, "setCertificatesResponse:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1184), "addFundingSourceFeatureDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fundingSourceTermsIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFundingSourceTermsIdentifier:", v11);

  objc_msgSend(v8, "setDeviceMetadata:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(v8, "setOdiAssessment:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_6;
  v13[3] = &unk_1E3E74800;
  v13[4] = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  objc_msgSend(v12, "addFundingSourceWithRequest:completion:", v8, v13);

}

void __84__PKAddBankAccountInformationViewController__addPaymentFundingSourceWithCompletion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id WeakRetained;
  char v23;
  id v24;
  uint64_t v25;
  id v26;

  v26 = a2;
  v5 = a3;
  if (!v26 || v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1208));
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      v24 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1208));
      objc_msgSend(v24, "addBankAccountInformationViewController:didFailWithError:", *(_QWORD *)(a1 + 32), v5);

    }
    v25 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v26, "confirmationPage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v25 + 16))(v25, v6, v5);
  }
  else
  {
    objc_msgSend(v26, "fundingSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 1184);
    if (v8)
    {
      objc_msgSend(v8, "accountIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKSetLastBankAccountIdentifierForAccountTransfer();

      v7 = *(_QWORD *)(a1 + 32);
    }
    v11 = objc_loadWeakRetained((id *)(v7 + 1208));
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1208));
      objc_msgSend(v13, "addBankAccountInformationViewController:didAddFundingSource:", *(_QWORD *)(a1 + 32), v6);

    }
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 1192);
    if (v14)
      objc_msgSend(v14, "provideSessionFeedbackIngested");
    v15 = objc_alloc_init(MEMORY[0x1E0D66BC8]);
    objc_msgSend(v15, "updateToLatestKeychainData");
    if ((objc_msgSend(v15, "isValid") & 1) == 0)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0D66BC8]);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "accountNumber");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAccountNumber:", v17);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "routingNumber");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setRoutingNumber:", v18);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "bankName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBankName:", v19);

    }
    v20 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v26, "confirmationPage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v20 + 16))(v20, v21, 0);

  }
}

- (void)_addToBankCredentialCenter
{
  if (self->_saveToBankCredentialCenter)
    -[FKWalletBankCredentialImporter insertBankCredentialFromBankInformation:completion:](self->_fkCredentialImporter, "insertBankCredentialFromBankInformation:completion:", self->_bankInformation, &__block_literal_global_172);
}

void __71__PKAddBankAccountInformationViewController__addToBankCredentialCenter__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Failed to insert bank credential from bank information: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (id)_headerSubTitle
{
  unint64_t state;
  __CFString *v3;
  __CFString *v4;

  state = self->_state;
  if (state == 1)
  {
    v3 = CFSTR("PEER_PAYMENT_BANK_INFO_COMPLETE_ACCOUNT_INFO");
  }
  else
  {
    if (state != 2)
    {
      v4 = &stru_1E3E7D690;
      return v4;
    }
    v3 = CFSTR("PEER_PAYMENT_BANK_INFO_CONFIRM_ACCOUNT_NUMBER");
  }
  PKLocalizedPeerPaymentString(&v3->isa);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (void)_updateHeaderAndNavigationItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PKAddBankAccountInformationViewController _headerTitle](self, "_headerTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddBankAccountInformationViewController _headerSubTitle](self, "_headerSubTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddBankAccountInformationViewController setHeaderViewTitle:subtitle:](self, "setHeaderViewTitle:subtitle:", v3, v4);

  -[PKAddBankAccountInformationViewController navigationItem](self, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", -[PKAddBankAccountInformationViewController _cellValuesAreValid](self, "_cellValuesAreValid"));

}

- (id)_headerTitle
{
  __CFString *v2;

  if (self->_isEditingBankInformation)
    v2 = CFSTR("PEER_PAYMENT_PERFORM_ACTION_EDIT_BANK_ACCOUNT");
  else
    v2 = CFSTR("PEER_PAYMENT_PERFORM_ACTION_ADD_BANK_ACCOUNT");
  PKLocalizedPeerPaymentString(&v2->isa);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_footerView
{
  PKFindBankAccountInformationFooterView *footerView;
  void *v4;
  void *v5;
  PKFindBankAccountInformationFooterView *v6;
  PKFindBankAccountInformationFooterView *v7;
  PKFindBankAccountInformationFooterView *v8;
  PKFindBankAccountInformationFooterView *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id location;
  CGRect v22;

  footerView = self->_footerView;
  if (!footerView)
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0DC3428];
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __56__PKAddBankAccountInformationViewController__footerView__block_invoke;
    v19 = &unk_1E3E62BD0;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v4, "actionWithHandler:", &v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [PKFindBankAccountInformationFooterView alloc];
    v7 = -[PKFindBankAccountInformationFooterView initWithFrame:action:](v6, "initWithFrame:action:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v16, v17, v18, v19);
    v8 = self->_footerView;
    self->_footerView = v7;

    v9 = self->_footerView;
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    -[PKFindBankAccountInformationFooterView sizeThatFits:](v9, "sizeThatFits:", CGRectGetWidth(v22), 3.40282347e38);
    v12 = v11;
    v14 = v13;

    -[PKFindBankAccountInformationFooterView setFrame:](self->_footerView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v12, v14);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    footerView = self->_footerView;
  }
  return footerView;
}

void __56__PKAddBankAccountInformationViewController__footerView__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_showHowToFindAccountInformationViewController:", v4);
}

- (void)_showHowToFindAccountInformationViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKNavigationController *v10;
  void *v11;
  PKExplanationViewController *v12;

  v12 = -[PKExplanationViewController initWithContext:]([PKExplanationViewController alloc], "initWithContext:", 0);
  -[PKExplanationViewController explanationView](v12, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_INFO_WHERE_TO_FIND_ACCOUNT_INFO_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleText:", v5);

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_BANK_INFO_WHERE_TO_FIND_ACCOUNT_INFO_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBodyText:", v6);

  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC48C8], 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleFont:", v7);
  objc_msgSend(v4, "setBodyTextAlignment:", 4);
  -[PKExplanationViewController setShowDoneButton:](v12, "setShowDoneButton:", 1);
  -[PKExplanationViewController setShowCancelButton:](v12, "setShowCancelButton:", 0);
  objc_msgSend(v4, "setShowPrivacyView:", 0);
  objc_msgSend(v4, "dockView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPrimaryButton:", 0);

  PKUIImageNamed(CFSTR("CheckInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v9);

  v10 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v12);
  -[PKNavigationController setSupportedInterfaceOrientations:](v10, "setSupportedInterfaceOrientations:", 2);
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKNavigationController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 2);
  }
  -[PKAddBankAccountInformationViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

}

- (unint64_t)_minTextLengthForRow:(unint64_t)a3
{
  if (a3)
    return 4 * (a3 == 1);
  else
    return 9;
}

- (unint64_t)_maxTextLengthForRow:(unint64_t)a3
{
  unint64_t v3;

  v3 = 17;
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return v3;
  else
    return 9;
}

- (id)_countrySpecificLocalizedStringKeyForKey:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  NSString *v7;

  v4 = a3;
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("_%@"), self->_accountCountryCode);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("_DEFAULT"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_countrySpecificLocalizedStringKeyForKey:(id)a3 numberOfDigits:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0CB37F0];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a3;
  objc_msgSend(v7, "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringFromNumber:numberStyle:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAddBankAccountInformationViewController _countrySpecificLocalizedStringKeyForKey:](self, "_countrySpecificLocalizedStringKeyForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PKStringWithValidatedFormat();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_countrySpecificLocalizedStringKeyForKey:(id)a3 minDigits:(unint64_t)a4 maxDigits:(unint64_t)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = (void *)MEMORY[0x1E0CB37F0];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a3;
  objc_msgSend(v9, "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringFromNumber:numberStyle:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringFromNumber:numberStyle:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAddBankAccountInformationViewController _countrySpecificLocalizedStringKeyForKey:](self, "_countrySpecificLocalizedStringKeyForKey:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  PKStringWithValidatedFormat();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  -[PKAddBankAccountInformationViewController cancel:](self, "cancel:", 0);
}

- (BOOL)saveToBankCredentialCenter
{
  return self->_saveToBankCredentialCenter;
}

- (void)setSaveToBankCredentialCenter:(BOOL)a3
{
  self->_saveToBankCredentialCenter = a3;
}

- (BOOL)showDeleteButton
{
  return self->_showDeleteButton;
}

- (void)setShowDeleteButton:(BOOL)a3
{
  self->_showDeleteButton = a3;
}

- (BOOL)offerKeychainPreFill
{
  return self->_offerKeychainPreFill;
}

- (void)setOfferKeychainPreFill:(BOOL)a3
{
  self->_offerKeychainPreFill = a3;
}

- (PKAddBankAccountInformationViewControllerDelegate)delegate
{
  return (PKAddBankAccountInformationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assessmentManager, 0);
  objc_storeStrong((id *)&self->_featureAccount, 0);
  objc_storeStrong((id *)&self->_cellHasPastedContent, 0);
  objc_storeStrong((id *)&self->_userEnteredValues, 0);
  objc_storeStrong((id *)&self->_accountCountryCode, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_cellPlaceholderText, 0);
  objc_storeStrong((id *)&self->_cellText, 0);
  objc_storeStrong((id *)&self->_fkCredentialImporter, 0);
  objc_storeStrong((id *)&self->_bankInformation, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
