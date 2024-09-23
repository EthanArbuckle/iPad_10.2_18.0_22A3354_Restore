@implementation ICNoteBrowseViewController

- (ICNoteBrowseDataSource)noteDataSource
{
  ICNoteBrowseDataSource *noteDataSource;
  ICNoteBrowseDataSource *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICNoteBrowseDataSource *v13;
  ICNoteBrowseDataSource *v14;
  void *v15;
  void *v16;
  ICNoteBrowseDataSource *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;

  noteDataSource = self->_noteDataSource;
  if (noteDataSource)
    return noteDataSource;
  v5 = [ICNoteBrowseDataSource alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  v7 = -[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "folderListViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "folderDataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistenceConfiguration"));
  v13 = -[ICNoteBrowseDataSource initWithCollectionView:presentingViewController:noteContainerViewMode:folderDataSource:persistenceConfiguration:](v5, "initWithCollectionView:presentingViewController:noteContainerViewMode:folderDataSource:persistenceConfiguration:", v6, self, v7, v10, v12);
  v14 = self->_noteDataSource;
  self->_noteDataSource = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "workerManagedObjectContext"));
  -[ICNoteBrowseDataSource setApplySnapshotModernManagedObjectContext:](self->_noteDataSource, "setApplySnapshotModernManagedObjectContext:", v16);

  objc_initWeak(&location, self);
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_1000DEEAC;
  v21 = &unk_10054FC20;
  objc_copyWeak(&v22, &location);
  -[ICNoteBrowseDataSource setWillExpandItemHandler:](self->_noteDataSource, "setWillExpandItemHandler:", &v18);
  -[ICNoteBrowseViewController updateFolderSectionVisibility](self, "updateFolderSectionVisibility", v18, v19, v20, v21);
  v17 = self->_noteDataSource;
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  return v17;
}

- (ICNoteBrowseViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4
{
  id v6;
  ICNoteBrowseViewController *v7;
  ICNoteBrowseCollectionView *v8;
  void *v9;
  void *v10;
  void *v11;
  ICNoteBrowseCollectionView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v35;
  id v36;
  id location;
  objc_super v38;

  v6 = a4;
  v38.receiver = self;
  v38.super_class = (Class)ICNoteBrowseViewController;
  v7 = -[ICNoteResultsViewController initWithViewMode:viewControllerManager:viewControllerType:](&v38, "initWithViewMode:viewControllerManager:viewControllerType:", a3, v6, 0);
  if (v7)
  {
    v8 = [ICNoteBrowseCollectionView alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController legacyViewContext](v7, "legacyViewContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController modernViewContext](v7, "modernViewContext"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](v7, "viewControllerManager"));
    v12 = -[ICNoteBrowseCollectionView initWithPresentingViewController:legacyManagedObjectContext:modernManagedObjectContext:viewControllerManager:](v8, "initWithPresentingViewController:legacyManagedObjectContext:modernManagedObjectContext:viewControllerManager:", v7, v9, v10, v11);
    -[ICNoteResultsViewController setCollectionView:](v7, "setCollectionView:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](v7, "noteDataSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionViewDiffableDataSource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](v7, "collectionView"));
    objc_msgSend(v15, "setDiffableDataSource:", v14);

    objc_initWeak(&location, v7);
    objc_copyWeak(&v36, &location);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](v7, "collectionView", _NSConcreteStackBlock, 3221225472, sub_1000DA710, &unk_100554638));
    objc_msgSend(v16, "setOptimisticallyAppliedSnapshotHandler:", &v35);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](v7, "noteDataSource"));
    objc_msgSend(v17, "setNoteContainerViewMode:", a3);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](v7, "collectionView"));
    objc_msgSend(v18, "setAllowsMultipleSelection:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](v7, "collectionView"));
    objc_msgSend(v19, "setAllowsMultipleSelectionDuringEditing:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController modernViewContext](v7, "modernViewContext"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v7, "managedObjectContextDidSaveObjectIDs:", NSManagedObjectContextDidSaveObjectIDsNotification, v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v22, "addObserver:selector:name:object:", v7, "sceneDidActivate:", UISceneDidActivateNotification, 0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "addObserver:selector:name:object:", v7, "sceneWillDeactivate:", UISceneWillDeactivateNotification, 0);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v24, "addObserver:selector:name:object:", v7, "analyticsSessionWillEnd:", ICNASessionWillEndNotification, 0);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v25, "addObserver:selector:name:object:", v7, "didUpdateSearchAppearanceNotification:", CFSTR("ICNoteSearchViewControllerDidUpdateSearchAppearanceNotification"), 0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v26, "addObserver:selector:name:object:", v7, "sharedWithYouControllerDidUpdateHighlights:", ICSharedWithYouControllerDidUpdateHighlightsNotification, 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "addObserver:selector:name:object:", v7, "accessibilityStatusDidChange", UIAccessibilityVoiceOverStatusDidChangeNotification, 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v28, "addObserver:selector:name:object:", v7, "accessibilityStatusDidChange", UIAccessibilitySwitchControlStatusDidChangeNotification, 0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "cloudContextDelegate"));
    v31 = ICKeyPathFromSelector("syncMessage");
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    objc_msgSend(v30, "ic_addObserver:forKeyPath:context:", v7, v32, &off_1005CE168);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](v7, "viewControllerManager"));
    objc_msgSend(v33, "ic_addObserver:forKeyPath:context:", v7, CFSTR("focusedNoteObjectID"), &off_1005CE168);

    -[ICNoteBrowseViewController addKVOObservers](v7, "addKVOObservers");
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "virtualSmartFolder"));

  return (ICVirtualSmartFolderItemIdentifier *)v3;
}

- (BOOL)updateFolderSectionVisibility
{
  unsigned __int8 v3;
  void *v4;
  char v5;
  _BOOL8 v6;
  void *v7;

  v3 = -[ICNoteBrowseViewController shouldIncludeSubfolders](self, "shouldIncludeSubfolders");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  v5 = v3 ^ objc_msgSend(v4, "shouldIncludeSubfolders");

  v6 = -[ICNoteBrowseViewController shouldIncludeSubfolders](self, "shouldIncludeSubfolders");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  objc_msgSend(v7, "setShouldIncludeSubfolders:", v6);

  return v5;
}

- (BOOL)shouldIncludeSubfolders
{
  void *v2;
  void *v4;
  void *v5;
  BOOL v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
  if (!v4)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteCollection](self, "noteCollection"));
    if (!v2)
    {
      v6 = 0;
LABEL_9:

      goto LABEL_10;
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v6 = (objc_msgSend(v5, "hasCompactWidth") & 1) != 0
    || (id)-[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode") == (id)1;

  if (!v4)
    goto LABEL_9;
LABEL_10:

  return v6;
}

- (void)sceneDidActivate:(id)a3
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
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;

  v4 = a3;
  v5 = objc_opt_class(UIWindowScene);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  v7 = ICDynamicCast(v5, v6);
  v16 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "session"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistentIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController viewIfLoaded](self, "viewIfLoaded"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowScene"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "session"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "persistentIdentifier"));
  v15 = objc_msgSend(v9, "isEqual:", v14);

  if (v15 && -[ICNoteBrowseViewController ic_isViewVisible](self, "ic_isViewVisible"))
  {
    -[ICNoteBrowseViewController startAnalyticsTracking](self, "startAnalyticsTracking");
    -[ICNoteResultsViewController updatePreparedCells](self, "updatePreparedCells");
  }

}

- (NSArray)observedUserDefaultsProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v3, "ic_addNonNilObject:", ICSettingsNoteListSortTypeKey);
  objc_msgSend(v3, "ic_addNonNilObject:", ICFolderCustomNoteSortTypeQuerySortKey);
  objc_msgSend(v3, "ic_addNonNilObject:", ICSettingsNoteDateHeadersTypeKey);
  objc_msgSend(v3, "ic_addNonNilObject:", ICSettingsQueryDateHeadersTypeKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "noteSortTypeUserDefaultsKey"));
  objc_msgSend(v3, "ic_addNonNilObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateHeadersTypeUserDefaultsKey"));
  objc_msgSend(v3, "ic_addNonNilObject:", v7);

  return (NSArray *)v3;
}

- (NSArray)observedNoteContainerProperties
{
  void *v2;
  _UNKNOWN **v3;
  NSArray *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
  if (v2)
    v3 = &off_10057C708;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (ICNoteContainer)noteContainer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteContainer"));

  return (ICNoteContainer *)v3;
}

