@implementation MailboxEditingController

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C1534;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9C70 != -1)
    dispatch_once(&qword_1005A9C70, block);
  return (OS_os_log *)(id)qword_1005A9C68;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell editableTextField](self->_mailboxNameCell, "editableTextField"));
  objc_msgSend(v4, "setDelegate:", 0);

  v5.receiver = self;
  v5.super_class = (Class)MailboxEditingController;
  -[MailboxEditingController dealloc](&v5, "dealloc");
}

- (MailboxEditingController)initWithMailbox:(id)a3 account:(id)a4 validAccounts:(id)a5
{
  id v8;
  id v9;
  id v10;
  MailboxEditingController *v11;
  MailboxEditingController *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *validAccounts;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MailboxEditingController;
  v11 = -[MailboxEditingController initWithStyle:](&v19, "initWithStyle:", 2);
  v12 = v11;
  if (v11)
  {
    -[MailboxEditingController setHidesBottomBarWhenPushed:](v11, "setHidesBottomBarWhenPushed:", 1);
    -[MailboxEditingController setMailbox:](v12, "setMailbox:", v8);
    if (v8)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parentForMailbox:", v8));

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rootMailbox"));
    }
    -[MailboxEditingController setParentMailbox:](v12, "setParentMailbox:", v14);
    objc_storeStrong((id *)&v12->_oldParentMailbox, v14);
    -[MailboxEditingController setAccount:](v12, "setAccount:", v9);
    v15 = (NSArray *)objc_msgSend(v10, "copy");
    validAccounts = v12->_validAccounts;
    v12->_validAccounts = v15;

    -[MailboxEditingController _createMailboxNameCell](v12, "_createMailboxNameCell");
    if (v8)
      v12->_showDeleteButton = objc_msgSend(v9, "canMailboxBeDeleted:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v12, "_contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v12;
}

- (void)_createMailboxNameCell
{
  void *v3;
  UITableViewCell *v4;
  UITableViewCell *mailboxNameCell;
  void *v6;
  void *v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell editableTextField](self->_mailboxNameCell, "editableTextField"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));

  v4 = (UITableViewCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 1000, 0);
  mailboxNameCell = self->_mailboxNameCell;
  self->_mailboxNameCell = v4;

  -[UITableViewCell setTextFieldOffset:](self->_mailboxNameCell, "setTextFieldOffset:", 0.0);
  -[UITableViewCell setSelectionStyle:](self->_mailboxNameCell, "setSelectionStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell editableTextField](self->_mailboxNameCell, "editableTextField"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "textChanged:", UITextFieldTextDidChangeNotification, v6);

  v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MAILBOX_NAME_PLACEHOLDER"), &stru_100531B00, CFSTR("Main")));
  objc_msgSend(v6, "setPlaceholder:", v10);

  objc_msgSend(v6, "setClearButtonMode:", 1);
  objc_msgSend(v6, "setReturnKeyType:", 9);
  objc_msgSend(v6, "setEnablesReturnKeyAutomatically:", 1);
  objc_msgSend(v6, "setAutocapitalizationType:", 2);
  objc_msgSend(v6, "_setDataOwnerForPaste:", 3);
  objc_msgSend(v6, "_setDataOwnerForCopy:", 3);
  objc_msgSend(v6, "setText:", v11);
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)viewDidLoad
{
  NSBundle *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  void *v17;
  NSBundle *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MailboxEditingController;
  -[MailboxEditingController viewDidLoad](&v24, "viewDidLoad");
  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SAVE"), &stru_100531B00, CFSTR("Main")));

  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v5, 2, self, "_saveButtonClicked:");
  objc_msgSend(v6, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailEditMailboxViewSaveButton);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  v8 = objc_alloc((Class)UIBarButtonItem);
  v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100531B00, CFSTR("Main")));
  v12 = objc_msgSend(v8, "initWithTitle:style:target:action:", v11, 0, self, "_cancelButtonClicked:");

  objc_msgSend(v12, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailEditMailboxViewCancelButton);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setLeftBarButtonItem:", v12);

  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("EDIT_MAILBOX"), &stru_100531B00, CFSTR("Main")));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController mailbox](self, "mailbox"));
  if (!v17)
  {
    v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("NEW_MAILBOX"), &stru_100531B00, CFSTR("Main")));

    v16 = (void *)v20;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController navigationItem](self, "navigationItem"));
  objc_msgSend(v21, "setTitle:", v16);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController navigationItem](self, "navigationItem"));
  objc_msgSend(v22, "setAccessibilityIdentifier:", v16);

  -[MailboxEditingController _updateRowHeight](self, "_updateRowHeight");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController navigationController](self, "navigationController"));
  objc_msgSend(v23, "_setClipUnderlapWhileTransitioning:", 1);

}

