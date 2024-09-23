@implementation ICFolderDataSource

- (ICTagOperatorCell)tagOperatorCell
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICTagOperatorItemIdentifier sharedItemIdentifier](ICTagOperatorItemIdentifier, "sharedItemIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForItemIdentifier:", v4));

  v7 = objc_opt_class(ICTagOperatorCell, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cellForItemAtIndexPath:", v5));
  v10 = ICDynamicCast(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return (ICTagOperatorCell *)v11;
}

- (ICFolderCoreDataIndexer)indexer
{
  ICFolderCoreDataIndexer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICFolderDataSource;
  v2 = -[ICFolderDataSource indexer](&v4, "indexer");
  return (ICFolderCoreDataIndexer *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (ICOutlineParentCollectionViewCell)tagHeadingCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "snapshot"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemIdentifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_objectPassingTest:", &stru_100555100));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForItemIdentifier:", v6));

    v10 = objc_opt_class(ICOutlineParentCollectionViewCell, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource collectionView](self, "collectionView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellForItemAtIndexPath:", v8));
    v13 = ICDynamicCast(v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  }
  else
  {
    v14 = 0;
  }

  return (ICOutlineParentCollectionViewCell *)v14;
}

- (NSManagedObjectContext)modernViewContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "managedObjectContext"));

  return (NSManagedObjectContext *)v3;
}

- (BOOL)hasGroupInset
{
  return self->_hasGroupInset;
}

- (void)updateTagOperatorVisibility
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  unsigned int v8;
  void *v9;

  v3 = -[ICFolderDataSource shouldDisplayTagOperatorInTagHeading](self, "shouldDisplayTagOperatorInTagHeading");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource tagHeadingCell](self, "tagHeadingCell"));
  objc_msgSend(v4, "setShouldDisplayTagSelectionOperator:", v3);

  if (-[ICFolderDataSource hasGroupInset](self, "hasGroupInset")
    || !-[ICFolderDataSource shouldShowTagOperatorOnSeparateLine](self, "shouldShowTagOperatorOnSeparateLine"))
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource tagSelection](self, "tagSelection"));
    v6 = (unint64_t)objc_msgSend(v5, "selectedTagCount") > 1;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource indexer](self, "indexer"));
  v8 = objc_msgSend(v7, "shouldIncludeTagOperator");

  if (v6 != v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource indexer](self, "indexer"));
    objc_msgSend(v9, "setShouldIncludeTagOperator:", v6);

    -[ICFolderDataSource reloadDataAnimated:](self, "reloadDataAnimated:", 1);
  }
}

- (id)unsupportedFolderInfoButtonTapHandler
{
  return self->_unsupportedFolderInfoButtonTapHandler;
}

- (BOOL)shouldIndentNoteCount
{
  return +[UIDevice ic_isVision](UIDevice, "ic_isVision") ^ 1;
}

- (BOOL)shouldDisplayTagOperatorInTagHeading
{
  if (-[ICFolderDataSource hasGroupInset](self, "hasGroupInset"))
    return 0;
  else
    return !-[ICFolderDataSource shouldShowTagOperatorOnSeparateLine](self, "shouldShowTagOperatorOnSeparateLine");
}

- (void)setTagSelection:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  objc_storeStrong((id *)&self->_tagSelection, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource tagOperatorCell](self, "tagOperatorCell"));
  objc_msgSend(v6, "setTagSelection:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource tagHeadingCell](self, "tagHeadingCell"));
  objc_msgSend(v7, "setTagSelection:", v5);

  -[ICFolderDataSource updateTagOperatorVisibility](self, "updateTagOperatorVisibility");
}

- (void)setHasGroupInset:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 hasGroupInset;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a3;
  hasGroupInset = self->_hasGroupInset;
  self->_hasGroupInset = a3;
  v6 = objc_opt_class(ICFolderListCollectionView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource collectionView](self, "collectionView"));
  v8 = ICDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "setHasGroupInset:", v3);

  if (hasGroupInset != v3)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource collectionView](self, "collectionView"));
    objc_msgSend(v10, "reloadData");

  }
}

- (ICNAViewController)presentingViewController
{
  return (ICNAViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (unint64_t)countOfModernAccounts
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource indexer](self, "indexer"));
  v3 = objc_msgSend(v2, "countOfModernAccounts");

  return (unint64_t)v3;
}

