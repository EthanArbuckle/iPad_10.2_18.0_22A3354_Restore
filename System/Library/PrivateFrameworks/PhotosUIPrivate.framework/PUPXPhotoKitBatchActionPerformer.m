@implementation PUPXPhotoKitBatchActionPerformer

+ (BOOL)canPerformBatchOnAsset:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isBusyWithBatchAction") & 1) != 0
    || !objc_msgSend(v3, "canPerformEditOperation:", 2))
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E0D7CB58], "canPerformEditOnAsset:", v3);
  }

  return v5;
}

+ (id)newEditActionForPerformer:(id)a3 class:(Class)a4 assets:(id)a5 prepareAction:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *);
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD aBlock[4];
  id v36;
  uint8_t buf[4];
  Class v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v12 = +[PUPXPhotoKitBatchActionPerformer newProgressToastForAction:assets:](PUPXPhotoKitBatchActionPerformer, "newProgressToastForAction:assets:", v9, v10);
    if (v12)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D7CD28], "defaultManager");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v30 = v9;
    v15 = +[PUPXPhotoKitBatchActionPerformer newActivityProgressAlertForAction:assets:](PUPXPhotoKitBatchActionPerformer, "newActivityProgressAlertForAction:assets:", v9, v10);
    objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__PUPXPhotoKitBatchActionPerformer_newEditActionForPerformer_class_assets_prepareAction___block_invoke;
    aBlock[3] = &unk_1E58ABD10;
    v28 = v16;
    v36 = v28;
    v17 = _Block_copy(aBlock);
    objc_msgSend(v12, "setCloseButtonAction:", v17);
    objc_msgSend(v15, "setCancellationHandler:", v17);
    v18 = [a4 alloc];
    objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "progress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "progress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v18, "initWithPresetManager:syncProgress:asyncProgress:asyncLoadingStatusManager:forAssets:", v19, v20, v21, v13, v10);

    if (v11)
      v11[2](v11, v14);
    objc_msgSend(v14, "localizedProgressToastSuccessTitle", v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowSynchronousRendering:", objc_msgSend(v23, "allowSynchronousBatchRendering"));

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __89__PUPXPhotoKitBatchActionPerformer_newEditActionForPerformer_class_assets_prepareAction___block_invoke_2;
    v31[3] = &unk_1E58A6420;
    v32 = v15;
    v33 = v12;
    v34 = v22;
    v24 = v22;
    v25 = v12;
    v26 = v15;
    objc_msgSend(v14, "setCompletionHandler:", v31);

    v9 = v30;
  }
  else
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v38 = a4;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, "Invalid class parameter for [PUPXPhotoKitPasteAdjustmentsActionPerformer newEditActionForPerformer:class:assets:] :%@", buf, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

+ (id)newProgressToastForAction:(id)a3 assets:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  double v15;
  void *v16;
  double v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
    v10 = 0;
LABEL_8:
    v22 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionPerformerHostViewControllerForPresentingToast:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_8;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "useEditToastProgress");

  if (!v12)
    goto LABEL_8;
  objc_msgSend(v5, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  v15 = 0.0;
  if ((v14 & 1) != 0)
  {
    objc_msgSend(v5, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actionPerformerBottomPaddingForPresentingToast:", v5);
    v15 = v17;

  }
  v18 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
  objc_msgSend(v18, "setTotalUnitCount:", 100);
  objc_msgSend(v18, "setCompletedUnitCount:", 0);
  v19 = objc_alloc(MEMORY[0x1E0D7B140]);
  v20 = v10;
  objc_msgSend(v20, "px_navigationDestination");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v19, "initWithTargetDestination:progress:", v21, v18);

  objc_msgSend(v22, "setBottomSpacing:", v15);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __69__PUPXPhotoKitBatchActionPerformer_newProgressToastForAction_assets___block_invoke;
  v24[3] = &unk_1E58A39F0;
  v25 = v6;
  v10 = v20;
  v26 = v10;
  objc_msgSend(v22, "setErrorButtonAction:", v24);

LABEL_9:
  return v22;
}

+ (id)newActivityProgressAlertForAction:(id)a3 assets:(id)a4
{
  id v4;
  id v5;

  v4 = objc_alloc_init(MEMORY[0x1E0D7B158]);
  v5 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
  objc_msgSend(v4, "setProgress:", v5);

  objc_msgSend(v4, "setShowCheckmarkOnCompletion:", 1);
  objc_msgSend(v4, "setShouldAutoDisplay:", 1);
  objc_msgSend(v4, "setShouldUseProgressText:", 1);
  return v4;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

void __69__PUPXPhotoKitBatchActionPerformer_newProgressToastForAction_assets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  PUEditingErrorPresentationController *v6;

  v3 = a2;
  v6 = -[PUEditingErrorPresentationController initWithErrors:forAssets:]([PUEditingErrorPresentationController alloc], "initWithErrors:forAssets:", v3, *(_QWORD *)(a1 + 32));

  -[PUErrorPresentationController alertControllerWithCompletion:](v6, "alertControllerWithCompletion:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

}

uint64_t __89__PUPXPhotoKitBatchActionPerformer_newEditActionForPerformer_class_assets_prepareAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelCurrentBatchAction");
}

uint64_t __89__PUPXPhotoKitBatchActionPerformer_newEditActionForPerformer_class_assets_prepareAction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "hideAnimated:allowDelay:", 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "setErrors:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "finishProgressMarkingAsComplete:updatedLocalizedTitle:updatedLocalizedDescription:", 1, *(_QWORD *)(a1 + 48), 0);
}

@end
