@implementation PUAlbumListViewController

- (void)setupDropDelegateForCollectionView:(id)a3
{
  id v4;
  PUCollectionsCollectionViewDropDelegate *v5;

  v4 = a3;
  v5 = objc_alloc_init(PUCollectionsCollectionViewDropDelegate);
  -[PUCollectionsCollectionViewDropDelegate setDropDataProvider:](v5, "setDropDataProvider:", self);
  objc_msgSend(v4, "setDropDelegate:", v5);

  -[PUAlbumListViewController setCollectionViewDropDelegate:](self, "setCollectionViewDropDelegate:", v5);
}

- (BOOL)_canDragIn
{
  void *v2;
  char v3;

  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSelectingTargetAlbum") ^ 1;

  return v3;
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PUAlbumListViewController collectionViewDropDelegate](self, "collectionViewDropDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "collectionView:shouldSpringLoadItemAtIndexPath:withContext:", v8, v9, v10);

  if (v12)
  {
    objc_msgSend(v8, "cellForItemAtIndexPath:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "albumListCellContentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "springLoadingTargetView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v10, "setTargetView:", v15);

      }
    }

  }
  return v12;
}

- (id)collectionViewDropDelegate:(id)a3 collectionAtIndexPath:(id)a4
{
  return -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", a4);
}

- (PUAlbumListViewController)initWithSpec:(id)a3 isRootSharedAlbumList:(BOOL)a4
{
  void *v5;
  id v6;
  void *v7;
  PUAlbumListViewController *v8;

  v5 = (void *)MEMORY[0x1E0CD16F8];
  v6 = a3;
  objc_msgSend(v5, "px_deprecated_appPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUAlbumListViewController initWithSpec:dataSourceManager:photoLibrary:](self, "initWithSpec:dataSourceManager:photoLibrary:", v6, 0, v7);

  return v8;
}

- (PUAlbumListViewController)initWithSpec:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PUAlbumListViewController *v7;

  v4 = (void *)MEMORY[0x1E0CD16F8];
  v5 = a3;
  objc_msgSend(v4, "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUAlbumListViewController initWithSpec:dataSourceManager:photoLibrary:](self, "initWithSpec:dataSourceManager:photoLibrary:", v5, 0, v6);

  return v7;
}

- (PUAlbumListViewController)initWithSpec:(id)a3 photoLibrary:(id)a4
{
  return -[PUAlbumListViewController initWithSpec:dataSourceManager:photoLibrary:](self, "initWithSpec:dataSourceManager:photoLibrary:", a3, 0, a4);
}

- (PUAlbumListViewController)initWithSpec:(id)a3 dataSourceManager:(id)a4 photoLibrary:(id)a5
{
  id v9;
  id v10;
  id v11;
  PUAlbumListViewController *v12;
  PUAlbumListViewController *v13;
  uint64_t v14;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  uint64_t v16;
  PXLibraryFilterState *libraryFilterState;
  uint64_t v18;
  PHCachingImageManager *cachingImageManager;
  PXAssetBadgeManager *v20;
  PXAssetBadgeManager *badgeManager;
  void *v22;
  uint64_t v23;
  PXPhotoKitCollectionsDataSourceManagerConfiguration *dataSourceManagerConfiguration;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PUAlbumListViewController;
  v12 = -[PUAlbumListViewController initWithNibName:bundle:](&v26, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a5);
    objc_msgSend(MEMORY[0x1E0D7B970], "sharedLibraryStatusProviderWithPhotoLibrary:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
    sharedLibraryStatusProvider = v13->_sharedLibraryStatusProvider;
    v13->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7B578]), "initWithSharedLibraryStatusProvider:", v13->_sharedLibraryStatusProvider);
    libraryFilterState = v13->_libraryFilterState;
    v13->_libraryFilterState = (PXLibraryFilterState *)v16;

    objc_storeStrong((id *)&v13->_spec, a3);
    v18 = objc_opt_new();
    cachingImageManager = v13->__cachingImageManager;
    v13->__cachingImageManager = (PHCachingImageManager *)v18;

    v20 = (PXAssetBadgeManager *)objc_alloc_init(MEMORY[0x1E0D7B1D8]);
    badgeManager = v13->__badgeManager;
    v13->__badgeManager = v20;

    -[PUAlbumListViewController navigationItem](v13, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "px_setPreferredLargeTitleDisplayMode:", 2);

    -[PUAlbumListViewController _updateAlbumSubtitleFormat](v13, "_updateAlbumSubtitleFormat");
    -[PUAlbumListViewController px_enableExtendedTraitCollection](v13, "px_enableExtendedTraitCollection");
    objc_msgSend(v10, "configuration");
    v23 = objc_claimAutoreleasedReturnValue();
    dataSourceManagerConfiguration = v13->_dataSourceManagerConfiguration;
    v13->_dataSourceManagerConfiguration = (PXPhotoKitCollectionsDataSourceManagerConfiguration *)v23;

    objc_storeStrong((id *)&v13->_dataSourceManager, a4);
    -[PXPhotoKitCollectionsDataSourceManager registerChangeObserver:context:](v13->_dataSourceManager, "registerChangeObserver:context:", v13, PXPhotoKitCollectionsDataSourceManagerObservationContext);
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[PUAlbumListViewController setKeyboardAware:](self, "setKeyboardAware:", 0);
  -[PUSessionInfo removeSessionInfoObserver:](self->_sessionInfo, "removeSessionInfoObserver:", self);
  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:", 0);

  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReorderDelegate:", 0);

  -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataSource:", 0);

  -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", 0);

  v8.receiver = self;
  v8.super_class = (Class)PUAlbumListViewController;
  -[PUAlbumListViewController dealloc](&v8, sel_dealloc);
}

- (PUAlbumListViewControllerSpec)spec
{
  PUAlbumListViewControllerSpec *spec;
  void *v6;

  spec = self->_spec;
  if (!spec)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 431, CFSTR("missing spec"));

    spec = self->_spec;
  }
  return spec;
}

- (BOOL)updateSpec
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  PUAlbumListViewControllerSpec *v6;
  PUAlbumListViewControllerSpec *spec;
  BOOL v8;

  -[PUAlbumListViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "horizontalSizeClass") || !objc_msgSend(v3, "verticalSizeClass"))
    goto LABEL_8;
  +[PUInterfaceManager shouldUsePhoneLayoutWithTraitCollection:](PUInterfaceManager, "shouldUsePhoneLayoutWithTraitCollection:", v3);
  v4 = (objc_class *)objc_opt_class();
  v5 = objc_opt_class();
  if (v5 == objc_opt_class() || v5 == objc_opt_class())
    v4 = (objc_class *)objc_opt_class();
  if (v4 != (objc_class *)v5)
  {
    v6 = (PUAlbumListViewControllerSpec *)objc_alloc_init(v4);
    spec = self->_spec;
    self->_spec = v6;

    v8 = 1;
  }
  else
  {
LABEL_8:
    v8 = 0;
  }

  return v8;
}

- (void)updateInterfaceLayoutIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
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
  double v19;
  double v20;
  double v21;

  if (-[PUAlbumListViewController updateSpec](self, "updateSpec"))
    goto LABEL_9;
  -[PUAlbumListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[PUAlbumListViewController _layoutReferenceSize](self, "_layoutReferenceSize");
  v7 = v6;

  if (v5 != v7)
    goto LABEL_9;
  -[PUAlbumListViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PUAlbumListViewController _layoutSafeAreaInsets](self, "_layoutSafeAreaInsets");
  if (v12 != v20 || v10 != v17 || v16 != v19)
  {

    goto LABEL_9;
  }
  v21 = v18;

  if (v14 != v21)
LABEL_9:
    -[PUAlbumListViewController _updateMainView](self, "_updateMainView");
}

- (id)_doneButtonItem
{
  UIBarButtonItem *doneButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  doneButtonItem = self->_doneButtonItem;
  if (!doneButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__handleDoneButton_);
    v5 = self->_doneButtonItem;
    self->_doneButtonItem = v4;

    doneButtonItem = self->_doneButtonItem;
  }
  return doneButtonItem;
}

- (id)_cancelButtonItem
{
  UIBarButtonItem *cancelButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  cancelButtonItem = self->_cancelButtonItem;
  if (!cancelButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__handleCancelButton_);
    v5 = self->_cancelButtonItem;
    self->_cancelButtonItem = v4;

    cancelButtonItem = self->_cancelButtonItem;
  }
  return cancelButtonItem;
}

- (id)_albumCreationButtonItem
{
  UIBarButtonItem *albumCreationButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  albumCreationButtonItem = self->_albumCreationButtonItem;
  if (!albumCreationButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:primaryAction:", 4, 0);
    v5 = self->_albumCreationButtonItem;
    self->_albumCreationButtonItem = v4;

    if (-[PUAlbumListViewController isRootSharedAlbumList](self, "isRootSharedAlbumList"))
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __53__PUAlbumListViewController__albumCreationButtonItem__block_invoke;
      v21[3] = &unk_1E58A6930;
      v21[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", &stru_1E58AD278, 0, 0, v21);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setPrimaryAction:](self->_albumCreationButtonItem, "setPrimaryAction:", v6);
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0DC39D0];
      v7 = (void *)MEMORY[0x1E0DC3428];
      PULocalizedString(CFSTR("NEW_ALBUM_BUTTON"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.stack.badge.plus"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __53__PUAlbumListViewController__albumCreationButtonItem__block_invoke_2;
      v20[3] = &unk_1E58A6930;
      v20[4] = self;
      objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v6, v8, 0, v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v10;
      v11 = (void *)MEMORY[0x1E0DC3428];
      PULocalizedString(CFSTR("NEW_FOLDER_BUTTON"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("folder.badge.plus"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      v19[1] = 3221225472;
      v19[2] = __53__PUAlbumListViewController__albumCreationButtonItem__block_invoke_3;
      v19[3] = &unk_1E58A6930;
      v19[4] = self;
      objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v12, v13, 0, v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "menuWithTitle:children:", &stru_1E58AD278, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setMenu:](self->_albumCreationButtonItem, "setMenu:", v16);

    }
    albumCreationButtonItem = self->_albumCreationButtonItem;
  }
  return albumCreationButtonItem;
}

- (void)setSessionInfo:(id)a3
{
  PUSessionInfo *v5;
  PUSessionInfo **p_sessionInfo;
  PUSessionInfo *sessionInfo;
  void (**v8)(void);
  void *v9;
  void *v10;
  PUSessionInfo *v11;

  v5 = (PUSessionInfo *)a3;
  p_sessionInfo = &self->_sessionInfo;
  sessionInfo = self->_sessionInfo;
  if (sessionInfo != v5)
  {
    v11 = v5;
    -[PUSessionInfo removeSessionInfoObserver:](sessionInfo, "removeSessionInfoObserver:", self);
    objc_storeStrong((id *)&self->_sessionInfo, a3);
    -[PUSessionInfo addSessionInfoObserver:](*p_sessionInfo, "addSessionInfoObserver:", self);
    -[PUSessionInfo bannerGenerator](*p_sessionInfo, "bannerGenerator");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUAlbumListViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pu_setBanner:", v9);

    -[PUAlbumListViewController _updateAddNewAlbumPlaceholderAnimated:](self, "_updateAddNewAlbumPlaceholderAnimated:", 0);
    -[PUAlbumListViewController _updateInterfaceForModelReloadAnimated:](self, "_updateInterfaceForModelReloadAnimated:", 0);

    v5 = v11;
  }

}

- (void)setCollection:(id)a3
{
  PHCollection *v5;
  PHCollection *collection;
  PHCollection *v7;
  void *v8;
  PHCollection *v9;

  v5 = (PHCollection *)a3;
  collection = self->_collection;
  if (collection != v5)
  {
    v9 = v5;
    v7 = collection;
    objc_storeStrong((id *)&self->_collection, a3);
    if (!v9 || v7)
    {
      if (v9 || !v7)
        goto LABEL_9;
      -[PHCollection photoLibrary](v7, "photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_unregisterChangeObserver:", self);
    }
    else
    {
      -[PHCollection photoLibrary](v9, "photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_registerChangeObserver:", self);
    }

LABEL_9:
    -[PUAlbumListViewController _invalidateTitle](self, "_invalidateTitle");

    v5 = v9;
  }

}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  -[PUAlbumListViewController collection](self, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  if (v3)
  {
    objc_msgSend(v3, "localizedTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "canPerformEditOperation:", 7)
      && (+[PUAlbumListSettings sharedInstance](PUAlbumListSettings, "sharedInstance"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "allowNavigationTitleEditing"),
          v5,
          v6))
    {
      -[PUAlbumListViewController _ensureEditableTitleView](self, "_ensureEditableTitleView");
      -[PUAlbumListViewController editableTitleView](self, "editableTitleView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v4);
    }
    else
    {
      v7 = 0;
    }
    -[PUAlbumListViewController setTitle:](self, "setTitle:", v4);
    -[PUAlbumListViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitleView:", v7);

  }
  else
  {
    -[PUAlbumListViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitleView:", 0);
  }

}

- (void)_ensureEditableTitleView
{
  PXEditableNavigationTitleView *v3;
  PXEditableNavigationTitleView *editableTitleView;

  if (!self->_editableTitleView)
  {
    v3 = (PXEditableNavigationTitleView *)objc_alloc_init(MEMORY[0x1E0D7B3B8]);
    editableTitleView = self->_editableTitleView;
    self->_editableTitleView = v3;

    -[PXEditableNavigationTitleView setDelegate:](self->_editableTitleView, "setDelegate:", self);
  }
}

- (void)setDataSourceManagerConfiguration:(id)a3
{
  PXPhotoKitCollectionsDataSourceManagerConfiguration *v5;
  PXPhotoKitCollectionsDataSource *dataSource;
  PXPhotoKitCollectionsDataSourceManager *v7;
  PXPhotoKitCollectionsDataSourceManager *dataSourceManager;
  PXPhotoKitCollectionsDataSourceManagerConfiguration *v9;

  v5 = (PXPhotoKitCollectionsDataSourceManagerConfiguration *)a3;
  if (self->_dataSourceManagerConfiguration != v5)
  {
    v9 = v5;
    -[PXPhotoKitCollectionsDataSourceManagerConfiguration setAssetTypesToInclude:](v5, "setAssetTypesToInclude:", -[PUAlbumListViewController filteringAssetTypes](self, "filteringAssetTypes"));
    objc_storeStrong((id *)&self->_dataSourceManagerConfiguration, a3);
    -[PXPhotoKitCollectionsDataSourceManager unregisterChangeObserver:context:](self->_dataSourceManager, "unregisterChangeObserver:context:", self, PXPhotoKitCollectionsDataSourceManagerObservationContext);
    dataSource = self->_dataSource;
    self->_dataSource = 0;

    v7 = (PXPhotoKitCollectionsDataSourceManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B708]), "initWithConfiguration:", v9);
    dataSourceManager = self->_dataSourceManager;
    self->_dataSourceManager = v7;

    -[PXPhotoKitCollectionsDataSourceManager registerChangeObserver:context:](self->_dataSourceManager, "registerChangeObserver:context:", self, PXPhotoKitCollectionsDataSourceManagerObservationContext);
    if (-[PUAlbumListViewController px_isVisible](self, "px_isVisible"))
      -[PUAlbumListViewController _updateInterfaceForModelReloadAnimated:](self, "_updateInterfaceForModelReloadAnimated:", 0);
    else
      -[PUAlbumListViewController setViewInSyncWithModel:](self, "setViewInSyncWithModel:", 0);
    v5 = v9;
  }

}

- (PXPhotoKitCollectionsDataSource)dataSource
{
  PXPhotoKitCollectionsDataSource *dataSource;
  void *v4;
  PXPhotoKitCollectionsDataSource *v5;
  PXPhotoKitCollectionsDataSource *v6;

  dataSource = self->_dataSource;
  if (!dataSource)
  {
    -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSource");
    v5 = (PXPhotoKitCollectionsDataSource *)objc_claimAutoreleasedReturnValue();
    v6 = self->_dataSource;
    self->_dataSource = v5;

    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (unint64_t)filteringAssetTypes
{
  return -1;
}

- (id)assetsFilterPredicate
{
  return 0;
}

- (PUAlbumListCell)focusedListCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_5;
  }
  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isDescendantOfView:", v6);

  if (!v7)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v8 = v4;
LABEL_6:

  return (PUAlbumListCell *)v8;
}

- (BOOL)isRootFolder
{
  return -[PXPhotoKitCollectionsDataSourceManagerConfiguration separateSectionsForSmartAndUserCollections](self->_dataSourceManagerConfiguration, "separateSectionsForSmartAndUserCollections");
}

- (BOOL)isRootSharedAlbumList
{
  void *v2;
  char v3;

  -[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionList](self->_dataSourceManagerConfiguration, "collectionList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "px_isSharedAlbumsFolder");

  return v3;
}

- (id)_assetsFetchOptions
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CD1570], "px_standardFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController assetsFilterPredicate](self, "assetsFilterPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInternalPredicate:", v4);

  return v3;
}

- (PHImageRequestOptions)_imageRequestOptions
{
  PHImageRequestOptions *imageRequestOptions;
  PHImageRequestOptions *v4;
  PHImageRequestOptions *v5;

  imageRequestOptions = self->__imageRequestOptions;
  if (!imageRequestOptions)
  {
    v4 = (PHImageRequestOptions *)objc_alloc_init(MEMORY[0x1E0CD15A8]);
    -[PHImageRequestOptions setAllowPlaceholder:](v4, "setAllowPlaceholder:", 1);
    -[PHImageRequestOptions setNetworkAccessAllowed:](v4, "setNetworkAccessAllowed:", 1);
    -[PHImageRequestOptions setDeliveryMode:](v4, "setDeliveryMode:", 0);
    v5 = self->__imageRequestOptions;
    self->__imageRequestOptions = v4;

    imageRequestOptions = self->__imageRequestOptions;
  }
  return imageRequestOptions;
}

- (BOOL)_canTransitionInteractivelyToCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(self) = objc_msgSend(v6, "containsAnyAssets:", v5);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      LODWORD(self) = objc_msgSend(v4, "px_isFolder") ^ 1;
    else
      LOBYTE(self) = 1;
  }

  return (char)self;
}

- (unint64_t)_unfilteredIndexForFilteredIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionsFetchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  return v7;
}

- (void)_updateInterfaceForModelReloadAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PUAlbumListViewController _resetPreheating](self, "_resetPreheating");
  -[PUAlbumListViewController reloadContentView](self, "reloadContentView");
  -[PUAlbumListViewController _updatePeripheralInterfaceAnimated:](self, "_updatePeripheralInterfaceAnimated:", v3);
  -[PUAlbumListViewController setViewInSyncWithModel:](self, "setViewInSyncWithModel:", 1);
  -[PUAlbumListViewController _updatePreheatedAssets](self, "_updatePreheatedAssets");
}

- (BOOL)_updateInterfaceForIncrementalModelChangeHandler:(id)a3 withSectionedChangeDetails:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v24 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "deletedItemsIndexPaths");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertedItemsIndexPaths");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedItemsIndexPaths");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentItemsChangedIndexPaths");
  v10 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v10;
  objc_msgSend(v11, "addObjectsFromArray:", v10);
  if (objc_msgSend(v7, "hasMoves"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __114__PUAlbumListViewController__updateInterfaceForIncrementalModelChangeHandler_withSectionedChangeDetails_animated___block_invoke;
    v27[3] = &unk_1E589BE40;
    v14 = v12;
    v28 = v14;
    v15 = v13;
    v29 = v15;
    objc_msgSend(v7, "enumerateMovedIndexPathsUsingBlock:", v27);

  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  objc_msgSend(v7, "deletedSections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertedSections");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changedSections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v21 = v11;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController _performBatchUpdates:withDeletedSections:insertedSections:changedSections:deletedItemsIndexPaths:insertedItemsIndexPaths:changedItemsIndexPaths:movedItemsFromIndexPaths:movedItemsToIndexPaths:completionHandler:](self, "_performBatchUpdates:withDeletedSections:insertedSections:changedSections:deletedItemsIndexPaths:insertedItemsIndexPaths:changedItemsIndexPaths:movedItemsFromIndexPaths:movedItemsToIndexPaths:completionHandler:", v8, v16, v17, v18, v26, v25, v19, v14, v15, 0);

  -[PUAlbumListViewController _updatePeripheralInterfaceAnimated:](self, "_updatePeripheralInterfaceAnimated:", v24);
  -[PUAlbumListViewController setViewInSyncWithModel:](self, "setViewInSyncWithModel:", 1);
  -[PUAlbumListViewController _updatePreheatedAssets](self, "_updatePreheatedAssets");

  return 1;
}

- (void)updateNavigationBarAnimated:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  char v31;
  unsigned int v32;
  void *v33;
  int v34;
  id v35;

  v3 = a3;
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canEditAlbums");

  v34 = -[PUAlbumListViewController isEditing](self, "isEditing");
  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSelectingAssets");

  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSelectingTargetAlbum");

  -[PUAlbumListViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "indexOfObject:", self))
  {
    -[PUAlbumListViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hidesBackButton");

  }
  else
  {
    v14 = 1;
  }

  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isForAssetPicker");

  -[PUAlbumListViewController title](self, "title");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "promptLocation");

  if (v18)
  {
    v19 = 0;
  }
  else
  {
    -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedPrompt");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v21 = 0;
  if ((v6 ^ 1 | v8 | v10) != 1 && v14 | v34)
  {
    -[PUAlbumListViewController _albumCreationButtonItem](self, "_albumCreationButtonItem");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[PUAlbumListViewController navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v16 & 1) == 0)
  {
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PUAlbumListViewController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v24;
    if (!-[PUAlbumListViewController isRootSharedAlbumList](self, "isRootSharedAlbumList")
      && objc_msgSend(v24, "hasSharedLibraryOrPreview"))
    {
      -[PUAlbumListViewController libraryFilterState](self, "libraryFilterState");
      v32 = v3;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hasPreview");
      PXSharedLibrarySwitchLibraryButtonItems();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObjectsFromArray:", v26);

      v3 = v32;
    }
    if (v8)
    {
      -[PUAlbumListViewController _doneButtonItem](self, "_doneButtonItem");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else if (v10)
    {
      -[PUAlbumListViewController _cancelButtonItem](self, "_cancelButtonItem");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v34 && !v6)
        goto LABEL_22;
      -[PUAlbumListViewController editButtonItem](self, "editButtonItem");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)v27;
    objc_msgSend(v23, "addObject:", v27);

LABEL_22:
    objc_msgSend(v22, "leftBarButtonItem");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (v29 == v21)
    {

    }
    else
    {
      v30 = v29;
      v31 = objc_msgSend(v29, "isEqual:", v21);

      if ((v31 & 1) == 0)
        objc_msgSend(v22, "setLeftBarButtonItem:animated:", v21, v3);
    }
    objc_msgSend(v22, "setRightBarButtonItems:animated:", v23, v3);

  }
  objc_msgSend(v22, "setPrompt:", v19);
  objc_msgSend(v22, "setTitle:", v35);

}

- (BOOL)showsEmptyPlaceholderWhenEmpty
{
  return 1;
}

- (BOOL)shouldEnableCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceAlbum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "targetAlbum");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "isEqual:", v9);

    if ((v10 & 1) != 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isSelectingTargetAlbum"))
    {
      v7 = 1;
      goto LABEL_4;
    }
    -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "allowSelectingNonEditableAlbums") & 1) != 0)
      v7 = 1;
    else
      v7 = objc_msgSend(v4, "canPerformEditOperation:", 3);
  }

LABEL_4:
LABEL_7:

  return v7;
}

- (unint64_t)_editCapabilitiesForAlbum:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v9;

  v4 = a3;
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canDeleteCollection:", v4);
  if (objc_msgSend(v5, "canRenameCollection:", v4))
    v7 = v6 | 2;
  else
    v7 = v6;
  v8 = objc_msgSend(v5, "canReorderCollection:", v4);

  if (v8)
    v9 = v7 | 4;
  else
    v9 = v7;

  return v9;
}

- (BOOL)_someAlbumSupportsEditing
{
  PUAlbumListViewController *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PUAlbumListViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PUAlbumListViewController__someAlbumSupportsEditing__block_invoke;
  v5[3] = &unk_1E589BE68;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "enumerateCollectionsUsingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)_preparedStackViewAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[PUAlbumListViewController _preparedAlbumListCellContentViewAtIndexPath:](self, "_preparedAlbumListCellContentViewAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_preparedStackViewForCollection:(id)a3
{
  void *v4;
  void *v5;

  -[PUAlbumListViewController indexPathForCollection:](self, "indexPathForCollection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController _preparedStackViewAtIndexPath:](self, "_preparedStackViewAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)indexPathForCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PUAlbumListViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v6, "item"), -[PUAlbumListViewController albumsSections](self, "albumsSections") + objc_msgSend(v6, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)collectionAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[PUAlbumListViewController albumsSections](self, "albumsSections");
  v7 = v6;
  v8 = objc_msgSend(v4, "section");
  v9 = 0;
  if (v8 >= v5 && v8 - v5 < v7)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v4, "item"), objc_msgSend(v4, "section") - v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionAtIndexPath:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)reloadContentView
{
  void *v3;
  id v4;

  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)scrollToItemAtIndexPath:(id)a3 centered:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v5 = a5;
  v6 = a4;
  v14 = a3;
  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (v6)
      v10 = 18;
    else
      v10 = 0;
    objc_msgSend(v8, "scrollToItemAtIndexPath:atScrollPosition:animated:", v14, v10, v5);
  }
  -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (v6)
      v13 = 2;
    else
      v13 = 0;
    objc_msgSend(v11, "scrollToRowAtIndexPath:atScrollPosition:animated:", v14, v13, v5);
  }

}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectItemAtIndexPath:animated:scrollPosition:", v6, v4, 0);
  -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectRowAtIndexPath:animated:scrollPosition:", v6, v4, 0);

}

- (void)deselectSelectedItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "indexPathsForSelectedItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "deselectItemAtIndexPath:animated:", v6, v3);
  }
  -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "indexPathForSelectedRow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v9, v3);

  }
}

- (id)mainScrollView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)_visiblyInsertItemAtIndexPath:(id)a3 modelUpdate:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  PUAlbumListViewController *v20;
  id v21;
  id v22;
  void (**v23)(_QWORD);
  _QWORD v24[5];
  id v25;
  id v26;
  void (**v27)(_QWORD);
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD))a4;
  v10 = (void (**)(_QWORD))a5;
  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __89__PUAlbumListViewController__visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke;
    v24[3] = &unk_1E58A5C48;
    v24[4] = self;
    v27 = v9;
    v25 = v11;
    v26 = v8;
    v16 = v12;
    v17 = 3221225472;
    v18 = __89__PUAlbumListViewController__visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke_2;
    v19 = &unk_1E589BE90;
    v20 = self;
    v21 = v26;
    v22 = v25;
    v23 = v10;
    objc_msgSend(v22, "performBatchUpdates:completion:", v24, &v16);

  }
  -[PUAlbumListViewController _mainTableView](self, "_mainTableView", v16, v17, v18, v19, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v8 && v13)
  {
    objc_msgSend(v13, "beginUpdates");
    if (v9)
      v9[2](v9);
    v28[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertRowsAtIndexPaths:withRowAnimation:", v15, 0);

    objc_msgSend(v14, "endUpdates");
    -[PUAlbumListViewController scrollToItemAtIndexPath:centered:animated:](self, "scrollToItemAtIndexPath:centered:animated:", v8, 1, 1);
    if (v10)
      v10[2](v10);
  }

}

