@implementation MailboxPickerCollectionHelper

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y;
  CGFloat x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double MinY;
  double v15;
  double v16;
  double v17;
  CGPoint result;
  CGRect v19;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper pinnedItemIdentifier](self, "pinnedItemIdentifier"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper pinnedItemIdentifier](self, "pinnedItemIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathForItemIdentifier:", v10));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutAttributesForItemAtIndexPath:", v11));
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "frame");
        MinY = CGRectGetMinY(v19);
        -[MailboxPickerCollectionHelper pinnedItemOffset](self, "pinnedItemOffset");
        y = MinY + v15;

        x = 0.0;
      }
    }

  }
  v16 = x;
  v17 = y;
  result.y = v17;
  result.x = v16;
  return result;
}

- (id)indexPathForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper model](self, "model"));
  if (_os_feature_enabled_impl("Mail", "CollapsibleMailboxes")
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "favoritesSection")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items")),
        v8 = objc_msgSend(v7, "containsObject:", v4),
        v7,
        v6,
        !v8))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForItemIdentifier:", v11));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItem:", v4));
  }

  return v9;
}

- (void)_performDataSourceUpdateAnimated:(BOOL)a3 forceReload:(BOOL)a4 update:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  unsigned int (**v9)(id, id);
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;

  v5 = a4;
  v6 = a3;
  v9 = (unsigned int (**)(id, id))a5;
  if (pthread_main_np() == 1)
  {
    if (v5)
    {
LABEL_3:
      v10 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
      goto LABEL_6;
    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxPickerCollectionHelper.m"), 389, CFSTR("Current thread must be main"));

    if (v5)
      goto LABEL_3;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "snapshot"));

LABEL_6:
  if (v9[2](v9, v10))
  {
    v13 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_100391F3C((uint64_t)v10, v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
    objc_msgSend(v14, "applySnapshot:animatingDifferences:", v10, v6);

  }
}

- (int64_t)_applyRemovalsInSnapshot:(id)a3 differences:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "removals"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000CEA48;
  v11[3] = &unk_10051DE58;
  v7 = v5;
  v12 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_compactMap:", v11));

  objc_msgSend(v7, "deleteItems:", v8);
  v9 = objc_msgSend(v8, "count");

  return (int64_t)v9;
}

- (void)selectMailbox:(id)a3 item:(id)a4 andPopToMailboxController:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  NSArray *mailboxesForMessageList;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;

  v6 = a6;
  v7 = a5;
  v11 = a3;
  v12 = a4;
  v13 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "itemID"));
    *(_DWORD *)buf = 138413058;
    v30 = v14;
    v31 = 2114;
    v32 = v15;
    v33 = 1024;
    v34 = v7;
    v35 = 1024;
    v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Favorites selectMailbox mailbox:%@ item:%{public}@ popToMailboxConttoller:%{BOOL}d animated:%{BOOL}d", buf, 0x22u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper delegate](self, "delegate"));
  if (objc_msgSend(v16, "mailboxCollectionHelperMailboxPickerIsEditing:", self))
  {
    objc_msgSend(v16, "mailboxCollectionHelper:wantsToPresentMailboxEditControllerForMailbox:animated:", self, v11, v6);
  }
  else
  {
    if (!v11)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxPickerCollectionHelper.m"), 1277, CFSTR("Unable to select a mailbox item without a valid mailbox to select"));

    }
    if (objc_msgSend(v11, "mailboxType") == (id)6)
      v17 = objc_claimAutoreleasedReturnValue(+[MailAccount defaultMailAccountForDelivery](MailAccount, "defaultMailAccountForDelivery"));
    else
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "representedAccount"));
    v18 = (void *)v17;
    if (!v17)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxPickerCollectionHelper.m"), 1286, CFSTR("Unable to select a mailbox item without a valid account for the mailbox selection"));

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper scene](self, "scene"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v18));
    objc_msgSend(v19, "setSelectedAccounts:", v20);

    v28 = v11;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper createMailboxesFromUids:](self, "createMailboxesFromUids:", v21));
    mailboxesForMessageList = self->_mailboxesForMessageList;
    self->_mailboxesForMessageList = v22;

    if (!v12)
    {
      if (objc_msgSend(v11, "mailboxType") == (id)7)
        v24 = objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForInboxWithAccount:selected:](FavoriteItem, "itemForInboxWithAccount:selected:", v18, 0));
      else
        v24 = objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForMailbox:selected:](FavoriteItem, "itemForMailbox:selected:", v11, 0));
      v12 = (id)v24;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesManager](self, "favoritesManager"));
    objc_msgSend(v25, "setLastSelectedItem:", v12);

    -[MailboxPickerCollectionHelper updateMailboxSelectionAnimated:scrollToSelected:](self, "updateMailboxSelectionAnimated:scrollToSelected:", 0, 1);
    objc_msgSend(v16, "mailboxCollectionHelper:wantsToSelectMailbox:account:animated:", self, v11, v18, v6);

  }
}

- (int64_t)_applyInsertionsInSnapshot:(id)a3 differences:(id)a4 collection:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v7 = a3;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "mf_groupedInsertionsForCollection:", a5));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "type", (_QWORD)v17) == (id)2)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "insertions"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "associatedObject"));
          objc_msgSend(v7, "insertItems:beforeItem:", v13, v14);
LABEL_10:

          goto LABEL_12;
        }
        if (objc_msgSend(v12, "type") == (id)1)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "insertions"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "associatedObject"));
          objc_msgSend(v7, "insertItems:afterItem:", v13, v14);
          goto LABEL_10;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "insertions"));
        objc_msgSend(v7, "appendItems:", v13);
LABEL_12:

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = objc_msgSend(v8, "count");
  return (int64_t)v15;
}

- (MailboxPickerCollectionHelper)initWithCollectionView:(id)a3 favoritesManager:(id)a4 focusController:(id)a5 scene:(id)a6 logClient:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MailboxPickerCollectionHelper *v17;
  MailboxPickerCollectionHelper *v18;
  id v19;
  void *v20;
  void *v21;
  EFDebouncer *v22;
  EFDebouncer *favoritesDidChangedDebouncer;
  uint64_t v24;
  UIColor *multiSelectCheckmarkColor;
  MailboxPickerCollectionHelperModel *v26;
  MailboxPickerCollectionHelperModel *model;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  _QWORD v33[4];
  id v34;
  id location;
  objc_super v36;

  v32 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v36.receiver = self;
  v36.super_class = (Class)MailboxPickerCollectionHelper;
  v17 = -[MailboxPickerCollectionHelper init](&v36, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_scene, a6);
    objc_storeStrong((id *)&v18->_collectionView, a3);
    objc_storeStrong((id *)&v18->_favoritesManager, a4);
    v19 = objc_alloc((Class)EFDebouncer);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper _favoritesDidChangedBlock](v18, "_favoritesDidChangedBlock"));
    v22 = (EFDebouncer *)objc_msgSend(v19, "initWithTimeInterval:scheduler:startAfter:block:", v20, 0, v21, 0.2);
    favoritesDidChangedDebouncer = v18->_favoritesDidChangedDebouncer;
    v18->_favoritesDidChangedDebouncer = v22;

    objc_storeStrong((id *)&v18->_logClient, a7);
    v24 = objc_claimAutoreleasedReturnValue(+[UIColor mailInteractiveColor](UIColor, "mailInteractiveColor"));
    multiSelectCheckmarkColor = v18->_multiSelectCheckmarkColor;
    v18->_multiSelectCheckmarkColor = (UIColor *)v24;

    v26 = -[MailboxPickerCollectionHelperModel initWithFavoritesManager:]([MailboxPickerCollectionHelperModel alloc], "initWithFavoritesManager:", v13);
    model = v18->_model;
    v18->_model = v26;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v18);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10003C914;
    v33[3] = &unk_10051DB10;
    objc_copyWeak(&v34, &location);
    objc_msgSend(v14, "getCurrentFocus:", v33);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesManager](v18, "favoritesManager"));
    objc_msgSend(v28, "addObserver:selector:name:object:", v18, "_favoritesDidChange:", CFSTR("FavoritesManagerFavoritesDidChangeNotification"), v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v30, "addObserver:selector:name:object:", v18, "_favoritesFocusDidChange:", CFSTR("FavoritesPersistenceFocusDidChangeNotification"), 0);

    -[MailboxPickerCollectionHelper _setupDataSource](v18, "_setupDataSource");
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v18;
}