- (NoteCollectionObject)noteCollection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteCollection"));

  return (NoteCollectionObject *)v3;
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICNoteBrowseViewController;
  -[ICNoteBrowseViewController didMoveToParentViewController:](&v5, "didMoveToParentViewController:");
  if (a3)
  {
    if (-[ICNoteBrowseViewController ic_isViewVisible](self, "ic_isViewVisible"))
      -[ICNoteBrowseViewController resetBarButtonItemsAnimated:](self, "resetBarButtonItemsAnimated:", 0);
  }
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNoteBrowseViewController;
  -[ICNoteBrowseViewController loadView](&v4, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  -[ICNoteBrowseViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  ICNoteBrowseNavigationItemConfiguration *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNoteBrowseViewController;
  -[ICNoteResultsViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = -[ICNoteBrowseNavigationItemConfiguration initWithDataSource:delegate:]([ICNoteBrowseNavigationItemConfiguration alloc], "initWithDataSource:delegate:", self, self);
  -[ICNoteBrowseViewController setNavigationItemConfiguration:](self, "setNavigationItemConfiguration:", v3);

}

- (void)sceneWillDeactivate:(id)a3
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
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;

  v4 = a3;
  v5 = objc_opt_class(UIWindowScene);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  v7 = ICDynamicCast(v5, v6);
  v16 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "session"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistentIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController viewIfLoaded](self, "viewIfLoaded"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowScene"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "session"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "persistentIdentifier"));
  v15 = objc_msgSend(v9, "isEqual:", v14);

  if (v15 && -[ICNoteBrowseViewController ic_isViewVisible](self, "ic_isViewVisible"))
    -[ICNoteBrowseViewController endAnalyticsTracking](self, "endAnalyticsTracking");

}

- (void)analyticsSessionWillEnd:(id)a3
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
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;

  v4 = a3;
  v5 = objc_opt_class(UIWindowScene);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));

  v7 = ICDynamicCast(v5, v6);
  v16 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "session"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistentIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController viewIfLoaded](self, "viewIfLoaded"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "windowScene"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "session"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "persistentIdentifier"));
  v15 = objc_msgSend(v9, "isEqual:", v14);

  if (v15)
    -[ICNoteBrowseViewController endAnalyticsTracking](self, "endAnalyticsTracking");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cloudContextDelegate"));
  v6 = ICKeyPathFromSelector("syncMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "ic_removeObserver:forKeyPath:context:", self, v7, &off_1005CE168);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  objc_msgSend(v8, "ic_removeObserver:forKeyPath:context:", self, CFSTR("focusedNoteObjectID"), &off_1005CE168);

  -[ICNoteBrowseViewController removeKVOObservers](self, "removeKVOObservers");
  v9.receiver = self;
  v9.super_class = (Class)ICNoteBrowseViewController;
  -[ICNoteResultsViewController dealloc](&v9, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void **v24;
  uint64_t v25;
  id (*v26)(uint64_t);
  void *v27;
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];

  v3 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ICNoteBrowseViewController;
  -[ICNoteResultsViewController viewWillAppear:](&v34, "viewWillAppear:");
  -[ICNoteBrowseViewController resetBarButtonItemsAnimated:](self, "resetBarButtonItemsAnimated:", v3);
  -[ICNoteBrowseViewController updateTagDetailOperatorMenuVisibility](self, "updateTagDetailOperatorMenuVisibility");
  if (-[ICNoteBrowseViewController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    if ((-[ICNoteBrowseViewController ic_isBeingRevealedFromPoppingViewController](self, "ic_isBeingRevealedFromPoppingViewController") & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController transitionCoordinator](self, "transitionCoordinator"));
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController transitionCoordinator](self, "transitionCoordinator"));
        v7 = objc_msgSend(v6, "isCancelled");

        if ((v7 & 1) == 0)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItem](self, "navigationItem"));
          objc_msgSend(v8, "setHidesSearchBarWhenScrolling:", 0);

        }
      }
    }
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathsForVisibleItems"));

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v31;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v13);
        v15 = objc_opt_class(ICFolderOutlineCollectionViewCell);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cellForItemAtIndexPath:", v14));
        v18 = ICDynamicCast(v15, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

        objc_msgSend(v19, "updateSubfolderCount");
        objc_msgSend(v19, "updateNoteCount");

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v11);
  }

  objc_initWeak(&location, self);
  v20 = objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController view](self, "view"));
  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_1000DAFB8;
  v27 = &unk_100552D38;
  objc_copyWeak(&v28, &location);
  objc_msgSend((id)v20, "ic_addCreateNoteInteractionWithFolderHandler:", &v24);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteCollection](self, "noteCollection", v24, v25, v26, v27));
  LOBYTE(v20) = v21 == 0;

  if ((v20 & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NotesApp sharedNotesApp](NotesApp, "sharedNotesApp"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteCollection](self, "noteCollection"));
    objc_msgSend(v22, "refreshNotesIfNeededForCollection:", v23);

  }
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ICNoteBrowseViewController;
  v5 = -[ICNoteResultsViewController viewDidAppear:](&v19, "viewDidAppear:", a3);
  v7 = ICAccessibilityNeedsAccessibilityElements(v5, v6) ^ 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setHidesSearchBarWhenScrolling:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
  objc_msgSend(v9, "didFinishExtendedLaunch");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  LODWORD(v8) = objc_msgSend(v10, "isRunningTest");

  if ((_DWORD)v8)
  {
    if (-[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode"))
    {
      if ((id)-[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode") != (id)1)
        goto LABEL_7;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
      objc_msgSend(v11, "didShowGridView");
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
      objc_msgSend(v11, "didShowNotesList");
    }

  }
LABEL_7:
  -[ICNoteBrowseViewController startAnalyticsTracking](self, "startAnalyticsTracking");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountIdentifier"));

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "noteContainerAccount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    v17 = v16;
    if (!v16)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteCollection](self, "noteCollection"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchDomainIdentifier"));
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
    objc_msgSend(v18, "setAccountIdentifier:", v17);

    if (!v16)
    {

    }
  }
  -[ICNoteResultsViewController updatePreparedCells](self, "updatePreparedCells");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[ICNoteBrowseViewController endAnalyticsTracking](self, "endAnalyticsTracking");
  v6.receiver = self;
  v6.super_class = (Class)ICNoteBrowseViewController;
  -[ICNoteBrowseViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController view](self, "view"));
  objc_msgSend(v5, "ic_removeLinkActionInteractions");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)ICNoteBrowseViewController;
  v7 = a4;
  -[ICNoteBrowseViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000DB440;
  v9[3] = &unk_1005500E8;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DB448;
  v8[3] = &unk_1005500E8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ICNoteBrowseViewController;
  -[ICNoteBrowseViewController viewDidLayoutSubviews](&v14, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));
  objc_msgSend(v3, "availableWidth");
  v5 = v4;
  -[ICNoteBrowseViewController availableWidthForSummaryView](self, "availableWidthForSummaryView");
  v7 = vabdd_f64(v5, v6);

  if (v7 >= 0.00999999978)
  {
    -[ICNoteBrowseViewController availableWidthForSummaryView](self, "availableWidthForSummaryView");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));
    objc_msgSend(v10, "setAvailableWidth:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));
    objc_msgSend(v11, "update");

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  if (!objc_msgSend(v12, "isRunningTest"))
    goto LABEL_7;
  v13 = -[ICNoteBrowseViewController _appearState](self, "_appearState");

  if (v13 == 1 && !-[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
    objc_msgSend(v12, "noteListDidLayoutSubviews");
LABEL_7:

  }
}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICNoteBrowseViewController;
  -[ICNoteBrowseViewController viewLayoutMarginsDidChange](&v5, "viewLayoutMarginsDidChange");
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBar"));
    objc_msgSend(v4, "_setOverrideContentInsets:forRectEdges:", 10, 0.0, 12.0, 0.0, 12.0);

  }
}

- (void)willDismissSearchController:(id)a3
{
  void *v4;
  ICNoteBrowseViewController *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteBrowseViewController;
  -[ICBaseViewController willDismissSearchController:](&v6, "willDismissSearchController:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationController](self, "navigationController"));
  v5 = (ICNoteBrowseViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));

  if (v5 == self)
    -[ICNoteBrowseViewController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", 0);
}

- (void)setNoteContainer:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  CFNullRef v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const __CFNull *v15;
  CFNullRef v16;
  unint64_t v17;
  const __CFNull *v18;
  unint64_t v19;
  void *v20;
  BOOL v21;
  unsigned int v22;
  const __CFNull *v23;
  ICTagSelection *tagSelection;
  void *v25;
  void *v26;
  _QWORD v27[5];
  const __CFNull *v28;
  _QWORD block[5];
  const __CFNull *v30;
  id v31;
  uint8_t buf[4];
  ICNoteBrowseViewController *v33;
  __int16 v34;
  void *v35;

  v8 = (CFNullRef)a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class(ICCloudSyncingObject);
  v12 = ICDynamicCast(v11, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "shortLoggingDescription"));
    v26 = v25;
    if (!v25)
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFNull containerIdentifier](v8, "containerIdentifier"));
    *(_DWORD *)buf = 134218242;
    v33 = self;
    v34 = 2112;
    v35 = v26;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Setting note container on note browser %p: %@", buf, 0x16u);
    if (!v25)

  }
  v15 = (const __CFNull *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
  if (kCFNull == v8)
    v16 = 0;
  else
    v16 = v8;
  v17 = v16;
  if (kCFNull == v15)
    v18 = 0;
  else
    v18 = v15;
  v19 = v18;
  if (v17 | v19)
  {
    v20 = (void *)v19;
    if (v17)
      v21 = v19 == 0;
    else
      v21 = 1;
    if (v21)
    {

    }
    else
    {
      v22 = objc_msgSend((id)v17, "isEqual:", v19);

      if (v22)
        goto LABEL_17;
    }
    tagSelection = self->_tagSelection;
    self->_tagSelection = 0;

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000DB9B0;
    v27[3] = &unk_10054FE80;
    v27[4] = self;
    v28 = v8;
    -[ICNoteBrowseViewController updateDataSourceAnimated:dataIndexedBlock:dataRenderedBlock:updateDataSourceBlock:](self, "updateDataSourceAnimated:dataIndexedBlock:dataRenderedBlock:updateDataSourceBlock:", 0, v9, v10, v27);
    v23 = v28;
    goto LABEL_19;
  }

LABEL_17:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DB934;
  block[3] = &unk_100554660;
  block[4] = self;
  v30 = (const __CFNull *)v9;
  v31 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  v23 = v30;
LABEL_19:

}

- (void)setNoteContainer:(id)a3
{
  -[ICNoteBrowseViewController setNoteContainer:dataIndexedBlock:dataRenderedBlock:](self, "setNoteContainer:dataIndexedBlock:dataRenderedBlock:", a3, 0, 0);
}