- (void)_performBatchUpdates:(id)a3 withDeletedSections:(id)a4 insertedSections:(id)a5 changedSections:(id)a6 deletedItemsIndexPaths:(id)a7 insertedItemsIndexPaths:(id)a8 changedItemsIndexPaths:(id)a9 movedItemsFromIndexPaths:(id)a10 movedItemsToIndexPaths:(id)a11 completionHandler:(id)a12
{
  id v18;
  id v19;
  id v20;
  char v21;
  void (**v22)(_QWORD);
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  id v43;
  void (**v44)(_QWORD);
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  PUAlbumListViewController *v59;
  id v60;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  void (**v69)(_QWORD);
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v44 = (void (**)(_QWORD))a3;
  v18 = a4;
  v19 = a5;
  v43 = a6;
  v48 = a7;
  v46 = a8;
  v49 = a9;
  v47 = a10;
  v45 = a11;
  v20 = a12;
  if (objc_msgSend(v18, "count"))
  {
    v21 = 1;
    v22 = v44;
  }
  else
  {
    v22 = v44;
    if (objc_msgSend(v19, "count")
      || objc_msgSend(v43, "count")
      || objc_msgSend(v48, "count")
      || (v23 = v46, objc_msgSend(v46, "count"))
      || objc_msgSend(v47, "count")
      || objc_msgSend(v45, "count"))
    {
      v21 = 1;
    }
    else
    {
      v33 = v48;
      if (!objc_msgSend(v49, "count"))
        goto LABEL_56;
      v21 = 0;
    }
  }
  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    if ((v21 & 1) != 0)
    {
      v25 = MEMORY[0x1E0C809B0];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke;
      v61[3] = &unk_1E589BEE0;
      v61[4] = self;
      v69 = v22;
      v62 = v24;
      v63 = v18;
      v64 = v19;
      v65 = v48;
      v66 = v46;
      v67 = v47;
      v68 = v45;
      v57[0] = v25;
      v57[1] = 3221225472;
      v57[2] = __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke_3;
      v57[3] = &unk_1E58A6BF8;
      v58 = v49;
      v59 = self;
      v60 = v20;
      objc_msgSend(v62, "performBatchUpdates:completion:", v61, v57);

    }
    else
    {
      v26 = v19;
      if (v22)
        v22[2](v22);
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v27 = v49;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v71;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v71 != v30)
              objc_enumerationMutation(v27);
            -[PUAlbumListViewController updateListCellForItemAtIndexPath:animated:](self, "updateListCellForItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i), 1);
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
        }
        while (v29);
      }

      v19 = v26;
      if (v20)
        (*((void (**)(id, uint64_t))v20 + 2))(v20, 1);
    }
  }
  -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v48;
  v23 = v46;
  if (v32)
  {
    v34 = -[PUAlbumListViewController _ignoredReorderNotificationCount](self, "_ignoredReorderNotificationCount");
    v35 = v34 - 1;
    if (v34 >= 1 && !objc_msgSend(v48, "count") && !objc_msgSend(v46, "count") && !objc_msgSend(v49, "count"))
    {
      -[PUAlbumListViewController _setIgnoredReorderNotificationCount:](self, "_setIgnoredReorderNotificationCount:", v35);
      if (!v20)
        goto LABEL_55;
      goto LABEL_54;
    }
    if (v22)
    {
      objc_msgSend(v32, "beginUpdates");
      v22[2](v22);
    }
    else
    {
      if (!objc_msgSend(v48, "count")
        && !objc_msgSend(v46, "count")
        && !objc_msgSend(v47, "count")
        && !objc_msgSend(v18, "count")
        && !objc_msgSend(v19, "count"))
      {
        goto LABEL_46;
      }
      objc_msgSend(v32, "beginUpdates");
    }
    if (objc_msgSend(v18, "count"))
      objc_msgSend(v32, "deleteSections:withRowAnimation:", v18, 0);
    if (objc_msgSend(v19, "count"))
      objc_msgSend(v32, "insertSections:withRowAnimation:", v19, 0);
    if (objc_msgSend(v48, "count"))
      objc_msgSend(v32, "deleteRowsAtIndexPaths:withRowAnimation:", v48, 0);
    if (objc_msgSend(v46, "count"))
      objc_msgSend(v32, "insertRowsAtIndexPaths:withRowAnimation:", v46, 0);
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke_4;
    v54[3] = &unk_1E589BEB8;
    v55 = v45;
    v36 = v32;
    v56 = v36;
    objc_msgSend(v47, "enumerateObjectsUsingBlock:", v54);
    objc_msgSend(v36, "endUpdates");

LABEL_46:
    v37 = v19;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v38 = v49;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v74, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v51 != v41)
            objc_enumerationMutation(v38);
          -[PUAlbumListViewController updateListCellForItemAtIndexPath:animated:](self, "updateListCellForItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j), 1);
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v50, v74, 16);
      }
      while (v40);
    }

    v22 = v44;
    v19 = v37;
    v33 = v48;
    v23 = v46;
    if (!v20)
      goto LABEL_55;
LABEL_54:
    (*((void (**)(id, uint64_t))v20 + 2))(v20, 1);
  }
LABEL_55:

LABEL_56:
}

- (void)_enumerateIndexPathsForPreparedItemsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPrefetchingEnabled");
  objc_msgSend(v5, "setPrefetchingEnabled:", 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PUAlbumListViewController indexPathsForVisibleItems](self, "indexPathsForVisibleItems", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "setPrefetchingEnabled:", v6);
}

- (id)indexPathsForVisibleItems
{
  void *v3;
  void *v4;
  void *v5;

  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathsForVisibleItems");
  }
  else
  {
    -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathsForVisibleRows");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)indexPathForItemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);
  }
  else
  {
    -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathForRowAtPoint:", x, y);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)indexPathsForItemsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PUAlbumListViewController _mainCollectionViewLayout](self, "_mainCollectionViewLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetIndexPathsForElementsInRect:", x, y, width, height);
  }
  else
  {
    -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathsForRowsInRect:", x, y, width, height);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)indexPathForAlbumListCellContentView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v4, "isDescendantOfView:", v10))
        {
          -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "indexPathForCell:", v10);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PUAlbumListViewController _mainTableView](self, "_mainTableView", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "visibleCells");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    while (2)
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        if (objc_msgSend(v4, "isDescendantOfView:", v18))
        {
          -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "indexPathForCell:", v18);
          v20 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v20;
          goto LABEL_21;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_21:

  return v7;
}

- (id)_preparedAlbumListCellContentViewAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  if (v4)
  {
    -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "albumListCellContentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "cellForRowAtIndexPath:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "viewWithTag:", 236897);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)canShowSyncProgress
{
  return 1;
}

- (void)_updatePeripheralInterfaceAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[PUAlbumListViewController _updateEmptyPlaceholder](self, "_updateEmptyPlaceholder");
  -[PUAlbumListViewController updateNavigationBarAnimated:](self, "updateNavigationBarAnimated:", v3);
  -[PUAlbumListViewController _updateNavigationBannerAnimated:](self, "_updateNavigationBannerAnimated:", v3);
}

- (id)_pickerBannerView
{
  void *v2;
  void *v3;
  void *v4;

  -[PUAlbumListViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pu_banner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "bannerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_updateNavigationBannerAnimated:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController _pickerBannerView](self, "_pickerBannerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (objc_msgSend(v5, "promptLocation") == 1)
    {
      objc_msgSend(v5, "localizedPrompt");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    if (objc_msgSend(v5, "isSelectingTargetAlbum"))
    {
      objc_msgSend(v5, "transferredAssets");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    if (objc_msgSend(v8, "count"))
    {
      v22 = v7;
      v23 = v3;
      v24 = v5;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v21 = v8;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v26;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v26 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v14);
            objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser", v21);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "indexSheetUnbakedFormat");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "imageWithFormat:", objc_msgSend(v17, "formatID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
              objc_msgSend(v9, "addObject:", v18);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v12);
      }

      if (objc_msgSend(v9, "count"))
        v19 = v9;
      else
        v19 = 0;
      v20 = v19;

      v5 = v24;
      v3 = v23;
      v8 = v21;
      v7 = v22;
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v6, "setTitle:", v7, v21);
    objc_msgSend(v6, "setImages:", v20);
    objc_msgSend(v6, "setLeftView:animated:", 0, v3);
    objc_msgSend(v6, "setRightView:animated:", 0, v3);

  }
}

- (void)_updateEmptyPlaceholder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[PUAlbumListViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (-[PUAlbumListViewController isEmpty](self, "isEmpty")
      && -[PUAlbumListViewController showsEmptyPlaceholderWhenEmpty](self, "showsEmptyPlaceholderWhenEmpty"))
    {
      -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "collectionList");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "px_isFolder")
        && (objc_msgSend(v11, "px_isSmartFolder") & 1) == 0
        && !-[PUAlbumListViewController isRootFolder](self, "isRootFolder"))
      {
        -[PUAlbumListViewController isRootSharedAlbumList](self, "isRootSharedAlbumList");
      }
      -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "collectionsFetchResult");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PXPhotoKitLocalizedTitleForEmptyCollectionListFetchResult();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setText:", v7);

      objc_msgSend(v4, "collectionsFetchResult");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PXPhotoKitLocalizedMessageForEmptyCollectionListFetchResult();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSecondaryText:", v10);

      -[PUAlbumListViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v5);
    }
    else
    {
      -[PUAlbumListViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
    }
  }
}

- (BOOL)showAddNewAlbumPlaceholder
{
  return self->_showAddNewAlbumPlaceholder;
}

- (void)_updateAddNewAlbumPlaceholderAnimated:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isSelectingTargetAlbum")
    && !-[PUAlbumListViewController _aboutToCreateAlbum](self, "_aboutToCreateAlbum"))
  {
    v5 = objc_msgSend(v10, "excludesNewAlbumCreation") ^ 1;
  }
  else
  {
    v5 = 0;
  }
  if (self->_showAddNewAlbumPlaceholder != v5)
  {
    -[PUAlbumListViewController indexPathForAddNewAlbumPlaceholder](self, "indexPathForAddNewAlbumPlaceholder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_showAddNewAlbumPlaceholder = v5;
    -[PUAlbumListViewController indexPathForAddNewAlbumPlaceholder](self, "indexPathForAddNewAlbumPlaceholder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7
      || (objc_msgSend(v6, "isEqual:", v7) & 1) != 0
      || !-[PUAlbumListViewController isViewInSyncWithModel](self, "isViewInSyncWithModel"))
    {
      goto LABEL_17;
    }
    if (!v3)
    {
      -[PUAlbumListViewController reloadContentView](self, "reloadContentView");
LABEL_17:

      goto LABEL_18;
    }
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
LABEL_12:
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
        -[PUAlbumListViewController _performBatchUpdates:withDeletedSections:insertedSections:changedSections:deletedItemsIndexPaths:insertedItemsIndexPaths:changedItemsIndexPaths:movedItemsFromIndexPaths:movedItemsToIndexPaths:completionHandler:](self, "_performBatchUpdates:withDeletedSections:insertedSections:changedSections:deletedItemsIndexPaths:insertedItemsIndexPaths:changedItemsIndexPaths:movedItemsFromIndexPaths:movedItemsToIndexPaths:completionHandler:", 0, 0, 0, 0, v8, v9, 0, 0, 0, 0);

        goto LABEL_17;
      }
    }
    else
    {
      v8 = 0;
      if (v7)
        goto LABEL_12;
    }
    v9 = 0;
    goto LABEL_16;
  }
LABEL_18:

}

- (void)updateListCellForItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (-[PUAlbumListViewController isPlaceholderAtIndexPath:](self, "isPlaceholderAtIndexPath:"))
  {
    -[PUAlbumListViewController _preparedPlaceholderListCellContentViewAtIndexPath:](self, "_preparedPlaceholderListCellContentViewAtIndexPath:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[PUAlbumListViewController updatePlaceholderListCellContentView:forItemAtIndexPath:animated:](self, "updatePlaceholderListCellContentView:forItemAtIndexPath:animated:", v6, v7, v4);
  }
  else
  {
    -[PUAlbumListViewController _preparedAlbumListCellContentViewAtIndexPath:](self, "_preparedAlbumListCellContentViewAtIndexPath:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[PUAlbumListViewController updateAlbumListCellContentView:forItemAtIndexPath:animated:](self, "updateAlbumListCellContentView:forItemAtIndexPath:animated:", v6, v7, v4);
  }

}

- (void)updateAlbumListCellContentView:(id)a3 forItemAtIndexPath:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v5 = a5;
  v8 = a3;
  -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEditCapabilities:animated:", -[PUAlbumListViewController _editCapabilitiesForAlbum:](self, "_editCapabilitiesForAlbum:", v9), v5);
  objc_msgSend(v8, "setEnabled:animated:", -[PUAlbumListViewController shouldEnableCollection:](self, "shouldEnableCollection:", v9), v5);
  -[PUAlbumListViewController spec](self, "spec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "cellContentViewLayout");

  objc_msgSend(v8, "setLayout:", v11);
  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "showCheckmarkOnSourceAlbum") & 1) != 0)
  {
    objc_msgSend(v12, "sourceAlbum");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShowsCheckmarkView:", objc_msgSend(v13, "isEqual:", v9));

  }
  else
  {
    objc_msgSend(v8, "setShowsCheckmarkView:", 0);
  }
  objc_msgSend(v8, "stackView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  -[PUAlbumListViewController _visibleAssetsForCollection:correspondingCollections:](self, "_visibleAssetsForCollection:correspondingCollections:", v9, &v31);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v31;
  if (!v15)
  {
    if (!objc_msgSend(v9, "px_isMacSyncedFacesFolder"))
      goto LABEL_10;
LABEL_9:
    -[PUAlbumListViewController _updateStackView:forFaces:inCollection:withCustomEmptyPlaceholderImage:](self, "_updateStackView:forFaces:inCollection:withCustomEmptyPlaceholderImage:", v14, v15, v9, 0);
    goto LABEL_19;
  }
  v17 = objc_msgSend(v15, "count");
  if ((objc_msgSend(v9, "px_isMacSyncedFacesFolder") & 1) != 0)
    goto LABEL_9;
  if (v17)
  {
    v18 = 0;
    goto LABEL_14;
  }
LABEL_10:
  -[PUAlbumListViewController spec](self, "spec", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v9, "px_isSharedAlbum");
  objc_msgSend(v8, "window");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v19, "emptySharedAlbumPlaceholderImageForWindow:", v21);
  else
    objc_msgSend(v19, "emptyAlbumPlaceholderImageForWindow:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v30;
LABEL_14:
  -[PUAlbumListViewController _updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:](self, "_updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:", v14, v15, v9, v18);
  if (objc_msgSend(v9, "px_isSharedAlbum")
    && -[PUAlbumListViewController canShowAvatarViews](self, "canShowAvatarViews"))
  {
    objc_msgSend(v8, "setShowsAvatarView:", 1);
    objc_msgSend(v8, "avatarView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSharedAlbumCollection:", v9);

  }
  else
  {
    objc_msgSend(v8, "setShowsAvatarView:", 0);
  }

LABEL_19:
  -[PUAlbumListViewController spec](self, "spec");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "showsDeleteButtonOnCellContentView");

  objc_msgSend(v8, "setShowsDeleteButtonWhenEditing:", v24);
  objc_msgSend(v8, "setEditing:animated:", -[PUAlbumListViewController isEditing](self, "isEditing"), v5);
  -[PUAlbumListViewController setTitleForCell:withCollection:](self, "setTitleForCell:withCollection:", v8, v9);
  -[PUAlbumListViewController subtitleForCollection:](self, "subtitleForCollection:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSubtitle:animated:", v25, v5);
  -[PUAlbumListViewController _fontManager](self, "_fontManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "albumListTitleLabelFont");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleFont:", v27);

  -[PUAlbumListViewController _fontManager](self, "_fontManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "albumListSubtitleLabelFont");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSubtitleFont:", v29);

}

- (void)setTitleForCell:(id)a3 withCollection:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a4, "localizedTitle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

}

- (void)updatePlaceholderListCellContentView:(id)a3 forItemAtIndexPath:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  int64_t v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
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
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  PXPlacesAlbumCoverProvider *v58;
  PXPlacesAlbumCoverProvider *placesAlbumCoverProvider;
  void *v60;
  void *v61;
  id v62;
  __int128 v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  dispatch_time_t v71;
  NSObject *v72;
  PUCollageView *aggregateCollageView;
  PUCollageView *v74;
  PUCollageView *v75;
  PUCollageView *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  _BOOL4 v87;
  _QWORD v88[4];
  id v89;
  _QWORD aBlock[4];
  id v91;
  id v92;
  uint64_t *v93;
  id v94[2];
  _QWORD block[4];
  id v96;
  id v97;
  uint64_t *v98;
  id v99;
  _QWORD v100[4];
  id v101;
  id v102[2];
  _OWORD from[2];
  __int128 location;
  __int128 v105;
  uint64_t v106;
  id *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;

  v87 = a5;
  v8 = a3;
  v9 = a4;
  v106 = 0;
  v107 = (id *)&v106;
  v108 = 0x3032000000;
  v109 = __Block_byref_object_copy__8859;
  v110 = __Block_byref_object_dispose__8860;
  v111 = 0;
  v10 = -[PUAlbumListViewController placeholderKindAtIndexPath:](self, "placeholderKindAtIndexPath:", v9);
  objc_msgSend(v8, "stackView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v10)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 1323, CFSTR("undefined placeholder"));
      v12 = 0;
      v13 = 0;
      v14 = 0;
      goto LABEL_45;
    case 1:
      if (-[PUAlbumListViewController isRootSharedAlbumList](self, "isRootSharedAlbumList"))
      {
        PULocalizedString(CFSTR("ALBUM_LIST_CREATE_NEW_SHARED_ALBUM_PLACEHOLDER_TITLE"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[PUAlbumListViewController spec](self, "spec");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "emptySharedAlbumPlaceholderImageForWindow:", v16);
      }
      else
      {
        PULocalizedString(CFSTR("ALBUM_LIST_CREATE_NEW_ALBUM_PLACEHOLDER_TITLE"));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[PUAlbumListViewController spec](self, "spec");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "emptyAlbumPlaceholderImageForWindow:", v16);
      }
      v11 = (id)objc_claimAutoreleasedReturnValue();

      -[PUAlbumListViewController _updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:](self, "_updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:", v86, 0, 0, v11);
      objc_msgSend(v8, "setCustomImageView:", 0);
      v12 = 0;
      v13 = 0;
      goto LABEL_45;
    case 2:
      -[PUAlbumListViewController spec](self, "spec");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "shouldUseCollageForCloudFeedPlaceholder");

      location = 0u;
      v105 = 0u;
      -[PUAlbumListViewController dataSource](self, "dataSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        objc_msgSend(v19, "firstItemIndexPath");
      }
      else
      {
        location = 0u;
        v105 = 0u;
      }

      if ((_QWORD)location == *MEMORY[0x1E0D7CE28])
        goto LABEL_32;
      -[PUAlbumListViewController dataSource](self, "dataSource");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      from[0] = location;
      from[1] = v105;
      objc_msgSend(v69, "objectAtIndexPath:", from);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v11)
        {
          if (!v18)
          {
            -[PUAlbumListViewController _visibleAssetsForCollection:](self, "_visibleAssetsForCollection:", v11);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_43;
          }
          -[PUAlbumListViewController _visibleAssetsForCollection:maximumNumberOfVisibleAssets:correspondingCollections:](self, "_visibleAssetsForCollection:maximumNumberOfVisibleAssets:correspondingCollections:", v11, +[PUCollageView maximumNumberOfItems](PUCollageView, "maximumNumberOfItems"), 0);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        }
      }
      else
      {

      }
LABEL_32:
      v70 = 0;
      v11 = 0;
      if (!v18)
      {
LABEL_43:
        -[PUAlbumListViewController spec](self, "spec");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "window");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "emptyAlbumPlaceholderImageForWindow:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUAlbumListViewController _updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:](self, "_updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:", v86, v70, 0, v81);
        objc_msgSend(v8, "setCustomImageView:", 0);

        goto LABEL_44;
      }
LABEL_33:
      if (!objc_msgSend(v70, "count"))
        goto LABEL_43;
      aggregateCollageView = self->_aggregateCollageView;
      if (!aggregateCollageView)
      {
        v74 = [PUCollageView alloc];
        v75 = -[PUCollageView initWithFrame:](v74, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v76 = self->_aggregateCollageView;
        self->_aggregateCollageView = v75;

        aggregateCollageView = self->_aggregateCollageView;
      }
      -[PUAlbumListViewController _updateCollageView:forAssets:](self, "_updateCollageView:forAssets:", aggregateCollageView, v70);
      objc_msgSend(v8, "setCustomImageView:", self->_aggregateCollageView);
LABEL_44:
      PULocalizedString(CFSTR("ALL_PHOTOS_IN_FOLDER"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      v13 = 0;
LABEL_45:

LABEL_46:
      -[PUAlbumListViewController spec](self, "spec");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLayout:", objc_msgSend(v82, "cellContentViewLayout"));

      objc_msgSend(v8, "setTitle:", v14);
      objc_msgSend(v8, "setSubtitle:", v107[5]);
      objc_msgSend(v8, "setEditCapabilities:", 0);
      objc_msgSend(v8, "setEditing:animated:", -[PUAlbumListViewController isEditing](self, "isEditing"), v87);
      objc_msgSend(v8, "setEnabled:animated:", 1, v87);
      objc_msgSend(v8, "setTitleFont:", v13);
      objc_msgSend(v8, "setSubtitleFont:", v12);

      _Block_object_dispose(&v106, 8);
      return;
    case 3:
      -[PUAlbumListViewController _keyAssetsForMoments](self, "_keyAssetsForMoments");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[PUAlbumListViewController spec](self, "spec");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "window");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "emptyAlbumPlaceholderImageForWindow:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUAlbumListViewController _updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:](self, "_updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:", v86, v11, 0, v23);
      objc_msgSend(v8, "setCustomImageView:", 0);
      PULocalizedString(CFSTR("ALL_PHOTOS_IN_LIBRARY"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumListViewController _fontManager](self, "_fontManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "albumListTitleLabelFont");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      goto LABEL_45;
    case 4:
      -[PUAlbumListViewController collection](self, "collection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "photoLibrary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "px_peoplePetsHomeVisibility");
      PXLocalizedStringForPeoplePetsHomeTitle();
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[PUAlbumListViewController _peopleAlbumProvider](self, "_peopleAlbumProvider");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v11 = objc_alloc_init(MEMORY[0x1E0D7B668]);
        -[PUAlbumListViewController _setPeopleAlbumProvider:](self, "_setPeopleAlbumProvider:", v11);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObserver:selector:name:object:", self, sel__peopleAlbumChanged_, *MEMORY[0x1E0D7C5A8], v11);

      }
      objc_msgSend(v8, "setCustomImageView:", 0);
      v28 = (void *)(objc_msgSend(v86, "tag") + 1);
      objc_msgSend(v86, "setTag:", v28);
      v85 = v9;
      objc_initWeak((id *)&location, self);
      -[PUAlbumListViewController spec](self, "spec");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumListViewController _layoutReferenceSize](self, "_layoutReferenceSize");
      v31 = v30;
      v33 = v32;
      -[PUAlbumListViewController _layoutSafeAreaInsets](self, "_layoutSafeAreaInsets");
      objc_msgSend(v29, "tileSizeForLayoutReferenceSize:safeAreaInsets:stackViewStyle:", 3, v31, v33, v34, v35, v36, v37);
      v39 = v38;
      v41 = v40;

      objc_msgSend(v86, "traitCollection");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "displayScale");
      v44 = v43;
      v45 = MEMORY[0x1E0C809B0];
      v100[0] = MEMORY[0x1E0C809B0];
      v100[1] = 3221225472;
      v100[2] = __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke;
      v100[3] = &unk_1E589BF08;
      v101 = v86;
      v102[1] = v28;
      objc_copyWeak(v102, (id *)&location);
      objc_msgSend(v11, "requestAlbumImagesWithSize:displayScale:completion:", v100, v39, v41, v44);

      if (self->_didInitialRequestForPeopleCount)
      {
        -[PUAlbumListViewController _peopleAlbumProvider](self, "_peopleAlbumProvider");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)objc_msgSend(v46, "isCountAvailable");

        if ((_DWORD)v47)
        {
          -[PUAlbumListViewController _peopleAlbumProvider](self, "_peopleAlbumProvider");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "peopleCount");

          if (v49)
          {
            PLSharedCountFormatter();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v49);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "stringFromNumber:", v47);
            v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v50 = CFSTR(" ");
          }
          objc_storeStrong(v107 + 5, v50);
          if (v49)
          {

          }
        }
      }
      else
      {
        self->_didInitialRequestForPeopleCount = 1;
        objc_msgSend(v8, "setSubtitle:animated:", CFSTR(" "), 0);
        v71 = dispatch_time(0, 1000000000);
        dispatch_get_global_queue(-32768, 0);
        v72 = objc_claimAutoreleasedReturnValue();
        block[0] = v45;
        block[1] = 3221225472;
        block[2] = __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke_3;
        block[3] = &unk_1E589FFF0;
        objc_copyWeak(&v99, (id *)&location);
        v96 = v9;
        v98 = &v106;
        v97 = v8;
        dispatch_after(v71, v72, block);

        objc_destroyWeak(&v99);
      }
      -[PUAlbumListViewController _fontManager](self, "_fontManager");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "albumListTitleLabelFont");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUAlbumListViewController _fontManager](self, "_fontManager");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "albumListSubtitleLabelFont");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(v102);
      objc_destroyWeak((id *)&location);
      goto LABEL_41;
    case 5:
      PULocalizedString(CFSTR("PLACES_ALBUM_TITLE"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v9);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v51;
      if (objc_msgSend(v51, "px_isPlacesSmartAlbum"))
        v11 = v51;
      else
        v11 = 0;
      v85 = v9;
      v54 = (void *)(objc_msgSend(v86, "tag") + 1);
      objc_msgSend(v86, "setTag:", v54);
      objc_initWeak((id *)from, self);
      v55 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke_5;
      aBlock[3] = &unk_1E589BF58;
      v56 = v86;
      v91 = v56;
      v94[1] = v54;
      objc_copyWeak(v94, (id *)from);
      v92 = v8;
      v93 = &v106;
      v57 = _Block_copy(aBlock);
      -[PUAlbumListViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      if (!self->__placesAlbumCoverProvider)
      {
        v58 = (PXPlacesAlbumCoverProvider *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B840]), "initWithDelegate:andPlacesCollection:", self, v11);
        placesAlbumCoverProvider = self->__placesAlbumCoverProvider;
        self->__placesAlbumCoverProvider = v58;

      }
      -[PUAlbumListViewController _placesAlbumCoverProvider](self, "_placesAlbumCoverProvider");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "traitCollection");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v88[0] = v55;
      v88[1] = 3221225472;
      v88[2] = __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke_6;
      v88[3] = &unk_1E589BF80;
      v62 = v57;
      v89 = v62;
      objc_msgSend(v60, "requestPlacesAlbumCover:snapshotTraitCollection:completion:", v84, v61, v88);

      v63 = *(_OWORD *)(MEMORY[0x1E0D7CE00] + 16);
      location = *MEMORY[0x1E0D7CE00];
      v105 = v63;
      objc_msgSend(v56, "setBadgeInfo:forItemAtIndex:", &location, 0);
      -[PUAlbumListViewController spec](self, "spec");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v60) = objc_msgSend(v64, "shouldUseTableView");
      +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "albumCornersBackgroundColor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setHasRoundedCorners:withCornersBackgroundColor:", v60 ^ 1, v66);

      -[PUAlbumListViewController _fontManager](self, "_fontManager");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "albumListTitleLabelFont");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUAlbumListViewController _fontManager](self, "_fontManager");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "albumListSubtitleLabelFont");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(v94);
      objc_destroyWeak((id *)from);

LABEL_41:
      v9 = v85;
      goto LABEL_45;
    case 6:
      -[PUAlbumListViewController spec](self, "spec");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "window");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "emptyAlbumPlaceholderImageForWindow:", v53);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      -[PUAlbumListViewController _updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:](self, "_updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:", v86, 0, 0, v11);
      objc_msgSend(v8, "setCustomImageView:", 0);
      v12 = 0;
      v13 = 0;
      v14 = CFSTR("Memories");
      goto LABEL_45;
    default:
      v12 = 0;
      v13 = 0;
      v14 = 0;
      goto LABEL_46;
  }
}

- (id)_keyAssetsForMoments
{
  NSArray *keyAssetsForMoments;
  unint64_t v4;
  void *v5;
  void *v6;
  NSArray *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  NSArray *v20;
  void *v22;
  PUAlbumListViewController *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  keyAssetsForMoments = self->_keyAssetsForMoments;
  if (!keyAssetsForMoments)
  {
    v4 = +[PUStackView maximumNumberOfVisibleImagesForStyle:](PUStackView, "maximumNumberOfVisibleImagesForStyle:", 4);
    objc_msgSend(MEMORY[0x1E0CD1570], "px_standardFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFetchLimit:", v4);
    objc_msgSend(v5, "setReverseSortOrder:", 1);
    v22 = v5;
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsWithOptions:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v23 = self;
    -[PUAlbumListViewController _assetsFetchOptions](self, "_assetsFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFetchLimit:", v4);
    objc_msgSend(v8, "setReverseSortOrder:", 1);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v12), v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v26;
LABEL_9:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v14);
            -[NSArray addObject:](v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v18));
            if (-[NSArray count](v7, "count") >= v4)
              break;
            if (v16 == ++v18)
            {
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v16)
                goto LABEL_9;
              break;
            }
          }
        }

        v19 = -[NSArray count](v7, "count");
        if (v19 >= v4)
          break;
        if (++v12 == v10)
        {
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          if (v10)
            goto LABEL_4;
          break;
        }
      }
    }

    v20 = v23->_keyAssetsForMoments;
    v23->_keyAssetsForMoments = v7;

    keyAssetsForMoments = v23->_keyAssetsForMoments;
  }
  return keyAssetsForMoments;
}

