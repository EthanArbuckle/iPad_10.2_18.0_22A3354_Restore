@implementation OfflineMapsManagementExpiredDataSource

- (OfflineMapsManagementExpiredDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4
{
  OfflineMapsManagementExpiredDataSource *v4;
  OfflineMapsManagementExpiredDataSource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OfflineMapsManagementExpiredDataSource;
  v4 = -[DataSource initWithCollectionView:updateLocation:](&v7, "initWithCollectionView:updateLocation:", a3, a4);
  v5 = v4;
  if (v4)
    -[OfflineMapsManagementExpiredDataSource commonInit](v4, "commonInit");
  return v5;
}

- (void)commonInit
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  _QWORD *v18;
  void *v19;
  void *v20;

  v3 = objc_alloc_init((Class)GEOMapDataSubscriptionManager);
  -[OfflineMapsManagementExpiredDataSource setSubscriptionManager:](self, "setSubscriptionManager:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v6 = objc_opt_class(TwoLinesCollectionViewInsetGroupedListCell);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLinesCollectionViewInsetGroupedListCell, "identifier"));
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", v6, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v9 = objc_opt_class(UserProfileSectionFooterView);
  v10 = (objc_class *)objc_opt_class(UserProfileSectionFooterView);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v8, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v9, UICollectionElementKindSectionFooter, v12);

  v13 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v15 = sub_10046DA38(self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = objc_msgSend(v13, "initWithCollectionView:cellProvider:", v14, v16);
  -[OfflineMapsManagementExpiredDataSource setDiffableDataSource:](self, "setDiffableDataSource:", v17);

  v18 = sub_10046DBB0(self);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v20, "setSupplementaryViewProvider:", v19);

  -[OfflineMapsManagementExpiredDataSource _fetchExpiredSubscriptionsAnimated:](self, "_fetchExpiredSubscriptionsAnimated:", 0);
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OfflineMapsManagementExpiredDataSource;
  -[DataSource setActive:](&v7, "setActive:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "addObserver:", self);
  else
    objc_msgSend(v5, "removeObserver:", self);

}

- (void)clearSelectedMaps
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10058F4E0;
  v3[3] = &unk_1011BBE08;
  objc_copyWeak(&v4, &location);
  -[OfflineMapsManagementExpiredDataSource _deleteSelectedMapsAndPerformBlock:](self, "_deleteSelectedMapsAndPerformBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)restoreSelectedMaps
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForSelectedItems"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource diffableDataSource](self, "diffableDataSource"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemIdentifierForIndexPath:", v9));

        v12 = objc_opt_class(_OfflineMapsExpiredSubscription);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v13 = v11;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subscription"));
          objc_msgSend(v17, "addObject:", v14);

          objc_msgSend(v3, "addObject:", v13);
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  objc_initWeak(&location, self);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource offlineDelegate](self, "offlineDelegate"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10058F920;
  v18[3] = &unk_1011AC888;
  objc_copyWeak(&v20, &location);
  v16 = v3;
  v19 = v16;
  objc_msgSend(v15, "didSelectRestoreExpiredSubscriptions:completionHandler:", v17, v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (BOOL)canRestoreAnyMaps
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_expiredSubscriptions;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "subscription", (_QWORD)v9));
        v7 = sub_10058FAEC(v6);

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)canRestoreSelectedMaps
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForSelectedItems"));
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    return 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedItems"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource diffableDataSource](self, "diffableDataSource"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemIdentifierForIndexPath:", v12));

        v15 = objc_opt_class(_OfflineMapsExpiredSubscription);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subscription"));
          v17 = sub_10058FAEC(v16);

          if (!v17)
          {

            v18 = 0;
            goto LABEL_14;
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_14:

  return v18;
}

