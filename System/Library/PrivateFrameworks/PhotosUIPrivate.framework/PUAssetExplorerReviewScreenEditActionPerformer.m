@implementation PUAssetExplorerReviewScreenEditActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "mediaType");
  v6 = objc_msgSend(v4, "mediaSubtypes");

  if (v5 == 1)
  {
    v7 = (v6 >> 10) & 1;
    return v7 ^ 1;
  }
  if (v5 == 2)
  {
    LOBYTE(v7) = 0;
    return v7 ^ 1;
  }
  return 0;
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4;
  char v5;
  char v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "isTemporaryPlaceholder");
  v6 = objc_msgSend(v4, "isAnimatedImage");

  return (v5 | v6) ^ 1;
}

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[PUAssetExplorerReviewScreenActionPerformer executePerformUserInteractionTaskBlock](self, "executePerformUserInteractionTaskBlock");
  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenEditActionPerformer.m"), 50, CFSTR("There can be only one asset in an edit action"));

  }
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenEditActionPerformer reviewAssetProvider](self, "reviewAssetProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__PUAssetExplorerReviewScreenEditActionPerformer_performUserInteractionTask__block_invoke;
  v8[3] = &unk_1E589CD08;
  v8[4] = self;
  -[PUAssetExplorerReviewScreenActionPerformer requestReviewAssetForDisplayAsset:reviewAssetProvider:completionHandler:](self, "requestReviewAssetForDisplayAsset:reviewAssetProvider:completionHandler:", v5, v6, v8);

}

- (void)_presentEditViewControllerForReviewAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PUReviewAssetsMediaProvider *v7;
  PUReviewAssetsMediaDestination *v8;
  unint64_t v9;
  PUPhotoEditViewController *v10;
  void *v11;
  _BOOL8 v12;
  PUAssetExplorerReviewScreenEditActionPerformer *v13;
  PUPhotoEditViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUReviewAsset createUniqueMediaDirectoryForAssetWithIdentifier:](PUReviewAsset, "createUniqueMediaDirectoryForAssetWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(PUReviewAssetsMediaProvider);
  v8 = -[PUReviewAssetsMediaDestination initWithOutputDirectory:mediaProvider:]([PUReviewAssetsMediaDestination alloc], "initWithOutputDirectory:mediaProvider:", v6, v7);
  v9 = objc_msgSend(v4, "playbackStyle");
  if (v9 <= 5 && ((1 << v9) & 0x3A) != 0)
  {
    v10 = -[PUPhotoEditViewController initWithPhoto:mediaProvider:mediaDestination:]([PUPhotoEditViewController alloc], "initWithPhoto:mediaProvider:mediaDestination:", v4, v7, v8);
    -[PUAssetExplorerReviewScreenEditActionPerformer photoDelegate](self, "photoDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditViewController setSessionDelegate:](v10, "setSessionDelegate:", v11);

    v12 = -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v10);
    v13 = self;
    v14 = 0;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid playback style for editing: %lu"), v9, *MEMORY[0x1E0CB2D50]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PUAssetExplorerReviewScreen"), -1, v17);
    v10 = (PUPhotoEditViewController *)objc_claimAutoreleasedReturnValue();

    v13 = self;
    v12 = 0;
    v14 = v10;
  }
  -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](v13, "completeUserInteractionTaskWithSuccess:error:", v12, v14);

}

- (PUReviewAssetProvider)reviewAssetProvider
{
  return self->_reviewAssetProvider;
}

- (void)setReviewAssetProvider:(id)a3
{
  objc_storeStrong((id *)&self->_reviewAssetProvider, a3);
}

- (PUPhotoEditViewControllerSessionDelegate)photoDelegate
{
  return (PUPhotoEditViewControllerSessionDelegate *)objc_loadWeakRetained((id *)&self->_photoDelegate);
}

- (void)setPhotoDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_photoDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoDelegate);
  objc_storeStrong((id *)&self->_reviewAssetProvider, 0);
}

uint64_t __76__PUAssetExplorerReviewScreenEditActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;

  v5 = *(void **)(a1 + 32);
  if (a5)
    return objc_msgSend(v5, "_presentEditViewControllerForReviewAsset:", a5);
  else
    return objc_msgSend(v5, "completeUserInteractionTaskWithSuccess:error:", 0);
}

@end