- (void)_prepareStackView:(id)a3 forCollection:(id)a4 withStackCount:(int64_t)a5 withCustomEmptyPlaceHolderImage:(id)a6
{
  unint64_t v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  int64_t v42;
  int64_t v43;
  int64_t v44;
  int v45;
  unint64_t v46;
  id v47;

  v47 = a3;
  v10 = (unint64_t)a6;
  v11 = a4;
  v12 = -[PUAlbumListViewController _stackViewStyleForCollection:](self, "_stackViewStyleForCollection:", v11);
  objc_msgSend(v47, "setStyle:", v12);
  -[PUAlbumListViewController spec](self, "spec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 3 > 1)
  {
    if (v12 == 6)
    {
      objc_msgSend(v47, "setGridItemSpacing:", 4.0);
    }
    else if (v12 == 5)
    {
      +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "placeholderCellBackgroundColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setGridBackgroundColor:", v16);

    }
  }
  else
  {
    objc_msgSend(v13, "configureStackViewWithGridStyle:", v47);
  }
  if (objc_msgSend(v14, "shouldUseTableView"))
  {
    if (a5)
      objc_msgSend(v14, "stackPhotoDecoration");
    else
      objc_msgSend(v14, "emptyStackPhotoDecoration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stackOffset");
    v25 = v26;
    v24 = v27;
    objc_msgSend(v14, "stackPerspectiveInsets");
    v20 = v28;
    v21 = v29;
    v22 = v30;
    v23 = v31;
    objc_msgSend(v14, "stackPerspectiveOffset");
    v18 = v32;
    v19 = v33;
  }
  else
  {
    v17 = 0;
    v18 = *MEMORY[0x1E0DC51A8];
    v19 = *(double *)(MEMORY[0x1E0DC51A8] + 8);
    v20 = *MEMORY[0x1E0DC49E8];
    v21 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v22 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v23 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v24 = v19;
    v25 = *MEMORY[0x1E0DC51A8];
  }
  objc_msgSend(v47, "setPhotoDecoration:", v17);
  objc_msgSend(v47, "setStackOffset:", v25, v24);
  objc_msgSend(v47, "setStackPerspectiveInsets:", v20, v21, v22, v23);
  objc_msgSend(v47, "setStackPerspectiveOffset:", v18, v19);
  -[PUAlbumListViewController _layoutReferenceSize](self, "_layoutReferenceSize");
  v35 = v34;
  v37 = v36;
  -[PUAlbumListViewController _layoutSafeAreaInsets](self, "_layoutSafeAreaInsets");
  objc_msgSend(v14, "stackSizeForLayoutReferenceSize:safeAreaInsets:", v35, v37, v38, v39, v40, v41);
  objc_msgSend(v47, "setStackSize:");
  objc_msgSend(v14, "posterSquareCornerRadius");
  objc_msgSend(v47, "setPosterSquareCornerRadius:");
  objc_msgSend(v14, "posterSubitemCornerRadius");
  objc_msgSend(v47, "setPosterSubitemCornerRadius:");
  v42 = +[PUStackView maximumNumberOfVisibleItemsForStyle:](PUStackView, "maximumNumberOfVisibleItemsForStyle:", v12);
  if (v42 >= a5)
    v43 = a5;
  else
    v43 = v42;
  if (v43 <= 1)
    v43 = 1;
  if (v12 == 3)
    v44 = v42;
  else
    v44 = v43;
  objc_msgSend(v47, "setNumberOfVisibleItems:", v44);
  objc_msgSend(v47, "setEmpty:", (a5 | v10) == 0);
  v45 = objc_msgSend(v11, "px_isFolder");

  if (v45)
    v46 = 0;
  else
    v46 = v10;
  objc_msgSend(v47, "setEmptyPlaceholderImage:", v46);

}

- (void)_updateStackView:(id)a3 forAssets:(id)a4 collection:(id)a5 withCustomEmptyPlaceholderImage:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _OWORD v40[2];
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  id v45;
  PUAlbumListViewController *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  -[PUAlbumListViewController _prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:](self, "_prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:", v10, v11, objc_msgSend(v13, "count"), v12);

  v14 = objc_msgSend(v10, "tag") + 1;
  objc_msgSend(v10, "setTag:", v14);
  -[PUAlbumListViewController spec](self, "spec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "imageContentMode");

  -[PUAlbumListViewController spec](self, "spec");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController _layoutReferenceSize](self, "_layoutReferenceSize");
  v19 = v18;
  v21 = v20;
  -[PUAlbumListViewController _layoutSafeAreaInsets](self, "_layoutSafeAreaInsets");
  objc_msgSend(v17, "imageSizeForLayoutReferenceSize:safeAreaInsets:", v19, v21, v22, v23, v24, v25);
  v27 = v26;
  v29 = v28;

  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __99__PUAlbumListViewController__updateStackView_forAssets_collection_withCustomEmptyPlaceholderImage___block_invoke;
  v43[3] = &unk_1E589BFA8;
  v44 = v10;
  v30 = v11;
  v45 = v30;
  v46 = self;
  v47 = v27;
  v48 = v29;
  v49 = v16;
  v50 = v14;
  v31 = v10;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v43);

  -[PUAlbumListViewController spec](self, "spec");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "shouldUseTableView");

  v41 = 0u;
  v42 = 0u;
  -[PUAlbumListViewController _badgeManager](self, "_badgeManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    objc_msgSend(v34, "badgeInfoForCollection:options:", v30, 0);
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
  }

  if (v33)
    v36 = 1;
  else
    v36 = 2;
  v40[0] = v41;
  v40[1] = v42;
  objc_msgSend(v31, "setBadgeInfo:style:forItemAtIndex:", v40, v36, 0);
  v37 = v33 ^ 1u;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "albumCornersBackgroundColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setHasRoundedCorners:withCornersBackgroundColor:", v37, v39);

}

- (void)_updateStackView:(id)a3 forFaces:(id)a4 inCollection:(id)a5 withCustomEmptyPlaceholderImage:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _OWORD v20[2];
  _QWORD v21[4];
  id v22;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  -[PUAlbumListViewController _prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:](self, "_prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:", v10, v12, objc_msgSend(v13, "count"), v11);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __100__PUAlbumListViewController__updateStackView_forFaces_inCollection_withCustomEmptyPlaceholderImage___block_invoke;
  v21[3] = &unk_1E589BFD0;
  v22 = v10;
  v14 = v10;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v21);

  v15 = *(_OWORD *)(MEMORY[0x1E0D7CE00] + 16);
  v20[0] = *MEMORY[0x1E0D7CE00];
  v20[1] = v15;
  objc_msgSend(v14, "setBadgeInfo:forItemAtIndex:", v20, 0);
  -[PUAlbumListViewController spec](self, "spec");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "shouldUseTableView") ^ 1;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "albumCornersBackgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHasRoundedCorners:withCornersBackgroundColor:", v17, v19);

}

- (void)_updateStackView:(id)a3 forPeopleImages:(id)a4 inCollection:(id)a5 withCustomEmptyPlaceholderImage:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _OWORD v31[2];

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[PUAlbumListViewController spec](self, "spec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStyle:", 3);
  objc_msgSend(v12, "configureStackViewWithGridStyle:", v9);
  -[PUAlbumListViewController _layoutReferenceSize](self, "_layoutReferenceSize");
  v14 = v13;
  v16 = v15;
  -[PUAlbumListViewController _layoutSafeAreaInsets](self, "_layoutSafeAreaInsets");
  objc_msgSend(v12, "stackSizeForLayoutReferenceSize:safeAreaInsets:", v14, v16, v17, v18, v19, v20);
  objc_msgSend(v9, "setStackSize:");
  objc_msgSend(v12, "posterSquareCornerRadius");
  objc_msgSend(v9, "setPosterSquareCornerRadius:");
  objc_msgSend(v12, "posterSubitemCornerRadius");
  objc_msgSend(v9, "setPosterSubitemCornerRadius:");
  v21 = +[PUStackView maximumNumberOfVisibleItemsForStyle:](PUStackView, "maximumNumberOfVisibleItemsForStyle:", 3);
  objc_msgSend(v9, "setNumberOfVisibleItems:", v21);
  objc_msgSend(v9, "setEmptyPlaceholderImage:", v11);
  if (v21)
  {
    for (i = 0; i != v21; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v24, "size");
        objc_msgSend(v9, "setImageSize:forItemAtIndex:", i);
        v25 = v9;
        v26 = v24;
      }
      else
      {
        v25 = v9;
        v26 = 0;
      }
      objc_msgSend(v25, "setImage:forItemAtIndex:", v26, i);

    }
  }
  v27 = *(_OWORD *)(MEMORY[0x1E0D7CE00] + 16);
  v31[0] = *MEMORY[0x1E0D7CE00];
  v31[1] = v27;
  objc_msgSend(v9, "setBadgeInfo:forItemAtIndex:", v31, 0);
  v28 = objc_msgSend(v12, "shouldUseTableView") ^ 1;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "albumCornersBackgroundColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHasRoundedCorners:withCornersBackgroundColor:", v28, v30);

}

- (void)_updateCollageView:(id)a3 forAssets:(id)a4
{
  id v6;
  id v7;
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
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  PUAlbumListViewController *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v6 = a3;
  v7 = a4;
  -[PUAlbumListViewController spec](self, "spec");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController _layoutReferenceSize](self, "_layoutReferenceSize");
  v9 = v8;
  v11 = v10;
  -[PUAlbumListViewController _layoutSafeAreaInsets](self, "_layoutSafeAreaInsets");
  objc_msgSend(v30, "stackSizeForLayoutReferenceSize:safeAreaInsets:", v9, v11, v12, v13, v14, v15);
  v17 = v16;
  v19 = v18;
  objc_msgSend(v30, "collageSpacing");
  v21 = v20;
  objc_msgSend(v6, "setCollageSize:", v17, v19);
  objc_msgSend(v6, "setSpacing:", v21);
  objc_msgSend(v6, "setNumberOfItems:", objc_msgSend(v7, "count"));
  objc_msgSend(v30, "posterSquareCornerRadius");
  objc_msgSend(v6, "setCornerRadius:");
  objc_msgSend(v30, "posterSubitemCornerRadius");
  objc_msgSend(v6, "setSubitemCornerRadius:");
  v22 = objc_msgSend(v30, "shouldUseTableView") ^ 1;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "albumCornersBackgroundColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHasRoundedCorners:withCornersBackgroundColor:", v22, v24);

  v25 = objc_msgSend(v6, "tag") + 1;
  objc_msgSend(v6, "setTag:", v25);
  v26 = objc_msgSend(v30, "collageImageContentMode");
  objc_msgSend(v30, "collageImageSize");
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __58__PUAlbumListViewController__updateCollageView_forAssets___block_invoke;
  v31[3] = &unk_1E589BFF8;
  v32 = v6;
  v33 = self;
  v34 = v27;
  v35 = v28;
  v36 = v26;
  v37 = v25;
  v29 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v31);

}

- (void)setSyncProgressVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v3 = a3;
  if (-[PUAlbumListViewController progressViewVisible](self, "progressViewVisible") != a3)
  {
    -[PUAlbumListViewController setProgressViewVisible:](self, "setProgressViewVisible:", v3);
    -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (v3)
        v6 = 100.0;
      else
        v6 = 0.0;
      -[PUAlbumListViewController _mainCollectionViewLayout](self, "_mainCollectionViewLayout");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setGlobalFooterHeight:", v6);
LABEL_12:

      return;
    }
    if (v3)
    {
      -[PUAlbumListViewController syncProgressView](self, "syncProgressView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        v22 = objc_alloc_init(MEMORY[0x1E0D7B7E0]);
        v8 = objc_alloc_init(MEMORY[0x1E0D7B458]);
        objc_msgSend(v22, "setViewModel:", v8);

        -[PUAlbumListViewController setSyncProgressView:](self, "setSyncProgressView:", v22);
        v7 = v22;
      }
      v21 = v7;
      objc_msgSend(v7, "frame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "rowHeight");
      v17 = v16;

      objc_msgSend(v21, "setFrame:", v10, v12, v14, v17);
      -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTableFooterView:", v21);

      goto LABEL_12;
    }
    -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTableFooterView:", 0);

    -[PUAlbumListViewController syncProgressView](self, "syncProgressView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeFromSuperview");

    -[PUAlbumListViewController setSyncProgressView:](self, "setSyncProgressView:", 0);
  }
}

- (id)subtitleForCollection:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend(v4, "px_isSharedAlbum"))
  {
    objc_msgSend(v4, "localizedSharedByLabelAllowsEmail:", -[PUAlbumListViewController shouldAllowEmailInAlbumSubtitle](self, "shouldAllowEmailInAlbumSubtitle"));
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v6 = (__CFString *)v5;
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "px_isMacSyncedFacesFolder") & 1) != 0
    || objc_msgSend(v4, "px_isMacSyncedEventsFolder"))
  {
    PULocalizedString(CFSTR("FROM_MY_MAC"));
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countForCollection:", v4);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = CFSTR(" ");
    v11 = CFSTR(" ");
  }
  else
  {
    if (self->_albumSubtitleFormat && objc_msgSend(v4, "px_isMacSyncedAlbum"))
    {
      PULocalizedString(self->_albumSubtitleFormat);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedStringWithValidatedFormat(v12, CFSTR("%ld"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLSharedCountFormatter();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringFromNumber:", v13);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_7:

  return v6;
}

- (BOOL)shouldAllowEmailInAlbumSubtitle
{
  return 1;
}

- (BOOL)shouldBeginRetitlingAlbumAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PUAlbumListViewController _mainTableView](self, "_mainTableView", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "showingDeleteConfirmation") & 1) != 0)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)_shouldShowAggregateItem
{
  PUAlbumListViewController *v2;
  void *v3;
  _BOOL4 v4;
  BOOL v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  char v10;
  BOOL v11;

  v2 = self;
  -[PUAlbumListViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUAlbumListViewController canShowAggregateItem](v2, "canShowAggregateItem");
  v5 = -[PUAlbumListViewController isEmpty](v2, "isEmpty");
  LOBYTE(v2) = -[PUAlbumListViewController isRootFolder](v2, "isRootFolder");
  objc_msgSend(v3, "collectionList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "px_isFolder");

  objc_msgSend(v3, "collectionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "px_isSmartFolder");

  v10 = v7 & (v9 ^ 1);
  if ((v2 & 1) != 0)
    v10 = 0;
  if (v5)
    v10 = 0;
  if (v4)
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

- (BOOL)shouldShowAllPhotosItem
{
  return 0;
}

- (BOOL)shouldHideEmptyCollections
{
  return 0;
}

- (BOOL)canShowAvatarViews
{
  return 1;
}

- (BOOL)showsTopPlaceholdersSection
{
  return 1;
}

- (BOOL)showsSeparatorBelowTopPlaceholdersSection
{
  return -[PUAlbumListViewController _shouldShowAggregateItem](self, "_shouldShowAggregateItem")
      || -[PUAlbumListViewController shouldShowAllPhotosItem](self, "shouldShowAllPhotosItem");
}

- (int64_t)topPlaceholdersSection
{
  if (-[PUAlbumListViewController showsTopPlaceholdersSection](self, "showsTopPlaceholdersSection"))
    return 0;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)albumsSection
{
  return -[PUAlbumListViewController showsTopPlaceholdersSection](self, "showsTopPlaceholdersSection");
}

- (_NSRange)albumsSections
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v3 = -[PUAlbumListViewController showsTopPlaceholdersSection](self, "showsTopPlaceholdersSection");
  -[PUAlbumListViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSections");

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (int64_t)numberOfSections
{
  void *v3;
  uint64_t v4;

  -[PUAlbumListViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4 + -[PUAlbumListViewController showsTopPlaceholdersSection](self, "showsTopPlaceholdersSection");
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  int64_t result;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  void *v13;
  int64_t v14;

  if (-[PUAlbumListViewController topPlaceholdersSection](self, "topPlaceholdersSection") == a3)
  {
    LODWORD(v5) = -[PUAlbumListViewController showAddNewAlbumPlaceholder](self, "showAddNewAlbumPlaceholder");
    v6 = -[PUAlbumListViewController _shouldShowAggregateItem](self, "_shouldShowAggregateItem");
    v7 = 1;
    if ((_DWORD)v5)
      v7 = 2;
    if (v6)
      v5 = v7;
    else
      v5 = v5;
    return v5 + -[PUAlbumListViewController shouldShowAllPhotosItem](self, "shouldShowAllPhotosItem");
  }
  else
  {
    v10 = -[PUAlbumListViewController albumsSections](self, "albumsSections");
    result = 0;
    v11 = a3 >= v10;
    v12 = a3 - v10;
    if (v11 && v12 < v9)
    {
      -[PUAlbumListViewController dataSource](self, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "numberOfItemsInSection:", a3 - -[PUAlbumListViewController albumsSections](self, "albumsSections"));

      return v14;
    }
  }
  return result;
}

- (BOOL)isPlaceholderAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = -[PUAlbumListViewController albumsSections](self, "albumsSections");
  v8 = 1;
  if (v5 >= v6 && v5 - v6 < v7)
  {
    -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "px_isPlacesSmartAlbum") & 1) == 0
      && (objc_msgSend(v9, "px_isPeopleVirtualCollection") & 1) == 0)
    {
      v8 = objc_msgSend(v9, "px_isMemoriesVirtualCollection");
    }

  }
  return v8;
}

- (int64_t)placeholderKindAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  int64_t v9;
  _BOOL4 v10;
  _BOOL8 v11;
  _BOOL4 v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 == -[PUAlbumListViewController topPlaceholdersSection](self, "topPlaceholdersSection"))
  {
    v6 = objc_msgSend(v4, "item");
    v7 = -[PUAlbumListViewController showAddNewAlbumPlaceholder](self, "showAddNewAlbumPlaceholder");
    v8 = v6 - v7;
    if (v6)
      v9 = 0;
    else
      v9 = v7;
    v10 = -[PUAlbumListViewController _shouldShowAggregateItem](self, "_shouldShowAggregateItem");
    v11 = v8 >= 0 && v10;
    v12 = v8 == 0;
    v13 = v8 - v11;
    if (v11 && v12)
      v9 = 2;
    v14 = -[PUAlbumListViewController shouldShowAllPhotosItem](self, "shouldShowAllPhotosItem");
    v15 = v13 >= 0 && v14;
    if (v15 && v13 == 0)
      v9 = 3;
  }
  else
  {
    v16 = objc_msgSend(v4, "section");
    v17 = -[PUAlbumListViewController albumsSections](self, "albumsSections");
    v9 = 0;
    if (v16 >= v17 && v16 - v17 < v18)
    {
      -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "px_isPeopleVirtualCollection") & 1) != 0)
      {
        v9 = 4;
      }
      else if ((objc_msgSend(v19, "px_isPlacesSmartAlbum") & 1) != 0)
      {
        v9 = 5;
      }
      else if (objc_msgSend(v19, "px_isMemoriesVirtualCollection"))
      {
        v9 = 6;
      }
      else
      {
        v9 = 0;
      }

    }
  }

  return v9;
}

- (id)indexPathForPlacesAlbum
{
  void *v4;
  id v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__8859;
  v12 = __Block_byref_object_dispose__8860;
  v13 = 0;
  -[PUAlbumListViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PUAlbumListViewController_indexPathForPlacesAlbum__block_invoke;
  v7[3] = &unk_1E589C020;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a2;
  objc_msgSend(v4, "enumerateCollectionsUsingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)indexPathForPeopleAlbum
{
  void *v4;
  id v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__8859;
  v12 = __Block_byref_object_dispose__8860;
  v13 = 0;
  -[PUAlbumListViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PUAlbumListViewController_indexPathForPeopleAlbum__block_invoke;
  v7[3] = &unk_1E589C020;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a2;
  objc_msgSend(v4, "enumerateCollectionsUsingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)indexPathForAddNewAlbumPlaceholder
{
  int64_t v3;
  void *v4;

  if (-[PUAlbumListViewController showAddNewAlbumPlaceholder](self, "showAddNewAlbumPlaceholder"))
  {
    v3 = -[PUAlbumListViewController topPlaceholdersSection](self, "topPlaceholdersSection");
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)indexPathForAggregateItem
{
  int64_t v3;
  _BOOL4 v4;
  void *v5;

  if (-[PUAlbumListViewController _shouldShowAggregateItem](self, "_shouldShowAggregateItem"))
  {
    v3 = -[PUAlbumListViewController topPlaceholdersSection](self, "topPlaceholdersSection");
    v4 = -[PUAlbumListViewController showAddNewAlbumPlaceholder](self, "showAddNewAlbumPlaceholder");
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)indexPathForFirstEditableAlbum
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _OWORD v8[2];
  _QWORD v9[6];
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8859;
  v16 = __Block_byref_object_dispose__8860;
  v17 = 0;
  v10 = 0u;
  v11 = 0u;
  -[PUAlbumListViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "firstItemIndexPath");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
  }

  if ((_QWORD)v10 != *MEMORY[0x1E0D7CE28])
  {
    -[PUAlbumListViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__PUAlbumListViewController_indexPathForFirstEditableAlbum__block_invoke;
    v9[3] = &unk_1E589C048;
    v9[4] = self;
    v9[5] = &v12;
    v8[0] = v10;
    v8[1] = v11;
    objc_msgSend(v5, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v8, 0, v9);

  }
  v6 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v6;
}

- (id)_targetIndexPathForMoveFromIndexPath:(id)a3 toProposedIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  unint64_t v12;
  unint64_t v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[4];
  _QWORD v23[9];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v6 = a3;
  v7 = a4;
  v8 = -[PUAlbumListViewController albumsSections](self, "albumsSections");
  v10 = v9;
  if (!-[PUAlbumListViewController isEmpty](self, "isEmpty"))
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v31 = objc_msgSend(v7, "item");
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v27 = objc_msgSend(v7, "section");
    v12 = v25[3];
    if (v12 >= v8 && v12 - v8 < v10)
      goto LABEL_13;
    v14 = v10 + v8 - 1;
    if (v12 <= v14)
    {
      if (v12 >= v8)
      {
LABEL_13:
        -[PUAlbumListViewController dataSource](self, "dataSource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "identifier");
        v18 = v25[3];
        v19 = v29[3];

        -[PUAlbumListViewController dataSource](self, "dataSource");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __86__PUAlbumListViewController__targetIndexPathForMoveFromIndexPath_toProposedIndexPath___block_invoke;
        v23[3] = &unk_1E589C070;
        v23[4] = self;
        v23[5] = &v24;
        v23[7] = v8;
        v23[8] = v10;
        v23[6] = &v28;
        v22[0] = v17;
        v22[1] = v18 - v8;
        v22[2] = v19;
        v22[3] = 0x7FFFFFFFFFFFFFFFLL;
        objc_msgSend(v20, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v22, 0, v23);

        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v29[3], v25[3]);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        _Block_object_dispose(&v24, 8);
        _Block_object_dispose(&v28, 8);
        goto LABEL_14;
      }
      v15 = 0;
      v25[3] = v8;
    }
    else
    {
      v25[3] = v14;
      v15 = -[PUAlbumListViewController numberOfItemsInSection:](self, "numberOfItemsInSection:") - 1;
    }
    v29[3] = v15;
    goto LABEL_13;
  }
  v11 = v6;
LABEL_14:

  return v11;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  if (sel__handleOpenKeyCommand_ == a3)
  {
    -[PUAlbumListViewController focusedListCell](self, "focusedListCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a3) = v7 != 0;

    goto LABEL_11;
  }
  if (sel__handleRenameKeyCommand_ == a3)
  {
    -[PUAlbumListViewController focusedListCell](self, "focusedListCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "albumListCellContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = (SEL)(((unint64_t)objc_msgSend(v9, "editCapabilities") >> 1) & 1);
LABEL_9:

    goto LABEL_11;
  }
  if (sel__handleDeleteKeyCommand_ == a3)
  {
    -[PUAlbumListViewController focusedListCell](self, "focusedListCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "albumListCellContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = (SEL)(objc_msgSend(v9, "editCapabilities") & 1);
    goto LABEL_9;
  }
  if (sel_newSmartAlbum_ == a3)
  {
    LOBYTE(a3) = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PUAlbumListViewController;
    LOBYTE(a3) = -[PUAlbumListViewController canPerformAction:withSender:](&v11, sel_canPerformAction_withSender_, a3, v6);
  }
LABEL_11:

  return (char)a3;
}

- (void)_handleOpenKeyCommand:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PUAlbumListViewController focusedListCell](self, "focusedListCell", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathForCell:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUAlbumListViewController didSelectItemAtIndexPath:](self, "didSelectItemAtIndexPath:", v5);
  }

}

- (void)_handleRenameKeyCommand:(id)a3
{
  void *v3;
  id v4;

  -[PUAlbumListViewController focusedListCell](self, "focusedListCell", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "albumListCellContentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "startPerformRetitleAction");
}

- (void)_handleDeleteKeyCommand:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PUAlbumListViewController focusedListCell](self, "focusedListCell", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathForCell:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUAlbumListViewController _handleDeleteAlbumAtIndexPath:](self, "_handleDeleteAlbumAtIndexPath:", v5);
  }

}

- (void)newAlbum:(id)a3
{
  -[PUAlbumListViewController _handleCollectionListActionType:](self, "_handleCollectionListActionType:", *MEMORY[0x1E0D7C248]);
}

- (void)newSmartAlbum:(id)a3
{
  -[PUAlbumListViewController _handleCollectionListActionType:](self, "_handleCollectionListActionType:", *MEMORY[0x1E0D7C260]);
}

- (void)newFolder:(id)a3
{
  -[PUAlbumListViewController _handleCollectionListActionType:](self, "_handleCollectionListActionType:", *MEMORY[0x1E0D7C250]);
}

- (void)newSharedAlbum:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_alloc(MEMORY[0x1E0D7B2B0]);
  -[PUAlbumListViewController photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7BBE8], "defaultPresenterWithViewController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "initWithPhotoLibrary:presentationEnvironment:", v5, v6);

  objc_msgSend(v7, "performActionWithCompletionHandler:", 0);
}

- (void)_handleDoneButton:(id)a3
{
  id v3;

  -[PUAlbumListViewController sessionInfo](self, "sessionInfo", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStatus:", 1);

}

- (void)_handleCancelButton:(id)a3
{
  id v3;

  -[PUAlbumListViewController sessionInfo](self, "sessionInfo", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStatus:", 2);

}

- (void)_recursivelyCollectCollectionsIn:(id)a3 fetchResult:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "canContainCollections"))
        {
          objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v12, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUAlbumListViewController _recursivelyCollectCollectionsIn:fetchResult:](self, "_recursivelyCollectCollectionsIn:fetchResult:", v6, v13);

        }
        else if (objc_msgSend(v12, "canContainAssets"))
        {
          objc_msgSend(v6, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (BOOL)_isPlaceholderEnabled:(int64_t)a3
{
  int v5;
  void *v6;

  if ((-[PUAlbumListViewController isEditing](self, "isEditing") & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isSelectingTargetAlbum") ^ 1;

  }
  if (a3 == 1)
    return 1;
  else
    return v5;
}

- (void)_didSelectPlaceholderAtIndexPath:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[PUAlbumListViewController placeholderKindAtIndexPath:](self, "placeholderKindAtIndexPath:", v5);
  -[PUAlbumListViewController _isPlaceholderEnabled:](self, "_isPlaceholderEnabled:", v6);
  switch(v6)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 2122, CFSTR("undefined placeholder"));

      break;
    case 1:
      if (-[PUAlbumListViewController isRootSharedAlbumList](self, "isRootSharedAlbumList"))
        -[PUAlbumListViewController newSharedAlbum:](self, "newSharedAlbum:", 0);
      else
        -[PUAlbumListViewController _handleCollectionListActionType:](self, "_handleCollectionListActionType:", *MEMORY[0x1E0D7C240]);
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "collectionsFetchResult");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumListViewController _recursivelyCollectCollectionsIn:fetchResult:](self, "_recursivelyCollectCollectionsIn:fetchResult:", v8, v10);

      -[PUAlbumListViewController _assetsFetchOptions](self, "_assetsFetchOptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForKey:", CFSTR("objectID"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY albums IN (%@)"), v29);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "internalPredicate");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v28 = v12;
      if (v13)
      {
        v15 = (void *)MEMORY[0x1E0CB3528];
        v31[0] = v12;
        v31[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = v12;
      }
      objc_msgSend(v11, "setInternalPredicate:", v17);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSortDescriptors:", v19);

      objc_msgSend(v11, "setIncludeAssetSourceTypes:", 7);
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CD13B8];
      PULocalizedString(CFSTR("ALL_PHOTOS_IN_FOLDER"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "transientAssetCollectionWithAssetFetchResult:title:", v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUAlbumListViewController spec](self, "spec");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "shouldUseCollageForCloudFeedPlaceholder");

      if ((v25 & 1) != 0)
      {
        v26 = -[PUAlbumListViewController newGridViewControllerForAssetCollection:](self, "newGridViewControllerForAssetCollection:", v23);
        -[PUAlbumListViewController navigationController](self, "navigationController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "pu_pushViewController:withTransition:animated:isInteractive:", v26, 0, 1, 0);

      }
      else
      {
        -[PUAlbumListViewController navigateToCollection:animated:completion:](self, "navigateToCollection:animated:completion:", v23, 1, 0);
      }

      goto LABEL_19;
    case 3:
      -[PUAlbumListViewController navigateToAllPhotosAnimated:completion:](self, "navigateToAllPhotosAnimated:completion:", 1, 0);
      break;
    case 4:
      -[PUAlbumListViewController _navigateToPeopleAnimated:withPersonLocalIdentifier:withCompletion:](self, "_navigateToPeopleAnimated:withPersonLocalIdentifier:withCompletion:", 1, 0, 0);
      break;
    case 5:
      -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumListViewController _navigateToPlacesFromCollection:](self, "_navigateToPlacesFromCollection:", v8);
LABEL_19:

      break;
    case 6:
      -[PUAlbumListViewController _navigateToMemories](self, "_navigateToMemories");
      break;
    default:
      break;
  }

}

- (void)didSelectItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUAlbumListViewController isPlaceholderAtIndexPath:](self, "isPlaceholderAtIndexPath:", v7))
  {
    -[PUAlbumListViewController _didSelectPlaceholderAtIndexPath:](self, "_didSelectPlaceholderAtIndexPath:", v7);
  }
  else if (v4)
  {
    -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isSelectingTargetAlbum"))
    {
      v6 = objc_msgSend(v4, "px_isFolder");

      if ((v6 & 1) == 0)
      {
        -[PUAlbumListViewController handleSessionInfoAlbumSelection:](self, "handleSessionInfoAlbumSelection:", v4);
        goto LABEL_10;
      }
    }
    else
    {

    }
    if ((-[PUAlbumListViewController isEditing](self, "isEditing") & 1) == 0)
      -[PUAlbumListViewController navigateToCollection:animated:completion:](self, "navigateToCollection:animated:completion:", v4, 1, 0);
  }
