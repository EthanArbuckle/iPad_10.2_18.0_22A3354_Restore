@implementation MailboxListViewControllerMail

- (MailboxListViewControllerMail)initWithScene:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  NSArray *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MailboxListViewControllerMail;
  v5 = -[MailboxListViewControllerMail initWithStyle:](&v16, "initWithStyle:", 0);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "messageStoreChanged:", MailMessageStoreMessagesAdded, 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "messageStoreChanged:", MailMessageStoreMessageFlagsChanged, 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "accountDisplayNameChanged:", MailApplicationDidChangeAccountDisplayName, 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "mailAccountsChanged:", ECMailAccountsDidChangeNotification, 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "pendingMailboxesChanged:", CFSTR("MVMailboxListHasPendingChangesNotification"), 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);
    *(_QWORD *)(v5 + 87) = 0;
    v5[48] |= 1u;
    v5[113] = 1;
    objc_storeWeak((id *)(v5 + 127), v4);
    v7 = objc_alloc((Class)EFLocked);
    v8 = objc_opt_new(NSArray);
    v9 = objc_msgSend(v7, "initWithObject:", v8);
    v10 = *(void **)(v5 + 143);
    *(_QWORD *)(v5 + 143) = v9;

    *(_QWORD *)(v5 + 151) = 0;
    v11 = objc_msgSend(objc_alloc((Class)EFLazyCache), "initWithCountLimit:", 100);
    v12 = *(void **)(v5 + 159);
    *(_QWORD *)(v5 + 159) = v11;

    v13 = objc_claimAutoreleasedReturnValue(+[EFScheduler serialDispatchQueueSchedulerWithName:qualityOfService:](EFScheduler, "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.MailboxListViewControllerMail.mailboxFilterScheduler"), 25));
    v14 = *(void **)(v5 + 167);
    *(_QWORD *)(v5 + 167) = v13;

  }
  return (MailboxListViewControllerMail *)v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MailboxListViewControllerMail;
  -[MailboxListViewControllerBase dealloc](&v4, "dealloc");
}

- (void)_getRotationContentSettings:(id *)a3
{
  double v4;

  *(_WORD *)&a3->var0 = 257;
  +[MFTableViewCell defaultAccessoryWidth](MFTableViewCell, "defaultAccessoryWidth");
  a3->var5 = v4;
}

- (BOOL)shouldAutorotate
{
  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
    return -[MailboxListViewControllerMail isEditing](self, "isEditing") ^ 1;
  else
    return 1;
}

- (void)clearAccount
{
  -[MailboxListViewControllerMail setAccount:](self, "setAccount:", 0);
}

- (void)setMailboxListDelegate:(id)a3
{
  objc_storeWeak((id *)(&self->_queuedOutboxCheck + 7), a3);
}

- (void)updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MAILBOXES"), &stru_100531B00, CFSTR("Main")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAILBOXES_BACK_BUTTON"), &stru_100531B00, CFSTR("Main")));

  WeakRetained = objc_loadWeakRetained((id *)(&self->_queuedOutboxCheck + 7));
  v7 = objc_msgSend(WeakRetained, "containsMultipleAccounts");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase account](self, "account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));

    if (objc_msgSend(v9, "length"))
    {
      v10 = v9;

      v5 = 0;
      v14 = v10;
    }

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail title](self, "title"));
  v12 = objc_msgSend(v14, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
  {
    -[MailboxListViewControllerMail setTitle:](self, "setTitle:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail navigationItem](self, "navigationItem"));
    objc_msgSend(v13, "setBackButtonTitle:", v5);

  }
}

- (void)setAccount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase account](self, "account"));

  if (v5 != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)MailboxListViewControllerMail;
    -[MailboxListViewControllerBase setAccount:](&v7, "setAccount:", v4);
    if (-[MailboxListViewControllerMail isViewLoaded](self, "isViewLoaded"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail tableView](self, "tableView"));
      objc_msgSend(v6, "setContentOffset:animated:", 0, CGPointZero.x, CGPointZero.y);

    }
    -[MailboxListViewControllerMail updateTitle](self, "updateTitle");
  }

}

- (BOOL)isRefreshing
{
  void *v5;

  if (pthread_main_np() != 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxListViewControllerMail.m"), 140, CFSTR("Current thread must be main"));

  }
  return self->_showRefreshControl;
}

