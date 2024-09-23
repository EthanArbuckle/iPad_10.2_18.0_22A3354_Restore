@implementation PUPXPhotoKitRevertAdjustmentsActionPerformer

- (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  unint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  void (**v23)(_QWORD);
  _QWORD aBlock[5];
  id v25;
  uint8_t buf[16];

  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PFFilter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    PFFilter();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_2;
    aBlock[3] = &unk_1E58ABCA8;
    aBlock[4] = self;
    v25 = v4;
    v7 = (void (**)(_QWORD))_Block_copy(aBlock);
    v8 = objc_msgSend(v3, "count");
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v3, "count");
      PXLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PXMediaTypeForAssets();
      PXLocalizedUsageStringWithoutAssetCount();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v8 < 2)
        goto LABEL_15;
      PXLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedString();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v10;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0DC3448];
      PXLocalizedString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v6;
      v22[1] = 3221225472;
      v22[2] = __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_4;
      v22[3] = &unk_1E58A3B68;
      v22[4] = self;
      v23 = v7;
      objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 2, v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAction:", v16);

      v17 = (void *)MEMORY[0x1E0DC3448];
      PXLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v6;
      v21[1] = 3221225472;
      v21[2] = __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_5;
      v21[3] = &unk_1E58A8DE8;
      v21[4] = self;
      objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAction:", v19);

      if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v13))
      {
        PLSharedLibraryGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_ERROR, "Failed to present revert unsupported adjustments warning.", buf, 2u);
        }

        -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
      }

      goto LABEL_16;
    }
LABEL_15:
    v7[2](v7);
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
LABEL_16:

    goto LABEL_17;
  }
  PLUIGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_INFO, "No valid assets to revert, aborting.", buf, 2u);
  }

  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
LABEL_17:

}

void __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = +[PUPXPhotoKitBatchActionPerformer newEditActionForPerformer:class:assets:prepareAction:](PUPXPhotoKitBatchActionPerformer, "newEditActionForPerformer:class:assets:prepareAction:", *(_QWORD *)(a1 + 32), objc_opt_class(), *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "undoManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeWithUndoManager:completionHandler:", v2, &__block_literal_global_454);

}

uint64_t __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

uint64_t __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

uint64_t __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_451(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D7CB58], "assetHasUnsupportedOriginalAdjustments:", a2);
}

uint64_t __74__PUPXPhotoKitRevertAdjustmentsActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = 0;
  if (+[PUPXPhotoKitRevertAdjustmentsActionPerformer _canRevertOnAsset:fast:](PUPXPhotoKitRevertAdjustmentsActionPerformer, "_canRevertOnAsset:fast:", v2, 0))
  {
    v3 = objc_msgSend(MEMORY[0x1E0D7B1F8], "isSupportedAsset:type:", v2, 0);
  }

  return v3;
}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  BOOL v14;
  _QWORD v16[6];
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isBusyWithBatchAction") & 1) != 0
    || (objc_msgSend(v8, "selectedIndexPaths"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "count"),
        v12,
        !v13))
  {
    v14 = 0;
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __99__PUPXPhotoKitRevertAdjustmentsActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke;
    v16[3] = &unk_1E58A3AE0;
    v17 = v13 > 2;
    v16[4] = &v18;
    v16[5] = a1;
    objc_msgSend(v8, "enumerateSelectedObjectsUsingBlock:", v16);
    v14 = *((_BYTE *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }

  return v14;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return objc_msgSend(a1, "_canRevertOnAsset:fast:", a3, 0, a5, a6);
}

+ (BOOL)_canRevertOnAsset:(id)a3 fast:(BOOL)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  if (objc_msgSend(v6, "hasAdjustments"))
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___PUPXPhotoKitRevertAdjustmentsActionPerformer;
    v7 = objc_msgSendSuper2(&v10, sel_canPerformBatchOnAsset_, v6);
    if (v7 && !a4)
    {
      objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v8, "assetHasRevertibleAdjustments:", v6);

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PULocalizedString(CFSTR("REVERT_ACTIVITY_ADJUSTMENTS"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("slider.horizontal.2.gobackward");
}

void __99__PUPXPhotoKitRevertAdjustmentsActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;

  v6 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v6;

    if (v5
      && objc_msgSend(*(id *)(a1 + 40), "_canRevertOnAsset:fast:", v5, *(unsigned __int8 *)(a1 + 48)))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
  else
  {

    v5 = 0;
  }

}

@end