LABEL_10:

}

- (void)_handleCollectionListActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PUAlbumListViewController *v11;

  v4 = a3;
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B700]), "initWithActionType:collectionList:", v4, v6);
  objc_msgSend(v7, "setDelegate:", self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__PUAlbumListViewController__handleCollectionListActionType___block_invoke;
  v9[3] = &unk_1E58AA020;
  v10 = v7;
  v11 = self;
  v8 = v7;
  objc_msgSend(v8, "performActionWithCompletionHandler:", v9);

}

- (void)_dismissPhotosPickerControllerAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  -[PUAlbumListViewController pickerViewController](self, "pickerViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PUAlbumListViewController setPickerViewController:](self, "setPickerViewController:", 0);
    objc_msgSend(v4, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
    }
    else
    {
      PXAssertGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_error_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Photos picker's presenting view controller is unexpectedly missing.", v8, 2u);
      }

    }
  }

}

- (void)_updateCreateAlbumTextField:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController _validateNewCollectionTitle:](self, "_validateNewCollectionTitle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  -[PUAlbumListViewController _createAlbumAlertAction](self, "_createAlbumAlertAction");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v6);

}

- (id)_validateNewCollectionTitle:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CD13C8], "validateAssetCollectionTitle:error:", a3, 0);
}

- (void)_handleDeleteAlbumAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForItemAtIndexPath:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUAlbumListViewController _handleDeleteCollection:sourceView:](self, "_handleDeleteCollection:sourceView:", v4, v6);
  }

}

- (void)_handleDeleteCollection:(id)a3 sourceView:(id)a4
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canDeleteCollection:", v15);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 2275, CFSTR("expected deletable collection"));

  }
  -[PUAlbumListViewController spec](self, "spec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "albumDeletionWarningStyle");

  -[PUAlbumListViewController undoManager](self, "undoManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PXCollectionDeletionAlertControllerForCollection();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "popoverPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSourceView:", v7);

  objc_msgSend(v13, "setDelegate:", self);
  -[PUAlbumListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

}

- (void)handleSessionInfoAlbumSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;

  v4 = a3;
  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController _pickerBannerView](self, "_pickerBannerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __61__PUAlbumListViewController_handleSessionInfoAlbumSelection___block_invoke;
  v19 = &unk_1E58AAE08;
  v20 = v5;
  v7 = v4;
  v21 = v7;
  v8 = v5;
  v9 = _Block_copy(&v16);
  v10 = v9;
  if (v6)
  {
    -[PUAlbumListViewController indexPathForCollection:](self, "indexPathForCollection:", v7, v16, v17, v18, v19, v20, v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController _preparedAlbumListCellContentViewAtIndexPath:](self, "_preparedAlbumListCellContentViewAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stackView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController navigationController](self, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "animateImagesOntoView:inContainerView:completionHandler:", v13, v15, v10);
  }
  else
  {
    (*((void (**)(void *, uint64_t))v9 + 2))(v9, 1);
  }

}

- (id)newGridViewControllerForFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PUAlbumListViewController *v7;
  void *v8;
  PUAlbumListViewController *v9;

  v4 = a3;
  -[PUAlbumListViewController spec](self, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "standInAlbumListViewControllerSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [PUAlbumListViewController alloc];
  -[PUAlbumListViewController photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PUAlbumListViewController initWithSpec:photoLibrary:](v7, "initWithSpec:photoLibrary:", v6, v8);

  -[PUAlbumListViewController setCollection:](v9, "setCollection:", v4);
  return v9;
}

- (id)newGridViewControllerForAssetCollection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "assetCollectionType");
  v6 = objc_msgSend(v4, "assetCollectionSubtype");
  if (v5 == 2 && v6 == 201)
  {
    -[PUAlbumListViewController px_gridPresentation](self, "px_gridPresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createPanoramaViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetsFetchResultForCollection:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUAlbumListViewController px_gridPresentation](self, "px_gridPresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createPhotosAlbumViewControllerForAlbum:withFetchResult:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSessionInfo:", v11);

  }
  +[PUAggregateDictionaryTracer sharedTracer](PUAggregateDictionaryTracer, "sharedTracer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userStartedViewingCollection:withListViewItemSelectionTrackerKey:", v4, *MEMORY[0x1E0D725A8]);

  v13 = (void *)MEMORY[0x1E0D09910];
  v16 = *MEMORY[0x1E0D09818];
  v17[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.albumListItemSelected"), v14);

  return v8;
}

- (id)newCloudFeedViewController
{
  PUFeedViewController *v3;
  void *v4;
  void *v5;

  -[PUAlbumListViewController _cachedFeedViewController](self, "_cachedFeedViewController");
  v3 = (PUFeedViewController *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PUAlbumListViewController spec](self, "spec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "feedViewControllerSpec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = -[PUFeedViewController initWithSpec:contentType:]([PUFeedViewController alloc], "initWithSpec:contentType:", v5, 0);
    -[PUAlbumListViewController _setCachedFeedViewController:](self, "_setCachedFeedViewController:", v3);

  }
  return v3;
}

- (void)navigateToPeopleAnimated:(BOOL)a3 withPersonLocalIdentifier:(id)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__PUAlbumListViewController_navigateToPeopleAnimated_withPersonLocalIdentifier_withCompletion___block_invoke;
  v10[3] = &unk_1E589C098;
  v11 = v8;
  v9 = v8;
  -[PUAlbumListViewController _navigateToPeopleAnimated:withPersonLocalIdentifier:withCompletion:](self, "_navigateToPeopleAnimated:withPersonLocalIdentifier:withCompletion:", v6, a4, v10);

}

- (id)newGridViewControllerForAllPhotos
{
  return 0;
}

- (void)_handlePhotoPinchGestureRecognizer:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;

  v21 = a3;
  v4 = objc_msgSend(v21, "state");
  -[PUAlbumListViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pu_currentInteractiveTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[UIViewController pu_currentInteractiveNavigationTransition](self, "pu_currentInteractiveNavigationTransition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "updateInteractiveTransitionWithPhotoPinchGestureRecognizer:", v21);
  }
  else if (v4 == 2)
  {
    -[PUAlbumListViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "locationInView:", v10);
    v12 = v11;
    v14 = v13;
    objc_msgSend(v21, "velocity");
    if (v15 <= 0.0)
    {
      objc_msgSend(v21, "velocity");
      if (v16 < 0.0)
      {
        -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "collectionList");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "pl_assetContainerList");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_msgSend(v19, "albumListType");
        if (v20 <= 7 && ((1 << v20) & 0x86) != 0)
          -[PUAlbumListViewController _beginInteractiveZoomOut:](self, "_beginInteractiveZoomOut:", v21);

      }
    }
    else
    {
      -[PUAlbumListViewController _beginInteractiveNavigationForItemAtPoint:](self, "_beginInteractiveNavigationForItemAtPoint:", v12, v14);
    }

  }
}

- (void)_beginInteractiveNavigationForItemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  PUStackedAlbumTransition *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  y = a3.y;
  x = a3.x;
  -[PUAlbumListViewController collectionView](self, "collectionView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "indexPathForItemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "px_isFolder");
    if (-[PUAlbumListViewController isPlaceholderAtIndexPath:](self, "isPlaceholderAtIndexPath:", v7))
    {
      if (!-[PUAlbumListViewController placeholderKindAtIndexPath:](self, "placeholderKindAtIndexPath:", v7))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 2410, CFSTR("undefined placeholder"));
        v11 = 0;
        v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    else if (-[PUAlbumListViewController _canTransitionInteractivelyToCollection:](self, "_canTransitionInteractivelyToCollection:", v8))
    {
      objc_msgSend(v16, "bounds");
      objc_msgSend(v16, "contentInset");
      if ((_DWORD)v9)
      {
        v11 = -[PUAlbumListViewController newGridViewControllerForFolder:](self, "newGridViewControllerForFolder:", v8);
        -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSessionInfo:", v13);

        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", v8);
        objc_msgSend(v11, "setDataSourceManagerConfiguration:", v14);
      }
      else
      {
        v14 = -[PUAlbumListViewController newGridViewControllerForAssetCollection:](self, "newGridViewControllerForAssetCollection:", v8);
        -[PUAlbumListViewController setPushedAlbum:](self, "setPushedAlbum:", v8);
        -[PUAlbumListViewController setPushedController:](self, "setPushedController:", v14);
        v11 = v14;
      }

      if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EEC31120))
      {
        v12 = objc_alloc_init(PUStackedAlbumTransition);
        -[PUStackedAlbumTransition ph_setPhotoCollection:](v12, "ph_setPhotoCollection:", v8);
        -[PUStackedAlbumTransition setForStandInAlbum:](v12, "setForStandInAlbum:", v9);
        -[PUStackedAlbumTransition setForFolder:](v12, "setForFolder:", v9);
        -[PUStackedAlbumTransition setDelegate:](v12, "setDelegate:", self);
        if (!v11 || !v12)
          goto LABEL_16;
        -[PUAlbumListViewController _photoPinchGestureRecognizer](self, "_photoPinchGestureRecognizer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUStackedAlbumTransition startInteractiveTransitionWithPhotoPinchGestureRecognizer:isExpanding:](v12, "startInteractiveTransitionWithPhotoPinchGestureRecognizer:isExpanding:", v10, 1);
        -[PUAlbumListViewController navigationController](self, "navigationController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pu_pushViewController:withTransition:animated:isInteractive:", v11, v12, 1, 1);

        goto LABEL_15;
      }
LABEL_9:
      v12 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v11 = 0;
    goto LABEL_9;
  }
LABEL_17:

}

- (void)_beginInteractiveZoomOut:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[PUAlbumListViewController mainScrollView](self, "mainScrollView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v15);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v15, "bounds");
  v10 = v9;
  objc_msgSend(v15, "contentInset");
  v12 = v8 - (v10 + v11);
  -[UIViewController pu_navigationTransition](self, "pu_navigationTransition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInteractionCenter:", v6, v12);
  objc_msgSend(v13, "startInteractiveTransitionWithPhotoPinchGestureRecognizer:isExpanding:", v4, 0);

  -[PUAlbumListViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pu_popViewControllerAnimated:interactive:", 1, 1);

}

- (id)_getDisplayableAssetsForFolder:(id)a3 maximumCount:(int64_t)a4 useCache:(BOOL)a5 correspondingCollections:(id *)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;

  v7 = a5;
  v10 = a3;
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayableAssetsForCollectionList:maximumCount:useCache:correspondingCollections:", v10, a4, v7, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_getDisplayableFacesForCollectionList:(id)a3 maximumCount:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetsFetchResultForCollection:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") <= (unint64_t)a4)
    a4 = objc_msgSend(v8, "count");
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B8], "posterImageForAssetCollection:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v9, "addObject:", v12);

      ++v10;
    }
    while (a4 != v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_getDisplayableAssets:(id *)a3 indexes:(id *)a4 forCollection:(id)a5 maximumCount:(int64_t)a6 useCache:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;

  v7 = a7;
  v12 = a5;
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getDisplayableAssets:indexes:forCollection:maximumCount:useCache:", a3, a4, v12, a6, v7);

}

- (unint64_t)_stackViewStyleForCollection:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "px_isSharedAlbum"))
  {
    +[PUAlbumListSettings sharedInstance](PUAlbumListSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "shouldUseEditorialLayout") & 1) != 0)
    {
      v6 = 6;
    }
    else
    {
      -[PUAlbumListViewController spec](self, "spec");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v10, "stackViewStyle");

    }
  }
  else
  {
    v7 = objc_msgSend(v4, "px_isFolder");
    -[PUAlbumListViewController spec](self, "spec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v7)
      v9 = objc_msgSend(v8, "folderStackViewStyle");
    else
      v9 = objc_msgSend(v8, "stackViewStyle");
    v6 = v9;
  }

  return v6;
}

- (id)_visibleAssetsForCollection:(id)a3
{
  return -[PUAlbumListViewController _visibleAssetsForCollection:correspondingCollections:](self, "_visibleAssetsForCollection:correspondingCollections:", a3, 0);
}

- (id)_visibleAssetsForCollection:(id)a3 correspondingCollections:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PUAlbumListViewController _visibleAssetsForCollection:maximumNumberOfVisibleAssets:correspondingCollections:](self, "_visibleAssetsForCollection:maximumNumberOfVisibleAssets:correspondingCollections:", v6, +[PUStackView maximumNumberOfVisibleImagesForStyle:](PUStackView, "maximumNumberOfVisibleImagesForStyle:", -[PUAlbumListViewController _stackViewStyleForCollection:](self, "_stackViewStyleForCollection:", v6)), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_visibleAssetsForCollection:(id)a3 maximumNumberOfVisibleAssets:(int64_t)a4 correspondingCollections:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v12;

  v8 = a3;
  if (!objc_msgSend(v8, "px_isMacSyncedFacesFolder"))
  {
    if ((objc_msgSend(v8, "px_isPeopleVirtualCollection") & 1) == 0
      && (objc_msgSend(v8, "px_isPlacesSmartAlbum") & 1) == 0
      && (objc_msgSend(v8, "px_isHiddenSmartAlbum") & 1) == 0
      && (objc_msgSend(v8, "px_isRecentlyDeletedSmartAlbum") & 1) == 0
      && (objc_msgSend(v8, "px_isRecoveredSmartAlbum") & 1) == 0)
    {
      if (objc_msgSend(v8, "px_isFolder"))
      {
        -[PUAlbumListViewController _getDisplayableAssetsForFolder:maximumCount:useCache:correspondingCollections:](self, "_getDisplayableAssetsForFolder:maximumCount:useCache:correspondingCollections:", v8, a4, 1, a5);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
        -[PUAlbumListViewController _getDisplayableAssets:indexes:forCollection:maximumCount:useCache:](self, "_getDisplayableAssets:indexes:forCollection:maximumCount:useCache:", &v12, 0, v8, a4, 1);
        v9 = v12;
      }
      goto LABEL_4;
    }
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  -[PUAlbumListViewController _getDisplayableFacesForCollectionList:maximumCount:](self, "_getDisplayableFacesForCollectionList:maximumCount:", v8, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
  v10 = v9;
LABEL_11:

  return v10;
}

- (void)_resetPreheating
{
  -[PHCachingImageManager stopCachingImagesForAllAssets](self->__cachingImageManager, "stopCachingImagesForAllAssets");
  -[PUAlbumListViewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PUAlbumListViewController _setPreheatedCollections:](self, "_setPreheatedCollections:", 0);
}

- (void)_updatePreheatedAssets
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double x;
  double y;
  double v21;
  double v22;
  double width;
  double height;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  CGFloat v45;
  _QWORD v46[5];
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  -[PUAlbumListViewController mainScrollView](self, "mainScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v62.origin.x = v5;
  v62.origin.y = v7;
  v62.size.width = v9;
  v62.size.height = v11;
  if (!CGRectIsEmpty(v62))
  {
    -[PUAlbumListViewController _previousPreheatRect](self, "_previousPreheatRect");
    v45 = v12;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v63.origin.x = v5;
    v63.origin.y = v7;
    v63.size.width = v9;
    v63.size.height = v11;
    v64 = CGRectInset(v63, 0.0, v11 * -0.5);
    x = v64.origin.x;
    y = v64.origin.y;
    v21 = v64.origin.y - v14;
    v22 = -(v64.origin.y - v14);
    if (v21 < 0.0)
      v21 = v22;
    if (v21 > v11 / 3.0)
    {
      width = v64.size.width;
      height = v64.size.height;
      if (-[PUAlbumListViewController px_isVisible](self, "px_isVisible"))
      {
        -[PUAlbumListViewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", x, y, width, height);
        -[PUAlbumListViewController _preheatedCollections](self, "_preheatedCollections");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          -[PUAlbumListViewController _setPreheatedCollections:](self, "_setPreheatedCollections:", v25);
        }
        v56 = 0;
        v57 = &v56;
        v58 = 0x3032000000;
        v59 = __Block_byref_object_copy__8859;
        v60 = __Block_byref_object_dispose__8860;
        v61 = 0;
        v50 = 0;
        v51 = &v50;
        v52 = 0x3032000000;
        v53 = __Block_byref_object_copy__8859;
        v54 = __Block_byref_object_dispose__8860;
        v55 = 0;
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __51__PUAlbumListViewController__updatePreheatedAssets__block_invoke;
        v46[3] = &unk_1E589C0C0;
        v46[4] = self;
        v26 = v25;
        v47 = v26;
        v48 = &v56;
        v49 = &v50;
        PUDiffVerticalRects(v46, v45, v14, v16, v18, x, y, width, height);
        if (objc_msgSend((id)v57[5], "count") || objc_msgSend((id)v51[5], "count"))
        {
          -[PUAlbumListViewController _imageRequestOptions](self, "_imageRequestOptions");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUAlbumListViewController spec](self, "spec");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "imageContentMode");

          -[PUAlbumListViewController spec](self, "spec");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUAlbumListViewController _layoutReferenceSize](self, "_layoutReferenceSize");
          v32 = v31;
          v34 = v33;
          -[PUAlbumListViewController _layoutSafeAreaInsets](self, "_layoutSafeAreaInsets");
          objc_msgSend(v30, "imageSizeForLayoutReferenceSize:safeAreaInsets:", v32, v34, v35, v36, v37, v38);
          v40 = v39;
          v42 = v41;

          -[PUAlbumListViewController _cachingImageManager](self, "_cachingImageManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "startCachingImagesForAssets:targetSize:contentMode:options:", v57[5], v29, v27, v40, v42);

          -[PUAlbumListViewController _cachingImageManager](self, "_cachingImageManager");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stopCachingImagesForAssets:targetSize:contentMode:options:", v51[5], v29, v27, v40, v42);

        }
        _Block_object_dispose(&v50, 8);

        _Block_object_dispose(&v56, 8);
      }
    }
  }
}

- (id)_suppressionContexts
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D74840]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEBUG, "*** Supressing SB alerts for %@", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  PUPhotoPinchGestureRecognizer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUAlbumListViewController;
  -[PUAlbumListViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[PUAlbumListViewController updateSpec](self, "updateSpec");
  -[PUAlbumListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[PUAlbumListViewController spec](self, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesStackTransitionToGrid");

  if (v6)
  {
    v7 = -[PUPhotoPinchGestureRecognizer initWithTarget:action:]([PUPhotoPinchGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePhotoPinchGestureRecognizer_);
    -[PUPhotoPinchGestureRecognizer setDelegate:](v7, "setDelegate:", self);
    objc_msgSend(v3, "addGestureRecognizer:", v7);
    -[PUAlbumListViewController _setPhotoPinchGestureRecognizer:](self, "_setPhotoPinchGestureRecognizer:", v7);

  }
  -[PUAlbumListViewController _updateAddNewAlbumPlaceholderAnimated:](self, "_updateAddNewAlbumPlaceholderAnimated:", 0);
  -[PUAlbumListViewController _updateMainView](self, "_updateMainView");
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4D90], 0x100000, sel__handleOpenKeyCommand_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController addKeyCommand:](self, "addKeyCommand:", v8);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0x80000, sel__handleRenameKeyCommand_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController addKeyCommand:](self, "addKeyCommand:", v9);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\b"), 0, sel__handleDeleteKeyCommand_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController addKeyCommand:](self, "addKeyCommand:", v10);

  -[PUAlbumListViewController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerChangeObserver:context:", self, PXSharedLibraryStatusProviderObservationContext);

}

- (void)_setLayoutReferenceSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v9;
  double v10;

  height = a3.height;
  width = a3.width;
  -[PUAlbumListViewController _layoutReferenceSize](self, "_layoutReferenceSize");
  if (v7 != width || v6 != height)
  {
    v9 = self->__layoutReferenceSize.width;
    v10 = self->__layoutReferenceSize.height;
    self->__layoutReferenceSize.width = width;
    self->__layoutReferenceSize.height = height;
    if (*MEMORY[0x1E0C9D820] != v9 || *(double *)(MEMORY[0x1E0C9D820] + 8) != v10)
      -[PUAlbumListViewController _invalidatePreparedCellsConfiguration](self, "_invalidatePreparedCellsConfiguration");
  }
}

- (void)_setLayoutSafeAreaInsets:(UIEdgeInsets)a3
{
  if (self->__layoutSafeAreaInsets.left != a3.left
    || self->__layoutSafeAreaInsets.top != a3.top
    || self->__layoutSafeAreaInsets.right != a3.right
    || self->__layoutSafeAreaInsets.bottom != a3.bottom)
  {
    self->__layoutSafeAreaInsets = a3;
    -[PUAlbumListViewController _invalidatePreparedCellsConfiguration](self, "_invalidatePreparedCellsConfiguration");
  }
}

- (void)_updateLayoutMetrics
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  -[PUAlbumListViewController spec](self, "spec");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController gridLayout](self, "gridLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController _layoutReferenceSize](self, "_layoutReferenceSize");
  v5 = v4;
  v7 = v6;
  -[PUAlbumListViewController _layoutSafeAreaInsets](self, "_layoutSafeAreaInsets");
  objc_msgSend(v12, "configureGridLayout:forLayoutReferenceSize:safeAreaInsets:", v3, v5, v7, v8, v9, v10, v11);

}

- (void)_updateMainView
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  PUSectionedGridLayout *v35;
  PUCollectionView *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  id v57;

  -[PUAlbumListViewController spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldUseTableView");

  -[PUAlbumListViewController view](self, "view");
  v57 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bounds");
  v55 = v6;
  v56 = v5;
  v8 = v7;
  v10 = v9;
  -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v4)
  {
    if (!v11)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D48]), "initWithFrame:style:", -[PUAlbumListViewController tableViewStyle](self, "tableViewStyle"), v56, v55, v8, v10);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, v8, 1.17549435e-38);
      objc_msgSend(v12, "setTableHeaderView:", v13);

      objc_msgSend(v12, "setAutoresizingMask:", 18);
      objc_msgSend(v12, "setAlwaysBounceVertical:", 1);
      objc_msgSend(v12, "setDataSource:", self);
      objc_msgSend(v12, "setDelegate:", self);
      -[PUAlbumListViewController backgroundColorForTableView](self, "backgroundColorForTableView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v12, "setBackgroundColor:", v14);
      objc_msgSend(v12, "setAllowsSelection:", 1);
      objc_msgSend(v12, "setAllowsSelectionDuringEditing:", 0);
      objc_msgSend(v12, "setAllowsMultipleSelection:", 0);
      objc_msgSend(v12, "setSeparatorStyle:", 0);
      objc_msgSend(v12, "setCellLayoutMarginsFollowReadableWidth:", 0);
      objc_msgSend(v57, "addSubview:", v12);
      -[PUAlbumListViewController _setMainTableView:](self, "_setMainTableView:", v12);
      -[PUAlbumListViewController setViewInSyncWithModel:](self, "setViewInSyncWithModel:", 0);

    }
    -[PUAlbumListViewController spec](self, "spec");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    objc_msgSend(v15, "cellSizeForBounds:");
    objc_msgSend(v12, "setEstimatedRowHeight:", v17);

    objc_msgSend(v12, "setSectionHeaderHeight:", 0.0);
    -[PUAlbumListViewController spec](self, "spec");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sectionFooterHeight");
    v20 = v19;

    objc_msgSend(v12, "setSectionFooterHeight:", v20);
  }
  else
  {
    if (!v11)
      goto LABEL_10;
    objc_msgSend(v11, "setDataSource:", 0);
    objc_msgSend(v12, "setDelegate:", 0);
    objc_msgSend(v12, "removeFromSuperview");
    -[PUAlbumListViewController _setMainTableView:](self, "_setMainTableView:", 0);
  }

