@implementation PUPhotoKitEditActionPerformer

- (void)performUserInteractionTask
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  PUPhotoKitEditActionPerformer *v13;
  _QWORD v14[5];

  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetActionManager.m"), 1436, CFSTR("There can be only one asset in an edit action"));

  }
  -[PUAssetActionPerformer assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D7B1F8];
  v13 = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke;
  v14[3] = &unk_1E58A5298;
  v14[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke_2;
  v11[3] = &unk_1E58AAE08;
  v12 = v7;
  v9 = v7;
  objc_msgSend(v8, "checkIsSupportedAndPresentAlertForAsset:type:alertControllerPresenter:completionHandler:", v9, 0, v14, v11);

}

- (void)_beginEditingCurrentAsset
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  -[PUAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "canPerformEditOperation:", 2) & 1) != 0)
  {
    -[PUPhotoKitEditActionPerformer _presentEditorForAsset:](self, "_presentEditorForAsset:", v4);
  }
  else
  {
    objc_initWeak(&location, self);
    +[PUPhotoEditTaskManager sharedManager](PUPhotoEditTaskManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__PUPhotoKitEditActionPerformer__beginEditingCurrentAsset__block_invoke;
    v6[3] = &unk_1E58A52C0;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    objc_msgSend(v5, "createEditableCopyForReadOnlyPhoto:completionHandler:", v7, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)_presentEditorForAsset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  PUPhotoEditViewController *v9;
  void *v10;
  void *v11;
  PUPhotoKitMediaProvider *v12;

  v4 = a3;
  v12 = objc_alloc_init(PUPhotoKitMediaProvider);
  v5 = objc_alloc_init(MEMORY[0x1E0D7CAF8]);
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setApplyVideoOrientationAsMetadata:", objc_msgSend(v6, "applyVideoOrientationAsMetadata"));

  v7 = -[PUAssetActionPerformer actionType](self, "actionType");
  if (v7 - 16 > 0xA)
    v8 = 0;
  else
    v8 = qword_1AB0EFE70[v7 - 16];
  v9 = -[PUPhotoEditViewController initWithPhoto:mediaProvider:mediaDestination:]([PUPhotoEditViewController alloc], "initWithPhoto:mediaProvider:mediaDestination:", v4, v12, v5);

  -[PUPhotoEditViewController setInitialToolType:](v9, "setInitialToolType:", v8);
  -[PUPhotoKitEditActionPerformer quickCropContext](self, "quickCropContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController setQuickCropContext:](v9, "setQuickCropContext:", v10);

  -[PUPhotoKitEditActionPerformer pendingEditsRequest](self, "pendingEditsRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditViewController setInitialPendingEditsRequest:](v9, "setInitialPendingEditsRequest:", v11);

  -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v9), 0);
}

- (PUQuickCropContext)quickCropContext
{
  return self->_quickCropContext;
}

- (void)setQuickCropContext:(id)a3
{
  objc_storeStrong((id *)&self->_quickCropContext, a3);
}

- (PUPhotoEditPendingEditsRequest)pendingEditsRequest
{
  return self->_pendingEditsRequest;
}

- (void)setPendingEditsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pendingEditsRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEditsRequest, 0);
  objc_storeStrong((id *)&self->_quickCropContext, 0);
  objc_storeStrong((id *)&self->_presentedAlertViewController, 0);
}

void __58__PUPhotoKitEditActionPerformer__beginEditingCurrentAsset__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v5)
  {
    objc_msgSend(WeakRetained, "_presentEditorForAsset:", v5);
  }
  else
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Error creating editable duplicate asset for %@. Error: %@", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(v8, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }

}

uint64_t __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), a2);
  v4 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "presentViewController:", v4);

  return v5;
}

void __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, int a2)
{
  unint64_t v3;
  char v5;
  void *v6;
  char v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  unint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "playbackStyle");
    if (v3 > 5 || ((1 << v3) & 0x3A) == 0)
    {
      v21 = v3;
      PLUIGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v28 = v21;
        _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_ERROR, "No editor for playback style: %ld", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("No editor for playback style: %ld"), v21);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "completeUserInteractionTaskWithSuccess:error:", 0, v10);
      goto LABEL_21;
    }
    v5 = objc_msgSend(*(id *)(a1 + 32), "canPerformEditOperation:", 2);
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "enableSpatialMediaEditing");

    if ((v5 & 1) == 0 && ((v7 & 1) != 0 || (objc_msgSend(*(id *)(a1 + 32), "isSpatialMedia") & 1) == 0))
    {
      PULocalizedString(CFSTR("PHOTOEDIT_EDIT_READONLY_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(CFSTR("PHOTOEDIT_EDIT_READONLY_MESSAGE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v10, v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0DC3448];
      PULocalizedString(CFSTR("PHOTOEDIT_EDIT_READONLY_DUPLICATE_BUTTON"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke_3;
      v26[3] = &unk_1E58A8DE8;
      v26[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v16);

      v17 = (void *)MEMORY[0x1E0DC3448];
      PULocalizedString(CFSTR("PHOTOEDIT_EDIT_READONLY_CANCEL_BUTTON"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v15;
      v25[1] = 3221225472;
      v25[2] = __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke_4;
      v25[3] = &unk_1E58A8DE8;
      v25[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, v25);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v19);

      if ((objc_msgSend(*(id *)(a1 + 40), "presentViewController:", v12) & 1) == 0)
      {
        PLUIGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_ERROR, "Failed to present duplicate confirmation. User must confirm to perform edit.", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 40), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
      }

LABEL_21:
      goto LABEL_22;
    }
    objc_msgSend(*(id *)(a1 + 40), "_beginEditingCurrentAsset");
  }
  else
  {
    v8 = *(_QWORD **)(a1 + 40);
    v9 = v8[10];
    if (v9)
    {
      objc_msgSend(v8, "dismissViewController:completionHandler:", v9, 0);
      v8 = *(_QWORD **)(a1 + 40);
    }
    objc_msgSend(v8, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }
LABEL_22:
  v23 = *(_QWORD *)(a1 + 40);
  v24 = *(void **)(v23 + 80);
  *(_QWORD *)(v23 + 80) = 0;

}

uint64_t __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginEditingCurrentAsset");
}

uint64_t __59__PUPhotoKitEditActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  char v10;

  v5 = a3;
  v6 = a4;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "enableSpatialMediaEditing");

  if ((objc_msgSend(v5, "isPhoto") & 1) == 0
    && (!objc_msgSend(v5, "isVideo")
     || (objc_msgSend(v5, "isTimelapsePlaceholder") & 1) != 0
     || !objc_msgSend(v5, "canPerformEditOperation:", 2))
    || (objc_msgSend(v5, "isCloudSharedAsset") & 1) != 0
    || (objc_msgSend(v6, "isTrashBin") & 1) != 0
    || objc_msgSend(v5, "sourceType") == 8)
  {
    v10 = 0;
  }
  else
  {
    v9 = objc_msgSend(v5, "px_isSyndicatedAsset");
    if (((v9 | v8) & 1) == 0)
    {
      if (!objc_msgSend(v5, "isSpatialMedia"))
      {
        v10 = 1;
        goto LABEL_13;
      }
      LOBYTE(v9) = objc_msgSend(v5, "isPhoto");
    }
    v10 = v9 ^ 1;
  }
LABEL_13:

  return v10;
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(MEMORY[0x1E0D7CB58], "canPerformEditOnAsset:", a3, a4);
}

@end
