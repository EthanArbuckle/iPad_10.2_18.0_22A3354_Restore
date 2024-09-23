@implementation ICNoteSearchDataSource

- (ICNoteSearchDataSource)initWithCollectionView:(id)a3 noteContainerViewMode:(int64_t)a4 viewControllerManager:(id)a5 legacyViewContext:(id)a6 modernViewContext:(id)a7 searchContext:(id)a8
{
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  UICollectionViewCellRegistration *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD *v36;
  ICNoteSearchDataSource *v37;
  int64_t v38;
  ICNoteSearchResultsController *v39;
  ICNoteSearchResultsController *searchResultsController;
  ICNoteSearchSnapshot *v41;
  void *v42;
  void *v43;
  ICNoteSearchSnapshot *v44;
  ICNoteSearchSnapshot *snapshot;
  void *v46;
  void *v47;
  ICManagedObjectContextChangeController *v48;
  ICManagedObjectContextChangeController *removedObjectsManagedObjectContextChangeController;
  void *v50;
  id v51;
  void *v52;
  ICNoteSearchDataSource *v53;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id obj;
  void *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  objc_super v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id from;
  id location[2];

  v14 = a3;
  obj = a5;
  v58 = a6;
  v57 = a7;
  v59 = a8;
  objc_initWeak(location, self);
  v61 = v14;
  objc_initWeak(&from, v14);
  v16 = objc_opt_class(ICNoteResultsListCollectionViewCell, v15);
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_1000D5F28;
  v79[3] = &unk_10054F9A8;
  objc_copyWeak(&v80, location);
  objc_copyWeak(&v81, &from);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v16, v79));
  v19 = (objc_class *)objc_opt_class(ICNoteResultsGalleryCollectionViewCell, v18);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", v21, 0));

  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_1000D6074;
  v76[3] = &unk_10054F9D0;
  objc_copyWeak(&v77, location);
  objc_copyWeak(&v78, &from);
  v55 = (void *)v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellNib:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellNib:configurationHandler:", v22, v76));
  v25 = objc_opt_class(ICSearchAttachmentResultsCollectionViewCell, v24);
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_1000D622C;
  v74[3] = &unk_100554428;
  objc_copyWeak(&v75, location);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v25, v74));
  v28 = +[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", objc_opt_class(UICollectionViewListCell, v27), &stru_100554468);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v31 = objc_opt_class(ICSearchCollectionViewHeaderView, v30);
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_1000D6498;
  v72[3] = &unk_100554490;
  objc_copyWeak(&v73, location);
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v31, UICollectionElementKindSectionHeader, v72));
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_1000D6540;
  v66[3] = &unk_1005544B8;
  objc_copyWeak(&v71, location);
  v32 = v29;
  v67 = v32;
  v33 = v26;
  v68 = v33;
  v34 = v17;
  v69 = v34;
  v35 = v23;
  v70 = v35;
  v36 = objc_retainBlock(v66);
  v65.receiver = self;
  v65.super_class = (Class)ICNoteSearchDataSource;
  v37 = -[ICNoteSearchDataSource initWithCollectionView:cellProvider:](&v65, "initWithCollectionView:cellProvider:", v61, v36);
  if (v37)
  {
    v38 = a4;
    v39 = objc_alloc_init(ICNoteSearchResultsController);
    searchResultsController = v37->_searchResultsController;
    v37->_searchResultsController = v39;

    v37->_noteContainerViewMode = a4;
    objc_storeWeak((id *)&v37->_viewControllerManager, obj);
    v41 = [ICNoteSearchSnapshot alloc];
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource collectionViewDiffableDataSource](v37, "collectionViewDiffableDataSource"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource collectionView](v37, "collectionView"));
    v44 = -[ICNoteSearchSnapshot initWithDiffableDataSource:containerViewMode:collectionView:searchContext:](v41, "initWithDiffableDataSource:containerViewMode:collectionView:searchContext:", v42, v38, v43, v59);
    snapshot = v37->_snapshot;
    v37->_snapshot = v44;

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource collectionView](v37, "collectionView"));
    -[ICNoteSearchSnapshot setBehavior:](v37->_snapshot, "setBehavior:", objc_msgSend(v46, "ic_behavior"));

    -[ICNoteSearchSnapshot setDelegate:](v37->_snapshot, "setDelegate:", v37);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v58, v57, 0));
    v48 = (ICManagedObjectContextChangeController *)objc_msgSend(objc_alloc((Class)ICManagedObjectContextChangeController), "initWithManagedObjectContexts:delegate:", v47, v37);
    removedObjectsManagedObjectContextChangeController = v37->_removedObjectsManagedObjectContextChangeController;
    v37->_removedObjectsManagedObjectContextChangeController = v48;

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (+[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions"))
    {
      objc_msgSend(v50, "addObject:", &off_10057C3A0);
      objc_msgSend(v50, "addObject:", &off_10057C3B8);
    }
    objc_msgSend(v50, "addObject:", &off_10057C3D0);
    objc_msgSend(v50, "addObject:", &off_10057C3E8);
    v51 = objc_msgSend(v50, "copy");
    -[ICNoteSearchDataSource setSectionTypes:](v37, "setSectionTypes:", v51);

    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_1000D66C0;
    v62[3] = &unk_1005544E0;
    objc_copyWeak(&v64, &from);
    v63 = v56;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource collectionViewDiffableDataSource](v37, "collectionViewDiffableDataSource"));
    objc_msgSend(v52, "setSupplementaryViewProvider:", v62);

    objc_destroyWeak(&v64);
  }
  v53 = v37;

  objc_destroyWeak(&v71);
  objc_destroyWeak(&v73);

  objc_destroyWeak(&v75);
  objc_destroyWeak(&v78);
  objc_destroyWeak(&v77);

  objc_destroyWeak(&v81);
  objc_destroyWeak(&v80);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return v53;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)cancelSearchQuery
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource searchResultsController](self, "searchResultsController"));
  objc_msgSend(v3, "cancelSearchQuery");

  -[ICNoteSearchDataSource setCurrentSearchUserInput:](self, "setCurrentSearchUserInput:", 0);
}