- (void)_updateRowHeight
{
  _BOOL4 IsAccessibilityCategory;
  double v4;
  double v5;
  NSString *v6;
  id v7;

  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
  {
    v4 = UITableViewAutomaticDimension;
  }
  else
  {
    +[MailboxTableCell defaultRowHeight](MailboxTableCell, "defaultRowHeight");
    v4 = v5;
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MailboxEditingController tableView](self, "tableView"));
  objc_msgSend(v7, "setRowHeight:", v4);

}

- (void)_contentSizeCategoryChanged:(id)a3
{
  UITableViewCell *deleteMailboxCell;

  +[MailboxTableCell invalidateCachedLayoutInformation](MailboxTableCell, "invalidateCachedLayoutInformation", a3);
  -[MailboxEditingController _updateRowHeight](self, "_updateRowHeight");
  -[MailboxEditingController _createMailboxNameCell](self, "_createMailboxNameCell");
  deleteMailboxCell = self->_deleteMailboxCell;
  self->_deleteMailboxCell = 0;

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MailboxEditingController;
  -[MailboxEditingController traitCollectionDidChange:](&v5, "traitCollectionDidChange:", v4);
  -[MailboxEditingController mf_updateTableViewBackgroundColorForPopover](self, "mf_updateTableViewBackgroundColorForPopover");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  UITableViewCell *v8;
  UITableViewCell *mailboxNameCell;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MailboxEditingController;
  -[MailboxEditingController viewWillAppear:](&v14, "viewWillAppear:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController tableView](self, "tableView"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailEditMailboxView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController mf_updatePreferredContentSizeBasedOnTableView](self, "mf_updatePreferredContentSizeBasedOnTableView"));
  -[MailboxEditingController setTableViewObserver:](self, "setTableViewObserver:", v6);

  objc_msgSend(v5, "reloadData");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
  v8 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForRowAtIndexPath:", v7));

  mailboxNameCell = v8;
  if (v8 != self->_mailboxNameCell)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxEditingController.m"), 170, CFSTR("unexpected cell"));

    mailboxNameCell = self->_mailboxNameCell;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell editableTextField](mailboxNameCell, "editableTextField"));
  objc_msgSend(v10, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailEditMailboxViewMailboxNameCell);
  if (self->_mailbox)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayNameForMailbox:", self->_mailbox));
    objc_msgSend(v10, "setText:", v12);

  }
  -[MailboxEditingController _updateSaveButtonEnabledState](self, "_updateSaveButtonEnabledState");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MailboxEditingController;
  -[MailboxEditingController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell editableTextField](self->_mailboxNameCell, "editableTextField"));
  objc_msgSend(v4, "becomeFirstResponder");

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[MailboxEditingController _applyChangesAndDismissView](self, "_applyChangesAndDismissView", a3);
  return 0;
}

