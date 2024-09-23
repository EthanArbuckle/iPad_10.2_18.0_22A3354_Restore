@implementation PUPXPhotoKitPasteAdjustmentsActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD aBlock[4];
  id v27;
  PUPXPhotoKitPasteAdjustmentsActionPerformer *v28;
  uint8_t buf[16];

  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PFFilter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_424;
    aBlock[3] = &unk_1E58AAE08;
    v27 = v4;
    v28 = self;
    v6 = _Block_copy(aBlock);
    if (PFExists())
    {
      v7 = (void *)MEMORY[0x1E0DC3450];
      PELocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PELocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0DC3448];
      PELocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v5;
      v24[1] = 3221225472;
      v24[2] = __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_3;
      v24[3] = &unk_1E58AB6C0;
      v13 = v6;
      v25 = v13;
      objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v14);

      v15 = (void *)MEMORY[0x1E0DC3448];
      PELocalizedString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_442;
      v22 = &unk_1E58AB6C0;
      v23 = v13;
      objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, &v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v17, v19, v20, v21, v22);

      -[PXActionPerformer presentViewController:](self, "presentViewController:", v10);
    }
    else
    {
      (*((void (**)(void *, _QWORD))v6 + 2))(v6, 0);
    }

  }
  else
  {
    PLUIGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_INFO, "No valid assets to paste on, aborting.", buf, 2u);
    }

    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }

}

void __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_424(uint64_t a1, char a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[8];
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, void *);
  void *v11;
  char v12;

  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_2;
  v11 = &__block_descriptor_33_e17_B16__0__PHAsset_8l;
  v12 = a2;
  PFFilter();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = +[PUPXPhotoKitBatchActionPerformer newEditActionForPerformer:class:assets:prepareAction:](PUPXPhotoKitBatchActionPerformer, "newEditActionForPerformer:class:assets:prepareAction:", *(_QWORD *)(a1 + 40), objc_opt_class(), v3, 0);
    objc_msgSend(*(id *)(a1 + 40), "undoManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executeWithUndoManager:completionHandler:", v5, &__block_literal_global_428);

    objc_msgSend(*(id *)(a1 + 40), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_INFO, "No valid assets to paste on after removing spatials, aborting.", v7, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }

}

uint64_t __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_INFO, "User approved pasting edits on spatial assets.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_442(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_INFO, "User skipped pasting edits on spatial assets.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_2_429(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSpatialMedia");
}

uint64_t __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32))
    return objc_msgSend(a2, "isSpatialMedia") ^ 1;
  else
    return 1;
}

uint64_t __73__PUPXPhotoKitPasteAdjustmentsActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (+[PUPXPhotoKitPasteAdjustmentsActionPerformer _canPasteOnAsset:](PUPXPhotoKitPasteAdjustmentsActionPerformer, "_canPasteOnAsset:", v2))
  {
    v3 = objc_msgSend(MEMORY[0x1E0D7B1F8], "isSupportedAsset:type:", v2, 0);
  }
  else
  {
    v3 = 0;
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
  uint64_t v13;
  BOOL v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hasPresetOnPasteboard")
    && (objc_msgSend(v11, "isBusyWithBatchAction") & 1) == 0
    && (objc_msgSend(v8, "selectedIndexPaths"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "count"),
        v12,
        v13))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __98__PUPXPhotoKitPasteAdjustmentsActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke;
    v16[3] = &unk_1E58A3A18;
    v16[4] = &v17;
    v16[5] = a1;
    objc_msgSend(v8, "enumerateSelectedObjectsUsingBlock:", v16);
    v14 = *((_BYTE *)v18 + 24) != 0;
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)_canPasteOnAsset:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableSpatialMediaEditing");

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PUPXPhotoKitPasteAdjustmentsActionPerformer;
  if (objc_msgSendSuper2(&v10, sel_canPerformBatchOnAsset_, v4)
    && ((v6 & 1) != 0 || (objc_msgSend(v4, "isSpatialMedia") & 1) == 0)
    && objc_msgSend(MEMORY[0x1E0D7CB58], "canPerformEditOnAsset:", v4))
  {
    objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPresetOnPasteboard");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PULocalizedString(CFSTR("PASTE_ACTIVITY_ADJUSTMENTS"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("slider.horizontal.2.square.badge.arrow.down");
}

void __98__PUPXPhotoKitPasteAdjustmentsActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;

  v6 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v6;

    if (v5 && objc_msgSend(*(id *)(a1 + 40), "_canPasteOnAsset:", v5))
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
