@implementation ICNoteResultsViewController

- (ICNoteResultsViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4 viewControllerType:(int64_t)a5
{
  ICNoteResultsViewController *v5;
  ICNoteResultsViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  ICManagedObjectContextChangeController *v10;
  ICManagedObjectContextChangeController *managedObjectContextChangeController;
  uint64_t v12;
  NSMutableSet *managedObjectIDsForDeferredCellUpdates;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ICNoteResultsViewController;
  v5 = -[ICBaseViewController initWithViewMode:viewControllerManager:viewControllerType:](&v15, "initWithViewMode:viewControllerManager:viewControllerType:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController legacyViewContext](v5, "legacyViewContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController modernViewContext](v6, "modernViewContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, 0));

    v10 = (ICManagedObjectContextChangeController *)objc_msgSend(objc_alloc((Class)ICManagedObjectContextChangeController), "initWithManagedObjectContexts:delegate:", v9, v6);
    managedObjectContextChangeController = v6->_managedObjectContextChangeController;
    v6->_managedObjectContextChangeController = v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    managedObjectIDsForDeferredCellUpdates = v6->_managedObjectIDsForDeferredCellUpdates;
    v6->_managedObjectIDsForDeferredCellUpdates = (NSMutableSet *)v12;

  }
  return v6;
}

- (void)updateNoteSelectionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;

  v3 = a3;
  if ((-[ICNoteResultsViewController isEditing](self, "isEditing") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedNoteObjectID"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedInvitationObjectID"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedContainerIdentifiers"));

    if (!(v39 | v7) && (-[ICNoteResultsViewController isEditing](self, "isEditing") & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
      if (objc_msgSend(v10, "isAutomaticallySelectingNotes"))
      {

      }
      else
      {
        v11 = objc_msgSend(v9, "count");

        if (!v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
          objc_msgSend(v12, "ic_deselectAllItemsAnimated:", v3);
          goto LABEL_29;
        }
      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    if (!objc_msgSend(v12, "isAutomaticallySelectingNotes"))
      goto LABEL_29;
    v13 = -[ICNoteResultsViewController isEditing](self, "isEditing");

    if ((v13 & 1) != 0)
    {
LABEL_30:

      return;
    }
    if (v39)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController dataSource](self, "dataSource"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collectionViewDiffableDataSource"));
      v16 = v15;
      v17 = v39;
    }
    else
    {
      if (!v7)
        goto LABEL_14;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController dataSource](self, "dataSource"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collectionViewDiffableDataSource"));
      v16 = v15;
      v17 = v7;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "indexPathForItemIdentifier:", v17));

    if (v12)
    {
LABEL_15:
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
      v23 = objc_msgSend(v22, "numberOfSections");
      if ((uint64_t)v23 <= (uint64_t)objc_msgSend(v12, "section"))
      {

      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
        v25 = objc_msgSend(v24, "numberOfItemsInSection:", objc_msgSend(v12, "section"));
        v26 = objc_msgSend(v12, "row");

        if ((uint64_t)v25 > (uint64_t)v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "indexPathsForSelectedItems"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstObject"));
          v30 = objc_msgSend(v29, "isEqual:", v12);

          if ((v30 & 1) == 0)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "indexPathsForVisibleItems"));
            if (objc_msgSend(v32, "containsObject:", v12))
              v33 = 0;
            else
              v33 = 2;

            v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
            if (objc_msgSend(v34, "allowsMultipleSelection"))
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "indexPathsForSelectedItems"));
              v37 = objc_msgSend(v36, "count");

              if (v37 != (id)1)
              {
LABEL_25:
                v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
                objc_msgSend(v38, "selectItemAtIndexPath:animated:scrollPosition:", v12, v3, v33);
LABEL_28:

                goto LABEL_29;
              }
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
              objc_msgSend(v34, "ic_deselectAllItemsAnimated:", v3);
            }

            goto LABEL_25;
          }
LABEL_29:

          goto LABEL_30;
        }
      }
LABEL_27:
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
      objc_msgSend(v38, "ic_deselectAllItemsAnimated:", v3);
      goto LABEL_28;
    }