- (void)setIsRefreshing:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t mlvcmDelegate_high;
  id v7;
  id v8;

  v3 = a3;
  if (pthread_main_np() != 1)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxListViewControllerMail.m"), 145, CFSTR("Current thread must be main"));

  }
  if (self->_showRefreshControl != v3 && !v3)
  {
    self->_showRefreshControl = v3;
    mlvcmDelegate_high = HIBYTE(self->_mlvcmDelegate);
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail tableView](self, "tableView"));
    objc_msgSend(v7, "_endRefreshingAnimated:", mlvcmDelegate_high);

  }
}

- (void)updateIsRefreshing
{
  -[MailboxListViewControllerMail setIsRefreshing:](self, "setIsRefreshing:", 0);
}

- (void)statusBarProgressDidChange:(id)a3
{
  -[MailboxListViewControllerMail performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "updateIsRefreshing", 0, 0);
}

- (void)pulledToRefresh:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (pthread_main_np() != 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxListViewControllerMail.m"), 167, CFSTR("Current thread must be main"));

  }
  self->_showRefreshControl = 1;
  -[MailboxListViewControllerMail performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "updateIsRefreshing", 0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail scene](self, "scene"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "daemonInterface"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mailboxRepository"));

  objc_msgSend(v8, "refreshMailboxList");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  _BOOL4 v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v24.receiver = self;
  v24.super_class = (Class)MailboxListViewControllerMail;
  -[MailboxListViewControllerBase viewWillAppear:](&v24, "viewWillAppear:", a3);
  -[MailboxListViewControllerMail updateTitle](self, "updateTitle");
  -[MailboxListViewControllerMail updateIsRefreshing](self, "updateIsRefreshing");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail toolbarItems](self, "toolbarItems"));
  v5 = v4 == 0;

  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail scene](self, "scene"));
    if ((+[UIDevice mf_isPad](UIDevice, "mf_isPad") & 1) == 0
      && objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___ComposeCapable)
      && (objc_opt_respondsToSelector(v8, "newComposeButtonItem") & 1) != 0)
    {
      v9 = objc_msgSend(v8, "newComposeButtonItem");
      v26[0] = v6;
      v26[1] = v7;
      v26[2] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 3));
      -[MailboxListViewControllerMail setToolbarItems:](self, "setToolbarItems:", v10);

    }
    else
    {
      v25[0] = v6;
      v25[1] = v7;
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
      -[MailboxListViewControllerMail setToolbarItems:](self, "setToolbarItems:", v9);
    }

  }
  v11 = objc_alloc_init((Class)NSMutableSet);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase account](self, "account"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase account](self, "account"));
    v14 = objc_opt_class(LocalAccount);
    isKindOfClass = objc_opt_isKindOfClass(v13, v14);

    if ((isKindOfClass & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase account](self, "account"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "primaryMailboxUid"));
      objc_msgSend(v11, "addObject:", v17);

    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase account](self, "account"));
  v19 = objc_msgSend(v18, "supportsMailboxEditing");

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail editButtonItem](self, "editButtonItem"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail navigationItem](self, "navigationItem"));
    objc_msgSend(v21, "setRightBarButtonItem:", v20);

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail navigationItem](self, "navigationItem"));
    objc_msgSend(v20, "setRightBarButtonItem:", 0);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail tableView](self, "tableView"));
  +[MailboxTableCell defaultRowHeight](MailboxTableCell, "defaultRowHeight");
  objc_msgSend(v22, "setEstimatedRowHeight:");

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail mf_updatePreferredContentSizeBasedOnTableView](self, "mf_updatePreferredContentSizeBasedOnTableView"));
  -[MailboxListViewControllerMail setTableViewObserver:](self, "setTableViewObserver:", v23);

}