- (void)_performDataSourceUpdateAnimated:(BOOL)a3 forceReload:(BOOL)a4 update:(id)a5 toSection:(id)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  unsigned int (**v11)(id, id);
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;

  v7 = a4;
  v8 = a3;
  v11 = (unsigned int (**)(id, id))a5;
  v12 = a6;
  if (pthread_main_np() != 1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxPickerCollectionHelper.m"), 403, CFSTR("Current thread must be main"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper sectionController](self, "sectionController"));
  v14 = v13;
  if (v7)
    v15 = objc_alloc_init((Class)NSDiffableDataSourceSectionSnapshot);
  else
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "snapshotForSection:", v12));
  v16 = v15;
  if (v11[2](v11, v15))
  {
    v17 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_100391FAC((uint64_t)v16, (uint64_t)v12, v17);

    objc_msgSend(v14, "applySnapshot:toSection:animatingDifferences:", v16, v12, v8);
  }

}

- (void)updateMailboxSelectionAnimated:(BOOL)a3 scrollToSelected:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSMutableArray *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  NSMutableArray *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[16];
  _BYTE v51[128];

  v40 = a4;
  v41 = a3;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesManager](self, "favoritesManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastSelectedItem"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "displayedAccountsForMailboxCollectionHelper:", self));
    v8 = objc_msgSend(v7, "count");

    if ((unint64_t)v8 < 2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper scene](self, "scene"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedAccounts"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anyObject"));

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForInboxWithAccount:selected:](FavoriteItem, "itemForInboxWithAccount:selected:", v11, 1));
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForUnifiedMailboxWithType:selected:](FavoriteItem, "itemForUnifiedMailboxWithType:selected:", 7, 1));
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesManager](self, "favoritesManager"));
    objc_msgSend(v12, "setLastSelectedItem:", v6);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "snapshot"));
  v15 = objc_msgSend(v14, "numberOfItems");

  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject indexPathsForSelectedItems](v16, "indexPathsForSelectedItems"));
    if (objc_msgSend(v42, "count") == (id)1
      && (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "firstObject")),
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoriteItemAtIndexPath:](self, "favoriteItemAtIndexPath:", v17)), v17, v18, v18 == v6))
    {
      v19 = 0;
      v20 = 1;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper indexPathForItem:](self, "indexPathForItem:", v6));
      v20 = 0;
    }
    if (((v20 | _os_feature_enabled_impl("Mail", "OpenMailboxQuickly") ^ 1) & 1) == 0 && !v19)
    {
      v21 = objc_opt_new(NSMutableArray);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "representingMailbox"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "parent"));

      if (v23)
      {
        do
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesManager](self, "favoritesManager"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "displayName"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "itemsMatchingName:", v25));

          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v27 = v26;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          if (v28)
          {
            v29 = *(_QWORD *)v47;
            do
            {
              for (i = 0; i != v28; i = (char *)i + 1)
              {
                if (*(_QWORD *)v47 != v29)
                  objc_enumerationMutation(v27);
                v31 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v31, "isExpandable")
                  && (objc_msgSend(v31, "isExpanded") & 1) == 0)
                {
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "itemID"));
                  -[NSMutableArray addObject:](v21, "addObject:", v32);

                }
              }
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
            }
            while (v28);
          }

          v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "parent"));
          v23 = (void *)v33;
        }
        while (v33);
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v21, "lastObject"));
      if (!v35)
        goto LABEL_27;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "snapshot"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "sectionIdentifierForSectionContainingItemIdentifier:", v35));

      if (!v37)
        goto LABEL_27;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000D018C;
      v44[3] = &unk_10051DD60;
      v45 = v21;
      -[MailboxPickerCollectionHelper _performDataSourceUpdateAnimated:forceReload:update:toSection:](self, "_performDataSourceUpdateAnimated:forceReload:update:toSection:", 1, 0, v44, v37);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper indexPathForItem:](self, "indexPathForItem:", v6));

      if (!v19)
      {
LABEL_27:
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "firstObject"));
        if (v38)
          -[NSObject deselectItemAtIndexPath:animated:](v16, "deselectItemAtIndexPath:animated:", v38, v41);

        v19 = 0;
      }

    }
    if (v19 && objc_msgSend(v43, "mailboxCollectionHelperShouldUpdateMailboxSelection:", self))
    {
      if (-[NSObject mf_isIndexPathValid:](v16, "mf_isIndexPathValid:", v19))
      {
        if (v40)
          -[NSObject scrollToItemAtIndexPath:atScrollPosition:animated:](v16, "scrollToItemAtIndexPath:atScrollPosition:animated:", v19, 0, v41);
        if ((objc_msgSend(v42, "containsObject:", v19) & 1) == 0)
        {
          -[NSObject selectItemAtIndexPath:animated:scrollPosition:](v16, "selectItemAtIndexPath:animated:scrollPosition:", v19, 0, 0);
          if (-[MailboxPickerCollectionHelper isSplitViewCollapsed](self, "isSplitViewCollapsed"))
            -[NSObject deselectItemAtIndexPath:animated:](v16, "deselectItemAtIndexPath:animated:", v19, v41);
        }
      }
      else
      {
        v39 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          sub_10039202C((uint64_t)v19, (uint64_t)v16, v39);

      }
    }

  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Skip selection as data source is empty", buf, 2u);
    }
  }

}

