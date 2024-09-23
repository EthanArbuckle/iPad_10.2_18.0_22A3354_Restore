@implementation EditFavoritesController

- (EditFavoritesController)initWithAccountsProvider:(id)a3 favoritesManager:(id)a4
{
  EditFavoritesController *v6;
  NSMutableArray *v7;
  NSMutableArray *selectedSmartMailboxes;
  NSMutableArray *v9;
  NSMutableArray *selectedFavoriteMailboxes;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  uint64_t v17;
  char isKindOfClass;
  id *p_selectedFavoriteMailboxes;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  NSArray *sortedAccounts;
  void *v25;
  uint64_t v26;
  NSArray *sortedMailboxes;
  NSArray *v28;
  void *v29;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];

  v32 = a3;
  v33 = a4;
  v38.receiver = self;
  v38.super_class = (Class)EditFavoritesController;
  v6 = -[EditFavoritesController initWithStyle:](&v38, "initWithStyle:", 2);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    selectedSmartMailboxes = v6->_selectedSmartMailboxes;
    v6->_selectedSmartMailboxes = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    selectedFavoriteMailboxes = v6->_selectedFavoriteMailboxes;
    v6->_selectedFavoriteMailboxes = v9;

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "orderedAccounts"));
    -[EditFavoritesController setIsSingleAccount:](v6, "setIsSingleAccount:", objc_msgSend(v32, "isDisplayingMultipleAccounts") ^ 1);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "mailboxesCollection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "items"));

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          v17 = objc_opt_class(FavoriteItem_Mailbox);
          isKindOfClass = objc_opt_isKindOfClass(v16, v17);
          p_selectedFavoriteMailboxes = (id *)&v6->_selectedFavoriteMailboxes;
          if ((isKindOfClass & 1) == 0)
          {
            v20 = objc_opt_class(FavoriteItem_SharedMailbox);
            v21 = objc_opt_isKindOfClass(v16, v20);
            p_selectedFavoriteMailboxes = (id *)&v6->_selectedSmartMailboxes;
            if ((v21 & 1) == 0)
            {
              v22 = objc_opt_class(FavoriteItem_UnifiedMailbox);
              v23 = objc_opt_isKindOfClass(v16, v22);
              p_selectedFavoriteMailboxes = (id *)&v6->_selectedSmartMailboxes;
              if ((v23 & 1) == 0)
                continue;
            }
          }
          objc_msgSend(*p_selectedFavoriteMailboxes, "addObject:", v16);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v13);
    }

    if (-[EditFavoritesController isSingleAccount](v6, "isSingleAccount"))
    {
      sortedAccounts = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "firstObject"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MailChangeManager sharedChangeManager](MailChangeManager, "sharedChangeManager"));
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allMailboxUidsSortedWithSpecialsAtTopForAccount:includingLocals:client:outbox:", sortedAccounts, 1, v6, 0));
      sortedMailboxes = v6->_sortedMailboxes;
      v6->_sortedMailboxes = (NSArray *)v26;

    }
    else
    {
      v28 = v31;
      sortedAccounts = v6->_sortedAccounts;
      v6->_sortedAccounts = v28;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v29, "addObserver:selector:name:object:", v6, "_contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);

    -[EditFavoritesController setHidesBottomBarWhenPushed:](v6, "setHidesBottomBarWhenPushed:", 1);
  }

  return v6;
}