- (void)viewWillReappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  MailboxListViewingContext *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  objc_super v13;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase account](self, "account"));

  if (!v5)
  {
    v6 = objc_alloc_init(MailboxListViewingContext);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedAccounts"));

    v9 = objc_msgSend(v8, "count");
    if ((unint64_t)v9 >= 2)
    {
      v10 = MFLogGeneral(v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100391EA0(v11);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anyObject"));
    -[MailboxListViewingContext setAccount:](v6, "setAccount:", v12);

    -[MailboxListViewControllerBase setViewingContext:](self, "setViewingContext:", v6);
    -[MailboxListViewControllerBase viewWillFirstAppear:](self, "viewWillFirstAppear:", v3);

  }
  v13.receiver = self;
  v13.super_class = (Class)MailboxListViewControllerMail;
  -[MailboxListViewControllerBase viewWillReappear:](&v13, "viewWillReappear:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MailboxListViewControllerMail;
  -[MailboxListViewControllerBase viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[MailboxListViewControllerMail mf_updateAlertSuppressionContextsForReason:](self, "mf_updateAlertSuppressionContextsForReason:", CFSTR("mailbox list appeared"));
  HIBYTE(self->_mlvcmDelegate) = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailboxListViewControllerMail;
  -[MailboxListViewControllerBase viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  HIBYTE(self->_mlvcmDelegate) = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail tableView](self, "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "refreshControl"));
  objc_msgSend(v5, "endRefreshing");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MailboxListViewControllerMail;
  -[MailboxListViewControllerMail viewDidDisappear:](&v5, "viewDidDisappear:", 0);
  -[MailboxListViewControllerMail setIsRefreshing:](self, "setIsRefreshing:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail parentViewController](self, "parentViewController"));

  if (!v4)
    -[MailboxListViewControllerMail unloadViewIfReloadable](self, "unloadViewIfReloadable");
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailboxListViewControllerMail;
  -[MailboxListViewControllerBase viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail tableView](self, "tableView"));
  if (self->_alignAccessories)
  {
    v4 = objc_alloc_init((Class)UIRefreshControl);
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "pulledToRefresh:", 4096);
    objc_msgSend(v3, "_setRefreshControl:", v4);

  }
  objc_msgSend(v3, "setSeparatorStyle:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor"));
  objc_msgSend(v3, "setBackgroundColor:", v5);

  objc_msgSend(v3, "setContentInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  objc_msgSend(v3, "setSelectionFollowsFocus:", 0);

}

- (void)applicationWillSuspend
{
  void *v3;
  MailboxListViewControllerMail *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MailboxListViewControllerMail;
  -[MailboxListViewControllerMail applicationWillSuspend](&v5, "applicationWillSuspend");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail navigationController](self, "navigationController"));
  v4 = (MailboxListViewControllerMail *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleViewController"));

  if (v4 == self)
    -[MailboxListViewControllerMail setEditing:animated:](self, "setEditing:animated:", 0, 0);
}

- (void)newMailboxClicked:(id)a3
{
  -[MailboxListViewControllerMail showMailboxEditingControllerWithMailbox:](self, "showMailboxEditingControllerWithMailbox:", 0);
}

- (id)mailboxForIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "row") != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = objc_msgSend(v5, "row");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail mailboxes](self, "mailboxes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v7));

    v10 = objc_opt_class(MFMailboxUid);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      v6 = v9;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)indexPathForMailbox:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail mailboxes](self, "mailboxes"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));

  return v7;
}

- (void)didSelectMailbox:(id)a3 changed:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if ((objc_msgSend(*(id *)((char *)self + 55), "containsObject:", v8) & 1) == 0)
  {
    if (!objc_msgSend(*(id *)((char *)&self->_disabledMailboxes + 7), "count")
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "mailboxType"))), v10 = objc_msgSend(*(id *)((char *)&self->_disabledMailboxes + 7), "containsObject:", v9), v9, (v10 & 1) == 0))
    {
      if (-[MailboxListViewControllerMail isEditing](self, "isEditing"))
      {
        if (objc_msgSend(v8, "mv_isEditable"))
          -[MailboxListViewControllerMail showMailboxEditingControllerWithMailbox:](self, "showMailboxEditingControllerWithMailbox:", v8);
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase mailboxSelectionTarget](self, "mailboxSelectionTarget"));

        if (v11)
        {
          v12.receiver = self;
          v12.super_class = (Class)MailboxListViewControllerMail;
          -[MailboxListViewControllerBase didSelectMailbox:changed:animated:](&v12, "didSelectMailbox:changed:animated:", v8, v6, v5);
        }
      }
    }
  }

}

- (void)mailboxEditingControllerDidFinish:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail presentedViewController](self, "presentedViewController", a3));

  if (v4)
  {
    -[MailboxListViewControllerMail dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail navigationController](self, "navigationController"));
    v5 = objc_msgSend(v6, "popViewControllerAnimated:", 1);

  }
}