- (void)setNoteCollection:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  CFNullRef v8;
  id v9;
  id v10;
  NSObject *v11;
  const __CFNull *v12;
  CFNullRef v13;
  unint64_t v14;
  const __CFNull *v15;
  unint64_t v16;
  void *v17;
  BOOL v18;
  unsigned int v19;
  const __CFNull *v20;
  ICTagSelection *tagSelection;
  _QWORD v22[5];
  const __CFNull *v23;
  _QWORD block[5];
  const __CFNull *v25;
  id v26;

  v8 = (CFNullRef)a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_10040AE4C((uint64_t)self, v8, v11);

  v12 = (const __CFNull *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteCollection](self, "noteCollection"));
  if (kCFNull == v8)
    v13 = 0;
  else
    v13 = v8;
  v14 = v13;
  if (kCFNull == v12)
    v15 = 0;
  else
    v15 = v12;
  v16 = v15;
  if (v14 | v16)
  {
    v17 = (void *)v16;
    if (v14)
      v18 = v16 == 0;
    else
      v18 = 1;
    if (v18)
    {

    }
    else
    {
      v19 = objc_msgSend((id)v14, "isEqual:", v16);

      if (v19)
        goto LABEL_18;
    }
    tagSelection = self->_tagSelection;
    self->_tagSelection = 0;

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000DBC7C;
    v22[3] = &unk_10054FE80;
    v22[4] = self;
    v23 = v8;
    -[ICNoteBrowseViewController updateDataSourceAnimated:dataIndexedBlock:dataRenderedBlock:updateDataSourceBlock:](self, "updateDataSourceAnimated:dataIndexedBlock:dataRenderedBlock:updateDataSourceBlock:", 0, v9, v10, v22);
    v20 = v23;
    goto LABEL_20;
  }

LABEL_18:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DBC00;
  block[3] = &unk_100554660;
  block[4] = self;
  v25 = (const __CFNull *)v9;
  v26 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  v20 = v25;
LABEL_20:

}

- (void)setNoteCollection:(id)a3
{
  -[ICNoteBrowseViewController setNoteCollection:dataIndexedBlock:dataRenderedBlock:](self, "setNoteCollection:dataIndexedBlock:dataRenderedBlock:", a3, 0, 0);
}

- (ICQuery)noteQuery
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "noteQuery"));

  return (ICQuery *)v3;
}

- (void)setNoteQuery:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  const __CFNull *v8;
  id v9;
  id v10;
  NSObject *v11;
  const __CFNull *v12;
  const __CFNull *v13;
  unint64_t v14;
  const __CFNull *v15;
  unint64_t v16;
  void *v17;
  BOOL v18;
  unsigned int v19;
  const __CFNull *v20;
  void *v21;
  _BOOL8 v22;
  _QWORD v23[5];
  const __CFNull *v24;
  _QWORD block[5];
  const __CFNull *v26;
  id v27;

  v8 = (const __CFNull *)a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_10040AEFC();

  v12 = (const __CFNull *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteQuery](self, "noteQuery"));
  if (kCFNull == v8)
    v13 = 0;
  else
    v13 = v8;
  v14 = v13;
  if (kCFNull == v12)
    v15 = 0;
  else
    v15 = v12;
  v16 = v15;
  if (v14 | v16)
  {
    v17 = (void *)v16;
    if (v14)
      v18 = v16 == 0;
    else
      v18 = 1;
    if (v18)
    {

    }
    else
    {
      v19 = objc_msgSend((id)v14, "isEqual:", v16);

      if (v19)
        goto LABEL_18;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteQuery](self, "noteQuery"));
    v22 = v21 != 0;

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000DBF90;
    v23[3] = &unk_10054FE80;
    v23[4] = self;
    v24 = v8;
    -[ICNoteBrowseViewController updateDataSourceAnimated:dataIndexedBlock:dataRenderedBlock:updateDataSourceBlock:](self, "updateDataSourceAnimated:dataIndexedBlock:dataRenderedBlock:updateDataSourceBlock:", v22, v9, v10, v23);
    v20 = v24;
    goto LABEL_20;
  }

LABEL_18:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DBF14;
  block[3] = &unk_100554660;
  block[4] = self;
  v26 = (const __CFNull *)v9;
  v27 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  v20 = v26;
LABEL_20:

}

- (void)setNoteQuery:(id)a3
{
  -[ICNoteBrowseViewController setNoteQuery:dataIndexedBlock:dataRenderedBlock:](self, "setNoteQuery:dataIndexedBlock:dataRenderedBlock:", a3, 0, 0);
}

- (void)setVirtualSmartFolder:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  const __CFNull *v8;
  id v9;
  id v10;
  NSObject *v11;
  const __CFNull *v12;
  const __CFNull *v13;
  unint64_t v14;
  const __CFNull *v15;
  unint64_t v16;
  void *v17;
  BOOL v18;
  unsigned int v19;
  const __CFNull *v20;
  ICTagSelection *tagSelection;
  const __CFNull *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  const __CFNull *v29;
  _QWORD block[5];
  const __CFNull *v31;
  id v32;

  v8 = (const __CFNull *)a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_10040AF5C();

  v12 = (const __CFNull *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));
  if (kCFNull == v8)
    v13 = 0;
  else
    v13 = v8;
  v14 = v13;
  if (kCFNull == v12)
    v15 = 0;
  else
    v15 = v12;
  v16 = v15;
  if (!(v14 | v16))
  {

LABEL_18:
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DC250;
    block[3] = &unk_100554660;
    block[4] = self;
    v31 = (const __CFNull *)v9;
    v32 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    v20 = v31;
    goto LABEL_22;
  }
  v17 = (void *)v16;
  if (v14)
    v18 = v16 == 0;
  else
    v18 = 1;
  if (v18)
  {

  }
  else
  {
    v19 = objc_msgSend((id)v14, "isEqual:", v16);

    if (v19)
      goto LABEL_18;
  }
  tagSelection = self->_tagSelection;
  self->_tagSelection = 0;

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000DC2CC;
  v28[3] = &unk_10054FE80;
  v28[4] = self;
  v22 = v8;
  v29 = v22;
  -[ICNoteBrowseViewController updateDataSourceAnimated:dataIndexedBlock:dataRenderedBlock:updateDataSourceBlock:](self, "updateDataSourceAnimated:dataIndexedBlock:dataRenderedBlock:updateDataSourceBlock:", 0, v9, v10, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFNull type](v22, "type"));
  v24 = objc_msgSend(v23, "isEqual:", ICVirtualSmartFolderItemIdentifierTypeSharedWithYou);

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationController sharedInstance](ICCollaborationController, "sharedInstance"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFNull accountObjectID](v22, "accountObjectID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[ICInvitationsCoreDataIndexer defaultReceivedSince](ICInvitationsCoreDataIndexer, "defaultReceivedSince"));
    objc_msgSend(v25, "updatePendingInvitationsInAccountWithID:receivedSince:", v26, v27);

  }
  v20 = v29;
LABEL_22:

}

- (void)setVirtualSmartFolder:(id)a3
{
  -[ICNoteBrowseViewController setVirtualSmartFolder:dataIndexedBlock:dataRenderedBlock:](self, "setVirtualSmartFolder:dataIndexedBlock:dataRenderedBlock:", a3, 0, 0);
}

- (void)setTagSelection:(id)a3
{
  -[ICNoteBrowseViewController setTagSelection:dataIndexedBlock:dataRenderedBlock:](self, "setTagSelection:dataIndexedBlock:dataRenderedBlock:", a3, 0, 0);
}

- (void)setTagSelection:(id)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_10040AFBC();

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagDetailCell](self, "tagDetailCell"));
  objc_msgSend(v13, "updateForTagSelection:animated:", v9, 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));
  v15 = v14 != 0;

  objc_storeStrong((id *)&self->_tagSelection, a3);
  -[ICNoteBrowseViewController submitTagSelectionAnalyticsIfNeeded](self, "submitTagSelectionAnalyticsIfNeeded");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000DC49C;
  v20[3] = &unk_100550160;
  v20[4] = self;
  v21 = v10;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000DC4D8;
  v18[3] = &unk_10054FE80;
  v18[4] = self;
  v19 = v9;
  v16 = v9;
  v17 = v10;
  -[ICNoteBrowseViewController updateDataSourceAnimated:dataIndexedBlock:dataRenderedBlock:updateDataSourceBlock:](self, "updateDataSourceAnimated:dataIndexedBlock:dataRenderedBlock:updateDataSourceBlock:", v15, v11, v20, v18);

}

- (void)updateTagSelectionIfNeeded
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));

  if (v3)
    -[ICNoteBrowseViewController setTagSelection:](self, "setTagSelection:", self->_tagSelection);
}

- (BOOL)hasDeletableNoteCell
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForFocusedItems"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "focusedNoteObjectID"));
    v5 = v7 != 0;

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  if (objc_msgSend(v8, "isEditing"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathsForSelectedItems"));
    v11 = objc_msgSend(v10, "count") != 0;

  }
  else
  {
    v11 = 0;
  }

  if (v5 || v11)
    return !-[ICNoteBrowseViewController needsToConfirmDeletion](self, "needsToConfirmDeletion");
  else
    return 0;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD v14[5];
  objc_super v15;

  v4 = a4;
  v5 = a3;
  if (-[ICNoteBrowseViewController isEditing](self, "isEditing") != a3
    && !-[ICNoteBrowseViewController shouldAvoidEditingChanges](self, "shouldAvoidEditingChanges"))
  {
    v15.receiver = self;
    v15.super_class = (Class)ICNoteBrowseViewController;
    -[ICBaseViewController setEditing:animated:](&v15, "setEditing:animated:", v5, v4);
    if (v5)
    {
      v7 = 3;
    }
    else if ((id)-[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode") == (id)1)
    {
      v7 = 3;
    }
    else
    {
      v7 = 0;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
    objc_msgSend(v8, "setAutoExpandMode:", v7);

    +[CATransaction begin](CATransaction, "begin");
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000DC854;
    v14[3] = &unk_100550110;
    v14[4] = self;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v14);
    +[CATransaction commit](CATransaction, "commit");
    if (v4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
      objc_msgSend(v9, "setEditing:", v5);

    }
    else
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000DC898;
      v12[3] = &unk_100550360;
      v12[4] = self;
      v13 = v5;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);
    }
    -[ICNoteBrowseViewController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagDetailCell](self, "tagDetailCell"));
    objc_msgSend(v10, "setNeedsUpdateConfiguration");

    if (v5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v11, "postNotificationName:object:", CFSTR("ICNoteBrowseViewControllerDidStartEditingNotification"), self);

    }
  }
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  unsigned __int8 v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeEditorController"));
  v4 = objc_msgSend(v3, "wantsToRemainFirstResponder");

  v5 = -[ICNoteBrowseViewController _appearState](self, "_appearState");
  LOBYTE(v6) = 0;
  if ((v4 & 1) == 0 && v5 == 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rootViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ic_topViewController"));
    LODWORD(v6) = objc_msgSend(v10, "ic_hasFullScreenModalPresentationStyle") ^ 1;

  }
  return (char)v6;
}

