@implementation PUAssetExplorerReviewScreenFunEffectsActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return +[PUAssetExplorerReviewScreenEditActionPerformer canPerformOnAsset:inAssetCollection:](PUAssetExplorerReviewScreenEditActionPerformer, "canPerformOnAsset:inAssetCollection:", a3, a4);
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return +[PUAssetExplorerReviewScreenEditActionPerformer shouldEnableOnAsset:inAssetCollection:](PUAssetExplorerReviewScreenEditActionPerformer, "shouldEnableOnAsset:inAssetCollection:", a3, a4);
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenFunEffectsActionPerformer.m"), 35, CFSTR("There can be only one asset in a fun effects action"));

  }
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenFunEffectsActionPerformer reviewAssetProvider](self, "reviewAssetProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__PUAssetExplorerReviewScreenFunEffectsActionPerformer_performUserInteractionTask__block_invoke;
  v8[3] = &unk_1E589CD08;
  v8[4] = self;
  -[PUAssetExplorerReviewScreenActionPerformer requestReviewAssetForDisplayAsset:reviewAssetProvider:completionHandler:](self, "requestReviewAssetForDisplayAsset:reviewAssetProvider:completionHandler:", v5, v6, v8);

}

- (void)_presentFunEffectsViewControllerForAsset:(id)a3
{
  id v4;
  PUFunEffectsViewController *v5;
  void *v6;
  void *v7;
  PUReviewAssetsMediaProvider *v8;

  v4 = a3;
  v8 = objc_alloc_init(PUReviewAssetsMediaProvider);
  v5 = -[PUFunEffectsViewController initWithReviewAsset:mediaProvider:]([PUFunEffectsViewController alloc], "initWithReviewAsset:mediaProvider:", v4, v8);

  -[PUAssetExplorerReviewScreenFunEffectsActionPerformer funEffectsObserver](self, "funEffectsObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFunEffectsViewController registerObserver:](v5, "registerObserver:", v6);

  -[PUAssetExplorerReviewScreenFunEffectsActionPerformer reviewBarsModel](self, "reviewBarsModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFunEffectsViewController setReviewBarsModel:](v5, "setReviewBarsModel:", v7);

  -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v5), 0);
}

- (PUReviewAssetProvider)reviewAssetProvider
{
  return self->_reviewAssetProvider;
}

- (void)setReviewAssetProvider:(id)a3
{
  objc_storeStrong((id *)&self->_reviewAssetProvider, a3);
}

- (PUFunEffectsViewControllerObserver)funEffectsObserver
{
  return (PUFunEffectsViewControllerObserver *)objc_loadWeakRetained((id *)&self->_funEffectsObserver);
}

- (void)setFunEffectsObserver:(id)a3
{
  objc_storeWeak((id *)&self->_funEffectsObserver, a3);
}

- (PUReviewScreenBarsModel)reviewBarsModel
{
  return self->_reviewBarsModel;
}

- (void)setReviewBarsModel:(id)a3
{
  objc_storeStrong((id *)&self->_reviewBarsModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewBarsModel, 0);
  objc_destroyWeak((id *)&self->_funEffectsObserver);
  objc_storeStrong((id *)&self->_reviewAssetProvider, 0);
}

uint64_t __82__PUAssetExplorerReviewScreenFunEffectsActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;

  v5 = *(void **)(a1 + 32);
  if (a5)
    return objc_msgSend(v5, "_presentFunEffectsViewControllerForAsset:", a5);
  else
    return objc_msgSend(v5, "completeUserInteractionTaskWithSuccess:error:", 0);
}

@end