- (void)showMailboxEditingControllerWithMailbox:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MailboxEditingController *v12;
  uint64_t v13;

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
  else
    v6 = objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase account](self, "account"));
  v7 = (void *)v6;
  if (v6)
  {
    v13 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountsProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayedAccounts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));

  }
  v12 = -[MailboxEditingController initWithMailbox:account:validAccounts:]([MailboxEditingController alloc], "initWithMailbox:account:validAccounts:", v5, v7, v8);
  -[MailboxEditingController setDelegate:](v12, "setDelegate:", self);
  -[MailboxListViewControllerMail showViewController:sender:](self, "showViewController:sender:", v12, self);

}

- (id)indexPathForSelection
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase selectedMailbox](self, "selectedMailbox"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase selectedMailbox](self, "selectedMailbox"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail indexPathForMailbox:](self, "indexPathForMailbox:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (CGRect)rectOfMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGFloat y;
  double v11;
  double v12;
  double v13;
  CGFloat height;
  float v15;
  double v16;
  double x;
  double width;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail tableView](self, "tableView"));
  objc_msgSend(v5, "contentOffset");
  objc_msgSend(v5, "setContentOffset:animated:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail indexPathForMailbox:](self, "indexPathForMailbox:", v4));
  if (v6)
  {
    objc_msgSend(v5, "rectForRowAtIndexPath:", v6);
    v8 = v7;
    y = v9;
    v12 = v11;
    height = v13;
    v15 = sub_1001D6FDC((int)objc_msgSend(v4, "level"));
    v16 = v15;
    x = v8 + v16;
    width = v12 - v16;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)cellForMailbox:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail indexPathForMailbox:](self, "indexPathForMailbox:", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail tableView](self, "tableView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForRowAtIndexPath:", v4));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setShowsDisclosure:(BOOL)a3
{
  *((_BYTE *)self + 48) = *((_BYTE *)self + 48) & 0xFE | a3;
}

- (void)setShowsRefreshControl:(BOOL)a3
{
  self->_alignAccessories = a3;
}

- (void)disableMailboxes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = *(void **)((char *)self + 55);
  v8 = v4;
  if (!v5)
  {
    v6 = objc_alloc_init((Class)NSMutableSet);
    v7 = *(void **)((char *)self + 55);
    *(_QWORD *)((char *)self + 55) = v6;

    v5 = *(void **)((char *)self + 55);
    v4 = v8;
  }
  objc_msgSend(v5, "unionSet:", v4);

}

- (void)disableMailboxTypes:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = *(NSMutableSet **)((char *)&self->_disabledMailboxes + 7);
  v8 = v4;
  if (!v5)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = *(NSMutableSet **)((char *)&self->_disabledMailboxes + 7);
    *(NSMutableSet **)((char *)&self->_disabledMailboxes + 7) = v6;

    v5 = *(NSMutableSet **)((char *)&self->_disabledMailboxes + 7);
    v4 = v8;
  }
  objc_msgSend(v5, "unionSet:", v4);

}

- (void)enableMailboxTypes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = *(NSMutableSet **)((char *)&self->_disabledMailboxes + 7);
  if (v4)
    objc_msgSend(v4, "minusSet:", v5);

}

- (void)setHideInbox:(BOOL)a3
{
  char v3;
  _BOOL4 v4;
  char v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *((_BYTE *)self + 48);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    v4 = a3;
    if (a3)
      v6 = 2;
    else
      v6 = 0;
    *((_BYTE *)self + 48) = v3 & 0xFD | v6;
    v7 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 7));
    v9 = (id)v7;
    if (v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
      -[MailboxListViewControllerMail disableMailboxTypes:](self, "disableMailboxTypes:", v8);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
      -[MailboxListViewControllerMail enableMailboxTypes:](self, "enableMailboxTypes:", v8);
    }

  }
}