- (void)deleteNotes:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  ICDeleteDecisionController *v8;
  void *v9;
  void *v10;
  void *v11;
  ICDeleteDecisionController *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = [ICDeleteDecisionController alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController eventReporter](self, "eventReporter"));
  v12 = -[ICDeleteDecisionController initWithSourceObjects:window:sender:eventReporter:](v8, "initWithSourceObjects:window:sender:eventReporter:", v6, v10, v7, v11);

  objc_initWeak(&location, self);
  -[ICNoteBrowseViewController setNeedsToConfirmDeletion:](self, "setNeedsToConfirmDeletion:", 1);
  v13 = objc_msgSend(v6, "count");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController allNotes](self, "allNotes"));
  v15 = objc_msgSend(v14, "count");

  -[ICNoteBrowseViewController setShouldAvoidEditingChanges:](self, "setShouldAvoidEditingChanges:", v13 == v15);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000DCB3C;
  v16[3] = &unk_100554688;
  objc_copyWeak(&v17, &location);
  v18 = v13 == v15;
  v16[4] = self;
  -[ICDeleteDecisionController performDecisionWithCompletion:](v12, "performDecisionWithCompletion:", v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)moveNotes:(id)a3
{
  id v4;
  ICMoveDecisionController *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = -[ICMoveDecisionController initWithSourceObjects:presentingViewController:]([ICMoveDecisionController alloc], "initWithSourceObjects:presentingViewController:", v4, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DCD20;
  v6[3] = &unk_1005546B0;
  objc_copyWeak(&v7, &location);
  -[ICMoveDecisionController performDecisionWithCompletion:](v5, "performDecisionWithCompletion:", v6);
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

- (void)showSharedFolderActions:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = objc_opt_class(ICFolder);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
  v6 = ICCheckedDynamicCast(v4, v5);
  v10 = (id)objc_claimAutoreleasedReturnValue(v6);

  if (v10)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationUIController sharedInstance](ICCollaborationUIController, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController collaborationButtonsController](self, "collaborationButtonsController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "buttonItem"));
    objc_msgSend(v7, "showCloudSharingControllerForFolder:presentingViewController:popoverBarButtonItem:presented:dismissed:", v10, self, v9, 0, 0);

  }
}

- (void)performCmd3:(id)a3
{
  ICViewAttachmentsActivity *v4;
  void *v5;
  ICViewAttachmentsActivity *v6;

  v4 = [ICViewAttachmentsActivity alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController eventReporter](self, "eventReporter"));
  v6 = -[ICViewAttachmentsActivity initWithPresentingViewController:eventReporter:](v4, "initWithPresentingViewController:eventReporter:", self, v5);

  -[ICViewAttachmentsActivity performActivityWithCompletion:](v6, "performActivityWithCompletion:", 0);
}

- (void)performDeleteKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForSelectedItems"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController selectedNotes](self, "selectedNotes"));
LABEL_5:
    v12 = (void *)v7;
    -[ICNoteBrowseViewController deleteNotes:sender:](self, "deleteNotes:sender:", v7, v13);

    v11 = v13;
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathsForFocusedItems"));
  v10 = objc_msgSend(v9, "count");

  v11 = v13;
  if (v10)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController focusedNotes](self, "focusedNotes"));
    goto LABEL_5;
  }
LABEL_6:

}

- (void)dataSourceDataDidUpdate:(id)a3
{
  void *v4;
  ICNoteBrowseViewController *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteBrowseViewController;
  -[ICBaseViewController dataSourceDataDidUpdate:](&v6, "dataSourceDataDidUpdate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationController](self, "navigationController"));
  v5 = (ICNoteBrowseViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));

  if (v5 == self)
    -[ICNoteBrowseViewController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", 0);
}

- (void)dataSourceDataUpdateDidRender:(id)a3
{
  void *v4;
  ICNoteBrowseViewController *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICNoteBrowseViewController;
  -[ICNoteResultsViewController dataSourceDataUpdateDidRender:](&v6, "dataSourceDataUpdateDidRender:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationController](self, "navigationController"));
  v5 = (ICNoteBrowseViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));

  if (v5 == self)
  {
    -[ICNoteBrowseViewController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", 1);
    -[ICNoteBrowseViewController updateContainerSelection](self, "updateContainerSelection");
  }
}

- (unint64_t)tagsActionMenuNoteCount:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource", a3));
  v4 = objc_msgSend(v3, "totalNoteCount");

  return (unint64_t)v4;
}

- (void)addKVOObservers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController observedNoteContainerProperties](self, "observedNoteContainerProperties"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
        objc_msgSend(v9, "ic_addObserver:forKeyPath:context:", self, v8, &off_1005CE168);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController observedUserDefaultsProperties](self, "observedUserDefaultsProperties", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v16, "ic_addObserver:forKeyPath:context:", self, v15, &off_1005CE168);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

}

- (void)removeKVOObservers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController observedNoteContainerProperties](self, "observedNoteContainerProperties"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
        objc_msgSend(v9, "ic_removeObserver:forKeyPath:context:", self, v8, &off_1005CE168);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController observedUserDefaultsProperties](self, "observedUserDefaultsProperties", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v16, "ic_removeObserver:forKeyPath:context:", self, v15, &off_1005CE168);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  void *v30;
  _QWORD v31[5];
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((-[ICNoteBrowseViewController ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/UI/Note/Browse/View Controllers/ICNoteBrowseViewController.m") & 1) == 0)
  {
    v32.receiver = self;
    v32.super_class = (Class)ICNoteBrowseViewController;
    -[ICNoteResultsViewController observeValueForKeyPath:ofObject:change:context:](&v32, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);

    goto LABEL_17;
  }
  v13 = -[ICNoteBrowseViewController ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v12, v11, v10);

  if (a6 == &off_1005CE168 && (v13 & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cloudContextDelegate"));

    if (v15 == v11)
    {
      v27 = ICKeyPathFromSelector("syncMessage");
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = objc_msgSend(v10, "isEqualToString:", v28);

      if (v29)
      {
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_1000DD830;
        v31[3] = &unk_100550110;
        v31[4] = self;
        performBlockOnMainThread(v31);
      }
      goto LABEL_17;
    }
    v16 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));

    if (v16 != v11)
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));

      if (v17 == v11)
      {
        +[ICNoteListSortUtilities clearCache](ICNoteListSortUtilities, "clearCache");
        +[ICDateHeadersUtilities clearCache](ICDateHeadersUtilities, "clearCache");
        v18 = objc_msgSend(v10, "isEqualToString:", ICSettingsNoteListSortTypeKey);
        if ((v18 & 1) != 0
          || (objc_msgSend(v10, "isEqualToString:", ICFolderCustomNoteSortTypeQuerySortKey) & 1) != 0
          || (objc_msgSend(v10, "isEqualToString:", ICSettingsNoteDateHeadersTypeKey) & 1) != 0
          || objc_msgSend(v10, "isEqualToString:", ICSettingsQueryDateHeadersTypeKey))
        {
          -[ICNoteBrowseViewController updateDataSourceConfigurationSortTypeChanged:](self, "updateDataSourceConfigurationSortTypeChanged:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
          objc_msgSend(v19, "reloadDataAnimated:", 0);

        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "noteSortTypeUserDefaultsKey"));
          v23 = objc_msgSend(v10, "isEqualToString:", v22);

          if (v23)
            goto LABEL_28;
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dateHeadersTypeUserDefaultsKey"));
          v26 = objc_msgSend(v10, "isEqualToString:", v25);

          if (v26)
            goto LABEL_28;
        }
      }
      goto LABEL_17;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("title")))
    {
      -[ICNoteBrowseViewController updateNavigationTitle](self, "updateNavigationTitle");
LABEL_23:
      -[ICNoteBrowseViewController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", 0);
      goto LABEL_17;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("smartFolderQueryJSON")))
      goto LABEL_23;
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("focusedNoteObjectID")))
    {
      -[ICNoteBrowseViewController updateFocusedNoteIfNeeded](self, "updateFocusedNoteIfNeeded");
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("customNoteSortTypeValue"))
           || objc_msgSend(v10, "isEqualToString:", CFSTR("dateHeadersType")))
    {
LABEL_28:
      -[ICNoteBrowseViewController updateDataSourceConfigurationSortTypeChanged:](self, "updateDataSourceConfigurationSortTypeChanged:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
      objc_msgSend(v30, "reloadDataAnimated:", 0);

    }
  }
LABEL_17:

}

