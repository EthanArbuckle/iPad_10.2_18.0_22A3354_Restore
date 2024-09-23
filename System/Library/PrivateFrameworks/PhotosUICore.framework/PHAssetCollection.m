@implementation PHAssetCollection

uint64_t __90__PHAssetCollection_PhotosUICore__px_fetchAssetCollectionsWithAlbumSubtypes_photoLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

void __57__PHAssetCollection_PhotosUICore__px_otherAlbumsSubtypes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = (void *)px_otherAlbumsSubtypes_subtypes;
  px_otherAlbumsSubtypes_subtypes = (uint64_t)&unk_1E53EA950;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(&unk_1E53EA968, "arrayByAddingObjectsFromArray:", px_otherAlbumsSubtypes_subtypes);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)px_otherAlbumsSubtypes_subtypes;
    px_otherAlbumsSubtypes_subtypes = v1;

  }
  objc_msgSend(&unk_1E53EA980, "arrayByAddingObjectsFromArray:", px_otherAlbumsSubtypes_subtypes);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)px_otherAlbumsSubtypes_subtypes;
  px_otherAlbumsSubtypes_subtypes = v3;

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableRecentlyEditedAlbum");

  if (v6)
  {
    objc_msgSend(&unk_1E53EA998, "arrayByAddingObjectsFromArray:", px_otherAlbumsSubtypes_subtypes);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)px_otherAlbumsSubtypes_subtypes;
    px_otherAlbumsSubtypes_subtypes = v7;

  }
  PLUserSmartAlbumGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = (id)objc_opt_class();
    v13 = 2112;
    v14 = px_otherAlbumsSubtypes_subtypes;
    v10 = v12;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@> Other Albums Subtypes to Fetch: %@", (uint8_t *)&v11, 0x16u);

  }
}

void __65__PHAssetCollection_PhotosUICore__px_mediaTypeSmartAlbumSubtypes__block_invoke()
{
  void *v0;
  NSObject *v1;
  id v2;
  int v3;
  id v4;
  __int16 v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = (void *)px_mediaTypeSmartAlbumSubtypes_subtypes;
  px_mediaTypeSmartAlbumSubtypes_subtypes = (uint64_t)&unk_1E53EA938;

  PLUserSmartAlbumGetLog();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138543618;
    v4 = (id)objc_opt_class();
    v5 = 2112;
    v6 = &unk_1E53EA938;
    v2 = v4;
    _os_log_impl(&dword_1A6789000, v1, OS_LOG_TYPE_DEFAULT, "<%{public}@> Media Smart Albums Subtypes to Fetch: %@", (uint8_t *)&v3, 0x16u);

  }
}

void __70__PHAssetCollection_PhotosUICore__px_albumNameForTransientIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PXPhotosVirtualCollection");
  v2[1] = CFSTR("PXTransientCollectionIdentifierEvents");
  v3[0] = CFSTR("library");
  v3[1] = CFSTR("event");
  v2[2] = CFSTR("PXMemoriesVirtualCollection");
  v2[3] = CFSTR("PXTransientCollectionIdentifierTrips");
  v3[2] = CFSTR("memory");
  v3[3] = CFSTR("trip");
  v2[4] = CFSTR("PXPeopleVirtualCollection");
  v2[5] = CFSTR("PXCompleteMyMomentVirtualCollection");
  v3[4] = CFSTR("people");
  v3[5] = CFSTR("icloud-links");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)px_albumNameForTransientIdentifier__albumNames;
  px_albumNameForTransientIdentifier__albumNames = v0;

}

@end