- (void)viewDidLoad
{
  id v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)EditFavoritesController;
  -[EditFavoritesController viewDidLoad](&v15, "viewDidLoad");
  v3 = objc_alloc((Class)UIBarButtonItem);
  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_100531B00, CFSTR("Main")));
  v7 = objc_msgSend(v3, "initWithTitle:style:target:action:", v6, 2, self, "doneButtonClicked:");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MAILBOXES"), &stru_100531B00, CFSTR("Main")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController navigationItem](self, "navigationItem"));
  objc_msgSend(v12, "setTitle:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController tableView](self, "tableView"));
  +[MailboxTableCell defaultRowHeight](MailboxTableCell, "defaultRowHeight");
  objc_msgSend(v13, "setEstimatedRowHeight:");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController navigationController](self, "navigationController"));
  objc_msgSend(v14, "_setClipUnderlapWhileTransitioning:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EditFavoritesController;
  -[EditFavoritesController viewWillAppear:](&v6, "viewWillAppear:", a3);
  -[EditFavoritesController preferredContentSize](self, "preferredContentSize");
  -[EditFavoritesController setPreferredContentSize:](self, "setPreferredContentSize:", 375.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController mf_updatePreferredContentSizeBasedOnTableView](self, "mf_updatePreferredContentSizeBasedOnTableView"));
  -[EditFavoritesController setTableViewObserver:](self, "setTableViewObserver:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController tableView](self, "tableView"));
  objc_msgSend(v5, "reloadData");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)EditFavoritesController;
  -[EditFavoritesController traitCollectionDidChange:](&v5, "traitCollectionDidChange:", v4);
  -[EditFavoritesController mf_updateTableViewBackgroundColorForPopover](self, "mf_updateTableViewBackgroundColorForPopover");

}

- (void)doneButtonClicked:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "editFavoritesControllerDidFinish:", self);

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

- (BOOL)selectedStateForMailbox:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForMailbox:selected:](FavoriteItem, "itemForMailbox:selected:", a3, 1));
  LOBYTE(self) = -[NSMutableArray containsObject:](self->_selectedFavoriteMailboxes, "containsObject:", v4);

  return (char)self;
}

- (BOOL)toggleAndReturnSelectedStateForMailbox:(id)a3
{
  void *v4;
  unsigned int v5;
  NSMutableArray *selectedFavoriteMailboxes;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForMailbox:selected:](FavoriteItem, "itemForMailbox:selected:", a3, 1));
  v5 = -[NSMutableArray containsObject:](self->_selectedFavoriteMailboxes, "containsObject:", v4);
  selectedFavoriteMailboxes = self->_selectedFavoriteMailboxes;
  if (v5)
    -[NSMutableArray removeObject:](selectedFavoriteMailboxes, "removeObject:", v4);
  else
    -[NSMutableArray addObject:](selectedFavoriteMailboxes, "addObject:", v4);

  return v5 ^ 1;
}

- (void)didFinish
{
  -[EditFavoritesController doneButtonClicked:](self, "doneButtonClicked:", 0);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4;
  void *v6;

  if (a4)
    return -1;
  if (-[EditFavoritesController isSingleAccount](self, "isSingleAccount", a3))
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController sortedMailboxes](self, "sortedMailboxes"));
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController sortedAccounts](self, "sortedAccounts"));
  v4 = objc_msgSend(v6, "count");

  return (int64_t)v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  MailboxTableCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSBundle *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v32 = a3;
  v33 = a4;
  if (objc_msgSend(v33, "section"))
    goto LABEL_24;
  if (-[EditFavoritesController isSingleAccount](self, "isSingleAccount"))
  {
    v6 = (MailboxTableCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "dequeueReusableCellWithIdentifier:", CFSTR("MailReuseFavorites_Mailboxes")));
    if (!v6)
      v6 = -[MailboxTableCell initWithStyle:reuseIdentifier:]([MailboxTableCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("MailReuseFavorites_Mailboxes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController sortedMailboxes](self, "sortedMailboxes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v33, "row")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v8));
    -[MailboxTableCell setLegacyMailboxes:](v6, "setLegacyMailboxes:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForMailbox:selected:](FavoriteItem, "itemForMailbox:selected:", v8, 1));
    v11 = -[NSMutableArray containsObject:](self->_selectedFavoriteMailboxes, "containsObject:", v10)
        ? 3
        : 0;
    -[MailboxTableCell setAccessoryType:](v6, "setAccessoryType:", v11);

  }
  else
  {
    v6 = (MailboxTableCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "dequeueReusableCellWithIdentifier:", CFSTR("MailReuseFavorites_Accounts")));
    if (!v6)
      v6 = -[MailboxTableCell initWithStyle:reuseIdentifier:]([MailboxTableCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("MailReuseFavorites_Accounts"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController sortedAccounts](self, "sortedAccounts"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v33, "row")));

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = self->_selectedFavoriteMailboxes;
    v15 = 0;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "account"));
          v20 = objc_msgSend(v19, "isEqual:", v13);

          v15 += v20;
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v16);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayName"));
    -[MailboxTableCell setTitle:](v6, "setTitle:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v13));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount accountImageForAccounts:](MailAccount, "accountImageForAccounts:", v22));
    -[MailboxTableCell setIcon:](v6, "setIcon:", v23);

    if (v15)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v24, 1));

      v26 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("ITEMS_SELECTED%1$lu%2$@"), &stru_100531B00, CFSTR("Main")));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v28, v15, v25));

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell detailTextLabel](v6, "detailTextLabel"));
      objc_msgSend(v30, "setText:", v29);

    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxTableCell detailTextLabel](v6, "detailTextLabel"));
      objc_msgSend(v25, "setText:", 0);
    }

    -[MailboxTableCell setAccessoryType:](v6, "setAccessoryType:", 1);
  }
  if (!v6)