- (BOOL)shouldAutorotate
{
  return +[UIDevice mf_isPad](UIDevice, "mf_isPad") ^ 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_showDeleteButton)
    return 3;
  else
    return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  MailMailboxGroupedPickerTableCell *v6;
  MailMailboxGroupedPickerTableCell *parentMailboxCell;
  MailMailboxGroupedPickerTableCell *v8;
  UITableViewCell *p_super;
  void *v10;
  void *v11;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    if (objc_msgSend(v5, "section") == (id)1)
    {
      if (!self->_parentMailboxCell)
      {
        v6 = -[MailboxGroupedPickerTableCell initWithStyle:reuseIdentifier:]([MailMailboxGroupedPickerTableCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
        parentMailboxCell = self->_parentMailboxCell;
        self->_parentMailboxCell = v6;

        -[MailMailboxGroupedPickerTableCell setAlwaysDisplayAsTopLevel:](self->_parentMailboxCell, "setAlwaysDisplayAsTopLevel:", 1);
        -[MailMailboxGroupedPickerTableCell setAccessoryType:](self->_parentMailboxCell, "setAccessoryType:", 1);
        -[MailMailboxGroupedPickerTableCell setAccessibilityIdentifier:](self->_parentMailboxCell, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailEditMailboxViewMailboxPickerButton);
      }
      -[MailboxEditingController _updateParentMailbox](self, "_updateParentMailbox");
      v8 = self->_parentMailboxCell;
    }
    else
    {
      v8 = (MailMailboxGroupedPickerTableCell *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController _deleteMailboxButtonTableViewCell](self, "_deleteMailboxButtonTableViewCell"));
    }
    p_super = &v8->super.super;
  }
  else
  {
    p_super = self->_mailboxNameCell;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell editableTextField](self->_mailboxNameCell, "editableTextField"));
    objc_msgSend(v11, "setFont:", v10);

  }
  return p_super;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  NSBundle *v4;
  void *v5;
  void *v6;

  if (a4 == 1)
  {
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MAILBOX_LOCATION"), &stru_100531B00, CFSTR("Main")));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)mailboxParentPickerDidSelectMailbox:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MailboxEditingController setParentMailbox:](self, "setParentMailbox:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account"));
  -[MailboxEditingController setAccount:](self, "setAccount:", v4);

  -[MailboxEditingController _updateParentMailbox](self, "_updateParentMailbox");
}

- (void)_updateParentMailbox
{
  -[MailboxGroupedPickerTableCell setMailbox:](self->_parentMailboxCell, "setMailbox:", self->_parentMailbox);
}

- (void)_updateSaveButtonEnabledState
{
  MFMailboxUid *parentMailbox;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  id v10;
  id v11;

  parentMailbox = self->_parentMailbox;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[UITableViewCell editableTextField](self->_mailboxNameCell, "editableTextField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
  v5 = objc_msgSend(v4, "length");

  v11 = (id)objc_claimAutoreleasedReturnValue(-[MailboxEditingController navigationItem](self, "navigationItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rightBarButtonItem"));
  v7 = v6;
  if (v5)
    v8 = parentMailbox == 0;
  else
    v8 = 1;
  v9 = !v8;
  objc_msgSend(v6, "setEnabled:", v9);

}

- (id)_deleteMailboxButtonTableViewCell
{
  UITableViewCell *deleteMailboxCell;
  UITableViewCell *v4;
  UITableViewCell *v5;
  void *v6;
  void *v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  deleteMailboxCell = self->_deleteMailboxCell;
  if (!deleteMailboxCell)
  {
    v4 = (UITableViewCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_deleteMailboxCell;
    self->_deleteMailboxCell = v4;

    -[UITableViewCell setSelectionStyle:](self->_deleteMailboxCell, "setSelectionStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_MAILBOX"), &stru_100531B00, CFSTR("Main")));
    objc_msgSend(v7, "setTitle:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    objc_msgSend(v7, "setBaseForegroundColor:", v11);

    objc_msgSend(v6, "setConfiguration:", v7);
    objc_msgSend(v6, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailEditMailboxViewDeleteMailboxButton);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, "_confirmDelete:", 64);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell contentView](self->_deleteMailboxCell, "contentView"));
    objc_msgSend(v12, "addSubview:", v6);

    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
    objc_msgSend(v6, "mf_pinToView:usingLayoutMargins:", v13, 0);

    deleteMailboxCell = self->_deleteMailboxCell;
  }
  return deleteMailboxCell;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5;
  double v6;
  double v7;
  NSString *v8;
  BOOL IsAccessibilityCategory;

  v5 = a3;
  objc_msgSend(v5, "sectionHeaderHeight");
  v7 = v6;
  if (a4 == 1)
  {
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

    if (!IsAccessibilityCategory)
    {
      if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
        v7 = 34.0;
      else
        v7 = 26.0;
    }
  }

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5;
  double v6;
  double v7;

  v5 = a3;
  objc_msgSend(v5, "sectionFooterHeight");
  v7 = v6;
  if (((a4 == 1) & +[UIDevice mf_isPad](UIDevice, "mf_isPad")) != 0)
    v7 = 25.0;

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  MailboxParentPickerController *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section") == (id)1)
  {
    v7 = -[MailboxParentPickerController initWithMailboxUid:parentMailbox:visibleAccounts:]([MailboxParentPickerController alloc], "initWithMailboxUid:parentMailbox:visibleAccounts:", self->_mailbox, self->_parentMailbox, self->_validAccounts);
    -[MailboxParentPickerController setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailEditMailboxViewMailboxPickerView);
    -[MailboxParentPickerController setMailboxSelectionTarget:](v7, "setMailboxSelectionTarget:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController navigationController](self, "navigationController"));
    objc_msgSend(v8, "pushViewController:animated:", v7, 1);

    objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v6, 1);
  }

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  v6 = a4;
  objc_msgSend(v6, "mf_updateBackgroundColorForPopover:", -[MailboxEditingController mf_supportsPopoverPresentation](self, "mf_supportsPopoverPresentation"));

}