- (ICFolderDataSource)initWithCollectionView:(id)a3 presentingViewController:(id)a4 legacyManagedObjectContext:(id)a5 modernManagedObjectContext:(id)a6 overrideContainerIdentifier:(id)a7 unsupportedFolderInfoButtonTapHandler:(id)a8 accountUpgradeButtonTapHandlerProvider:(id)a9 tagSelectionDidChangeHandler:(id)a10 allowNotificationsCloseHandler:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  _QWORD *v35;
  void *v36;
  uint64_t v37;
  id v38;
  _QWORD *v39;
  ICFolderDataSource *v40;
  ICFolderDataSource *v41;
  id v42;
  id unsupportedFolderInfoButtonTapHandler;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  ICManagedObjectContextChangeController *v48;
  ICManagedObjectContextChangeController *managedObjectContextChangeController;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  ICSelectorDelayer *v55;
  ICSelectorDelayer *accountChangeDelayer;
  ICSelectorDelayer *v57;
  ICSelectorDelayer *updateVirtualSmartFoldersDelayer;
  ICFolderDataSource *v59;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id obj;
  void *v73;
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  objc_super v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  id v84;
  _QWORD v85[4];
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  _QWORD v91[4];
  id v92;
  id v93;
  _QWORD v94[4];
  id v95;
  id v96;
  _QWORD v97[4];
  id v98;
  id v99;
  _QWORD v100[4];
  id v101;
  id v102;
  id v103;
  id from;
  id location[2];

  v17 = a3;
  obj = a4;
  v18 = a5;
  v74 = a6;
  v19 = a7;
  v71 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  objc_initWeak(location, self);
  v73 = v17;
  objc_initWeak(&from, v17);
  self->_shouldShowTagOperatorOnSeparateLine = 0;
  v23 = objc_msgSend(objc_alloc((Class)ICFolderCoreDataIndexer), "initWithLegacyManagedObjectContext:modernManagedObjectContext:overrideContainerIdentifier:", v18, v74, v19);
  objc_msgSend(v23, "setShouldIncludeOutlineParentItems:", v19 == 0);
  objc_msgSend(v23, "setShouldIncludeTags:", v19 == 0);
  v68 = v19;
  v69 = v18;
  v24 = objc_opt_class(ICOutlineParentCollectionViewCell);
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_100103E18;
  v100[3] = &unk_100554FC8;
  objc_copyWeak(&v103, location);
  v67 = v20;
  v101 = v67;
  v25 = v21;
  v102 = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v24, v100));
  v27 = objc_opt_class(ICFolderOutlineCollectionViewCell);
  v70 = v23;
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_1001040B8;
  v97[3] = &unk_100554FF0;
  objc_copyWeak(&v98, location);
  objc_copyWeak(&v99, &from);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v27, v97));
  v29 = objc_opt_class(ICTagContainerCell);
  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472;
  v94[2] = sub_100104330;
  v94[3] = &unk_100555018;
  objc_copyWeak(&v96, location);
  v30 = v25;
  v95 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v29, v94));
  v32 = objc_opt_class(ICTagOperatorCell);
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_10010449C;
  v91[3] = &unk_100555040;
  objc_copyWeak(&v93, location);
  v66 = v30;
  v92 = v66;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCellRegistration registrationWithCellClass:configurationHandler:](UICollectionViewCellRegistration, "registrationWithCellClass:configurationHandler:", v32, v91));
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_100104624;
  v85[3] = &unk_100555068;
  v34 = v26;
  v86 = v34;
  v64 = v31;
  v87 = v64;
  v63 = v33;
  v88 = v63;
  v65 = v28;
  v89 = v65;
  objc_copyWeak(&v90, &from);
  v35 = objc_retainBlock(v85);
  v36 = v70;
  v37 = objc_opt_class(ICFolderListAllowNotificationsView);
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_10010471C;
  v82[3] = &unk_100555090;
  objc_copyWeak(&v84, location);
  v62 = v22;
  v83 = v62;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_10010477C;
  v80[3] = &unk_100552EC8;
  v38 = (id)objc_claimAutoreleasedReturnValue(+[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:elementKind:configurationHandler:](UICollectionViewSupplementaryRegistration, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v37, UICollectionElementKindSectionHeader, v82));
  v81 = v38;
  v39 = objc_retainBlock(v80);
  v79.receiver = self;
  v79.super_class = (Class)ICFolderDataSource;
  v40 = -[ICFolderDataSource initWithCollectionView:cellProvider:indexer:](&v79, "initWithCollectionView:cellProvider:indexer:", v73, v35, v70);
  v41 = v40;
  if (v40)
  {
    objc_storeWeak((id *)&v40->_presentingViewController, obj);
    v42 = objc_retainBlock(v71);
    unsupportedFolderInfoButtonTapHandler = v41->_unsupportedFolderInfoButtonTapHandler;
    v41->_unsupportedFolderInfoButtonTapHandler = v42;

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    if (v44)
    {
      v45 = objc_alloc((Class)ICManagedObjectContextChangeController);
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource modernViewContext](v41, "modernViewContext"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v46));
      v48 = (ICManagedObjectContextChangeController *)objc_msgSend(v45, "initWithManagedObjectContexts:delegate:", v47, v41);
      managedObjectContextChangeController = v41->_managedObjectContextChangeController;
      v41->_managedObjectContextChangeController = v48;

    }
    v61 = v34;
    v50 = objc_alloc_init((Class)UICollectionViewDiffableDataSourceSectionSnapshotHandlers);
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_100104788;
    v77[3] = &unk_10054FC20;
    objc_copyWeak(&v78, location);
    objc_msgSend(v50, "setWillExpandItemHandler:", v77);
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_100104874;
    v75[3] = &unk_10054FC20;
    objc_copyWeak(&v76, location);
    objc_msgSend(v50, "setWillCollapseItemHandler:", v75);
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource collectionViewDiffableDataSource](v41, "collectionViewDiffableDataSource"));
    objc_msgSend(v51, "setSectionSnapshotHandlers:", v50);

    -[ICFolderDataSource setSectionTypes:](v41, "setSectionTypes:", &off_10057C720);
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource collectionViewDiffableDataSource](v41, "collectionViewDiffableDataSource"));
    objc_msgSend(v52, "setSupplementaryViewProvider:", v39);

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v53, "addObserver:selector:name:object:", v41, "accountsDidChange:", ICAccountsDidChangeNotification, 0);

    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v54, "addObserver:selector:name:object:", v41, "accountsDidChange:", ICLocalAccountDidChooseToMigrateNotification, 0);

    v55 = (ICSelectorDelayer *)objc_msgSend(objc_alloc((Class)ICSelectorDelayer), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v41, "reloadDataAnimatedYes", 1, 0, 0.3);
    accountChangeDelayer = v41->_accountChangeDelayer;
    v41->_accountChangeDelayer = v55;

    v57 = (ICSelectorDelayer *)objc_msgSend(objc_alloc((Class)ICSelectorDelayer), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v41, "checkUpdateVirtualSmartFolders", 1, 1, 0.3);
    updateVirtualSmartFoldersDelayer = v41->_updateVirtualSmartFoldersDelayer;
    v41->_updateVirtualSmartFoldersDelayer = v57;

    objc_destroyWeak(&v76);
    objc_destroyWeak(&v78);

    v36 = v70;
    v34 = v61;
  }
  v59 = v41;

  objc_destroyWeak(&v84);
  objc_destroyWeak(&v90);

  objc_destroyWeak(&v93);
  objc_destroyWeak(&v96);

  objc_destroyWeak(&v99);
  objc_destroyWeak(&v98);

  objc_destroyWeak(&v103);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return v59;
}