LABEL_24:
    __assert_rtn("-[EditFavoritesController tableView:cellForRowAtIndexPath:]", "EditFavoritesController.m", 215, "cell");

  return v6;
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  id v4;

  +[MailboxTableCell invalidateCachedLayoutInformation](MailboxTableCell, "invalidateCachedLayoutInformation", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[EditFavoritesController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  AccountFavoritesPickerController *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "section"))
  {
    if (-[EditFavoritesController isSingleAccount](self, "isSingleAccount"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cellForRowAtIndexPath:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController sortedMailboxes](self, "sortedMailboxes"));
      v9 = (AccountFavoritesPickerController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

      if (-[EditFavoritesController toggleAndReturnSelectedStateForMailbox:](self, "toggleAndReturnSelectedStateForMailbox:", v9))
      {
        v10 = 3;
      }
      else
      {
        v10 = 0;
      }
      objc_msgSend(v7, "setAccessoryType:", v10);
      objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v6, 1);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController sortedAccounts](self, "sortedAccounts"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

      v9 = objc_alloc_init(AccountFavoritesPickerController);
      -[MailboxListViewControllerBase setAccount:](v9, "setAccount:", v7);
      -[AccountFavoritesPickerController setDelegate:](v9, "setDelegate:", self);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController navigationController](self, "navigationController"));
      objc_msgSend(v12, "pushViewController:animated:", v9, 1);

    }
  }
  objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v6, 1);

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

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  v6 = a4;
  objc_msgSend(v6, "mf_updateBackgroundColorForPopover:", -[EditFavoritesController mf_supportsPopoverPresentation](self, "mf_supportsPopoverPresentation"));

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController sortedMailboxes](self, "sortedMailboxes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

  if (v7)
    v8 = objc_msgSend(v7, "mv_isSelectable");
  else
    v8 = 1;

  return v8;
}

- (NSArray)selectedSmartMailboxes
{
  return &self->_selectedSmartMailboxes->super;
}

- (NSArray)selectedFavoriteMailboxes
{
  return &self->_selectedFavoriteMailboxes->super;
}

- (EditFavoritesControllerDelegate)delegate
{
  return (EditFavoritesControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isSingleAccount
{
  return self->_isSingleAccount;
}

- (void)setIsSingleAccount:(BOOL)a3
{
  self->_isSingleAccount = a3;
}

- (NSArray)sortedAccounts
{
  return self->_sortedAccounts;
}

- (void)setSortedAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_sortedAccounts, a3);
}

- (NSArray)sortedMailboxes
{
  return self->_sortedMailboxes;
}

- (void)setSortedMailboxes:(id)a3
{
  objc_storeStrong((id *)&self->_sortedMailboxes, a3);
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
  objc_storeStrong((id *)&self->_sortedMailboxes, 0);
  objc_storeStrong((id *)&self->_sortedAccounts, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedFavoriteMailboxes, 0);
  objc_storeStrong((id *)&self->_selectedSmartMailboxes, 0);
}

@end