LABEL_10:
  -[PUAlbumListViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v23 = v22;
  v25 = v24;

  -[PUAlbumListViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "safeAreaInsets");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  -[PUAlbumListViewController _setLayoutReferenceSize:](self, "_setLayoutReferenceSize:", v23, v25);
  -[PUAlbumListViewController _setLayoutSafeAreaInsets:](self, "_setLayoutSafeAreaInsets:", v28, v30, v32, v34);
  -[PUAlbumListViewController _mainCollectionViewLayout](self, "_mainCollectionViewLayout");
  v35 = (PUSectionedGridLayout *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v36 = (PUCollectionView *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) == 0)
  {
    if (!v35)
    {
      v35 = objc_alloc_init(PUSectionedGridLayout);
      -[PUSectionedGridLayout setDelegate:](v35, "setDelegate:", self);
      -[PUAlbumListViewController _setMainCollectionViewLayout:](self, "_setMainCollectionViewLayout:", v35);
    }
    -[PUAlbumListViewController _updateLayoutMetrics](self, "_updateLayoutMetrics");
    -[PUAlbumListViewController spec](self, "spec");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController _layoutReferenceSize](self, "_layoutReferenceSize");
    v39 = v38;
    v41 = v40;
    -[PUAlbumListViewController _layoutSafeAreaInsets](self, "_layoutSafeAreaInsets");
    objc_msgSend(v37, "sectionInsetsForLayoutReferenceSize:safeAreaInsets:", v39, v41, v42, v43, v44, v45);
    v47 = v46;
    v49 = v48;

    -[PUAlbumListViewController navigationItem](self, "navigationItem");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setLargeTitleInsets:", 0.0, v47, 0.0, v49);

    if (-[PUAlbumListViewController isRootFolder](self, "isRootFolder")
      && (-[PUAlbumListViewController spec](self, "spec"),
          v51 = (void *)objc_claimAutoreleasedReturnValue(),
          v52 = objc_msgSend(v51, "shouldShowSectionHeaders"),
          v51,
          v52))
    {
      -[PUSectionedGridLayout setSectionHeadersEnabled:](v35, "setSectionHeadersEnabled:", 1);
      -[PUSectionedGridLayout setFloatingSectionHeadersEnabled:](v35, "setFloatingSectionHeadersEnabled:", 0);
      -[PUSectionedGridLayout setSectionHeaderElementKind:](v35, "setSectionHeaderElementKind:", CFSTR("PUAlbumListViewControllerElementKindSectionHeader"));
      if (v36)
        goto LABEL_23;
    }
    else
    {
      -[PUSectionedGridLayout setSectionHeadersEnabled:](v35, "setSectionHeadersEnabled:", 0);
      if (v36)
        goto LABEL_23;
    }
    v36 = -[PUCollectionView initWithFrame:collectionViewLayout:]([PUCollectionView alloc], "initWithFrame:collectionViewLayout:", v35, v56, v55, v8, v10);
    -[PUCollectionView registerClass:forCellWithReuseIdentifier:](v36, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("albumCell"));
    -[PUCollectionView registerClass:forCellWithReuseIdentifier:](v36, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("folderCell"));
    -[PUCollectionView registerClass:forCellWithReuseIdentifier:](v36, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("placeholderCell"));
    -[PUCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v36, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUGridGlobalHeader"), CFSTR("PUGridGlobalHeader"));
    -[PUCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v36, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUGridGlobalFooter"), CFSTR("PUGridGlobalFooter"));
    -[PUCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v36, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("PUAlbumListViewControllerElementKindSectionHeader"), CFSTR("PUAlbumListViewControllerElementKindSectionHeader"));
    -[PUCollectionView setAutoresizingMask:](v36, "setAutoresizingMask:", 18);
    -[PUCollectionView setAlwaysBounceVertical:](v36, "setAlwaysBounceVertical:", 1);
    -[PUCollectionView setPrefetchingEnabled:](v36, "setPrefetchingEnabled:", 1);
    -[PUCollectionView setDataSource:](v36, "setDataSource:", self);
    -[PUCollectionView setDelegate:](v36, "setDelegate:", self);
    -[PUCollectionView setReorderDelegate:](v36, "setReorderDelegate:", self);
    -[PUAlbumListViewController setupDropDelegateForCollectionView:](self, "setupDropDelegateForCollectionView:", v36);
    -[PUCollectionView setSpringLoaded:](v36, "setSpringLoaded:", 1);
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "photoCollectionViewBackgroundColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUCollectionView setBackgroundColor:](v36, "setBackgroundColor:", v54);
    objc_msgSend(v57, "addSubview:", v36);
    -[PUAlbumListViewController _setMainCollectionView:](self, "_setMainCollectionView:", v36);
    -[PUAlbumListViewController setViewInSyncWithModel:](self, "setViewInSyncWithModel:", 0);

    goto LABEL_23;
  }
  if (v35)
  {
    -[PUSectionedGridLayout setDelegate:](v35, "setDelegate:", 0);
    -[PUAlbumListViewController _setMainCollectionViewLayout:](self, "_setMainCollectionViewLayout:", 0);
  }
  if (v36)
  {
    -[PUCollectionView setDataSource:](v36, "setDataSource:", 0);
    -[PUCollectionView setDelegate:](v36, "setDelegate:", 0);
    -[PUCollectionView setDragDestinationDelegate:](v36, "setDragDestinationDelegate:", 0);
    -[PUCollectionView setReorderDelegate:](v36, "setReorderDelegate:", 0);
    -[PUCollectionView removeFromSuperview](v36, "removeFromSuperview");
    -[PUAlbumListViewController _setMainCollectionView:](self, "_setMainCollectionView:", 0);
  }
LABEL_23:

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAlbumListViewController;
  -[PUAlbumListViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[PUAlbumListViewController updateInterfaceLayoutIfNecessary](self, "updateInterfaceLayoutIfNecessary");
  -[PUAlbumListViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUAlbumListViewController;
  -[PUAlbumListViewController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  -[PUAlbumListViewController mainScrollView](self, "mainScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  -[PUAlbumListViewController mainScrollView](self, "mainScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[PUAlbumListViewController _onViewDidLayoutSubviewsBlock](self, "_onViewDidLayoutSubviewsBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUAlbumListViewController _onViewDidLayoutSubviewsBlock](self, "_onViewDidLayoutSubviewsBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

    -[PUAlbumListViewController _setOnViewDidLayoutSubviewsBlock:](self, "_setOnViewDidLayoutSubviewsBlock:", 0);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  PUAlbumListViewController *v20;
  id v21;
  objc_super v22;

  v3 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PUAlbumListViewController;
  -[PUAlbumListViewController viewWillAppear:](&v22, sel_viewWillAppear_);
  -[PUAlbumListViewController _resetPreheating](self, "_resetPreheating");
  -[PUAlbumListViewController pushedAlbum](self, "pushedAlbum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController setPushedAlbum:](self, "setPushedAlbum:", 0);
  -[PUAlbumListViewController setPushedController:](self, "setPushedController:", 0);
  if (!-[PUAlbumListViewController isViewInSyncWithModel](self, "isViewInSyncWithModel"))
  {
    -[PUAlbumListViewController _updateAlbumSubtitleFormat](self, "_updateAlbumSubtitleFormat");
    -[PUAlbumListViewController _updateInterfaceForModelReloadAnimated:](self, "_updateInterfaceForModelReloadAnimated:", 0);
  }
  if (v5)
  {
    -[PUAlbumListViewController indexPathForCollection:](self, "indexPathForCollection:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PUAlbumListViewController presentingViewController](self, "presentingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "transitionCoordinator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __44__PUAlbumListViewController_viewWillAppear___block_invoke;
      v19 = &unk_1E58A40C0;
      v20 = self;
      v6 = v6;
      v21 = v6;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", &v16, 0);

    }
    goto LABEL_9;
  }
  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceAlbum");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_9:

    goto LABEL_10;
  }
  v10 = (void *)v9;
  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "scrollToSourceAlbumWhenPresented");

  if (v12)
  {
    -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceAlbum");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController _performOrScheduleScrollToCollection:animated:](self, "_performOrScheduleScrollToCollection:animated:", v13, 0);

    goto LABEL_9;
  }
LABEL_10:
  -[PUAlbumListViewController deselectSelectedItemAnimated:](self, "deselectSelectedItemAnimated:", v3, v16, v17, v18, v19, v20);
  -[UIViewController pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:](self, "pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:", v3);
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "prepareBackgroundFetchingIfNeeded");

  objc_msgSend(MEMORY[0x1E0D7BB98], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventSourceWillAppear:sender:", 14, self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAlbumListViewController;
  -[PUAlbumListViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[PUAlbumListViewController editableTitleView](self, "editableTitleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PUAlbumListViewController;
  -[PUAlbumListViewController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  -[PUAlbumListViewController _suppressionContexts](self, "_suppressionContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v4;
    v7 = v6;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "*** %@ Suppressing SB alerts for %@", buf, 0x16u);

  }
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "notificationSuppressionContextManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNotificationSuppressionContexts:", v4);

  -[PUAlbumListViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXAppIntentsRegisterViewAnnotationView();

  PXRegisterAppIntentsViewAnnotationDelegate();
  if (-[PUAlbumListViewController isRootSharedAlbumList](self, "isRootSharedAlbumList"))
  {
    PLSAggregateDictionaryAddValueForScalarKey();
    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.photoStreamList"), MEMORY[0x1E0C9AA70]);
  }
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startBackgroundFetchingIfNeeded");

  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v11, (id *)buf);
  px_dispatch_on_main_queue_when_idle_after_delay();
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

- (void)_postDidAppearActions
{
  void *v3;
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id from;
  id location;

  if (-[PUAlbumListViewController px_isVisible](self, "px_isVisible")
    && -[PUAlbumListViewController canShowSyncProgress](self, "canShowSyncProgress"))
  {
    -[PUAlbumListViewController updateSyncProgress](self, "updateSyncProgress");
  }
  objc_msgSend(MEMORY[0x1E0D7BB38], "preloadResourcesForStyle:", 2);
  if (!self->_didInitialRequestForPlacesCount)
  {
    self->_didInitialRequestForPlacesCount = 1;
    objc_initWeak(&location, self);
    -[PUAlbumListViewController _placesAlbumCoverProvider](self, "_placesAlbumCoverProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&from, v3);

    v4 = dispatch_time(0, 1000000000);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__PUAlbumListViewController__postDidAppearActions__block_invoke;
    v5[3] = &unk_1E589EBC8;
    objc_copyWeak(&v6, &from);
    objc_copyWeak(&v7, &location);
    dispatch_after(v4, MEMORY[0x1E0C80D38], v5);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PUAlbumListViewController;
  -[PUAlbumListViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  -[PUAlbumListViewController _resetPreheating](self, "_resetPreheating");
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pauseBackgroundFetching");

  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    v7 = v6;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "*** %@ ending suppresion contexts", buf, 0xCu);

  }
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "notificationSuppressionContextManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNotificationSuppressionContexts:", 0);

  objc_msgSend(MEMORY[0x1E0D7BB98], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventSourceDidDisappear:sender:", 14, self);

  PXUnregisterAppIntentsViewAnnotationDelegate();
}

- (id)backgroundColorForTableView
{
  void *v2;
  void *v3;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoCollectionViewBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)tableViewStyle
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUAlbumListViewController;
  -[PUAlbumListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PUAlbumListViewController retitlingCollection](self, "retitlingCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[PUAlbumListViewController navigateToRevealAssetCollection:initiallyHidden:animated:](self, "navigateToRevealAssetCollection:initiallyHidden:animated:", v5, 0, 1);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[5];
  BOOL v27;
  objc_super v28;

  v4 = a4;
  v5 = a3;
  if (!a3)
  {
    -[PUAlbumListViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endEditing:", 1);

  }
  v8 = -[PUAlbumListViewController isEditing](self, "isEditing");
  v28.receiver = self;
  v28.super_class = (Class)PUAlbumListViewController;
  -[PUAlbumListViewController setEditing:animated:](&v28, sel_setEditing_animated_, v5, v4);
  if (v8 != v5)
  {
    v9 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __49__PUAlbumListViewController_setEditing_animated___block_invoke;
    v26[3] = &unk_1E589C0E8;
    v26[4] = self;
    v27 = v4;
    -[PUAlbumListViewController _enumerateIndexPathsForPreparedItemsUsingBlock:](self, "_enumerateIndexPathsForPreparedItemsUsingBlock:", v26);
    -[PUAlbumListViewController _updatePeripheralInterfaceAnimated:](self, "_updatePeripheralInterfaceAnimated:", v4);
    if (v5)
    {
      -[PUAlbumListViewController indexPathForFirstEditableAlbum](self, "indexPathForFirstEditableAlbum");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 1;
      -[PUAlbumListViewController indexPathsForVisibleItems](self, "indexPathsForVisibleItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v9;
      v17 = 3221225472;
      v18 = __49__PUAlbumListViewController_setEditing_animated___block_invoke_2;
      v19 = &unk_1E589C110;
      v12 = v10;
      v20 = v12;
      v21 = &v22;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v16);

      if (*((_BYTE *)v23 + 24))
      {
        -[PUAlbumListViewController indexPathForFirstEditableAlbum](self, "indexPathForFirstEditableAlbum", v16, v17, v18, v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUAlbumListViewController scrollToItemAtIndexPath:centered:animated:](self, "scrollToItemAtIndexPath:centered:animated:", v13, 1, v4);

      }
      _Block_object_dispose(&v22, 8);

    }
    objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self, v16, v17, v18, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsFocusUpdate");

  }
  -[PUAlbumListViewController _mainTableView](self, "_mainTableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEditing:animated:", -[PUAlbumListViewController isEditing](self, "isEditing"), v4);

}

- (BOOL)pu_wantsToolbarVisible
{
  void *v3;
  int v4;
  void *v5;
  int v6;

  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isForAssetPicker");

  if (v4)
  {
    -[PUAlbumListViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isToolbarHidden") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUAlbumListViewController;
  v6 = a4;
  -[PUAlbumListViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a3, v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__PUAlbumListViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_1E58A7A08;
  v7[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v7);

}

- (void)_handlePendingScrollingAnimationEndBlock
{
  void (**v3)(void);

  -[PUAlbumListViewController _pendingScrollingAnimationEndBlock](self, "_pendingScrollingAnimationEndBlock");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUAlbumListViewController _setPendingScrollingAnimationEndBlock:](self, "_setPendingScrollingAnimationEndBlock:", 0);
    v3[2]();
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUAlbumListViewController _photoPinchGestureRecognizer](self, "_photoPinchGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    return -[PUAlbumListViewController isEditing](self, "isEditing") ^ 1;
  else
    return 1;
}

- (void)setKeyboardAware:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  id v6;

  if (self->__isKeyboardAware != a3)
  {
    self->__isKeyboardAware = a3;
    v4 = -[PUAlbumListViewController _isKeyboardAware](self, "_isKeyboardAware");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__keyboardWillChangeFrame_, *MEMORY[0x1E0DC4FD8], 0);
    else
      objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FD8], 0);

  }
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PUAlbumListViewController retitlingCollection](self, "retitlingCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PUAlbumListViewController mainScrollView](self, "mainScrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController px_safeAreaInsets](self, "px_safeAreaInsets");
    objc_msgSend(v5, "px_adjustInsetsForKeyboardInfo:safeAreaInsets:", v6);

  }
}

- (void)sessionInfoPhotoSelectionDidChange:(id)a3
{
  -[PUAlbumListViewController updateNavigationBarAnimated:](self, "updateNavigationBarAnimated:", 0);
  -[PUAlbumListViewController _updateNavigationBannerAnimated:](self, "_updateNavigationBannerAnimated:", 0);
}

- (void)updateSyncProgress
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v12 = 1;
  -[PUAlbumListViewController photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSyncProgressReturningImportOperations:", &v12);

  v11 = 0;
  v10 = 0;
  if (v4 && -[PUAlbumListViewController canShowSyncProgress](self, "canShowSyncProgress"))
  {
    objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getPhotoCount:videoCount:", &v11, &v10);

    -[PUAlbumListViewController setSyncProgressVisible:](self, "setSyncProgressVisible:", 1);
    -[PUAlbumListViewController syncProgressView](self, "syncProgressView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__PUAlbumListViewController_updateSyncProgress__block_invoke;
    v8[3] = &__block_descriptor_52_e36_v16__0___PXMutableFooterViewModel__8l;
    v8[4] = v11;
    v8[5] = v10;
    v9 = v12;
    objc_msgSend(v7, "performChanges:", v8);

  }
  else
  {
    -[PUAlbumListViewController setSyncProgressVisible:](self, "setSyncProgressVisible:", 0);
  }
}

- (void)_updateAlbumSubtitleFormat
{
  NSString *v3;
  NSString *albumSubtitleFormat;
  id v5;

  objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncedAlbumSubtitleStringFormat");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  albumSubtitleFormat = self->_albumSubtitleFormat;
  self->_albumSubtitleFormat = v3;

}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController collection](self, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeDetailsForObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectAfterChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("updatedCollection"));

  return v6;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PUAlbumListViewController collection](self, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("updatedCollection"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      objc_msgSend(v10, "changeDetailsForObject:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAfterChanges");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_5;
    }
    -[PUAlbumListViewController setCollection:](self, "setCollection:", v8);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)albumListCellContentView:(id)a3 performDeleteAction:(id)a4
{
  id v5;

  -[PUAlbumListViewController indexPathForAlbumListCellContentView:](self, "indexPathForAlbumListCellContentView:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController _handleDeleteAlbumAtIndexPath:](self, "_handleDeleteAlbumAtIndexPath:", v5);

}

- (BOOL)albumListCellContentViewShouldBeginRetitling:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;

  -[PUAlbumListViewController indexPathForAlbumListCellContentView:](self, "indexPathForAlbumListCellContentView:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUAlbumListViewController shouldBeginRetitlingAlbumAtIndexPath:](self, "shouldBeginRetitlingAlbumAtIndexPath:", v4);
  if (v5)
  {
    -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController setRetitlingCollection:](self, "setRetitlingCollection:", v6);
    -[PUAlbumListViewController setKeyboardAware:](self, "setKeyboardAware:", 1);

  }
  return v5;
}

- (void)albumListCellContentView:(id)a3 didEndRetitlingFromTitle:(id)a4 toTitle:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PUAlbumListViewController indexPathForAlbumListCellContentView:](self, "indexPathForAlbumListCellContentView:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    if ((objc_msgSend(v10, "isEqualToString:", v9) & 1) == 0)
    {
      if (v12)
      {
        -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "canRenameCollection:", v12);

        if (v14)
        {
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B8A0]), "initWithCollection:title:", v12, v10);
          -[PUAlbumListViewController undoManager](self, "undoManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __87__PUAlbumListViewController_albumListCellContentView_didEndRetitlingFromTitle_toTitle___block_invoke;
          v23[3] = &unk_1E58AA020;
          v24 = v8;
          v25 = v10;
          objc_msgSend(v22, "executeWithUndoManager:completionHandler:", v15, v23);

          v16 = (void *)MEMORY[0x1E0D09910];
          v28 = *MEMORY[0x1E0D09818];
          v17 = v28;
          v29[0] = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.albumRenamed"), v18);

          v19 = (void *)MEMORY[0x1E0D09910];
          v26 = v17;
          v27 = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.albumRenamedFromEditableTitle"), v20);

        }
      }
    }
  }
  -[PUAlbumListViewController retitlingCollection](self, "retitlingCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == v21)
  {
    -[PUAlbumListViewController setKeyboardAware:](self, "setKeyboardAware:", 0);
    -[PUAlbumListViewController setRetitlingCollection:](self, "setRetitlingCollection:", 0);
  }

}

- (id)_collectionForNavigation
{
  void *v3;
  void *v4;

  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PUAlbumListViewController collection](self, "collection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;

  v5 = a3;
  -[PUAlbumListViewController _collectionForNavigation](self, "_collectionForNavigation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if ((v8 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v5, "collectionHierarchy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_objectAfterObject:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    v12 = 0;
    goto LABEL_8;
  }
  v11 = (void *)v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 3169, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[collectionHierarchy px_objectAfterObject:ownCollection]"), v16, v17);

  }
  -[PUAlbumListViewController indexPathForCollection:](self, "indexPathForCollection:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  if (v12)
LABEL_6:
    v12 = 3;
LABEL_8:

  return v12;
}

- (void)_navigateToDestination:(id)a3 provideViewControllers:(BOOL)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  id v11;
  void (**v12)(id, void *, uint64_t, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  PUAlbumListViewController *v34;
  id v35;
  void (**v36)(id, void *, uint64_t, _QWORD);
  unint64_t v37;
  SEL v38;
  _QWORD v39[5];
  id v40;
  id v41;
  void (**v42)(id, void *, uint64_t, _QWORD);
  id v43;
  PUAlbumListViewController *v44;
  _QWORD v45[2];
  PUAlbumListViewController *v46;
  PUAlbumListViewController *v47;
  uint8_t buf[4];
  PUAlbumListViewController *v49;
  __int16 v50;
  id v51;
  _QWORD v52[4];

  v8 = a4;
  v52[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (void (**)(id, void *, uint64_t, _QWORD))a6;
  -[PUAlbumListViewController _collectionForNavigation](self, "_collectionForNavigation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sidebarBackNavigationRootDestination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "collection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", v13);

  if (v16)
  {
    -[PUAlbumListViewController navigationItem](self, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_setHidesBackButtonInRegularWidth:", 1);
    -[PUAlbumListViewController traitCollection](self, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_updateBackButtonVisibilityForTraitCollection:", v18);

  }
  objc_msgSend(v11, "collection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqual:", v13);

  if (v20)
  {
    v52[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v21, 1, 0);
  }
  else
  {
    objc_msgSend(v11, "collectionHierarchy");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "px_objectAfterObject:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[PUAlbumListViewController indexPathForCollection:](self, "indexPathForCollection:", v22),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v23,
          v23))
    {
      v24 = objc_msgSend(v11, "type") == 8 && objc_msgSend(v11, "revealMode") == 2;
      if (-[PUAlbumListViewController isEditing](self, "isEditing"))
        -[PUAlbumListViewController setEditing:](self, "setEditing:", 0);
      -[PUAlbumListViewController _performOrScheduleScrollToCollection:animated:](self, "_performOrScheduleScrollToCollection:animated:", v22, 0);
      if (v24)
      {
        v46 = self;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v26, 1, 0);
      }
      else if (v8)
      {
        v43 = 0;
        -[PUAlbumListViewController _viewControllerForCollection:userActivity:](self, "_viewControllerForCollection:userActivity:", v22, &v43);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v43;
        if ((objc_msgSend(v27, "routingOptionsForDestination:", v11) & 2) != 0)
        {
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __101__PUAlbumListViewController__navigateToDestination_provideViewControllers_options_completionHandler___block_invoke;
          v39[3] = &unk_1E589C158;
          v39[4] = self;
          v42 = v12;
          v40 = v27;
          v41 = v26;
          objc_msgSend(v40, "provideViewControllersForDestination:options:completionHandler:", v11, a5, v39);

        }
        else if (v27)
        {
          v45[0] = self;
          v45[1] = v27;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v12[2](v12, v28, 1, 0);

          objc_msgSend(v26, "becomeCurrent");
        }
        else
        {
          PXAssertGetLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v49 = self;
            v50 = 2112;
            v51 = v11;
            _os_log_error_impl(&dword_1AAB61000, v29, OS_LOG_TYPE_ERROR, "Albums list %@ failed to navigate to destination %@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Albums list %@ failed to navigate to destination %@"), self, v11);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = self;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, uint64_t, void *))v12)[2](v12, v31, 2, v30);

        }
      }
      else
      {
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __101__PUAlbumListViewController__navigateToDestination_provideViewControllers_options_completionHandler___block_invoke_386;
        v32[3] = &unk_1E589C8E8;
        v33 = v11;
        v37 = a5;
        v38 = a2;
        v36 = v12;
        v34 = self;
        v35 = v22;
        -[PUAlbumListViewController navigateToCollection:animated:completion:](self, "navigateToCollection:animated:completion:", v35, 0, v32);

        v26 = v33;
      }
    }
    else
    {
      PXAssertGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v49 = self;
        v50 = 2112;
        v51 = v11;
        _os_log_error_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_ERROR, "Albums list %@ failed to navigate to destination %@", buf, 0x16u);
      }

      v47 = self;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v26, 2, 0);
    }

  }
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__PUAlbumListViewController_navigateToDestination_options_completionHandler___block_invoke;
  v10[3] = &unk_1E589C1A8;
  v11 = v8;
  v9 = v8;
  -[PUAlbumListViewController _navigateToDestination:provideViewControllers:options:completionHandler:](self, "_navigateToDestination:provideViewControllers:options:completionHandler:", a3, 0, a4, v10);

}

- (void)provideViewControllersForDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  -[PUAlbumListViewController _navigateToDestination:provideViewControllers:options:completionHandler:](self, "_navigateToDestination:provideViewControllers:options:completionHandler:", a3, 1, a4, a5);
}

- (id)px_navigationDestination
{
  void *v2;
  void *v3;

  -[PUAlbumListViewController _collectionForNavigation](self, "_collectionForNavigation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B868]), "initWithObject:revealMode:", v2, 0);
  else
    v3 = 0;

  return v3;
}

- (BOOL)canNavigateToCollection:(id)a3
{
  void *v3;
  BOOL v4;

  -[PUAlbumListViewController indexPathForCollection:](self, "indexPathForCollection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_createControllerForFolder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[PUAlbumListViewController newGridViewControllerForFolder:](self, "newGridViewControllerForFolder:", v4);
  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionInfo:", v6);

  objc_msgSend(v5, "setCanShowAggregateItem:", 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", v4);

  objc_msgSend(v5, "setDataSourceManagerConfiguration:", v7);
  objc_msgSend(v5, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_setPreferredLargeTitleDisplayMode:", 2);

  return v5;
}

- (void)navigateToCollection:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *);
  void *v10;
  id v11;
  void *v12;
  int v13;
  PUStackedAlbumTransition *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v18 = 0;
  -[PUAlbumListViewController _viewControllerForCollection:userActivity:](self, "_viewControllerForCollection:userActivity:", v8, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  -[PUAlbumListViewController spec](self, "spec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "usesStackTransitionToGrid")
    && -[PUAlbumListViewController _canUseStackTransitionFromCollection:](self, "_canUseStackTransitionFromCollection:", v8))
  {
    v13 = objc_msgSend(v10, "conformsToProtocol:", &unk_1EEC31120);

    if (v13)
    {
      v14 = objc_alloc_init(PUStackedAlbumTransition);
      -[PUStackedAlbumTransition ph_setPhotoCollection:](v14, "ph_setPhotoCollection:", v8);
      v15 = objc_msgSend(v8, "px_isFolder");
      -[PUStackedAlbumTransition setForStandInAlbum:](v14, "setForStandInAlbum:", v15);
      -[PUStackedAlbumTransition setForFolder:](v14, "setForFolder:", v15);
      -[PUStackedAlbumTransition setDelegate:](v14, "setDelegate:", self);
      goto LABEL_7;
    }
  }
  else
  {

  }
  v14 = 0;
LABEL_7:
  -[PUAlbumListViewController navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pu_pushViewController:withTransition:animated:isInteractive:", v10, v14, v6, 0);

  if (v9)
  {
    -[PUAlbumListViewController pushedController](self, "pushedController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v17);

  }
  objc_msgSend(v11, "becomeCurrent");

}

- (id)_viewControllerForCollection:(id)a3 userActivity:(id *)a4
{
  id v6;
  int v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "px_isFolder");
  if (v7)
  {
    -[PUAlbumListViewController _createControllerForFolder:](self, "_createControllerForFolder:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v6;
    if (objc_msgSend(v9, "isPlacesAlbum"))
    {
      -[PUAlbumListViewController _navigateToPlacesFromCollection:](self, "_navigateToPlacesFromCollection:", v9);
      v8 = 0;
    }
    else
    {
      v8 = -[PUAlbumListViewController newGridViewControllerForAssetCollection:](self, "newGridViewControllerForAssetCollection:", v9);
    }

  }
  -[PUAlbumListViewController setPushedController:](self, "setPushedController:", v8);
  -[PUAlbumListViewController setPushedAlbum:](self, "setPushedAlbum:", v6);
  if (a4
    && ((v7 | objc_msgSend(MEMORY[0x1E0CA5920], "px_allowsDonationsForCurrentProcess") ^ 1) & 1) == 0)
  {
    v10 = v6;
    v11 = objc_msgSend(v10, "assetCollectionSubtype");
    if (v11 != 205 && v11 != 1000000201)
    {
      objc_msgSend(v10, "localizedTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.mobileslideshow.album"));
        px_deferredLocalizedStringWithFormat();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTitle:", v14, v12);

        objc_msgSend(v13, "setEligibleForSearch:", 1);
        objc_msgSend(v13, "_setEligibleForPrediction:", 1);
        objc_msgSend(v13, "setEligibleForHandoff:", 0);
        v19 = CFSTR("uuid");
        objc_msgSend(v10, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addUserInfoEntriesFromDictionary:", v16);

        objc_msgSend(v13, "px_setPersistentIdentifierFromAssetCollection:", v10);
        -[PUAlbumListViewController setSiriActionActivity:](self, "setSiriActionActivity:", v13);
        v17 = objc_retainAutorelease(v13);
        *a4 = v17;

      }
    }

  }
  return v8;
}

- (void)navigateToAllPhotosAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v4 = a3;
  v9 = (void (**)(id, void *))a4;
  v6 = -[PUAlbumListViewController newGridViewControllerForAllPhotos](self, "newGridViewControllerForAllPhotos");
  -[PUAlbumListViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pu_pushViewController:withTransition:animated:isInteractive:", v6, 0, v4, 0);

  if (v9)
  {
    -[PUAlbumListViewController pushedController](self, "pushedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v8);

  }
}

- (void)_navigateToPeopleAnimated:(BOOL)a3 withPersonLocalIdentifier:(id)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v6 = a3;
  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  -[PUAlbumListViewController _peopleAlbumProvider](self, "_peopleAlbumProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "peopleViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "px_setPreferredLargeTitleDisplayMode:", 2);

  -[PUAlbumListViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pu_pushViewController:withTransition:animated:isInteractive:", v11, 0, v6, 0);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type != %d && (verifiedType == %d || verifiedType == %d)"), -1, 2, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPredicate:", v16);

    objc_msgSend(v15, "setFetchLimit:", 1);
    v17 = (void *)MEMORY[0x1E0CD16C0];
    v26[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fetchPersonsWithLocalIdentifiers:options:", v18, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "fetchedObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = objc_alloc(MEMORY[0x1E0D7B688]);
      v25 = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithPeople:ignoreSharedLibraryFilters:", v23, 0);

      objc_msgSend(v13, "pu_pushViewController:withTransition:animated:isInteractive:", v24, 0, 0, 0);
    }

  }
  if (v9)
    v9[2](v9, v11);

}

- (void)_navigateToMemories
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 3391, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (void)_navigateToPlacesFromCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  PUAlbumListViewController *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "assetCollectionSubtype") == 1000000203)
  {
    -[PUAlbumListViewController px_gridPresentation](self, "px_gridPresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createPlacesViewControllerForAssetCollection:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_setPreferredLargeTitleDisplayMode:", 2);

    -[PUAlbumListViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pu_pushViewController:withTransition:animated:isInteractive:", v6, 0, 1, 0);

    if (objc_msgSend(MEMORY[0x1E0CA5920], "px_allowsDonationsForCurrentProcess"))
    {
      v9 = (void *)MEMORY[0x1E0CA5920];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __61__PUAlbumListViewController__navigateToPlacesFromCollection___block_invoke_2;
      v10[3] = &unk_1E589FD58;
      v11 = v4;
      v12 = self;
      objc_msgSend(v9, "px_requestActivityWithActivityType:titleProvider:completionBlock:", CFSTR("com.apple.mobileslideshow.album"), &__block_literal_global_8817, v10);

    }
  }

}

- (void)showPlacesPlaceholderImageInStackView:(id)a3 andContentView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[PUAlbumListViewController spec](self, "spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emptyAlbumPlaceholderImageForWindow:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[PUAlbumListViewController _updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:](self, "_updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:", v7, 0, 0, v10);
  objc_msgSend(v6, "setCustomImageView:", 0);

}

- (void)showPlacesCount:(int64_t)a3
{
  id v5;

  -[PUAlbumListViewController indexPathForPlacesAlbum](self, "indexPathForPlacesAlbum");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController showPlacesCount:atIndexPath:](self, "showPlacesCount:atIndexPath:", a3, v5);

}

- (void)showPlacesCount:(int64_t)a3 atIndexPath:(id)a4
{
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  id v9;

  -[PUAlbumListViewController _preparedPlaceholderListCellContentViewAtIndexPath:](self, "_preparedPlaceholderListCellContentViewAtIndexPath:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    PLSharedCountFormatter();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromNumber:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR(" ");
    v8 = CFSTR(" ");
  }
  objc_msgSend(v9, "setSubtitle:animated:", v7, 1);

}

- (BOOL)_canUseStackTransitionFromCollection:(id)a3
{
  id v4;
  char v5;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  if ((objc_msgSend(v4, "px_isHiddenSmartAlbum") & 1) != 0
    || (objc_msgSend(v4, "px_isRecentlyDeletedSmartAlbum") & 1) != 0
    || objc_msgSend(v4, "px_isRecoveredSmartAlbum"))
  {
    *((_BYTE *)v12 + 24) = 0;
  }
  else if (objc_msgSend(v4, "px_isFolder"))
  {
    v7 = v4;
    -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetsFetchResultForCollection:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__PUAlbumListViewController__canUseStackTransitionFromCollection___block_invoke;
    v10[3] = &unk_1E589C1F0;
    v10[4] = &v11;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

  }
  v5 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v5;
}

