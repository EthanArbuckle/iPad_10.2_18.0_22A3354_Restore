@implementation RCRecordingsCollectionViewController

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  if (-[RCRecordingsCollectionViewController _expectedNumberOfItems](self, "_expectedNumberOfItems", a3)
    || -[RCRecordingsCollectionViewController captureIsUnderway](self, "captureIsUnderway"))
  {
    goto LABEL_3;
  }
  v6 = -[RCRecordingsCollectionViewController isSearching](self, "isSearching");
  if (!-[RCRecordingsCollectionViewController isSearching](self, "isSearching"))
  {
    if ((v6 & 1) != 0)
      goto LABEL_3;
LABEL_10:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v17 = (id)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration emptyConfiguration](UIContentUnavailableConfiguration, "emptyConfiguration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordingsContentUnavailableImage"));
    objc_msgSend(v17, "setImage:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("RECORDINGS_CONTENT_UNAVAILABLE_TEXT"), &stru_1001B2BC0, 0));
    objc_msgSend(v17, "setText:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_CONTENT_TAP_TO_RECORD_DESCRIPTION"), &stru_1001B2BC0, 0));
    objc_msgSend(v17, "setSecondaryText:", v15);

    v4 = (uint64_t)v17;
    goto LABEL_4;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recordingsDataCoordinator](self, "recordingsDataCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchString"));
  v9 = objc_msgSend(v8, "length");

  if ((v6 & 1) == 0)
    goto LABEL_10;
  if (v9)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration searchConfiguration](UIContentUnavailableConfiguration, "searchConfiguration"));
    goto LABEL_4;
  }
LABEL_3:
  v4 = 0;
LABEL_4:
  v16 = (id)v4;
  -[RCRecordingsCollectionViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  objc_msgSend(v5, "libraryChangedEmptyState");

}

- (RCRecordingsCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  RCRecordingsCollectionViewController *v3;
  RCRecordingsCollectionViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCRecordingsCollectionViewController;
  v3 = -[RCRecordingsCollectionViewController initWithCollectionViewLayout:](&v6, "initWithCollectionViewLayout:", a3);
  v4 = v3;
  if (v3)
  {
    -[RCRecordingsCollectionViewController setDefinesPresentationContext:](v3, "setDefinesPresentationContext:", 1);
    -[RCRecordingsCollectionViewController _commonInit](v4, "_commonInit");
    -[RCRecordingsCollectionViewController _classSpecificInit](v4, "_classSpecificInit");
  }
  return v4;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsHashTable](self, "cellsHashTable", 0));
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

- (void)registerAppIntentInteractions
{
  RCRecordingsCollectionViewController *v2;

  v2 = self;
  sub_100009B90();

}

- (id)_leadingSwipeActionsConfigurationProvider
{
  _QWORD *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000538E8;
  v4[3] = &unk_1001AC460;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
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
  v4[2] = sub_100053A68;
  v4[3] = &unk_1001AC460;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
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
  v5[2] = sub_10000A0E8;
  v5[3] = &unk_1001AC3C0;
  objc_copyWeak(&v6, &location);
  v3 = objc_msgSend(v2, "initWithSectionProvider:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCRecordingsCollectionViewController;
  -[RCRecordingsCollectionViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  -[RCRecordingsCollectionViewController _setupEditButton](self, "_setupEditButton");
  -[RCRecordingsCollectionViewController _classSpecificViewWillAppear](self, "_classSpecificViewWillAppear");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "setDragDelegate:", self);

}

- (void)finishLaunchTests
{
  void *v2;
  unsigned int v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_msgSend(v2, "isRunningTest");

  if (v3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
    objc_msgSend(v4, "ppt_didShowVoiceMemosList");

  }
}

- (void)_styleView
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  -[RCRecordingsCollectionViewController _restyleAllExtantCells](self, "_restyleAllExtantCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsMapTable](self, "cellsMapTable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectEnumerator"));

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextObject"));
  if (v5)
  {
    v7 = (void *)v5;
    do
    {
      v8 = objc_opt_class(RCRecordingCollectionViewCell, v6);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        v9 = v7;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
          v14 = objc_msgSend(v13, "isPlayingForUUID:", v10);

          if ((v14 & 1) == 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
            objc_msgSend(v15, "currentTime");
            objc_msgSend(v9, "setCurrentTime:");

          }
        }

      }
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextObject"));

      v7 = (void *)v16;
    }
    while (v16);
  }
  if (objc_msgSend(v18, "pinsSearchBarInLibrary"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v17, "setHidesSearchBarWhenScrolling:", 0);

  }
}

- (id)_createDiffableDataSource
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017FB8;
  v7[3] = &unk_1001AC3E8;
  objc_copyWeak(&v8, &location);
  v5 = objc_msgSend(v3, "initWithCollectionView:cellProvider:", v4, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

- (void)loadView
{
  RCRecordingsCollectionView *v3;
  void *v4;
  void *v5;
  RCRecordingsCollectionView *v6;

  v3 = [RCRecordingsCollectionView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController _createCollectionViewLayout](self, "_createCollectionViewLayout"));
  v6 = -[RCRecordingsCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  -[RCRecordingsCollectionViewController setCollectionView:](self, "setCollectionView:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("Recordings List"));

}

- (void)_commonInit
{
  NSMapTable *v3;
  NSMapTable *cellsMapTable;
  NSHashTable *v5;
  NSHashTable *cellsHashTable;
  NSMutableDictionary *v7;
  NSMutableDictionary *editingProgressItems;
  NSMutableDictionary *v9;
  NSMutableDictionary *recordingUUIDToEntityInteraction;

  -[RCRecordingsCollectionViewController setClearsSelectionOnViewWillAppear:](self, "setClearsSelectionOnViewWillAppear:", 0);
  v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
  cellsMapTable = self->_cellsMapTable;
  self->_cellsMapTable = v3;

  v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
  cellsHashTable = self->_cellsHashTable;
  self->_cellsHashTable = v5;

  v7 = objc_opt_new(NSMutableDictionary);
  editingProgressItems = self->_editingProgressItems;
  self->_editingProgressItems = v7;

  v9 = objc_opt_new(NSMutableDictionary);
  recordingUUIDToEntityInteraction = self->_recordingUUIDToEntityInteraction;
  self->_recordingUUIDToEntityInteraction = v9;

}

- (RCRecordingsCollectionViewController)initWithBuiltInFolderType:(int64_t)a3 folderUUID:(id)a4
{
  id v6;
  id v7;
  RCRecordingsCollectionViewController *v8;
  RCRecordingsCollectionViewControllerDataCoordinator *v9;
  RCRecordingsCollectionViewControllerDataCoordinator *recordingsDataCoordinator;

  v6 = a4;
  v7 = objc_alloc_init((Class)UICollectionViewLayout);
  v8 = -[RCRecordingsCollectionViewController initWithCollectionViewLayout:](self, "initWithCollectionViewLayout:", v7);

  if (v8)
  {
    -[RCRecordingsCollectionViewController setFolderType:](v8, "setFolderType:", a3);
    -[RCRecordingsCollectionViewController setFolderUUID:](v8, "setFolderUUID:", v6);
    v9 = -[RCRecordingsCollectionViewControllerDataCoordinator initWithFolderType:delegate:]([RCRecordingsCollectionViewControllerDataCoordinator alloc], "initWithFolderType:delegate:", a3, v8);
    recordingsDataCoordinator = v8->_recordingsDataCoordinator;
    v8->_recordingsDataCoordinator = v9;

  }
  return v8;
}

- (void)_updateEditButtonStateForRecordingsCount:(unint64_t)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v6 = objc_msgSend(v5, "isEditing");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController editButtonItem](self, "editButtonItem"));
  v8 = v7;
  if (v6)
    v9 = 1;
  else
    v9 = a3 != 0;
  objc_msgSend(v7, "setEnabled:", v9);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  objc_msgSend(v10, "updateNavBarTitleAndDeleteButtonForRecordingsCount:isEditMode:", a3, -[RCRecordingsCollectionViewController isEditing](self, "isEditing"));

}

- (void)_setupEditButton
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController editButtonItem](self, "editButtonItem"));
  objc_msgSend(v4, "setAction:", "_toggleEdit");
  if (byte_1001ED8C8 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController dataArray](self, "dataArray"));
    -[RCRecordingsCollectionViewController _updateEditButtonStateForRecordingsCount:](self, "_updateEditButtonStateForRecordingsCount:", objc_msgSend(v3, "count"));

  }
}