- (void)didUpdateSearchAppearanceNotification:(id)a3
{
  if ((id)-[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode", a3) == (id)1)
    -[ICNoteBrowseViewController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", 1);
}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v14.receiver = self;
  v14.super_class = (Class)ICNoteBrowseViewController;
  -[ICBaseViewController registerForTraitChanges](&v14, "registerForTraitChanges");
  objc_initWeak(&location, self);
  v17 = objc_opt_class(UITraitUserInterfaceLevel);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000DDABC;
  v11[3] = &unk_100550500;
  objc_copyWeak(&v12, &location);
  v4 = -[ICNoteBrowseViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v11);

  v16 = objc_opt_class(UITraitSplitViewControllerContext);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000DDB78;
  v9[3] = &unk_100550500;
  objc_copyWeak(&v10, &location);
  v6 = -[ICNoteBrowseViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v5, v9);

  v15 = objc_opt_class(UITraitHorizontalSizeClass);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v8 = -[ICNoteBrowseViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v7, "updateTagDetailOperatorMenuVisibility");

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)updateDataSourceAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5 updateDataSourceBlock:(id)a6
{
  _BOOL8 v8;
  id v10;
  void (**v11)(_QWORD);
  id v12;
  ICNoteBrowseViewControllerCollectionViewDelegate *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void **v24;
  uint64_t v25;
  id (*v26)(uint64_t);
  void *v27;
  ICNoteBrowseViewController *v28;
  id v29;

  v8 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a6;
  v12 = a5;
  if (-[ICNoteBrowseViewController ic_isViewVisible](self, "ic_isViewVisible"))
    -[ICNoteBrowseViewController endAnalyticsTracking](self, "endAnalyticsTracking");
  -[ICNoteBrowseViewController removeKVOObservers](self, "removeKVOObservers");
  if (v11)
    v11[2](v11);
  -[ICNoteBrowseViewController addKVOObservers](self, "addKVOObservers");
  v13 = -[ICNoteBrowseViewControllerCollectionViewDelegate initWithNoteBrowseViewController:]([ICNoteBrowseViewControllerCollectionViewDelegate alloc], "initWithNoteBrowseViewController:", self);
  -[ICNoteBrowseViewController setCollectionViewDelegate:](self, "setCollectionViewDelegate:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController collectionViewDelegate](self, "collectionViewDelegate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  objc_msgSend(v15, "setDelegate:", v14);

  if (-[ICNoteBrowseViewController ic_isViewVisible](self, "ic_isViewVisible"))
  {
    -[ICNoteBrowseViewController startAnalyticsTracking](self, "startAnalyticsTracking");
    -[ICNoteBrowseViewController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", 0);
  }
  -[ICNoteBrowseViewController updateDataSourceConfigurationSortTypeChanged:](self, "updateDataSourceConfigurationSortTypeChanged:", 0);
  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_1000DDDC8;
  v27 = &unk_1005546D8;
  v28 = self;
  v29 = v10;
  v16 = v10;
  -[ICNoteBrowseViewController reloadDataSourceAnimated:dataIndexedBlock:dataRenderedBlock:](self, "reloadDataSourceAnimated:dataIndexedBlock:dataRenderedBlock:", v8, &v24, v12);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer", v24, v25, v26, v27, v28));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "noteContainerAccount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteCollection](self, "noteCollection"));
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "searchDomainIdentifier"));

  }
  if (v21)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController noteSearchViewController](self, "noteSearchViewController"));
    objc_msgSend(v23, "setAccountIdentifier:", v21);

  }
}

- (void)updateDataSourceConfigurationSortTypeChanged:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController sortType](self, "sortType"));
  objc_msgSend(v5, "setSortType:force:", v6, v3);

  v7 = -[ICNoteBrowseViewController dateHeadersType](self, "dateHeadersType");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  objc_msgSend(v8, "setDateHeadersType:", v7);

  v9 = -[ICNoteBrowseViewController shouldIncludeSubfolders](self, "shouldIncludeSubfolders");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  objc_msgSend(v10, "setShouldIncludeSubfolders:", v9);

  v11 = -[ICNoteBrowseViewController shouldIncludeTags](self, "shouldIncludeTags");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  objc_msgSend(v12, "setShouldIncludeTags:", v11);

  v13 = -[ICNoteBrowseViewController shouldIncludeTagDetail](self, "shouldIncludeTagDetail");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  objc_msgSend(v14, "setShouldIncludeTagDetail:", v13);

  v15 = -[ICNoteBrowseViewController shouldIncludeInvitations](self, "shouldIncludeInvitations");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  objc_msgSend(v16, "setShouldIncludeInvitations:", v15);

  objc_copyWeak(&v19, &location);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource", _NSConcreteStackBlock, 3221225472, sub_1000DDFD4, &unk_10054FA60));
  objc_msgSend(v17, "setTagSelectionDidChangeHandler:", &v18);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)reloadDataSourceAnimated:(BOOL)a3 dataIndexedBlock:(id)a4 dataRenderedBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  if ((-[ICNoteBrowseViewController ic_isViewVisible](self, "ic_isViewVisible") & 1) == 0)
    -[ICNoteBrowseViewController updateNavigationTitle](self, "updateNavigationTitle");
  -[ICNoteBrowseViewController resetBarButtonItemsAnimated:](self, "resetBarButtonItemsAnimated:", 0);
  -[ICNoteBrowseViewController updateSelectedTagTitles](self, "updateSelectedTagTitles");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000DE144;
  v15[3] = &unk_100554700;
  v17 = v6;
  v15[4] = self;
  v16 = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000DE314;
  v13[3] = &unk_100550160;
  v13[4] = self;
  v14 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "reloadDataAnimated:dataIndexedBlock:dataRenderedBlock:", v6, v15, v13);

}

- (void)updateFocusedNoteIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
  if (v3)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));

    if (!v4)
      return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "focusedNoteObjectID"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionViewDiffableDataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "focusedNoteObjectID"));
    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathForItemIdentifier:", v10));

    v11 = v22;
    if (!v22)
    {
LABEL_11:

      return;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
    objc_msgSend(v12, "ic_selectCellAtIndexPath:animated:", v22, 0);

    v13 = objc_opt_class(ICBaseNoteResultsCollectionViewCell);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForItemAtIndexPath:", v22));
    v16 = ICDynamicCast(v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    objc_msgSend(v17, "setSelected:", 1);
    goto LABEL_7;
  }
  v22 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "selectedNoteObjectID"));
  if (v18)
  {

    goto LABEL_10;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "selectedInvitationObjectID"));
  if (v19)
  {

LABEL_7:
LABEL_10:
    v11 = v22;
    goto LABEL_11;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  v21 = objc_msgSend(v20, "isEditing");

  if ((v21 & 1) == 0)
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
    objc_msgSend(v22, "ic_deselectAllItems");
    goto LABEL_10;
  }
}

- (BOOL)updateTagSectionVisibility
{
  unsigned __int8 v3;
  void *v4;
  char v5;
  _BOOL8 v6;
  void *v7;
  _BOOL8 v8;
  void *v9;

  v3 = -[ICNoteBrowseViewController shouldIncludeTags](self, "shouldIncludeTags");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  v5 = v3 ^ objc_msgSend(v4, "shouldIncludeTags");

  v6 = -[ICNoteBrowseViewController shouldIncludeTags](self, "shouldIncludeTags");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  objc_msgSend(v7, "setShouldIncludeTags:", v6);

  v8 = -[ICNoteBrowseViewController shouldIncludeTagDetail](self, "shouldIncludeTagDetail");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  objc_msgSend(v9, "setShouldIncludeTagDetail:", v8);

  return v5;
}

- (BOOL)shouldIncludeTags
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteQuery](self, "noteQuery"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v5 = objc_msgSend(v4, "hasCompactWidth");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldIncludeInvitations
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "type"));
  v4 = objc_msgSend(v3, "isEqualToString:", ICVirtualSmartFolderItemIdentifierTypeSharedWithYou);

  return v4;
}

- (BOOL)shouldIncludeTagDetail
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteQuery](self, "noteQuery"));
  v3 = v2 != 0;

  return v3;
}

- (ICFolderCustomNoteSortType)sortType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1000DE878;
  v17 = sub_1000DE888;
  v18 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000DE890;
  v12[3] = &unk_100550660;
  v12[4] = self;
  v12[5] = &v13;
  objc_msgSend(v4, "performBlockAndWait:", v12);

  v5 = +[ICNoteListSortUtilities folderSortOrderForNoteListSortType:](ICNoteListSortUtilities, "folderSortOrderForNoteListSortType:", +[ICNoteListSortUtilities currentNoteListSortType](ICNoteListSortUtilities, "currentNoteListSortType"));
  v6 = (void *)v14[5];
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v8 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteQuery](self, "noteQuery"));
    if (!v9
      || (v7 = (id)objc_claimAutoreleasedReturnValue(+[ICFolderCustomNoteSortType querySortType](ICFolderCustomNoteSortType, "querySortType"))) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "noteSortType"));
      if (!v7)
        v7 = (id)objc_claimAutoreleasedReturnValue(+[ICFolderCustomNoteSortType folderNoteSortTypeWithOrder:direction:](ICFolderCustomNoteSortType, "folderNoteSortTypeWithOrder:direction:", v8, 0));

    }
  }
  _Block_object_dispose(&v13, 8);

  return (ICFolderCustomNoteSortType *)v7;
}

- (int)dateHeadersType
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));

  if (v3)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000DEA78;
    v12[3] = &unk_100550660;
    v12[4] = self;
    v12[5] = &v13;
    objc_msgSend(v5, "performBlockAndWait:", v12);

    v6 = *((_DWORD *)v14 + 6);
    _Block_object_dispose(&v13, 8);
    return v6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteQuery](self, "noteQuery"));

  if (v8)
    return +[ICDateHeadersUtilities queryDateHeadersType](ICDateHeadersUtilities, "queryDateHeadersType");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));
    if (objc_msgSend(v10, "supportsDateHeaders"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));
      v6 = objc_msgSend(v11, "dateHeadersType");

    }
    else
    {
      v6 = 1;
    }

    return v6;
  }
  return +[ICDateHeadersUtilities defaultDateHeadersType](ICDateHeadersUtilities, "defaultDateHeadersType");
}

- (void)sharedWithYouControllerDidUpdateHighlights:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DEB48;
  block[3] = &unk_100550110;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (ICCollaborationButtonsController)collaborationButtonsController
{
  ICCollaborationButtonsController *collaborationButtonsController;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  ICCollaborationButtonsController *v9;
  void *v10;
  ICCollaborationButtonsController *v11;
  ICCollaborationButtonsController *v12;
  ICCollaborationButtonsController *v13;
  _QWORD v14[4];
  id v15;
  id location;

  collaborationButtonsController = self->_collaborationButtonsController;
  if (collaborationButtonsController)
    return collaborationButtonsController;
  v5 = objc_opt_class(ICCloudSyncingObject);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
  v7 = ICDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = [ICCollaborationButtonsController alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v11 = -[ICCollaborationButtonsController initWithCloudObject:coordinator:](v9, "initWithCloudObject:coordinator:", v8, v10);
    v12 = self->_collaborationButtonsController;
    self->_collaborationButtonsController = v11;

    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000DECF0;
    v14[3] = &unk_10054FF58;
    objc_copyWeak(&v15, &location);
    -[ICCollaborationButtonsController setDidPressManageShareButton:](self->_collaborationButtonsController, "setDidPressManageShareButton:", v14);
    v13 = self->_collaborationButtonsController;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSArray)allNotes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewDiffableDataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "snapshot"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifiers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000DEDD4;
  v9[3] = &unk_100554728;
  v9[4] = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ic_compactMap:", v9));

  return (NSArray *)v7;
}

