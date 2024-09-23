@implementation PKPeerPaymentAssociatedAccountReceiveRestrictionViewController

- (PKPeerPaymentAssociatedAccountReceiveRestrictionViewController)initWithPeerPaymentSetupFlowController:(id)a3
{
  id v5;
  PKPeerPaymentAssociatedAccountReceiveRestrictionViewController *v6;
  PKPeerPaymentAssociatedAccountReceiveRestrictionViewController *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *configuration;
  void *v12;
  uint64_t v13;
  PKFamilyMember *familyMember;
  uint64_t v15;
  PKPeerPaymentPreferences *currentPreferences;
  _BOOL8 v17;
  uint64_t v18;
  NSIndexPath *defaultSelectedIndexPath;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentAssociatedAccountReceiveRestrictionViewController;
  v6 = -[PKPaymentSetupTableViewController initWithContext:](&v21, sel_initWithContext_, objc_msgSend(v5, "context"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    objc_msgSend(v5, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "peerPaymentSetupConfigurationType");

    if (v9 == 1)
    {
      objc_msgSend(v5, "configuration");
      v10 = objc_claimAutoreleasedReturnValue();
      configuration = v7->_configuration;
      v7->_configuration = (PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *)v10;

      -[PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration associatedAccountSetupDelegate](v7->_configuration, "associatedAccountSetupDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v7->_delegate, v12);

      -[PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration familyMember](v7->_configuration, "familyMember");
      v13 = objc_claimAutoreleasedReturnValue();
      familyMember = v7->_familyMember;
      v7->_familyMember = (PKFamilyMember *)v13;

      -[PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration updatedPreferences](v7->_configuration, "updatedPreferences");
      v15 = objc_claimAutoreleasedReturnValue();
      currentPreferences = v7->_currentPreferences;
      v7->_currentPreferences = (PKPeerPaymentPreferences *)v15;

      v17 = (unint64_t)-[PKFamilyMember age](v7->_familyMember, "age") < 0xD;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v17, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      defaultSelectedIndexPath = v7->_defaultSelectedIndexPath;
      v7->_defaultSelectedIndexPath = (NSIndexPath *)v18;

    }
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  PKTableHeaderView *v4;
  PKTableHeaderView *v5;
  PKTableHeaderView *tableHeader;
  void *v7;
  uint64_t v8;
  PKTableHeaderView *v9;
  uint64_t IsSetupAssistant;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  CGRect v30;

  v29.receiver = self;
  v29.super_class = (Class)PKPeerPaymentAssociatedAccountReceiveRestrictionViewController;
  -[PKPeerPaymentAssociatedAccountReceiveRestrictionViewController viewDidLoad](&v29, sel_viewDidLoad);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsMultipleSelection:", 0);
  -[PKPeerPaymentAssociatedAccountReceiveRestrictionViewController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", v3, self->_defaultSelectedIndexPath);
  v4 = [PKTableHeaderView alloc];
  v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableHeader = self->_tableHeader;
  self->_tableHeader = v5;

  -[PKTableHeaderView setTopPadding:](self->_tableHeader, "setTopPadding:", 30.0);
  -[PKTableHeaderView setBottomPadding:](self->_tableHeader, "setBottomPadding:", 30.0);
  -[PKPeerPaymentAssociatedAccountReceiveRestrictionViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = self->_tableHeader;
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
  -[PKTableHeaderView titleLabel](self->_tableHeader, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedNearbyPeerPaymentString(CFSTR("PEER_PAYMENT_RECEIVE_RESTRICTIONS_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  -[PKTableHeaderView subtitleLabel](self->_tableHeader, "subtitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFamilyMember firstName](self->_familyMember, "firstName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedNearbyPeerPaymentString(CFSTR("PEER_PAYMENT_RECEIVE_RESTRICTIONS_DESCRIPTION"), CFSTR("%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v15);

  v16 = PKUIGetMinScreenWidthType();
  v17 = 37.0;
  if (v16 < 4)
    v17 = 26.0;
  if (!v16)
    v17 = 20.0;
  -[PKTableHeaderView setBottomPadding:](self->_tableHeader, "setBottomPadding:", v17);
  -[PKPaymentSetupTableViewController context](self, "context");
  if ((PKPaymentSetupContextIsBridge() & 1) == 0)
  {
    PKPassKitUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLForResource:withExtension:", CFSTR("AppleCashIcon"), CFSTR("pdf"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = PKUIScreenScale();
    PKUIImageFromPDF(v19, 80.0, 80.0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v21);
    objc_msgSend(v22, "setContentMode:", 1);
    objc_msgSend(v22, "setClipsToBounds:", 1);
    objc_msgSend(v22, "_setContinuousCornerRadius:", 20.0);
    -[PKTableHeaderView setImageView:](self->_tableHeader, "setImageView:", v22);

  }
  objc_msgSend(v3, "setTableHeaderView:", self->_tableHeader);
  -[PKTableHeaderView sizeToFit](self->_tableHeader, "sizeToFit");
  -[PKTableHeaderView bounds](self->_tableHeader, "bounds");
  objc_msgSend(v3, "_tableHeaderHeightDidChangeToHeight:", CGRectGetHeight(v30));
  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "footerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setManualEntryButton:", 0);

  objc_msgSend(v23, "footerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSetupLaterButton:", 0);

  objc_msgSend(v23, "primaryButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel__continue, 0x2000);

  objc_msgSend(v23, "primaryButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("CONTINUE"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTitle:forState:", v28, 0);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  PKTableHeaderView *tableHeader;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentAssociatedAccountReceiveRestrictionViewController;
  -[PKPaymentSetupTableViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  if (self->_cachedHeaderViewWidth != v4)
  {
    -[PKTableHeaderView sizeThatFits:](self->_tableHeader, "sizeThatFits:", v4, 1.79769313e308);
    v6 = v5;
    tableHeader = self->_tableHeader;
    objc_msgSend(v3, "_rectForTableHeaderView");
    -[PKTableHeaderView setFrame:](tableHeader, "setFrame:");
    objc_msgSend(v3, "setTableHeaderView:", 0);
    objc_msgSend(v3, "setTableHeaderView:", self->_tableHeader);
    self->_cachedHeaderViewWidth = v6;
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
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("CellReuseIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("CellReuseIdentifier"));
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAssociatedAccountReceiveRestrictionViewController _textLabelStringForIndexPath:](self, "_textLabelStringForIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  -[PKPaymentSetupTableViewController selectedIndexPath](self, "selectedIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = PKEqualObjects();

  if ((_DWORD)v8)
    v11 = 3;
  else
    v11 = 0;

  objc_msgSend(v7, "setAccessoryType:", v11);
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  unint64_t v7;
  NSIndexPath *v8;
  NSIndexPath *defaultSelectedIndexPath;
  id v10;
  id v11;
  objc_super v12;

  v6 = a3;
  v7 = (unint64_t)a4;
  -[PKPaymentSetupTableViewController selectedIndexPath](self, "selectedIndexPath");
  v8 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  defaultSelectedIndexPath = v8;
  if (!v8)
    defaultSelectedIndexPath = self->_defaultSelectedIndexPath;
  v10 = defaultSelectedIndexPath;

  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentAssociatedAccountReceiveRestrictionViewController;
  -[PKPaymentSetupTableViewController tableView:didSelectRowAtIndexPath:](&v12, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  if (v7 | (unint64_t)v10 && (PKEqualObjects() & 1) == 0)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v11, "safelyAddObject:", v10);
    objc_msgSend(v11, "safelyAddObject:", v7);
    objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v11, 100);

  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return (id)PKLocalizedNearbyPeerPaymentString(CFSTR("PEER_PAYMENT_RECEIVE_RESTRICTION_TABLE_FOOTER"));
}

- (void)_continue
{
  PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration *configuration;
  void *v4;
  void *v5;
  PKPeerPaymentAssociatedAccountActivationViewController *v6;

  configuration = self->_configuration;
  -[PKPeerPaymentAssociatedAccountReceiveRestrictionViewController _updatedPreferences](self, "_updatedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentSetupFlowControllerAssociatedAccountConfiguration setUpdatedPreferences:](configuration, "setUpdatedPreferences:", v4);

  v6 = -[PKPeerPaymentAssociatedAccountActivationViewController initWithPeerPaymentSetupFlowController:]([PKPeerPaymentAssociatedAccountActivationViewController alloc], "initWithPeerPaymentSetupFlowController:", self->_controller);
  -[PKPeerPaymentAssociatedAccountReceiveRestrictionViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_presentPaymentSetupViewController:animated:completion:", v6, 1, 0);

}

- (id)_updatedPreferences
{
  void *v3;
  void *v4;
  NSIndexPath *v5;
  NSIndexPath *defaultSelectedIndexPath;
  NSIndexPath *v7;
  uint64_t v8;
  uint64_t v9;

  -[PKFamilyMember altDSID](self->_familyMember, "altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[PKPeerPaymentPreferences copy](self->_currentPreferences, "copy");
  -[PKPaymentSetupTableViewController selectedIndexPath](self, "selectedIndexPath");
  v5 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  defaultSelectedIndexPath = v5;
  if (!v5)
    defaultSelectedIndexPath = self->_defaultSelectedIndexPath;
  v7 = defaultSelectedIndexPath;

  v8 = -[NSIndexPath row](v7, "row");
  if (!v8)
  {
    v9 = 1;
    goto LABEL_7;
  }
  if (v8 == 1)
  {
    v9 = 2;
LABEL_7:
    objc_msgSend(v4, "addReceiveRestrictionType:altDSID:", v9, v3);
  }

  return v4;
}

- (id)_textLabelStringForIndexPath:(id)a3
{
  uint64_t v3;
  __CFString *v4;
  void *v5;

  v3 = objc_msgSend(a3, "row");
  if (v3)
  {
    if (v3 != 1)
    {
      v5 = 0;
      return v5;
    }
    v4 = CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_RECEIVE_RESTRICTIONS_FAMILY");
  }
  else
  {
    v4 = CFSTR("PEER_PAYMENT_ASSOCIATED_ACCOUNT_RECEIVE_RESTRICTIONS_ANYONE");
  }
  PKLocalizedNearbyPeerPaymentString(&v4->isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableHeader, 0);
  objc_storeStrong((id *)&self->_defaultSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_currentPreferences, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