- (void)navigateToRevealAssetCollection:(id)a3 initiallyHidden:(BOOL)a4 animated:(BOOL)a5
{
  -[PUAlbumListViewController _performOrScheduleScrollToCollection:animated:](self, "_performOrScheduleScrollToCollection:animated:", a3, a5);
}

- (void)_performOrScheduleScrollToCollection:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  BOOL v10;
  id location;

  v4 = a4;
  v6 = a3;
  if (-[PUAlbumListViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUAlbumListViewController _scrollToCollection:animated:](self, "_scrollToCollection:animated:", v6, v4);
  }
  else
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75__PUAlbumListViewController__performOrScheduleScrollToCollection_animated___block_invoke;
    v7[3] = &unk_1E58A62D0;
    objc_copyWeak(&v9, &location);
    v8 = v6;
    v10 = v4;
    -[PUAlbumListViewController _setOnViewDidLayoutSubviewsBlock:](self, "_setOnViewDidLayoutSubviewsBlock:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)_scrollToCollection:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (-[PUAlbumListViewController isViewInSyncWithModel](self, "isViewInSyncWithModel"))
  {
    -[PUAlbumListViewController indexPathForCollection:](self, "indexPathForCollection:", v8);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[PUAlbumListViewController scrollToItemAtIndexPath:centered:animated:](self, "scrollToItemAtIndexPath:centered:animated:", v6, 1, v4);

    }
  }

}

- (BOOL)cloudFeedAssetIsAvailableForNavigation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[PUAlbumListViewController _nextCloudFeedNavigatingObject](self, "_nextCloudFeedNavigatingObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "cloudFeedAssetIsAvailableForNavigation:", v4);
  else
    v7 = 1;

  return v7;
}

- (BOOL)cloudFeedCommentIsAvailableForNavigation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[PUAlbumListViewController _nextCloudFeedNavigatingObject](self, "_nextCloudFeedNavigatingObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "cloudFeedCommentIsAvailableForNavigation:", v4);
  else
    v7 = 1;

  return v7;
}

- (BOOL)cloudFeedInvitationForAlbumIsAvailableForNavigation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[PUAlbumListViewController _nextCloudFeedNavigatingObject](self, "_nextCloudFeedNavigatingObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "cloudFeedInvitationForAlbumIsAvailableForNavigation:", v4);
  else
    v7 = 1;

  return v7;
}

- (void)navigateToSharedAlbumActivityFeedAnimated:(BOOL)a3 configuration:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  PUAlbumListViewController *v23;
  uint64_t v24;

  v6 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = -[PUAlbumListViewController newCloudFeedViewController](self, "newCloudFeedViewController");
  v11 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __96__PUAlbumListViewController_navigateToSharedAlbumActivityFeedAnimated_configuration_completion___block_invoke;
    v19[3] = &unk_1E58AB968;
    v21 = v8;
    v20 = v10;
    objc_msgSend(v20, "performWhenReadyToNavigate:", v19);

  }
  -[PUAlbumListViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = self;
      _os_log_error_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, "missing navigation controller for %@", buf, 0xCu);
    }

  }
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __96__PUAlbumListViewController_navigateToSharedAlbumActivityFeedAnimated_configuration_completion___block_invoke_407;
  v16[3] = &unk_1E58AB968;
  v17 = v10;
  v18 = v9;
  v14 = v10;
  v15 = v9;
  objc_msgSend(v12, "px_pushViewController:animated:completion:", v14, v6, v16);

}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  -[PUAlbumListViewController _dismissPhotosPickerControllerAnimated:](self, "_dismissPhotosPickerControllerAnimated:", 0);
  return 1;
}

- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  char v11;
  void *v12;

  v3 = a3;
  -[PUAlbumListViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 1)
  {
    -[PUAlbumListViewController mainScrollView](self, "mainScrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 1;
    objc_msgSend(v8, "px_scrollToEdge:animated:", 1, v3);

  }
  else
  {
    -[PUAlbumListViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "px_isScrolledAtEdge:", 1);

    -[PUAlbumListViewController mainScrollView](self, "mainScrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_scrollToEdge:animated:", 1, v3);

    return v11 ^ 1;
  }
  return v9;
}

- (void)stackedAlbumTransition:(id)a3 setVisibility:(BOOL)a4 forCollection:(id)a5
{
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 3579, CFSTR("The stacked album transition should call the photokit version of the delegate callbacks"));

}

- (id)stackedAlbumTransition:(id)a3 layoutForCollection:(id)a4 forCollectionView:(id)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 3583, CFSTR("The stacked album transition should call the photokit version of the delegate callbacks"));

  return 0;
}

- (void)stackedAlbumTransition:(id)a3 setVisibility:(BOOL)a4 forPHCollection:(id)a5
{
  _BOOL4 v5;
  id v6;

  v5 = a4;
  -[PUAlbumListViewController _preparedStackViewForCollection:](self, "_preparedStackViewForCollection:", a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", !v5);

}

- (id)stackedAlbumTransition:(id)a3 layoutForPHCollection:(id)a4 forCollectionView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PUStackedAlbumLayout *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int64_t v20;
  int v21;
  id v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  double v43;
  void *v44;
  PUAlbumListTransitionContext *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  id v67;
  void *v68;
  void *v69;
  void *v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isExpanding") & 1) != 0
    || (objc_msgSend(v11, "isCachedFetchResultOutdatedForCollection:", v9) & 1) == 0)
  {
    -[PUAlbumListViewController indexPathForCollection:](self, "indexPathForCollection:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController _preparedStackViewAtIndexPath:](self, "_preparedStackViewAtIndexPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController mainScrollView](self, "mainScrollView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "numberOfSections") == 1)
      v15 = objc_msgSend(v10, "numberOfItemsInSection:", 0);
    else
      v15 = 0;
    v16 = (void *)objc_msgSend(v14, "newLayoutAttributesForVisbleItemsRelativeToView:maxCount:", v81, v15);
    v79 = v14;
    if (objc_msgSend(v16, "count"))
    {
      v78 = v15;
      v76 = v11;
      v17 = objc_msgSend(v9, "px_isFolder");
      v77 = v13;
      -[PUAlbumListViewController _preparedAlbumListCellContentViewAtIndexPath:](self, "_preparedAlbumListCellContentViewAtIndexPath:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumListViewController spec](self, "spec");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stackPhotoDecoration");
      v75 = objc_claimAutoreleasedReturnValue();

      v20 = +[PUStackView maximumNumberOfVisibleImagesForStyle:](PUStackView, "maximumNumberOfVisibleImagesForStyle:", objc_msgSend(v14, "style"));
      v21 = objc_msgSend(v8, "isExpanding");
      if ((v17 & 1) != 0)
      {
        v22 = 0;
      }
      else
      {
        v82 = 0;
        -[PUAlbumListViewController _getDisplayableAssets:indexes:forCollection:maximumCount:useCache:](self, "_getDisplayableAssets:indexes:forCollection:maximumCount:useCache:", 0, &v82, v9, v20, v21 ^ 1u);
        v22 = v82;
      }
      v23 = objc_msgSend(v16, "count");
      v80 = v22;
      if (v23 == objc_msgSend(v22, "count"))
      {
        v24 = *MEMORY[0x1E0C9D538];
        v25 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        objc_msgSend(v81, "bounds");
        v27 = v26;
        objc_msgSend(v81, "contentInset");
        v29 = v27 + v28;
        objc_msgSend(v16, "lastObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "copy");

        objc_msgSend(v31, "center");
        objc_msgSend(v31, "setCenter:");
        objc_msgSend(v31, "size");
        v33 = v32;
        v35 = v34;
        -[PUAlbumListViewController spec](self, "spec");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "posterSquareCornerRadius");
        v38 = v37;

        v71 = v31;
        objc_msgSend(v31, "setSize:", v33 - (v38 + 1.0 + v38 + 1.0), v35 - (v38 + 1.0 + v38 + 1.0));
        v39 = objc_msgSend(v16, "count");
        v73 = v9;
        v74 = v8;
        v72 = v10;
        if (v39 >= 1)
        {
          v40 = v39;
          v41 = 0;
          v42 = 0;
          v43 = v25;
          v44 = v22;
          while (1)
          {
            objc_msgSend(v16, "objectAtIndexedSubscript:", v42);
            v45 = (PUAlbumListTransitionContext *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              objc_msgSend(v18, "superview");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "center");
              objc_msgSend(v46, "convertPoint:toView:", v81);
              v48 = v47;
              v50 = v49;

              -[PUAlbumListTransitionContext setCenter:](v45, "setCenter:", v48, v50);
              objc_msgSend(v18, "frame");
              v52 = v51;
              v54 = v53;
              objc_msgSend(v79, "stackPerspectiveInsets");
              -[PUAlbumListTransitionContext setSize:](v45, "setSize:", v52 - (v56 * (double)v42 + v58 * (double)v42), v54 - (v55 * (double)v42 + v57 * (double)v42));
              v59 = 0;
              if (v42 < (unint64_t)objc_msgSend(0, "count"))
              {
                v60 = -[PUAlbumListViewController albumsSections](self, "albumsSections");
                -[PUAlbumListViewController albumsSections](self, "albumsSections");
                objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v42, v60 + v61 - 1);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }
            else if (v42 >= (unint64_t)objc_msgSend(v44, "count"))
            {
              v59 = 0;
            }
            else
            {
              objc_msgSend(v44, "objectAtIndexedSubscript:", v42);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = objc_msgSend(v62, "integerValue");

              if (v63 >= v78)
              {
                v12 = 0;
                v9 = v73;
                v68 = (void *)v75;
                v69 = v71;
                goto LABEL_30;
              }
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v63, 0);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v80;
            }
            -[PUAlbumListTransitionContext setIndexPath:](v45, "setIndexPath:", v59);
            -[PUAlbumListTransitionContext center](v45, "center");
            v65 = v64;
            v25 = v66 - v29;
            -[PUAlbumListTransitionContext setCenter:](v45, "setCenter:");
            if (v42)
            {
              v25 = v43;
            }
            else
            {
              v67 = v59;

              v41 = v67;
              v44 = v80;
              v24 = v65;
              v43 = v25;
            }

            if (v40 == ++v42)
              goto LABEL_29;
          }
        }
        v41 = 0;
LABEL_29:
        v45 = objc_alloc_init(PUAlbumListTransitionContext);
        v9 = v73;
        -[PUAlbumListTransitionContext setPhCollection:](v45, "setPhCollection:", v73);
        v68 = (void *)v75;
        -[PUAlbumListTransitionContext setPhotoDecoration:](v45, "setPhotoDecoration:", v75);
        -[PUAlbumListTransitionContext setKeyItemIndexPath:](v45, "setKeyItemIndexPath:", v41);
        v12 = objc_alloc_init(PUStackedAlbumLayout);
        v69 = v71;
        -[PUStackedAlbumLayout setReferenceItemLayoutAttributes:](v12, "setReferenceItemLayoutAttributes:", v71);
        -[PUStackedAlbumLayout setVisibleStackedItemLayoutAttributes:](v12, "setVisibleStackedItemLayoutAttributes:", v16);
        -[PUStackedAlbumLayout setReferenceCenter:](v12, "setReferenceCenter:", v24, v25);
        -[PUStackedAlbumLayout setAlbumListTransitionContext:](v12, "setAlbumListTransitionContext:", v45);
LABEL_30:

        v8 = v74;
        v10 = v72;
        v11 = v76;
      }
      else
      {
        v12 = 0;
        v68 = (void *)v75;
        v11 = v76;
      }

      v13 = v77;
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

- (BOOL)isEmpty
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  int v7;
  void *v8;

  -[PUAlbumListViewController dataSource](self, "dataSource");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[PUAlbumListViewController dataSource](self, "dataSource"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsAnyItems"),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isSelectingTargetAlbum") ^ 1;

  }
  return v7;
}

- (void)setAlbumListTransitionContext:(id)a3
{
  PUAlbumListTransitionContext *v5;
  PUAlbumListTransitionContext *v6;
  _QWORD v7[5];

  v5 = (PUAlbumListTransitionContext *)a3;
  if (self->_albumListTransitionContext != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_albumListTransitionContext, a3);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__PUAlbumListViewController_setAlbumListTransitionContext___block_invoke;
    v7[3] = &unk_1E589C218;
    v7[4] = self;
    -[PUAlbumListViewController _enumerateIndexPathsForPreparedItemsUsingBlock:](self, "_enumerateIndexPathsForPreparedItemsUsingBlock:", v7);
    v5 = v6;
  }

}

- (void)setAlbumListTransitionLayout:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  -[PUAlbumListViewController _albumListTransitionLayout](self, "_albumListTransitionLayout");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v7 != v12)
  {
    objc_storeStrong((id *)&self->__albumListTransitionLayout, a3);
    if (v12)
    {
      v9 = v12;
    }
    else
    {
      -[PUAlbumListViewController _mainCollectionViewLayout](self, "_mainCollectionViewLayout");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCollectionViewLayout:animated:", v10, v4);

    v8 = v12;
  }

}

- (void)handleTransitionFade:(BOOL)a3 animate:(BOOL)a4
{
  void *v8;
  _QWORD v9[6];
  BOOL v10;
  BOOL v11;

  -[PUAlbumListViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__PUAlbumListViewController_handleTransitionFade_animate___block_invoke;
  v9[3] = &unk_1E589C240;
  v9[4] = self;
  v9[5] = a2;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v8, "enumerateCollectionsUsingBlock:", v9);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[PUAlbumListViewController numberOfItemsInSection:](self, "numberOfItemsInSection:", a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (-[PUAlbumListViewController isPlaceholderAtIndexPath:](self, "isPlaceholderAtIndexPath:", v7))
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("placeholderCell"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "albumListCellContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prepareForReuse");
    -[PUAlbumListViewController updatePlaceholderListCellContentView:forItemAtIndexPath:animated:](self, "updatePlaceholderListCellContentView:forItemAtIndexPath:animated:", v9, v7, 0);
  }
  else
  {
    -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = CFSTR("albumCell");
    else
      v10 = CFSTR("folderCell");
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v10, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController spec](self, "spec");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellBackgroundCornerRadius");
    objc_msgSend(v8, "setBackgroundCornerRadius:");

    objc_msgSend(v8, "albumListCellContentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);
    objc_msgSend(v12, "prepareForReuse");
    -[PUAlbumListViewController updateAlbumListCellContentView:forItemAtIndexPath:animated:](self, "updateAlbumListCellContentView:forItemAtIndexPath:animated:", v12, v7, 0);

  }
  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController configureSupplementaryView:ofKind:forIndexPath:](self, "configureSupplementaryView:ofKind:forIndexPath:", v10, v9, v8);

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;
  void *v8;
  int v9;

  v5 = a4;
  if (-[PUAlbumListViewController isPlaceholderAtIndexPath:](self, "isPlaceholderAtIndexPath:", v5))
  {
    v6 = -[PUAlbumListViewController placeholderKindAtIndexPath:](self, "placeholderKindAtIndexPath:", v5);

    return -[PUAlbumListViewController _isPlaceholderEnabled:](self, "_isPlaceholderEnabled:", v6);
  }
  else
  {
    -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PUAlbumListViewController shouldEnableCollection:](self, "shouldEnableCollection:", v8))
      v9 = -[PUAlbumListViewController isEditing](self, "isEditing") ^ 1;
    else
      LOBYTE(v9) = 0;

    return v9;
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  -[PUAlbumListViewController didSelectItemAtIndexPath:](self, "didSelectItemAtIndexPath:", a4);
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return -[PUAlbumListViewController isEditing](self, "isEditing", a3, a4) ^ 1;
}

- (void)configureSupplementaryView:(id)a3 ofKind:(id)a4 forIndexPath:(id)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  id v38;

  v38 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("PUGridGlobalFooter")))
  {
    -[PUAlbumListViewController setSyncProgressView:](self, "setSyncProgressView:", v38);
    -[PUAlbumListViewController updateSyncProgress](self, "updateSyncProgress");
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("PUAlbumListViewControllerElementKindSectionHeader")))
  {
    -[PUAlbumListViewController _mainCollectionViewLayout](self, "_mainCollectionViewLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "visualSectionForSupplementaryViewIndexPath:", v10);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 3831, CFSTR("%@ can't configure header view at %@ as it is not bound to a visual section"), self, v10);

    }
    -[PUAlbumListViewController dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collectionListForSection:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "localizedTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v38;
    objc_msgSend(v17, "setSectionHeaderTitle:", v16);
    -[PUAlbumListViewController _fontManager](self, "_fontManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "albumListSectionTitleLabelFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSectionHeaderTitleFont:", v19);

    -[PUAlbumListViewController spec](self, "spec");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController _layoutReferenceSize](self, "_layoutReferenceSize");
    v22 = v21;
    v24 = v23;
    -[PUAlbumListViewController _layoutSafeAreaInsets](self, "_layoutSafeAreaInsets");
    objc_msgSend(v20, "sectionInsetsForLayoutReferenceSize:safeAreaInsets:", v22, v24, v25, v26, v27, v28);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;

    objc_msgSend(v17, "setSectionHeaderInsets:", v30, v32, v34, v36);
  }

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  PUAlbumListViewController *v22;
  id v23;

  v7 = a3;
  v8 = a4;
  -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isForAssetPicker");

  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isForAlbumPicker");

  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isLimitedLibraryPicker");

  v16 = 0;
  if ((v11 & 1) == 0 && (v15 & 1) == 0 && (v13 & 1) == 0)
  {
    if ((-[PUAlbumListViewController isEditing](self, "isEditing") & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0DC36B8];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke;
      v19[3] = &unk_1E589C268;
      v20 = v7;
      v21 = v8;
      v22 = self;
      v23 = v9;
      objc_msgSend(v17, "configurationWithIdentifier:previewProvider:actionProvider:", v23, 0, v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v16;
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];

  v6 = a5;
  -[PUAlbumListViewController contextMenuInteractionEndBlock](self, "contextMenuInteractionEndBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __100__PUAlbumListViewController_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke;
    aBlock[3] = &unk_1E58ABD10;
    aBlock[4] = self;
    v8 = _Block_copy(aBlock);
    if (v8)
    {
      v9 = v8;
      if (v6)
        objc_msgSend(v6, "addCompletion:", v8);
      else
        (*((void (**)(void *))v8 + 2))(v8);

    }
  }

}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v8 = a5;
  objc_msgSend(a4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 3923, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("configuration.identifier"), v12, v13);

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __102__PUAlbumListViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v14[3] = &unk_1E58ABCA8;
    v14[4] = self;
    v15 = v9;
    objc_msgSend(v8, "addCompletion:", v14);

  }
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D7BBE8], "defaultPresenterWithViewController:", self);
}

- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0D7B5C8];
    v6 = v8;
    objc_msgSend(v5, "moviePresenterWithPresentingViewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentMovieViewControllerForAssetCollection:keyAssetFetchResult:preferredTransitionType:", v6, 0, 1);

  }
}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  switch(a5)
  {
    case 1:
      -[PUAlbumListViewController navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_pushViewController:animated:completion:", v10, 1, 0);
LABEL_7:

      v11 = 1;
      goto LABEL_8;
    case 2:
      -[PUAlbumListViewController navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentViewController:animated:completion:", v10, 1, 0);
      goto LABEL_7;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 3973, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a4, "dismissViewControllerAnimated:completion:", 1, a5);
  return 1;
}

- (BOOL)collectionView:(id)a3 canReorderItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v5 = a4;
  if (-[PUAlbumListViewController isEditing](self, "isEditing"))
  {
    -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PUAlbumListViewController retitlingCollection](self, "retitlingCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = 0;
      }
      else
      {
        -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v9, "canReorderCollection:", v6);

      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  return -[PUAlbumListViewController _targetIndexPathForMoveFromIndexPath:toProposedIndexPath:](self, "_targetIndexPathForMoveFromIndexPath:toProposedIndexPath:", a4, a5);
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  void (**v25)(_QWORD);
  _QWORD v26[4];
  id v27;
  id v28;
  unint64_t v29;
  unint64_t v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  if (v11 == v12 || objc_msgSend(v11, "isEqual:", v12))
  {
    if (v13)
      v13[2](v13);
  }
  else
  {
    -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "collectionList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "collectionsFetchResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PUAlbumListViewController _unfilteredIndexForFilteredIndexPath:](self, "_unfilteredIndexForFilteredIndexPath:", v11);
    v17 = -[PUAlbumListViewController _unfilteredIndexForFilteredIndexPath:](self, "_unfilteredIndexForFilteredIndexPath:", v12);
    objc_msgSend(v14, "photoLibrary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __94__PUAlbumListViewController_collectionView_moveItemAtIndexPath_toIndexPath_completionHandler___block_invoke;
    v26[3] = &unk_1E58AB348;
    v27 = v14;
    v28 = v15;
    v29 = v16;
    v30 = v17;
    v23[0] = v18;
    v23[1] = 3221225472;
    v23[2] = __94__PUAlbumListViewController_collectionView_moveItemAtIndexPath_toIndexPath_completionHandler___block_invoke_2;
    v23[3] = &unk_1E58A1AF8;
    v23[4] = self;
    v24 = v27;
    v25 = v13;
    v19 = v27;
    v20 = v15;
    objc_msgSend(v21, "performChanges:completionHandler:", v26, v23);

  }
}

- (int64_t)numberOfVisualSectionsForSectionedGridLayout:(id)a3
{
  void *v3;
  int64_t v4;

  -[PUAlbumListViewController dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4 <= 1)
    return 1;
  else
    return v4;
}

- (id)sectionedGridLayout:(id)a3 sectionsForVisualSection:(int64_t)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = -[PUAlbumListViewController albumsSections](self, "albumsSections");
  v9 = v7;
  v10 = v8;
  if (!a4)
  {
    v16 = (void *)MEMORY[0x1E0CB36B8];
    if (v8 > 1)
      v13 = v7 + 1;
    else
      v13 = -[PUAlbumListViewController numberOfSections](self, "numberOfSections");
    v14 = v16;
    v15 = 0;
    goto LABEL_9;
  }
  if (-[PUAlbumListViewController numberOfVisualSectionsForSectionedGridLayout:](self, "numberOfVisualSectionsForSectionedGridLayout:", v6)- 1 == a4)
  {
    v11 = v10 + v9 - 1;
    v12 = (void *)MEMORY[0x1E0CB36B8];
    v13 = -[PUAlbumListViewController numberOfSections](self, "numberOfSections") - v11;
    v14 = v12;
    v15 = v11;
LABEL_9:
    objc_msgSend(v14, "indexSetWithIndexesInRange:", v15, v13);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4);
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v18 = (void *)v17;

  return v18;
}

