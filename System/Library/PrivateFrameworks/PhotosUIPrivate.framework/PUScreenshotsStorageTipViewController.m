@implementation PUScreenshotsStorageTipViewController

- (id)photosViewConfigurationWithShouldExpunge:(BOOL)a3
{
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

  -[PUStorageManagementBaseController photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_assetCollectionForSmartAlbumWithSubtype:", 211);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUStorageManagementBaseController photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUStorageManagementUtility storageTipAssetFetchOptionsForType:photoLibrary:](PUStorageManagementUtility, "storageTipAssetFetchOptionsForType:photoLibrary:", 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CD13B8];
  objc_msgSend(v6, "localizedTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transientAssetCollectionWithAssetFetchResult:title:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  PXPhotosViewConfigurationForAssetCollection();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  StorageTipPXPhotosViewConfigurationForConfiguration(v13, a3);
  objc_claimAutoreleasedReturnValue();

  -[PUScreenshotsStorageTipViewController title](self, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v14);

  return v13;
}

- (id)title
{
  return PULocalizedString(CFSTR("STORAGE_MANAGEMENT_REVIEW_SCREENSHOTS_ALBUM_TITLE"));
}

@end