- (void)_reloadIfOutboxChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount outboxMailboxUid](MailAccount, "outboxMailboxUid"));
  if (!v4 || (*((_BYTE *)&self->super + 8) & 1) != 0)
  {
LABEL_8:
    *(CFAbsoluteTime *)((char *)&self->_editingToolbarItems + 7) = CFAbsoluteTimeGetCurrent();
    goto LABEL_9;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", MailMessageStoreChangedMailboxesKey));
  if (!objc_msgSend(v5, "containsObject:", v4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", MailMessageStoreMessageKey));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("mailbox")));

    if (objc_msgSend(v7, "containsObject:", v4))
      -[MailboxListViewControllerBase _loadMailboxes](self, "_loadMailboxes");

    goto LABEL_8;
  }
  -[MailboxListViewControllerBase _loadMailboxes:](self, "_loadMailboxes:", 1);

LABEL_9:
}

- (void)_queueReloadIfOutboxChanged:(id)a3
{
  double Current;
  double v5;
  id v6;

  v6 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v5 = *(double *)((char *)&self->_editingToolbarItems + 7);
  if (Current - v5 <= 1.0)
  {
    if (!HIBYTE(self->_lastCheckedOutbox))
    {
      -[MailboxListViewControllerMail performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_reloadIfOutboxChanged:", v6, v5 + 1.0 - Current);
      HIBYTE(self->_lastCheckedOutbox) = 1;
    }
  }
  else
  {
    -[MailboxListViewControllerMail _reloadIfOutboxChanged:](self, "_reloadIfOutboxChanged:", v6);
    HIBYTE(self->_lastCheckedOutbox) = 0;
  }

}

- (void)messageStoreChanged:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  -[MailboxListViewControllerMail performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "_queueReloadIfOutboxChanged:");

}

- (void)mailAccountsChanged:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase account](self, "account"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase account](self, "account"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueID"));

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountsProvider"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayedAccounts"));

      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v15, "isActive"))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueID"));
              v17 = objc_msgSend(v8, "isEqualToString:", v16);

              if (v17)
              {
                v12 = v15;
                goto LABEL_15;
              }
            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_15:

      -[MailboxListViewControllerMail setAccount:](self, "setAccount:", v12);
      -[MailboxListViewControllerBase _loadMailboxes:](self, "_loadMailboxes:", 1);

    }
  }
  else
  {
    -[MailboxListViewControllerMail performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v5, 0);
  }

}

- (void)pendingMailboxesChanged:(id)a3
{
  -[MailboxListViewControllerBase _loadMailboxes:](self, "_loadMailboxes:", 1);
}

- (void)contentSizeCategoryChanged:(id)a3
{
  id v4;
  id v5;

  +[MailboxTableCell invalidateCachedLayoutInformation](MailboxTableCell, "invalidateCachedLayoutInformation", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail tableView](self, "tableView"));
  +[MailboxTableCell defaultRowHeight](MailboxTableCell, "defaultRowHeight");
  objc_msgSend(v4, "setRowHeight:");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail tableView](self, "tableView"));
  objc_msgSend(v5, "reloadData");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail mailboxes](self, "mailboxes", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  MailboxTableCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  MailboxTableCell *v21;
  MailboxTableCell *v22;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail mailboxForIndexPath:](self, "mailboxForIndexPath:", a4));
  v8 = (MailboxTableCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("MailboxCellReuse")));
  if (!v8)
  {
    v8 = -[MailboxTableCell initWithStyle:reuseIdentifier:]([MailboxTableCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("MailboxCellReuse"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
    -[MailboxTableCell setPreferredSubtitleFont:](v8, "setPreferredSubtitleFont:", v9);

    -[MailboxTableCell setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMoveMessageViewMailboxListControllerCell);
  }
  if (v7)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
  else
    v10 = 0;
  -[MailboxTableCell setLegacyMailboxes:showUnreadCount:](v8, "setLegacyMailboxes:showUnreadCount:", v10, 1);
  -[MailboxTableCell setDisabledForEditing:](v8, "setDisabledForEditing:", objc_msgSend(v7, "mv_isEditable") ^ 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail filteredMailboxes](self, "filteredMailboxes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getObject"));
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail displayPathForMailbox:](self, "displayPathForMailbox:", v7));
    -[MailboxTableCell setSubtitle:](v8, "setSubtitle:", v14);
    v15 = (void *)v14;
    -[MailboxTableCell setFlattenHierarchy:](v8, "setFlattenHierarchy:", 1);
  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase selectedMailbox](self, "selectedMailbox"));
  if (v16 == v7)
  {

  }
  else
  {
    if (!v7 || (objc_msgSend(*(id *)((char *)self + 55), "containsObject:", v7) & 1) != 0)
    {

LABEL_13:
      -[MailboxTableCell setCellEnabled:](v8, "setCellEnabled:", 0);
      goto LABEL_16;
    }
    v17 = *(NSMutableSet **)((char *)&self->_disabledMailboxes + 7);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "type")));
    LODWORD(v17) = objc_msgSend(v17, "containsObject:", v18);

    if ((_DWORD)v17)
      goto LABEL_13;
  }