- (void)reloadDataSourceWithReason:(int64_t)a3
{
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *j;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  unsigned int v29;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id obj;
  NSMutableDictionary *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  id v45;
  NSMutableDictionary *v46;
  _QWORD v47[4];
  NSMutableDictionary *v48;
  void *v49;
  MailboxPickerCollectionHelper *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  MailboxPickerCollectionHelper *v57;
  uint8_t buf[4];
  uint64_t v59;
  _BYTE v60[128];
  _BYTE v61[128];

  if (pthread_main_np() != 1)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxPickerCollectionHelper.m"), 230, CFSTR("Current thread must be main"));

  }
  v5 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Favorites Reloading data source...", buf, 2u);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
  objc_msgSend(v33, "contentOffset");
  v7 = v6;
  v9 = v8;
  v29 = objc_msgSend(v33, "isEditing");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper model](self, "model"));
  objc_msgSend(v10, "invalidateSections");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper model](self, "model"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sections"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper currentFocus](self, "currentFocus"));
  v13 = sub_10000B428(self, v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100010E70;
  v55[3] = &unk_10051DCC0;
  v14 = v32;
  v56 = v14;
  v57 = self;
  -[MailboxPickerCollectionHelper _performDataSourceUpdateAnimated:forceReload:update:](self, "_performDataSourceUpdateAnimated:forceReload:update:", 0, 0, v55);
  v36 = objc_opt_new(NSMutableDictionary);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_1000CDC78;
        v47[3] = &unk_10051DCE8;
        v48 = v36;
        v49 = v18;
        v50 = self;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sectionIdentifier"));
        -[MailboxPickerCollectionHelper _performDataSourceUpdateAnimated:forceReload:update:toSection:](self, "_performDataSourceUpdateAnimated:forceReload:update:toSection:", 0, 0, v47, v19);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v15);
  }

  if (_os_feature_enabled_impl("Mail", "CollapsibleMailboxes"))
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000CDD20;
    v44[3] = &unk_10051DD38;
    v44[4] = self;
    v45 = obj;
    v46 = v36;
    -[MailboxPickerCollectionHelper _performDataSourceUpdateAnimated:forceReload:update:](self, "_performDataSourceUpdateAnimated:forceReload:update:", 0, 0, v44);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
  v43 = 0u;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  v34 = v31;
  v21 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v34);
        v24 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "snapshot"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "sectionIdentifierForSectionContainingItemIdentifier:", v24));

        if (v26)
        {
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_1000CE2E0;
          v39[3] = &unk_10051DD60;
          v39[4] = v24;
          -[MailboxPickerCollectionHelper _performDataSourceUpdateAnimated:forceReload:update:toSection:](self, "_performDataSourceUpdateAnimated:forceReload:update:toSection:", 1, 0, v39, v26);
        }
        else
        {
          v27 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v59 = v24;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#Favorites Did not find section identifier to collapse for itemID: %{public}@", buf, 0xCu);
          }

        }
      }
      v21 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
    }
    while (v21);
  }

  if (a3 == 1)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000CE39C;
    v37[3] = &unk_10051DCC0;
    v37[4] = self;
    v38 = v20;
    -[MailboxPickerCollectionHelper _performDataSourceUpdateAnimated:forceReload:update:](self, "_performDataSourceUpdateAnimated:forceReload:update:", 0, 0, v37);

  }
  -[MailboxPickerCollectionHelper updatedSelectedState:](self, "updatedSelectedState:", v33);
  if (v29)
    objc_msgSend(v33, "setContentOffset:animated:", 0, v7, v9);
  else
    -[MailboxPickerCollectionHelper updateMailboxSelectionAnimated:scrollToSelected:](self, "updateMailboxSelectionAnimated:scrollToSelected:", 0, 0);

}

- (int64_t)sectionTypeForIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sections"));

  if ((unint64_t)objc_msgSend(v5, "count") <= a3)
  {
    v7 = 3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));
    v7 = (int64_t)objc_msgSend(v6, "type");

  }
  return v7;
}

- (id)favoriteItemForItemID:(id)a3 inSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper model](self, "model"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "favoriteItemForItemID:inSection:", v6, v7));

  return v9;
}

- (void)_setupDataSource
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  int v25;
  _QWORD *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  Block_layout *v39;
  id v40;
  _QWORD v41[4];
  Block_layout *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  id location[2];

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  v3 = objc_opt_class(MailboxOutlineCell);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1000CD16C;
  v51[3] = &unk_10051DB38;
  objc_copyWeak(&v52, location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v3, v51));
  v5 = objc_opt_class(MailboxOutlineCell);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000CD20C;
  v49[3] = &unk_10051DB38;
  objc_copyWeak(&v50, location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v5, v49));
  v7 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView", v6, v4));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000CD26C;
  v46[3] = &unk_10051DB60;
  v9 = v6;
  v47 = v9;
  v10 = v4;
  v48 = v10;
  v11 = objc_msgSend(v7, "initWithCollectionView:cellProvider:", v8, v46);
  -[MailboxPickerCollectionHelper setDataSource:](self, "setDataSource:", v11);

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000CD35C;
  v44[3] = &unk_10051DBC8;
  objc_copyWeak(&v45, location);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reorderingHandlers"));
  objc_msgSend(v13, "setCanReorderItemHandler:", v44);

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000CD404;
  v41[3] = &unk_10051DBF0;
  objc_copyWeak(&v43, location);
  v42 = &stru_10051DBA0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "reorderingHandlers"));
  objc_msgSend(v15, "setWillReorderHandler:", v41);

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000CD804;
  v38[3] = &unk_10051DBF0;
  objc_copyWeak(&v40, location);
  v39 = &stru_10051DBA0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "reorderingHandlers"));
  objc_msgSend(v17, "setDidReorderHandler:", v38);

  v18 = objc_alloc((Class)_UIDiffableDataSourceOutlineSectionController);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
  v20 = objc_msgSend(v18, "initWithDiffableDataSource:", v19);
  -[MailboxPickerCollectionHelper setSectionController:](self, "setSectionController:", v20);

  v21 = objc_alloc_init((Class)UICollectionViewDiffableDataSourceSectionSnapshotHandlers);
  v29 = v10;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000CD8F0;
  v36[3] = &unk_10051DBC8;
  objc_copyWeak(&v37, location);
  objc_msgSend(v21, "setShouldExpandItemHandler:", v36);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000CD970;
  v34[3] = &unk_10051DC18;
  objc_copyWeak(&v35, location);
  v22 = objc_retainBlock(v34);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000CDA4C;
  v32[3] = &unk_10051DC18;
  objc_copyWeak(&v33, location);
  v23 = objc_retainBlock(v32);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000CDB4C;
  v30[3] = &unk_10051DC18;
  objc_copyWeak(&v31, location);
  v24 = objc_retainBlock(v30);
  v25 = _os_feature_enabled_impl("Mail", "CollapsibleMailboxes");
  if (v25)
    v26 = v23;
  else
    v26 = v22;
  objc_msgSend(v21, "setWillExpandItemHandler:", v26);
  if (v25)
    v27 = v24;
  else
    v27 = v22;
  objc_msgSend(v21, "setWillCollapseItemHandler:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
  objc_msgSend(v28, "setSectionSnapshotHandlers:", v21);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);

  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(location);
}

- (id)favoriteItemForItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItemIdentifier:", v4));

  if (_os_feature_enabled_impl("Mail", "CollapsibleMailboxes"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sections"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section")));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoriteItemForItemID:inSection:](self, "favoriteItemForItemID:inSection:", v4, v9));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoriteItemAtIndexPath:](self, "favoriteItemAtIndexPath:", v6));
  }

  return v10;
}

