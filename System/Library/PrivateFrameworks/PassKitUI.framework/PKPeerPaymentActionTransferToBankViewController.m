@implementation PKPeerPaymentActionTransferToBankViewController

- (PKPeerPaymentActionTransferToBankViewController)initWithPaymentPass:(id)a3 webService:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6
{
  PKPeerPaymentActionTransferToBankViewController *v6;
  PKPeerPaymentActionTransferToBankViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSNumberFormatter *currencyFormatter;
  NSNumberFormatter *v13;
  NSNumberFormatter *percentageFormatter;
  uint64_t v15;
  PKPaymentPass *defaultInstantFundsOutPaymentPass;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  v6 = -[PKPeerPaymentActionViewController initWithPaymentPass:webService:passLibraryDataProvider:context:](&v22, sel_initWithPaymentPass_webService_passLibraryDataProvider_context_, a3, a4, a5, a6);
  v7 = v6;
  if (v6)
  {
    -[PKPeerPaymentActionViewController account](v6, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentBalance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currency");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKMutableNumberFormatterForCurrencyCode();
    v11 = objc_claimAutoreleasedReturnValue();
    currencyFormatter = v7->_currencyFormatter;
    v7->_currencyFormatter = (NSNumberFormatter *)v11;

    v13 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    percentageFormatter = v7->_percentageFormatter;
    v7->_percentageFormatter = v13;

    -[NSNumberFormatter setNumberStyle:](v7->_percentageFormatter, "setNumberStyle:", 3);
    -[NSNumberFormatter setMaximumFractionDigits:](v7->_percentageFormatter, "setMaximumFractionDigits:", 1);
    -[PKPeerPaymentActionTransferToBankViewController _defaultInstantFundsOutPaymentPass](v7, "_defaultInstantFundsOutPaymentPass");
    v15 = objc_claimAutoreleasedReturnValue();
    defaultInstantFundsOutPaymentPass = v7->_defaultInstantFundsOutPaymentPass;
    v7->_defaultInstantFundsOutPaymentPass = (PKPaymentPass *)v15;

    v7->_isSmallPhone = PKUIGetMinScreenWidthType() == 0;
    -[PKPeerPaymentActionViewController setControllerAction:](v7, "setControllerAction:", 0);
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v17, (UIContentSizeCategory)*MEMORY[0x1E0DC4918]) == NSOrderedDescending;

    -[PKPeerPaymentActionViewController setShowCancelButton:](v7, "setShowCancelButton:", 0);
    -[PKPeerPaymentActionTransferToBankViewController navigationItem](v7, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PERFORM_ACTION_TRANSFER_TO_BANK"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v19);

    -[PKPeerPaymentActionTransferToBankViewController _transferBarButton](v7, "_transferBarButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRightBarButtonItem:", v20);

    -[PKPeerPaymentActionTransferToBankViewController _updateBarButtonEnabledState](v7, "_updateBarButtonEnabledState");
    objc_msgSend(v18, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v18, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  -[PKPeerPaymentActionViewController dealloc](&v2, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  PKPassSnapshotter *v4;
  NSDecimalNumber *v5;
  void *v6;
  NSString *v7;
  void *v8;
  _BOOL4 v9;
  BOOL v10;
  UIImageView *v11;
  UIImageView *navbarPassView;
  void *v13;
  PKAnimatedNavigationBarTitleView *v14;
  PKAnimatedNavigationBarTitleView *passNavbarTitleView;
  void *v16;
  PKEnterCurrencyAmountPassTableHeaderFooterView *v17;
  void *v18;
  PKEnterCurrencyAmountPassTableHeaderFooterView *v19;
  PKEnterCurrencyAmountPassTableHeaderFooterView *tableHeaderView;
  id v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UITableView *v27;
  UITableView *tableView;
  UITableView *v29;
  void *v30;
  UITableView *v31;
  id v32;
  uint64_t v33;
  UILabel *v34;
  UILabel *footerTextLabel;
  UILabel *v36;
  void *v37;
  UILabel *v38;
  void *v39;
  _PKVisibilityBackdropView *v40;
  _PKVisibilityBackdropView *blurringView;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  -[PKPeerPaymentActionViewController loadView](&v47, sel_loadView);
  -[PKPeerPaymentActionViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PKPassSnapshotter);
  -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
  v5 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentBalance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currency");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PKPeerPaymentActionTransferToBankViewController _passViewInNavBar](self, "_passViewInNavBar");
  v10 = v9;
  if (v9)
  {
    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    navbarPassView = self->_navbarPassView;
    self->_navbarPassView = v11;

    -[UIImageView setContentMode:](self->_navbarPassView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIgnoresInvertColors:](self->_navbarPassView, "setAccessibilityIgnoresInvertColors:", 1);
    -[PKPeerPaymentActionViewController pass](self, "pass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __59__PKPeerPaymentActionTransferToBankViewController_loadView__block_invoke;
    v46[3] = &unk_1E3E613B0;
    v46[4] = self;
    -[PKPassSnapshotter snapshotWithPass:size:completion:](v4, "snapshotWithPass:size:completion:", v13, v46, 55.0, 55.0);

    v14 = objc_alloc_init(PKAnimatedNavigationBarTitleView);
    passNavbarTitleView = self->_passNavbarTitleView;
    self->_passNavbarTitleView = v14;

    -[PKPeerPaymentActionTransferToBankViewController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pkui_setCenterAlignedTitleView:", self->_passNavbarTitleView);

    v17 = [PKEnterCurrencyAmountPassTableHeaderFooterView alloc];
    v18 = 0;
  }
  else
  {
    v17 = [PKEnterCurrencyAmountPassTableHeaderFooterView alloc];
    -[PKPeerPaymentActionViewController pass](self, "pass");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = -[PKEnterCurrencyAmountPassTableHeaderFooterView initWithCurrenyAmount:pass:](v17, "initWithCurrenyAmount:pass:", v8, v18, v4);
  tableHeaderView = self->_tableHeaderView;
  self->_tableHeaderView = v19;

  if (!v10)
  -[PKEnterCurrencyAmountPassTableHeaderFooterView setDelegate:](self->_tableHeaderView, "setDelegate:", self);
  v21 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v22 = objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1);
  v23 = *MEMORY[0x1E0C9D648];
  v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v25 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v26 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v27 = (UITableView *)objc_msgSend(v21, "initWithFrame:style:", v22, *MEMORY[0x1E0C9D648], v24, v25, v26);
  tableView = self->_tableView;
  self->_tableView = v27;

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  v29 = self->_tableView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](v29, "setBackgroundColor:", v30);

  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  -[UITableView setTableHeaderView:](self->_tableView, "setTableHeaderView:", self->_tableHeaderView);
  -[UITableView _setDrawsSeparatorAtTopOfSections:](self->_tableView, "_setDrawsSeparatorAtTopOfSections:", 1);
  -[UITableView _setDrawsTopShadowInGroupedSections:](self->_tableView, "_setDrawsTopShadowInGroupedSections:", 1);
  v31 = self->_tableView;
  v32 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[UITableView setTableFooterView:](v31, "setTableFooterView:", v32);

  v33 = *MEMORY[0x1E0D68160];
  -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68160]);
  v34 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v23, v24, v25, v26);
  footerTextLabel = self->_footerTextLabel;
  self->_footerTextLabel = v34;

  -[UILabel setLineBreakMode:](self->_footerTextLabel, "setLineBreakMode:", 0);
  -[UILabel setTextAlignment:](self->_footerTextLabel, "setTextAlignment:", 4);
  -[UILabel setNumberOfLines:](self->_footerTextLabel, "setNumberOfLines:", 0);
  v36 = self->_footerTextLabel;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A98], (NSString *)*MEMORY[0x1E0DC48D0]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v36, "setFont:", v37);

  v38 = self->_footerTextLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v38, "setTextColor:", v39);

  -[UILabel setAccessibilityIdentifier:](self->_footerTextLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C18]);
  -[PKPeerPaymentActionTransferToBankViewController _updateFooterText](self, "_updateFooterText");
  v40 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:]([_PKVisibilityBackdropView alloc], "initWithFrame:privateStyle:", -2, v23, v24, v25, v26);
  blurringView = self->_blurringView;
  self->_blurringView = v40;

  -[_PKVisibilityBackdropView setDelegate:](self->_blurringView, "setDelegate:", self);
  -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0, self->_backdropWeight);
  -[_PKVisibilityBackdropView setUserInteractionEnabled:](self->_blurringView, "setUserInteractionEnabled:", 1);
  -[_UIBackdropView contentView](self->_blurringView, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addSubview:", self->_footerTextLabel);

  -[PKPeerPaymentActionTransferToBankViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addSubview:", self->_tableView);
  objc_msgSend(v43, "addSubview:", self->_blurringView);
  -[PKPeerPaymentActionTransferToBankViewController updateAccountValues](self, "updateAccountValues");
  -[PKPeerPaymentActionTransferToBankViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setAccessibilityIdentifier:", v33);

}

void __59__PKPeerPaymentActionTransferToBankViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PKPeerPaymentActionTransferToBankViewController_loadView__block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __59__PKPeerPaymentActionTransferToBankViewController_loadView__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "setImage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "setTitleView:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1136), 0);
  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  UITableView *tableView;
  void *v45;
  double v46;
  double v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;

  v48.receiver = self;
  v48.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  -[PKPeerPaymentActionTransferToBankViewController viewWillLayoutSubviews](&v48, sel_viewWillLayoutSubviews);
  -[PKPeerPaymentActionTransferToBankViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (-[PKPeerPaymentActionTransferToBankViewController _passViewInNavBar](self, "_passViewInNavBar"))
  {
    -[PKPeerPaymentActionTransferToBankViewController navigationController](self, "navigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "navigationBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "frame");
    -[PKAnimatedNavigationBarTitleView setFrame:](self->_passNavbarTitleView, "setFrame:", 0.0, 0.0, v22 + v22);

  }
  v23 = v7 + v13;
  v24 = v5 + v15;
  v25 = v17 - (v7 + v11);
  v26 = v19 - (v5 + v9);
  -[UITableView setFrame:](self->_tableView, "setFrame:", v23, v24, v25, v26);
  -[PKPeerPaymentActionTransferToBankViewController _updateTableHeaderHeight](self, "_updateTableHeaderHeight");
  -[_PKVisibilityBackdropView frame](self->_blurringView, "frame");
  PKRectCenteredXInRect();
  v46 = v27;
  v47 = v28;
  -[UITableView _sectionContentInset](self->_tableView, "_sectionContentInset");
  v31 = v29 + v30;
  v32 = PKTableViewCellTextInset();
  v33 = v32 + v32;
  -[UITableView frame](self->_tableView, "frame");
  v34 = CGRectGetWidth(v49) - v31 - v33;
  -[UILabel frame](self->_footerTextLabel, "frame");
  -[UILabel sizeThatFits:](self->_footerTextLabel, "sizeThatFits:", v34, 1.79769313e308);
  v36 = v9 + v35 + 24.0;
  v50.origin.x = v23;
  v50.origin.y = v24;
  v50.size.width = v25;
  v50.size.height = v26;
  -[_PKVisibilityBackdropView setFrame:](self->_blurringView, "setFrame:", v46, CGRectGetMaxY(v50) - v36, v47, v36);
  -[_PKVisibilityBackdropView layoutIfNeeded](self->_blurringView, "layoutIfNeeded");
  -[_UIBackdropView contentView](self->_blurringView, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bounds");

  PKRectCenteredXInRect();
  -[UILabel setFrame:](self->_footerTextLabel, "setFrame:");
  -[UITableView contentInset](self->_tableView, "contentInset");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  -[UITableView setContentInset:](self->_tableView, "setContentInset:");
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", v39, v41, v36, v43);
  tableView = self->_tableView;
  -[PKPeerPaymentActionTransferToBankViewController navigationItem](self, "navigationItem");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:](tableView, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v45);

  -[PKPeerPaymentActionTransferToBankViewController _calculateBlur](self, "_calculateBlur");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  PKPeerPaymentActionTransferToBankCell *v7;
  unint64_t v8;
  NSArray *supportedTransferActions;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  PKPaymentPass *defaultInstantFundsOutPaymentPass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKPeerPaymentActionTransferToBankCellReuseIdentifier"));
  v7 = (PKPeerPaymentActionTransferToBankCell *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKPeerPaymentActionViewController controllerAction](self, "controllerAction");
  supportedTransferActions = self->_supportedTransferActions;
  v10 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndex:](supportedTransferActions, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  if (!v7)
    v7 = -[PKPeerPaymentActionTransferToBankCell initWithReuseIdentifier:]([PKPeerPaymentActionTransferToBankCell alloc], "initWithReuseIdentifier:", CFSTR("PKPeerPaymentActionTransferToBankCellReuseIdentifier"));
  if (v12 == 3)
  {
    -[PKPeerPaymentActionViewController actionController](self, "actionController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bankInformation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "isValid"))
    {
      objc_msgSend(v17, "bankName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB3940];
      PKPANMask();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "accountSuffix");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ %@"), v19, v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_ACCOUNT_CELL_ADD_BANK_ACCOUNT"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
    }
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_ACCOUNT_TRANSFER_TIME"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_ACCOUNT_CELL_FEE");
    goto LABEL_16;
  }
  if (v12 == 2)
  {
    defaultInstantFundsOutPaymentPass = self->_defaultInstantFundsOutPaymentPass;
    if (defaultInstantFundsOutPaymentPass)
    {
      -[PKPaymentPass organizationName](defaultInstantFundsOutPaymentPass, "organizationName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PKSanitizedPrimaryAccountRepresentationForPass();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_DEBIT_CARD_CELL_ADD_DEBIT_CARD"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
    }
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_DEBIT_CARD_CELL_TRANSFER_TIME"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankViewController _calculateFee](self, "_calculateFee");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[NSNumberFormatter stringFromNumber:](self->_currencyFormatter, "stringFromNumber:", v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_DEBIT_CARD_CELL_FEE"), CFSTR("%@"), v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
      goto LABEL_18;
    }
    v23 = CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_DEBIT_CARD_CELL_FEE_DEFAULT");
LABEL_16:
    PKLocalizedPeerPaymentString(&v23->isa);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v14 = 0;
  v15 = 0;
  v21 = 0;
  v22 = 0;
LABEL_18:
  if (objc_msgSend(v15, "length") && objc_msgSend(v21, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v15, v21);
    v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
    v26 = v25;

    v15 = v26;
    goto LABEL_24;
  }
  if (objc_msgSend(v21, "length"))
  {
    v25 = v21;
    goto LABEL_23;
  }
LABEL_24:
  -[PKPeerPaymentActionTransferToBankCell setTitleText:](v7, "setTitleText:", v14);
  -[PKPeerPaymentActionTransferToBankCell setSubtitleText:](v7, "setSubtitleText:", v15);
  -[PKPeerPaymentActionTransferToBankCell setFeeText:](v7, "setFeeText:", v22);
  -[PKPeerPaymentActionTransferToBankCell setShowCheckmark:](v7, "setShowCheckmark:", v12 == v8);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionTransferToBankCell setBackgroundColor:](v7, "setBackgroundColor:", v27);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[NSArray objectAtIndex:](self->_supportedTransferActions, "objectAtIndex:", objc_msgSend(v6, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = -[PKPeerPaymentActionViewController controllerAction](self, "controllerAction");
  -[PKPeerPaymentActionViewController actionController](self, "actionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v9)
  {
    -[PKPeerPaymentActionTransferToBankViewController _indexPathForAction:](self, "_indexPathForAction:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankViewController _indexPathForAction:](self, "_indexPathForAction:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setControllerAction:", v8);
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v13, "safelyAddObject:", v11);
    objc_msgSend(v13, "safelyAddObject:", v12);
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v18, "reloadRowsAtIndexPaths:withRowAnimation:", v14, 100);

  }
  objc_msgSend(v18, "deselectRowAtIndexPath:animated:", v6, 1);
  -[PKPeerPaymentActionTransferToBankViewController _updateBarButtonEnabledState](self, "_updateBarButtonEnabledState");
  if (v8 == 3)
  {
    objc_msgSend(v10, "bankInformation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isValid");

    if ((v17 & 1) == 0)
    {
      -[PKPeerPaymentActionViewController actionController](self, "actionController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "presentAddBankAccountViewController");
      goto LABEL_9;
    }
  }
  else if (v8 == 2 && !self->_defaultInstantFundsOutPaymentPass)
  {
    -[PKPeerPaymentActionViewController actionController](self, "actionController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentAddDebitCardViewController");
LABEL_9:

  }
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_supportedTransferActions, "count", a3, a4);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;

  if (self->_blurringView)
    -[PKPeerPaymentActionTransferToBankViewController _calculateBlur](self, "_calculateBlur", a3);
  -[PKPeerPaymentActionTransferToBankViewController view](self, "view", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  id v5;
  int64_t v6;

  v5 = a4;
  if ((PKPaymentSetupForceBridgeAppearance() & 1) != 0
    || (-[PKPeerPaymentActionViewController context](self, "context"), (PKPaymentSetupContextIsBridge() & 1) != 0))
  {
    v6 = 2030;
  }
  else if (objc_msgSend(v5, "userInterfaceStyle") == 2)
  {
    v6 = 2030;
  }
  else
  {
    v6 = 2010;
  }

  return v6;
}

- (void)peerPaymentActionController:(id)a3 hasChangedState:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  UITableView *tableView;
  void *v10;
  void *v11;
  void **v12;
  void *v13;
  char v14;
  void *v15;
  objc_super v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  -[PKPeerPaymentActionViewController peerPaymentActionController:hasChangedState:](&v16, sel_peerPaymentActionController_hasChangedState_, a3);
  switch(a4)
  {
    case 1uLL:
      -[PKPeerPaymentActionTransferToBankViewController navigationController](self, "navigationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

      -[PKPeerPaymentActionTransferToBankViewController _showNavigationBarSpinner:](self, "_showNavigationBarSpinner:", 0);
LABEL_6:
      -[PKPeerPaymentActionTransferToBankViewController _showNavigationBarSpinner:](self, "_showNavigationBarSpinner:", 0);
      -[PKPeerPaymentActionViewController actionController](self, "actionController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "controllerAction");
      if (v8 == 3)
      {
        objc_msgSend(v7, "bankInformation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isValid");

        if ((v14 & 1) != 0)
        {
LABEL_13:
          -[PKPeerPaymentActionTransferToBankViewController _updateBarButtonEnabledState](self, "_updateBarButtonEnabledState");

          return;
        }
        objc_msgSend(v7, "setControllerAction:", 0);
        tableView = self->_tableView;
        -[PKPeerPaymentActionTransferToBankViewController _indexPathForAction:](self, "_indexPathForAction:", 3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v10;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v17;
      }
      else
      {
        if (v8 != 2 || self->_defaultInstantFundsOutPaymentPass)
          goto LABEL_13;
        objc_msgSend(v7, "setControllerAction:", 0);
        tableView = self->_tableView;
        -[PKPeerPaymentActionTransferToBankViewController _indexPathForAction:](self, "_indexPathForAction:", 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v10;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = (void **)v18;
      }
      objc_msgSend(v11, "arrayWithObjects:count:", v12, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v15, 0);

      goto LABEL_13;
    case 5uLL:
      goto LABEL_6;
    case 2uLL:
      -[PKPeerPaymentActionTransferToBankViewController _showNavigationBarSpinner:](self, "_showNavigationBarSpinner:", 0);
      break;
  }
}

- (id)presentationSceneIdentifierForPeerPaymentActionController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPeerPaymentActionTransferToBankViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateAccountValues
{
  void *v3;
  PKPaymentPass *v4;
  PKPaymentPass *defaultInstantFundsOutPaymentPass;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSDecimalNumber *v10;
  NSDecimalNumber *feePercentage;
  NSDecimalNumber *v12;
  NSDecimalNumber *minimumFee;
  NSDecimalNumber *v14;
  NSDecimalNumber *maximumFee;
  NSArray *v16;
  NSArray *supportedTransferActions;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  -[PKPeerPaymentActionViewController updateAccountValues](&v36, sel_updateAccountValues);
  -[PKPeerPaymentActionViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionTransferToBankViewController _defaultInstantFundsOutPaymentPass](self, "_defaultInstantFundsOutPaymentPass");
  v4 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue();
  defaultInstantFundsOutPaymentPass = self->_defaultInstantFundsOutPaymentPass;
  self->_defaultInstantFundsOutPaymentPass = v4;

  if (v3)
  {
    objc_msgSend(v3, "currentBalance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "amount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankViewController setMaxBalance:](self, "setMaxBalance:", v7);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v3, "supportsInstantWithdrawal"))
    {
      objc_msgSend(v8, "addObject:", &unk_1E3FADBD0);
      objc_msgSend(v3, "instantWithdrawalPromotionFeatureDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "feePercentage");
      v10 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      feePercentage = self->_feePercentage;
      self->_feePercentage = v10;

      objc_msgSend(v9, "minimumFee");
      v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      minimumFee = self->_minimumFee;
      self->_minimumFee = v12;

      objc_msgSend(v9, "maximumFee");
      v14 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      maximumFee = self->_maximumFee;
      self->_maximumFee = v14;

    }
    if (objc_msgSend(v3, "supportsTransferToBank"))
      objc_msgSend(v8, "addObject:", &unk_1E3FADBE8);
    v16 = (NSArray *)objc_msgSend(v8, "copy");
    supportedTransferActions = self->_supportedTransferActions;
    self->_supportedTransferActions = v16;

    if (-[NSArray count](self->_supportedTransferActions, "count") != 1)
      goto LABEL_12;
    -[PKPeerPaymentActionViewController actionController](self, "actionController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndex:](self->_supportedTransferActions, "objectAtIndex:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "integerValue");

    if (v20 == 3)
    {
      objc_msgSend(v18, "bankInformation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isValid");

      if (!v35)
        goto LABEL_11;
    }
    else if (v20 != 2 || !self->_defaultInstantFundsOutPaymentPass)
    {
      goto LABEL_11;
    }
    objc_msgSend(v18, "setControllerAction:", v20);
LABEL_11:

LABEL_12:
    -[PKPeerPaymentActionTransferToBankViewController _amountPassView](self, "_amountPassView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "enterCurrencyAmountView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "currentBalance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "currency");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCurrency:", v24);

    objc_msgSend(v22, "sizeToFit");
    -[PKPeerPaymentActionTransferToBankViewController _amountPassView](self, "_amountPassView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "balanceView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "currency");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCurrencyCode:", v27);

    -[PKPeerPaymentActionViewController maxLoadAmount](self, "maxLoadAmount");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMaxLoadAmount:", v28);

    -[PKPeerPaymentActionViewController minLoadAmount](self, "minLoadAmount");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMinLoadAmount:", v29);

    objc_msgSend(v26, "setMaxBalance:", v7);
    -[PKPeerPaymentActionViewController minBalance](self, "minBalance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMinBalance:", v30);

    objc_msgSend(v6, "amount");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCardBalance:", v31);

    objc_msgSend(v26, "sizeToFit");
    -[PKPeerPaymentActionTransferToBankViewController _updateFooterText](self, "_updateFooterText");
    -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v32, 1);

    -[PKPeerPaymentActionTransferToBankViewController viewIfLoaded](self, "viewIfLoaded");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setNeedsLayout");

  }
  -[UITableView reloadData](self->_tableView, "reloadData");
  -[PKPeerPaymentActionTransferToBankViewController _updateBarButtonEnabledState](self, "_updateBarButtonEnabledState");

}

- (void)enterCurrencyAmountPassViewDidLoadPassSnapshot:(id)a3
{
  id v4;

  -[PKPeerPaymentActionTransferToBankViewController _updateTableHeaderHeight](self, "_updateTableHeaderHeight", a3);
  -[PKPeerPaymentActionTransferToBankViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)setMaxBalance:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[PKPeerPaymentActionViewController maxBalance](self, "maxBalance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  -[PKPeerPaymentActionViewController setMaxBalance:](&v9, sel_setMaxBalance_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKPeerPaymentActionTransferToBankViewController _amountPassView](self, "_amountPassView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "balanceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaxBalance:", v4);

    -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v8, 1);

  }
}

- (void)setMinBalance:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[PKPeerPaymentActionViewController minBalance](self, "minBalance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  -[PKPeerPaymentActionViewController setMinBalance:](&v9, sel_setMinBalance_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKPeerPaymentActionTransferToBankViewController _amountPassView](self, "_amountPassView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "balanceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMinBalance:", v4);

    -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v8, 1);

  }
}

