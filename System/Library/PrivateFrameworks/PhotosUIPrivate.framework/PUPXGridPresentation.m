@implementation PUPXGridPresentation

- (PUPXGridPresentation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXGridPresentation.m"), 204, CFSTR("%s is not available as initializer"), "-[PUPXGridPresentation init]");

  abort();
}

- (PUPXGridPresentation)initWithUserInterfaceIdiom:(int64_t)a3
{
  PUPXGridPresentation *v4;
  uint64_t v5;
  PHPhotoLibrary *photoLibrary;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPXGridPresentation;
  v4 = -[PUPXGridPresentation init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v5 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v4->_photoLibrary;
    v4->_photoLibrary = (PHPhotoLibrary *)v5;

    v4->_userInterfaceIdiom = a3;
  }
  return v4;
}

- (BOOL)_isEmpty:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          if (*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i))
          {
            v10 = 0;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_12:

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)createViewControllerForAssetCollection:(id)a3
{
  return -[PUPXGridPresentation createViewControllerForAssetCollection:existingAssetsFetchResult:](self, "createViewControllerForAssetCollection:existingAssetsFetchResult:", a3, 0);
}

- (id)createViewControllerForAssetCollection:(id)a3 existingAssetsFetchResult:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "assetCollectionType") == 9)
  {
    -[PUPXGridPresentation createImportHistoryGridViewControllerWithCollection:](self, "createImportHistoryGridViewControllerWithCollection:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "px_isAllLibraryDuplicatesSmartAlbum"))
  {
    -[PUPXGridPresentation createDuplicatesGridViewControllerWithCollection:](self, "createDuplicatesGridViewControllerWithCollection:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend(v6, "px_isTransientPlacesCollection") & 1) != 0
         || objc_msgSend(v6, "px_isPlacesSmartAlbum"))
  {
    -[PUPXGridPresentation createPlacesViewControllerForAssetCollection:](self, "createPlacesViewControllerForAssetCollection:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "px_isPeopleVirtualCollection"))
    {
      objc_msgSend(MEMORY[0x1E0D7B668], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "peopleViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    if (objc_msgSend(v6, "px_isPanoramasSmartAlbum"))
      -[PUPXGridPresentation createPanoramaViewController](self, "createPanoramaViewController");
    else
      -[PUPXGridPresentation createPhotosAlbumViewControllerForAlbum:withFetchResult:](self, "createPhotosAlbumViewControllerForAlbum:withFetchResult:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_9:

  return v9;
}

- (id)createAlbumListViewControllerWithCollectionList:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", v4);
  if (objc_msgSend(v4, "px_isSharedAlbumsFolder"))
  {
    -[PUPXGridPresentation createSharedAlbumListViewControllerWithConfiguration:](self, "createSharedAlbumListViewControllerWithConfiguration:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "px_isTripsVirtualCollection"))
  {
    -[PUPXGridPresentation createTripsViewControllerForConfiguration:](self, "createTripsViewControllerForConfiguration:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "px_isTopLevelFolder"))
      objc_msgSend(v5, "setCollectionTypesToInclude:", 4983826);
    -[PUPXGridPresentation createAlbumListViewControllerWithConfiguration:](self, "createAlbumListViewControllerWithConfiguration:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)createTripsViewControllerForConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(MEMORY[0x1E0D7BB28]);
  v5 = objc_alloc(MEMORY[0x1E0D7BB30]);
  -[PUPXGridPresentation photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithPhotoLibrary:actionPerformer:", v6, v4);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B410]), "initWithConfiguration:", v7);
  return v8;
}

- (id)createAlbumListViewControllerWithConfiguration:(id)a3
{
  id v4;
  __objc2_class **v5;
  int64_t v6;
  id v7;
  PUAlbumListViewController *v8;
  void *v9;
  PUAlbumListViewController *v10;
  void *v11;
  void *v12;
  PUAlbumListViewController *v13;

  v4 = a3;
  if (-[PUPXGridPresentation userInterfaceIdiom](self, "userInterfaceIdiom") == 1)
  {
    v5 = off_1E5885730;
  }
  else
  {
    v6 = -[PUPXGridPresentation userInterfaceIdiom](self, "userInterfaceIdiom");
    v5 = off_1E5885720;
    if (v6 == 5)
      v5 = off_1E5885740;
  }
  v7 = objc_alloc_init(*v5);
  v8 = [PUAlbumListViewController alloc];
  -[PUPXGridPresentation photoLibrary](self, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUAlbumListViewController initWithSpec:photoLibrary:](v8, "initWithSpec:photoLibrary:", v7, v9);

  -[PUAlbumListViewController setDataSourceManagerConfiguration:](v10, "setDataSourceManagerConfiguration:", v4);
  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController setSessionInfo:](v10, "setSessionInfo:", v11);

  PULocalizedString(CFSTR("ALBUMS_TAB_ROOT_CONTROLLER_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController setTitle:](v10, "setTitle:", v12);

  v13 = v10;
  return v13;
}

- (id)createSharedAlbumListViewControllerWithConfiguration:(id)a3
{
  id v4;
  __objc2_class **v5;
  int64_t v6;
  id v7;
  PUAlbumListViewController *v8;
  void *v9;
  PUAlbumListViewController *v10;
  void *v11;
  void *v12;
  PUAlbumListViewController *v13;

  v4 = a3;
  if (-[PUPXGridPresentation userInterfaceIdiom](self, "userInterfaceIdiom") == 1)
  {
    v5 = off_1E5885730;
  }
  else
  {
    v6 = -[PUPXGridPresentation userInterfaceIdiom](self, "userInterfaceIdiom");
    v5 = off_1E5885720;
    if (v6 == 5)
      v5 = off_1E5885740;
  }
  v7 = objc_alloc_init(*v5);
  v8 = [PUAlbumListViewController alloc];
  -[PUPXGridPresentation photoLibrary](self, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUAlbumListViewController initWithSpec:photoLibrary:](v8, "initWithSpec:photoLibrary:", v7, v9);

  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController setSessionInfo:](v10, "setSessionInfo:", v11);

  -[PUAlbumListViewController setDataSourceManagerConfiguration:](v10, "setDataSourceManagerConfiguration:", v4);
  PULocalizedString(CFSTR("SHARED_TAB_ROOT_SHARED_ALBUM_LIST_TITLE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListViewController setTitle:](v10, "setTitle:", v12);

  v13 = v10;
  return v13;
}

- (id)createPlacesViewControllerForAssetCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B848]), "initWithConfiguration:", &__block_literal_global_56289);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B850]), "initWithPhotoLibrary:configuration:", v4, v5);
  objc_msgSend(v6, "fetchResultViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mapFetchResultsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preloadMap");
  objc_initWeak(&location, v8);
  dispatch_get_global_queue(25, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__PUPXGridPresentation_createPlacesViewControllerForAssetCollection___block_invoke_2;
  v13[3] = &unk_1E58AA2E0;
  v14 = v4;
  v15 = v3;
  v10 = v3;
  v11 = v4;
  objc_copyWeak(&v16, &location);
  dispatch_async(v9, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v6;
}

- (id)createPhotosAlbumViewControllerForAlbum:(id)a3 withFetchResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isForAssetPicker");

  if (v9)
  {
    -[PUPXGridPresentation createAssetPickerPhotosAlbumViewControllerForAlbum:](self, "createAssetPickerPhotosAlbumViewControllerForAlbum:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectionCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PXPhotosViewConfigurationForAssetCollectionWithExistingAssetsFetchResult();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setOneUpPresentationOrigin:", PXOneUpPresentationOriginForAssetCollection());
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B810]), "initWithConfiguration:", v13);

  }
  return v10;
}

- (id)createAssetPickerPhotosAlbumViewControllerForAlbum:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetsFilterPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reverseSortOrder");
  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allowsSwipeToSelect");
  PXPhotosViewConfigurationForImagePickerWithAssetCollection();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPXGridPresentation _customizePhotosViewConfiguationForAssetPicker:assetCollection:](self, "_customizePhotosViewConfiguationForAssetPicker:assetCollection:", v11, v4);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B810]), "initWithConfiguration:", v11);
  objc_msgSend(v4, "localizedTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setTitle:", v13);
  return v12;
}