- (void)_applyChangesAndDismissView
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  NSBundle *v18;
  void *v19;
  void *v20;
  MailAccount *account;
  unsigned __int8 v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _BOOL4 v27;
  int v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  MFMailboxUid *v32;
  MFMailboxUid *oldParentMailbox;
  int v34;
  NSBundle *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  int v39;
  void *v40;
  unsigned __int8 v41;
  NSBundle *v42;
  void *v43;
  NSBundle *v44;
  void *v45;
  id v46;
  uint64_t v47;
  NSBundle *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;

  if (self->_isDeletingMailbox)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController deleteMailboxOperation](self, "deleteMailboxOperation"));
    -[MailboxEditingController _queueMailboxOperation:](self, "_queueMailboxOperation:", v3);

    v4 = 0;
    v5 = 0;
LABEL_3:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("MVMailboxListHasPendingChangesNotification"), 0);

    goto LABEL_4;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell editableTextField](self->_mailboxNameCell, "editableTextField"));
  v55 = v8;
  if (objc_msgSend(v8, "isEditing"))
  {
    objc_msgSend(v8, "resignFirstResponder");
    objc_msgSend(v8, "becomeFirstResponder");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController parentMailbox](self, "parentMailbox"));
  if (!v10)
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount rootMailbox](self->_account, "rootMailbox"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "account"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rootMailbox"));

  v57 = (void *)v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathRelativeToMailbox:", v12));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", v9));

  v54 = (void *)v14;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount mailboxUidForRelativePath:create:](self->_account, "mailboxUidForRelativePath:create:", v14, 0));

  v15 = v5 == 0;
  if (v5)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathRelativeToMailboxForDisplay:", v57));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingPathComponent:", v9));

    v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("MAILBOX_ALREADY_EXISTS"), &stru_100531B00, CFSTR("Main")));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v17));
  }
  account = self->_account;
  v58 = 0;
  v22 = -[MailAccount newMailboxNameIsAcceptable:reasonForFailure:](account, "newMailboxNameIsAcceptable:reasonForFailure:", v9, &v58);
  v23 = v58;
  v24 = v23;
  if ((v22 & 1) == 0)
  {
    v25 = v23;

    v15 = 0;
    v5 = v25;
  }
  v56 = v24;
  if (!objc_msgSend(v9, "length"))
  {
    v28 = 0;
    v29 = 0;
    v4 = 0;
LABEL_40:
    v31 = v57;
    goto LABEL_41;
  }
  if (self->_mailbox)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount _uidNameForPathComponent:](self->_account, "_uidNameForPathComponent:", v9));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxUid name](self->_mailbox, "name"));
    v27 = (objc_msgSend(v53, "isEqualToString:", v26) & 1) == 0 && objc_msgSend(v53, "length") != 0;

    v32 = (MFMailboxUid *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController parentMailbox](self, "parentMailbox"));
    oldParentMailbox = self->_oldParentMailbox;

    v34 = v32 != oldParentMailbox || v27;
    v52 = v34 & ~v15;
    if (v52 == 1)
    {
      v35 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v37 = v36;
      if (v27)
        v38 = CFSTR("ERROR_RENAMING_MAILBOX_TITLE");
      else
        v38 = CFSTR("ERROR_MOVING_MAILBOX_TITLE");
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", v38, &stru_100531B00, CFSTR("Main")));
      v39 = 1;
    }
    else
    {
      if (v27)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController renameMailboxOperation](self, "renameMailboxOperation"));
        v41 = -[MailboxEditingController _queueMailboxOperation:](self, "_queueMailboxOperation:", v40);

        if ((v41 & 1) != 0)
        {
          v39 = 0;
          v4 = 0;
          v28 = 1;
        }
        else
        {
          v44 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
          v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
          v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("ERROR_RENAMING_MAILBOX_TITLE"), &stru_100531B00, CFSTR("Main")));

          v46 = sub_1000C3168();
          v47 = objc_claimAutoreleasedReturnValue(v46);

          v28 = 0;
          v39 = 1;
          v5 = (void *)v47;
        }
      }
      else
      {
        v28 = 0;
        v39 = 0;
        v4 = 0;
      }
      if (v32 == oldParentMailbox)
        goto LABEL_39;
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController moveMailboxOperation](self, "moveMailboxOperation"));
      -[MailboxEditingController _queueMailboxOperation:](self, "_queueMailboxOperation:", v37);
    }
    v28 = v52 ^ 1;