LABEL_16:
  v19 = objc_msgSend(v7, "isStore");
  v20 = objc_msgSend(v7, "mv_isEditable");
  v21 = v8;
  v22 = v21;
  if ((*((_BYTE *)self + 48) & 1) != 0)
  {
    -[MailboxTableCell setAccessoryType:](v21, "setAccessoryType:", v19);
    -[MailboxTableCell setEditingAccessoryType:](v22, "setEditingAccessoryType:", v20);
  }

  return v22;
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

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void **v11;
  void *v12;
  id v13;
  id v14;
  NSBundle *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  objc_super v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v4 = a4;
  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MailboxListViewControllerMail;
  -[MailboxListViewControllerMail setEditing:animated:](&v24, "setEditing:animated:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountsProvider"));
  v9 = objc_msgSend(v8, "isDisplayingMultipleAccounts");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail navigationItem](self, "navigationItem"));
    objc_msgSend(v10, "setHidesBackButton:animated:", v5, v4);

  }
  if (v5)
    -[MailboxListViewControllerMail focus:](self, "focus:", v4);
  else
    -[MailboxListViewControllerMail unfocus:](self, "unfocus:", v4);
  if ((-[MailboxListViewControllerMail isEditing](self, "isEditing") & 1) != 0)
  {
    v11 = (void **)((char *)&self->_defaultToolbarItems + 7);
    v12 = *(NSArray **)((char *)&self->_defaultToolbarItems + 7);
    if (!v12)
    {
      v13 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      v14 = objc_alloc((Class)UIBarButtonItem);
      v15 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NEW_MAILBOX"), &stru_100531B00, CFSTR("Main")));
      v18 = objc_msgSend(v14, "initWithTitle:style:target:action:", v17, 0, self, "newMailboxClicked:");

      v25[0] = v13;
      v25[1] = v18;
      v19 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
      v20 = *v11;
      *v11 = (void *)v19;
LABEL_16:

      v12 = *v11;
    }
  }
  else
  {
    v11 = (void **)((char *)&self->_disabledMailboxTypes + 7);
    v12 = *(NSMutableSet **)((char *)&self->_disabledMailboxTypes + 7);
    if (!v12)
    {
      v13 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
      v18 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail scene](self, "scene"));
      if ((+[UIDevice mf_isPad](UIDevice, "mf_isPad") & 1) == 0
        && objc_msgSend(v20, "conformsToProtocol:", &OBJC_PROTOCOL___ComposeCapable)
        && (objc_opt_respondsToSelector(v20, "newComposeButtonItem") & 1) != 0)
      {
        v21 = objc_msgSend(v20, "newComposeButtonItem");
        v27[0] = v13;
        v27[1] = v18;
        v27[2] = v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 3));
        -[MailboxListViewControllerMail setToolbarItems:](self, "setToolbarItems:", v22);

      }
      else
      {
        v26[0] = v13;
        v26[1] = v18;
        v21 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
        -[MailboxListViewControllerMail setToolbarItems:](self, "setToolbarItems:", v21);
      }

      goto LABEL_16;
    }
  }
  v23 = v12;
  -[MailboxListViewControllerMail setToolbarItems:animated:](self, "setToolbarItems:animated:", v23, v4);

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[MailboxListViewControllerMail setSelectedSourceType:](self, "setSelectedSourceType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail mailboxForIndexPath:](self, "mailboxForIndexPath:", v6));
  if (v5)
    -[MailboxListViewControllerBase setSelectedMailbox:animated:](self, "setSelectedMailbox:animated:", v5, 1);

}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

+ (int64_t)tableViewStyle
{
  return 0;
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

- (void)shouldReloadMailboxesWithOutbox:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    *((_BYTE *)&self->super + 8) |= 1u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase account](self, "account"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allMailboxUidsSortedWithSpecialsAtTopForAccount:includingLocals:client:outbox:", v6, 1, self, v9));
    -[MailboxListViewControllerBase setSortedMailboxes:](self, "setSortedMailboxes:", v7);

    *((_BYTE *)&self->super + 8) &= ~1u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail tableView](self, "tableView"));
    objc_msgSend(v8, "reloadData");

  }
  else
  {
    -[MailboxListViewControllerMail performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v9, 0);
  }

}