LABEL_14:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "selectedSearchResult"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController dataSource](self, "dataSource"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "collectionViewDiffableDataSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "indexPathForItemIdentifier:", v19));

    if (!v12)
      goto LABEL_27;
    goto LABEL_15;
  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICNoteResultsViewController;
  -[ICBaseViewController viewDidLoad](&v12, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "thumbnailCacheDidInvalidateThumbnail:", ICThumbnailCacheDidInvalidateThumbnailNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = ICAuthenticationStateDidAuthenticateNotification;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "noteDecryptedStatusDidChange:", v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v8 = ICAuthenticationStateDidDeauthenticateNotification;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "noteDecryptedStatusDidChange:", v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v10, "ic_addObserver:forKeyPath:context:", self, CFSTR("selectedNoteObjectID"), off_1005CDE30);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v11, "ic_addObserver:forKeyPath:context:", self, CFSTR("selectedSearchResult"), off_1005CDE30);

}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void)dataSourceDataUpdateDidRender:(id)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICNoteResultsViewController;
  -[ICBaseViewController dataSourceDataUpdateDidRender:](&v5, "dataSourceDataUpdateDidRender:", a3);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015968;
  v4[3] = &unk_100550110;
  v4[4] = self;
  performBlockOnMainThread(v4);
}

- (ICNoteBrowseCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("selectedNoteObjectID"), off_1005CDE30);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v5, "ic_removeObserver:forKeyPath:context:", self, CFSTR("selectedSearchResult"), off_1005CDE30);

  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsViewController;
  -[ICBaseViewController dealloc](&v6, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];

  v26.receiver = self;
  v26.super_class = (Class)ICNoteResultsViewController;
  -[ICBaseViewController viewWillAppear:](&v26, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController managedObjectContextChangeController](self, "managedObjectContextChangeController"));
  objc_msgSend(v4, "performUpdatesIfNeeded");

  if (-[ICNoteResultsViewController ic_isBeingRevealedFromPoppingViewController](self, "ic_isBeingRevealedFromPoppingViewController")&& (-[ICNoteResultsViewController isEditing](self, "isEditing") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForSelectedItems"));

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController dataSource](self, "dataSource", (_QWORD)v22));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionViewDiffableDataSource"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemIdentifierForIndexPath:", v12));

          v16 = objc_opt_class(NSManagedObjectID);
          v17 = ICDynamicCast(v16, v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          if ((objc_msgSend(v18, "ic_isNoteType") & 1) != 0
            || (objc_msgSend(v18, "ic_isFolderType") & 1) != 0
            || objc_msgSend(v18, "ic_isInvitationType"))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
            objc_msgSend(v19, "deselectItemAtIndexPath:animated:", v12, 1);

          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "collectionView"));
    objc_msgSend(v21, "ic_deselectAllItemsAnimated:", 1);

  }
  -[ICNoteResultsViewController updateNoteSelectionAnimated:](self, "updateNoteSelectionAnimated:", 0, (_QWORD)v22);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteResultsViewController;
  -[ICBaseViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController managedObjectIDsForDeferredCellUpdates](self, "managedObjectIDsForDeferredCellUpdates"));
  -[ICNoteResultsViewController updateCellsForManagedObjectIDs:updateTextAndStatus:updateThumbnails:](self, "updateCellsForManagedObjectIDs:updateTextAndStatus:updateThumbnails:", v4, 1, 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController managedObjectIDsForDeferredCellUpdates](self, "managedObjectIDsForDeferredCellUpdates"));
  objc_msgSend(v5, "removeAllObjects");

}

- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectID"));
        if (objc_msgSend(v12, "ic_isInvitationType"))
          objc_msgSend(v5, "addObject:", v12);
        if (objc_msgSend(v12, "ic_isNoteType"))
          objc_msgSend(v5, "addObject:", v12);
        if (objc_msgSend(v12, "ic_isModernFolderType"))
        {
          v13 = objc_opt_class(ICFolder);
          v14 = ICCheckedDynamicCast(v13, v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          objc_msgSend(v5, "addObject:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recursiveVisibleSubfolders"));
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_1000C4554;
          v19[3] = &unk_100553F90;
          v20 = v5;
          objc_msgSend(v16, "enumerateObjectsUsingBlock:", v19);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  v17 = objc_msgSend(v5, "copy");
  return v17;
}

- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4
{
  -[ICNoteResultsViewController updateCellsForManagedObjectIDs:updateTextAndStatus:updateThumbnails:](self, "updateCellsForManagedObjectIDs:updateTextAndStatus:updateThumbnails:", a4, 1, 1);
}