- (void)setMaxLoadAmount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[PKPeerPaymentActionViewController maxLoadAmount](self, "maxLoadAmount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  -[PKPeerPaymentActionViewController setMaxLoadAmount:](&v9, sel_setMaxLoadAmount_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKPeerPaymentActionTransferToBankViewController _amountPassView](self, "_amountPassView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "balanceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaxLoadAmount:", v4);

    -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v8, 1);

  }
}

- (void)setMinLoadAmount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[PKPeerPaymentActionViewController minLoadAmount](self, "minLoadAmount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  -[PKPeerPaymentActionViewController setMinLoadAmount:](&v9, sel_setMinLoadAmount_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKPeerPaymentActionTransferToBankViewController _amountPassView](self, "_amountPassView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "balanceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMinLoadAmount:", v4);

    -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v8, 1);

  }
}

- (void)setCardBalance:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[PKPeerPaymentActionViewController cardBalance](self, "cardBalance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentActionTransferToBankViewController;
  -[PKPeerPaymentActionViewController setCardBalance:](&v9, sel_setCardBalance_, v4);
  if (v5 != v4 && (objc_msgSend(v4, "isEqualToNumber:", v5) & 1) == 0)
  {
    -[PKPeerPaymentActionTransferToBankViewController _amountPassView](self, "_amountPassView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "balanceView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCardBalance:", v4);

    -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentActionTransferToBankViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v8, 1);

  }
}