LABEL_39:
    v29 = v39 != 0;
    goto LABEL_40;
  }
  if ((v15 & 1) != 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController createMailboxOperation](self, "createMailboxOperation"));
    v31 = v57;
    -[MailboxEditingController _queueMailboxOperation:](self, "_queueMailboxOperation:", v30);

    v28 = 0;
    v29 = 0;
    v4 = 0;
  }
  else
  {
    v42 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v31 = v57;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("ERROR_CREATING_MAILBOX_TITLE"), &stru_100531B00, CFSTR("Main")));

    v28 = 0;
    v29 = 1;
  }
LABEL_41:

  if (v29)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1));
    v48 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100531B00, CFSTR("Main")));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v50, 0, 0));
    objc_msgSend(v7, "addAction:", v51);

    -[MailboxEditingController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
    goto LABEL_5;
  }
  if (v28)
    goto LABEL_3;
LABEL_4:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController delegate](self, "delegate"));
  objc_msgSend(v7, "mailboxEditingControllerDidFinish:", self);
LABEL_5:

}

- (void)_cancelButtonClicked:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MailboxEditingController delegate](self, "delegate", a3));
  objc_msgSend(v4, "mailboxEditingControllerDidFinish:", self);

}

- (void)_confirmDelete:(id)a3
{
  void *v4;
  unsigned int v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  void *v17;
  NSBundle *v18;
  void *v19;
  void *v20;
  void *v21;
  NSBundle *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager", a3));
  v5 = objc_msgSend(v4, "mailboxHasSubMailboxes:", self->_mailbox);

  v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MAILBOX_WITH_SUBMAILBOXES_DELETE_DESCRIPTION_FORMAT"), &stru_100531B00, CFSTR("Main")));
  else
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MAILBOX_DELETE_DESCRIPTION_FORMAT"), &stru_100531B00, CFSTR("Main")));
  v10 = (void *)v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayNameForMailbox:", self->_mailbox));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v12));

  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DELETE_MAILBOX"), &stru_100531B00, CFSTR("Main")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v16, v13, 1));

  v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_100531B00, CFSTR("Main")));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000C357C;
  v26[3] = &unk_10051D948;
  v26[4] = self;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 2, v26));
  objc_msgSend(v17, "addAction:", v21);

  v22 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100531B00, CFSTR("Main")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 1, 0));
  objc_msgSend(v17, "addAction:", v25);

  -[MailboxEditingController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
}