- (void)thumbnailCacheDidInvalidateThumbnail:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController modernViewContext](self, "modernViewContext"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C4640;
  v7[3] = &unk_10054FE80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  _QWORD v14[5];
  objc_super v15;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  if ((-[ICNoteResultsViewController ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/UI/Note/Common/View Controllers/ICNoteResultsViewController.m") & 1) != 0)
  {
    v13 = -[ICNoteResultsViewController ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v11, v12, v10);

    if (a6 == off_1005CDE30
      && (v13 & 1) == 0
      && ((objc_msgSend(v10, "isEqualToString:", CFSTR("selectedNoteObjectID")) & 1) != 0
       || objc_msgSend(v10, "isEqualToString:", CFSTR("selectedSearchResult"))))
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000C48B4;
      v14[3] = &unk_100550110;
      v14[4] = self;
      performBlockOnMainThread(v14);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ICNoteResultsViewController;
    -[ICNoteResultsViewController observeValueForKeyPath:ofObject:change:context:](&v15, "observeValueForKeyPath:ofObject:change:context:", v10, v12, v11, a6);

  }
}

- (void)noteDecryptedStatusDidChange:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  _QWORD v6[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState", a3));
  v5 = objc_msgSend(v4, "isBlockingDeauthentication");

  if ((v5 & 1) == 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000C4948;
    v6[3] = &unk_100550110;
    v6[4] = self;
    performBlockOnMainThread(v6);
  }
}

- (void)updatePreparedCells
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preparedCells"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_objectsConformingToProtocol:", &OBJC_PROTOCOL___ICNoteBrowseCellUpdating));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "updateThumbnail", (_QWORD)v11);
        objc_msgSend(v10, "updateTextAndStatus");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)dismissContextMenu
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "interactions"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_objectPassingTest:", &stru_100553FD0));

  v4 = objc_opt_class(UIContextMenuInteraction);
  v5 = ICCheckedDynamicCast(v4, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "dismissMenu");

}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  v5 = objc_opt_class(UICollectionViewCell);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previouslyFocusedItem"));
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
  {
    isKindOfClass = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextFocusedItem"));
    isKindOfClass = objc_opt_isKindOfClass(v8, v5);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathsForSelectedItems"));
  v11 = objc_msgSend(v10, "count");

  if (v11 && (isKindOfClass & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
    objc_msgSend(v12, "ic_deselectAllItems");

  }
  return 1;
}

- (void)updateNoteSelection
{
  -[ICNoteResultsViewController updateNoteSelectionAnimated:](self, "updateNoteSelectionAnimated:", 0);
}

- (void)updateCellsForManagedObjectIDs:(id)a3 updateTextAndStatus:(BOOL)a4 updateThumbnails:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController viewIfLoaded](self, "viewIfLoaded"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController dataSource](self, "dataSource"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "associatedCellsForItemIdentifiers:", v8));

      v22 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ic_objectsConformingToProtocol:", &OBJC_PROTOCOL___ICNoteBrowseCellUpdating));
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
            if (v6)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "updateTextAndStatus");
              v19 = objc_opt_class(ICFolderOutlineCollectionViewCell);
              if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
              {
                v20 = v18;
                objc_msgSend(v20, "updateSubfolderCount");
                objc_msgSend(v20, "updateNoteCount");

              }
            }
            if (v5)
              objc_msgSend(v18, "updateThumbnail");
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v15);
      }

    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController managedObjectIDsForDeferredCellUpdates](self, "managedObjectIDsForDeferredCellUpdates"));
      objc_msgSend(v21, "unionSet:", v8);

    }
  }

}

- (ICManagedObjectContextChangeController)managedObjectContextChangeController
{
  return self->_managedObjectContextChangeController;
}

- (void)setManagedObjectContextChangeController:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContextChangeController, a3);
}

- (UIBarButtonItem)actionBarButtonItem
{
  return self->_actionBarButtonItem;
}

- (void)setActionBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_actionBarButtonItem, a3);
}

- (NSMutableSet)managedObjectIDsForDeferredCellUpdates
{
  return self->_managedObjectIDsForDeferredCellUpdates;
}

- (void)setManagedObjectIDsForDeferredCellUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectIDsForDeferredCellUpdates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectIDsForDeferredCellUpdates, 0);
  objc_storeStrong((id *)&self->_actionBarButtonItem, 0);
  objc_storeStrong((id *)&self->_managedObjectContextChangeController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