- (void)reindexDataAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100104A68;
  v12[3] = &unk_1005550B8;
  objc_copyWeak(&v14, &location);
  v10 = v8;
  v13 = v10;
  v11.receiver = self;
  v11.super_class = (Class)ICFolderDataSource;
  -[ICFolderDataSource reindexDataAnimated:dataIndexedBlock:dataRenderedBlock:](&v11, "reindexDataAnimated:dataIndexedBlock:dataRenderedBlock:", v6, v12, v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)setShouldShowTagOperatorOnSeparateLine:(BOOL)a3
{
  self->_shouldShowTagOperatorOnSeparateLine = a3;
  -[ICFolderDataSource updateTagOperatorVisibility](self, "updateTagOperatorVisibility");
}

- (unint64_t)countOfLegacyAccounts
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource indexer](self, "indexer"));
  v3 = objc_msgSend(v2, "countOfLegacyAccounts");

  return (unint64_t)v3;
}

- (unint64_t)countOfAllVisibleAccounts
{
  unint64_t v3;

  v3 = -[ICFolderDataSource countOfLegacyAccounts](self, "countOfLegacyAccounts");
  return -[ICFolderDataSource countOfModernAccounts](self, "countOfModernAccounts") + v3;
}

- (NSSet)allSmartFolderObjectIDs
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource indexer](self, "indexer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allSmartFolderObjectIDs"));

  return (NSSet *)v3;
}

- (int64_t)shouldIncludeSharedWithYou
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource indexer](self, "indexer"));
  v3 = objc_msgSend(v2, "shouldIncludeSharedWithYou");

  return (int64_t)v3;
}

- (void)setShouldIncludeSharedWithYou:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource indexer](self, "indexer"));
  objc_msgSend(v4, "setShouldIncludeSharedWithYou:", a3);

}