- (void)_deleteSelectedMapsAndPerformBlock:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = (void (**)(id, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource diffableDataSource](self, "diffableDataSource"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshot"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathsForSelectedItems"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource diffableDataSource](self, "diffableDataSource"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemIdentifierForIndexPath:", v13));

        v16 = objc_opt_class(_OfflineMapsExpiredSubscription);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          v17 = v15;
          objc_msgSend(v6, "addObject:", v17);
          v4[2](v4, v17);

        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v18 = objc_msgSend(v6, "copy");
  objc_msgSend(v21, "deleteItemsWithIdentifiers:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v19, "applySnapshot:animatingDifferences:", v21, 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource offlineDelegate](self, "offlineDelegate"));
  objc_msgSend(v20, "dismissExpiredViewControllerIfNecessary");

}

- (id)swipeActionsConfigurationForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource diffableDataSource](self, "diffableDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifierForIndexPath:", v4));

  v7 = objc_opt_class(_OfflineMapsExpiredSubscription);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    objc_initWeak(&location, self);
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RowSwipe_Clear"), CFSTR("localized string not found"), CFSTR("Offline")));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10059026C;
    v25[3] = &unk_1011BBE58;
    objc_copyWeak(&v27, &location);
    v11 = v8;
    v26 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 1, v10, v25));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subscription"));
    v15 = sub_10058FAEC(v14);

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("RowSwipe_Restore"), CFSTR("localized string not found"), CFSTR("Offline")));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1005905A0;
      v22[3] = &unk_1011BBE58;
      objc_copyWeak(&v24, &location);
      v23 = v11;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 1, v17, v22));

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      objc_msgSend(v18, "setBackgroundColor:", v19);

      objc_msgSend(v13, "addObject:", v18);
      objc_destroyWeak(&v24);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v13));

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_restoreSubscription:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource offlineDelegate](self, "offlineDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscription"));
  v18 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100590794;
  v13[3] = &unk_1011BBE80;
  objc_copyWeak(&v16, &location);
  v11 = v6;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v8, "didSelectRestoreExpiredSubscriptions:completionHandler:", v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (BOOL)_canItemIdentifierBeSelected:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;

  v4 = a3;
  v5 = objc_opt_class(_OfflineMapsExpiredSubscription);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
    if ((objc_msgSend(v7, "isEditing") & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscription"));
      v8 = sub_10058FAEC(v9);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_fetchExpiredSubscriptionsAnimated:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  id location;
  void *v13;

  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@*"), CFSTR("com.apple.Maps.offline.")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource subscriptionManager](self, "subscriptionManager"));
  v13 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v8 = &_dispatch_main_q;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100590AE4;
  v9[3] = &unk_1011B99E0;
  objc_copyWeak(&v10, &location);
  v11 = a3;
  objc_msgSend(v6, "fetchExpiredSubscriptionsWithIdentifiers:callbackQueue:completionHandler:", v7, &_dispatch_main_q, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_updateContentAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v3 = a3;
  v5 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  if (-[NSArray count](self->_expiredSubscriptions, "count"))
  {
    v8 = CFSTR("kExpiredSectionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    objc_msgSend(v5, "appendSectionsWithIdentifiers:", v6);

    objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", self->_expiredSubscriptions, CFSTR("kExpiredSectionIdentifier"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v7, "applySnapshot:animatingDifferences:", v5, v3);

}

- (void)subscriptionInfosDidChange:(id)a3
{
  -[OfflineMapsManagementExpiredDataSource _fetchExpiredSubscriptionsAnimated:](self, "_fetchExpiredSubscriptionsAnimated:", 1);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id *v29;
  void **v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  id v35;
  id location;
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class(_OfflineMapsExpiredSubscription);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
  {
    v12 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLinesCollectionViewInsetGroupedListCell, "identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v9));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subscription"));
    v16 = sub_10058FAEC(v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subscription"));
    v18 = +[TwoLinesContentViewModelComposer cellModelForExpiredOfflineMapSubscription:isAvailable:isSupportedOSVersion:](TwoLinesContentViewModelComposer, "cellModelForExpiredOfflineMapSubscription:isAvailable:isSupportedOSVersion:", v17, v16, GEOConfigGetBOOL(GeoOfflineConfig_OfflineSupportDeprecated[0], GeoOfflineConfig_OfflineSupportDeprecated[1]) ^ 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v14, "setViewModel:", v19);

    v20 = objc_alloc_init((Class)UICellAccessoryMultiselect);
    objc_msgSend(v20, "setDisplayedState:", 1);
    v37 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
    v22 = objc_msgSend(v21, "mutableCopy");

    if (v16)
    {
      objc_initWeak(&location, self);
      v31 = 3221225472;
      v32 = sub_100591080;
      v33 = &unk_1011ACEC0;
      v29 = &v35;
      v30 = _NSConcreteStackBlock;
      objc_copyWeak(&v35, &location);
      v34 = v12;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v30));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 0, v23));

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.down.circle"), v25));
      objc_msgSend(v24, "setImage:forState:", v26, 0);

      objc_msgSend(v24, "setAccessibilityIdentifier:", CFSTR("RestoreExpiredMap"));
      v27 = objc_msgSend(objc_alloc((Class)UICellAccessoryCustomView), "initWithCustomView:placement:", v24, 1);
      objc_msgSend(v27, "setDisplayedState:", 2);
      objc_msgSend(v22, "addObject:", v27);

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v14, "setAccessories:", v22, v29, v30, v31, v32, v33);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  UserProfileSectionFooterViewModel *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource diffableDataSource](self, "diffableDataSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sectionIdentifierForIndex:", objc_msgSend(v9, "section")));

  v13 = objc_msgSend(v10, "isEqualToString:", UICollectionElementKindSectionFooter);
  if (v13 && objc_msgSend(v12, "isEqual:", CFSTR("kExpiredSectionIdentifier")))
  {
    if ((GEOConfigGetBOOL(GeoOfflineConfig_AutomaticUpdatesEnabled[0], GeoOfflineConfig_AutomaticUpdatesEnabled[1]) & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = v14;
      v16 = CFSTR("EXPIRED_OFFLINE_MAPS_FOOTER");
    }
    else
    {
      v18 = MGGetBoolAnswer(CFSTR("wapi"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = v14;
      if (v18)
        v16 = CFSTR("EXPIRED_OFFLINE_MAPS_FOOTER_NO_AUTOUPDATES_WLAN");
      else
        v16 = CFSTR("EXPIRED_OFFLINE_MAPS_FOOTER_NO_AUTOUPDATES_WIFI");
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, CFSTR("localized string not found"), CFSTR("Offline")));

    v20 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v19);
    v21 = -[UserProfileSectionFooterViewModel initWithContentString:]([UserProfileSectionFooterViewModel alloc], "initWithContentString:", v20);
    v22 = (objc_class *)objc_opt_class(UserProfileSectionFooterView);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionFooter, v24, v9));

    objc_msgSend(v17, "configureWithViewModel:", v21);
    objc_msgSend(v17, "setNeedsLayout");
    objc_msgSend(v17, "layoutIfNeeded");

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource diffableDataSource](self, "diffableDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifierForIndexPath:", v5));

  LOBYTE(self) = -[OfflineMapsManagementExpiredDataSource _canItemIdentifierBeSelected:](self, "_canItemIdentifierBeSelected:", v7);
  return (char)self;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource diffableDataSource](self, "diffableDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifierForIndexPath:", v5));

  LOBYTE(self) = -[OfflineMapsManagementExpiredDataSource _canItemIdentifierBeSelected:](self, "_canItemIdentifierBeSelected:", v7);
  return (char)self;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource diffableDataSource](self, "diffableDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifierForIndexPath:", v6));

  if ((objc_msgSend(v11, "isEditing") & 1) != 0
    || (objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v6, 1),
        v9 = objc_opt_class(_OfflineMapsExpiredSubscription),
        (objc_opt_isKindOfClass(v8, v9) & 1) == 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v10, "dataSource:itemTapped:", self, v8);

  }
  else
  {
    -[OfflineMapsManagementExpiredDataSource _restoreSubscription:completionHandler:](self, "_restoreSubscription:completionHandler:", v8, 0);
  }

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementExpiredDataSource diffableDataSource](self, "diffableDataSource"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifierForIndexPath:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v7, "dataSource:itemTapped:", self, v8);

}

- (OfflineMapsManagementExpiredDataSourceDelegate)offlineDelegate
{
  return (OfflineMapsManagementExpiredDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_offlineDelegate);
}

- (void)setOfflineDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_offlineDelegate, a3);
}

- (GEOMapDataSubscriptionManager)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionManager, a3);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_destroyWeak((id *)&self->_offlineDelegate);
  objc_storeStrong((id *)&self->_expiredSubscriptions, 0);
}

@end