- (void)_updateCollectionViewContent:(BOOL)a3
{
  _BOOL8 v3;
  NSDiffableDataSourceSnapshot *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  NSDiffableDataSourceSnapshot *v13;
  uint64_t v14;
  _QWORD v15[5];
  BOOL v16;
  _QWORD v17[5];
  NSDiffableDataSourceSnapshot *v18;
  BOOL v19;

  v3 = a3;
  v5 = objc_opt_new(NSDiffableDataSourceSnapshot);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recordingsDataCoordinator](self, "recordingsDataCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingDataArray"));

  -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](v5, "appendSectionsWithIdentifiers:", &off_1001B7490);
  -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:](v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, &off_1001B7240);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController diffableDataSource](self, "diffableDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshot"));
  v10 = objc_msgSend(v9, "isEqual:", v5);

  if ((v10 & 1) == 0)
  {
    if (v3)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController diffableDataSource](self, "diffableDataSource"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "snapshot"));
      if (objc_msgSend(v12, "numberOfItems"))
      {

      }
      else
      {
        v14 = -[NSDiffableDataSourceSnapshot numberOfItems](v5, "numberOfItems");

        if (v14 >= 1)
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_10001B4B8;
          v17[3] = &unk_1001AC410;
          v17[4] = self;
          v18 = v5;
          v19 = v3;
          -[RCRecordingsCollectionViewController _animateContentUnavailableUpdateWithCompletion:](self, "_animateContentUnavailableUpdateWithCompletion:", v17);
          v13 = v18;
          goto LABEL_6;
        }
      }
    }
    v13 = (NSDiffableDataSourceSnapshot *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController diffableDataSource](self, "diffableDataSource"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000515E0;
    v15[3] = &unk_1001AB8D8;
    v16 = v3;
    v15[4] = self;
    -[NSDiffableDataSourceSnapshot applySnapshot:animatingDifferences:completion:](v13, "applySnapshot:animatingDifferences:completion:", v5, v3, v15);
LABEL_6:

  }
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)_setupSearchController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController searchController](self, "searchController"));
  if (!v7)
  {
    v7 = objc_msgSend(objc_alloc((Class)UISearchController), "initWithSearchResultsController:", 0);
    -[RCRecordingsCollectionViewController setSearchController:](self, "setSearchController:", v7);
    objc_msgSend(v7, "setDelegate:", self);
    objc_msgSend(v7, "setSearchResultsUpdater:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchBar"));
    objc_msgSend(v3, "setDelegate:", self);

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchBar"));
    objc_msgSend(v4, "setClipsToBounds:", 1);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchBar"));
    objc_msgSend(v5, "setUserInteractionEnabled:", 1);

    objc_msgSend(v7, "setObscuresBackgroundDuringPresentation:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchBar"));
    objc_msgSend(v6, "setLookToDictateEnabled:", 1);

  }
  -[RCRecordingsCollectionViewController _updateSearchBarPlaceholder](self, "_updateSearchBarPlaceholder");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  objc_super v17;
  _QWORD v18[4];

  v17.receiver = self;
  v17.super_class = (Class)RCRecordingsCollectionViewController;
  -[RCRecordingsCollectionViewController viewDidLoad](&v17, "viewDidLoad");
  -[RCRecordingsCollectionViewController _setupCollectionView](self, "_setupCollectionView");
  -[RCRecordingsCollectionViewController _setupEditButton](self, "_setupEditButton");
  -[RCRecordingsCollectionViewController _setupSearchController](self, "_setupSearchController");
  -[RCRecordingsCollectionViewController _updateCollectionViewContent:](self, "_updateCollectionViewContent:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController navigationItem](self, "navigationItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController editButtonItem](self, "editButtonItem"));
  objc_msgSend(v3, "setRightBarButtonItem:", v4);

  objc_msgSend(v3, "setLargeTitleDisplayMode:", 1);
  -[RCRecordingsCollectionViewController registerAppIntentInteractions](self, "registerAppIntentInteractions");
  -[RCRecordingsCollectionViewController _styleView](self, "_styleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "contentSizeChanged", UIContentSizeCategoryDidChangeNotification, 0);

  v6 = objc_opt_self(UITraitUserInterfaceStyle);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v18[0] = v7;
  v8 = objc_opt_self(UITraitUserInterfaceIdiom);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v18[1] = v9;
  v10 = objc_opt_self(UITraitHorizontalSizeClass);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v18[2] = v11;
  v12 = objc_opt_self(UITraitVerticalSizeClass);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v18[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 4));
  v15 = -[RCRecordingsCollectionViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v14, "_traitCollectionDidChange:previousTraitCollection:");

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
  objc_msgSend(v16, "registerObserver:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(void);
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)RCRecordingsCollectionViewController;
  -[RCRecordingsCollectionViewController viewDidAppear:](&v20, "viewDidAppear:", a3);
  if ((-[RCRecordingsCollectionViewController isFirstResponder](self, "isFirstResponder") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIResponder currentFirstResponder](UIResponder, "currentFirstResponder"));

    if (!v4)
      -[RCRecordingsCollectionViewController becomeFirstResponder](self, "becomeFirstResponder");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForSelectedItem"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "selectItemAtIndexPath:animated:scrollPosition:", v6, 0, 0);
  if ((-[RCRecordingsCollectionViewController isEditing](self, "isEditing") & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathForSelectedItem"));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cellForItemAtIndexPath:", v9));
      v12 = objc_opt_class(RCRecordingCollectionViewCell, v11);
      if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
      {
        v13 = v10;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelForUUID:](RCRecordingDisplayModel, "recordingDisplayModelForUUID:", v14));

        if (v15)
          -[RCRecordingsCollectionViewController _configureCell:usingDisplayModel:](self, "_configureCell:usingDisplayModel:", v13, v15);

      }
    }

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));
  objc_msgSend(v16, "didSelectForUUID:resetPosition:force:", v17, 0, 0);

  -[RCRecordingsCollectionViewController finishLaunchTests](self, "finishLaunchTests");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController viewDidAppearCompletionBlock](self, "viewDidAppearCompletionBlock"));

  if (v18)
  {
    v19 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController viewDidAppearCompletionBlock](self, "viewDidAppearCompletionBlock"));
    v19[2]();

    -[RCRecordingsCollectionViewController setViewDidAppearCompletionBlock:](self, "setViewDidAppearCompletionBlock:", 0);
  }

}

- (void)_setupCollectionView
{
  UICollectionViewDiffableDataSource *v3;
  UICollectionViewDiffableDataSource *diffableDataSource;
  UICollectionViewDiffableDataSource *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (UICollectionViewDiffableDataSource *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController _createDiffableDataSource](self, "_createDiffableDataSource"));
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v3;

  v5 = self->_diffableDataSource;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "setDataSource:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(RCRecordingCollectionViewCell, v8), CFSTR("NormalRecordingCellReuseIdentifier"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(RCRecentlyDeletedCollectionViewCell, v10), CFSTR("RecentlyDeletedRecordingCellReuseIdentifier"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v11, "setAllowsMultipleSelectionDuringEditing:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v12, "setSelectionFollowsFocus:", 1);

  v13 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v13, "setDropDelegate:", self);

}

- (int64_t)_expectedNumberOfItems
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController dataArray](self, "dataArray"));
  v3 = objc_msgSend(v2, "count");

  return (int64_t)v3;
}

- (id)contentUnavailableConfigurationState
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCRecordingsCollectionViewController;
  v3 = -[RCRecordingsCollectionViewController contentUnavailableConfigurationState](&v8, "contentUnavailableConfigurationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recordingsDataCoordinator](self, "recordingsDataCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchString"));
  objc_msgSend(v4, "setSearchText:", v6);

  return v4;
}

- (id)dataArray
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recordingsDataCoordinator](self, "recordingsDataCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingDataArray"));

  return v3;
}

- (RCRecordingsCollectionViewControllerDataCoordinator)recordingsDataCoordinator
{
  return self->_recordingsDataCoordinator;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v9 = a4;
  v7 = objc_opt_class(RCRecordingCollectionViewCell, v6);
  if ((objc_opt_isKindOfClass(v9, v7) & 1) != 0)
  {
    v8 = v9;
    objc_msgSend(v8, "layoutIfNeeded");
    -[RCRecordingsCollectionViewController _addCollectionViewCellToCellsMapTable:](self, "_addCollectionViewCellToCellsMapTable:", v8);
    -[RCRecordingsCollectionViewController registerAppEntityInteractionForCollectionViewCell:](self, "registerAppEntityInteractionForCollectionViewCell:", v8);

  }
}

- (void)registerAppEntityInteractionForCollectionViewCell:(id)a3
{
  id v4;
  RCRecordingsCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100014558(v4);

}

- (NSMutableDictionary)recordingUUIDToEntityInteraction
{
  return self->_recordingUUIDToEntityInteraction;
}

- (void)_configureCell:(id)a3 usingDisplayModel:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  v8 = objc_opt_class(RCRecordingCollectionViewCell, v7);
  if ((objc_opt_isKindOfClass(v21, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
    v10 = v21;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsMapTable](self, "cellsMapTable"));
    objc_msgSend(v11, "setObject:forKey:", v10, v9);

    objc_msgSend(v10, "setCellDelegate:", self);
    objc_msgSend(v10, "setUUID:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    objc_msgSend(v10, "setRecordingTitle:", v12);

    objc_msgSend(v6, "duration");
    objc_msgSend(v10, "setRecordingDuration:");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "creationDate"));
    objc_msgSend(v10, "setCreationDate:", v13);

    objc_msgSend(v10, "setRepresentsDownloadingFile:", objc_msgSend(v6, "representsDownloadingFile"));
    objc_msgSend(v10, "setWasManuallyRenamed:", objc_msgSend(v6, "wasManuallyRenamed"));
    objc_msgSend(v10, "setHasTranscription:", objc_msgSend(v6, "hasTranscription"));
    objc_msgSend(v10, "setIsRecentlyDeleted:", objc_msgSend(v6, "recentlyDeleted"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
    v15 = objc_msgSend(v14, "isPlayingForUUID:", v9);

    if (v15)
    {
      objc_msgSend(v10, "setPlayControlState:", 1);
    }
    else
    {
      objc_msgSend(v10, "setPlayControlState:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
      objc_msgSend(v16, "currentTime");
      v18 = v17;

      objc_msgSend(v10, "setCurrentTime:", v18);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController editingProgressItems](self, "editingProgressItems"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v9));

    if (v20)
    {
      objc_msgSend(v10, "setEditingInFlight:", 1);
      objc_msgSend(v20, "floatValue");
      objc_msgSend(v10, "setEditingProgress:");
    }
    else
    {
      objc_msgSend(v10, "setEditingInFlight:", 0);
    }

  }
}

- (RCLibraryActionHandler)libraryActionHandler
{
  return (RCLibraryActionHandler *)objc_loadWeakRetained((id *)&self->_libraryActionHandler);
}

- (NSMutableDictionary)editingProgressItems
{
  return self->_editingProgressItems;
}

