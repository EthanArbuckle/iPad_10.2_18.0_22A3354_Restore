@implementation PKShareableCredentialsExpressPassSelectionViewController

- (PKShareableCredentialsExpressPassSelectionViewController)initWithPasses:(id)a3 groupsController:(id)a4 context:(int64_t)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKShareableCredentialsExpressPassSelectionViewController *v14;
  PKShareableCredentialsExpressPassSelectionViewController *v15;
  id v16;
  void *v17;
  uint64_t v18;
  PKGroupsController *groupsController;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKShareableCredentialsExpressPassSelectionViewController;
  v14 = -[PKPaymentSetupTableViewController initWithContext:](&v21, sel_initWithContext_, a5);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_passes, a3);
    objc_storeStrong((id *)&v15->_delegate, a6);
    if (v12)
    {
      objc_storeStrong((id *)&v15->_groupsController, a4);
    }
    else
    {
      v16 = objc_alloc(MEMORY[0x1E0D66DB8]);
      objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "initWithPassLibrary:", v17);
      groupsController = v15->_groupsController;
      v15->_groupsController = (PKGroupsController *)v18;

      -[PKGroupsController loadGroupsSynchronously](v15->_groupsController, "loadGroupsSynchronously");
    }
  }

  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PKTableHeaderView *v5;
  PKTableHeaderView *v6;
  PKTableHeaderView *tableHeader;
  void *v8;
  uint64_t v9;
  PKTableHeaderView *v10;
  uint64_t IsSetupAssistant;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  CGRect v24;

  v23.receiver = self;
  v23.super_class = (Class)PKShareableCredentialsExpressPassSelectionViewController;
  -[PKShareableCredentialsExpressPassSelectionViewController viewDidLoad](&v23, sel_viewDidLoad);
  -[PKShareableCredentialsExpressPassSelectionViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:animated:", 1, 0);

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsMultipleSelection:", 0);
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CellReuseIdentifier"));
  self->_hasSetDefault = 0;
  v5 = [PKTableHeaderView alloc];
  v6 = -[PKTableHeaderView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableHeader = self->_tableHeader;
  self->_tableHeader = v6;

  -[PKTableHeaderView setTopPadding:](self->_tableHeader, "setTopPadding:", 30.0);
  -[PKShareableCredentialsExpressPassSelectionViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  v10 = self->_tableHeader;
  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[PKPaymentSetupTableViewController context](self, "context");
    IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  }
  else
  {
    IsSetupAssistant = 0;
  }
  -[PKTableHeaderView setStyle:](v10, "setStyle:", IsSetupAssistant);
  -[PKTableHeaderView titleLabel](self->_tableHeader, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedShareableCredentialString(CFSTR("SELECT_EXPRESS_PASS_TITLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v13);

  -[PKTableHeaderView subtitleLabel](self->_tableHeader, "subtitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (PKPearlIsAvailable())
    v15 = CFSTR("SELECT_EXPRESS_PASS_DESCRIPTION_FACE_ID");
  else
    v15 = CFSTR("SELECT_EXPRESS_PASS_DESCRIPTION_TOUCH_ID");
  PKLocalizedShareableCredentialString(&v15->isa);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v16);

  objc_msgSend(v4, "setTableHeaderView:", self->_tableHeader);
  -[PKTableHeaderView sizeToFit](self->_tableHeader, "sizeToFit");
  -[PKTableHeaderView bounds](self->_tableHeader, "bounds");
  objc_msgSend(v4, "_tableHeaderHeightDidChangeToHeight:", CGRectGetHeight(v24));
  -[PKTableHeaderView setBottomPadding:](self->_tableHeader, "setBottomPadding:", 20.0);
  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "footerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setManualEntryButton:", 0);

  objc_msgSend(v17, "footerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSetupLaterButton:", 0);

  objc_msgSend(v17, "primaryButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel__done, 0x2000);

  objc_msgSend(v17, "primaryButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedShareableCredentialString(CFSTR("SELECT_EXPRESS_PASS_DONE"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTitle:forState:", v22, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKShareableCredentialsExpressPassSelectionViewController;
  -[PKPaymentSetupTableViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKProvisioningAnalyticsSessionUIReporter reportViewAppeared](self->_reporter, "reportViewAppeared");
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
  v8.super_class = (Class)PKShareableCredentialsExpressPassSelectionViewController;
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
  return -[NSArray count](self->_passes, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  PKPaymentCredentialTableViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PKPassView *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CellReuseIdentifier"), v7);
  v8 = (PKPaymentCredentialTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = -[PKPaymentCredentialTableViewCell initWithStyle:reuseIdentifier:]([PKPaymentCredentialTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("CellReuseIdentifier"));
  -[NSArray objectAtIndex:](self->_passes, "objectAtIndex:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_hasSetDefault)
  {
    self->_hasSetDefault = 1;
    -[PKPaymentCredentialTableViewCell setAccessoryType:](v8, "setAccessoryType:", 3);
    objc_storeStrong((id *)&self->_previouslySelectedIndexPath, a4);
    objc_storeStrong((id *)&self->_previouslySelectedPass, v9);
  }
  -[PKPaymentCredentialTableViewCell setSnapshotImageHasBorder:](v8, "setSnapshotImageHasBorder:", 0);
  -[PKPaymentCredentialTableViewCell textLabel](v8, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLineBreakMode:", 4);
  objc_msgSend(v9, "fieldForKey:", *MEMORY[0x1E0D6ADB0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v12);

  -[PKPaymentCredentialTableViewCell credentialDetailLabel](v8, "credentialDetailLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentCredentialTableViewCell detailTextLabelColor](v8, "detailTextLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v14);

  objc_msgSend(v9, "localizedDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v15);

  objc_msgSend(v13, "setLineBreakMode:", 4);
  v16 = -[PKPassView initWithPass:content:]([PKPassView alloc], "initWithPass:content:", v9, 5);
  +[PKPaymentCredentialTableViewCell defaultImageViewSize](PKPaymentCredentialTableViewCell, "defaultImageViewSize");
  -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v16, "snapshotOfFrontFaceWithRequestedSize:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentCredentialTableViewCell imageView](v8, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setImage:", v17);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentCredentialTableViewCell setBackgroundColor:](v8, "setBackgroundColor:", v19);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSIndexPath *v6;
  id v7;
  void *v8;
  void *v9;
  NSIndexPath *previouslySelectedIndexPath;
  NSIndexPath *v11;
  PKSecureElementPass *v12;
  PKSecureElementPass *previouslySelectedPass;
  objc_super v14;

  v6 = (NSIndexPath *)a4;
  v14.receiver = self;
  v14.super_class = (Class)PKShareableCredentialsExpressPassSelectionViewController;
  v7 = a3;
  -[PKPaymentSetupTableViewController tableView:didSelectRowAtIndexPath:](&v14, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  objc_msgSend(v7, "cellForRowAtIndexPath:", self->_previouslySelectedIndexPath, v14.receiver, v14.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessoryType:", 0);

  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAccessoryType:", 3);
  previouslySelectedIndexPath = self->_previouslySelectedIndexPath;
  self->_previouslySelectedIndexPath = v6;
  v11 = v6;

  -[NSArray objectAtIndex:](self->_passes, "objectAtIndex:", -[NSIndexPath row](v11, "row"));
  v12 = (PKSecureElementPass *)objc_claimAutoreleasedReturnValue();
  previouslySelectedPass = self->_previouslySelectedPass;
  self->_previouslySelectedPass = v12;

}

- (void)_done
{
  PKProvisioningAnalyticsSessionUIReporter *reporter;
  void *v4;
  PKGroupsController *groupsController;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  PKPaymentSetupViewControllerDelegate *delegate;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  reporter = self->_reporter;
  v13 = *MEMORY[0x1E0D69418];
  v14[0] = *MEMORY[0x1E0D69420];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProvisioningAnalyticsSessionUIReporter reportButtonPressed:context:](reporter, "reportButtonPressed:context:", 0, v4);

  -[PKGroupsController suppressRemoteUpdates:](self->_groupsController, "suppressRemoteUpdates:", 1);
  groupsController = self->_groupsController;
  -[PKSecureElementPass uniqueID](self->_previouslySelectedPass, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKGroupsController groupIndexForPassUniqueID:](groupsController, "groupIndexForPassUniqueID:", v6);

  -[PKGroupsController groupAtIndex:](self->_groupsController, "groupAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[PKGroupsController movePass:inGroup:toIndex:](self->_groupsController, "movePass:inGroup:toIndex:", self->_previouslySelectedPass, v8, 0);
  -[PKGroupsController enableRemoteUpdates](self->_groupsController, "enableRemoteUpdates");
  v9 = (void *)-[NSArray mutableCopy](self->_passes, "mutableCopy");
  v10 = v9;
  if (self->_previouslySelectedPass)
  {
    objc_msgSend(v9, "removeObject:");
    objc_msgSend(v10, "insertObject:atIndex:", self->_previouslySelectedPass, 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    v12 = (void *)objc_msgSend(v10, "copy");
    -[PKPaymentSetupViewControllerDelegate viewController:didFinishWithPasses:error:](delegate, "viewController:didFinishWithPasses:error:", self, v12, 0);

  }
}

- (void)_enableView:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setShowSpinner:", v3 ^ 1);
  objc_msgSend(v7, "setEnabled:", v3);

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
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_previouslySelectedPass, 0);
  objc_storeStrong((id *)&self->_previouslySelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_tableHeader, 0);
  objc_storeStrong((id *)&self->_groupsController, 0);
  objc_storeStrong((id *)&self->_passes, 0);
}

@end