- (BOOL)_updateSnapshot:(id)a3 forSection:(id)a4
{
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  unsigned int v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v50;
  int64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  int64_t v57;
  BOOL v58;
  void *v59;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id obj;
  _QWORD v66[4];
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  id v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  int64_t v81;
  __int16 v82;
  int64_t v83;
  void *v84;
  _BYTE v85[128];
  _BYTE v86[128];

  v56 = a3;
  v64 = a4;
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "items"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "ef_map:", &stru_10051DDD0));
  if (objc_msgSend(v64, "isFavorites"))
    objc_msgSend(v64, "prepareItemsForView");
  if (objc_msgSend(v64, "isFavorites"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "collection"));
    v6 = objc_msgSend(v5, "isEditing");

    if (v6)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "arrayByAddingObject:", CFSTR("kAddButtonItemIdentifier")));

      v62 = (void *)v7;
    }
  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v62));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "items"));
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_1000CE970;
  v76[3] = &unk_10051C680;
  v61 = v56;
  v77 = v61;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ef_filter:", v76));

  v54 = (void *)v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v9));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "differenceFromOrderedSet:", v10));

  v55 = (void *)v11;
  v57 = -[MailboxPickerCollectionHelper _applyRemovalsInSnapshot:differences:](self, "_applyRemovalsInSnapshot:differences:", v61, v11);
  v51 = -[MailboxPickerCollectionHelper _applyInsertionsInSnapshot:differences:collection:](self, "_applyInsertionsInSnapshot:differences:collection:", v61, v11, v63);
  v58 = (v57 | v51) != 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "accountFavoriteItem"));
  v59 = v12;
  if (_os_feature_enabled_impl("Mail", "CollapsibleMailboxes"))
  {
    v13 = objc_msgSend(v64, "isAccounts");
    if (v12)
      v14 = v13;
    else
      v14 = 0;
    if (v14 != 1)
      goto LABEL_47;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "itemID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subItems"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ef_filter:", &stru_10051DDF0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v50, v52);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = v50;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v73 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "itemUUID"));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, v22);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
      }
      while (v18);
    }

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "subItems"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(_QWORD *)v69 != v25)
            objc_enumerationMutation(v23);
          v27 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "itemUUID"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v28));

          if (!v29)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "representingMailbox"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "parent"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "uniqueId"));

            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v32));
            v34 = objc_msgSend(v33, "mutableCopy");

            if (!v34)
              v34 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            objc_msgSend(v34, "addObject:", v27);
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v34, v32);
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "itemUUID"));
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v27, v35);

          }
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
      }
      while (v24);
    }

    if (objc_msgSend(v17, "count"))
    {
      sub_100022734(self, v59, v52, v61, v17);
      v58 = 1;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "collection"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "expandedItems"));
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1000CE994;
    v66[3] = &unk_10051CB08;
    v38 = v61;
    v67 = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "ef_filter:", v66));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "ef_compactMap:", &stru_10051DE30));

    if (objc_msgSend(v59, "isExpanded"))
      v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "arrayByAddingObject:", v52));
    else
      v41 = v40;
    v46 = v41;
    if (objc_msgSend(v41, "count"))
    {
      objc_msgSend(v38, "expandItems:", v46);
      v58 = 1;
    }

  }
  else
  {
    v42 = objc_msgSend(v64, "isAccounts");
    if (v12)
      v43 = v42;
    else
      v43 = 0;
    if (v43 != 1)
      goto LABEL_47;
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "itemID"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subItems"));
    if (objc_msgSend(v44, "count"))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper snapshotFromFavoriteItems:](self, "snapshotFromFavoriteItems:", v44));
      objc_msgSend(v61, "setChildrenWithSnapshot:forParent:", v45, v52);

      v58 = 1;
    }
    if (!objc_msgSend(v12, "isExpanded"))
      goto LABEL_46;
    v84 = v52;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v84, 1));
    obj = v44;
    objc_msgSend(v61, "expandItems:", v16);
    v58 = 1;
  }

  v44 = obj;
LABEL_46:

LABEL_47:
  v47 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "sectionIdentifier"));
    *(_DWORD *)buf = 138412802;
    v79 = v48;
    v80 = 2048;
    v81 = v51;
    v82 = 2048;
    v83 = v57;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "#Favorites %@ - Added %ld, removed %ld favorite items", buf, 0x20u);

  }
  return v58;
}

- (void)updatedSelectedState:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
  v5 = objc_msgSend(v4, "isEditing");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathsForSelectedItems"));
    for (i = 0; (uint64_t)objc_msgSend(v10, "numberOfItemsInSection:", 0) - 1 > i; ++i)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", i, 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoriteItemAtIndexPath:](self, "favoriteItemAtIndexPath:", v8));
      if (objc_msgSend(v9, "isSelected"))
      {
        objc_msgSend(v10, "selectItemAtIndexPath:animated:scrollPosition:", v8, 0, 0);
      }
      else if (objc_msgSend(v6, "containsObject:", v8))
      {
        objc_msgSend(v10, "deselectItemAtIndexPath:animated:", v8, 0);
      }

    }
    -[MailboxPickerCollectionHelper updateCheckmarkColor:](self, "updateCheckmarkColor:", v10);

  }
}

- (id)snapshotFromFavoriteItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _BYTE *v12;
  int v13;
  int64_t v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_compactMap:", &stru_10051DEA0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v5));
  v7 = objc_msgSend(v6, "count");
  if (v7 != objc_msgSend(v4, "count"))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(v5, "count");
      v13 = 134217984;
      v14 = v12 - (_BYTE *)objc_msgSend(v6, "count");
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Favorites Found %ld duplicated itemIDs. Those items will be skipped.", (uint8_t *)&v13, 0xCu);
    }

  }
  v9 = objc_alloc_init((Class)NSDiffableDataSourceSectionSnapshot);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "array"));
  objc_msgSend(v9, "appendItems:", v10);

  return v9;
}

- (void)setSectionController:(id)a3
{
  objc_storeStrong((id *)&self->_sectionController, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void)setCurrentFocus:(id)a3
{
  objc_storeStrong((id *)&self->_currentFocus, a3);
}

- (void)selectMailbox:(id)a3 item:(id)a4 animated:(BOOL)a5
{
  -[MailboxPickerCollectionHelper selectMailbox:item:andPopToMailboxController:animated:](self, "selectMailbox:item:andPopToMailboxController:animated:", a3, a4, 1, a5);
}

- (_UIDiffableDataSourceOutlineSectionController)sectionController
{
  return self->_sectionController;
}

- (MailMainScene)scene
{
  return self->_scene;
}

- (NSString)pinnedItemIdentifier
{
  return self->_pinnedItemIdentifier;
}

- (MailboxPickerCollectionHelperModel)model
{
  return self->_model;
}

- (NSArray)mailboxesForMessageList
{
  return self->_mailboxesForMessageList;
}

- (OS_os_log)logClient
{
  return self->_logClient;
}

- (BOOL)isSplitViewCollapsed
{
  MailboxPickerCollectionHelper *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper delegate](self, "delegate"));
  LOBYTE(v2) = objc_msgSend(v3, "mailboxCollectionHelperSplitViewControllerIsCollapsed:", v2);

  return (char)v2;
}

- (FavoritesManager)favoritesManager
{
  return self->_favoritesManager;
}

- (EFDebouncer)favoritesDidChangedDebouncer
{
  return self->_favoritesDidChangedDebouncer;
}

- (MailboxPickerCollectionHelperDelegate)delegate
{
  return (MailboxPickerCollectionHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (EMFocus)currentFocus
{
  return self->_currentFocus;
}

- (id)createMailboxesFromUids:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxProvider"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003B054;
  v9[3] = &unk_10051DAA8;
  v10 = v5;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ef_compactMap:", v9));

  return v7;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (id)_favoritesDidChangedBlock
{
  _QWORD *v2;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000090B8;
  v4[3] = &unk_10051DEC8;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)_favoritesDidChange:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (pthread_main_np() != 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxPickerCollectionHelper.m"), 777, CFSTR("Current thread must be main"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesDidChangedDebouncer](self, "favoritesDidChangedDebouncer"));
  objc_msgSend(v5, "debounceResult:", v7);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesDidChangedDebouncer](self, "favoritesDidChangedDebouncer"));
  objc_msgSend(v4, "cancel");

  v5.receiver = self;
  v5.super_class = (Class)MailboxPickerCollectionHelper;
  -[MailboxPickerCollectionHelper dealloc](&v5, "dealloc");
}

- (void)reloadDataSource
{
  -[MailboxPickerCollectionHelper reloadDataSourceWithReason:](self, "reloadDataSourceWithReason:", 0);
}