- (void)_addCollectionViewCellToCellsMapTable:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsMapTable](self, "cellsMapTable"));
  v6 = objc_opt_class(RCRecordingCollectionViewCell, v5);
  if ((objc_opt_isKindOfClass(v10, v6) & 1) != 0)
  {
    v7 = v10;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v8));
      if (!v9)
        objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
  }

}

- (NSMapTable)cellsMapTable
{
  return self->_cellsMapTable;
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (NSHashTable)cellsHashTable
{
  return self->_cellsHashTable;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)viewDidAppearCompletionBlock
{
  return self->_viewDidAppearCompletionBlock;
}

- (NSString)uuidOfSelectedItem
{
  return self->_uuidOfSelectedItem;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (void)setReuseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setLibraryActionHandler:(id)a3
{
  objc_storeWeak((id *)&self->_libraryActionHandler, a3);
}

- (void)setFolderUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setFolderType:(int64_t)a3
{
  self->_folderType = a3;
}

- (void)setFolderSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_folderSelectionDelegate, a3);
}

- (void)setEditStateHandler:(id)a3
{
  objc_storeWeak((id *)&self->_editStateHandler, a3);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)performDelayedSetup
{
  byte_1001ED8C8 = 1;
  -[RCRecordingsCollectionViewController _setupEditButton](self, "_setupEditButton");
}

- (void)_classSpecificInit
{
  -[RCRecordingsCollectionViewController setReuseIdentifier:](self, "setReuseIdentifier:", CFSTR("NormalRecordingCellReuseIdentifier"));
}

- (void)setRecordingsDataCoordinator:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_recordingsDataCoordinator, a3);
  v5 = a3;
  objc_msgSend(v5, "setDelegate:", self);

}

- (RCCloudRecording)selectedRecording
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForSelectedItem"));
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController dataArray](self, "dataArray"));
    if (v6 >= objc_msgSend(v7, "count"))
      v8 = 0;
    else
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v6));

  }
  else
  {
    v8 = 0;
  }

  return (RCCloudRecording *)v8;
}

- (id)uuidOfSelectedRecording
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController selectedRecording](self, "selectedRecording"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uuid"));

  return v3;
}

- (void)setIsSearching:(BOOL)a3
{
  if (self->_isSearching != a3)
  {
    self->_isSearching = a3;
    -[RCRecordingsCollectionViewController setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration");
    -[RCRecordingsCollectionViewController _handleEditModeFooterAndNavigationItem](self, "_handleEditModeFooterAndNavigationItem");
  }
}

- (BOOL)isRecentlyDeleted
{
  return 0;
}

- (RCRecordingsCollectionViewController)initWithUserFolderNamed:(id)a3 folderUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  RCRecordingsCollectionViewController *v9;
  RCRecordingsCollectionViewControllerDataCoordinator *v10;
  RCRecordingsCollectionViewControllerDataCoordinator *recordingsDataCoordinator;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)UICollectionViewLayout);
  v9 = -[RCRecordingsCollectionViewController initWithCollectionViewLayout:](self, "initWithCollectionViewLayout:", v8);

  if (v9)
  {
    -[RCRecordingsCollectionViewController setFolderType:](v9, "setFolderType:", 4);
    -[RCRecordingsCollectionViewController setUserFolderName:](v9, "setUserFolderName:", v6);
    -[RCRecordingsCollectionViewController setFolderUUID:](v9, "setFolderUUID:", v7);
    v10 = -[RCRecordingsCollectionViewControllerDataCoordinator initWithUserFolderNamed:delegate:]([RCRecordingsCollectionViewControllerDataCoordinator alloc], "initWithUserFolderNamed:delegate:", v6, v9);
    recordingsDataCoordinator = v9->_recordingsDataCoordinator;
    v9->_recordingsDataCoordinator = v10;

  }
  return v9;
}

- (void)_updateSearchBarPlaceholder
{
  void *v3;
  void *v4;
  unsigned int v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController searchController](self, "searchController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
    v5 = objc_msgSend(v4, "deviceIsSupported");

    v6 = CFSTR("SEARCH_BAR_PLACEHOLDER_DEFAULT");
    if (v5)
      v6 = CFSTR("SEARCH_BAR_PLACEHOLDER_TRANSCRIPTION_SUPPORTED");
    v7 = v6;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v7, &stru_1001B2BC0, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController searchController](self, "searchController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchBar"));
    objc_msgSend(v10, "setPlaceholder:", v8);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCRecordingsCollectionViewController;
  -[RCRecordingsCollectionViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController searchController](self, "searchController"));
  objc_msgSend(v4, "setActive:", 0);

  -[RCRecordingsCollectionViewController _updateSearchString:](self, "_updateSearchString:", &stru_1001B2BC0);
  -[RCRecordingsCollectionViewController _classSpecificViewWillDisappear](self, "_classSpecificViewWillDisappear");
  if (-[RCRecordingsCollectionViewController isFirstResponder](self, "isFirstResponder"))
    -[RCRecordingsCollectionViewController resignFirstResponder](self, "resignFirstResponder");
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = objc_msgSend(v5, "userInterfaceStyle");

  if (v7 != v8)
    -[RCRecordingsCollectionViewController restyle](self, "restyle");
}

- (void)contentSizeChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForSelectedItems"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v5, "reloadData");

  -[RCRecordingsCollectionViewController restyle](self, "restyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v7 = objc_msgSend(v6, "isEditing");

  if (v7)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView", (_QWORD)v17));
          objc_msgSend(v14, "selectItemAtIndexPath:animated:scrollPosition:", v13, 0, 0);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    objc_msgSend(v15, "selectItemAtIndexPath:animated:scrollPosition:", v16, 0, 0);

  }
}

- (void)restyle
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "restyle");

  -[RCRecordingsCollectionViewController _styleView](self, "_styleView");
}

- (void)_toggleEdit
{
  id v3;
  void *v4;

  if (!-[RCRecordingsCollectionViewController isUpdatingBottomLayoutForEditing](self, "isUpdatingBottomLayoutForEditing"))
  {
    -[RCRecordingsCollectionViewController setEditing:animated:](self, "setEditing:animated:", -[RCRecordingsCollectionViewController isEditing](self, "isEditing") ^ 1, 1);
    v3 = -[RCRecordingsCollectionViewController isEditing](self, "isEditing");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController editStateHandler](self, "editStateHandler"));
    objc_msgSend(v4, "updateBottomLayoutForEditing:delegate:", v3, self);

    -[RCRecordingsCollectionViewController _handleEditModeFooterAndNavigationItem](self, "_handleEditModeFooterAndNavigationItem");
  }
}

- (void)updateToolbarAndFooterView
{
  if (-[RCRecordingsCollectionViewController isEditing](self, "isEditing"))
    -[RCRecordingsCollectionViewController _handleEditModeFooterAndNavigationItem](self, "_handleEditModeFooterAndNavigationItem");
}

- (void)endEditing
{
  if (-[RCRecordingsCollectionViewController isEditing](self, "isEditing"))
    -[RCRecordingsCollectionViewController _toggleEdit](self, "_toggleEdit");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  BOOL v30;
  id location;

  v4 = a4;
  v5 = a3;
  v7 = -[RCRecordingsCollectionViewController isEditing](self, "isEditing") & !a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  objc_msgSend(v8, "libraryWillChangeEditingState:", v5);

  if (v5)
    -[RCRecordingsCollectionViewController _updateUUIDOfSelectedItem](self, "_updateUUIDOfSelectedItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));
    v11 = v10 != 0;

  }
  else
  {
    v11 = 0;
  }
  -[RCRecordingsCollectionViewController setWillSelectRecordingAfterExitingEditMode:](self, "setWillSelectRecordingAfterExitingEditMode:", v11);
  objc_initWeak(&location, self);
  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_100051D9C;
  v27 = &unk_1001AC438;
  v30 = v11;
  objc_copyWeak(&v29, &location);
  v12 = v9;
  v28 = v12;
  -[RCRecordingsCollectionViewController _setEditing:animated:withCompletionHandler:](self, "_setEditing:animated:withCompletionHandler:", v5, v4, &v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v24, v25, v26, v27));
  if (v5)
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1001B2BC0, 0));
  else
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("EDIT"), &stru_1001B2BC0, 0));
  v15 = (void *)v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController editButtonItem](self, "editButtonItem"));
  objc_msgSend(v16, "setTitle:", v15);

  if (!v5)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController dataArray](self, "dataArray"));
    -[RCRecordingsCollectionViewController _updateEditButtonStateForRecordingsCount:](self, "_updateEditButtonStateForRecordingsCount:", objc_msgSend(v17, "count"));

  }
  objc_msgSend(v12, "setSelectionFollowsFocus:", v5 ^ 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathsForSelectedItems"));
    v20 = objc_msgSend(v19, "count");

    if (v5 && !v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));
      -[RCRecordingsCollectionViewController wasDeselectedForCellWithUUID:](self, "wasDeselectedForCellWithUUID:", v21);

    }
  }
  if (!v5)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController editStateHandler](self, "editStateHandler"));
    objc_msgSend(v22, "updateBottomLayoutForEditing:delegate:", 0, self);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  objc_msgSend(v23, "libraryDidChangeEditingState");

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void (**v8)(_QWORD);
  void *v9;
  double v10;
  double v11;
  dispatch_time_t v12;
  _QWORD block[4];
  void (**v14)(_QWORD);
  objc_super v15;

  v5 = a4;
  v6 = a3;
  v8 = (void (**)(_QWORD))a5;
  v15.receiver = self;
  v15.super_class = (Class)RCRecordingsCollectionViewController;
  -[RCRecordingsCollectionViewController setEditing:animated:](&v15, "setEditing:animated:", v6, v5);
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v9, "collectionViewEditModeAnimationDuration");
    v11 = v10;

    v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100051FA8;
    block[3] = &unk_1001AC298;
    v14 = v8;
    dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v8[2](v8);
  }

}

