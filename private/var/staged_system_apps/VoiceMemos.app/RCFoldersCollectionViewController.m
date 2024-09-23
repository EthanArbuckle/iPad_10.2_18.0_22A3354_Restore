@implementation RCFoldersCollectionViewController

- (RCFolderSelectionDelegate)selectionDelegate
{
  return (RCFolderSelectionDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (id)_createCollectionViewLayout
{
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100076278;
  v5[3] = &unk_1001AC3C0;
  objc_copyWeak(&v6, &location);
  v3 = objc_msgSend(v2, "initWithSectionProvider:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (void)setSelectionDelegate:(id)a3
{
  RCFolderSelectionDelegate **p_selectionDelegate;
  id v5;
  id v6;

  p_selectionDelegate = &self->_selectionDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_selectionDelegate, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v6, "setSelectionDelegate:", v5);

}

- (RCFoldersCollectionViewController)init
{
  void *v3;
  RCFoldersCollectionViewController *v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController _createCollectionViewLayout](self, "_createCollectionViewLayout"));
  v6.receiver = self;
  v6.super_class = (Class)RCFoldersCollectionViewController;
  v4 = -[RCFoldersCollectionViewController initWithCollectionViewLayout:](&v6, "initWithCollectionViewLayout:", v3);

  return v4;
}

- (void)setCurrentFolderViewController:(id)a3
{
  objc_storeWeak((id *)&self->_currentFolderViewController, a3);
}

- (id)currentActiveFolderViewController
{
  RCFolderViewController **p_currentFolderViewController;
  id WeakRetained;
  unsigned __int8 v4;
  id v5;

  p_currentFolderViewController = &self->_currentFolderViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentFolderViewController);
  v4 = objc_msgSend(WeakRetained, "isInactive");

  if ((v4 & 1) != 0)
    v5 = 0;
  else
    v5 = objc_loadWeakRetained((id *)p_currentFolderViewController);
  return v5;
}

- (id)collectionViewIfLoaded
{
  void *v3;

  if (-[RCFoldersCollectionViewController isViewLoaded](self, "isViewLoaded"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController collectionView](self, "collectionView"));
  else
    v3 = 0;
  return v3;
}

- (RCFoldersDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)loadView
{
  RCFoldersDiffableDataSource *v3;
  void *v4;
  RCFoldersDiffableDataSource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void **v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *, uint64_t, void *);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)RCFoldersCollectionViewController;
  -[RCFoldersCollectionViewController loadView](&v18, "loadView");
  -[RCFoldersCollectionViewController _setupControllerAndDelegation](self, "_setupControllerAndDelegation");
  objc_initWeak(&location, self);
  v3 = [RCFoldersDiffableDataSource alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController collectionView](self, "collectionView"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100076058;
  v15 = &unk_1001ACCC8;
  objc_copyWeak(&v16, &location);
  v5 = -[RCFoldersDiffableDataSource initWithCollectionView:cellProvider:](v3, "initWithCollectionView:cellProvider:", v4, &v12);

  -[RCFoldersCollectionViewController setDiffableDataSource:](self, "setDiffableDataSource:", v5, v12, v13, v14, v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
  -[RCFoldersCollectionViewController setCellsHashTable:](self, "setCellsHashTable:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
  -[RCFoldersDiffableDataSource setFoldersController:](v5, "setFoldersController:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController selectionDelegate](self, "selectionDelegate"));
  -[RCFoldersDiffableDataSource setSelectionDelegate:](v5, "setSelectionDelegate:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v9, "setDataSource:", v5);

  v10 = -[RCFoldersCollectionViewController _selectionFollowsFocus](self, "_selectionFollowsFocus");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v11, "setSelectionFollowsFocus:", v10);

  -[RCFoldersCollectionViewController _classSpecificLoadView](self, "_classSpecificLoadView");
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_setupControllerAndDelegation
{
  RCFoldersFetchedResultsController *v3;
  RCFoldersFetchedResultsController *foldersController;
  id v5;

  if (!self->_foldersController)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
    v3 = (RCFoldersFetchedResultsController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "foldersController"));
    foldersController = self->_foldersController;
    self->_foldersController = v3;

    -[RCFoldersFetchedResultsController addContentObserver:](self->_foldersController, "addContentObserver:", self);
  }
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RCFoldersCollectionViewController;
  -[RCFoldersCollectionViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", -[RCFoldersCollectionViewController _collectionViewCellClass](self, "_collectionViewCellClass"), CFSTR("kFolderCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", -[RCFoldersCollectionViewController _collectionViewHeaderCellClass](self, "_collectionViewHeaderCellClass"), UICollectionElementKindSectionHeader, CFSTR("kFolderHeaderCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(UICollectionViewCell, v4), CFSTR("kFolderCollectionElementKindSectionSpacer"), CFSTR("kFolderSpacerCellReuseIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController diffableDataSource](self, "diffableDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersFetchedResultsController currentSnapshot](self->_foldersController, "currentSnapshot"));
  objc_msgSend(v5, "applySnapshot:animatingDifferences:", v6, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController editButtonItem](self, "editButtonItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RCFoldersCollectionViewController;
  -[RCFoldersCollectionViewController viewWillAppear:](&v11, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController editButtonItem](self, "editButtonItem"));
  objc_msgSend(v4, "setAction:", "_toggleFoldersEdit");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController parentViewController](self, "parentViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController editButtonItem](self, "editButtonItem"));
  objc_msgSend(v6, "setRightBarButtonItem:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathForSelectedItem"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController collectionView](self, "collectionView"));
    objc_msgSend(v10, "deselectItemAtIndexPath:animated:", v9, 0);

  }
  -[RCFoldersCollectionViewController _styleView](self, "_styleView");
  -[RCFoldersCollectionViewController _updateEditButtonStateAndExitEditingIfNeeded](self, "_updateEditButtonStateAndExitEditingIfNeeded");

}