- (BOOL)shouldHideInbox
{
  return (*((unsigned __int8 *)self + 48) >> 1) & 1;
}

- (BOOL)shouldHideNotesForAccount:(id)a3
{
  return objc_msgSend(a3, "isSyncingNotes");
}

- (id)mailboxes
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail filteredMailboxes](self, "filteredMailboxes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getObject"));

  if (objc_msgSend(v4, "count"))
    v5 = v4;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase sortedMailboxes](self, "sortedMailboxes"));
  v6 = v5;

  return v6;
}

- (void)filterMailboxesContainingText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14[2];
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase sortedMailboxes](self, "sortedMailboxes"));
  v6 = objc_msgSend(v5, "copy");

  v7 = (char *)-[MailboxListViewControllerMail currentMailboxFilterID](self, "currentMailboxFilterID") + 1;
  -[MailboxListViewControllerMail setCurrentMailboxFilterID:](self, "setCurrentMailboxFilterID:", v7);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail mailboxFilterScheduler](self, "mailboxFilterScheduler"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C8B1C;
  v11[3] = &unk_10051DA30;
  objc_copyWeak(v14, &location);
  v9 = v4;
  v12 = v9;
  v10 = v6;
  v13 = v10;
  v14[1] = v7;
  objc_msgSend(v8, "performBlock:", v11);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

}

- (id)displayPathForMailbox:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  MailboxListViewControllerMail *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent"));
  v6 = objc_msgSend(v5, "isRootMailbox");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerMail mailboxDisplayPathCache](self, "mailboxDisplayPathCache"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueId"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000C8FB4;
    v11[3] = &unk_10051DA58;
    v12 = v4;
    v13 = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:generator:", v9, v11));

  }
  return v7;
}

- (unint64_t)selectedSourceType
{
  return *(_QWORD *)(&self->_isRefreshing + 4);
}

- (void)setSelectedSourceType:(unint64_t)a3
{
  *(_QWORD *)(&self->_isRefreshing + 4) = a3;
}

- (MailScene)scene
{
  return (MailScene *)objc_loadWeakRetained((id *)((char *)&self->_selectedSourceType + 7));
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)((char *)&self->_selectedSourceType + 7), a3);
}

- (EFCancelable)tableViewObserver
{
  return *(EFCancelable **)((char *)&self->_scene + 7);
}

- (void)setTableViewObserver:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_scene + 7), a3);
}

- (EFLocked)filteredMailboxes
{
  return *(EFCancelable **)((char *)&self->_tableViewObserver + 7);
}

- (void)setFilteredMailboxes:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_tableViewObserver + 7), a3);
}

- (int64_t)currentMailboxFilterID
{
  return *(int64_t *)((char *)&self->_filteredMailboxes + 7);
}

- (void)setCurrentMailboxFilterID:(int64_t)a3
{
  *(EFLocked **)((char *)&self->_filteredMailboxes + 7) = (EFLocked *)a3;
}

- (EFLazyCache)mailboxDisplayPathCache
{
  return *(EFLazyCache **)((char *)&self->_currentMailboxFilterID + 7);
}

- (void)setMailboxDisplayPathCache:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_currentMailboxFilterID + 7), a3);
}

- (EFScheduler)mailboxFilterScheduler
{
  return *(EFLazyCache **)((char *)&self->_mailboxDisplayPathCache + 7);
}

- (void)setMailboxFilterScheduler:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_mailboxDisplayPathCache + 7), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_mailboxDisplayPathCache + 7), 0);
  objc_storeStrong((id *)((char *)&self->_currentMailboxFilterID + 7), 0);
  objc_storeStrong((id *)((char *)&self->_tableViewObserver + 7), 0);
  objc_storeStrong((id *)((char *)&self->_scene + 7), 0);
  objc_destroyWeak((id *)((char *)&self->_selectedSourceType + 7));
  objc_destroyWeak((id *)(&self->_queuedOutboxCheck + 7));
  objc_storeStrong((id *)((char *)&self->_defaultToolbarItems + 7), 0);
  objc_storeStrong((id *)((char *)&self->_disabledMailboxTypes + 7), 0);
  objc_storeStrong((id *)((char *)&self->_disabledMailboxes + 7), 0);
  objc_storeStrong((id *)((char *)self + 55), 0);
}

@end
