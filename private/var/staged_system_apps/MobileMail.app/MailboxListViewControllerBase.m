@implementation MailboxListViewControllerBase

+ (int64_t)tableViewStyle
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  __assert_rtn("+[MailboxListViewControllerBase tableViewStyle]", "MailboxListViewControllerBase.m", 34, "0");
}

- (MailboxListViewControllerBase)init
{
  id v3;
  MailboxListViewControllerBase *v4;
  void *v5;
  objc_super v7;

  v3 = objc_msgSend((id)objc_opt_class(self), "tableViewStyle");
  v7.receiver = self;
  v7.super_class = (Class)MailboxListViewControllerBase;
  v4 = -[MailboxListViewControllerBase initWithStyle:](&v7, "initWithStyle:", v3);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "mailboxListingChanged:", AccountMailboxListingDidChange, 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MailboxListViewControllerBase;
  -[MailboxListViewControllerBase dealloc](&v4, "dealloc");
}

- (void)setAccount:(id)a3
{
  MailAccount *v5;

  v5 = (MailAccount *)a3;
  if (self->_account != v5)
  {
    objc_storeStrong((id *)&self->_account, a3);
    -[MailboxListViewControllerBase setSortedMailboxes:](self, "setSortedMailboxes:", 0);
  }

}

- (id)mailboxForIndexPath:(id)a3
{
  id v5;

  v5 = a3;
  -[MailboxListViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MailboxListViewControllerBase mailboxForIndexPath:]", "MailboxListViewControllerBase.m", 58, "0");
}

- (id)indexPathForMailbox:(id)a3
{
  id v5;

  v5 = a3;
  -[MailboxListViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MailboxListViewControllerBase indexPathForMailbox:]", "MailboxListViewControllerBase.m", 62, "0");
}

- (void)preventNextScrollbarFlash
{
  self->_preventNextScrollbarFlash = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (self->_preventNextScrollbarFlash)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase tableView](self, "tableView"));
    objc_msgSend(v5, "setScrollEnabled:", 0);

  }
  v7.receiver = self;
  v7.super_class = (Class)MailboxListViewControllerBase;
  -[MailboxListViewControllerBase viewDidAppear:](&v7, "viewDidAppear:", v3);
  if (self->_preventNextScrollbarFlash)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase tableView](self, "tableView"));
    objc_msgSend(v6, "setScrollEnabled:", 1);

    self->_preventNextScrollbarFlash = 0;
  }
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MailboxListViewControllerBase;
  -[MailboxListViewControllerBase viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase tableView](self, "tableView"));
  objc_msgSend(v3, "setAllowsSelectionDuringEditing:", 1);

}

- (void)setViewingContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));
  -[MailboxListViewControllerBase setAccount:](self, "setAccount:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionTarget"));
  objc_storeWeak(&self->_mailboxSelectionTarget, v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector(self, "isReappearing") & 1) != 0
    && -[MailboxListViewControllerBase isReappearing](self, "isReappearing"))
  {
    -[MailboxListViewControllerBase viewWillReappear:](self, "viewWillReappear:", v3);
  }
  else
  {
    -[MailboxListViewControllerBase viewWillFirstAppear:](self, "viewWillFirstAppear:", v3);
  }
  v5.receiver = self;
  v5.super_class = (Class)MailboxListViewControllerBase;
  -[MailboxListViewControllerBase viewWillAppear:](&v5, "viewWillAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailboxListViewControllerBase;
  -[MailboxListViewControllerBase viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  self->_interactiveTransitionWasCancelled = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase transitionCoordinator](self, "transitionCoordinator"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C524C;
  v5[3] = &unk_10051C0B8;
  v5[4] = self;
  objc_msgSend(v4, "notifyWhenInteractionChangesUsingBlock:", v5);

}

- (void)viewWillFirstAppear:(BOOL)a3
{
  void *v4;
  id v5;

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_loadMailboxes", 0);
  -[MailboxListViewControllerBase setSortedMailboxes:](self, "setSortedMailboxes:", 0);
  -[MailboxListViewControllerBase _loadMailboxes](self, "_loadMailboxes");
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFMonitoredInvocation mf_invocationWithSelector:target:](MFMonitoredInvocation, "mf_invocationWithSelector:target:", "fetchMailboxList", self->_account));
  objc_msgSend(v5, "addInvocation:", v4);

}