- (void)_updateUUIDOfSelectedItem
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForSelectedItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController _uuidForItemAtIndexPath:](self, "_uuidForItemAtIndexPath:", v3));
  -[RCRecordingsCollectionViewController setUuidOfSelectedItem:](self, "setUuidOfSelectedItem:", v4);

}

- (void)prepareForAdditionOfNewRecordingWithUUID:(id)a3
{
  void *v4;
  id v5;

  -[RCRecordingsCollectionViewController setUuidOfNewestRecording:](self, "setUuidOfNewestRecording:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfNewestRecording](self, "uuidOfNewestRecording"));
  objc_msgSend(v5, "setUUIDToSelectAfterDismiss:", v4);

}

- (void)didProcessUpdatesWithRemainingItemCount:(unint64_t)a3
{
  id v3;
  void *v5;
  void *v6;

  v3 = (id)a3;
  if (!a3)
    -[RCRecordingsCollectionViewController setEditing:](self, "setEditing:");
  if (-[RCRecordingsCollectionViewController isEditing](self, "isEditing"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForSelectedItems"));
    v3 = objc_msgSend(v6, "count");

  }
  -[RCRecordingsCollectionViewController _updateEditButtonStateForRecordingsCount:](self, "_updateEditButtonStateForRecordingsCount:", v3);
}

- (void)_logWhetherVisibleCellsHaveIntegrity
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSMutableArray *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v3 = objc_opt_new(NSMutableArray);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleCells"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v36;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(RCRecordingCollectionViewCell, v7);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v13 = v11;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
          -[NSMutableArray addObject:](v3, "addObject:", v14);

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v8);
  }

  v15 = objc_opt_new(NSMutableArray);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController dataArray](self, "dataArray"));
  if (objc_msgSend(v16, "count"))
  {
    v17 = 0;
    do
    {
      if ((unint64_t)-[NSMutableArray count](v3, "count") <= v17)
        break;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v17));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uuid"));
      -[NSMutableArray addObject:](v15, "addObject:", v19);

      ++v17;
    }
    while ((unint64_t)objc_msgSend(v16, "count") > v17);
  }
  if (-[NSMutableArray count](v3, "count"))
  {
    v20 = 0;
    while ((unint64_t)-[NSMutableArray count](v15, "count") > v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", v20));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", v20));
      v23 = objc_msgSend(v21, "isEqualToString:", v22);

      if ((v23 & 1) == 0)
      {
        v25 = OSLogForCategory(kVMLogCategoryDefault);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          sub_10010BB00();

        v24 = 0;
        goto LABEL_23;
      }
      if ((unint64_t)-[NSMutableArray count](v3, "count") <= ++v20)
        break;
    }
  }
  v24 = 1;
LABEL_23:
  v27 = OSLogForCategory(kVMLogCategoryDefault);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    sub_10010BA70(v24, v28, v29, v30, v31, v32, v33, v34);

}

- (void)deleteSelectedItems
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  objc_msgSend(v3, "performAction:atPosition:forUUID:sourceController:source:", 15, 0, self, 0, 0.0);

  -[RCRecordingsCollectionViewController _handleEditModeFooterAndNavigationItem](self, "_handleEditModeFooterAndNavigationItem");
  -[RCRecordingsCollectionViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (void)prepareForChangingContent
{
  self->_didInsertItems = 0;
}

- (void)insertItemsAtIndexPaths:(id)a3
{
  self->_didInsertItems = 1;
}

- (void)reloadItemAtIndexPath:(id)a3 usingDisplayModel:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  objc_msgSend(v5, "refreshDisplayWithDisplayModel:", v13);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsMapTable](self, "cellsMapTable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
      objc_msgSend(v10, "setRecordingTitle:", v11);

      objc_msgSend(v13, "duration");
      objc_msgSend(v10, "setRecordingDuration:");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "creationDate"));
      objc_msgSend(v10, "setCreationDate:", v12);

      objc_msgSend(v10, "setRepresentsDownloadingFile:", objc_msgSend(v13, "representsDownloadingFile"));
      objc_msgSend(v10, "setWasManuallyRenamed:", objc_msgSend(v13, "wasManuallyRenamed"));
      objc_msgSend(v10, "setHasTranscription:", objc_msgSend(v13, "hasTranscription"));
    }

  }
}

- (void)deleteItemAtIndexPath:(id)a3 withUUID:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  if (a3)
  {
    v11 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));
    v8 = objc_msgSend(v11, "isEqualToString:", v7);

    if (v8)
      -[RCRecordingsCollectionViewController setUuidOfSelectedItem:](self, "setUuidOfSelectedItem:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
    objc_msgSend(v9, "wasDeselectedForUUID:", v11);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsMapTable](self, "cellsMapTable"));
    objc_msgSend(v10, "removeObjectForKey:", v11);

    v6 = v11;
  }

}

- (void)contentChangesComplete
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  -[RCRecordingsCollectionViewController _updateCollectionViewContent:](self, "_updateCollectionViewContent:", -[RCRecordingsCollectionViewController isUpdatingSearchString](self, "isUpdatingSearchString") ^ 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController dataArray](self, "dataArray"));
  v4 = objc_msgSend(v3, "count");

  -[RCRecordingsCollectionViewController didProcessUpdatesWithRemainingItemCount:](self, "didProcessUpdatesWithRemainingItemCount:", v4);
  if (self->_didInsertItems)
  {
    v6 = objc_opt_class(RCRecentlyDeletedRecordingsCollectionViewController, v5);
    if ((objc_opt_isKindOfClass(self, v6) & 1) == 0)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
      objc_msgSend(v7, "mostRecentRecordingIsSelectable");

    }
  }
}

- (id)selectedUUIDs
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = objc_opt_new(NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForSelectedItems"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController dataArray](self, "dataArray"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v10, "item")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));

        -[NSMutableArray addObject:](v3, "addObject:", v13);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)allUUIDs
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_opt_new(NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController dataArray](self, "dataArray", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "uuid"));
        -[NSMutableArray addObject:](v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)cellForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsMapTable](self, "cellsMapTable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (void)setCaptureIsUnderway:(BOOL)a3
{
  self->_captureIsUnderway = a3;
  -[RCRecordingsCollectionViewController _animateContentUnavailableUpdateWithCompletion:](self, "_animateContentUnavailableUpdateWithCompletion:", 0);
}

- (void)_animateContentUnavailableUpdateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v5, "contentUnavailableViewAnimationDuration");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100052AAC;
  v6[3] = &unk_1001AB588;
  v6[4] = self;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v4);

}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scroll:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  id v10;

  v5 = a5;
  v6 = a4;
  v10 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v9 = v8;
  if (v5)
    objc_msgSend(v8, "scrollToItemAtIndexPath:atScrollPosition:animated:", v10, 1, v6);
  objc_msgSend(v9, "selectItemAtIndexPath:animated:scrollPosition:", v10, v6, 0);
  -[RCRecordingsCollectionViewController _updateUUIDOfSelectedItem](self, "_updateUUIDOfSelectedItem");
  -[RCRecordingsCollectionViewController _notifyDelegatesThatSelectionChanged](self, "_notifyDelegatesThatSelectionChanged");

}

- (void)deselectSelectedItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForSelectedItem"));
  if (v3)
  {
    objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));
    objc_msgSend(v4, "wasDeselectedForUUID:", v5);

    -[RCRecordingsCollectionViewController setUuidOfSelectedItem:](self, "setUuidOfSelectedItem:", 0);
  }

}

- (void)scrollToTop
{
  void *v3;
  id v4;

  if (-[RCRecordingsCollectionViewController _expectedNumberOfItems](self, "_expectedNumberOfItems") >= 2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
    objc_msgSend(v4, "scrollToItemAtIndexPath:atScrollPosition:animated:", v3, 1, 0);

  }
}

- (BOOL)presentsRecordingWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recordingsDataCoordinator](self, "recordingsDataCoordinator"));
  v6 = objc_msgSend(v5, "indexOfUUID:", v4);

  return v6 != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (void)willSelectItemWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recordingsDataCoordinator](self, "recordingsDataCoordinator"));
  v6 = objc_msgSend(v5, "indexOfUUID:", v4);

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v6, 0));
    -[RCRecordingsCollectionViewController scrollToRevealPartiallyObscuredItemAtIndexPathIfNeeded:](self, "scrollToRevealPartiallyObscuredItemAtIndexPathIfNeeded:", v7);

  }
}

- (void)selectItemWithUUID:(id)a3
{
  -[RCRecordingsCollectionViewController selectItemWithUUID:animated:](self, "selectItemWithUUID:animated:", a3, 1);
}

- (void)selectItemWithUUID:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recordingsDataCoordinator](self, "recordingsDataCoordinator"));
  v8 = objc_msgSend(v7, "indexOfUUID:", v6);

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView")),
        v10 = objc_msgSend(v9, "numberOfItemsInSection:", 0),
        v9,
        v8 >= v10))
  {
    v13 = OSLogForCategory(kVMLogCategoryDefault);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_10010BB70(v14);

  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v8, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellForItemAtIndexPath:", v15));

    -[RCRecordingsCollectionViewController selectItemAtIndexPath:animated:scroll:](self, "selectItemAtIndexPath:animated:scroll:", v15, v4, v12 == 0);
  }
}

- (void)_handleEditModeFooterAndNavigationItem
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForSelectedItems"));
  v5 = objc_msgSend(v4, "count");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "updateNavBarTitleAndDeleteButtonForRecordingsCount:isEditMode:", v5, objc_msgSend(v6, "isEditing"));

}