- (unint64_t)numberOfSelectedItems
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "indexPathsForSelectedItems"));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (NSArray)selectedNotes
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForSelectedItems"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController notesForIndexPaths:](self, "notesForIndexPaths:", v4));
  return (NSArray *)v5;
}

- (id)focusedNotes
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForFocusedItems"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController notesForIndexPaths:](self, "notesForIndexPaths:", v4));
  return v5;
}

- (ICFolderCreationController)smartFolderCreationController
{
  void *v3;
  ICFolderCreationController *v4;
  ICFolderCreationController *v5;
  ICFolderCreationController *smartFolderCreationController;

  if (self->_smartFolderCreationController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteQuery](self, "noteQuery"));
    -[ICFolderCreationController setSmartFolderQuery:](self->_smartFolderCreationController, "setSmartFolderQuery:", v3);
  }
  else
  {
    v4 = [ICFolderCreationController alloc];
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteQuery](self, "noteQuery"));
    v5 = -[ICFolderCreationController initWithViewController:noteContainer:smartFolderQuery:folderTitle:creationApproach:](v4, "initWithViewController:noteContainer:smartFolderQuery:folderTitle:creationApproach:", self, 0, v3, 0, 2);
    smartFolderCreationController = self->_smartFolderCreationController;
    self->_smartFolderCreationController = v5;

  }
  return self->_smartFolderCreationController;
}

- (BOOL)isAllTagsSelected
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));
  v3 = objc_msgSend(v2, "mode") == (id)1;

  return v3;
}

- (void)resetBarButtonItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v5, "reset");

  -[ICNoteBrowseViewController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", v3);
}

- (void)updateBarButtonItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  int64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  int64_t v58;
  int v59;
  uint64_t v60;
  void *v61;
  id v62;

  v3 = a3;
  -[ICNoteBrowseViewController updateSummaryView](self, "updateSummaryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState"));
  v6 = objc_msgSend(v5, "isAuthenticated");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v7, "setAuthenticated:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v9 = objc_msgSend(v8, "canAddNewNoteToSelectedContainers");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v10, "setCanAddNote:", v9);

  v11 = -[ICNoteBrowseViewController shouldShowTagAssignmentBarButtonItem](self, "shouldShowTagAssignmentBarButtonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v12, "setCanAssignTags:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
  v14 = objc_msgSend(v13, "canBeSharedViaICloud");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v15, "setCanBeShared:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v17 = objc_msgSend(v16, "hasCompactWidth");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v18, "setCompactWidth:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v20 = objc_msgSend(v19, "hasCompactHeight");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v21, "setCompactHeight:", v20);

  v22 = -[ICNoteBrowseViewController isEditing](self, "isEditing");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v23, "setEditing:", v22);

  v24 = -[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v25, "setNoteContainerViewMode:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController allNotes](self, "allNotes"));
  v27 = objc_msgSend(v26, "count");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v28, "setNoteCount:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController selectedNotes](self, "selectedNotes"));
  v30 = objc_msgSend(v29, "count");
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v31, "setSelectedNoteCount:", v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
  v33 = objc_msgSend(v32, "isSharedViaICloud");
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v34, "setShared:", v33);

  v35 = -[ICNoteBrowseViewController shouldShowEmptyState](self, "shouldShowEmptyState");
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v36, "setShowingEmptyState:", v35);

  if (ICDebugModeEnabled(v37, v38)
    && -[ICNoteBrowseViewController ic_behavior](self, "ic_behavior") == (id)1)
  {
    v39 = -[ICNoteBrowseViewController isTrashFolder](self, "isTrashFolder") ^ 1;
  }
  else
  {
    v39 = 0;
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v40, "setShowsDebugItem:", v39);

  v41 = -[ICNoteBrowseViewController isTrashFolder](self, "isTrashFolder");
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v42, "setTrashFolder:", v41);

  v43 = +[UIDevice ic_isVision](UIDevice, "ic_isVision");
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v44, "setUsesPlainBarButtonItems:", v43);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
  if (v45)
  {
    v46 = 1;
  }
  else
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteCollection](self, "noteCollection"));

    if (v47)
    {
      v46 = 2;
    }
    else
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteQuery](self, "noteQuery"));

      if (v48)
      {
        v46 = 3;
      }
      else
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));
        v50 = v49 != 0;

        v46 = 4 * v50;
      }
    }
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v51, "setCollectionType:", v46);

  if (-[ICNoteBrowseViewController numberOfSelectedItems](self, "numberOfSelectedItems"))
    v52 = objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController selectedNotes](self, "selectedNotes"));
  else
    v52 = objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController allNotes](self, "allNotes"));
  v62 = (id)v52;
  if (-[ICNoteBrowseViewController isEditing](self, "isEditing") && objc_msgSend(v62, "count"))
    v53 = objc_msgSend(v62, "ic_allSatisfy:", &stru_100554768);
  else
    v53 = 0;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v54, "setCanMoveNotes:", v53);

  if (-[ICNoteBrowseViewController isEditing](self, "isEditing") && objc_msgSend(v62, "count"))
    v55 = objc_msgSend(v62, "ic_allSatisfy:", &stru_100554788);
  else
    v55 = 0;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v56, "setCanDeleteNotes:", v55);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItemConfiguration](self, "navigationItemConfiguration"));
  objc_msgSend(v57, "updateAnimated:", v3);

  v58 = -[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode");
  if (v58 == 1)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationController](self, "navigationController"));
    if (objc_msgSend(v57, "isToolbarHidden")
      && !-[ICNoteBrowseViewController shouldShowEmptyState](self, "shouldShowEmptyState"))
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
      v60 = objc_msgSend(v56, "hasCompactWidth") ^ 1;
      v59 = 1;
    }
    else
    {
      v59 = 0;
      v60 = 0;
    }
  }
  else
  {
    v59 = 0;
    v60 = 0;
  }
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
  objc_msgSend(v61, "setShouldShowSummaryFooter:", v60);

  if (v59)
  if (v58 == 1)

}

- (void)updateNavigationTitle
{
  -[ICNoteBrowseViewController updateBarButtonItemsAnimated:](self, "updateBarButtonItemsAnimated:", 0);
}

- (void)updateVisibleGalleryCellThumbnails
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = objc_msgSend(v3, "applicationState");

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleCells"));

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11);
          v13 = objc_opt_class(ICNoteResultsGalleryCollectionViewCell);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0
            || (v14 = objc_opt_class(ICNoteBrowseGalleryFolderCollectionViewCell),
                (objc_opt_isKindOfClass(v12, v14) & 1) != 0))
          {
            objc_msgSend(v12, "updateThumbnail", (_QWORD)v15);
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

- (void)updateContainerSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagContainerCell](self, "tagContainerCell"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));
    objc_msgSend(v4, "selectTagsWithTagSelection:animated:", v5, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagDetailCell](self, "tagDetailCell"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));
    objc_msgSend(v6, "updateForTagSelection:animated:", v7, 0);

  }
  -[ICNoteBrowseViewController updateFocusedNoteIfNeeded](self, "updateFocusedNoteIfNeeded");
}