- (id)createPanoramaViewController
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
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
  void *v19;
  void *v20;
  void *v21;

  -[PUPXGridPresentation photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isForAssetPicker");

  v6 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetCollectionsWithType:subtype:options:", 2, 201, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetsFilterPredicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reverseSortOrder");
    -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectionCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allowsSwipeToSelect");
    PXPhotosViewConfigurationForImagePickerWithAssetCollection();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPXGridPresentation _customizePhotosViewConfiguationForAssetPicker:assetCollection:](self, "_customizePhotosViewConfiguationForAssetPicker:assetCollection:", v17, v10);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B810]), "initWithConfiguration:", v17);
    objc_msgSend(v10, "localizedTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v19);

    v9 = v10;
  }
  else
  {

    -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "selectionCoordinator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PXPhotosViewConfigurationForAssetCollectionFetchResult();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setOneUpPresentationOrigin:", 8);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B810]), "initWithConfiguration:", v17);
  }

  return v18;
}

- (id)createImportHistoryGridViewControllerWithCollection:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
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
  void *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;

  v5 = a3;
  if (!objc_msgSend(v5, "canContainAssets"))
  {
    v21 = 0;
    goto LABEL_9;
  }
  v6 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXGridPresentation.m"), 404, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collection"), v27);
LABEL_12:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXGridPresentation.m"), 404, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collection"), v27, v29);

    goto LABEL_12;
  }