- (void)reloadFavorites
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper model](self, "model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if ((objc_msgSend(v6, "isFavorites") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxPickerCollectionHelper.m"), 354, CFSTR("First section is not favorites"));

  }
  v7 = v6;
  v12 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionIdentifier", _NSConcreteStackBlock, 3221225472, sub_1000CE680, &unk_10051DDB0, self));
  -[MailboxPickerCollectionHelper _performDataSourceUpdateAnimated:forceReload:update:toSection:](self, "_performDataSourceUpdateAnimated:forceReload:update:toSection:", 0, 0, &v11, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
  -[MailboxPickerCollectionHelper updatedSelectedState:](self, "updatedSelectedState:", v9);

}

- (void)reloadDataForIndexPaths:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  _BYTE v21[128];

  v5 = a3;
  if (pthread_main_np() != 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxPickerCollectionHelper.m"), 364, CFSTR("Current thread must be main"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(v6, "mf_isIndexPathValid:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), (_QWORD)v15) & 1) == 0)
        {
          v11 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Favorites reloadItemsAtIndexPaths skipped because the data is out of sync with UI", buf, 2u);
          }

          goto LABEL_15;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

  if (objc_msgSend(v7, "count"))
  {
    v12 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Favorites reloadItemsAtIndexPaths %@", buf, 0xCu);
    }

    -[MailboxPickerCollectionHelper _reloadDataForCellsAtIndexPaths:](self, "_reloadDataForCellsAtIndexPaths:", v7);
    -[MailboxPickerCollectionHelper updateMailboxSelectionAnimated:scrollToSelected:](self, "updateMailboxSelectionAnimated:scrollToSelected:", 0, 0);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Favorites reloadItemsAtIndexPaths reloadingCollectionViewData indexPaths:%@", buf, 0xCu);
    }

    -[MailboxPickerCollectionHelper reloadDataSource](self, "reloadDataSource");
  }

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a5;
  v10 = v7;
  if ((objc_msgSend(v10, "isHidden") & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoriteItemAtIndexPath:](self, "favoriteItemAtIndexPath:", v8));
    objc_msgSend(v10, "associateViewWithEntityFromFavoriteItem:", v9);

  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (-[MailboxPickerCollectionHelper isPerformingMultiSelect](self, "isPerformingMultiSelect")
    && !-[MailboxPickerCollectionHelper canBeginMultiSelectAtIndexPath:](self, "canBeginMultiSelectAtIndexPath:", v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = -[MailboxPickerCollectionHelper isCellSelectable:atIndexPath:](self, "isCellSelectable:atIndexPath:", v6, v7);
  }

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (-[MailboxPickerCollectionHelper isAddButtonAtIndexPath:](self, "isAddButtonAtIndexPath:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForItemAtIndexPath:", v6));
    objc_msgSend(v7, "mailboxCollectionHelperWantsToShowAddFavoritesController:sourceView:", self, v8);

    objc_msgSend(v14, "deselectItemAtIndexPath:animated:", v6, 1);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoriteItemAtIndexPath:](self, "favoriteItemAtIndexPath:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper model](self, "model"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionForIndexPath:", v6));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
    v13 = objc_msgSend(v12, "isEditing");

    if (v13)
    {
      if (objc_msgSend(v11, "isFavorites"))
      {
        objc_msgSend(v9, "setSelected:fromUI:", 1, 1);
        -[MailboxPickerCollectionHelper updateCheckmarkColor:](self, "updateCheckmarkColor:", v14);
      }
      else if (objc_msgSend(v11, "isAccounts"))
      {
        objc_msgSend(v9, "wasSelected:indexPath:accessoryTapped:animated:", self, v6, 0, 1);
        objc_msgSend(v14, "deselectItemAtIndexPath:animated:", v6, 1);
      }
    }
    else
    {
      sub_1000CEDE4((uint64_t)self, v9, v11);
      objc_msgSend(v9, "wasSelected:indexPath:accessoryTapped:animated:", self, v6, 0, 1);
    }

  }
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
  if (!objc_msgSend(v8, "isEditing"))
  {

    goto LABEL_10;
  }
  v9 = objc_msgSend(v7, "section");

  if (v9)
  {
LABEL_10:
    v14 = 1;
    goto LABEL_11;
  }
  v10 = (uint64_t)objc_msgSend(v6, "numberOfItemsInSection:", 0);
  v11 = v10;
  if (v10 < 2)
  {
    v14 = 0;
  }
  else
  {
    v12 = v10 - 1;
    v13 = 1;
    v14 = 1;
    do
    {
      if ((id)(v13 - 1) != objc_msgSend(v7, "item"))
      {
        v15 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v13 - 1, 0));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoriteItemAtIndexPath:](self, "favoriteItemAtIndexPath:", v15));

        LOBYTE(v15) = objc_msgSend(v16, "isSelected");
        if ((v15 & 1) != 0)
          break;
      }
      v14 = v13++ < v12;
    }
    while (v11 != v13);
  }
LABEL_11:

  return v14;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
  v8 = objc_msgSend(v7, "isEditing");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoriteItemAtIndexPath:](self, "favoriteItemAtIndexPath:", v6));
    objc_msgSend(v9, "setSelected:fromUI:", 0, 1);
    -[MailboxPickerCollectionHelper updateCheckmarkColor:](self, "updateCheckmarkColor:", v10);

  }
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  void *v5;
  unsigned __int8 v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoriteItemAtIndexPath:](self, "favoriteItemAtIndexPath:", a4));
  v6 = objc_msgSend(v5, "isExpandable");

  return v6;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int v8;

  v6 = a3;
  v7 = a4;
  if (-[MailboxPickerCollectionHelper isCellSelectable:atIndexPath:](self, "isCellSelectable:atIndexPath:", v6, v7))
    LOBYTE(v8) = 1;
  else
    v8 = _os_feature_enabled_impl("Mail", "CollapsibleMailboxes") ^ 1;

  return v8;
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  -[MailboxPickerCollectionHelper setIsPerformingMultiSelect:](self, "setIsPerformingMultiSelect:", 1, a4);
}

- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3
{
  -[MailboxPickerCollectionHelper setIsPerformingMultiSelect:](self, "setIsPerformingMultiSelect:", 0);
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
  v7 = objc_msgSend(v6, "isEditing");

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoriteItemAtIndexPath:](self, "favoriteItemAtIndexPath:", v5));
    if (objc_msgSend(v9, "sourceType") == (id)1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[VIPManager defaultInstance](VIPManager, "defaultInstance"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allVIPs"));
      v8 = objc_msgSend(v11, "count") != 0;

    }
    else
    {
      v8 = 1;
    }

  }
  return v8;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v9;
  id v10;
  id v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int64_t v18;
  int64_t v19;
  char *v20;
  char *v21;
  NSObject *v22;
  NSString *v23;
  void *v24;
  id v26;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  _BOOL4 v39;

  v9 = a4;
  v10 = a6;
  if (!-[MailboxPickerCollectionHelper isAddButtonAtIndexPath:](self, "isAddButtonAtIndexPath:", v10))
  {
    v15 = objc_msgSend(v10, "section");
    if (v15 == objc_msgSend(v9, "section"))
    {
      v12 = 0;
      v13 = 0;
      v11 = v10;
      goto LABEL_15;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper model](self, "model"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sections"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v9, "section")));
    if (objc_msgSend(v17, "isAccounts"))
    {
      v18 = +[MailboxPickerCollectionHelperModel indexOfFirstAccountSection:](MailboxPickerCollectionHelperModel, "indexOfFirstAccountSection:", v14);
      v19 = +[MailboxPickerCollectionHelperModel indexOfLastAccountSection:](MailboxPickerCollectionHelperModel, "indexOfLastAccountSection:", v14);
      v20 = (char *)objc_msgSend(v10, "section");
      if ((uint64_t)v20 <= (uint64_t)((char *)objc_msgSend(v9, "section") - 2))
      {
        v12 = 1;
      }
      else
      {
        v21 = (char *)objc_msgSend(v10, "section");
        v12 = (uint64_t)v21 >= (uint64_t)((char *)objc_msgSend(v9, "section") + 2);
      }
      if ((uint64_t)objc_msgSend(v10, "section") >= v18 - 1)
      {
        v26 = objc_msgSend(v10, "section");
        v13 = (uint64_t)v26 <= v19 + 1;
        if ((uint64_t)v26 <= v19 + 1 && v12)
        {
          v11 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, objc_msgSend(v10, "section")));
          v12 = 1;
          v13 = 1;
          goto LABEL_13;
        }
LABEL_12:
        v11 = v9;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v12 = 0;
    }
    v13 = 0;
    goto LABEL_12;
  }
  v11 = v9;
  v12 = 0;
  v13 = 0;
  v14 = v10;