- (ICTagContainerCell)tagContainerCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController dataSource](self, "dataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionViewDiffableDataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICTagContainerItemIdentifier sharedItemIdentifier](ICTagContainerItemIdentifier, "sharedItemIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItemIdentifier:", v6));

    if (v7)
    {
      v8 = objc_opt_class(ICTagContainerCell);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cellForItemAtIndexPath:", v7));
      v11 = ICDynamicCast(v8, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  return (ICTagContainerCell *)v12;
}

- (id)tagDetailCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController dataSource](self, "dataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionViewDiffableDataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICTagDetailItemIdentifier sharedItemIdentifier](ICTagDetailItemIdentifier, "sharedItemIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItemIdentifier:", v6));

    if (v7)
    {
      v8 = objc_opt_class(ICTagDetailCell);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cellForItemAtIndexPath:", v7));
      v11 = ICDynamicCast(v8, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)updateSelectedTagTitles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "smartFolderTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController smartFolderCreationController](self, "smartFolderCreationController"));
  objc_msgSend(v5, "setFolderTitle:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));
  if (v6)
  {
    v7 = objc_alloc((Class)ICFilterSelection);
    v10 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));
    v8 = objc_msgSend(v7, "initWithFilterTypeSelection:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController smartFolderCreationController](self, "smartFolderCreationController"));
    objc_msgSend(v9, "setFilterSelection:", v8);

  }
}

- (id)notesForIndexPaths:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DFC94;
  v8[3] = &unk_1005547B0;
  v8[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ic_compactMap:", v8));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DFD30;
  v7[3] = &unk_1005547D8;
  v7[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_compactMap:", v7));

  return v5;
}

- (BOOL)isTrashFolder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  v3 = objc_msgSend(v2, "isTrashFolder");

  return v3;
}

- (double)availableWidthForSummaryView
{
  void *v3;
  unsigned int v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v4 = objc_msgSend(v3, "hasCompactWidth");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6;

  v8 = -32.0;
  if (v4)
    v8 = -100.0;
  return v7 + v8;
}

- (void)updateSummaryView
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  ICToolbarSummaryView *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  int64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  id v47;

  if ((-[ICNoteBrowseViewController ic_isViewVisible](self, "ic_isViewVisible") & 1) != 0
    || -[ICNoteBrowseViewController _appearState](self, "_appearState") == 1)
  {
    if ((id)-[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode") == (id)1
      || -[ICNoteBrowseViewController shouldShowEmptyState](self, "shouldShowEmptyState"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
      v4 = objc_msgSend(v3, "hasCompactHeight") ^ 1;

    }
    else
    {
      v4 = 0;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v6 = objc_msgSend(v5, "hasCompactWidth");

    if (-[ICBaseViewController isShowingActiveSearch](self, "isShowingActiveSearch") || (v4 & ~v6) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "visibleSupplementaryViewsOfKind:", UICollectionElementKindSectionFooter));
      v8 = (ICToolbarSummaryView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

      v11 = objc_opt_class(ICToolbarSummaryView);
      v12 = ICCheckedDynamicCast(v11, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      -[ICNoteBrowseViewController setSummaryView:](self, "setSummaryView:", v13);

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));

      if (v7)
        goto LABEL_13;
      v8 = -[ICToolbarSummaryView initWithFrame:]([ICToolbarSummaryView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      -[ICNoteBrowseViewController setSummaryView:](self, "setSummaryView:", v8);
    }

LABEL_13:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "noteContainerAccount"));
    v16 = objc_msgSend(v15, "accountType");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));
    objc_msgSend(v17, "setHidden:", 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
    v19 = objc_msgSend(v18, "totalNoteCount");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));
    objc_msgSend(v20, "setTotalNoteCount:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
    v22 = objc_msgSend(v21, "totalFolderCount");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));
    objc_msgSend(v23, "setTotalFolderCount:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
    v25 = objc_msgSend(v24, "totalInvitationsCount");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));
    objc_msgSend(v26, "setTotalInvitationsCount:", v25);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState"));
    v28 = objc_msgSend(v27, "isAuthenticated") ^ 1;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));
    objc_msgSend(v29, "setLockNowHidden:", v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));
    objc_msgSend(v30, "setSyncActivityVisible:", v16 == 1);

    -[ICNoteBrowseViewController availableWidthForSummaryView](self, "availableWidthForSummaryView");
    v32 = v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));
    objc_msgSend(v33, "setAvailableWidth:", v32);

    if (v16 == 1)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "cloudContextDelegate"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "syncMessage"));
    }
    else
    {
      v34 = 0;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));
    objc_msgSend(v35, "setSyncMessage:", v34);

    if (v16 == 1)
    {

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));
    objc_msgSend(v36, "setDelegate:", self);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));
    objc_msgSend(v37, "update");

    v38 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController summaryView](self, "summaryView"));
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "syncMessage"));
    if (v39)
    {
      v40 = (void *)v39;
      v41 = -[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode");

      if (v41 != 1)
        goto LABEL_22;
      v38 = objc_alloc_init((Class)UICollectionViewLayoutInvalidationContext);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "indexPathsForVisibleSupplementaryElementsOfKind:", UICollectionElementKindSectionFooter));

      objc_msgSend(v38, "invalidateSupplementaryElementsOfKind:atIndexPaths:", UICollectionElementKindSectionFooter, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "collectionViewLayout"));
      objc_msgSend(v45, "invalidateLayoutWithContext:", v38);

    }
LABEL_22:
    -[ICNoteBrowseViewController setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration");
    if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    {
      v46 = ICNoteEditorPillOrnamentViewControllerInsets;
      v47 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationController](self, "navigationController"));
      objc_msgSend(v47, "setAdditionalSafeAreaInsets:", 0.0, 0.0, v46, 0.0);

    }
  }
}

- (BOOL)shouldShowTagAssignmentBarButtonItem
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController selectedNotes](self, "selectedNotes"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController selectedNotes](self, "selectedNotes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_objectsPassingTest:", &stru_1005547F8));
  v7 = objc_msgSend(v6, "count");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController selectedNotes](self, "selectedNotes"));
  v9 = objc_msgSend(v8, "count");

  if (v9 > v7)
    return 0;
  if (-[ICNoteBrowseViewController isTrashFolder](self, "isTrashFolder"))
    return 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController modernViewContext](self, "modernViewContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICHashtag allVisibleHashtagsInContext:](ICHashtag, "allVisibleHashtagsInContext:", v12));
  v10 = objc_msgSend(v13, "count") != 0;

  return v10;
}

- (void)noteDecryptedStatusDidChange:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICNoteBrowseViewController;
  -[ICNoteResultsViewController noteDecryptedStatusDidChange:](&v7, "noteDecryptedStatusDidChange:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState"));
  v5 = objc_msgSend(v4, "isBlockingDeauthentication");

  if ((v5 & 1) == 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E0528;
    v6[3] = &unk_100550110;
    v6[4] = self;
    performBlockOnMainThread(v6);
  }
}

- (void)summaryViewLockNowPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager", a3));
  objc_msgSend(v4, "lockNotesNow");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "noteContainerAccount"));

  if (v9)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICLockedNotesModeMigrator sharedMigrator](ICLockedNotesModeMigrator, "sharedMigrator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    objc_msgSend(v6, "showMigrationPromptAndMigrateIfNeededForAccount:window:", v9, v8);

  }
}

- (BOOL)shouldShowEmptyState
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
  if (objc_msgSend(v3, "totalNoteCount"))
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
    if (objc_msgSend(v5, "totalFolderCount"))
    {
      v4 = 0;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
      if (objc_msgSend(v6, "totalInvitationsCount"))
      {
        v4 = 0;
      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewController collectionView](self, "collectionView"));
        if (objc_msgSend(v7, "numberOfSections"))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteQuery](self, "noteQuery"));
          if (v8)
            v4 = 1;
          else
            v4 = -[ICNoteBrowseViewController ic_behavior](self, "ic_behavior") == (id)1;

        }
        else
        {
          v4 = 1;
        }

      }
    }

  }
  return v4;
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[ICNoteBrowseViewController shouldShowEmptyState](self, "shouldShowEmptyState", a3)
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationController](self, "navigationController")),
        v5 = objc_msgSend(v4, "isToolbarHidden"),
        v4,
        v5))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration emptyExtraProminentConfiguration](UIContentUnavailableConfiguration, "emptyExtraProminentConfiguration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("note.text")));
    objc_msgSend(v9, "setImage:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("No Notes"), &stru_1005704B8, 0));
    objc_msgSend(v9, "setText:", v8);

    -[ICNoteBrowseViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v9);
  }
  else
  {
    -[ICNoteBrowseViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", 0);
  }
}

- (void)managedObjectContextDidSaveObjectIDs:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v4 = a3;
  v5 = objc_opt_class(ICFolder);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
  v7 = ICDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v8, "isSmartFolder");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", NSUpdatedObjectIDsKey));
    objc_msgSend(v10, "ic_addObjectsFromNonNilArray:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSRefreshedObjectIDsKey));
    objc_msgSend(v10, "ic_addObjectsFromNonNilArray:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectID"));
    v17 = objc_msgSend(v10, "containsObject:", v16);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
      objc_msgSend(v19, "setNoteContainer:", v18);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteDataSource](self, "noteDataSource"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000E09B4;
      v21[3] = &unk_1005508B8;
      v21[4] = self;
      objc_msgSend(v20, "reloadDataAnimated:dataIndexedBlock:dataRenderedBlock:", 1, v21, 0);

    }
  }

}

- (void)accessibilityStatusDidChange
{
  uint64_t v3;
  id v4;

  v3 = ICAccessibilityNeedsAccessibilityElements(self, a2) ^ 1;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setHidesSearchBarWhenScrolling:", v3);

}

- (void)startAnalyticsTracking
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;

  if (!-[ICNoteBrowseViewController analyticsTrackingActive](self, "analyticsTrackingActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController eventReporter](self, "eventReporter"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
      objc_msgSend(v4, "startFolderViewEventDurationTrackingForNoteContainer:isInGridMode:", v5, (id)-[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode") == (id)1);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteCollection](self, "noteCollection"));

      if (v6)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController eventReporter](self, "eventReporter"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteCollection](self, "noteCollection"));
        objc_msgSend(v4, "startFolderViewEventDurationTrackingForNoteCollection:isInGridMode:", v5, (id)-[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode") == (id)1);
      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));

        if (!v7)
        {
LABEL_9:
          -[ICNoteBrowseViewController setAnalyticsTrackingActive:](self, "setAnalyticsTrackingActive:", 1);
          return;
        }
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController eventReporter](self, "eventReporter"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));
        v8 = (id)-[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode") == (id)1;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
        objc_msgSend(v4, "startFolderViewEventDurationTrackingForVirtualFolder:isInGridMode:context:", v5, v8, v10);

      }
    }

    goto LABEL_9;
  }
}

- (void)endAnalyticsTracking
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;

  if (-[ICNoteBrowseViewController analyticsTrackingActive](self, "analyticsTrackingActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController eventReporter](self, "eventReporter"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
      objc_msgSend(v4, "submitFolderViewEventForNoteContainer:isInGridMode:", v5, (id)-[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode") == (id)1);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteCollection](self, "noteCollection"));

      if (v6)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController eventReporter](self, "eventReporter"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteCollection](self, "noteCollection"));
        objc_msgSend(v4, "submitFolderViewEventForNoteCollection:isInGridMode:", v5, (id)-[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode") == (id)1);
      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));

        if (!v7)
        {
LABEL_10:
          -[ICNoteBrowseViewController setAnalyticsTrackingActive:](self, "setAnalyticsTrackingActive:", 0);
          return;
        }
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController eventReporter](self, "eventReporter"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));
        v8 = (id)-[ICBaseViewController noteContainerViewMode](self, "noteContainerViewMode") == (id)1;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
        objc_msgSend(v4, "submitFolderViewEventForVirtualFolder:isInGridMode:context:", v5, v8, v10);

      }
    }

    goto LABEL_10;
  }
}

- (void)submitTagSelectionAnalyticsIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  _BOOL8 v7;
  void *v8;
  id v9;
  id v10;

  v3 = objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));
    v6 = objc_msgSend(v5, "isEmpty");

    if ((v6 & 1) == 0)
    {
      v7 = -[ICNoteBrowseViewController isAllTagsSelected](self, "isAllTagsSelected");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));
      v9 = objc_msgSend(v8, "selectedTagCount");

      v10 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController eventReporter](self, "eventReporter"));
      objc_msgSend(v10, "submitTagBrowserSelectionEventWithSelectedTagCount:isAllTagsSelected:", v9, v7);

    }
  }
}

