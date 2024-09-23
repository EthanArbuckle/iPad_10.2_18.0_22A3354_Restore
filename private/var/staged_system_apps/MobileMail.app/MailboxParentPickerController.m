@implementation MailboxParentPickerController

- (MailboxParentPickerController)initWithMailboxUid:(id)a3 parentMailbox:(id)a4 visibleAccounts:(id)a5
{
  id v8;
  id v9;
  id v10;
  MailboxParentPickerController *v11;
  MailboxParentPickerTableController *v12;
  MailboxParentPickerTableController *tableController;
  NSBundle *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MailboxParentPickerController;
  v11 = -[MailboxParentPickerController initWithStyle:](&v20, "initWithStyle:", 2);
  if (v11)
  {
    v12 = -[MailboxParentPickerTableController initWithMailboxUid:parentMailbox:visibleAccounts:]([MailboxParentPickerTableController alloc], "initWithMailboxUid:parentMailbox:visibleAccounts:", v8, v9, v10);
    tableController = v11->_tableController;
    v11->_tableController = v12;

    v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v11));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MAILBOX_LOCATION"), &stru_100531B00, CFSTR("Main")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerController navigationItem](v11, "navigationItem"));
    objc_msgSend(v17, "setTitle:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerController tableView](v11, "tableView"));
    objc_msgSend(v18, "setEstimatedRowHeight:", 75.0);

  }
  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MailboxParentPickerController;
  -[MailboxParentPickerController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerController mf_updatePreferredContentSizeBasedOnTableView](self, "mf_updatePreferredContentSizeBasedOnTableView"));
  -[MailboxParentPickerController setTableViewObserver:](self, "setTableViewObserver:", v4);

  v5 = -[MailboxParentPickerTableController indexOfParentMailbox](self->_tableController, "indexOfParentMailbox");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerController tableView](self, "tableView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));
    objc_msgSend(v7, "scrollToRowAtIndexPath:atScrollPosition:animated:", v8, 0, 0);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MailboxParentPickerController;
  -[MailboxParentPickerController traitCollectionDidChange:](&v5, "traitCollectionDidChange:", v4);
  -[MailboxParentPickerController mf_updateTableViewBackgroundColorForPopover](self, "mf_updateTableViewBackgroundColorForPopover");

}

- (void)setMailboxSelectionTarget:(id)a3
{
  -[MailboxParentPickerTableController setMailboxSelectionTarget:](self->_tableController, "setMailboxSelectionTarget:", a3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[MailboxParentPickerTableController tableView:numberOfRowsInSection:](self->_tableController, "tableView:numberOfRowsInSection:", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerTableController tableView:cellForRowAtIndexPath:](self->_tableController, "tableView:cellForRowAtIndexPath:", a3, a4));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MailboxParentPickerTableController tableView:didSelectRowAtIndexPath:tableViewPath:](self->_tableController, "tableView:didSelectRowAtIndexPath:tableViewPath:", v9, v6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerController navigationController](self, "navigationController"));
  v8 = objc_msgSend(v7, "popViewControllerAnimated:", 1);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  v6 = a4;
  objc_msgSend(v6, "mf_updateBackgroundColorForPopover:", -[MailboxParentPickerController mf_supportsPopoverPresentation](self, "mf_supportsPopoverPresentation"));
  objc_msgSend(v6, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailEditMailboxViewMailboxPickerViewMailboxCell);

}

- (BOOL)shouldAutorotate
{
  return +[UIDevice mf_isPad](UIDevice, "mf_isPad") ^ 1;
}

- (EFCancelable)tableViewObserver
{
  return self->_tableViewObserver;
}

- (void)setTableViewObserver:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewObserver, 0);
  objc_storeStrong((id *)&self->_tableController, 0);
}

@end
