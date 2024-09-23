@implementation PUDuplicatesStorageTipViewController

- (id)photosViewConfigurationWithShouldExpunge:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PUStorageManagementBaseController photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000212);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PXDeduplicationPhotosViewConfiguration();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  StorageTipPXPhotosViewConfigurationForConfiguration(v7, a3);
  objc_claimAutoreleasedReturnValue();

  -[PUDuplicatesStorageTipViewController title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v8);

  objc_msgSend(v7, "setIgnoreFilterPredicateAssert:", 1);
  objc_msgSend(v7, "dataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performChanges:", &__block_literal_global_69011);

  return v7;
}

- (id)title
{
  return PULocalizedString(CFSTR("STORAGE_MANAGEMENT_REVIEW_DUPLICATES_ALBUM_TITLE"));
}

void __81__PUDuplicatesStorageTipViewController_photosViewConfigurationWithShouldExpunge___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[PUStorageManagementUtility predicateForUploadedAssetFetch](PUStorageManagementUtility, "predicateForUploadedAssetFetch");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFilterPredicate:", v3);

}

@end
