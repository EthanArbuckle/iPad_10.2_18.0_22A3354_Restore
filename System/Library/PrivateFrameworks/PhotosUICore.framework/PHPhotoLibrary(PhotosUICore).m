@implementation PHPhotoLibrary(PhotosUICore)

- (void)px_unregisterChangeObserver:()PhotosUICore
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "px_changeDistributor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterChangeObserver:", v4);

}

- (void)px_registerChangeObserver:()PhotosUICore
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "px_changeDistributor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerChangeObserver:", v4);

}

- (PXPhotoLibraryChangeDistributor)px_changeDistributor
{
  id v1;
  PXPhotoLibraryChangeDistributor *v2;

  v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, &ChangeDistributorKey);
  v2 = (PXPhotoLibraryChangeDistributor *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = -[PXPhotoLibraryChangeDistributor initWithPhotoLibrary:]([PXPhotoLibraryChangeDistributor alloc], "initWithPhotoLibrary:", v1);
    objc_setAssociatedObject(v1, &ChangeDistributorKey, v2, (void *)0x301);
  }
  objc_sync_exit(v1);

  return v2;
}

+ (id)px_appPhotoLibrary
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  uint8_t v11[16];

  if (PFProcessIsLaunchedToExecuteTests() && PLIsSystemLibraryAccessProhibited())
  {
    objc_msgSend(a1, "px_appPhotoLibraryForTesting");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHPhotoLibrary+PhotosUICore.m"), 302, CFSTR("Tests that depend on photo library singletons must provide an 'px_appPhotoLibraryForTesting'"));

      abort();
    }
    return v4;
  }
  if (px_appPhotoLibrary_onceToken != -1)
    dispatch_once(&px_appPhotoLibrary_onceToken, &__block_literal_global_177766);
  if (px_appPhotoLibrary_appProvidesPhotoLibrary)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "px_photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    }
  }
  if ((objc_msgSend(MEMORY[0x1E0CD16F8], "isMultiLibraryModeEnabled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  PLPhotoKitGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_FAULT, "multi-library mode enabled, cannot provide the +sharedPhotoLibrary (may cause photos functionality to silently fail)", v11, 2u);
  }

  return 0;
}

- (id)px_beginPausingChangesWithTimeout:()PhotosUICore identifier:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "px_changeDistributor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginPausingChangesWithTimeout:identifier:", v6, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)px_endPausingChanges:()PhotosUICore
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "px_changeDistributor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endPausingChanges:", v4);

}

- (uint64_t)px_areChangesPaused
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "px_changeDistributor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "areChangesPaused");

  return v2;
}

- (id)px_virtualCollections
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, &UICollectionsKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = objc_initWeak(&location, v1);

    v4 = objc_alloc(MEMORY[0x1E0D73248]);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__PHPhotoLibrary_PhotosUICore__px_virtualCollections__block_invoke;
    v7[3] = &unk_1E513C6D0;
    objc_copyWeak(&v8, &location);
    v2 = (void *)objc_msgSend(v4, "initWithRetriableBlock:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    objc_setAssociatedObject(v1, &UICollectionsKey, v2, (void *)0x301);
  }
  objc_sync_exit(v1);

  objc_msgSend(v2, "objectValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)px_localDefaults
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, &DefaultsManagerKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = objc_initWeak(&location, v1);

    v4 = objc_alloc(MEMORY[0x1E0D73248]);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__PHPhotoLibrary_PhotosUICore__px_localDefaults__block_invoke;
    v7[3] = &unk_1E513C6D0;
    objc_copyWeak(&v8, &location);
    v2 = (void *)objc_msgSend(v4, "initWithRetriableBlock:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    objc_setAssociatedObject(v1, &DefaultsManagerKey, v2, (void *)0x301);
  }
  objc_sync_exit(v1);

  objc_msgSend(v2, "objectValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)px_peoplePetsHomeVisibility
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  id location;

  v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, &PeoplePetsHomeVisibilitySourceKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = objc_initWeak(&location, v1);

    v4 = objc_alloc(MEMORY[0x1E0D73248]);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__PHPhotoLibrary_PhotosUICore__px_peoplePetsHomeVisibility__block_invoke;
    v8[3] = &unk_1E513C6D0;
    objc_copyWeak(&v9, &location);
    v2 = (void *)objc_msgSend(v4, "initWithRetriableBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    objc_setAssociatedObject(v1, &PeoplePetsHomeVisibilitySourceKey, v2, (void *)0x301);
  }
  objc_sync_exit(v1);

  objc_msgSend(v2, "objectValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "visibility");

  return v6;
}

- (BOOL)px_fetchHasNoVisibleAssets
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "librarySpecificFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v1, "setShouldPrefetchCount:", 1);
  objc_msgSend(v1, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)px_fetchHasSignificantRegularAlbumCount
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  _BOOL8 v14;
  uint8_t buf[16];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D72470];
  v17[0] = *MEMORY[0x1E0D71FC8];
  v17[1] = v2;
  v17[2] = *MEMORY[0x1E0D724A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v4, "setFetchLimit:", 10);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("importedByBundleIdentifier in %@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalPredicate:", v5);

  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);
  v8 = v6;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HasSignificantRegularAlbumCount", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 1, 2, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_INTERVAL_END, v7, "HasSignificantRegularAlbumCount", ", buf, 2u);
  }

  v13 = objc_msgSend(v10, "count");
  v14 = v13 == objc_msgSend(v4, "fetchLimit");

  return v14;
}