- (BOOL)_queueMailboxOperation:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  MailMailboxChangeSet *v6;
  void *v7;
  MailMailboxChangeSet *v8;
  unsigned __int8 v9;
  _QWORD v11[4];
  MailMailboxChangeSet *v12;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v15;

  v3 = a3;
  v4 = _os_activity_create((void *)&_mh_execute_header, "mailbox operation", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v4, &state);
  v5 = objc_claimAutoreleasedReturnValue(+[MailboxEditingController log](MailboxEditingController, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Queueing mailbox operation %@", buf, 0xCu);
  }

  v6 = -[MailMailboxChangeSet initWithOperation:]([MailMailboxChangeSet alloc], "initWithOperation:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
  objc_msgSend(v7, "pause");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C3790;
  v11[3] = &unk_10051D998;
  v8 = v6;
  v12 = v8;
  v9 = objc_msgSend(v7, "addChange:currentAndPendingChangesBlock:", v8, v11);
  objc_msgSend(v7, "resume");

  os_activity_scope_leave(&state);
  return v9;
}

- (id)deleteMailboxOperation
{
  return -[MCSDeleteMailboxOperation initWithMailboxToDelete:]([MCSDeleteMailboxOperation alloc], "initWithMailboxToDelete:", self->_mailbox);
}

- (id)renameMailboxOperation
{
  void *v3;
  void *v4;
  MCSRenameMailboxOperation *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell editableTextField](self->_mailboxNameCell, "editableTextField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));

  if (objc_msgSend(v4, "length"))
    v5 = -[MCSRenameMailboxOperation initWithMailboxToRename:toName:]([MCSRenameMailboxOperation alloc], "initWithMailboxToRename:toName:", self->_mailbox, v4);
  else
    v5 = 0;

  return v5;
}

- (id)moveMailboxOperation
{
  void *v3;
  MCSMoveMailboxOperation *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController parentMailbox](self, "parentMailbox"));
  v4 = -[MCSMoveMailboxOperation initWithMailboxToMove:toParent:]([MCSMoveMailboxOperation alloc], "initWithMailboxToMove:toParent:", self->_mailbox, v3);

  return v4;
}

- (id)createMailboxOperation
{
  void *v3;
  void *v4;
  void *v5;
  MCSCreateMailboxOperation *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITableViewCell editableTextField](self->_mailboxNameCell, "editableTextField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxEditingController parentMailbox](self, "parentMailbox"));
  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailAccount rootMailbox](self->_account, "rootMailbox"));
  v6 = -[MCSCreateMailboxOperation initWithName:parentMailbox:]([MCSCreateMailboxOperation alloc], "initWithName:parentMailbox:", v4, v5);

  return v6;
}

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (void)setMailbox:(id)a3
{
  objc_storeStrong((id *)&self->_mailbox, a3);
}

- (MFMailboxUid)parentMailbox
{
  return self->_parentMailbox;
}

- (void)setParentMailbox:(id)a3
{
  objc_storeStrong((id *)&self->_parentMailbox, a3);
}

- (MailAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (MailboxEditingControllerDelegate)delegate
{
  return (MailboxEditingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)validAccounts
{
  return self->_validAccounts;
}

- (void)setValidAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
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
  objc_storeStrong((id *)&self->_validAccounts, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_parentMailbox, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_parentMailboxCell, 0);
  objc_storeStrong((id *)&self->_deleteMailboxCell, 0);
  objc_storeStrong((id *)&self->_mailboxNameCell, 0);
  objc_storeStrong((id *)&self->_oldParentMailbox, 0);
}

@end