- (void)searchWithUserInput:(id)a3 updateHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24[2];
  id location;

  v6 = a3;
  v7 = a4;
  -[ICNoteSearchDataSource setCurrentSearchUserInput:](self, "setCurrentSearchUserInput:", v6);
  -[ICNoteSearchDataSource switchToMode:](self, "switchToMode:", 1);
  if (objc_msgSend(v6, "isEmpty"))
  {
    v8 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10040AE0C(v8);

    -[ICNoteSearchDataSource cancelSearchQuery](self, "cancelSearchQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource snapshot](self, "snapshot"));
    objc_msgSend(v9, "clear");

  }
  else
  {
    v10 = -[ICNoteSearchDataSource noteContainerViewMode](self, "noteContainerViewMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource searchResultsController](self, "searchResultsController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource accountIdentifier](self, "accountIdentifier"));
    v13 = objc_msgSend(v11, "isUpToDateForInput:accountIdentifier:", v6, v12);

    if ((v13 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tokens"));
      v15 = objc_msgSend(v14, "ic_containsObjectPassingTest:", &stru_100554520);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource snapshot](self, "snapshot"));
      objc_msgSend(v16, "prepareSearchWithCannedSuggestionToken:", v15);

      -[ICNoteSearchDataSource setDidUpdateForCurrentSearchUserInput:](self, "setDidUpdateForCurrentSearchUserInput:", 0);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource collectionView](self, "collectionView"));
    v18 = objc_msgSend(v17, "ic_behavior");

    objc_initWeak(&location, self);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource searchResultsController](self, "searchResultsController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource snapshot](self, "snapshot"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource accountIdentifier](self, "accountIdentifier"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000D6A04;
    v22[3] = &unk_100554548;
    objc_copyWeak(v24, &location);
    v24[1] = v18;
    v23 = v7;
    objc_msgSend(v19, "performSearchWithInput:suggestionsResponder:accountIdentifier:modernResultsOnly:updateHandler:", v6, v20, v21, v10 == 1, v22);

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }

}

- (void)switchToMode:(unint64_t)a3
{
  unint64_t v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource snapshot](self, "snapshot"));
  if (+[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions"))v4 = a3;
  else
    v4 = 0;
  objc_msgSend(v5, "switchToMode:", v4);

}

+ (int64_t)numberOfItemsInSection:(id)a3 forSnapshot:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionIdentifiers"));
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if (v8)
    v9 = objc_msgSend(v6, "numberOfItemsInSection:", v5);
  else
    v9 = 0;

  return (int64_t)v9;
}

- (void)performUpdatesIfNeededAndWait
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource removedObjectsManagedObjectContextChangeController](self, "removedObjectsManagedObjectContextChangeController"));
  objc_msgSend(v2, "performUpdatesIfNeededAndWait");

}