- (id)_transferBarButton
{
  void *v3;
  void *v4;

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_PERFORM_ACTION_NEXT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v3, 2, self, sel__transferBarButtonPressed_);
  objc_msgSend(v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68158]);

  return v4;
}

- (id)_spinnerBarButton
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v2);
  objc_msgSend(v2, "startAnimating");

  return v3;
}

- (void)_updateBarButtonEnabledState
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  id v11;

  -[PKPeerPaymentActionTransferToBankViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPeerPaymentActionViewController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[PKPeerPaymentActionTransferToBankViewController _isCurrentAmountValid](self, "_isCurrentAmountValid");
    v6 = -[PKPeerPaymentActionViewController controllerAction](self, "controllerAction");
    if (v6 == 2)
    {
      v9 = self->_defaultInstantFundsOutPaymentPass != 0;
    }
    else if (v6 == 3)
    {
      -[PKPeerPaymentActionViewController actionController](self, "actionController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bankInformation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isValid");

    }
    else
    {
      v9 = 0;
    }
    v10 = v5 & v9;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v11, "setEnabled:", v10);

}

- (void)_transferBarButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PKPeerPaymentActionTransferToBankViewController _showNavigationBarSpinner:](self, "_showNavigationBarSpinner:", 1);
  -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentBalance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", v9, v6, 0);
  -[PKPeerPaymentActionViewController actionController](self, "actionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performActionWithCurrencyAmount:", v7);

}