- (void)viewWillReappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL4 interactiveTransitionWasCancelled;
  void *v7;
  id v8;
  id v9;

  v3 = a3;
  -[MailboxListViewControllerBase _loadMailboxes](self, "_loadMailboxes");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase selectedMailbox](self, "selectedMailbox"));
  if (v8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase presentedViewController](self, "presentedViewController"));
    if (!v5)
    {
      interactiveTransitionWasCancelled = self->_interactiveTransitionWasCancelled;

      if (interactiveTransitionWasCancelled)
        goto LABEL_6;
      v8 = (id)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase indexPathForSelection](self, "indexPathForSelection"));
      if (!v8)
        goto LABEL_4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase tableView](self, "tableView"));
      if (!objc_msgSend(v5, "numberOfSections"))
        objc_msgSend(v5, "reloadData");
      objc_msgSend(v5, "scrollToRowAtIndexPath:atScrollPosition:animated:", v8, 0, 0);
      objc_msgSend(v5, "selectRowAtIndexPath:animated:scrollPosition:", v8, 0, 0);
      objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v8, v3);
    }

LABEL_4:
  }
LABEL_6:
  v9 = (id)objc_claimAutoreleasedReturnValue(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MFMonitoredInvocation mf_invocationWithSelector:target:](MFMonitoredInvocation, "mf_invocationWithSelector:target:", "fetchMailboxList", self->_account));
  objc_msgSend(v9, "addInvocation:", v7);

}

- (void)setSelectedMailbox:(id)a3
{
  -[MailboxListViewControllerBase setSelectedMailbox:animated:](self, "setSelectedMailbox:animated:", a3, 0);
}

- (void)setSelectedMailbox:(id)a3 animated:(BOOL)a4
{
  -[MailboxListViewControllerBase setSelectedMailbox:forceChange:animated:](self, "setSelectedMailbox:forceChange:animated:", a3, 0, a4);
}

- (void)setSelectedMailbox:(id)a3 forceChange:(BOOL)a4 animated:(BOOL)a5
{
  MFMailboxUid *v7;

  v7 = (MFMailboxUid *)a3;
  if (self->_selectedMailbox != v7)
    objc_storeStrong((id *)&self->_selectedMailbox, a3);
  -[MailboxListViewControllerBase didSelectMailbox:changed:animated:](self, "didSelectMailbox:changed:animated:");

}

- (void)didSelectMailbox:(id)a3 changed:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase mailboxSelectionTarget](self, "mailboxSelectionTarget"));
  if (v8 && v7 && v5 && (objc_opt_respondsToSelector(v7, "mailboxList:didSelectMailbox:") & 1) != 0)
    objc_msgSend(v7, "mailboxList:didSelectMailbox:", self, v8);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase mailboxForIndexPath:](self, "mailboxForIndexPath:", a4));
  -[MailboxListViewControllerBase setSelectedMailbox:forceChange:animated:](self, "setSelectedMailbox:forceChange:animated:");

}

- (id)_ntsMailboxesForAccount:(id)a3
{
  id v5;

  v5 = a3;
  -[MailboxListViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MailboxListViewControllerBase _ntsMailboxesForAccount:]", "MailboxListViewControllerBase.m", 172, "0");
}

- (void)_loadMailboxes
{
  -[MailboxListViewControllerBase _loadMailboxes:](self, "_loadMailboxes:", 0);
}

- (void)_loadMailboxesForcibly:(id)a3
{
  double Current;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    __assert_rtn("-[MailboxListViewControllerBase _loadMailboxesForcibly:]", "MailboxListViewControllerBase.m", 180, "[NSThread isMainThread]");
  Current = CFAbsoluteTimeGetCurrent();
  if ((objc_msgSend(v13, "BOOLValue") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase sortedMailboxes](self, "sortedMailboxes"));
    if (objc_msgSend(v5, "count"))
    {
      v6 = Current - *(double *)&qword_1005A9C78;

      if (v6 <= 5.0)
        goto LABEL_11;
    }
    else
    {

    }
  }
  qword_1005A9C78 = *(_QWORD *)&Current;
  *((_BYTE *)self + 8) |= 1u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase _ntsMailboxesForAccount:](self, "_ntsMailboxesForAccount:", self->_account));
  -[MailboxListViewControllerBase setSortedMailboxes:](self, "setSortedMailboxes:", v7);

  -[MailboxListViewControllerBase _loadExtraMailboxes](self, "_loadExtraMailboxes");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase selectedMailbox](self, "selectedMailbox"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase sortedMailboxes](self, "sortedMailboxes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase selectedMailbox](self, "selectedMailbox"));
    v11 = objc_msgSend(v9, "containsObject:", v10);

    if ((v11 & 1) == 0)
      -[MailboxListViewControllerBase setSelectedMailbox:](self, "setSelectedMailbox:", 0);
  }
  *((_BYTE *)self + 8) &= ~1u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase tableView](self, "tableView"));
  objc_msgSend(v12, "reloadData");