LABEL_4:
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReverseSortOrder:", objc_msgSend(v9, "reverseSortOrder"));

  objc_msgSend(MEMORY[0x1E0CD15D0], "fetchImportSessionsWithOptions:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isForAssetPicker");

  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "assetsFilterPredicate");
    v31 = v5;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reverseSortOrder");
    -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectionCoordinator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
    v32 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_WORD *)((char *)&v30 + 1) = objc_msgSend(v19, "allowsSwipeToSelect");
    LOBYTE(v30) = 0;
    PXPhotosViewConfigurationForImagePickerWithAssetCollectionFetchResult();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v31;
    -[PUPXGridPresentation _customizePhotosViewConfiguationForAssetPicker:assetCollection:](self, "_customizePhotosViewConfiguationForAssetPicker:assetCollection:", v20, v6, v30);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B810]), "initWithConfiguration:", v20);
    objc_msgSend(v6, "localizedTitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTitle:", v22);

    v8 = v32;
  }
  else
  {
    objc_msgSend(v13, "selectionCoordinator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PXPhotosViewConfigurationForAssetCollectionFetchResult();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setOneUpPresentationOrigin:", 10);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B810]), "initWithConfiguration:", v20);
  }

LABEL_9:
  return v21;
}

- (id)createDuplicatesGridViewControllerWithCollection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXGridPresentation.m"), 430, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collection"), v13);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXGridPresentation.m"), 430, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collection"), v13, v15);

    goto LABEL_6;
  }
LABEL_3:
  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXDeduplicationPhotosViewConfiguration();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B810]), "initWithConfiguration:", v8);
  return v9;
}

- (void)_customizePhotosViewConfiguationForAssetPicker:(id)a3 assetCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setStartsInSelectMode:", objc_msgSend(v7, "allowsMultipleSelection"));

  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWantsNumberedSelectionStyle:", objc_msgSend(v8, "wantsNumberedSelectionStyle"));

  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNoContentPlaceholderType:", objc_msgSend(v9, "noContentPlaceholderType"));

  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photosViewDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", v11);

  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "loadingStatusManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLoadingStatusManager:", v13);

  objc_msgSend(v18, "setOptionsController:", 0);
  objc_msgSend(v18, "setOneUpPresentationOrigin:", PXOneUpPresentationOriginForAssetCollection());
  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContentStartingPosition:", objc_msgSend(v14, "contentStartingPosition"));

  -[PUPXGridPresentation sessionInfo](self, "sessionInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pickerClientBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPickerClientBundleIdentifier:", v16);

  if ((objc_msgSend(v6, "px_isImportHistoryCollection") & 1) != 0)
  {
    v17 = 2;
  }
  else if (objc_msgSend(v6, "px_isAllLibraryDuplicatesSmartAlbum"))
  {
    v17 = 4;
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v18, "setSectionHeaderStyle:", v17);

}

- (PUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInfo, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
}

void __69__PUPXGridPresentation_createPlacesViewControllerForAssetCollection___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B970], "sharedLibraryStatusProviderWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B578]), "initWithSharedLibraryStatusProvider:", v3);
  objc_msgSend(v2, "setSharingFilter:", objc_msgSend(v4, "sharingFilter"));
  objc_msgSend(MEMORY[0x1E0CD1390], "px_fetchPlacesAssetsInAssetCollection:options:", *(_QWORD *)(a1 + 40), v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PUPXGridPresentation_createPlacesViewControllerForAssetCollection___block_invoke_3;
  v8[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v9, v6);
  objc_msgSend(WeakRetained, "loadFetchResult:withCompletion:", v5, v8);

  objc_destroyWeak(&v9);
}

void __69__PUPXGridPresentation_createPlacesViewControllerForAssetCollection___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadContentModeWithCompletion:", 0);

}

uint64_t __69__PUPXGridPresentation_createPlacesViewControllerForAssetCollection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGridViewEnabled:", 1);
}

@end
