@implementation PUPXPhotoKitAudioMixModeActionPerformer

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[16];

  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PFFilter();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_opt_class();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__PUPXPhotoKitAudioMixModeActionPerformer_performUserInteractionTask__block_invoke_556;
    v15[3] = &unk_1E58A3D20;
    v15[4] = self;
    v7 = +[PUPXPhotoKitBatchActionPerformer newEditActionForPerformer:class:assets:prepareAction:](PUPXPhotoKitBatchActionPerformer, "newEditActionForPerformer:class:assets:prepareAction:", self, v6, v5, v15);
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:
        -[PXActionPerformer undoManager](self, "undoManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "executeWithUndoManager:completionHandler:", v8, &__block_literal_global_560);

        -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_descriptionForAssertionMessage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXPhotoKitAssetActionManager.m"), 1784, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[PUPXPhotoKitBatchActionPerformer newEditActionForPerformer:self class:PXEditBatchAudioMixModeAction.class assets:validAssets prepareAction:^(PXEditBatchAudioMixModeAction *prepareAudioMixModeAction) { prepareAudioMixModeAction.audioMixMode = self.audioMixMode; }]"),
        v12,
        v14);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXPhotoKitAssetActionManager.m"), 1784, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[PUPXPhotoKitBatchActionPerformer newEditActionForPerformer:self class:PXEditBatchAudioMixModeAction.class assets:validAssets prepareAction:^(PXEditBatchAudioMixModeAction *prepareAudioMixModeAction) { prepareAudioMixModeAction.audioMixMode = self.audioMixMode; }]"),
        v12);
    }

    goto LABEL_4;
  }
  PLUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_INFO, "No valid assets to apply audio mix, aborting.", buf, 2u);
  }

  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
LABEL_8:

}

- (NSString)audioMixMode
{
  return self->_audioMixMode;
}

- (void)setAudioMixMode:(id)a3
{
  objc_storeStrong((id *)&self->_audioMixMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioMixMode, 0);
}

void __69__PUPXPhotoKitAudioMixModeActionPerformer_performUserInteractionTask__block_invoke_556(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "audioMixMode");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAudioMixMode:", v4);

}

uint64_t __69__PUPXPhotoKitAudioMixModeActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
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
  BOOL v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isAnyItemSelected"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __94__PUPXPhotoKitAudioMixModeActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke;
    v13[3] = &unk_1E58A3A18;
    v13[4] = &v14;
    v13[5] = a1;
    objc_msgSend(v8, "enumerateSelectedObjectsUsingBlock:", v13);
    v11 = *((_BYTE *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)_canPerformOnAsset:(id)a3
{
  return objc_msgSend(a3, "canPerformEditOperation:", 2);
}

void __94__PUPXPhotoKitAudioMixModeActionPerformer_canPerformWithSelectionSnapshot_person_socialGroup___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
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