LABEL_14:

LABEL_15:
  v22 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v28 = 138413570;
    v29 = v24;
    v30 = 2112;
    v31 = v9;
    v32 = 2112;
    v33 = v10;
    v34 = 2112;
    v35 = v11;
    v36 = 1024;
    v37 = v12;
    v38 = 1024;
    v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "#Favorites %@  - \torgPath:%@ \tpropPath:%@, \tdestPath:%@ invalR:%d accR:%d", (uint8_t *)&v28, 0x36u);

  }
  return v11;
}

- (id)favoriteItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (-[MailboxPickerCollectionHelper sectionTypeForIndex:](self, "sectionTypeForIndex:", objc_msgSend(v4, "section"))
    && (_os_feature_enabled_impl("Mail", "CollapsibleMailboxes") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifierForIndexPath:", v4));

    v7 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoriteItemForItemID:](self, "favoriteItemForItemID:", v6));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper model](self, "model"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "favoriteItemAtIndexPath:", v4));
  }
  v8 = (void *)v7;

  return v8;
}

- (void)_favoritesFocusDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  MailboxPickerCollectionHelper *v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Favorites _favoritesFocusDidChange", buf, 2u);
  }

  v6 = v4;
  v9 = v6;
  v10 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1000CF9AC, &unk_10051A910));
  objc_msgSend(v7, "performBlock:", &v8);

}

- (BOOL)isAddButtonAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItemIdentifier:", CFSTR("kAddButtonItemIdentifier")));

  if (v6)
    v7 = objc_msgSend(v4, "isEqual:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isCellSelectable:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[MailboxPickerCollectionHelper isAddButtonAtIndexPath:](self, "isAddButtonAtIndexPath:", v7))
  {
    v8 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v7));
    v8 = objc_msgSend(v9, "isCellEnabled");

  }
  return v8;
}

- (BOOL)canBeginMultiSelectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper model](self, "model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionForIndexPath:", v4));
  if (objc_msgSend(v6, "isFavorites"))
    v7 = !-[MailboxPickerCollectionHelper isAddButtonAtIndexPath:](self, "isAddButtonAtIndexPath:", v4);
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (BOOL)canReorderItemAtIndexPath:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v4 = a3;
  if (-[MailboxPickerCollectionHelper isAddButtonAtIndexPath:](self, "isAddButtonAtIndexPath:", v4))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoriteItemAtIndexPath:](self, "favoriteItemAtIndexPath:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionForIndexPath:", v4));
    v9 = objc_msgSend(v8, "isAccounts");

    if (v9)
    {
      if (objc_msgSend(v6, "type") == (id)1)
        v5 = objc_msgSend(v6, "isExpanded") ^ 1;
      else
        LOBYTE(v5) = 0;
    }
    else
    {
      LOBYTE(v5) = objc_msgSend(v6, "isMovable");
    }

  }
  return v5;
}

- (void)updateCellForSourceType:(unint64_t)a3
{
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  void *v21;

  if (pthread_main_np() != 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxPickerCollectionHelper.m"), 870, CFSTR("Current thread must be main"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
  v7 = objc_msgSend(v6, "isEditing");

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForSharedMailboxWithType:selected:](FavoriteItem, "itemForSharedMailboxWithType:selected:", a3, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper indexPathForItem:](self, "indexPathForItem:", v8));
    if (v9)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v12 = NSStringFromSelector(a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        *(_DWORD *)buf = 138543874;
        v17 = v13;
        v18 = 2048;
        v19 = a3;
        v20 = 2114;
        v21 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@ %lu, indexPath: %{public}@", buf, 0x20u);

      }
      v15 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
      -[MailboxPickerCollectionHelper reloadDataForIndexPaths:](self, "reloadDataForIndexPaths:", v11);

    }
  }
}

- (void)updateCheckmarkColor:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView", a3));
  v5 = objc_msgSend(v4, "isEditing");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesManager](self, "favoritesManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mailboxesCollection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "visibleItems"));

    if (objc_msgSend(v8, "ef_countObjectsPassingTest:", &stru_10051DEE8) == (id)1)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
    else
      v9 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper multiSelectCheckmarkColor](self, "multiSelectCheckmarkColor"));

    if (v9 != v10)
    {
      -[MailboxPickerCollectionHelper setMultiSelectCheckmarkColor:](self, "setMultiSelectCheckmarkColor:", v9);
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView", 0));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "visibleCells"));

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v16, "setMultiselectCheckmarkColor:", v9);
            objc_msgSend(v16, "setNeedsUpdateConfiguration");
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }

    }
  }
}

- (void)_configureCell:(id)a3 forItemID:(id)a4 indexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;

  v22 = a3;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper model](self, "model"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sections"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoriteItemAtIndexPath:](self, "favoriteItemAtIndexPath:", v7));
  objc_msgSend(v11, "configureOutlineCell:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "representingMailbox"));
  if (objc_msgSend(v10, "isAccounts"))
  {
    if (objc_msgSend(v11, "type") == (id)1)
      -[MailboxPickerCollectionHelper _configureAccountsCell:forItem:](self, "_configureAccountsCell:forItem:", v22, v11);
    else
      -[MailboxPickerCollectionHelper _configureMailboxCell:mailbox:indexPath:](self, "_configureMailboxCell:mailbox:indexPath:", v22, v12, v7);
  }
  else
  {
    if (objc_msgSend(v10, "isFavorites"))
    {
      if (objc_msgSend(v12, "type") != (id)7)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
        v14 = objc_msgSend(v13, "isEditing");

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper delegate](self, "delegate"));
          v16 = objc_msgSend(v15, "mailboxCollectionHelper:shouldDisableForEditingCellForMailbox:", self, v12);

          objc_msgSend(v22, "setDisabledForEditing:", v16);
        }
      }
    }
    if (!v12 && objc_msgSend(v11, "type") == (id)2)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayName"));
      objc_msgSend(v22, "setTitle:", v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper currentFocus](self, "currentFocus"));
    if (v12 && (objc_msgSend(v11, "type") == (id)2 || objc_msgSend(v11, "type") == (id)3))
    {
      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "account"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
        v21 = objc_msgSend(v18, "isFocusedIdentifier:", v20);

        if ((v21 & 1) == 0)
        {
          objc_msgSend(v22, "setShowFocusIcon:", 1);
          objc_msgSend(v22, "setShouldShowBadgeCountIfNecessary:", 0);
        }
      }
    }
    -[MailboxPickerCollectionHelper _configureFlattenedCell:forItem:](self, "_configureFlattenedCell:forItem:", v22, v11);

  }
  objc_msgSend(v22, "setNeedsUpdateConfiguration");

}