- (void)handleDeleteForUUID:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    -[RCRecordingsCollectionViewController setUuidOfSelectedItem:](self, "setUuidOfSelectedItem:", 0);
}

- (void)willUpdateBottomLayoutForEditing
{
  -[RCRecordingsCollectionViewController setIsUpdatingBottomLayoutForEditing:](self, "setIsUpdatingBottomLayoutForEditing:", 1);
}

- (void)didUpdateBottomLayoutForEditing
{
  -[RCRecordingsCollectionViewController setIsUpdatingBottomLayoutForEditing:](self, "setIsUpdatingBottomLayoutForEditing:", 0);
}

- (void)showNewFolderUIFromController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController folderSelectionDelegate](self, "folderSelectionDelegate"));
  objc_msgSend(v5, "showNewFolderUIFromController:", v4);

}

- (void)showRenamingControllerWithFolderName:(id)a3 controller:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController folderSelectionDelegate](self, "folderSelectionDelegate"));
  objc_msgSend(v8, "showRenamingControllerWithFolderName:controller:", v7, v6);

}

- (void)moveFolder:(id)a3 toDestinationIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController folderSelectionDelegate](self, "folderSelectionDelegate"));
  objc_msgSend(v8, "moveFolder:toDestinationIndexPath:", v7, v6);

}

- (void)deleteFolder:(id)a3 controller:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController folderSelectionDelegate](self, "folderSelectionDelegate"));
  objc_msgSend(v6, "deleteFolder:controller:completionBlock:", v5, self, 0);

}

- (void)renameFolder:(id)a3 toName:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController folderSelectionDelegate](self, "folderSelectionDelegate"));
  objc_msgSend(v8, "renameFolder:toName:", v7, v6);

}

- (void)presentViewController:(id)a3 sourceController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController folderSelectionDelegate](self, "folderSelectionDelegate"));
  objc_msgSend(v13, "presentViewController:sourceController:animated:completion:", v12, v11, v6, v10);

}

- (void)_handleMove
{
  void *v3;
  void *v4;
  RCFolderSelectionCollectionViewController *v5;

  v5 = objc_opt_new(RCFolderSelectionCollectionViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController folderSelectionDelegate](self, "folderSelectionDelegate"));
  -[RCFolderSelectionCollectionViewController setSelectionDelegate:](v5, "setSelectionDelegate:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController navigationController](self, "navigationController"));
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localDragSession"));

  if (v5)
    LOBYTE(v6) = 0;
  else
    v6 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", &off_1001B74A8);

  return v6;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  -[RCRecordingsCollectionViewController collectionView:performDropWithCoordinator:folder:](self, "collectionView:performDropWithCoordinator:folder:", a3, a4, 0);
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4 folder:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "session"));
  -[RCRecordingsCollectionViewController performDropWithSession:folder:](self, "performDropWithSession:folder:", v8, v7);

}

- (void)performDropWithSession:(id)a3 folder:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  BOOL v12;
  id v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "items"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9), "itemProvider"));
        v11 = objc_msgSend(v10, "hasRepresentationConformingToTypeIdentifier:fileOptions:", CFSTR("com.apple.m4a-audio"), 0);
        if (v10)
          v12 = v11 == 0;
        else
          v12 = 1;
        if (!v12)
        {
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_1000534E4;
          v14[3] = &unk_1001AC020;
          v14[4] = self;
          v13 = objc_msgSend(v10, "loadFileRepresentationForTypeIdentifier:completionHandler:", CFSTR("com.apple.m4a-audio"), v14);
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)_performFolderTypeUpdatesOnRecording:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[RCRecordingsCollectionViewController folderType](self, "folderType");
  if (v5 == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    objc_msgSend(v10, "setFavorite:forRecordingWithUUID:", 1, v11);

  }
  else if (v5 == 4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    v12 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController userFolderName](self, "userFolderName"));
    objc_msgSend(v6, "moveRecordingsWithUUIDs:toUserFolderNamed:source:", v8, v9, self);

  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  -[RCRecordingsCollectionViewController _removeCollectionViewCellFromCellsMapTable:](self, "_removeCollectionViewCellFromCellsMapTable:", v8);
  v7 = objc_opt_class(RCRecordingCollectionViewCell, v6);
  if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
    -[RCRecordingsCollectionViewController removeAppEntityInteractionForCollectionViewCell:](self, "removeAppEntityInteractionForCollectionViewCell:", v8);

}

- (void)_removeCollectionViewCellFromCellsMapTable:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsMapTable](self, "cellsMapTable"));
  v6 = objc_opt_class(RCRecordingCollectionViewCell, v5);
  if ((objc_opt_isKindOfClass(v11, v6) & 1) != 0)
  {
    v7 = v11;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v8));
      v10 = (void *)v9;
      if (v9 && (id)v9 == v7)
        objc_msgSend(v4, "removeObjectForKey:", v8);

    }
  }

}

- (id)_favoriteSwipeAction:(BOOL)a3 forUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  RCSwipeActionConfiguration *v13;
  id v14;
  void *v15;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, void *);
  void *v20;
  id v21;
  BOOL v22;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  if (a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ADD_TO_FAVORITES"), &stru_1001B2BC0, 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notFavoriteImage"));
    v12 = 38;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("REMOVE_FROM_FAVORITES"), &stru_1001B2BC0, 0));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "favoriteImage"));
    v12 = 39;
  }
  v13 = -[RCSwipeActionConfiguration initWithControlsAction:recordingUUID:actionTitle:]([RCSwipeActionConfiguration alloc], "initWithControlsAction:recordingUUID:actionTitle:", v12, v6, v10);

  -[RCSwipeActionConfiguration setActionImage:](v13, "setActionImage:", v11);
  -[RCSwipeActionConfiguration setActionImageAxLabel:](v13, "setActionImageAxLabel:", v10);
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_100053E54;
  v20 = &unk_1001AC488;
  v22 = a3;
  v21 = v7;
  v14 = v7;
  -[RCSwipeActionConfiguration setCustomCompletionBlock:](v13, "setCustomCompletionBlock:", &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController _createSwipeActionWithConfiguration:](self, "_createSwipeActionWithConfiguration:", v13, v17, v18, v19, v20));

  return v15;
}

- (id)_deleteSwipeActionForUUID:(id)a3 shouldExecuteCompletionBeforeAction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  RCSwipeActionConfiguration *v7;
  void *v8;
  void *v9;
  RCSwipeActionConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a4;
  v6 = a3;
  v7 = [RCSwipeActionConfiguration alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1001B2BC0, 0));
  v10 = -[RCSwipeActionConfiguration initWithControlsAction:recordingUUID:actionTitle:](v7, "initWithControlsAction:recordingUUID:actionTitle:", 14, v6, v9);

  -[RCSwipeActionConfiguration setActionStyle:](v10, "setActionStyle:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "swipeTrashImage"));
  -[RCSwipeActionConfiguration setActionImage:](v10, "setActionImage:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("AX_DELETE"), &stru_1001B2BC0, 0));
  -[RCSwipeActionConfiguration setActionImageAxLabel:](v10, "setActionImageAxLabel:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellForUUID:](self, "cellForUUID:", v6));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentView"));
  -[RCSwipeActionConfiguration setSourceItem:](v10, "setSourceItem:", v16);

  -[RCSwipeActionConfiguration setShouldExecuteCompletionBeforeAction:](v10, "setShouldExecuteCompletionBeforeAction:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController _createSwipeActionWithConfiguration:](self, "_createSwipeActionWithConfiguration:", v10));

  return v17;
}

- (id)_eraseSwipeActionForUUID:(id)a3 shouldExecuteCompletionBeforeAction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  RCSwipeActionConfiguration *v7;
  void *v8;
  void *v9;
  RCSwipeActionConfiguration *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  v7 = [RCSwipeActionConfiguration alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1001B2BC0, 0));
  v10 = -[RCSwipeActionConfiguration initWithControlsAction:recordingUUID:actionTitle:](v7, "initWithControlsAction:recordingUUID:actionTitle:", 17, v6, v9);

  -[RCSwipeActionConfiguration setActionStyle:](v10, "setActionStyle:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellForUUID:](self, "cellForUUID:", v6));

  -[RCSwipeActionConfiguration setSourceItem:](v10, "setSourceItem:", v11);
  -[RCSwipeActionConfiguration setShouldExecuteCompletionBeforeAction:](v10, "setShouldExecuteCompletionBeforeAction:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController _createSwipeActionWithConfiguration:](self, "_createSwipeActionWithConfiguration:", v10));

  return v12;
}

- (id)_moveToFolderSwipeActionForUUID:(id)a3 shouldExecuteCompletionBeforeAction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  RCSwipeActionConfiguration *v7;
  void *v8;
  void *v9;
  RCSwipeActionConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a4;
  v6 = a3;
  v7 = [RCSwipeActionConfiguration alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MOVE_TO_FOLDER"), &stru_1001B2BC0, 0));
  v10 = -[RCSwipeActionConfiguration initWithControlsAction:recordingUUID:actionTitle:](v7, "initWithControlsAction:recordingUUID:actionTitle:", 42, v6, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filledMoveToFolderImage"));
  -[RCSwipeActionConfiguration setActionImage:](v10, "setActionImage:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MOVE_TO_FOLDER"), &stru_1001B2BC0, 0));
  -[RCSwipeActionConfiguration setActionImageAxLabel:](v10, "setActionImageAxLabel:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[RCSwipeActionConfiguration setActionBackgroundColor:](v10, "setActionBackgroundColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellForUUID:](self, "cellForUUID:", v6));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contentView"));
  -[RCSwipeActionConfiguration setSourceItem:](v10, "setSourceItem:", v17);

  -[RCSwipeActionConfiguration setShouldExecuteCompletionBeforeAction:](v10, "setShouldExecuteCompletionBeforeAction:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController _createSwipeActionWithConfiguration:](self, "_createSwipeActionWithConfiguration:", v10));

  return v18;
}

