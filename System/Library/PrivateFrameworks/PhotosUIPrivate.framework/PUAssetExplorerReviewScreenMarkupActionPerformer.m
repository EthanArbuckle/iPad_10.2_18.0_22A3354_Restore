@implementation PUAssetExplorerReviewScreenMarkupActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return (unint64_t)(objc_msgSend(a3, "mediaType") - 1) < 2;
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  BOOL v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "isTemporaryPlaceholder");
  v6 = objc_msgSend(v4, "isAnimatedImage");
  v7 = objc_msgSend(v4, "playbackStyle");
  v8 = objc_msgSend(v4, "mediaType");
  v9 = objc_msgSend(v4, "mediaSubtypes");

  v11 = (v9 & 0x400) == 0 && v8 != 2;
  if (v7 == 5)
    v11 = 0;
  if ((v6 & 1) != 0)
    v11 = 0;
  return (v5 & 1) == 0 && v11;
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenMarkupActionPerformer.m"), 51, CFSTR("There can be only one asset in a markup action"));

  }
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenMarkupActionPerformer reviewAssetProvider](self, "reviewAssetProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke;
  v8[3] = &unk_1E589CD08;
  v8[4] = self;
  -[PUAssetExplorerReviewScreenActionPerformer requestReviewAssetForDisplayAsset:reviewAssetProvider:completionHandler:](self, "requestReviewAssetForDisplayAsset:reviewAssetProvider:completionHandler:", v5, v6, v8);

}

- (void)_presentMarkupViewControllerForReviewAsset:(id)a3
{
  id v4;
  PUPhotoMarkupViewController *v5;
  void *v6;
  PUReviewAssetsMediaProvider *v7;

  v4 = a3;
  v7 = objc_alloc_init(PUReviewAssetsMediaProvider);
  v5 = -[PUPhotoMarkupViewController initWithReviewAsset:mediaProvider:]([PUPhotoMarkupViewController alloc], "initWithReviewAsset:mediaProvider:", v4, v7);

  -[PUPhotoMarkupViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 0);
  -[PUAssetExplorerReviewScreenMarkupActionPerformer markupObserver](self, "markupObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[PUPhotoMarkupViewController registerObserver:](v5, "registerObserver:", v6);
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

- (PUPhotoMarkupViewControllerObserver)markupObserver
{
  return (PUPhotoMarkupViewControllerObserver *)objc_loadWeakRetained((id *)&self->_markupObserver);
}

- (void)setMarkupObserver:(id)a3
{
  objc_storeWeak((id *)&self->_markupObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_markupObserver);
  objc_storeStrong((id *)&self->_reviewAssetProvider, 0);
}

void __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  _QWORD v38[5];
  id v39;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "isSpatialMedia"))
    {
      v10 = (void *)MEMORY[0x1E0DC3450];
      PULocalizedString(CFSTR("MARKUP_DISABLES_SPATIAL_PHOTO_TITLE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(CFSTR("PLUGIN_DISABLES_SPATIAL_PHOTO_MESSAGE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0DC3448];
      PULocalizedString(CFSTR("OK"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_2;
      v38[3] = &unk_1E58A4748;
      v38[4] = *(_QWORD *)(a1 + 32);
      v39 = v9;
      objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v38);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAction:", v17);

      v18 = (void *)MEMORY[0x1E0DC3448];
      PULocalizedString(CFSTR("CANCEL"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v16;
      v37[1] = 3221225472;
      v37[2] = __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_3;
      v37[3] = &unk_1E58A8DE8;
      v37[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, v37);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAction:", v20);

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "assetActionPerformer:presentViewController:", *(_QWORD *)(a1 + 32), v13);

      v22 = v39;
LABEL_8:

      goto LABEL_9;
    }
    if ((objc_msgSend(v9, "mediaSubtypes") & 8) != 0)
    {
      v23 = (void *)MEMORY[0x1E0DC3450];
      PULocalizedString(CFSTR("MARKUP_DISABLES_LIVE_PHOTO_TITLE"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(CFSTR("PLUGIN_DISABLES_LIVE_PHOTO_MESSAGE"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "alertControllerWithTitle:message:preferredStyle:", v24, v25, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (void *)MEMORY[0x1E0DC3448];
      PULocalizedString(CFSTR("OK"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_4;
      v35[3] = &unk_1E58A4748;
      v35[4] = *(_QWORD *)(a1 + 32);
      v36 = v9;
      objc_msgSend(v26, "actionWithTitle:style:handler:", v27, 0, v35);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAction:", v29);

      v30 = (void *)MEMORY[0x1E0DC3448];
      PULocalizedString(CFSTR("CANCEL"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v28;
      v34[1] = 3221225472;
      v34[2] = __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_5;
      v34[3] = &unk_1E58A8DE8;
      v34[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v30, "actionWithTitle:style:handler:", v31, 1, v34);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAction:", v32);

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "assetActionPerformer:presentViewController:", *(_QWORD *)(a1 + 32), v13);

      v22 = v36;
      goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 32), "_presentMarkupViewControllerForReviewAsset:", v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, v7);
  }
LABEL_9:

}

uint64_t __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentMarkupViewControllerForReviewAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

uint64_t __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentMarkupViewControllerForReviewAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __78__PUAssetExplorerReviewScreenMarkupActionPerformer_performUserInteractionTask__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

@end