- (id)sectionedGridLayoutAnchorItemForAdjustingContentOffset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PUAlbumListViewController albumListTransitionContext](self, "albumListTransitionContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUAlbumListViewController albumListTransitionContext](self, "albumListTransitionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyItemIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PUAlbumListViewController bestReferenceItemIndexPath](self, "bestReferenceItemIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)bestReferenceItemIndexPath
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[PUAlbumListViewController _mainCollectionView](self, "_mainCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController _mainCollectionViewLayout](self, "_mainCollectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "window");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "contentOffset");
      v9 = v8;
      v11 = v10;
      objc_msgSend(v3, "bounds");
      v13 = v12;
      v15 = v14;
      v16 = objc_msgSend(v3, "numberOfSections");
      if (v16 < 1)
      {
LABEL_7:
        v18 = 0;
        goto LABEL_8;
      }
      v17 = 0;
      while (objc_msgSend(v3, "numberOfItemsInSection:", v17) <= 0)
      {
        if (v16 == ++v17)
          goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_8;
      objc_msgSend(v4, "layoutAttributesForItemAtIndexPath:", v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25
        && (objc_msgSend(v25, "frame"),
            v31.origin.x = v9,
            v31.origin.y = v11,
            v31.size.width = v13,
            v31.size.height = v15,
            CGRectIntersectsRect(v29, v31)))
      {
        v18 = v18;

        v22 = v18;
      }
      else
      {

LABEL_8:
        while (v16-- >= 1)
        {
          v20 = objc_msgSend(v3, "numberOfItemsInSection:", v16);
          if (v20 >= 1)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v20 - 1, v16);
            v21 = objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              v22 = (void *)v21;
              objc_msgSend(v4, "layoutAttributesForItemAtIndexPath:", v21);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v23;
              if (v23)
              {
                objc_msgSend(v23, "frame");
                v30.origin.x = v9;
                v30.origin.y = v11;
                v30.size.width = v13;
                v30.size.height = v15;
                if (CGRectIntersectsRect(v28, v30))
                {

                  goto LABEL_23;
                }
              }

            }
            break;
          }
        }
        if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EEC9F260))
        {
          objc_msgSend(v4, "itemIndexPathAtCenterOfRect:", v9, v11, v13, v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
      }
LABEL_23:
      v7 = v22;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)sectionedGridLayout:(id)a3 sectionHeaderHeightForVisualSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  -[PUAlbumListViewController dataSource](self, "dataSource", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionListForSection:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "localizedTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (objc_msgSend(v8, "length"))
  {
    -[PUAlbumListViewController spec](self, "spec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sectionHeaderHeight");
    v11 = v10;

  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

- (id)collectionView:(id)a3 transitionLayoutForOldLayout:(id)a4 newLayout:(id)a5
{
  void *v5;
  void *v6;

  -[PUAlbumListViewController albumListTransitionContext](self, "albumListTransitionContext", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  NSObject *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[PUAlbumListViewController collection](self, "collection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_INFO, "Picker in collection view manually dismissed with no picked assets for collection: %@", (uint8_t *)&v7, 0xCu);

  }
  -[PUAlbumListViewController finishedPickingBlock](self, "finishedPickingBlock");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6[2](v6, MEMORY[0x1E0C9AA60]);

  -[PUAlbumListViewController setFinishedPickingBlock:](self, "setFinishedPickingBlock:", 0);
  -[PUAlbumListViewController setPickerViewController:](self, "setPickerViewController:", 0);
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  void *v5;
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD);
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PXMap();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_INFO, "Picker in collection view finished with selected identifiers: %@", (uint8_t *)&v8, 0xCu);
  }

  -[PUAlbumListViewController finishedPickingBlock](self, "finishedPickingBlock");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v5);

  -[PUAlbumListViewController setFinishedPickingBlock:](self, "setFinishedPickingBlock:", 0);
  -[PUAlbumListViewController _dismissPhotosPickerControllerAnimated:](self, "_dismissPhotosPickerControllerAnimated:", 1);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[PUAlbumListViewController numberOfItemsInSection:](self, "numberOfItemsInSection:", a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  PUAlbumListTableViewCell *v12;
  PUAlbumListCellContentView *v13;
  PUAlbumListCellContentView *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int64_t v19;
  int v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a4;
  v7 = a3;
  v8 = -[PUAlbumListViewController isPlaceholderAtIndexPath:](self, "isPlaceholderAtIndexPath:", v6);
  v9 = CFSTR("albumCell");
  if (v8)
    v9 = CFSTR("placeholderCell");
  v10 = v9;
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = -[PUAlbumListTableViewCell initWithStyle:reuseIdentifier:]([PUAlbumListTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, v10);
    v11 = v12;
    if (!v8)
      -[PUAlbumListTableViewCell setStateChangeDelegate:](v12, "setStateChangeDelegate:", self);
  }
  objc_msgSend(v11, "viewWithTag:", 236897);
  v13 = (PUAlbumListCellContentView *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v14 = [PUAlbumListCellContentView alloc];
    objc_msgSend(v11, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v13 = -[PUAlbumListCellContentView initWithFrame:](v14, "initWithFrame:");

    -[PUAlbumListCellContentView setTag:](v13, "setTag:", 236897);
    -[PUAlbumListCellContentView setAutoresizingMask:](v13, "setAutoresizingMask:", 18);
    -[PUAlbumListCellContentView setCombinesPhotoDecorations:](v13, "setCombinesPhotoDecorations:", 1);
    objc_msgSend(v11, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v13);

    if (!v8)
      -[PUAlbumListCellContentView setDelegate:](v13, "setDelegate:", self);
  }
  -[PUAlbumListCellContentView prepareForReuse](v13, "prepareForReuse");
  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isSelectingTargetAlbum");

  if (v8)
  {
    v19 = -[PUAlbumListViewController placeholderKindAtIndexPath:](self, "placeholderKindAtIndexPath:", v6);
    if (v19 == 6)
      v20 = v18 ^ 1;
    else
      v20 = 0;
    if ((unint64_t)(v19 - 2) >= 4)
      v21 = v20;
    else
      v21 = v18 ^ 1;
    -[PUAlbumListViewController updatePlaceholderListCellContentView:forItemAtIndexPath:animated:](self, "updatePlaceholderListCellContentView:forItemAtIndexPath:animated:", v13, v6, 0);
  }
  else
  {
    -[PUAlbumListViewController updateAlbumListCellContentView:forItemAtIndexPath:animated:](self, "updateAlbumListCellContentView:forItemAtIndexPath:animated:", v13, v6, 0);
    if (v18)
    {
      -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v22, "px_isFolder");

    }
    else
    {
      v21 = 1;
    }
  }
  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "hasClearBackgroundColor") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v24);

  objc_msgSend(v11, "setAccessoryType:", v21);
  objc_msgSend(v11, "setSelectionStyle:", 2);

  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v6)
    && (-[PUAlbumListViewController spec](self, "spec"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "cellContentViewLayout"),
        v7,
        !v8))
  {
    v12 = *MEMORY[0x1E0DC53D8];
  }
  else
  {
    -[PUAlbumListViewController spec](self, "spec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    objc_msgSend(v9, "cellSizeForBounds:");
    v12 = v11;

  }
  return v12;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  unint64_t v6;
  unint64_t v7;
  double v8;
  void *v9;
  int v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;

  v6 = -[PUAlbumListViewController albumsSections](self, "albumsSections", a3);
  v8 = 0.0;
  if (a4 >= v6 && a4 - v6 < v7)
  {
    if (-[PUAlbumListViewController isRootFolder](self, "isRootFolder"))
    {
      -[PUAlbumListViewController spec](self, "spec");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "shouldShowSectionHeaders");

      if (v10)
      {
        v11 = a4 - -[PUAlbumListViewController albumsSections](self, "albumsSections");
        -[PUAlbumListViewController dataSource](self, "dataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "collectionListForSection:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v13, "localizedTitle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = 0;
        }
        if (objc_msgSend(v14, "length"))
        {
          -[PUAlbumListViewController spec](self, "spec");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "sectionHeaderHeight");
          v8 = v16;

        }
      }
    }
  }
  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  PUAlbumListSectionHeaderView *v14;
  PUAlbumListSectionHeaderView *sectionHeaderView;
  PUAlbumListSectionHeaderView *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  PUAlbumListSectionHeaderView *v21;
  PUAlbumListSectionHeaderView *v22;
  void *v23;
  PUAlbumListSectionHeaderView *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;

  v6 = a3;
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView:heightForHeaderInSection:", v6, a4);
  v9 = v8;

  if (v9 <= 0.0)
  {
    v14 = 0;
  }
  else
  {
    v10 = a4 - -[PUAlbumListViewController albumsSections](self, "albumsSections");
    -[PUAlbumListViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionListForSection:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v12, "localizedTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    if (objc_msgSend(v13, "length"))
    {
      sectionHeaderView = self->_sectionHeaderView;
      if (!sectionHeaderView)
      {
        v16 = [PUAlbumListSectionHeaderView alloc];
        objc_msgSend(v6, "frame");
        v18 = v17;
        -[PUAlbumListViewController spec](self, "spec");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sectionHeaderHeight");
        v21 = -[PUAlbumListSectionHeaderView initWithFrame:](v16, "initWithFrame:", 0.0, 0.0, v18, v20);
        v22 = self->_sectionHeaderView;
        self->_sectionHeaderView = v21;

        sectionHeaderView = self->_sectionHeaderView;
      }
      PULocalizedString(v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumListSectionHeaderView setSectionHeaderTitle:](sectionHeaderView, "setSectionHeaderTitle:", v23);

      v24 = self->_sectionHeaderView;
      -[PUAlbumListViewController _fontManager](self, "_fontManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "albumListSectionTitleLabelFont");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumListSectionHeaderView setSectionHeaderTitleFont:](v24, "setSectionHeaderTitleFont:", v26);

      -[PUAlbumListViewController spec](self, "spec");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumListViewController _layoutReferenceSize](self, "_layoutReferenceSize");
      v29 = v28;
      v31 = v30;
      -[PUAlbumListViewController _layoutSafeAreaInsets](self, "_layoutSafeAreaInsets");
      objc_msgSend(v27, "sectionInsetsForLayoutReferenceSize:safeAreaInsets:", v29, v31, v32, v33, v34, v35);
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v43 = v42;

      -[PUAlbumListSectionHeaderView setSectionHeaderInsets:](self->_sectionHeaderView, "setSectionHeaderInsets:", v37, v39, v41, v43);
      v14 = self->_sectionHeaderView;
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  int64_t v6;
  double result;
  _BOOL4 v8;

  v6 = -[PUAlbumListViewController topPlaceholdersSection](self, "topPlaceholdersSection", a3);
  result = 0.0;
  if (v6 == a4)
  {
    v8 = -[PUAlbumListViewController showsSeparatorBelowTopPlaceholdersSection](self, "showsSeparatorBelowTopPlaceholdersSection", 0.0);
    result = 0.0;
    if (v8)
      return 4.0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  PUAlbumListSeparatorView *v7;
  PUAlbumListSeparatorView *v8;
  void *v9;

  v6 = a3;
  if (-[PUAlbumListViewController topPlaceholdersSection](self, "topPlaceholdersSection") == a4
    && -[PUAlbumListViewController showsSeparatorBelowTopPlaceholdersSection](self, "showsSeparatorBelowTopPlaceholdersSection"))
  {
    v7 = [PUAlbumListSeparatorView alloc];
    v8 = -[PUAlbumListSeparatorView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v6, "separatorColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListSeparatorView setLineColor:](v8, "setLineColor:", v9);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;
  void *v7;

  v5 = a4;
  if (-[PUAlbumListViewController isPlaceholderAtIndexPath:](self, "isPlaceholderAtIndexPath:", v5))
  {
    v6 = 1;
  }
  else
  {
    -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUAlbumListViewController shouldEnableCollection:](self, "shouldEnableCollection:", v7);

  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[PUAlbumListViewController didSelectItemAtIndexPath:](self, "didSelectItemAtIndexPath:", v6);
  if (-[PUAlbumListViewController isPlaceholderAtIndexPath:](self, "isPlaceholderAtIndexPath:", v6))
    objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v5 = a4;
  if (-[PUAlbumListViewController isEditing](self, "isEditing"))
  {
    -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PUAlbumListViewController retitlingCollection](self, "retitlingCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = 0;
      }
      else
      {
        -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v9, "canReorderCollection:", v6);

      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  return -[PUAlbumListViewController _targetIndexPathForMoveFromIndexPath:toProposedIndexPath:](self, "_targetIndexPathForMoveFromIndexPath:toProposedIndexPath:", a4, a5);
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  unint64_t v22;
  unint64_t v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9 != v10 && (objc_msgSend(v9, "isEqual:", v10) & 1) == 0)
  {
    -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionsFetchResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PUAlbumListViewController _unfilteredIndexForFilteredIndexPath:](self, "_unfilteredIndexForFilteredIndexPath:", v9);
    v15 = -[PUAlbumListViewController _unfilteredIndexForFilteredIndexPath:](self, "_unfilteredIndexForFilteredIndexPath:", v10);
    -[PUAlbumListViewController _setIgnoredReorderNotificationCount:](self, "_setIgnoredReorderNotificationCount:", -[PUAlbumListViewController _ignoredReorderNotificationCount](self, "_ignoredReorderNotificationCount") + 1);
    objc_msgSend(v12, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __70__PUAlbumListViewController_tableView_moveRowAtIndexPath_toIndexPath___block_invoke;
    v19[3] = &unk_1E58AB348;
    v20 = v12;
    v21 = v13;
    v22 = v14;
    v23 = v15;
    v17 = v13;
    v18 = v12;
    objc_msgSend(v16, "performChanges:completionHandler:", v19, 0);

  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canDeleteCollection:", v5);

  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
    -[PUAlbumListViewController _handleDeleteAlbumAtIndexPath:](self, "_handleDeleteAlbumAtIndexPath:", a5);
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a4;
  PULocalizedString(CFSTR("ALBUM_LIST_TABLE_ROW_DELETE_CONFIRMATION"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "px_isSharedAlbum") && (objc_msgSend(v7, "px_isOwnedSharedAlbum") & 1) == 0)
  {
    PULocalizedString(CFSTR("ALBUM_LIST_TABLE_ROW_UNSUBSCRIBE_CONFIRMATION"));
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }

  return v6;
}

- (void)albumListTableViewCell:(id)a3 willChangeState:(unint64_t)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((a4 & 2) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[PUAlbumListViewController _mainTableView](self, "_mainTableView", a3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleCells");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "viewWithTag:", 236897);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v10, "cancelPerformRetitleAction");

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  return 1;
}

- (void)_peopleAlbumChanged:(id)a3
{
  void *v4;
  void *v5;

  -[PUAlbumListViewController indexPathForPeopleAlbum](self, "indexPathForPeopleAlbum", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[PUAlbumListViewController updateListCellForItemAtIndexPath:animated:](self, "updateListCellForItemAtIndexPath:animated:", v4, 1);
    v4 = v5;
  }

}

- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3
{
  return 0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void (**v28)(_QWORD);
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void (**v36)(void);
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  _QWORD v65[4];
  id v66;
  PUAlbumListViewController *v67;
  id v68;
  _QWORD aBlock[5];
  id v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;

  v6 = a4;
  v9 = a3;
  if ((void *)PXPhotoKitCollectionsDataSourceManagerObservationContext != a5)
  {
    if ((void *)PUFontManagerObservationContext_8717 == a5)
    {
      -[PUAlbumListViewController _updateMainView](self, "_updateMainView");
      -[PUAlbumListViewController _updateInterfaceForModelReloadAnimated:](self, "_updateInterfaceForModelReloadAnimated:", 0);
    }
    else if ((void *)PXSpecManagerObservationContext_8721 == a5)
    {
      -[PUAlbumListViewController _featureSpecManager](self, "_featureSpecManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "spec");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUAlbumListViewController _setFeatureSpec:](self, "_setFeatureSpec:", v25);
    }
    else
    {
      if ((void *)PXSharedLibraryStatusProviderObservationContext != a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 4611, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      if ((v6 & 3) != 0)
        -[PUAlbumListViewController updateNavigationBarAnimated:](self, "updateNavigationBarAnimated:", 0);
    }
    goto LABEL_39;
  }
  -[PUAlbumListViewController dataSourceManager](self, "dataSourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v10;
  objc_msgSend(v10, "changeHistory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v13, "identifier"), objc_msgSend(v11, "identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v14, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 4487, CFSTR("Should only have one change details at most."));

  }
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = objc_msgSend(v15, "isCountUpdateChange");
  else
    v16 = 0;
  v62 = v15;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CD20]), "initWithSectionedDataSourceChangeDetails:shiftedSection:", v15, -[PUAlbumListViewController albumsSections](self, "albumsSections"));
  -[PUAlbumListViewController pushedAlbum](self, "pushedAlbum");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v17, "deletedItemsIndexPaths");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController pushedAlbum](self, "pushedAlbum");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListViewController indexPathForCollection:](self, "indexPathForCollection:", v20);
    v21 = v9;
    v22 = v14;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v19, "containsObject:", v23);

    v14 = v22;
    v9 = v21;

  }
  else
  {
    v64 = 0;
  }

  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v26 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PUAlbumListViewController_observable_didChange_context___block_invoke;
  aBlock[3] = &unk_1E58AAD18;
  v71 = &v72;
  aBlock[4] = self;
  v27 = v11;
  v70 = v27;
  v28 = (void (**)(_QWORD))_Block_copy(aBlock);
  v29 = -[PUAlbumListViewController isViewInSyncWithModel](self, "isViewInSyncWithModel");
  -[PUAlbumListViewController setViewInSyncWithModel:](self, "setViewInSyncWithModel:", 0);
  if (!-[PUAlbumListViewController px_isVisible](self, "px_isVisible"))
    goto LABEL_32;
  if ((v16 & 1) == 0)
    -[PUAlbumListViewController _updateAlbumSubtitleFormat](self, "_updateAlbumSubtitleFormat");
  if (v17 && !objc_msgSend(v17, "hasIncrementalChanges"))
    goto LABEL_31;
  if (((objc_msgSend(v17, "hasMoves") | !v29) & 1) != 0)
    goto LABEL_31;
  objc_msgSend(v17, "contentItemsChangedIndexPaths");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (!v17)
  {
    if (v31)
      goto LABEL_31;
  }
  -[PUAlbumListViewController _justCreatedCollectionIdentifier](self, "_justCreatedCollectionIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v17, "deletedSections");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "count"))
    {
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v17, "insertedSections");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "count"))
    {

      goto LABEL_29;
    }
    objc_msgSend(v17, "changedSections");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v40, "count");

    if (!v60 && (objc_msgSend(v17, "hasMoves") & 1) == 0)
    {
      objc_msgSend(v17, "deletedItemsIndexPaths");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "count");

      if (!v42)
      {
        objc_msgSend(v17, "changedItemsIndexPaths");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "count");

        if (!v44)
        {
          objc_msgSend(v17, "insertedItemsIndexPaths");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "count");

          if (v46 == 1)
          {
            v57 = v9;
            v58 = v14;
            objc_msgSend(v17, "insertedItemsIndexPaths");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "firstObject");
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v48, "item"), objc_msgSend(v48, "section") - -[PUAlbumListViewController albumsSections](self, "albumsSections"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "collectionAtIndexPath:", v49);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "localIdentifier");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUAlbumListViewController _justCreatedCollectionIdentifier](self, "_justCreatedCollectionIdentifier");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v59, "isEqualToString:", v50);

            v52 = v51 ? v48 : 0;
            v9 = v57;
            v14 = v58;
            if (v52)
            {
              -[PUAlbumListViewController _justCreatedCollectionAnimationCompletionHandler](self, "_justCreatedCollectionAnimationCompletionHandler");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v65[0] = v26;
              v65[1] = 3221225472;
              v65[2] = __58__PUAlbumListViewController_observable_didChange_context___block_invoke_2;
              v65[3] = &unk_1E58ABAF0;
              v66 = v17;
              v67 = self;
              v55 = v54;
              v68 = v55;
              -[PUAlbumListViewController _visiblyInsertItemAtIndexPath:modelUpdate:completionHandler:](self, "_visiblyInsertItemAtIndexPath:modelUpdate:completionHandler:", v52, v28, v65);
              -[PUAlbumListViewController _setJustCreatedCollectionAnimationCompletionHandler:](self, "_setJustCreatedCollectionAnimationCompletionHandler:", 0);
              -[PUAlbumListViewController _updatePeripheralInterfaceAnimated:](self, "_updatePeripheralInterfaceAnimated:", 1);
              -[PUAlbumListViewController setViewInSyncWithModel:](self, "setViewInSyncWithModel:", 1);
              -[PUAlbumListViewController _updatePreheatedAssets](self, "_updatePreheatedAssets");

              v9 = v57;
              v14 = v58;
              goto LABEL_32;
            }
          }
        }
      }
    }
  }
LABEL_30:
  if (!-[PUAlbumListViewController _updateInterfaceForIncrementalModelChangeHandler:withSectionedChangeDetails:animated:](self, "_updateInterfaceForIncrementalModelChangeHandler:withSectionedChangeDetails:animated:", v28, v17, 1))
  {
LABEL_31:
    v28[2](v28);
    -[PUAlbumListViewController _updateInterfaceForModelReloadAnimated:](self, "_updateInterfaceForModelReloadAnimated:", 1);
  }
LABEL_32:
  if (!*((_BYTE *)v73 + 24))
    v28[2](v28);
  -[PUAlbumListViewController _setJustCreatedCollectionIdentifier:](self, "_setJustCreatedCollectionIdentifier:", 0);
  -[PUAlbumListViewController _justCreatedCollectionAnimationCompletionHandler](self, "_justCreatedCollectionAnimationCompletionHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[PUAlbumListViewController _justCreatedCollectionAnimationCompletionHandler](self, "_justCreatedCollectionAnimationCompletionHandler");
    v36 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v36[2]();

    -[PUAlbumListViewController _setJustCreatedCollectionAnimationCompletionHandler:](self, "_setJustCreatedCollectionAnimationCompletionHandler:", 0);
  }
  if (v64)
  {
    -[PUAlbumListViewController pushedController](self, "pushedController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "pl_visitControllerHierarchyWithBlock:", &__block_literal_global_555);

    -[PUAlbumListViewController navigationController](self, "navigationController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (id)objc_msgSend(v38, "popToViewController:animated:", self, 0);

  }
  _Block_object_dispose(&v72, 8);

LABEL_39:
}

- (void)_invalidatePreparedCellsConfiguration
{
  self->_needsUpdateFlags.preparedCellsConfiguration = 1;
}

- (void)_updatePreparedCellsConfigurationIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_needsUpdateFlags.preparedCellsConfiguration)
  {
    self->_needsUpdateFlags.preparedCellsConfiguration = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__PUAlbumListViewController__updatePreparedCellsConfigurationIfNeeded__block_invoke;
    v16[3] = &unk_1E589C218;
    v16[4] = self;
    -[PUAlbumListViewController _enumerateIndexPathsForPreparedItemsUsingBlock:](self, "_enumerateIndexPathsForPreparedItemsUsingBlock:", v16);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PUAlbumListViewController collectionView](self, "collectionView", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathsForVisibleSupplementaryElementsOfKind:", CFSTR("PUAlbumListViewControllerElementKindSectionHeader"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
          -[PUAlbumListViewController collectionView](self, "collectionView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "supplementaryViewForElementKind:atIndexPath:", CFSTR("PUAlbumListViewControllerElementKindSectionHeader"), v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          -[PUAlbumListViewController configureSupplementaryView:ofKind:forIndexPath:](self, "configureSupplementaryView:ofKind:forIndexPath:", v11, CFSTR("PUAlbumListViewControllerElementKindSectionHeader"), v9);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.preparedCellsConfiguration;
}

- (void)_updateIfNeeded
{
  if (-[PUAlbumListViewController _needsUpdate](self, "_needsUpdate"))
    -[PUAlbumListViewController _updatePreparedCellsConfigurationIfNeeded](self, "_updatePreparedCellsConfigurationIfNeeded");
}

- (PUFontManager)_fontManager
{
  PUFontManager *fontManager;
  PUFontManager *v4;
  PUFontManager *v5;

  fontManager = self->__fontManager;
  if (!fontManager)
  {
    v4 = objc_alloc_init(PUFontManager);
    v5 = self->__fontManager;
    self->__fontManager = v4;

    -[PUFontManager registerChangeObserver:context:](self->__fontManager, "registerChangeObserver:context:", self, PUFontManagerObservationContext_8717);
    fontManager = self->__fontManager;
  }
  return fontManager;
}

- (int64_t)_preferredWhitePointAdaptivityStyle
{
  return 2;
}

- (void)ppt_navigateToPlacesAndRunPreparationBlock:(id)a3 thenPerformTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIncludePlacesSmartAlbum:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000203, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[PUAlbumListViewController _navigateToPlacesFromCollection:](self, "_navigateToPlacesFromCollection:", v11);
    if (v6)
    {
      if (v7)
      {
        v12 = (void *)objc_msgSend(v7, "copy");

        v13 = (void *)objc_msgSend(v6, "copy");
        -[PUAlbumListViewController navigationController](self, "navigationController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "topViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __88__PUAlbumListViewController_ppt_navigateToPlacesAndRunPreparationBlock_thenPerformTest___block_invoke;
        block[3] = &unk_1E58AB800;
        v6 = v13;
        v20 = v6;
        v7 = v12;
        v21 = v7;
        v19 = v15;
        v17 = v15;
        dispatch_after(v16, MEMORY[0x1E0C80D38], block);

      }
    }
  }

}

- (void)ppt_performPlacesScrollTest:(id)a3 preparationHandler:(id)a4 iterations:(int64_t)a5 screenDelta:(int64_t)a6 delay:(double)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  int64_t v21;
  int64_t v22;
  double v23;

  v14 = a3;
  v15 = a8;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __116__PUAlbumListViewController_ppt_performPlacesScrollTest_preparationHandler_iterations_screenDelta_delay_completion___block_invoke;
  v18[3] = &unk_1E589C2F0;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v19 = v14;
  v20 = v15;
  v16 = v15;
  v17 = v14;
  -[PUAlbumListViewController ppt_navigateToPlacesAndRunPreparationBlock:thenPerformTest:](self, "ppt_navigateToPlacesAndRunPreparationBlock:thenPerformTest:", a4, v18);

}

- (void)ppt_performPlacesZoomTest:(id)a3 preparationHandler:(id)a4 iterations:(int64_t)a5 delay:(double)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  int64_t v19;
  double v20;

  v12 = a3;
  v13 = a7;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__PUAlbumListViewController_ppt_performPlacesZoomTest_preparationHandler_iterations_delay_completion___block_invoke;
  v16[3] = &unk_1E589C318;
  v18 = v13;
  v19 = a5;
  v20 = a6;
  v17 = v12;
  v14 = v13;
  v15 = v12;
  -[PUAlbumListViewController ppt_navigateToPlacesAndRunPreparationBlock:thenPerformTest:](self, "ppt_navigateToPlacesAndRunPreparationBlock:thenPerformTest:", a4, v16);

}

- (void)placesSnapshotDidChange
{
  id v2;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

- (void)placesSnapshotCountDidChange
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PUAlbumListViewController _placesAlbumCoverProvider](self, "_placesAlbumCoverProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PUAlbumListViewController_placesSnapshotCountDidChange__block_invoke;
  v4[3] = &unk_1E58AB320;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "requestAssetCountWithForcedRefresh:completion:", 1, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)editableNavigationTitleView:(id)a3 validateNewText:(id)a4
{
  return -[PUAlbumListViewController _validateNewCollectionTitle:](self, "_validateNewCollectionTitle:", a4);
}

- (void)editableNavigationTitleViewDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__PUAlbumListViewController_editableNavigationTitleViewDidEndEditing___block_invoke;
    v10[3] = &unk_1E58ABCA8;
    v11 = v5;
    v12 = v4;
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __70__PUAlbumListViewController_editableNavigationTitleViewDidEndEditing___block_invoke_2;
    v8[3] = &unk_1E58AB060;
    v9 = v11;
    objc_msgSend(v6, "performChanges:completionHandler:", v10, v8);

  }
}

- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 4762, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollectionHandler"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAlbumListViewController.m"), 4763, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  if (appIntentsEnumerateAssetCollections_completionHandler__predicate != -1)
    dispatch_once(&appIntentsEnumerateAssetCollections_completionHandler__predicate, &__block_literal_global_567);
  -[PUAlbumListViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = appIntentsEnumerateAssetCollections_completionHandler__serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PUAlbumListViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_2;
  block[3] = &unk_1E58AB800;
  v17 = v9;
  v18 = v7;
  v19 = v8;
  v11 = v8;
  v12 = v7;
  v13 = v9;
  dispatch_async(v10, block);

}

- (PXPlacesAlbumCoverProvider)_placesAlbumCoverProvider
{
  return self->__placesAlbumCoverProvider;
}

- (PUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)dataSourceManagerConfiguration
{
  return self->_dataSourceManagerConfiguration;
}

- (PHCollection)collection
{
  return self->_collection;
}

- (BOOL)canShowAggregateItem
{
  return self->_canShowAggregateItem;
}

- (void)setCanShowAggregateItem:(BOOL)a3
{
  self->_canShowAggregateItem = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (BOOL)isViewInSyncWithModel
{
  return self->_viewInSyncWithModel;
}

- (void)setViewInSyncWithModel:(BOOL)a3
{
  self->_viewInSyncWithModel = a3;
}

- (PHCollection)retitlingCollection
{
  return self->_retitlingCollection;
}

- (void)setRetitlingCollection:(id)a3
{
  objc_storeStrong((id *)&self->_retitlingCollection, a3);
}

- (PHCachingImageManager)_cachingImageManager
{
  return self->__cachingImageManager;
}

- (UIView)_backgroundView
{
  return self->__backgroundView;
}

- (void)_setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->__backgroundView, a3);
}

- (NSString)_justCreatedCollectionIdentifier
{
  return self->__justCreatedCollectionIdentifier;
}

- (void)_setJustCreatedCollectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->__justCreatedCollectionIdentifier, a3);
}

- (id)_justCreatedCollectionAnimationCompletionHandler
{
  return self->__justCreatedCollectionAnimationCompletionHandler;
}

- (void)_setJustCreatedCollectionAnimationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1144);
}

- (BOOL)_aboutToCreateAlbum
{
  return self->__aboutToCreateAlbum;
}

- (void)_setAboutToCreateAlbum:(BOOL)a3
{
  self->__aboutToCreateAlbum = a3;
}

- (id)_onViewDidLayoutSubviewsBlock
{
  return self->__onViewDidLayoutSubviewsBlock;
}

- (void)_setOnViewDidLayoutSubviewsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (BOOL)_isKeyboardAware
{
  return self->__isKeyboardAware;
}

- (void)_setKeyboardAware:(BOOL)a3
{
  self->__isKeyboardAware = a3;
}

- (BOOL)progressViewVisible
{
  return self->_progressViewVisible;
}

- (void)setProgressViewVisible:(BOOL)a3
{
  self->_progressViewVisible = a3;
}

- (PXPhotosGlobalFooterView)syncProgressView
{
  return self->_syncProgressView;
}

- (void)setSyncProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_syncProgressView, a3);
}

- (id)contextMenuInteractionEndBlock
{
  return self->_contextMenuInteractionEndBlock;
}

- (void)setContextMenuInteractionEndBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1168);
}

- (PHCollection)pushedAlbum
{
  return self->_pushedAlbum;
}

- (void)setPushedAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_pushedAlbum, a3);
}

- (UIViewController)pushedController
{
  return self->_pushedController;
}

- (void)setPushedController:(id)a3
{
  objc_storeStrong((id *)&self->_pushedController, a3);
}

- (PUPhotoPinchGestureRecognizer)_photoPinchGestureRecognizer
{
  return self->__photoPinchGestureRecognizer;
}

- (void)_setPhotoPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__photoPinchGestureRecognizer, a3);
}

- (PUFeedViewController)_cachedFeedViewController
{
  return self->__cachedFeedViewController;
}

- (void)_setCachedFeedViewController:(id)a3
{
  objc_storeStrong((id *)&self->__cachedFeedViewController, a3);
}

- (CGRect)_previousPreheatRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__previousPreheatRect.origin.x;
  y = self->__previousPreheatRect.origin.y;
  width = self->__previousPreheatRect.size.width;
  height = self->__previousPreheatRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setPreviousPreheatRect:(CGRect)a3
{
  self->__previousPreheatRect = a3;
}

- (NSMutableSet)_preheatedCollections
{
  return self->__preheatedCollections;
}

- (void)_setPreheatedCollections:(id)a3
{
  objc_storeStrong((id *)&self->__preheatedCollections, a3);
}

- (PUCollectionView)_mainCollectionView
{
  return self->__mainCollectionView;
}

- (void)_setMainCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->__mainCollectionView, a3);
}

- (PUSectionedGridLayout)_mainCollectionViewLayout
{
  return self->__mainCollectionViewLayout;
}

- (void)_setMainCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->__mainCollectionViewLayout, a3);
}

- (PUAlbumListTransitionContext)albumListTransitionContext
{
  return self->_albumListTransitionContext;
}

- (UICollectionViewLayout)_albumListTransitionLayout
{
  return self->__albumListTransitionLayout;
}

- (void)setAlbumListTransitionLayout:(id)a3
{
  objc_storeStrong((id *)&self->__albumListTransitionLayout, a3);
}

- (UITableView)_mainTableView
{
  return self->__mainTableView;
}

- (void)_setMainTableView:(id)a3
{
  objc_storeStrong((id *)&self->__mainTableView, a3);
}

- (int64_t)_ignoredReorderNotificationCount
{
  return self->__ignoredReorderNotificationCount;
}

- (void)_setIgnoredReorderNotificationCount:(int64_t)a3
{
  self->__ignoredReorderNotificationCount = a3;
}

- (UIAlertAction)_createAlbumAlertAction
{
  return (UIAlertAction *)objc_loadWeakRetained((id *)&self->__createAlbumAlertAction);
}

- (void)_setCreateAlbumAlertAction:(id)a3
{
  objc_storeWeak((id *)&self->__createAlbumAlertAction, a3);
}

- (PHPickerViewController)pickerViewController
{
  return (PHPickerViewController *)objc_loadWeakRetained((id *)&self->_pickerViewController);
}

- (void)setPickerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_pickerViewController, a3);
}

- (id)finishedPickingBlock
{
  return self->_finishedPickingBlock;
}

- (void)setFinishedPickingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1280);
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  return self->_assetCollectionActionManager;
}

- (void)setAssetCollectionActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionActionManager, a3);
}

- (PXPhotoKitCollectionsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceManager, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (PXPeopleAlbumProvider)_peopleAlbumProvider
{
  return self->__peopleAlbumProvider;
}

- (void)_setPeopleAlbumProvider:(id)a3
{
  objc_storeStrong((id *)&self->__peopleAlbumProvider, a3);
}

- (CGSize)_layoutReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->__layoutReferenceSize.width;
  height = self->__layoutReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)_layoutSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__layoutSafeAreaInsets.top;
  left = self->__layoutSafeAreaInsets.left;
  bottom = self->__layoutSafeAreaInsets.bottom;
  right = self->__layoutSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)_pendingScrollingAnimationEndBlock
{
  return self->__pendingScrollingAnimationEndBlock;
}

- (void)_setPendingScrollingAnimationEndBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1320);
}

- (PXAssetBadgeManager)_badgeManager
{
  return self->__badgeManager;
}

- (PXCollectionTileLayoutTemplate)_collectionTileLayoutTemplate
{
  return self->__collectionTileLayoutTemplate;
}

- (PXFeatureSpecManager)_featureSpecManager
{
  return self->__featureSpecManager;
}