- (id)_moreOptionsSwipeActionForUUID:(id)a3 shouldExecuteCompletionBeforeAction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  RCSwipeActionConfiguration *v7;
  void *v8;
  void *v9;
  RCSwipeActionConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a4;
  v6 = a3;
  v7 = [RCSwipeActionConfiguration alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MORE_ACTIONS"), &stru_1001B2BC0, 0));
  v10 = -[RCSwipeActionConfiguration initWithControlsAction:recordingUUID:actionTitle:](v7, "initWithControlsAction:recordingUUID:actionTitle:", 28, v6, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ellipsisImage"));
  -[RCSwipeActionConfiguration setActionImage:](v10, "setActionImage:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellForUUID:](self, "cellForUUID:", v6));
  -[RCSwipeActionConfiguration setSourceItem:](v10, "setSourceItem:", v13);

  -[RCSwipeActionConfiguration setShouldExecuteCompletionBeforeAction:](v10, "setShouldExecuteCompletionBeforeAction:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController _createSwipeActionWithConfiguration:](self, "_createSwipeActionWithConfiguration:", v10));

  return v14;
}

- (id)_createSwipeActionWithConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *, void *);
  void *v20;
  id v21;
  RCRecordingsCollectionViewController *v22;

  v4 = a3;
  v5 = objc_msgSend(v4, "actionStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionTitle"));
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_1000545C4;
  v20 = &unk_1001AC4B0;
  v7 = v4;
  v21 = v7;
  v22 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", v5, v6, &v17));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionImage", v17, v18, v19, v20));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionImage"));
    objc_msgSend(v8, "setImage:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionImageAxLabel"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionImageAxLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
    objc_msgSend(v13, "setAccessibilityLabel:", v12);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionBackgroundColor"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionBackgroundColor"));
    objc_msgSend(v8, "setBackgroundColor:", v15);

  }
  return v8;
}

- (BOOL)_supportsSwipeActionsForIndexPath:(id)a3 swipeActionsType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recordingsDataCoordinator](self, "recordingsDataCoordinator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuidAtIndexPath:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsMapTable](self, "cellsMapTable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));

  v11 = objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  v12 = objc_msgSend((id)v11, "isEditingInFlightForUUID:", v8);

  LOBYTE(v11) = objc_msgSend(v10, "isEditingTitle");
  v14 = objc_opt_class(RCRecentlyDeletedRecordingsCollectionViewController, v13);
  LOBYTE(a4) = (v12 | v11 | (a4 == 0) & objc_opt_isKindOfClass(self, v14)) ^ 1;

  return a4;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  BOOL v14;
  char v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recordingsDataCoordinator](self, "recordingsDataCoordinator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuidAtIndexPath:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForSelectedItem"));
  v11 = -[RCRecordingsCollectionViewController _isDownloadingAtIndex:](self, "_isDownloadingAtIndex:", v7);
  if (objc_msgSend(v6, "isEditing"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
    v13 = objc_msgSend(v12, "isEditingInFlightForUUID:", v9);

    if (v10)
    {
LABEL_3:
      v14 = objc_msgSend(v10, "compare:", v7) == 0;
      goto LABEL_6;
    }
  }
  else
  {
    v13 = 0;
    if (v10)
      goto LABEL_3;
  }
  v14 = 0;
LABEL_6:
  v15 = v11 | v13 | v14;
  if ((v15 & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v7));
    -[RCRecordingsCollectionViewController setIsSelectingCellForFocusUpdate:](self, "setIsSelectingCellForFocusUpdate:", objc_msgSend(v16, "isFocused"));

  }
  return v15 ^ 1;
}

- (void)scrollToRevealPartiallyObscuredItemAtIndexPathIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForVisibleItems"));
  v6 = objc_msgSend(v5, "containsObject:", v7);

  if (v6)
  {
    -[RCRecordingsCollectionViewController _scrollDownToItemAtIndexPathIfNeeded:](self, "_scrollDownToItemAtIndexPathIfNeeded:", v7);
    -[RCRecordingsCollectionViewController _scrollUpToItemAtIndexPathIfNeeded:](self, "_scrollUpToItemAtIndexPathIfNeeded:", v7);
  }

}

- (void)_scrollUpToItemAtIndexPathIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  BOOL v14;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForItemAtIndexPath:", v4));
  objc_msgSend(v6, "frame");
  v8 = v7;
  objc_msgSend(v5, "contentOffset");
  v10 = v9;
  objc_msgSend(v5, "safeAreaInsets");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v13, "explicitlyScrollsToRecordingsCollectionViewItemOnSelection"))
    v14 = v8 < v10 + v12;
  else
    v14 = 0;
  if (v14)
  {
    +[CATransaction begin](CATransaction, "begin");
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_100054B20;
    v18 = &unk_1001AB6E8;
    v19 = v5;
    v20 = v4;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", &v15);
    +[CATransaction commit](CATransaction, "commit", v15, v16, v17, v18);

  }
}

- (void)_scrollDownToItemAtIndexPathIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void **v20;
  uint64_t v21;
  id (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForItemAtIndexPath:", v4));
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v5, "contentOffset");
  v12 = v11;
  objc_msgSend(v5, "frame");
  v14 = v13;
  objc_msgSend(v5, "contentInset");
  v16 = v15;
  objc_msgSend(v5, "contentInset");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v19, "explicitlyScrollsToRecordingsCollectionViewItemOnSelection")
    && v8 + v10 > v12 + v14 - v16 - v18)
  {
    +[CATransaction begin](CATransaction, "begin", v8 + v10);
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_100054C98;
    v23 = &unk_1001AB6E8;
    v24 = v5;
    v25 = v4;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", &v20);
    +[CATransaction commit](CATransaction, "commit", v20, v21, v22, v23);

  }
}

- (BOOL)_isDownloadingAtIndex:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recordingsDataCoordinator](self, "recordingsDataCoordinator"));
  v6 = objc_msgSend(v5, "isDownloadingAtIndexPath:", v4);

  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController searchController](self, "searchController"));
  if (objc_msgSend(v7, "isActive")
    && !-[RCRecordingsCollectionViewController isSelectingCellForFocusUpdate](self, "isSelectingCellForFocusUpdate"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchBar"));
    objc_msgSend(v8, "resignFirstResponder");

  }
  -[RCRecordingsCollectionViewController setInDidSelect:](self, "setInDidSelect:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v13));

  -[RCRecordingsCollectionViewController setInDidSelect:](self, "setInDidSelect:", 0);
  v11 = objc_opt_class(RCRecordingCollectionViewCell, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0
    && (-[RCRecordingsCollectionViewController isEditing](self, "isEditing") & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
    -[RCRecordingsCollectionViewController setUuidOfSelectedItem:](self, "setUuidOfSelectedItem:", v12);

  }
  -[RCRecordingsCollectionViewController scrollToRevealPartiallyObscuredItemAtIndexPathIfNeeded:](self, "scrollToRevealPartiallyObscuredItemAtIndexPathIfNeeded:", v13);
  -[RCRecordingsCollectionViewController _handleEditModeFooterAndNavigationItem](self, "_handleEditModeFooterAndNavigationItem");
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, v9);
  -[RCRecordingsCollectionViewController setIsSelectingCellForFocusUpdate:](self, "setIsSelectingCellForFocusUpdate:", 0);
  -[RCRecordingsCollectionViewController _notifyDelegatesThatSelectionChanged](self, "_notifyDelegatesThatSelectionChanged");

}

- (void)_notifyDelegatesThatSelectionChanged
{
  void *v3;
  id v4;

  if ((-[RCRecordingsCollectionViewController isEditing](self, "isEditing") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));

    if (v3)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));
      -[RCRecordingsCollectionViewController didSelectCellWithUUID:](self, "didSelectCellWithUUID:", v4);

    }
  }
}

- (void)_pauseSelecteditem
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));
  objc_msgSend(v4, "performAction:atPosition:forUUID:sourceController:source:", 1, v3, 0, 0, 0.0);

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController _uuidForItemAtIndexPath:](self, "_uuidForItemAtIndexPath:", a4));
  -[RCRecordingsCollectionViewController wasDeselectedForCellWithUUID:](self, "wasDeselectedForCellWithUUID:", v5);
  -[RCRecordingsCollectionViewController _handleEditModeFooterAndNavigationItem](self, "_handleEditModeFooterAndNavigationItem");

}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  if ((-[RCRecordingsCollectionViewController isEditing](self, "isEditing", a3, a4) & 1) == 0)
    -[RCRecordingsCollectionViewController _toggleEdit](self, "_toggleEdit");
}

- (void)performAction:(int64_t)a3 atPosition:(double)a4 forCellWithUUID:(id)a5 source:(id)a6
{
  id v10;
  id v11;
  id v12;

  if (a5)
  {
    v10 = a6;
    v11 = a5;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
    objc_msgSend(v12, "performAction:atPosition:forUUID:sourceController:source:", a3, v11, self, v10, a4);

  }
}

- (void)showPlayingForItemWithUUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recordingsDataCoordinator](self, "recordingsDataCoordinator"));
  v5 = objc_msgSend(v4, "indexOfUUID:", v8);

  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsMapTable](self, "cellsMapTable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v8));

    objc_msgSend(v7, "setPlayControlState:", 1);
  }

}

- (void)showIdleForItemWithUUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recordingsDataCoordinator](self, "recordingsDataCoordinator"));
  v5 = objc_msgSend(v4, "indexOfUUID:", v8);

  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsMapTable](self, "cellsMapTable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v8));

    objc_msgSend(v7, "setPlayControlState:", 0);
  }

}

