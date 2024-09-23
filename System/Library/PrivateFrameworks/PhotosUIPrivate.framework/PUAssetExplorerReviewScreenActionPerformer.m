@implementation PUAssetExplorerReviewScreenActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 0;
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return 1;
}

- (void)setPerformUserInteractionTaskBlock:(id)a3
{
  void *v5;
  void *v6;
  id performUserInteractionTaskBlock;
  void *v8;
  id v9;

  v9 = a3;
  if (-[PUAssetActionPerformer state](self, "state"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenActionPerformer.m"), 35, CFSTR("Can only set performUserInteractionTaskBlock when in ready state"));

  }
  v5 = v9;
  if (self->_performUserInteractionTaskBlock != v9)
  {
    v6 = (void *)objc_msgSend(v9, "copy");
    performUserInteractionTaskBlock = self->_performUserInteractionTaskBlock;
    self->_performUserInteractionTaskBlock = v6;

    v5 = v9;
  }

}

- (void)performUserInteractionTask
{
  -[PUAssetExplorerReviewScreenActionPerformer executePerformUserInteractionTaskBlock](self, "executePerformUserInteractionTaskBlock");
  -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

- (void)executePerformUserInteractionTaskBlock
{
  void (**performUserInteractionTaskBlock)(void);
  id v5;
  void *v6;

  if (-[PUAssetActionPerformer state](self, "state") != 10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenActionPerformer.m"), 51, CFSTR("Should only execute performUserInteractionTaskBlock when in user interaction state"));

  }
  performUserInteractionTaskBlock = (void (**)(void))self->_performUserInteractionTaskBlock;
  if (performUserInteractionTaskBlock)
  {
    performUserInteractionTaskBlock[2]();
    v5 = self->_performUserInteractionTaskBlock;
    self->_performUserInteractionTaskBlock = 0;

  }
}

- (void)requestReviewAssetForDisplayAsset:(id)a3 reviewAssetProvider:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, id))v10 + 2))(v10, 1, 0, 0, v8);
  }
  else
  {
    objc_msgSend(v9, "reviewAssetProviderRequestForDisplayAsset:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "progress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAssetExplorerReviewScreenActionPerformer _setupProgressControllerForProgress:](self, "_setupProgressControllerForProgress:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "showAnimated:allowDelay:", 1, 1);
      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __118__PUAssetExplorerReviewScreenActionPerformer_requestReviewAssetForDisplayAsset_reviewAssetProvider_completionHandler___block_invoke;
      v15[3] = &unk_1E589CC98;
      objc_copyWeak(&v17, &location);
      v16 = v10;
      objc_msgSend(v12, "requestReviewAssetWithCompletionHandler:", v15);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);

    }
    else
    {
      -[PUAssetExplorerReviewScreenActionPerformer _showFailedReviewAssetRequestAlert](self, "_showFailedReviewAssetRequestAlert");
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0, 0);
    }

  }
}

- (void)_handleReviewAssetRequestCompletedWithSuccess:(BOOL)a3 canceled:(BOOL)a4 error:(id)a5 reviewAsset:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  void *v13;
  id v14;

  v9 = a4;
  v14 = a5;
  v11 = a6;
  v12 = a7;
  -[PUAssetExplorerReviewScreenActionPerformer _requestProgressController](self, "_requestProgressController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hideAnimated:allowDelay:", 1, 0);
  -[PUAssetExplorerReviewScreenActionPerformer _setRequestProgressController:](self, "_setRequestProgressController:", 0);
  if (v11)
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, id))v12 + 2))(v12, 1, 0, 0, v11);
  }
  else
  {
    if (!v9)
      -[PUAssetExplorerReviewScreenActionPerformer _showFailedReviewAssetRequestAlert](self, "_showFailedReviewAssetRequestAlert");
    (*((void (**)(id, _QWORD, _BOOL8, id, _QWORD))v12 + 2))(v12, 0, v9, v14, 0);
  }

}

- (id)_setupProgressControllerForProgress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id from;
  id location;

  v4 = a3;
  PULocalizedString(CFSTR("REVIEW_DOWNLOADING_ASSETS_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0D7B158]);
  objc_msgSend(v6, "setTitle:", v5);
  objc_msgSend(v6, "setProgress:", v4);
  -[PUAssetExplorerReviewScreenActionPerformer _setRequestProgressController:](self, "_setRequestProgressController:", v6);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__PUAssetExplorerReviewScreenActionPerformer__setupProgressControllerForProgress___block_invoke;
  v8[3] = &unk_1E589EBC8;
  objc_copyWeak(&v9, &location);
  objc_copyWeak(&v10, &from);
  objc_msgSend(v6, "setCancellationHandler:", v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v6;
}

- (void)_handleProgressControllerCanceled:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PUAssetExplorerReviewScreenActionPerformer _requestProgressController](self, "_requestProgressController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v5 != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetExplorerReviewScreenActionPerformer.m"), 144, CFSTR("Not expecting multiple progress controllers"));

    v6 = v9;
  }
  objc_msgSend(v6, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

}

- (void)_showFailedReviewAssetRequestAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PUAssetActionPerformer presentedViewController](self, "presentedViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PULocalizedString(CFSTR("OK"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("REVIEW_DOWNLOADING_ASSETS_ERROR_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("REVIEW_DOWNLOADING_ASSETS_ERROR_MESSAGE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v3, 0, &__block_literal_global_11618);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v7);

    -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v6);
  }

}

- (id)performUserInteractionTaskBlock
{
  return self->_performUserInteractionTaskBlock;
}

- (PXActivityProgressController)_requestProgressController
{
  return self->__requestProgressController;
}

- (void)_setRequestProgressController:(id)a3
{
  objc_storeStrong((id *)&self->__requestProgressController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__requestProgressController, 0);
  objc_storeStrong(&self->_performUserInteractionTaskBlock, 0);
}

void __82__PUAssetExplorerReviewScreenActionPerformer__setupProgressControllerForProgress___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleProgressControllerCanceled:", v2);

}

void __118__PUAssetExplorerReviewScreenActionPerformer_requestReviewAssetForDisplayAsset_reviewAssetProvider_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id *v9;
  id v10;
  id v11;
  id WeakRetained;

  v9 = (id *)(a1 + 40);
  v10 = a5;
  v11 = a4;
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "_handleReviewAssetRequestCompletedWithSuccess:canceled:error:reviewAsset:completionHandler:", a2, a3, v11, v10, *(_QWORD *)(a1 + 32));

}

@end