- (void)_updateCurrentAmount:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  -[PKPeerPaymentActionViewController setCurrentAmount:](self, "setCurrentAmount:", v6);
  -[PKPeerPaymentActionTransferToBankViewController _amountPassView](self, "_amountPassView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "balanceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subtractAmountFromBalance:", v6);

  objc_msgSend(v9, "enterCurrencyAmountView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrentAmount:", v6);

  -[PKPeerPaymentActionTransferToBankViewController _currentAmountDidChangeTo:shouldGenerateNewSuggestions:](self, "_currentAmountDidChangeTo:shouldGenerateNewSuggestions:", v6, v4);
}

- (void)_currentAmountDidChangeTo:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  id v5;

  -[PKPeerPaymentActionTransferToBankViewController _updateBarButtonEnabledState](self, "_updateBarButtonEnabledState", a3, a4);
  -[PKPeerPaymentActionTransferToBankViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (BOOL)_isCurrentAmountValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  char v14;

  -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController cardBalance](self, "cardBalance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController minBalance](self, "minBalance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController maxBalance](self, "maxBalance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController minLoadAmount](self, "minLoadAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentActionViewController maxLoadAmount](self, "maxLoadAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decimalNumberBySubtracting:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "isEqualToNumber:", v10);

  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v3, "compare:", v12);

  if (!v13
    || v8 && objc_msgSend(v8, "compare:", v3) == -1
    || v7 && objc_msgSend(v7, "compare:", v3) == 1
    || v5 && objc_msgSend(v5, "compare:", v9) == 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = v11 ^ 1;
    if (v6 && objc_msgSend(v6, "compare:", v9) == -1)
      v14 = 0;
  }

  return v14;
}