- (void)setCurrentTime:(double)a3 forItemWithUUID:(id)a4
{
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v7 = objc_msgSend(v6, "expandsRecordingsCollectionViewItemOnSelection");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recordingsDataCoordinator](self, "recordingsDataCoordinator"));
    v9 = objc_msgSend(v8, "indexOfUUID:", v12);

    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsMapTable](self, "cellsMapTable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v12));

      objc_msgSend(v11, "setCurrentTime:", a3);
    }
  }

}

- (void)editingIsInFlight:(BOOL)a3 progress:(float)a4 forUUID:(id)a5
{
  _BOOL8 v6;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  double v15;
  void *v16;
  unsigned int v17;
  id v18;

  v6 = a3;
  v18 = a5;
  if (v6)
  {
    *(float *)&v8 = a4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController editingProgressItems](self, "editingProgressItems"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v18);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController editingProgressItems](self, "editingProgressItems"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v18);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsMapTable](self, "cellsMapTable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v18));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v14 = objc_msgSend(v13, "expandsRecordingsCollectionViewItemOnSelection");

    objc_msgSend(v12, "setEditingInFlight:", v6);
    *(float *)&v15 = a4;
    objc_msgSend(v12, "setEditingProgress:", v15);
    if (!v6)
    {
      if (v14)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));
        v17 = objc_msgSend(v16, "isEqualToString:", v18);

        if (v17)
          -[RCRecordingsCollectionViewController selectItemWithUUID:](self, "selectItemWithUUID:", v18);
      }
    }
  }

}

- (void)performRenameWithNewTitle:(id)a3 forCellWithUUID:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
    objc_msgSend(v8, "performRenameWithNewTitle:forUUID:", v7, v6);

  }
}

- (void)didSelectCellWithUUID:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfNewestRecording](self, "uuidOfNewestRecording"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfNewestRecording](self, "uuidOfNewestRecording"));
    v6 = objc_msgSend(v20, "isEqualToString:", v5);

  }
  else
  {
    v6 = 0;
  }

  if (v20)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfNewestRecording](self, "uuidOfNewestRecording"));
    if (v7)
      v8 = v6;
    else
      v8 = 1;

    if (!v6)
      goto LABEL_14;
  }
  else
  {
    v8 = 1;
    if (!v6)
      goto LABEL_14;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v10 = objc_msgSend(v9, "expandsRecordingsCollectionViewItemOnSelection");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController diffableDataSource](self, "diffableDataSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController diffableDataSource](self, "diffableDataSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "snapshot"));
    objc_msgSend(v11, "applySnapshot:animatingDifferences:", v13, 1);

  }
  -[RCRecordingsCollectionViewController setUuidOfNewestRecording:](self, "setUuidOfNewestRecording:", 0);
  v8 = 0;
LABEL_14:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsMapTable](self, "cellsMapTable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v20));

  if ((v6 & 1) == 0)
  {
    if ((objc_msgSend(v15, "isSelected") & 1) != 0
      || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "configurationState")),
          v17 = objc_msgSend(v16, "isEditing"),
          v16,
          v17))
    {
      v8 = 0;
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  objc_msgSend(v18, "didSelectForUUID:resetPosition:force:", v20, v8, 0);

  if (!-[RCRecordingsCollectionViewController willSelectRecordingAfterExitingEditMode](self, "willSelectRecordingAfterExitingEditMode"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController splitViewController](self, "splitViewController"));
    objc_msgSend(v19, "hidePrimaryColumnIfNeeded");

  }
}

- (void)wasDeselectedForCellWithUUID:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
    objc_msgSend(v5, "wasDeselectedForUUID:", v4);

  }
}

- (void)didEndEditingTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellWhoseTitleIsBeingEdited](self, "cellWhoseTitleIsBeingEdited"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    -[RCRecordingsCollectionViewController setCellWhoseTitleIsBeingEdited:](self, "setCellWhoseTitleIsBeingEdited:", 0);
  }
  else
  {
    v9 = OSLogForCategory(kVMLogCategoryDefault);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10010BCC8(self, (uint64_t)v4, v10);

  }
}

- (id)_uuidForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController dataArray](self, "dataArray"));
  if (!v4)
    goto LABEL_6;
  v6 = 0;
  if (objc_msgSend(v4, "item") != (id)0x7FFFFFFFFFFFFFFFLL && v5)
  {
    v7 = objc_msgSend(v4, "item");
    if (v7 < objc_msgSend(v5, "count"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController dataArray](self, "dataArray"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "item")));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uuid"));

      goto LABEL_7;
    }
LABEL_6:
    v6 = 0;
  }
LABEL_7:

  return v6;
}

- (void)willPresentSearchController:(id)a3
{
  -[RCRecordingsCollectionViewController setIsSearching:](self, "setIsSearching:", 1);
}

- (void)didPresentSearchController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchBar"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchField"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v4, "setTextColor:", v5);

  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchBar"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  -[RCRecordingsCollectionViewController _updateSearchString:](self, "_updateSearchString:", v5);
}

- (void)willDismissSearchController:(id)a3
{
  void *v4;
  void *v5;
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

  -[RCRecordingsCollectionViewController _updateSearchString:](self, "_updateSearchString:", &stru_1001B2BC0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleCells"));

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
        if ((objc_opt_respondsToSelector(v10, "resignFirstResponderForTitleEditing") & 1) != 0)
          objc_msgSend(v10, "resignFirstResponderForTitleEditing");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)didDismissSearchController:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView", a3));
  objc_msgSend(v4, "becomeFirstResponder");

  -[RCRecordingsCollectionViewController setIsSearching:](self, "setIsSearching:", 0);
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  if (!-[RCRecordingsCollectionViewController isSearching](self, "isSearching", a3))
    -[RCRecordingsCollectionViewController setIsSearching:](self, "setIsSearching:", 1);
}

- (void)_updateSearchString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[RCRecordingsCollectionViewController setIsUpdatingSearchString:](self, "setIsUpdatingSearchString:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recordingsDataCoordinator](self, "recordingsDataCoordinator"));
  objc_msgSend(v5, "setSearchString:", v4);

  -[RCRecordingsCollectionViewController setIsUpdatingSearchString:](self, "setIsUpdatingSearchString:", 0);
  -[RCRecordingsCollectionViewController setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration");
}

- (void)_setSearchString:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController searchController](self, "searchController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchBar"));
  objc_msgSend(v5, "setText:", v4);

}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  RCShareableComposition *v12;
  NSItemProvider *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  int64_t v22;
  void *v23;
  int64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v29;
  RCShareableComposition *v30;
  id v31;
  id v32;

  v7 = a4;
  v8 = objc_msgSend(a5, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController dataArray](self, "dataArray"));
  if (v8 >= objc_msgSend(v9, "count"))
    goto LABEL_6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCComposition compositionLoadedForSavedRecording:](RCComposition, "compositionLoadedForSavedRecording:", v10));
  if (!objc_msgSend(v11, "compositionIsShareable"))
  {

LABEL_6:
    v26 = &__NSArray0__struct;
    goto LABEL_11;
  }
  v12 = -[RCShareableComposition initWithComposition:]([RCShareableComposition alloc], "initWithComposition:", v11);
  v13 = objc_opt_new(NSItemProvider);
  v31 = 0;
  v14 = -[RCShareableComposition registerAudioFileRepresentationWithItemProvider:error:](v12, "registerAudioFileRepresentationWithItemProvider:error:", v13, &v31);
  v15 = v31;
  if ((v14 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
    v29 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "url"));
    v30 = v12;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "pathExtension"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingPathExtension:", v18));

    -[NSItemProvider setSuggestedName:](v13, "setSuggestedName:", v19);
    v20 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
    objc_msgSend(v20, "setLocalObject:", v21);

    v22 = -[RCRecordingsCollectionViewController folderType](self, "folderType");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController folderUUID](self, "folderUUID"));
    v24 = v22;
    v15 = v29;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[RCLocalDropContext dropContextWithFolderType:folderUUID:folderIndexPath:payloadType:](RCLocalDropContext, "dropContextWithFolderType:folderUUID:folderIndexPath:payloadType:", v24, v23, 0, 0));

    objc_msgSend(v7, "setLocalContext:", v25);
    v32 = v20;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));

    v12 = v30;
  }
  else
  {
    v27 = OSLogForCategory(kVMLogCategoryDefault);
    v19 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10010BD84();
    v26 = &__NSArray0__struct;
  }

LABEL_11:
  return v26;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler", a3, a4));
  objc_msgSend(v4, "willBeginDragSession");

}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler", a3, a4));
  objc_msgSend(v4, "didEndDragSession");

}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[RCRecordingsCollectionViewController isEditing](self, "isEditing"))
  {
    -[RCRecordingsCollectionViewController _toggleEdit](self, "_toggleEdit");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ENDED_EDITING"), &stru_1001B2BC0, 0));

    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v4);
    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)RCRecordingsCollectionViewController;
    return -[RCRecordingsCollectionViewController accessibilityPerformEscape](&v6, "accessibilityPerformEscape");
  }
}

