@implementation AccountListController

- (AccountListController)initWithScene:(id)a3
{
  id v4;
  AccountListController *v5;
  AccountListController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AccountListController;
  v5 = -[AccountListController initWithStyle:](&v8, "initWithStyle:", 0);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_scene, v4);

  return v6;
}

- (id)accounts
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountsProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "orderedAccounts"));

  return v4;
}

- (BOOL)containsMultipleAccounts
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AccountListController accounts](self, "accounts"));
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (void)selectAccount:(id)a3 mailbox:(id)a4
{
  MailAccount *v6;
  MailAccount *v7;
  id WeakRetained;
  MailAccount *v9;

  v9 = (MailAccount *)a3;
  v6 = (MailAccount *)objc_claimAutoreleasedReturnValue(+[LocalAccount localAccount](LocalAccount, "localAccount"));

  v7 = v9;
  if (v6 != v9)
  {
    if (self->_selectedAccount != v9)
      objc_storeStrong((id *)&self->_selectedAccount, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_accountListDelegate);
    objc_msgSend(WeakRetained, "accountList:didSelectAccount:", self, self->_selectedAccount);

    v7 = v9;
  }

}

- (void)cancelButtonClicked
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_accountListDelegate);
  objc_msgSend(WeakRetained, "accountList:didCancel:", self, 1);

}

- (BOOL)canDismiss
{
  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AccountListController;
  -[AccountListController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ACCOUNTS"), &stru_100531B00, CFSTR("Main")));
  -[AccountListController setTitle:](self, "setTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccountListController tableView](self, "tableView"));
  +[MailboxTableCell defaultRowHeight](MailboxTableCell, "defaultRowHeight");
  objc_msgSend(v5, "setEstimatedRowHeight:");
  objc_msgSend(v5, "setSeparatorStyle:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "setContentInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  objc_msgSend(v5, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMoveMessageViewAccountsTable);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AccountListController;
  -[AccountListController viewWillAppear:](&v10, "viewWillAppear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccountListController _indexPathForSelectedAccount](self, "_indexPathForSelectedAccount"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccountListController tableView](self, "tableView"));
    if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
      v7 = 0;
    else
      v7 = 2;
    objc_msgSend(v6, "selectRowAtIndexPath:animated:scrollPosition:", v5, 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccountListController splitViewController](self, "splitViewController"));
    v9 = objc_msgSend(v8, "isCollapsed");

    if (v9)
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, v3);

  }
  -[AccountListController _updateBarButtonItems](self, "_updateBarButtonItems");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AccountListController;
  -[AccountListController viewDidDisappear:](&v5, "viewDidDisappear:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccountListController parentViewController](self, "parentViewController"));

  if (!v4)
    -[AccountListController unloadViewIfReloadable](self, "unloadViewIfReloadable");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AccountListController;
  -[AccountListController traitCollectionDidChange:](&v5, "traitCollectionDidChange:", v4);
  -[AccountListController _updateBarButtonItems](self, "_updateBarButtonItems");

}

- (void)_updateBarButtonItems
{
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[AccountListController navigationItem](self, "navigationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccountListController splitViewController](self, "splitViewController"));
  v4 = objc_msgSend(v3, "isCollapsed");

  if (v4)
  {
    v5 = objc_alloc((Class)UIBarButtonItem);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100531B00, CFSTR("Main")));
    v8 = objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, self, "cancelButtonClicked");

    objc_msgSend(v8, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMoveMessageViewCancelButton);
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

  }
  else
  {
    objc_msgSend(v9, "setRightBarButtonItem:", 0);
  }

}

- (id)_indexPathForSelectedAccount
{
  void *v3;
  id v4;

  if (self->_selectedAccount
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccountListController accounts](self, "accounts")),
        v4 = objc_msgSend(v3, "indexOfObject:", self->_selectedAccount),
        v3,
        v4 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    return (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v4, 0));
  }
  else
  {
    return 0;
  }
}

- (void)_getRotationContentSettings:(id *)a3
{
  *(_WORD *)&a3->var0 = 257;
  a3->var5 = 25.0;
}

- (BOOL)shouldAutorotate
{
  return +[UIDevice mf_isPad](UIDevice, "mf_isPad") ^ 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccountListController accounts](self, "accounts", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  MailboxTableCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;

  v6 = a4;
  v7 = (MailboxTableCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("AccountListTableCell")));
  if (!v7)
    v7 = -[MailboxTableCell initWithStyle:reuseIdentifier:]([MailboxTableCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("AccountListTableCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccountListController accounts](self, "accounts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));
  -[MailboxTableCell setTitle:](v7, "setTitle:", v10);
  -[MailboxTableCell setCellEnabled:](v7, "setCellEnabled:", -[AccountListController _enableAccount:](self, "_enableAccount:", v9));
  -[MailboxTableCell setIcon:](v7, "setIcon:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Mail.moveMessagePopover.accountsTable.%@Cell"), v10));
  -[MailboxTableCell setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AccountListController splitViewController](self, "splitViewController"));
  v13 = objc_msgSend(v12, "isCollapsed");

  -[MailboxTableCell setAccessoryType:](v7, "setAccessoryType:", v13);
  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  double result;
  unsigned int v7;

  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory", a3, a4));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
    return UITableViewAutomaticDimension;
  v7 = +[UIDevice mf_isPad](UIDevice, "mf_isPad");
  result = 48.0;
  if (v7)
    return 44.0;
  return result;
}

- (BOOL)_enableAccount:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = objc_msgSend(v5, "canPerformNetworkOperationOnAccount:", v4);

  if (v6)
    v7 = !-[NSSet containsObject:](self->_disabledAccounts, "containsObject:", v4);
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccountListController accounts](self, "accounts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "row")));

  if (v7 && !-[NSSet containsObject:](self->_disabledAccounts, "containsObject:", v7))
    v8 = v5;
  else
    v8 = 0;

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "row") != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccountListController accounts](self, "accounts"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "row")));

    -[AccountListController selectAccount:mailbox:](self, "selectAccount:mailbox:", v9, 0);
  }

}

- (AccountListControllerDelegate)accountListDelegate
{
  return (AccountListControllerDelegate *)objc_loadWeakRetained((id *)&self->_accountListDelegate);
}

- (void)setAccountListDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accountListDelegate, a3);
}

- (MailAccount)selectedAccount
{
  return self->_selectedAccount;
}

- (void)setSelectedAccount:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAccount, a3);
}

- (NSSet)disabledAccounts
{
  return self->_disabledAccounts;
}

- (void)setDisabledAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MailScene)scene
{
  return (MailScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_disabledAccounts, 0);
  objc_storeStrong((id *)&self->_selectedAccount, 0);
  objc_destroyWeak((id *)&self->_accountListDelegate);
}

@end
