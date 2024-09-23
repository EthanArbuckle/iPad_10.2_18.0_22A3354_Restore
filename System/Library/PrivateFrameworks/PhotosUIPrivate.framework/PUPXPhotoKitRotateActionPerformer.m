@implementation PUPXPhotoKitRotateActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PFFilter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[PUPXPhotoKitRotateActionPerformer rotateDirection](self, "rotateDirection");
    v5 = +[PUPXPhotoKitBatchActionPerformer newEditActionForPerformer:class:assets:prepareAction:](PUPXPhotoKitBatchActionPerformer, "newEditActionForPerformer:class:assets:prepareAction:", self, objc_opt_class(), v4, 0);
    -[PXActionPerformer undoManager](self, "undoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executeWithUndoManager:completionHandler:", v6, &__block_literal_global_485_57011);

    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_INFO, "No valid assets to rotate, aborting.", v8, 2u);
    }

    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }

}

- (int64_t)rotateDirection
{
  return -1;
}

uint64_t __63__PUPXPhotoKitRotateActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (+[PUPXPhotoKitBatchActionPerformer canPerformBatchOnAsset:](PUPXPhotoKitBatchActionPerformer, "canPerformBatchOnAsset:", v2))
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
  uint64_t v12;
  BOOL v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "selectedIndexPaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __88__PUPXPhotoKitRotateActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke;
    v15[3] = &unk_1E58A3A18;
    v15[4] = &v16;
    v15[5] = a1;
    objc_msgSend(v8, "enumerateSelectedObjectsUsingBlock:", v15);
    v13 = *((_BYTE *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)_canPerformOnAsset:(id)a3
{
  return objc_msgSend(a3, "canPerformEditOperation:", 2);
}

void __88__PUPXPhotoKitRotateActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;

  v6 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v6;

    if (v5 && objc_msgSend(*(id *)(a1 + 40), "_canPerformOnAsset:", v5))
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