- (BOOL)selectedCellIsEditingTitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  unsigned __int8 v9;
  BOOL v10;

  v3 = objc_opt_class(RCRecentlyDeletedRecordingsCollectionViewController, a2);
  if ((objc_opt_isKindOfClass(self, v3) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellWhoseTitleIsBeingEdited](self, "cellWhoseTitleIsBeingEdited"));

    if (!v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController recentlyDeletedCollectionViewController](self, "recentlyDeletedCollectionViewController"));
      v9 = objc_msgSend(v6, "selectedCellIsEditingTitle");
      goto LABEL_12;
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellWhoseTitleIsBeingEdited](self, "cellWhoseTitleIsBeingEdited"));
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEditingTitle") & 1) == 0)
  {
    v7 = OSLogForCategory(kVMLogCategoryDefault);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10010BDF0();

  }
  if (objc_msgSend(v6, "isEditingTitle"))
  {
    v9 = objc_msgSend(v6, "isSelected");
LABEL_12:
    v10 = v9;
    goto LABEL_13;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)selectedCellIsInFlightEditing
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController editingProgressItems](self, "editingProgressItems"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v3));

    v6 = v5 != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)editSelectedItemTitle
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  if ((uint64_t)objc_msgSend(v3, "numberOfItemsInSection:", 0) >= 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForSelectedItem"));
    if (v4)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100056114;
      v7[3] = &unk_1001AB6E8;
      v8 = v3;
      v9 = v4;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100056128;
      v5[3] = &unk_1001ABD08;
      v5[4] = self;
      v6 = v9;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v7, v5, 0.3);

    }
  }

}

- (BOOL)canMoveSelectionUp
{
  return -[RCRecordingsCollectionViewController canMoveSelectionInDirection:](self, "canMoveSelectionInDirection:", 0);
}

- (BOOL)canMoveSelectionDown
{
  return -[RCRecordingsCollectionViewController canMoveSelectionInDirection:](self, "canMoveSelectionInDirection:", 1);
}

- (BOOL)canMoveSelectionInDirection:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  char *v9;
  unsigned int v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  if ((objc_msgSend(v5, "isEditing") & 1) == 0
    && (uint64_t)objc_msgSend(v5, "numberOfItemsInSection:", 0) >= 1)
  {
    v6 = -[RCRecordingsCollectionViewController _incrementForDirection:](self, "_incrementForDirection:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForSelectedItem"));
    v8 = v7;
    if (v7)
    {
      v9 = (char *)objc_msgSend(v7, "item") + v6;
      if ((uint64_t)v9 < 0)
        goto LABEL_10;
    }
    else
    {
      v9 = 0;
    }
    if ((uint64_t)v9 < (uint64_t)objc_msgSend(v5, "numberOfItemsInSection:", 0))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v9, 0));
      v10 = !-[RCRecordingsCollectionViewController _isDownloadingAtIndex:](self, "_isDownloadingAtIndex:", v11);

LABEL_11:
      goto LABEL_12;
    }
LABEL_10:
    LOBYTE(v10) = 0;
    goto LABEL_11;
  }
  LOBYTE(v10) = 0;
LABEL_12:

  return v10;
}

- (void)moveSelectionUp
{
  -[RCRecordingsCollectionViewController _moveSelectionInDirection:](self, "_moveSelectionInDirection:", 0);
}

- (void)moveSelectionDown
{
  -[RCRecordingsCollectionViewController _moveSelectionInDirection:](self, "_moveSelectionInDirection:", 1);
}

- (void)_moveSelectionInDirection:(int64_t)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController collectionView](self, "collectionView"));
  if ((uint64_t)objc_msgSend(v12, "numberOfItemsInSection:", 0) >= 1)
  {
    v5 = -[RCRecordingsCollectionViewController _incrementForDirection:](self, "_incrementForDirection:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathForSelectedItem"));
    v7 = v6;
    if (v6)
    {
      v8 = (char *)objc_msgSend(v6, "item") + v5;
      if ((uint64_t)v8 < 0)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v8 = 0;
    }
    if ((uint64_t)v8 < (uint64_t)objc_msgSend(v12, "numberOfItemsInSection:", 0))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v8, 0));
      objc_msgSend(v12, "selectItemAtIndexPath:animated:scrollPosition:", v9, 1, 2);
      if (v7)
      {
        v10 = objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController _uuidForItemAtIndexPath:](self, "_uuidForItemAtIndexPath:", v7));
        if (v10)
        {
          v11 = (void *)v10;
          -[RCRecordingsCollectionViewController wasDeselectedForCellWithUUID:](self, "wasDeselectedForCellWithUUID:", v10);

        }
      }
      -[RCRecordingsCollectionViewController _updateUUIDOfSelectedItem](self, "_updateUUIDOfSelectedItem");

    }
    goto LABEL_11;
  }
LABEL_12:

}

- (int64_t)_incrementForDirection:(int64_t)a3
{
  if (a3)
    return a3 == 1;
  else
    return -1;
}

- (void)_logHashTable
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController cellsMapTable](self, "cellsMapTable"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectEnumerator"));

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
  if (v3)
  {
    v5 = (void *)v3;
    v6 = 0;
    do
    {
      v7 = objc_opt_class(RCRecordingCollectionViewCell, v4);
      if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
        NSLog(CFSTR("cell at index %d has UUID: %@"), v6, v8);

        v6 = (v6 + 1);
      }
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));

      v5 = (void *)v9;
    }
    while (v9);
  }

}

- (RCLibraryEditStateHandler)editStateHandler
{
  return (RCLibraryEditStateHandler *)objc_loadWeakRetained((id *)&self->_editStateHandler);
}

- (int64_t)folderType
{
  return self->_folderType;
}

- (NSString)folderUUID
{
  return self->_folderUUID;
}

- (NSString)userFolderName
{
  return self->_userFolderName;
}

- (void)setUserFolderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)captureIsUnderway
{
  return self->_captureIsUnderway;
}

- (RCFolderSelectionDelegate)folderSelectionDelegate
{
  return (RCFolderSelectionDelegate *)objc_loadWeakRetained((id *)&self->_folderSelectionDelegate);
}

- (void)setViewDidAppearCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)willSelectRecordingAfterExitingEditMode
{
  return self->_willSelectRecordingAfterExitingEditMode;
}

- (void)setWillSelectRecordingAfterExitingEditMode:(BOOL)a3
{
  self->_willSelectRecordingAfterExitingEditMode = a3;
}

- (void)setCellsMapTable:(id)a3
{
  objc_storeStrong((id *)&self->_cellsMapTable, a3);
}

- (void)setCellsHashTable:(id)a3
{
  objc_storeStrong((id *)&self->_cellsHashTable, a3);
}

- (RCRecordingCollectionViewCell)cellWhoseTitleIsBeingEdited
{
  return self->_cellWhoseTitleIsBeingEdited;
}

- (void)setCellWhoseTitleIsBeingEdited:(id)a3
{
  objc_storeStrong((id *)&self->_cellWhoseTitleIsBeingEdited, a3);
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, a3);
}

- (NSHashTable)cellsBeingEditedHashTable
{
  return self->_cellsBeingEditedHashTable;
}

- (void)setCellsBeingEditedHashTable:(id)a3
{
  objc_storeStrong((id *)&self->_cellsBeingEditedHashTable, a3);
}

- (void)setEditingProgressItems:(id)a3
{
  objc_storeStrong((id *)&self->_editingProgressItems, a3);
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (BOOL)inDidSelect
{
  return self->_inDidSelect;
}

- (void)setInDidSelect:(BOOL)a3
{
  self->_inDidSelect = a3;
}

- (BOOL)isUpdatingBottomLayoutForEditing
{
  return self->_isUpdatingBottomLayoutForEditing;
}

- (void)setIsUpdatingBottomLayoutForEditing:(BOOL)a3
{
  self->_isUpdatingBottomLayoutForEditing = a3;
}

- (BOOL)isSelectingCellForFocusUpdate
{
  return self->_isSelectingCellForFocusUpdate;
}

- (void)setIsSelectingCellForFocusUpdate:(BOOL)a3
{
  self->_isSelectingCellForFocusUpdate = a3;
}

- (BOOL)isUpdatingSearchString
{
  return self->_isUpdatingSearchString;
}

- (void)setIsUpdatingSearchString:(BOOL)a3
{
  self->_isUpdatingSearchString = a3;
}

- (BOOL)isSearching
{
  return self->_isSearching;
}

- (NSString)normalRecordingsSearchStringForRestore
{
  return self->_normalRecordingsSearchStringForRestore;
}

- (void)setNormalRecordingsSearchStringForRestore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (RCRecentlyDeletedRecordingsCollectionViewController)recentlyDeletedCollectionViewController
{
  return self->_recentlyDeletedCollectionViewController;
}

- (void)setRecentlyDeletedCollectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyDeletedCollectionViewController, a3);
}

- (NSString)uuidOfNewestRecording
{
  return self->_uuidOfNewestRecording;
}

- (void)setUuidOfNewestRecording:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setUuidOfSelectedItem:(id)a3
{
  objc_storeStrong((id *)&self->_uuidOfSelectedItem, a3);
}

- (void)setRecordingUUIDToEntityInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_recordingUUIDToEntityInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingUUIDToEntityInteraction, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_uuidOfSelectedItem, 0);
  objc_storeStrong((id *)&self->_uuidOfNewestRecording, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedCollectionViewController, 0);
  objc_storeStrong((id *)&self->_normalRecordingsSearchStringForRestore, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_editingProgressItems, 0);
  objc_storeStrong((id *)&self->_cellsBeingEditedHashTable, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_cellWhoseTitleIsBeingEdited, 0);
  objc_storeStrong((id *)&self->_cellsHashTable, 0);
  objc_storeStrong((id *)&self->_cellsMapTable, 0);
  objc_storeStrong(&self->_viewDidAppearCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_folderSelectionDelegate);
  objc_storeStrong((id *)&self->_userFolderName, 0);
  objc_storeStrong((id *)&self->_folderUUID, 0);
  objc_storeStrong((id *)&self->_recordingsDataCoordinator, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_destroyWeak((id *)&self->_editStateHandler);
  objc_destroyWeak((id *)&self->_libraryActionHandler);
}

- (void)removeAppEntityInteractionForCollectionViewCell:(id)a3
{
  id v4;
  RCRecordingsCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000AD3A4(v4);

}

@end