- (void)_configureAddMailboxCell:(id)a3
{
  NSBundle *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ADD_MAILBOX_BUTTON"), &stru_100531B00, CFSTR("Main")));
  objc_msgSend(v9, "setTitle:", v6);

  objc_msgSend(v9, "setUseTintColor:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_imageWithColor:size:](UIImage, "mf_imageWithColor:size:", v7, 1.0, 1.0));
  objc_msgSend(v9, "setIcon:", v8);

  objc_msgSend(v9, "setBadgeCount:", 0);
  objc_msgSend(v9, "setNeedsUpdateConfiguration");

}

- (void)_configureMailboxCell:(id)a3 mailbox:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v18, "setSubtitle:", 0);
  objc_msgSend(v18, "setDisabledForEditing:", objc_msgSend(v8, "mv_isEditable") ^ 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "children"));
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    if (_os_feature_enabled_impl("Mail", "CollapsibleMailboxes"))
      v12 = 2;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v18, "setDisclosureType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "traitCollection"));
  v14 = objc_msgSend(v13, "mf_useSplitViewStyling");

  if ((v14 & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mui_nextIndexPath"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoriteItemAtIndexPath:](self, "favoriteItemAtIndexPath:", v15));

    if (v16)
      v17 = objc_msgSend(v16, "type") == (id)1;
    else
      v17 = 0;
    objc_msgSend(v18, "setForceZeroSeparatorInset:", v17);

  }
}

- (void)_configureFlattenedCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(v7, "setFlattenHierarchy:", 1);
  objc_msgSend(v7, "setHideBadgeCountForEditing:", 1);
  objc_msgSend(v7, "setCanMoveItem:", objc_msgSend(v6, "isMovable"));
  objc_msgSend(v7, "setShowsSelectionCheckmarkForEditing:", 1);
  objc_msgSend(v7, "setDisclosureType:", 0);
  if (objc_msgSend(v6, "wantsDisclosureButton"))
  {
    objc_msgSend(v7, "setShowsDetailDisclosureButton:", 1);
    objc_msgSend(v7, "addTargetForDetailDisclosure:action:", self, "_detailsDisclosureButtonTapped:");
  }
  else
  {
    objc_msgSend(v7, "setShowsDetailDisclosureButton:", 0);
  }

}

- (void)_configureAccountsCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper currentFocus](self, "currentFocus"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v10 = objc_msgSend(v7, "isFocusedIdentifier:", v9);

    if ((v10 & 1) == 0)
      objc_msgSend(v15, "setShowFocusIcon:", 1);
  }
  if (objc_msgSend(v6, "isExpandable"))
  {
    objc_msgSend(v15, "setExpandable:", 1);
    objc_msgSend(v15, "setExpanded:", objc_msgSend(v6, "isExpanded"));
    objc_msgSend(v15, "setHideBadgeCountForEditing:", 1);
    objc_msgSend(v15, "setDisclosureType:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "backgroundColor"));
    objc_msgSend(v15, "setBackgroundColor:", v12);

    objc_msgSend(v15, "setCanMoveItem:", objc_msgSend(v6, "isMovable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "traitCollection"));
    v14 = objc_msgSend(v13, "mf_useSplitViewStyling");

    if ((v14 & 1) == 0)
      objc_msgSend(v15, "setForceZeroSeparatorInset:", 1);
  }
  else
  {
    -[MailboxPickerCollectionHelper _configureFlattenedCell:forItem:](self, "_configureFlattenedCell:forItem:", v15, v6);
  }

}

- (void)_detailsDisclosureButtonTapped:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper delegate](self, "delegate"));
  objc_msgSend(v4, "mailboxCollectionHelperDidTapDetailsDisclosure:sender:", self, v5);

}

- (void)_reloadDataForCellsAtIndexPaths:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForVisibleItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v16;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "containsObject:", v11))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cellForItemAtIndexPath:", v11));

          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper dataSource](self, "dataSource"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemIdentifierForIndexPath:", v11));

          -[MailboxPickerCollectionHelper _configureCell:forItemID:indexPath:](self, "_configureCell:forItemID:indexPath:", v13, v15, v11);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  BOOL v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesManager](self, "favoritesManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mailboxesCollection"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesManager](self, "favoritesManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountsCollection"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
  objc_msgSend(v8, "setEditing:", v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "visibleItems"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mui_sortedIndexPathsForVisibleItems"));
  objc_msgSend(v11, "visibleBounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000D10F4;
  v36[3] = &unk_10051DF10;
  v36[4] = self;
  v20 = v10;
  v37 = v20;
  v21 = v31;
  v38 = v21;
  v22 = v11;
  v39 = v22;
  v40 = v13;
  v41 = v15;
  v42 = v17;
  v43 = v19;
  objc_msgSend(v32, "enumerateObjectsUsingBlock:", v36);
  objc_msgSend(v20, "setEditing:", v5);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000D125C;
  v33[3] = &unk_10051DF38;
  v23 = v21;
  v34 = v23;
  v35 = v5;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueId"));
  -[MailboxPickerCollectionHelper _performDataSourceUpdateAnimated:forceReload:update:toSection:](self, "_performDataSourceUpdateAnimated:forceReload:update:toSection:", v4, 1, v33, v24);

  objc_msgSend(v22, "setEditing:", v5);
  if (v5)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailInteractiveColor](UIColor, "mailInteractiveColor"));
    -[MailboxPickerCollectionHelper setMultiSelectCheckmarkColor:](self, "setMultiSelectCheckmarkColor:", v25);

    -[MailboxPickerCollectionHelper updatedSelectedState:](self, "updatedSelectedState:", v22);
  }
  else
  {
    v45 = v23;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesManager](self, "favoritesManager"));
    v44 = v8;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
    objc_msgSend(v27, "updateCollections:withItems:", v28, v26);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper model](self, "model"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "favoritesSection"));
    objc_msgSend(v30, "prepareItemsForView");

    -[MailboxPickerCollectionHelper updateMailboxSelectionAnimated:scrollToSelected:](self, "updateMailboxSelectionAnimated:scrollToSelected:", v4, 0);
  }
  -[MailboxPickerCollectionHelper setPinnedItemIdentifier:](self, "setPinnedItemIdentifier:", 0);
  -[MailboxPickerCollectionHelper setPinnedItemOffset:](self, "setPinnedItemOffset:", 0.0);

}

- (void)selectAccount:(id)a3 item:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10 && objc_msgSend(v10, "isExpandable"))
  {
    objc_msgSend(v10, "setExpanded:", objc_msgSend(v10, "isExpanded") ^ 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesManager](self, "favoritesManager"));
    objc_msgSend(v12, "refreshCollectionForItemExpansion:", v10);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper collectionView](self, "collectionView"));
    objc_msgSend(v13, "deselectItemAtIndexPath:animated:", v11, 0);

    v14 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesManager](self, "favoritesManager"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "accountsCollection"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueId"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemID"));
      v18 = objc_msgSend(v10, "isExpanded");
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subItems"));
      *(_DWORD *)buf = 138413058;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      v27 = 1024;
      v28 = v18;
      v29 = 2048;
      v30 = objc_msgSend(v19, "count");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Favorites selectAccount section:%@ account:%@ expand:%{BOOL}d, subItems:%ld", buf, 0x26u);

    }
  }
  if (v9)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper scene](self, "scene"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
    objc_msgSend(v20, "setSelectedAccounts:", v21);

  }
}

- (void)selectCombinedInboxWithSourceType:(unint64_t)a3 item:(id)a4 animated:(BOOL)a5
{
  -[MailboxPickerCollectionHelper selectCombinedMailboxWithType:item:animated:](self, "selectCombinedMailboxWithType:item:animated:", 7, a4, a5);
}

