@implementation PUPhotoKitActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 0;
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

- (void)instantlyExcludeAssetsFromDataSource
{
  void *v3;
  id v4;

  -[PUPhotoKitActionPerformer photosDataSource](self, "photosDataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoKitActionPerformer _indexPathsInPhotosDataSource:](self, "_indexPathsInPhotosDataSource:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceExcludeAssetsAtIndexPaths:", v3);

}

- (void)stopExcludingAssetsFromDataSource
{
  void *v3;
  id v4;

  -[PUPhotoKitActionPerformer photosDataSource](self, "photosDataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopExcludingAssets:", v3);

}

- (void)forceIncludeAssetsInDataSource
{
  void *v3;
  id v4;

  -[PUPhotoKitActionPerformer photosDataSource](self, "photosDataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoKitActionPerformer _indexPathsInPhotosDataSource:](self, "_indexPathsInPhotosDataSource:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceIncludeAssetsAtIndexPaths:", v3);

}

- (id)_indexPathsInPhotosDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[PUAssetActionPerformer assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__PUPhotoKitActionPerformer__indexPathsInPhotosDataSource___block_invoke;
  v14[3] = &unk_1E58A51A8;
  v15 = v4;
  v9 = v7;
  v16 = v9;
  v10 = v4;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (void)setPhotosDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_photosDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosDataSource, 0);
}

void __59__PUPhotoKitActionPerformer__indexPathsInPhotosDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "indexPathForAsset:hintIndexPath:hintCollection:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), 0, v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

@end