LABEL_11:
}

- (void)_loadMailboxes:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    -[MailboxListViewControllerBase _loadMailboxesForcibly:](self, "_loadMailboxesForcibly:", v4);
  else
    -[MailboxListViewControllerBase performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "_loadMailboxesForcibly:", v4, 0);

}

- (void)_popToMailboxListViewController
{
  id v4;
  id v5;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase navigationController](self, "navigationController"));
    v4 = objc_msgSend(v5, "popToViewController:animated:", self, 1);

  }
  else
  {
    -[MailboxListViewControllerBase performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)_loadMailboxesAfterMailboxListingChanged
{
  -[MailboxListViewControllerBase _loadMailboxes:](self, "_loadMailboxes:", 1);
}

- (void)mailboxListingChanged:(id)a3
{
  void *v4;
  MailAccount *v5;
  MailAccount *v6;
  MailAccount *v7;
  void *v8;
  void *v9;
  MailboxListViewControllerBase *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  MailboxListViewControllerBase *v14;
  id v15;

  v15 = a3;
  if ((*((_BYTE *)self + 8) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "object"));
    v5 = (MailAccount *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
    v6 = v5;
    if (!v4
      || self->_account == v5
      || (v7 = (MailAccount *)objc_claimAutoreleasedReturnValue(+[LocalAccount localAccount](LocalAccount, "localAccount")),
          v7,
          v7 == v6))
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_loadMailboxesAfterMailboxListingChanged", 0);
      -[MailboxListViewControllerBase performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_loadMailboxesAfterMailboxListingChanged", 0, 0.3);
    }
    *((_BYTE *)self + 8) &= ~1u;

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase selectedMailbox](self, "selectedMailbox"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase navigationController](self, "navigationController"));
    v10 = (MailboxListViewControllerBase *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topViewController"));
    if (v10 == self)
    {
LABEL_14:

      goto LABEL_15;
    }
    v11 = -[MailboxListViewControllerBase isEditing](self, "isEditing");

    if ((v11 & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("OldChildren")));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userInfo"));
      v14 = (MailboxListViewControllerBase *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("NewChildren")));

      if (objc_msgSend(v9, "containsObject:", v8)
        && (-[MailboxListViewControllerBase containsObject:](v14, "containsObject:", v8) & 1) == 0)
      {
        -[MailboxListViewControllerBase _popToMailboxListViewController](self, "_popToMailboxListViewController");
      }
      self = v14;
      goto LABEL_14;
    }
  }
LABEL_15:

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[MailboxListViewControllerBase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MailboxListViewControllerBase tableView:cellForRowAtIndexPath:]", "MailboxListViewControllerBase.m", 249, "0");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase sortedMailboxes](self, "sortedMailboxes", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (BOOL)shouldHideInbox
{
  return 0;
}

- (BOOL)shouldHideNotesForAccount:(id)a3
{
  return 0;
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
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxListViewControllerBase indexPathForMailbox:](self, "indexPathForMailbox:", v4));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MailAccount)account
{
  return self->_account;
}

- (MFMailboxUid)selectedMailbox
{
  return self->_selectedMailbox;
}

- (NSArray)sortedMailboxes
{
  return self->_sortedMailboxes;
}

- (void)setSortedMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_sortedMailboxes, a3);
}

- (id)mailboxSelectionTarget
{
  return objc_loadWeakRetained(&self->_mailboxSelectionTarget);
}

- (void)setMailboxSelectionTarget:(id)a3
{
  objc_storeWeak(&self->_mailboxSelectionTarget, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_mailboxSelectionTarget);
  objc_storeStrong((id *)&self->_sortedMailboxes, 0);
  objc_storeStrong((id *)&self->_selectedMailbox, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