- (int64_t)shouldIncludeSystemPaper
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource indexer](self, "indexer"));
  v3 = objc_msgSend(v2, "shouldIncludeSystemPaper");

  return (int64_t)v3;
}

- (void)setShouldIncludeSystemPaper:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource indexer](self, "indexer"));
  objc_msgSend(v4, "setShouldIncludeSystemPaper:", a3);

}

- (int64_t)shouldIncludeCallNotes
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource indexer](self, "indexer"));
  v3 = objc_msgSend(v2, "shouldIncludeCallNotes");

  return (int64_t)v3;
}

- (void)setShouldIncludeCallNotes:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource indexer](self, "indexer"));
  objc_msgSend(v4, "setShouldIncludeCallNotes:", a3);

}

- (int64_t)shouldIncludeMathNotes
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource indexer](self, "indexer"));
  v3 = objc_msgSend(v2, "shouldIncludeMathNotes");

  return (int64_t)v3;
}

- (void)setShouldIncludeMathNotes:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource indexer](self, "indexer"));
  objc_msgSend(v4, "setShouldIncludeMathNotes:", a3);

}

- (void)managedObjectContextChangeController:(id)a3 performUpdatesForManagedObjectIDs:(id)a4
{
  id v5;

  if (objc_msgSend(a4, "count", a3))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource updateVirtualSmartFoldersDelayer](self, "updateVirtualSmartFoldersDelayer"));
    objc_msgSend(v5, "requestFire");

  }
}

- (BOOL)managedObjectContextChangeControllerShouldUpdateImmediately:(id)a3
{
  return 1;
}

- (id)managedObjectContextChangeController:(id)a3 managedObjectIDsToUpdateForUpdatedManagedObjects:(id)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(ICNote);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectID", (_QWORD)v16));
          objc_msgSend(v5, "addObject:", v13);

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = objc_msgSend(v5, "copy");
  return v14;
}

- (NSManagedObjectContext)legacyViewContext
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));

  return (NSManagedObjectContext *)v4;
}

- (void)accountsDidChange:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource accountChangeDelayer](self, "accountChangeDelayer", a3));
  objc_msgSend(v3, "requestFire");

}

- (void)accountHidesNotesInCustomFoldersDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v20.receiver = self;
  v20.super_class = (Class)ICFolderDataSource;
  -[ICFolderDataSource accountHidesNotesInCustomFoldersDidChange:](&v20, "accountHidesNotesInCustomFoldersDidChange:", a3);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource collectionView](self, "collectionView", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForVisibleItems"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(ICFolderOutlineCollectionViewCell);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource collectionView](self, "collectionView"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cellForItemAtIndexPath:", v10));
        v14 = ICDynamicCast(v11, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        objc_msgSend(v15, "updateNoteCount");
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }

}

- (void)reloadDataAnimatedYes
{
  -[ICFolderDataSource reloadDataAnimated:](self, "reloadDataAnimated:", 1);
}

- (void)checkUpdateVirtualSmartFolders
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "snapshot"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemIdentifiers"));
  v6 = objc_msgSend(v5, "ic_objectsOfClass:", objc_opt_class(ICVirtualSmartFolderItemIdentifier));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICFolderDataSource indexer](self, "indexer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allVirtualSmartFolderIdentifiers"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10010538C;
  v12[3] = &unk_1005550E0;
  v12[4] = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ic_objectsPassingTest:", v12));

  if ((objc_msgSend(v11, "isEqualToSet:", v8) & 1) == 0)
    -[ICFolderDataSource reindexDataAnimated:](self, "reindexDataAnimated:", 1);

}

- (BOOL)shouldShowTagOperatorOnSeparateLine
{
  return self->_shouldShowTagOperatorOnSeparateLine;
}

- (ICTagSelection)tagSelection
{
  return self->_tagSelection;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (ICSelectorDelayer)accountChangeDelayer
{
  return self->_accountChangeDelayer;
}

- (ICSelectorDelayer)updateVirtualSmartFoldersDelayer
{
  return self->_updateVirtualSmartFoldersDelayer;
}

- (ICManagedObjectContextChangeController)managedObjectContextChangeController
{
  return self->_managedObjectContextChangeController;
}

- (void)setManagedObjectContextChangeController:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContextChangeController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContextChangeController, 0);
  objc_storeStrong((id *)&self->_updateVirtualSmartFoldersDelayer, 0);
  objc_storeStrong((id *)&self->_accountChangeDelayer, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong(&self->_unsupportedFolderInfoButtonTapHandler, 0);
  objc_storeStrong((id *)&self->_tagSelection, 0);
}

@end