- (id)firstRelevantItemIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "snapshot"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemIdentifiers"));
  v5 = objc_msgSend(v4, "ic_firstObjectOfClass:", objc_opt_class(ICSearchResult));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unsigned int v31;

  v4 = a3;
  v5 = objc_opt_class(NSManagedObjectID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));

  v7 = ICDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
    goto LABEL_11;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "snapshot"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemIdentifiers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ic_map:", &stru_100554568));

  v13 = (char *)objc_msgSend(v12, "indexOfObject:", v8);
  if (v13 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v13;
    v15 = v13 + 1;
    if (v13 + 1 >= objc_msgSend(v12, "count"))
    {
      v20 = 0;
      if (!v14)
        goto LABEL_10;
    }
    else
    {
      v16 = objc_opt_class(ICSearchResult);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemIdentifiers"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v15));
      v19 = ICDynamicCast(v16, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

      if (!v14)
        goto LABEL_10;
    }
    if (!v20)
    {
      v21 = v14 - 1;
      v22 = objc_opt_class(ICSearchResult);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemIdentifiers"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", v21));
      v25 = ICDynamicCast(v22, v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v25);

    }
LABEL_10:

    if (v20)
      goto LABEL_12;
    goto LABEL_11;
  }

LABEL_11:
  v26 = objc_opt_class(ICSearchResult);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource firstRelevantItemIdentifier](self, "firstRelevantItemIdentifier"));
  v28 = ICDynamicCast(v26, v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v28);

LABEL_12:
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "object"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectID"));
  v31 = objc_msgSend(v30, "isEqual:", v8);

  if (v31)
  {

    v20 = 0;
  }

  return v20;
}

- (id)associatedCellsForItemIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshot"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D7124;
  v12[3] = &unk_100554590;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_compactMap:", v12));

  return v10;
}

- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshot"));
  v8 = objc_msgSend(v7, "numberOfItems");

  if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000D732C;
    v12[3] = &unk_1005545B8;
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v9 = v13;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);
    v10 = objc_msgSend(v9, "copy");

  }
  else
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }

  return v10;
}

- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource snapshot](self, "snapshot"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D74E4;
  v8[3] = &unk_100554608;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBlockAndUpdateHeaders:animated:block:", 1, 1, v8);

}

- (BOOL)managedObjectContextChangeControllerShouldUpdateImmediately:(id)a3
{
  return 1;
}

- (void)searchSnapshotDidUpdateSuggestions:(id)a3
{
  id v4;

  if ((id)-[ICNoteSearchDataSource noteDisplayMode](self, "noteDisplayMode", a3) == (id)1)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource delegate](self, "delegate"));
    objc_msgSend(v4, "searchDataSourceDidUpdateSuggestions:", self);

  }
}

- (void)noteLockManagerDidToggleLock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = objc_opt_class(ICNoteLockManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v7 = ICCheckedDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "updatedNote"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteSearchDataSource snapshot](self, "snapshot"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000D77C0;
    v12[3] = &unk_100554608;
    v13 = v8;
    objc_msgSend(v10, "performBlockAndUpdateHeaders:animated:block:", 0, 1, v12);

  }
  v11.receiver = self;
  v11.super_class = (Class)ICNoteSearchDataSource;
  -[ICNoteSearchDataSource noteLockManagerDidToggleLock:](&v11, "noteLockManagerDidToggleLock:", v4);

}

- (id)legacyViewContext
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));

  return v4;
}

- (id)modernViewContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectContext"));

  return v3;
}

- (int64_t)noteContainerViewMode
{
  return self->_noteContainerViewMode;
}

- (ICNoteSearchDataSourceDelegate)delegate
{
  return (ICNoteSearchDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)noteDisplayMode
{
  return self->_noteDisplayMode;
}

- (ICViewControllerManager)viewControllerManager
{
  return (ICViewControllerManager *)objc_loadWeakRetained((id *)&self->_viewControllerManager);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (ICNoteSearchSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (BOOL)didUpdateForCurrentSearchUserInput
{
  return self->_didUpdateForCurrentSearchUserInput;
}

- (void)setDidUpdateForCurrentSearchUserInput:(BOOL)a3
{
  self->_didUpdateForCurrentSearchUserInput = a3;
}

- (ICSearchUserInput)currentSearchUserInput
{
  return self->_currentSearchUserInput;
}

- (void)setCurrentSearchUserInput:(id)a3
{
  objc_storeStrong((id *)&self->_currentSearchUserInput, a3);
}

- (ICNoteSearchResultsController)searchResultsController
{
  return self->_searchResultsController;
}

- (void)setSearchResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultsController, a3);
}

- (ICManagedObjectContextChangeController)removedObjectsManagedObjectContextChangeController
{
  return self->_removedObjectsManagedObjectContextChangeController;
}

- (void)setRemovedObjectsManagedObjectContextChangeController:(id)a3
{
  objc_storeStrong((id *)&self->_removedObjectsManagedObjectContextChangeController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedObjectsManagedObjectContextChangeController, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_currentSearchUserInput, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_destroyWeak((id *)&self->_viewControllerManager);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
