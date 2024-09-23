@implementation AccountFavoritesPickerController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AccountFavoritesPickerController;
  -[MailboxListViewControllerBase viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase account](self, "account"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccountFavoritesPickerController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setTitle:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccountFavoritesPickerController tableView](self, "tableView"));
  objc_msgSend(v7, "reloadData");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccountFavoritesPickerController mf_updatePreferredContentSizeBasedOnTableView](self, "mf_updatePreferredContentSizeBasedOnTableView"));
  -[AccountFavoritesPickerController setTableViewObserver:](self, "setTableViewObserver:", v8);

}

- (void)viewDidLoad
{
  id v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AccountFavoritesPickerController;
  -[MailboxListViewControllerBase viewDidLoad](&v10, "viewDidLoad");
  v3 = objc_alloc((Class)UIBarButtonItem);
  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_100531B00, CFSTR("Main")));
  v7 = objc_msgSend(v3, "initWithTitle:style:target:action:", v6, 2, self, "doneButtonClicked:");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccountFavoritesPickerController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AccountFavoritesPickerController tableView](self, "tableView"));
  +[MailboxTableCell defaultRowHeight](MailboxTableCell, "defaultRowHeight");
  objc_msgSend(v9, "setEstimatedRowHeight:");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AccountFavoritesPickerController;
  -[AccountFavoritesPickerController traitCollectionDidChange:](&v5, "traitCollectionDidChange:", v4);
  -[AccountFavoritesPickerController mf_updateTableViewBackgroundColorForPopover](self, "mf_updateTableViewBackgroundColorForPopover");

}

- (BOOL)shouldAutorotate
{
  return +[UIDevice mf_isPad](UIDevice, "mf_isPad") ^ 1;
}

- (BOOL)shouldHideInbox
{
  return 1;
}

- (BOOL)shouldHideNotesForAccount:(id)a3
{
  return objc_msgSend(a3, "isSyncingNotes");
}

+ (int64_t)tableViewStyle
{
  return 2;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase sortedMailboxes](self, "sortedMailboxes", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (void)doneButtonClicked:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[AccountFavoritesPickerController delegate](self, "delegate", a3));
  objc_msgSend(v3, "didFinish");

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  double result;

  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory", a3, a4));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
    return UITableViewAutomaticDimension;
  +[MailboxTableCell defaultRowHeight](MailboxTableCell, "defaultRowHeight");
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  MailboxTableCell *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;

  v6 = a4;
  v7 = (MailboxTableCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("AccountFavoritesPickerControllerReuseCell")));
  if (!v7)
    v7 = -[MailboxTableCell initWithStyle:reuseIdentifier:]([MailboxTableCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("AccountFavoritesPickerControllerReuseCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccountFavoritesPickerController mailboxForIndexPath:](self, "mailboxForIndexPath:", v6));
  v9 = objc_msgSend(v8, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v8));
  -[MailboxTableCell setLegacyMailboxes:](v7, "setLegacyMailboxes:", v10);

  if (v9 == (id)7)
  {
    -[MailboxTableCell setCellEnabled:](v7, "setCellEnabled:", 0);
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AccountFavoritesPickerController delegate](self, "delegate"));
  v12 = objc_msgSend(v11, "selectedStateForMailbox:", v8);

  if ((v12 & 1) == 0)
    goto LABEL_7;
  v13 = 3;
LABEL_8:
  -[MailboxTableCell setAccessoryType:](v7, "setAccessoryType:", v13);

  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccountFavoritesPickerController mailboxForIndexPath:](self, "mailboxForIndexPath:", v5));
  v7 = v6;
  v8 = v5;
  if (v6)
  {
    v8 = v5;
    if (objc_msgSend(v6, "type") == (id)7)
    {

      v8 = 0;
    }
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cellForRowAtIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccountFavoritesPickerController mailboxForIndexPath:](self, "mailboxForIndexPath:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AccountFavoritesPickerController delegate](self, "delegate"));
  v10 = objc_msgSend(v9, "toggleAndReturnSelectedStateForMailbox:", v8);

  if (v10)
    v11 = 3;
  else
    v11 = 0;
  objc_msgSend(v7, "setAccessoryType:", v11);
  objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (id)mailboxForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase sortedMailboxes](self, "sortedMailboxes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "row")));

  return v6;
}

- (id)indexPathForMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase sortedMailboxes](self, "sortedMailboxes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v5, "indexOfObject:", v4), 0));

  return v6;
}

- (id)_ntsMailboxesForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allMailboxUidsSortedWithSpecialsAtTopForAccount:includingLocals:client:outbox:", v4, 1, self, 0));

  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  v6 = a4;
  objc_msgSend(v6, "mf_updateBackgroundColorForPopover:", -[AccountFavoritesPickerController mf_supportsPopoverPresentation](self, "mf_supportsPopoverPresentation"));

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase sortedMailboxes](self, "sortedMailboxes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

  if (v7)
    v8 = objc_msgSend(v7, "mv_isSelectable");
  else
    v8 = 1;

  return v8;
}

- (AccountFavoritesPickerControllerDelegate)delegate
{
  return (AccountFavoritesPickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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
  objc_destroyWeak((id *)&self->_delegate);
}

@end
