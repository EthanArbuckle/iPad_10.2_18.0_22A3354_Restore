@implementation MailboxParentPickerTableController

- (MailboxParentPickerTableController)initWithMailboxUid:(id)a3 parentMailbox:(id)a4 visibleAccounts:(id)a5
{
  id v9;
  id v10;
  id v11;
  MailboxParentPickerTableController *v12;
  MailboxParentPickerTableController *v13;
  NSArray *v14;
  NSArray *visibleAccounts;
  NSMutableArray *sortedAccountsMailboxes;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MailboxParentPickerTableController;
  v12 = -[MailboxParentPickerTableController init](&v18, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mailbox, a3);
    objc_storeStrong((id *)&v13->_parentMailbox, a4);
    v14 = (NSArray *)objc_msgSend(v11, "copy");
    visibleAccounts = v13->_visibleAccounts;
    v13->_visibleAccounts = v14;

    sortedAccountsMailboxes = v13->_sortedAccountsMailboxes;
    v13->_sortedAccountsMailboxes = 0;

  }
  return v13;
}

- (NSMutableArray)sortedAccountsMailboxes
{
  NSMutableArray *sortedAccountsMailboxes;
  NSMutableArray *v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  sortedAccountsMailboxes = self->_sortedAccountsMailboxes;
  if (!sortedAccountsMailboxes)
  {
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v5 = self->_sortedAccountsMailboxes;
    self->_sortedAccountsMailboxes = v4;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerTableController visibleAccounts](self, "visibleAccounts", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          -[NSMutableArray addObject:](self->_sortedAccountsMailboxes, "addObject:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "genericMailboxUidsSortedForAccount:includingLocals:excludingMailbox:", v10, 0, self->_mailbox));

          -[NSMutableArray addObjectsFromArray:](self->_sortedAccountsMailboxes, "addObjectsFromArray:", v12);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    sortedAccountsMailboxes = self->_sortedAccountsMailboxes;
  }
  return sortedAccountsMailboxes;
}

- (int64_t)indexOfParentMailbox
{
  void *v3;
  id v4;

  if (!self->_parentMailbox)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerTableController sortedAccountsMailboxes](self, "sortedAccountsMailboxes"));
  v4 = objc_msgSend(v3, "indexOfObject:", self->_parentMailbox);

  return (int64_t)v4;
}

- (void)setMailboxSelectionTarget:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxSelectionTarget, a3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerTableController sortedAccountsMailboxes](self, "sortedAccountsMailboxes", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  MFMailboxUid *v7;
  MailMailboxGroupedPickerTableCell *v8;
  uint64_t v9;

  v6 = a3;
  v7 = (MFMailboxUid *)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerTableController mailboxForIndexPath:](self, "mailboxForIndexPath:", a4));
  v8 = (MailMailboxGroupedPickerTableCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("MailboxParentPickerReuseCell")));
  if (!v8)
    v8 = -[MailboxGroupedPickerTableCell initWithStyle:reuseIdentifier:]([MailMailboxGroupedPickerTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("MailboxParentPickerReuseCell"));
  -[MailboxGroupedPickerTableCell setMailbox:](v8, "setMailbox:", v7);
  if (self->_parentMailbox == v7)
    v9 = 3;
  else
    v9 = 0;
  -[MailMailboxGroupedPickerTableCell setAccessoryType:](v8, "setAccessoryType:", v9);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 tableViewPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerTableController indexPathForMailbox:](self, "indexPathForMailbox:", self->_parentMailbox));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v10, "row"), objc_msgSend(v9, "section")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerTableController mailboxForIndexPath:](self, "mailboxForIndexPath:", v8));
  objc_storeStrong((id *)&self->_parentMailbox, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cellForRowAtIndexPath:", v11));
  objc_msgSend(v13, "setAccessoryType:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cellForRowAtIndexPath:", v9));
  objc_msgSend(v14, "setAccessoryType:", 3);

  -[MailboxParentPickerSelectionTarget mailboxParentPickerDidSelectMailbox:](self->_mailboxSelectionTarget, "mailboxParentPickerDidSelectMailbox:", v12);
}

- (id)mailboxForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerTableController sortedAccountsMailboxes](self, "sortedAccountsMailboxes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

  v7 = objc_opt_class(MFMailboxUid);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
  }
  else
  {
    v9 = objc_opt_class(MailAccount);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootMailbox"));
  }
  v10 = v8;
LABEL_7:

  return v10;
}

- (id)indexPathForMailbox:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerTableController sortedAccountsMailboxes](self, "sortedAccountsMailboxes"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxParentPickerTableController sortedAccountsMailboxes](self, "sortedAccountsMailboxes")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account")),
        v6 = objc_msgSend(v7, "indexOfObject:", v8),
        v8,
        v7,
        v6 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));
  }

  return v9;
}

- (NSArray)visibleAccounts
{
  return self->_visibleAccounts;
}

- (void)setVisibleAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setSortedAccountsMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_sortedAccountsMailboxes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedAccountsMailboxes, 0);
  objc_storeStrong((id *)&self->_visibleAccounts, 0);
  objc_storeStrong((id *)&self->_mailboxSelectionTarget, 0);
  objc_storeStrong((id *)&self->_parentMailbox, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
}

@end