- (void)updateTagDetailOperatorMenuVisibility
{
  id v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v5, "ic_hasCompactWidth");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagDetailCell](self, "tagDetailCell"));
  objc_msgSend(v4, "setShowOperatorMenuButton:", v3);

}

- (id)noteBrowseNavigationItemConfigurationNavigationTitle:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;

  if (!-[ICBaseViewController isShowingActiveSearch](self, "isShowingActiveSearch", a3))
  {
    if (-[ICNoteBrowseViewController isEditing](self, "isEditing")
      && -[ICNoteBrowseViewController numberOfSelectedItems](self, "numberOfSelectedItems"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%lu (notes) Selected"), &stru_1005704B8, 0));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, -[ICNoteBrowseViewController numberOfSelectedItems](self, "numberOfSelectedItems")));

      return v5;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleForNavigationBar"));
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteCollection](self, "noteCollection"));

      if (v11)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteCollection](self, "noteCollection"));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleForTableViewCell"));
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));

        if (!v12)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));

          if (!v9)
          {
            v5 = 0;
            return v5;
          }
          v14 = -[ICNoteBrowseViewController ic_behavior](self, "ic_behavior");
          if (v14 == (id)1
            && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder")),
                v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "type")),
                v3 == (void *)ICVirtualSmartFolderItemIdentifierTypeMathNotes))
          {
            v5 = 0;
          }
          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));
            v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));

            if (v14 != (id)1)
              return v5;
          }

          goto LABEL_13;
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
      }
    }
    v5 = (void *)v10;
LABEL_13:

    return v5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController searchNavigationTitle](self, "searchNavigationTitle"));
  return v5;
}

- (id)noteBrowseNavigationItemConfigurationNoteContainerActionMenu:(id)a3 actionBarButtonItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(ICNoteContainer);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
  v10 = ICDynamicCast(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    objc_initWeak(&v20, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000E1380;
    v15[3] = &unk_100554860;
    objc_copyWeak(&v17, &location);
    v16 = v7;
    objc_copyWeak(&v18, &from);
    objc_copyWeak(&v19, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContainerActionMenu menuWithNoteContainer:presentingViewController:presentingBarButtonItem:viewControllerManager:completion:](ICNoteBrowseActionMenu, "menuWithNoteContainer:presentingViewController:presentingBarButtonItem:viewControllerManager:completion:", v11, self, v16, v12, v15));
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)noteBrowseNavigationItemConfigurationQueryActionMenu:(id)a3 actionBarButtonItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteQuery](self, "noteQuery"));
  if (v8
    && (v9 = (void *)v8,
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection")),
        v10,
        v9,
        v10))
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    objc_initWeak(&v20, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController tagSelection](self, "tagSelection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000E163C;
    v15[3] = &unk_100554860;
    objc_copyWeak(&v17, &location);
    v16 = v7;
    objc_copyWeak(&v18, &from);
    objc_copyWeak(&v19, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICTagsActionMenu menuWithTagSelection:presentingViewController:presentingBarButtonItem:viewControllerManager:delegate:completion:](ICTagsActionMenu, "menuWithTagSelection:presentingViewController:presentingBarButtonItem:viewControllerManager:delegate:completion:", v11, self, v16, v12, self, v15));
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)noteBrowseNavigationItemConfigurationVirtualSmartFolderActionMenu:(id)a3 actionBarButtonItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));

  if (v8)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    objc_initWeak(&v18, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController virtualSmartFolder](self, "virtualSmartFolder"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000E18DC;
    v13[3] = &unk_100554860;
    objc_copyWeak(&v15, &location);
    v14 = v7;
    objc_copyWeak(&v16, &from);
    objc_copyWeak(&v17, &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContainerActionMenu menuWithVirtualSmartFolder:presentingViewController:presentingBarButtonItem:viewControllerManager:completion:](ICNoteBrowseActionMenu, "menuWithVirtualSmartFolder:presentingViewController:presentingBarButtonItem:viewControllerManager:completion:", v9, self, v14, v10, v13));
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)noteBrowseNavigationItemConfigurationCollaborationBarButtonItem:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController collaborationButtonsController](self, "collaborationButtonsController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "buttonItem"));

  return v4;
}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldAddNoteFromBarButtonItem:(id)a4 event:(id)a5
{
  void *v6;
  id v7;
  id v8;

  v8 = a5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager"));
  v7 = objc_msgSend(v6, "showNewNoteWithApproach:sender:animated:", 14, v8, 1);

}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldAssignTagsFromBarButtonItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ICTagAssignmentViewController *v10;
  void *v11;
  ICTagAssignmentViewController *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController selectedNotes](self, "selectedNotes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_compactMap:", &stru_1005548A0));

  objc_initWeak(&location, self);
  v10 = [ICTagAssignmentViewController alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseViewController modernViewContext](self, "modernViewContext"));
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1000E1BE8;
  v17 = &unk_10054FF58;
  objc_copyWeak(&v18, &location);
  v12 = -[ICTagAssignmentViewController initWithSelectedNotes:managedObjectContext:completion:](v10, "initWithSelectedNotes:managedObjectContext:completion:", v9, v11, &v14);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICTagAssignmentViewController ic_embedInNavigationControllerForModalPresentation](v12, "ic_embedInNavigationControllerForModalPresentation", v14, v15, v16, v17));
  -[ICNoteBrowseViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldDeleteAllFromBarButtonItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[ICNoteBrowseViewController isTrashFolder](self, "isTrashFolder"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController allNotes](self, "allNotes"));
    -[ICNoteBrowseViewController deleteNotes:sender:](self, "deleteNotes:sender:", v8, v7);

  }
  else
  {
    objc_initWeak(&location, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController allNotes](self, "allNotes"));
    v10 = objc_msgSend(v9, "count");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController view](self, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000E1D9C;
    v13[3] = &unk_1005548C8;
    objc_copyWeak(&v15, &location);
    v14 = v7;
    +[ICDeleteAlert showAlertForDeletingObjectsWithType:count:window:sender:completion:](ICDeleteAlert, "showAlertForDeletingObjectsWithType:count:window:sender:completion:", 16, v10, v12, v14, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldDeleteSelectedFromBarButtonItem:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController selectedNotes](self, "selectedNotes"));
  -[ICNoteBrowseViewController deleteNotes:sender:](self, "deleteNotes:sender:", v6, v5);

}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldLockFromBarButtonItem:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseViewController viewControllerManager](self, "viewControllerManager", a3, a4));
  objc_msgSend(v4, "lockNotesNow");

}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldMoveAllFromBarButtonItem:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController allNotes](self, "allNotes", a3, a4));
  -[ICNoteBrowseViewController moveNotes:](self, "moveNotes:", v5);

}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldMoveSelectedFromBarButtonItem:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController selectedNotes](self, "selectedNotes", a3, a4));
  -[ICNoteBrowseViewController moveNotes:](self, "moveNotes:", v5);

}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldShareFromBarButtonItem:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = objc_opt_class(ICFolder);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewController noteContainer](self, "noteContainer"));
  v7 = ICDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICCollaborationUIController sharedInstance](ICCollaborationUIController, "sharedInstance"));
    objc_msgSend(v9, "presentFolderActivityViewControllerWithFolder:presentingViewController:sourceItem:sourceView:sourceRect:completion:", v8, self, v10, 0, 0, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);

  }
}

- (void)noteBrowseNavigationItemConfiguration:(id)a3 shouldShowDebugViewControllerFromBarButtonItem:(id)a4
{
  +[ICDebuggingViewController presentDebugView:](ICDebuggingViewController, "presentDebugView:", self, a4);
}

- (ICTagSelection)tagSelection
{
  return self->_tagSelection;
}

- (void)setNoteDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_noteDataSource, a3);
}

- (ICToolbarSummaryView)summaryView
{
  return self->_summaryView;
}

- (void)setSummaryView:(id)a3
{
  objc_storeStrong((id *)&self->_summaryView, a3);
}

- (ICNoteBrowseNavigationItemConfiguration)navigationItemConfiguration
{
  return self->_navigationItemConfiguration;
}

- (void)setNavigationItemConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_navigationItemConfiguration, a3);
}

- (void)setSmartFolderCreationController:(id)a3
{
  objc_storeStrong((id *)&self->_smartFolderCreationController, a3);
}

- (BOOL)needsToConfirmDeletion
{
  return self->_needsToConfirmDeletion;
}

- (void)setNeedsToConfirmDeletion:(BOOL)a3
{
  self->_needsToConfirmDeletion = a3;
}

- (BOOL)shouldAvoidEditingChanges
{
  return self->_shouldAvoidEditingChanges;
}

- (void)setShouldAvoidEditingChanges:(BOOL)a3
{
  self->_shouldAvoidEditingChanges = a3;
}

- (BOOL)analyticsTrackingActive
{
  return self->_analyticsTrackingActive;
}

- (void)setAnalyticsTrackingActive:(BOOL)a3
{
  self->_analyticsTrackingActive = a3;
}

- (ICNoteBrowseViewControllerCollectionViewDelegate)collectionViewDelegate
{
  return self->_collectionViewDelegate;
}

- (void)setCollectionViewDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewDelegate, a3);
}

- (void)setCollaborationButtonsController:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationButtonsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationButtonsController, 0);
  objc_storeStrong((id *)&self->_collectionViewDelegate, 0);
  objc_storeStrong((id *)&self->_smartFolderCreationController, 0);
  objc_storeStrong((id *)&self->_navigationItemConfiguration, 0);
  objc_storeStrong((id *)&self->_summaryView, 0);
  objc_storeStrong((id *)&self->_noteDataSource, 0);
  objc_storeStrong((id *)&self->_tagSelection, 0);
}

@end