- (void)_toggleFoldersEdit
{
  -[RCFoldersCollectionViewController setEditing:animated:](self, "setEditing:animated:", -[RCFoldersCollectionViewController isEditing](self, "isEditing") ^ 1, 1);
}

- (void)_updateEditButtonStateAndExitEditingIfNeeded
{
  unint64_t v3;
  void *v4;

  v3 = -[RCFoldersCollectionViewController _countOfUserFolders](self, "_countOfUserFolders");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController editButtonItem](self, "editButtonItem"));
  objc_msgSend(v4, "setEnabled:", v3 != 0);

  if (!v3)
  {
    if (-[RCFoldersCollectionViewController isEditing](self, "isEditing"))
      -[RCFoldersCollectionViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  }
}

- (int64_t)_folderTypeAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "folderAtIndexPath:", v4));

  v7 = objc_msgSend(v6, "folderType");
  return (int64_t)v7;
}

- (void)_configureCell:(id)a3 withFolderDisplayModel:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  v8 = objc_msgSend(v6, "recordingsCount");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iconImage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
  objc_msgSend(v12, "configureWithFolderName:recordingsCount:iconImage:UUID:folderType:", v7, v8, v9, v10, objc_msgSend(v6, "folderType"));

  if (-[RCFoldersCollectionViewController isEditing](self, "isEditing"))
    v11 = objc_msgSend(v6, "folderType") == (id)4;
  else
    v11 = 1;
  objc_msgSend(v12, "setEnabled:", v11);

}

- (unint64_t)_countOfUserFolders
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userFolders"));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (unint64_t)_countOfRecordingsInUserFolderNamed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "folderWithName:", v3));

  if (v5)
    v6 = objc_msgSend(v4, "playableCountForFolder:", v5);
  else
    v6 = 0;

  return (unint64_t)v6;
}

- (id)_trailingSwipeActionsConfigurationProvider
{
  _QWORD *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100076A2C;
  v4[3] = &unk_1001AC460;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v6;
  id v7;
  void *v8;

  v6 = a6;
  if (objc_msgSend(v6, "section") == (id)1)
    v7 = v6;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 1));
  v8 = v7;

  return v8;
}

- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) != 0;
}

- (Class)_collectionViewCellClass
{
  uint64_t v2;

  -[RCFoldersCollectionViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return (Class)objc_opt_class(UICollectionViewCell, v2);
}

- (Class)_collectionViewHeaderCellClass
{
  uint64_t v2;

  -[RCFoldersCollectionViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return (Class)objc_opt_class(UICollectionViewListCell, v2);
}

- (void)controller:(id)a3 didChangeContentWithSnapshot:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _BOOL4 v28;
  id v29;
  BOOL v30;
  void *v31;
  id v32;

  v32 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForSelectedItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  if (v7)
    goto LABEL_2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController collectionView](self, "collectionView"));
  v11 = objc_msgSend(v10, "isEditing");

  if (v11)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController indexPathOfSelectionDuringEditing](self, "indexPathOfSelectionDuringEditing"));
    if (v7)
    {
LABEL_2:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController diffableDataSource](self, "diffableDataSource"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIdentifierForIndexPath:", v7));

      goto LABEL_7;
    }
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v7 = 0;
  }