- (PXFeatureSpec)_featureSpec
{
  return self->__featureSpec;
}

- (void)_setFeatureSpec:(id)a3
{
  objc_storeStrong((id *)&self->__featureSpec, a3);
}

- (UIViewController)_placesContainerController
{
  return self->__placesContainerController;
}

- (PXEditableNavigationTitleView)editableTitleView
{
  return self->_editableTitleView;
}

- (NSUserActivity)siriActionActivity
{
  return self->_siriActionActivity;
}

- (void)setSiriActionActivity:(id)a3
{
  objc_storeStrong((id *)&self->_siriActionActivity, a3);
}

- (PUCollectionsCollectionViewDropDelegate)collectionViewDropDelegate
{
  return self->_collectionViewDropDelegate;
}

- (void)setCollectionViewDropDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewDropDelegate, a3);
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_collectionViewDropDelegate, 0);
  objc_storeStrong((id *)&self->_siriActionActivity, 0);
  objc_storeStrong((id *)&self->_editableTitleView, 0);
  objc_storeStrong((id *)&self->__placesContainerController, 0);
  objc_storeStrong((id *)&self->__featureSpec, 0);
  objc_storeStrong((id *)&self->__featureSpecManager, 0);
  objc_storeStrong((id *)&self->__collectionTileLayoutTemplate, 0);
  objc_storeStrong((id *)&self->__badgeManager, 0);
  objc_storeStrong(&self->__pendingScrollingAnimationEndBlock, 0);
  objc_storeStrong((id *)&self->__peopleAlbumProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_assetCollectionActionManager, 0);
  objc_storeStrong(&self->_finishedPickingBlock, 0);
  objc_destroyWeak((id *)&self->_pickerViewController);
  objc_destroyWeak((id *)&self->__createAlbumAlertAction);
  objc_storeStrong((id *)&self->__mainTableView, 0);
  objc_storeStrong((id *)&self->__albumListTransitionLayout, 0);
  objc_storeStrong((id *)&self->_albumListTransitionContext, 0);
  objc_storeStrong((id *)&self->__mainCollectionViewLayout, 0);
  objc_storeStrong((id *)&self->__mainCollectionView, 0);
  objc_storeStrong((id *)&self->__preheatedCollections, 0);
  objc_storeStrong((id *)&self->__cachedFeedViewController, 0);
  objc_storeStrong((id *)&self->__photoPinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pushedController, 0);
  objc_storeStrong((id *)&self->_pushedAlbum, 0);
  objc_storeStrong(&self->_contextMenuInteractionEndBlock, 0);
  objc_storeStrong((id *)&self->_syncProgressView, 0);
  objc_storeStrong(&self->__onViewDidLayoutSubviewsBlock, 0);
  objc_storeStrong(&self->__justCreatedCollectionAnimationCompletionHandler, 0);
  objc_storeStrong((id *)&self->__justCreatedCollectionIdentifier, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->__cachingImageManager, 0);
  objc_storeStrong((id *)&self->_retitlingCollection, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_dataSourceManagerConfiguration, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->__placesAlbumCoverProvider, 0);
  objc_storeStrong((id *)&self->__fontManager, 0);
  objc_storeStrong((id *)&self->__imageRequestOptions, 0);
  objc_storeStrong((id *)&self->_sectionHeaderView, 0);
  objc_storeStrong((id *)&self->_keyAssetsForMoments, 0);
  objc_storeStrong((id *)&self->_aggregateCollageView, 0);
  objc_storeStrong((id *)&self->_albumSubtitleFormat, 0);
  objc_storeStrong((id *)&self->_albumCreationButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

void __83__PUAlbumListViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__PUAlbumListViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_3;
  v3[3] = &unk_1E589C360;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateCollectionsUsingBlock:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __83__PUAlbumListViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v4;

    if (v3)
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {

    v3 = 0;
  }

}

void __83__PUAlbumListViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("PUAlbumListViewController", attr);
  v2 = (void *)appIntentsEnumerateAssetCollections_completionHandler__serialQueue;
  appIntentsEnumerateAssetCollections_completionHandler__serialQueue = (uint64_t)v1;

}

void __70__PUAlbumListViewController_editableNavigationTitleViewDidEndEditing___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CD14E8], "changeRequestForCollectionList:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v1);

}

void __70__PUAlbumListViewController_editableNavigationTitleViewDidEndEditing___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "failed to rename %@: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __57__PUAlbumListViewController_placesSnapshotCountDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3[2];

  objc_copyWeak(v3, (id *)(a1 + 32));
  v3[1] = a2;
  px_dispatch_on_main_queue();
  objc_destroyWeak(v3);
}

void __57__PUAlbumListViewController_placesSnapshotCountDidChange__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showPlacesCount:", *(_QWORD *)(a1 + 40));

}

void __52__PUAlbumListViewController_placesSnapshotDidChange__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "indexPathForPlacesAlbum");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "updateListCellForItemAtIndexPath:animated:", v1, 0);

}

void __102__PUAlbumListViewController_ppt_performPlacesZoomTest_preparationHandler_iterations_delay_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "fetchResultViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ppt_performPlacesZoomTest:iterations:delay:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));

}

void __116__PUAlbumListViewController_ppt_performPlacesScrollTest_preparationHandler_iterations_screenDelta_delay_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "fetchResultViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ppt_performPlacesScrollTest:iterations:screenDelta:delay:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));

}

uint64_t __88__PUAlbumListViewController_ppt_navigateToPlacesAndRunPreparationBlock_thenPerformTest___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __70__PUAlbumListViewController__updatePreparedCellsConfigurationIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateListCellForItemAtIndexPath:animated:", a2, 0);
}

void __58__PUAlbumListViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1304), *(id *)(a1 + 40));
  }
}

uint64_t __58__PUAlbumListViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "contentItemsChangedIndexPaths", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "updateListCellForItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), 1);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__PUAlbumListViewController_observable_didChange_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EEC31040))
    v3 = objc_msgSend(v2, "prepareForDismissingForced:", 1);
  else
    v3 = 1;

  return v3;
}

void __70__PUAlbumListViewController_tableView_moveRowAtIndexPath_toIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD14E8], "changeRequestForCollectionList:childCollections:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeChildCollectionsAtIndexes:", v4);

  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertChildCollections:atIndexes:", v5, v6);

}

uint64_t __53__PUAlbumListViewController_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetIdentifier");
}

void __94__PUAlbumListViewController_collectionView_moveItemAtIndexPath_toIndexPath_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD14E8], "changeRequestForCollectionList:childCollections:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeChildCollectionsAtIndexes:", v4);

  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertChildCollections:atIndexes:", v5, v6);

}

void __94__PUAlbumListViewController_collectionView_moveItemAtIndexPath_toIndexPath_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__PUAlbumListViewController_collectionView_moveItemAtIndexPath_toIndexPath_completionHandler___block_invoke_3;
  block[3] = &unk_1E58ABAF0;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __94__PUAlbumListViewController_collectionView_moveItemAtIndexPath_toIndexPath_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "dataSourceManagerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSourceManagerConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "newConfigurationWithCollectionList:", *(_QWORD *)(a1 + 40));

    v4 = (uint64_t)v6;
  }
  else
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", *(_QWORD *)(a1 + 40));
  }
  v7 = (id)v4;
  objc_msgSend(*(id *)(a1 + 32), "setDataSourceManagerConfiguration:", v4);
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

uint64_t __102__PUAlbumListViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "navigateToCollection:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

uint64_t __100__PUAlbumListViewController_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke(uint64_t a1)
{
  void (**v2)(void);

  objc_msgSend(*(id *)(a1 + 32), "contextMenuInteractionEndBlock");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

  return objc_msgSend(*(id *)(a1 + 32), "setContextMenuInteractionEndBlock:", 0);
}

id __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  uint64_t v31;
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 56), "canPerformEditOperation:", 7))
  {
    objc_msgSend(MEMORY[0x1E0D7B8A0], "actionNameForCollection:", *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("pencil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2;
    v27[3] = &unk_1E58A9FA8;
    objc_copyWeak(&v29, &location);
    v28 = v4;
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v5, v7, 0, v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v29);
  }
  else
  {
    v8 = 0;
  }
  v9 = *(id *)(a1 + 56);
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    v12 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v10 = v9;

  if (v10)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B6C8]), "initWithAssetCollection:displayTitleInfo:", v10, 0);
    objc_msgSend(v9, "setPerformerDelegate:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 48), "setAssetCollectionActionManager:", v9);
    if (v8)
    {
      v31 = *MEMORY[0x1E0D7C170];
      v32[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C9AA70];
    }
    objc_msgSend(MEMORY[0x1E0D7B180], "contextMenuWithActionManager:overrideActions:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:
  v13 = *(id *)(a1 + 56);
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v14 = v13;

  if (v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    v13 = v15;
    if (v8)
      objc_msgSend(v15, "addObject:", v8);
    if (objc_msgSend(v14, "canPerformEditOperation:", 6))
    {
      v22 = (void *)MEMORY[0x1E0DC3428];
      PXLocalizedString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_4;
      v23[3] = &unk_1E58A9FD0;
      v21 = &v26;
      objc_copyWeak(&v26, &location);
      v24 = *(id *)(a1 + 56);
      v25 = v4;
      objc_msgSend(v22, "actionWithTitle:image:identifier:handler:", v16, v17, 0, v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setAttributes:", 2);
      objc_msgSend(v13, "addObject:", v18);

      objc_destroyWeak(&v26);
    }
    if (objc_msgSend(v13, "count", v21))
    {
      objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, 0, 0, 1, v13);
      v19 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v19;
    }
    goto LABEL_24;
  }
LABEL_25:

  objc_destroyWeak(&location);
  return v12;
}

void __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3;
  v3[3] = &unk_1E58ABD10;
  v4 = *(id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setContextMenuInteractionEndBlock:", v3);

}

void __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleDeleteCollection:sourceView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "albumListCellContentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startPerformRetitleAction");

}

void __58__PUAlbumListViewController_handleTransitionFade_animate___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "indexPathForCollection:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_mainCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellForItemAtIndexPath:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "viewWithTag:", 236897);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleTransitionFade:animate:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));

  }
}

uint64_t __59__PUAlbumListViewController_setAlbumListTransitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateListCellForItemAtIndexPath:animated:", a2, 1);
}

uint64_t __96__PUAlbumListViewController_navigateToSharedAlbumActivityFeedAnimated_configuration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __96__PUAlbumListViewController_navigateToSharedAlbumActivityFeedAnimated_configuration_completion___block_invoke_407(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __75__PUAlbumListViewController__performOrScheduleScrollToCollection_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_scrollToCollection:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

void __66__PUAlbumListViewController__canUseStackTransitionFromCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v6, "estimatedAssetCount")
    || objc_msgSend(v6, "px_isFolder"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __61__PUAlbumListViewController__navigateToPlacesFromCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setEligibleForSearch:", 1);
  objc_msgSend(v3, "_setEligibleForPrediction:", 1);
  objc_msgSend(v3, "setEligibleForHandoff:", 0);
  v6 = CFSTR("uuid");
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addUserInfoEntriesFromDictionary:", v5);

  objc_msgSend(v3, "px_setPersistentIdentifierFromAssetCollection:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setSiriActionActivity:", v3);
  objc_msgSend(v3, "becomeCurrent");

}

uint64_t __61__PUAlbumListViewController__navigateToPlacesFromCollection___block_invoke()
{
  return px_deferredLocalizedStringWithFormat();
}

uint64_t __77__PUAlbumListViewController_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __101__PUAlbumListViewController__navigateToDestination_provideViewControllers_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = *(_QWORD *)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a2;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v8, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 40));

  if ((_DWORD)v9)
    objc_msgSend(*(id *)(a1 + 48), "becomeCurrent");

}

void __101__PUAlbumListViewController__navigateToDestination_provideViewControllers_options_completionHandler___block_invoke_386(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __101__PUAlbumListViewController__navigateToDestination_provideViewControllers_options_completionHandler___block_invoke_2;
    v9[3] = &unk_1E589C180;
    v5 = *(_QWORD *)(a1 + 64);
    v10 = *(id *)(a1 + 56);
    objc_msgSend(a2, "navigateToDestination:options:completionHandler:", v4, v5, v9);
    v6 = v10;
  }
  else
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_error_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Album List failed to create a view controller for collection %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Album List failed to create a view controller for collection %@"), *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __101__PUAlbumListViewController__navigateToDestination_provideViewControllers_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __87__PUAlbumListViewController_albumListCellContentView_didEndRetitlingFromTitle_toTitle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTitle:", *(_QWORD *)(a1 + 40));
}

void __47__PUAlbumListViewController_updateSyncProgress__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  PLLocalizedCountDescription();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v3);

  PLProgressDescription();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSubtitle1:", v4);

}

uint64_t __87__PUAlbumListViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateNavigationBarAnimated:", 0);
}

uint64_t __49__PUAlbumListViewController_setEditing_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateListCellForItemAtIndexPath:animated:", a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t __49__PUAlbumListViewController_setEditing_animated___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "compare:", a2);
  if (result == -1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void __50__PUAlbumListViewController__postDidAppearActions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__PUAlbumListViewController__postDidAppearActions__block_invoke_2;
  v3[3] = &unk_1E58AB320;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_msgSend(WeakRetained, "requestAssetCountWithForcedRefresh:completion:", 1, v3);

  objc_destroyWeak(&v4);
}

void __50__PUAlbumListViewController__postDidAppearActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3[2];

  objc_copyWeak(v3, (id *)(a1 + 32));
  v3[1] = a2;
  px_dispatch_on_main_queue();
  objc_destroyWeak(v3);
}

void __50__PUAlbumListViewController__postDidAppearActions__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showPlacesCount:", *(_QWORD *)(a1 + 40));

}

void __43__PUAlbumListViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_postDidAppearActions");

}

uint64_t __44__PUAlbumListViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "scrollToItemAtIndexPath:centered:animated:", *(_QWORD *)(a1 + 40), 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "selectItemAtIndexPath:animated:", *(_QWORD *)(a1 + 40), 0);
}

void __51__PUAlbumListViewController__updatePreheatedAssets__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "indexPathsForItemsInRect:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "collectionAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9 && (objc_msgSend(v9, "px_isFolder") & 1) == 0)
        {
          v11 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v10);
          if (a2)
          {
            if ((v11 & 1) != 0)
              goto LABEL_20;
            objc_msgSend(*(id *)(a1 + 32), "_visibleAssetsForCollection:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v14 = *(void **)(v13 + 40);
            if (v14)
            {
              v15 = v14;
              v16 = *(void **)(v13 + 40);
              *(_QWORD *)(v13 + 40) = v15;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              v16 = *(void **)(v22 + 40);
              *(_QWORD *)(v22 + 40) = v21;
            }

            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v12);
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
          }
          else
          {
            if (!v11)
              goto LABEL_20;
            objc_msgSend(*(id *)(a1 + 32), "_visibleAssetsForCollection:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v18 = *(void **)(v17 + 40);
            if (v18)
            {
              v19 = v18;
              v20 = *(void **)(v17 + 40);
              *(_QWORD *)(v17 + 40) = v19;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              v20 = *(void **)(v24 + 40);
              *(_QWORD *)(v24 + 40) = v23;
            }

            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v12);
            objc_msgSend(*(id *)(a1 + 40), "removeObject:", v10);
          }

        }
LABEL_20:

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v6);
  }

}

uint64_t __95__PUAlbumListViewController_navigateToPeopleAnimated_withPersonLocalIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __61__PUAlbumListViewController_handleSessionInfoAlbumSelection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTargetAlbum:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setStatus:", 1);
}

void __61__PUAlbumListViewController__handleCollectionListActionType___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id location;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "createdCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "sessionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "_setJustCreatedCollectionIdentifier:", v7);
    v9 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__PUAlbumListViewController__handleCollectionListActionType___block_invoke_2;
    v13[3] = &unk_1E58A9F58;
    objc_copyWeak(&v17, &location);
    v10 = v8;
    v14 = v10;
    v11 = v6;
    v12 = *(_QWORD *)(a1 + 40);
    v15 = v11;
    v16 = v12;
    objc_msgSend(v9, "_setJustCreatedCollectionAnimationCompletionHandler:", v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
}

void __61__PUAlbumListViewController__handleCollectionListActionType___block_invoke_2(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (objc_msgSend(a1[4], "isSelectingTargetAlbum"))
  {
    objc_msgSend(WeakRetained, "_pickerBannerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "indexPathForCollection:", a1[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutIfNeeded");

    objc_msgSend(WeakRetained, "_preparedAlbumListCellContentViewAtIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__PUAlbumListViewController__handleCollectionListActionType___block_invoke_3;
    v15[3] = &unk_1E58AAE08;
    v16 = a1[4];
    v17 = a1[5];
    objc_msgSend(v4, "animateImagesOntoView:inContainerView:completionHandler:", v8, v10, v15);

  }
  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "sharedLibraryStatusProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "hasSharedLibraryOrPreview"))
  {
    objc_msgSend(a1[6], "libraryFilterState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "viewMode");

    if (v14 == 2)
      objc_msgSend(WeakRetained, "navigateToCollection:animated:completion:", a1[5], 1, 0);
  }

}

uint64_t __61__PUAlbumListViewController__handleCollectionListActionType___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTargetAlbum:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setStatus:", 1);
}

void __86__PUAlbumListViewController__targetIndexPathForMoveFromIndexPath_toProposedIndexPath___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  __int128 v7;
  void *v8;
  void *v9;
  int v10;
  _OWORD v11[2];

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(a2 + 16);
  v11[0] = *(_OWORD *)a2;
  v11[1] = v7;
  objc_msgSend(v6, "objectAtIndexPath:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "dataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canReorderCollection:", v8);

  if (v10)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(a1 + 56) + *(_QWORD *)(a2 + 8);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(a2 + 16);
    *a3 = 1;
  }

}

void __59__PUAlbumListViewController_indexPathForFirstEditableAlbum__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _OWORD v12[2];

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(a2 + 16);
  v12[0] = *(_OWORD *)a2;
  v12[1] = v7;
  objc_msgSend(v6, "objectAtIndexPath:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "_editCapabilitiesForAlbum:", v8))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(a2 + 16), objc_msgSend(*(id *)(a1 + 32), "albumsSections") + *(_QWORD *)(a2 + 8));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a3 = 1;
  }

}

void __52__PUAlbumListViewController_indexPathForPeopleAlbum__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "px_isPeopleVirtualCollection"))
  {
    objc_msgSend(*(id *)(a1 + 32), "indexPathForCollection:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }

}

void __52__PUAlbumListViewController_indexPathForPlacesAlbum__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "px_isPlacesSmartAlbum"))
  {
    objc_msgSend(*(id *)(a1 + 32), "indexPathForCollection:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }

}

void __58__PUAlbumListViewController__updateCollageView_forAssets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setImageSize:forItemAtIndex:", a3, (double)(unint64_t)objc_msgSend(v5, "pixelWidth"), (double)(unint64_t)objc_msgSend(v5, "pixelHeight"));
  objc_msgSend(*(id *)(a1 + 40), "_imageRequestOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_cachingImageManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 64);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__PUAlbumListViewController__updateCollageView_forAssets___block_invoke_2;
  v11[3] = &unk_1E589EFE8;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 72);
  v12 = v9;
  v13 = v10;
  v14 = a3;
  objc_msgSend(v7, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v5, v8, v6, v11, *(double *)(a1 + 48), *(double *)(a1 + 56));

}

void __58__PUAlbumListViewController__updateCollageView_forAssets___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6 && objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setImage:forItemAtIndex:", v6, *(_QWORD *)(a1 + 48));

}

void __100__PUAlbumListViewController__updateStackView_forFaces_inCollection_withCustomEmptyPlaceholderImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(v5, "size");
  objc_msgSend(*(id *)(a1 + 32), "setImageSize:forItemAtIndex:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setImage:forItemAtIndex:", v5, a3);

}

void __99__PUAlbumListViewController__updateStackView_forAssets_collection_withCustomEmptyPlaceholderImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setImageSize:forItemAtIndex:", a3, (double)(unint64_t)objc_msgSend(v5, "pixelWidth"), (double)(unint64_t)objc_msgSend(v5, "pixelHeight"));
  if (!a3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(*(id *)(a1 + 40), "assetCollectionSubtype") == 4)
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "posterImageForAssetCollection:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "size");
      objc_msgSend(*(id *)(a1 + 32), "setImageSize:forItemAtIndex:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setImage:forItemAtIndex:", v7, 0);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_imageRequestOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_cachingImageManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 72);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __99__PUAlbumListViewController__updateStackView_forAssets_collection_withCustomEmptyPlaceholderImage___block_invoke_2;
    v13[3] = &unk_1E589EFE8;
    v11 = *(id *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 80);
    v14 = v11;
    v15 = v12;
    v16 = a3;
    objc_msgSend(v9, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v5, v10, v8, v13, *(double *)(a1 + 56), *(double *)(a1 + 64));

  }
}

void __99__PUAlbumListViewController__updateStackView_forAssets_collection_withCustomEmptyPlaceholderImage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6 && objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setImage:forItemAtIndex:", v6, *(_QWORD *)(a1 + 48));

}

void __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6[2];

  v3 = a2;
  v4 = a1[4];
  v6[1] = a1[6];
  objc_copyWeak(v6, a1 + 5);
  v5 = v3;
  px_dispatch_on_main_queue();

  objc_destroyWeak(v6);
}

void __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  id v9[2];

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_peopleAlbumProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "peopleCount");

  objc_copyWeak(v9, v2);
  v8 = *(id *)(a1 + 32);
  v9[1] = v5;
  v7 = *(_OWORD *)(a1 + 40);
  v6 = (id)v7;
  px_dispatch_on_main_queue();

  objc_destroyWeak(v9);
}

void __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  id v18;

  v18 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 64))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v6 = WeakRetained;
    if (v18)
    {
      objc_msgSend(WeakRetained, "_prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:", *(_QWORD *)(a1 + 32), 0, 0);
    }
    else
    {
      objc_msgSend(WeakRetained, "spec");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "emptyAlbumPlaceholderImageForWindow:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v10, "_prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:", *(_QWORD *)(a1 + 32), 0, 0, v9);

      v6 = (void *)v9;
    }

    objc_msgSend(*(id *)(a1 + 40), "setCustomImageView:", 0);
    if (a3)
    {
      PLSharedCountFormatter();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromNumber:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
    else
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v17 = CFSTR(" ");
      v11 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = CFSTR(" ");
    }

    objc_msgSend(*(id *)(a1 + 40), "setSubtitle:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }

}

void __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v7 = a2;
  v8 = a5;
  v12 = *(id *)(a1 + 32);
  v11 = v8;
  v9 = v8;
  v10 = v7;
  px_dispatch_on_main_queue();

}

uint64_t __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke_7(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[7], a1[5]);
}

void __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *WeakRetained;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "indexPathForPeopleAlbum");
  v8 = objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(*(id *)(a1 + 32), "compare:", v8);
  v5 = (void *)v8;
  if (!v4)
  {
    v6 = *(_QWORD *)(a1 + 64);
    if (v6)
    {
      PLSharedCountFormatter();
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 64));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "stringFromNumber:", v1);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = CFSTR(" ");
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
    if (v6)
    {

    }
    objc_msgSend(*(id *)(a1 + 40), "setSubtitle:animated:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 1);
    v5 = (void *)v8;
  }

}

void __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 56))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_updateStackView:forPeopleImages:inCollection:withCustomEmptyPlaceholderImage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

  }
}

void __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "indexPathForAggregateItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 96);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "indexPathForAggregateItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v2 == v4)
  {

  }
  else
  {
    v5 = objc_msgSend(v2, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      if (v2)
      {
        v6 = *(void **)(a1 + 40);
        v15[0] = v2;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "deleteItemsAtIndexPaths:", v7);

      }
      if (v4)
      {
        v8 = *(void **)(a1 + 40);
        v14 = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "insertItemsAtIndexPaths:", v9);

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
    objc_msgSend(*(id *)(a1 + 40), "deleteSections:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
    objc_msgSend(*(id *)(a1 + 40), "insertSections:", *(_QWORD *)(a1 + 56));
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
    objc_msgSend(*(id *)(a1 + 40), "deleteItemsAtIndexPaths:", *(_QWORD *)(a1 + 64));
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
    objc_msgSend(*(id *)(a1 + 40), "insertItemsAtIndexPaths:", *(_QWORD *)(a1 + 72));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke_2;
  v11[3] = &unk_1E589BEB8;
  v10 = *(void **)(a1 + 80);
  v12 = *(id *)(a1 + 88);
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

uint64_t __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 40), "updateListCellForItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), 1, (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "moveRowAtIndexPath:toIndexPath:", v6, v7);

}

void __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "moveItemAtIndexPath:toIndexPath:", v6, v7);

}

void __89__PUAlbumListViewController__visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "indexPathForAggregateItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "indexPathForAggregateItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v2 == v4)
  {

  }
  else
  {
    v5 = objc_msgSend(v2, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      if (v2)
      {
        v6 = *(void **)(a1 + 40);
        v14[0] = v2;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "deleteItemsAtIndexPaths:", v7);

      }
      if (v4)
      {
        v8 = *(void **)(a1 + 40);
        v13 = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "insertItemsAtIndexPaths:", v9);

      }
    }
  }
  v10 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertItemsAtIndexPaths:", v11);

}

void __89__PUAlbumListViewController__visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "indexPathsForVisibleItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "scrollToItemAtIndexPath:atScrollPosition:animated:", *(_QWORD *)(a1 + 40), 0, 1);
    objc_msgSend(*(id *)(a1 + 32), "_setPendingScrollingAnimationEndBlock:", *(_QWORD *)(a1 + 56));
    objc_initWeak(&location, *(id *)(a1 + 32));
    v4 = dispatch_time(0, 2000000000);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __89__PUAlbumListViewController__visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke_3;
    v5[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v6, &location);
    dispatch_after(v4, MEMORY[0x1E0C80D38], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

void __89__PUAlbumListViewController__visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePendingScrollingAnimationEndBlock");

}

uint64_t __54__PUAlbumListViewController__someAlbumSupportsEditing__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_editCapabilitiesForAlbum:", a2);
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __114__PUAlbumListViewController__updateInterfaceForIncrementalModelChangeHandler_withSectionedChangeDetails_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addObject:", a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

uint64_t __53__PUAlbumListViewController__albumCreationButtonItem__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newSharedAlbum:", 0);
}

uint64_t __53__PUAlbumListViewController__albumCreationButtonItem__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newAlbum:", 0);
}

uint64_t __53__PUAlbumListViewController__albumCreationButtonItem__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newFolder:", 0);
}

+ (id)newMyAlbumsViewControllerWithSpec:(id)a3 sessionInfo:(id)a4 photoLibrary:(id)a5
{
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

  v8 = (void *)MEMORY[0x1E0CD14E0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRootAlbumCollectionListWithOptions:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", v14);
  objc_msgSend(v15, "setCollectionTypesToInclude:", 4983826);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B708]), "initWithConfiguration:", v15);
  v17 = (void *)objc_msgSend(a1, "newMyAlbumsViewControllerWithSpec:sessionInfo:dataSourceManager:photoLibrary:", v11, v10, v16, v9);

  return v17;
}

+ (id)newMyAlbumsViewControllerWithSpec:(id)a3 sessionInfo:(id)a4 dataSourceManager:(id)a5 photoLibrary:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PUAlbumListViewController *v13;
  void *v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[PUAlbumListViewController initWithSpec:dataSourceManager:photoLibrary:]([PUAlbumListViewController alloc], "initWithSpec:dataSourceManager:photoLibrary:", v12, v10, v9);

  -[PUAlbumListViewController setSessionInfo:](v13, "setSessionInfo:", v11);
  PULocalizedString(CFSTR("USER_CREATED_ALBUMS_TITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController setTitle:](v13, "setTitle:", v14);

  return v13;
}

+ (id)newSharedAlbumsViewControllerWithSpec:(id)a3 sessionInfo:(id)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "px_virtualCollections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sharedAlbumsCollectionList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", v12);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B708]), "initWithConfiguration:", v13);
  v15 = (void *)objc_msgSend(a1, "newSharedAlbumsViewControllerWithSpec:sessionInfo:dataSourceManager:photoLibrary:", v10, v9, v14, v8);

  return v15;
}

+ (id)newSharedAlbumsViewControllerWithSpec:(id)a3 sessionInfo:(id)a4 dataSourceManager:(id)a5 photoLibrary:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PUAlbumListViewController *v13;
  void *v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[PUAlbumListViewController initWithSpec:dataSourceManager:photoLibrary:]([PUAlbumListViewController alloc], "initWithSpec:dataSourceManager:photoLibrary:", v12, v10, v9);

  PULocalizedString(CFSTR("SHARED_TAB_ROOT_SHARED_ALBUM_LIST_TITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController setTitle:](v13, "setTitle:", v14);

  -[PUAlbumListViewController setSessionInfo:](v13, "setSessionInfo:", v11);
  return v13;
}

- (id)px_gridPresentation
{
  void *v3;
  void *v4;

  createGridPresentationWithViewController(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController sessionInfo](self, "sessionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionInfo:", v4);

  return v3;
}

@end