- (void)_calculateBlur
{
  UITableView *tableView;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;

  tableView = self->_tableView;
  -[_PKVisibilityBackdropView bounds](self->_blurringView, "bounds");
  -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", self->_blurringView);
  v5 = v4;
  -[UITableView bounds](self->_tableView, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UITableView contentSize](self->_tableView, "contentSize");
  v16.size.height = fmin(v13, v14 - v9);
  v16.origin.x = v7;
  v16.origin.y = v9;
  v16.size.width = v11;
  v15 = fmin(fmax(CGRectGetMaxY(v16) - v5, 0.0), 30.0) / 30.0;
  if (self->_backdropWeight != v15)
  {
    self->_backdropWeight = v15;
    -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0);
  }
}

- (BOOL)_passViewInNavBar
{
  return self->_isSmallPhone || self->_usesAccessibilityLayout;
}

- (id)_indexPathForAction:(unint64_t)a3
{
  NSArray *supportedTransferActions;
  void *v4;
  uint64_t v5;
  void *v6;

  supportedTransferActions = self->_supportedTransferActions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray indexOfObject:](supportedTransferActions, "indexOfObject:", v4);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_calculateFee
{
  void *v3;
  void *v4;
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;

  if (self->_feePercentage)
  {
    -[PKPeerPaymentActionViewController currentAmount](self, "currentAmount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyDecimalAmountMultiplyAndRound();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_maximumFee && objc_msgSend(v4, "compare:") == 1)
    {
      v5 = self->_maximumFee;

      v4 = v5;
    }
    if (self->_minimumFee && objc_msgSend(v4, "compare:") == -1)
    {
      v6 = self->_minimumFee;

      v4 = v6;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_updateTableHeaderHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  PKEnterCurrencyAmountPassTableHeaderFooterView *tableHeaderView;
  id v14;

  -[UITableView bounds](self->_tableView, "bounds");
  v4 = v3;
  -[PKEnterCurrencyAmountPassTableHeaderFooterView frame](self->_tableHeaderView, "frame");
  v6 = v5;
  v8 = v7;
  -[PKEnterCurrencyAmountPassTableHeaderFooterView sizeThatFits:](self->_tableHeaderView, "sizeThatFits:", v4, 1.79769313e308);
  if (v6 != v10 || v8 != v9)
  {
    v12 = v9;
    tableHeaderView = self->_tableHeaderView;
    -[UITableView _rectForTableHeaderView](self->_tableView, "_rectForTableHeaderView");
    -[PKEnterCurrencyAmountPassTableHeaderFooterView setBounds:](tableHeaderView, "setBounds:");
    -[UITableView _tableHeaderHeightDidChangeToHeight:](self->_tableView, "_tableHeaderHeightDidChangeToHeight:", v12);
    -[PKPeerPaymentActionTransferToBankViewController viewIfLoaded](self, "viewIfLoaded");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

  }
}

- (id)_amountPassView
{
  return -[PKEnterCurrencyAmountPassTableHeaderFooterView amountPassView](self->_tableHeaderView, "amountPassView");
}

- (void)_updateFooterText
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSDecimalNumber *minimumFee;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  -[PKPeerPaymentActionViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsInstantWithdrawal");

  if (v4)
  {
    -[NSNumberFormatter stringFromNumber:](self->_percentageFormatter, "stringFromNumber:", self->_feePercentage);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](self->_currencyFormatter, "stringFromNumber:", self->_maximumFee);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](self->_currencyFormatter, "stringFromNumber:", self->_minimumFee);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (!self->_feePercentage)
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_FOOTER_TEXT_SUPPORTS_INSTANT_TRANSFER"));
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v16 = (id)v11;

      v10 = (uint64_t)v16;
      goto LABEL_15;
    }
    minimumFee = self->_minimumFee;
    if (self->_maximumFee)
    {
      if (minimumFee)
      {
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_FOOTER_TEXT_SUPPORTS_INSTANT_TRANSFER_FEE_WITH_MINIMUM_AND_MAXIMUM"), CFSTR("%@%@%@"), v5, v7, v6);
LABEL_13:
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      v14 = v5;
      v15 = v6;
      v12 = CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_FOOTER_TEXT_SUPPORTS_INSTANT_TRANSFER_FEE_WITH_MAXIMUM");
    }
    else
    {
      if (!minimumFee)
      {
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_FOOTER_TEXT_SUPPORTS_INSTANT_TRANSFER_FEE"), CFSTR("%@"), v5);
        goto LABEL_13;
      }
      v14 = v5;
      v15 = (void *)v7;
      v12 = CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_FOOTER_TEXT_SUPPORTS_INSTANT_TRANSFER_FEE_WITH_MINIMUM");
    }
    PKLocalizedPeerPaymentString(&v12->isa, CFSTR("%@%@"), v14, v15);
    goto LABEL_13;
  }
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_TRANSFER_TO_BANK_FOOTER_TEXT_DEFAULT"));
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v17 = (id)v10;
  -[UILabel setText:](self->_footerTextLabel, "setText:", v10);
  -[PKPeerPaymentActionTransferToBankViewController viewIfLoaded](self, "viewIfLoaded");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNeedsLayout");

}

- (id)_defaultInstantFundsOutPaymentPass
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  -[PKPeerPaymentActionViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsInstantWithdrawal");

  if (v4)
  {
    -[PKPeerPaymentActionViewController account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "instantWithdrawalPromotionFeatureDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0D67460]);
    objc_msgSend(v6, "supportedNetworks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSupportedNetworks:", v8);

    objc_msgSend(v7, "setSupportsInstantFundsIn:", 1);
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_defaultPaymentPassForPaymentRequest:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)_dismissViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v6, "presentingViewController");
  else
    -[PKPeerPaymentActionTransferToBankViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_showNavigationBarSpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  v3 = a3;
  -[PKPeerPaymentActionTransferToBankViewController _amountPassView](self, "_amountPassView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterCurrencyAmountView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = !v3;
  objc_msgSend(v6, "setEnabled:", !v3);

  -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", !v3);
  -[PKPeerPaymentActionTransferToBankViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[PKPeerPaymentActionTransferToBankViewController _transferBarButton](self, "_transferBarButton");
  else
    -[PKPeerPaymentActionTransferToBankViewController _spinnerBarButton](self, "_spinnerBarButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v9);

  -[PKPeerPaymentActionTransferToBankViewController _updateBarButtonEnabledState](self, "_updateBarButtonEnabledState");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumFee, 0);
  objc_storeStrong((id *)&self->_minimumFee, 0);
  objc_storeStrong((id *)&self->_feePercentage, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_footerTextLabel, 0);
  objc_storeStrong((id *)&self->_blurringView, 0);
  objc_storeStrong((id *)&self->_navbarPassView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_passNavbarTitleView, 0);
  objc_storeStrong((id *)&self->_defaultInstantFundsOutPaymentPass, 0);
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
  objc_storeStrong((id *)&self->_currencyFormatter, 0);
  objc_storeStrong((id *)&self->_supportedTransferActions, 0);
}

@end