- (BOOL)px_fetchHasSignificantSharedAlbumActivities
{
  void *v2;
  void *v3;
  unint64_t v4;
  _BOOL8 v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -7776000.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchLimit:", 6);
  v4 = +[PXSharedAlbumsActivityEntry fetchCountOfRecentFeedActivitiesWithOptions:newerThanDate:](PXSharedAlbumsActivityEntry, "fetchCountOfRecentFeedActivitiesWithOptions:newerThanDate:", v3, v2);
  v5 = v4 == objc_msgSend(v3, "fetchLimit");

  return v5;
}

- (id)px_fetchObjectsWithLocalIdentifiers:()PhotosUICore
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CD1698], "identifierCodeFromLocalIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "fetchTypeForLocalIdentifierCode:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(a1, "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsExclusivePredicate:", 1);
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CD1BB8]))
    {
      objc_msgSend(MEMORY[0x1E0CD1718], "queryForType:withIdentifiers:identifierKeyPath:options:", v7, v4, CFSTR("personUUID"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v7)
        goto LABEL_12;
      objc_msgSend(v9, "setIncludeGuestAssets:", 1);
      objc_msgSend(MEMORY[0x1E0CD1718], "queryForType:withIdentifiers:local:options:", v7, v4, 1, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "executeQuery");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
      goto LABEL_14;
    }
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CD1620], "emptyFetchResultWithPhotoLibrary:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v8;
}