LABEL_7:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController diffableDataSource](self, "diffableDataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "snapshot"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController diffableDataSource](self, "diffableDataSource"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v14, "applySnapshot:animatingDifferences:", v32, objc_msgSend(v15, "isDuringMove") ^ 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController diffableDataSource](self, "diffableDataSource"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "snapshot"));
  v18 = objc_msgSend(v17, "numberOfItems");
  if (v18 != objc_msgSend(v13, "numberOfItems"))
  {

LABEL_13:
    if (!v9)
      goto LABEL_24;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController _builtInSectionIdentifier](self, "_builtInSectionIdentifier"));
    v26 = objc_msgSend(v13, "numberOfItemsInSection:", v23);
    v27 = objc_msgSend(v32, "numberOfItemsInSection:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController _userFolderSectionIdentifier](self, "_userFolderSectionIdentifier"));
    if (objc_msgSend(v13, "indexOfSectionIdentifier:", v25) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v28 = 0;
    }
    else
    {
      v29 = objc_msgSend(v13, "numberOfItemsInSection:", v25);
      v30 = objc_msgSend(v32, "indexOfSectionIdentifier:", v25) == (id)0x7FFFFFFFFFFFFFFFLL;
      v31 = v32;
      if (v30)
        goto LABEL_20;
      v28 = v29 > objc_msgSend(v32, "numberOfItemsInSection:", v25);
    }
    v31 = v32;
    if (v26 <= v27 && !v28)
      goto LABEL_22;
LABEL_20:
    if (objc_msgSend(v31, "indexOfItemIdentifier:", v9) == (id)0x7FFFFFFFFFFFFFFFLL)
      -[RCFoldersCollectionViewController handleFolderDeletion](self, "handleFolderDeletion");
    goto LABEL_22;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController diffableDataSource](self, "diffableDataSource"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "snapshot"));
  v21 = objc_msgSend(v20, "numberOfSections");
  v22 = objc_msgSend(v13, "numberOfSections");

  if (v21 != v22)
    goto LABEL_13;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController diffableDataSource](self, "diffableDataSource"));
  if (!objc_msgSend(v23, "isDuringMove"))
  {
LABEL_23:

    goto LABEL_24;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController indexPathOfSelectionDuringEditing](self, "indexPathOfSelectionDuringEditing"));

  if (v24)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController diffableDataSource](self, "diffableDataSource"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "indexPathForItemIdentifier:", v9));
    -[RCFoldersCollectionViewController setIndexPathOfSelectionDuringEditing:](self, "setIndexPathOfSelectionDuringEditing:", v25);
LABEL_22:

    goto LABEL_23;
  }
LABEL_24:
  -[RCFoldersCollectionViewController _updateEditButtonStateAndExitEditingIfNeeded](self, "_updateEditButtonStateAndExitEditingIfNeeded");

}

- (id)_builtInSectionIdentifier
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), 0);
}

- (id)_userFolderSectionIdentifier
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), 1);
}

- (void)handleFolderDeletion
{
  -[RCFoldersCollectionViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (unint64_t)_folderCount
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  char *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "builtinFolders"));
  v5 = (char *)objc_msgSend(v4, "count");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userFolders"));
  v8 = &v5[(_QWORD)objc_msgSend(v7, "count")];

  return (unint64_t)v8;
}

- (void)restyle
{
  id v3;

  -[RCFoldersCollectionViewController _styleView](self, "_styleView");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController currentActiveFolderViewController](self, "currentActiveFolderViewController"));
  objc_msgSend(v3, "restyle");

}

- (void)_styleView
{
  _BOOL8 v3;
  id v4;

  -[RCFoldersCollectionViewController _restyleAllExtantCells](self, "_restyleAllExtantCells");
  v3 = -[RCFoldersCollectionViewController _selectionFollowsFocus](self, "_selectionFollowsFocus");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "setSelectionFollowsFocus:", v3);

}

- (void)_restyleAllExtantCells
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController cellsHashTable](self, "cellsHashTable", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___RCRestylableProtocol))
          objc_msgSend(v7, "restyle");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)_backgroundColorToUse
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sidebarCollectionViewBackgroundColor"));

  return v3;
}

- (BOOL)_showsSeparators
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "sidebarCollectionViewShowsSeparators");

  return v3;
}

- (int64_t)_layoutListAppearance
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "sidebarCollectionViewListAppearance");

  return (int64_t)v3;
}

- (double)_builtInFolderSectionTopPadding
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v2, "sidebarCollectionViewTopPadding");
  v4 = v3;

  return v4;
}

- (BOOL)_selectionFollowsFocus
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "sidebarSelectionFollowsFocus");

  return v3;
}

- (RCFoldersFetchedResultsController)foldersController
{
  return self->_foldersController;
}

- (void)setFoldersController:(id)a3
{
  objc_storeStrong((id *)&self->_foldersController, a3);
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (RCFolderViewController)currentFolderViewController
{
  return (RCFolderViewController *)objc_loadWeakRetained((id *)&self->_currentFolderViewController);
}

- (NSHashTable)cellsHashTable
{
  return self->_cellsHashTable;
}

- (void)setCellsHashTable:(id)a3
{
  objc_storeStrong((id *)&self->_cellsHashTable, a3);
}

- (NSIndexPath)indexPathOfSelectionDuringEditing
{
  return self->_indexPathOfSelectionDuringEditing;
}

- (void)setIndexPathOfSelectionDuringEditing:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathOfSelectionDuringEditing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathOfSelectionDuringEditing, 0);
  objc_storeStrong((id *)&self->_cellsHashTable, 0);
  objc_destroyWeak((id *)&self->_currentFolderViewController);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_foldersController, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_folderUUID, 0);
}

@end