- (void)selectCombinedMailboxWithType:(int64_t)a3 item:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  NSArray *v20;
  NSArray *mailboxesForMessageList;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  _BOOL4 v29;

  v5 = a5;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemID"));
    *(_DWORD *)buf = 138412802;
    v25 = v10;
    v26 = 2114;
    v27 = v11;
    v28 = 1024;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Favorites selectCombinedMailboxWith type:%@ item:%{public}@ animated:%{BOOL}d", buf, 0x1Cu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper delegate](self, "delegate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayedAccountsForMailboxCollectionHelper:", self));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper scene](self, "scene"));
  objc_msgSend(v14, "setSelectedAccounts:", v13);

  if (!v8)
    v8 = (id)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForUnifiedMailboxWithType:selected:](FavoriteItem, "itemForUnifiedMailboxWithType:selected:", a3, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesManager](self, "favoritesManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastSelectedItem"));
  if ((objc_msgSend(v16, "isEqual:", v8) & 1) == 0)
  {

LABEL_9:
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "smartMailbox"));
    v23 = v19;
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    mailboxesForMessageList = self->_mailboxesForMessageList;
    self->_mailboxesForMessageList = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesManager](self, "favoritesManager"));
    objc_msgSend(v22, "setLastSelectedItem:", v8);

    -[MailboxPickerCollectionHelper updateMailboxSelectionAnimated:scrollToSelected:](self, "updateMailboxSelectionAnimated:scrollToSelected:", 0, 1);
    goto LABEL_10;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper mailboxesForMessageList](self, "mailboxesForMessageList"));
  v18 = v17 == 0;

  if (v18)
    goto LABEL_9;
LABEL_10:
  objc_msgSend(v12, "mailboxCollectionHelper:wantsToPopToMailboxPicker:andPushMessageListViewControllerIfNecessaryAnimated:", self, 1, v5);

}

- (void)selectCombinedMailbox:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Favorites selectCombinedMailbox %{public}@", (uint8_t *)&v11, 0xCu);
  }

  v6 = v4;
  if ((objc_msgSend(v6, "isEqual:", MFCombinedMailboxAllInbox) & 1) != 0)
  {
    v7 = 7;
LABEL_15:

    -[MailboxPickerCollectionHelper selectCombinedMailboxWithType:item:animated:](self, "selectCombinedMailboxWithType:item:animated:", v7, 0, 0);
    goto LABEL_16;
  }
  if ((objc_msgSend(v6, "isEqual:", MFCombinedMailboxAllDrafts) & 1) != 0)
  {
    v7 = 5;
    goto LABEL_15;
  }
  if ((objc_msgSend(v6, "isEqual:", MFCombinedMailboxAllSent) & 1) != 0)
  {
    v7 = 4;
    goto LABEL_15;
  }
  if ((objc_msgSend(v6, "isEqual:", MFCombinedMailboxAllArchive) & 1) != 0)
  {
    v7 = 102;
    goto LABEL_15;
  }
  if ((objc_msgSend(v6, "isEqual:", MFCombinedMailboxAllTrash) & 1) != 0)
  {
    v7 = 103;
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "isEqual:", MFCombinedMailboxAllJunk))
  {
    v7 = 101;
    goto LABEL_15;
  }

  v8 = v6;
  if ((objc_msgSend(v8, "isEqual:", MFCombinedMailboxFlagged) & 1) != 0)
  {
    v9 = 2;
  }
  else if ((objc_msgSend(v8, "isEqual:", MFCombinedMailboxUnread) & 1) != 0)
  {
    v9 = 3;
  }
  else if ((objc_msgSend(v8, "isEqual:", MFCombinedMailboxToday) & 1) != 0)
  {
    v9 = 7;
  }
  else if ((objc_msgSend(v8, "isEqual:", MFCombinedMailboxToCC) & 1) != 0)
  {
    v9 = 4;
  }
  else if ((objc_msgSend(v8, "isEqual:", MFCombinedMailboxAttachments) & 1) != 0)
  {
    v9 = 5;
  }
  else if ((objc_msgSend(v8, "isEqual:", MFCombinedMailboxThreadNotifications) & 1) != 0)
  {
    v9 = 6;
  }
  else if ((objc_msgSend(v8, "isEqual:", MFCombinedMailboxMutedThreads) & 1) != 0)
  {
    v9 = 8;
  }
  else
  {
    v9 = objc_msgSend(v8, "isEqual:", MFCombinedMailboxVIP);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FavoriteItem itemForSharedMailboxWithType:selected:](FavoriteItem, "itemForSharedMailboxWithType:selected:", v9, 0));
  -[MailboxPickerCollectionHelper selectCombinedInboxWithSourceType:item:animated:](self, "selectCombinedInboxWithSourceType:item:animated:", v9, v10, 0);

LABEL_16:
}

- (void)selectCustomViewController:(id)a3 item:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper delegate](self, "delegate"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D1DF4;
  v12[3] = &unk_10051DF60;
  v12[4] = self;
  v11 = v9;
  v13 = v11;
  objc_msgSend(v10, "mailboxCollectionHelper:wantsToShowCustomViewController:animated:sourceViewBlock:", self, v8, v5, v12);

}

- (void)selectVIPMailboxWithItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *mailboxesForMessageList;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  _BOOL4 v22;

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper logClient](self, "logClient"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemID"));
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 1024;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#Favorites selectVIPMailbox item:%{public}@ animated:%{BOOL}d", buf, 0x12u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayedAccountsForMailboxCollectionHelper:", self));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper scene](self, "scene"));
  objc_msgSend(v11, "setSelectedAccounts:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "additionalPredicate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[EMSmartMailbox vipMailboxWithName:additionalPredicate:](EMSmartMailbox, "vipMailboxWithName:additionalPredicate:", v13, v12));

  v18 = v14;
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  mailboxesForMessageList = self->_mailboxesForMessageList;
  self->_mailboxesForMessageList = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerCollectionHelper favoritesManager](self, "favoritesManager"));
  objc_msgSend(v17, "setLastSelectedItem:", v6);

  objc_msgSend(v9, "mailboxCollectionHelper:wantsToPopToMailboxPicker:andPushMessageListViewControllerIfNecessaryAnimated:", self, 1, v4);
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void)setFavoritesManager:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesManager, a3);
}

- (void)setFavoritesDidChangedDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesDidChangedDebouncer, a3);
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void)setLogClient:(id)a3
{
  objc_storeStrong((id *)&self->_logClient, a3);
}

- (BOOL)isPerformingMultiSelect
{
  return self->_isPerformingMultiSelect;
}

- (void)setIsPerformingMultiSelect:(BOOL)a3
{
  self->_isPerformingMultiSelect = a3;
}

- (UIColor)multiSelectCheckmarkColor
{
  return self->_multiSelectCheckmarkColor;
}

- (void)setMultiSelectCheckmarkColor:(id)a3
{
  objc_storeStrong((id *)&self->_multiSelectCheckmarkColor, a3);
}

- (void)setPinnedItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedItemIdentifier, a3);
}

- (double)pinnedItemOffset
{
  return self->_pinnedItemOffset;
}

- (void)setPinnedItemOffset:(double)a3
{
  self->_pinnedItemOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedItemIdentifier, 0);
  objc_storeStrong((id *)&self->_multiSelectCheckmarkColor, 0);
  objc_storeStrong((id *)&self->_currentFocus, 0);
  objc_storeStrong((id *)&self->_logClient, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_favoritesDidChangedDebouncer, 0);
  objc_storeStrong((id *)&self->_favoritesManager, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_mailboxesForMessageList, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
