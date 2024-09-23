@implementation PSKeychainSyncViewController

- (id)headerView
{
  PSKeychainSyncHeaderView *headerView;
  PSKeychainSyncHeaderView *v4;
  PSKeychainSyncHeaderView *v5;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = -[PSKeychainSyncHeaderView initWithSpecifier:]([PSKeychainSyncHeaderView alloc], "initWithSpecifier:", self->super.super._specifier);
    v5 = self->_headerView;
    self->_headerView = v4;

    headerView = self->_headerView;
  }
  return headerView;
}

- (id)groupSpecifier
{
  return self->_groupSpecifier;
}

- (id)specifiers
{
  NSArray *specifiers;
  PSSpecifier *v4;
  PSSpecifier *groupSpecifier;
  NSArray *v6;
  NSArray *v7;

  specifiers = self->super._specifiers;
  if (!specifiers)
  {
    +[PSSpecifier emptyGroupSpecifier](PSSpecifier, "emptyGroupSpecifier");
    v4 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    groupSpecifier = self->_groupSpecifier;
    self->_groupSpecifier = v4;

    v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", self->_groupSpecifier, 0);
    v7 = self->super._specifiers;
    self->super._specifiers = v6;

    specifiers = self->super._specifiers;
  }
  return specifiers;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunningInBuddy");

  if (v6)
  {
    -[PSKeychainSyncViewController headerView](self, "headerView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitleText:", v4);
  }
  else
  {
    -[PSKeychainSyncViewController navigationItem](self, "navigationItem");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v4);
  }

}

- (double)heightForHeaderInTableView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[PSKeychainSyncViewController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v5, "preferredHeightForWidth:inTableView:", v4, v6);
  v8 = v7;

  return v8;
}

- (KeychainSyncViewControllerDelegate)delegate
{
  return (KeychainSyncViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