- (id)px_fetchObjectWithLocalIdentifier:()PhotosUICore
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_fetchObjectsWithLocalIdentifiers:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)px_fetchAssetForSuggestionWithLocalIdentifier:()PhotosUICore
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  const char *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeGuestAssets:", 1);
  v6 = (void *)MEMORY[0x1E0CD13B8];
  v17[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetCollectionsWithLocalIdentifiers:options:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v9, v5);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject firstObject](v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v13 = 138412546;
      v14 = v4;
      v15 = 2080;
      v16 = "-[PHPhotoLibrary(PhotosUICore) px_fetchAssetForSuggestionWithLocalIdentifier:]";
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_FAULT, "Failed to fetch suggestion by localIdentifier: %@, %s", (uint8_t *)&v13, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)px_assetCollectionForSmartAlbumWithSubtype:()PhotosUICore
{
  void *v5;
  void *v6;
  void *v7;
  void *v10;

  if (a3 <= 200)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHPhotoLibrary+PhotosUICore.m"), 517, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subtype > PHAssetCollectionSubtypeSmartAlbumGeneric"));

  }
  objc_msgSend(a1, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludePlacesSmartAlbum:", a3 == 1000000203);
  objc_msgSend(v5, "setIncludeUserSmartAlbums:", a3 == 1000000204);
  objc_msgSend(v5, "setIncludeAllPhotosSmartAlbum:", a3 == 1000000205);
  objc_msgSend(v5, "setIncludeRecentlyEditedSmartAlbum:", a3 == 1000000206);
  objc_msgSend(v5, "setIncludeScreenRecordingsSmartAlbum:", a3 == 1000000207);
  objc_msgSend(v5, "setIncludeSharedLibrarySharingSuggestionsSmartAlbum:", a3 == 1000000214);
  objc_msgSend(v5, "setIncludeProResSmartAlbum:", a3 == 1000000211);
  objc_msgSend(v5, "setIncludeDuplicatesAlbums:", a3 == 1000000212);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)px_utilityCollectionWithType:()PhotosUICore
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalSortDescriptors:", v6);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchUtilityCollectionsWithType:options:", a3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)px_assetCollectionWithLocalIdentifier:()PhotosUICore
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludePlacesSmartAlbum:", 1);
  objc_msgSend(v5, "setIncludeDuplicatesAlbums:", 1);
  objc_msgSend(v5, "setIncludeUserSmartAlbums:", 1);
  objc_msgSend(v5, "setIncludeAllPhotosSmartAlbum:", 1);
  objc_msgSend(v5, "setIncludeRecentlyEditedSmartAlbum:", 1);
  objc_msgSend(v5, "setIncludeScreenRecordingsSmartAlbum:", 1);
  objc_msgSend(v5, "setIncludeSharedLibrarySharingSuggestionsSmartAlbum:", 1);
  objc_msgSend(v5, "setIncludeProResSmartAlbum:", 1);
  objc_msgSend(v5, "setIncludePendingMemories:", 1);
  objc_msgSend(v5, "setIncludeLocalMemories:", 1);
  objc_msgSend(v5, "setIncludeStoryMemories:", 1);
  v6 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fetchAssetCollectionsWithLocalIdentifiers:options:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)px_memoryWithLocalIdentifier:()PhotosUICore
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludePendingMemories:", 1);
  objc_msgSend(v5, "setIncludeLocalMemories:", 1);
  objc_msgSend(v5, "setIncludeStoryMemories:", 1);
  v6 = (void *)MEMORY[0x1E0CD1630];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fetchAssetCollectionsWithLocalIdentifiers:options:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)px_assetCollectionWithTransientIdentifier:()PhotosUICore
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[17];
  _QWORD v27[19];

  v27[17] = *MEMORY[0x1E0C80C00];
  v25 = a3;
  objc_msgSend(a1, "px_virtualCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = CFSTR("PXMomentsVirtualCollection");
  objc_msgSend(v4, "momentsCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v24;
  v26[1] = CFSTR("PXPhotosVirtualCollection");
  objc_msgSend(v4, "photosCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v23;
  v26[2] = CFSTR("PXPeopleVirtualCollection");
  objc_msgSend(v4, "peopleCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v22;
  v26[3] = CFSTR("PXTransientCollectionIdentifierMap");
  objc_msgSend(v4, "mapCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v21;
  v26[4] = CFSTR("PXTransientCollectionIdentifierFeatured");
  objc_msgSend(v4, "featuredCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v20;
  v26[5] = CFSTR("PXTransientCollectionIdentifierEvents");
  objc_msgSend(v4, "eventsCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v19;
  v26[6] = CFSTR("PXTransientCollectionIdentifierTrips");
  objc_msgSend(v4, "tripsCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v18;
  v26[7] = CFSTR("PXTransientCollectionIdentifierUtilities");
  objc_msgSend(v4, "utilitiesCollectionList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v17;
  v26[8] = CFSTR("PXMemoriesVirtualCollection");
  objc_msgSend(v4, "memoriesCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v16;
  v26[9] = CFSTR("PXCompleteMyMomentVirtualCollection");
  objc_msgSend(v4, "completeMyMomentCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v5;
  v26[10] = CFSTR("PXImportHistoryVirtualCollection");
  objc_msgSend(v4, "importHistoryCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v6;
  v26[11] = CFSTR("PXSharedActivityVirtualCollection");
  objc_msgSend(v4, "sharedActivityCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[11] = v7;
  v26[12] = CFSTR("PXContentSyndicationVirtualCollection");
  objc_msgSend(v4, "contentSyndicationCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[12] = v8;
  v26[13] = CFSTR("PXFeaturedPhotosVirtualCollection");
  objc_msgSend(v4, "featuredPhotosCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[13] = v9;
  v26[14] = CFSTR("PXRecentlyViewedVirtualCollection");
  objc_msgSend(v4, "recentlyViewedCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[14] = v10;
  v26[15] = CFSTR("PXRecentlyEditedVirtualCollection");
  objc_msgSend(v4, "recentlyEditedCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[15] = v11;
  v26[16] = CFSTR("PXRecentlySharedVirtualCollection");
  objc_msgSend(v4, "recentlySharedCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[16] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)px_collectionListWithTransientIdentifier:()PhotosUICore
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
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "px_virtualCollections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("PXMyAlbumsVirtualCollection");
  objc_msgSend(v5, "rootAlbumCollectionList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v14[1] = CFSTR("PXSharedAlbumsVirtualCollection");
  objc_msgSend(v5, "sharedAlbumsCollectionList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  v14[2] = CFSTR("PXSharedAlbumsAndActivityVirtualCollection");
  objc_msgSend(v5, "sharedAlbumsCollectionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  v14[3] = CFSTR("PXMediaTypesVirtualCollection");
  objc_msgSend(v5, "mediaTypesCollectionList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  v14[4] = CFSTR("PXTransientCollectionIdentifierUtilities");
  objc_msgSend(v5, "utilitiesCollectionList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)px_collectionListWithLocalIdentifier:()PhotosUICore
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CD14E0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fetchCollectionListsWithLocalIdentifiers:options:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)px_rootAlbumCollectionList
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v3 = a1;
  objc_sync_enter(v3);
  objc_getAssociatedObject(v3, sel_px_rootAlbumCollectionList);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_initWeak(&location, v3);

    v7 = objc_alloc(MEMORY[0x1E0D73248]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__PHPhotoLibrary_PhotosUICore__px_rootAlbumCollectionList__block_invoke;
    v12[3] = &unk_1E5131FC8;
    objc_copyWeak(&v14, &location);
    v8 = v5;
    v13 = v8;
    v4 = (void *)objc_msgSend(v7, "initWithRetriableBlock:", v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    objc_setAssociatedObject(v3, sel_px_rootAlbumCollectionList, v4, (void *)0x301);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("PHPhotoLibrary+PhotosUICore.m"), 626, CFSTR("Root Collection List not available"));

    }
  }
  objc_sync_exit(v3);

  objc_msgSend(v4, "objectValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)px_systemPhotoLibrary
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "px_deprecated_appPhotoLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "isSystemPhotoLibrary") & 1) == 0)
  {
    v1 = objc_alloc(MEMORY[0x1E0CD16F8]);
    objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURL");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v1, "initWithPhotoLibraryURL:", v2);

    v7 = 0;
    LOBYTE(v2) = objc_msgSend(v3, "openAndWaitWithUpgrade:error:", 0, &v7);
    v4 = v7;
    if ((v2 & 1) == 0)
    {
      PLUIGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v4;
        _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Unable to open photo library: %@", buf, 0xCu);
      }

    }
    v0 = v3;
  }
  return v0;
}

+ (id)px_appPhotoLibraryForTesting
{
  return objc_loadWeakRetained(&_appPhotoLibraryForTesting);
}

+ (void)px_setAppPhotoLibraryForTesting:()PhotosUICore
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHPhotoLibrary+PhotosUICore.m"), 343, CFSTR("The 'px_appPhotoLibraryForTesting' property is only available when testing"));

  }
  WeakRetained = objc_loadWeakRetained(&_appPhotoLibraryForTesting);

  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5)
  {
    if (WeakRetained)
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v9 = objc_loadWeakRetained(&_appPhotoLibraryForTesting);
      v15 = 138412290;
      v16 = v9;
      v10 = "Clear app photo library for testing: %@";
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v9 = objc_loadWeakRetained(&_appPhotoLibraryForTesting);
      v15 = 138412290;
      v16 = v9;
      v10 = "Clear app photo library for testing: %@ (none existing)";
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
    }
    v13 = 12;
    goto LABEL_15;
  }
  if (WeakRetained)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_loadWeakRetained(&_appPhotoLibraryForTesting);
      v15 = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v9;
      v10 = "Set app photo library for testing: %@ (nuking existing: %@)";
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 22;
LABEL_15:
      _os_log_impl(&dword_1A6789000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Set app photo library for testing: %@", (uint8_t *)&v15, 0xCu);
  }
LABEL_16:

  objc_storeWeak(&_appPhotoLibraryForTesting, v5);
}

+ (id)px_transientIdentifierForWellKnownAssetCollectionName:()PhotosUICore
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("import-history");
  v8[1] = CFSTR("shared-with-you");
  v9[0] = CFSTR("PXImportHistoryVirtualCollection");
  v9[1] = CFSTR("PXContentSyndicationVirtualCollection");
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
