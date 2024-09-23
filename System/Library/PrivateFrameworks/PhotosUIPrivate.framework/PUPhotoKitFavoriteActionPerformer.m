@implementation PUPhotoKitFavoriteActionPerformer

- (void)performBackgroundTask
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[PUPhotoKitFavoriteActionPerformer favorite](self, "favorite");
  if (!v3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[PUAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v10, "assetCollectionType") == 2 && objc_msgSend(v10, "assetCollectionSubtype") == 203)
          {

            -[PUPhotoKitActionPerformer forceIncludeAssetsInDataSource](self, "forceIncludeAssetsInDataSource");
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
LABEL_13:
  v11 = objc_alloc(MEMORY[0x1E0D7B3C8]);
  -[PUAssetActionPerformer assets](self, "assets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithAssets:favorite:", v12, v3);

  -[PUAssetActionPerformer undoManager](self, "undoManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__PUPhotoKitFavoriteActionPerformer_performBackgroundTask__block_invoke;
  v15[3] = &unk_1E58A5270;
  v15[4] = self;
  v16 = v3;
  objc_msgSend(v13, "executeWithUndoManager:completionHandler:", v14, v15);

}

- (void)_logEventForAssets:(id)a3 favorite:(BOOL)a4
{
  void **v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (void **)MEMORY[0x1E0D096E0];
    if (!a4)
      v5 = (void **)MEMORY[0x1E0D096E8];
    v6 = *v5;
    v7 = (void *)MEMORY[0x1E0D09910];
    v8 = *MEMORY[0x1E0D09828];
    v16[0] = a3;
    v9 = *MEMORY[0x1E0D09830];
    v15[0] = v8;
    v15[1] = v9;
    v10 = v6;
    v11 = a3;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendEvent:withPayload:", v10, v14);

  }
}

- (BOOL)favorite
{
  return self->_favorite;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

void __58__PUPhotoKitFavoriteActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((_DWORD)a2)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "assets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_logEventForAssets:favorite:", v6, *(unsigned __int8 *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, v7);

}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(MEMORY[0x1E0D7B3C8], "canPerformOnAsset:inAssetCollection:", a3, a4);
}

@end
