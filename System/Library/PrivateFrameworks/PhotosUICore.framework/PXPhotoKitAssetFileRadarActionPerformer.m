@implementation PXPhotoKitAssetFileRadarActionPerformer

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v5;
  void *v6;
  int v7;
  char v8;

  v5 = a3;
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canShowInternalUI");

  if (v7)
    v8 = objc_msgSend(v5, "isAnyItemSelected");
  else
    v8 = 0;

  return v8;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0DC3870];
  v7 = a3;
  objc_msgSend(v6, "systemImageNamed:", CFSTR("ant"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v8, 0, v7, a4);

  return v9;
}

- (void)performUserInteractionTask
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  char v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  char v15;
  _QWORD aBlock[4];
  id v17;
  PXPhotoKitAssetFileRadarActionPerformer *v18;
  SEL v19;

  -[PXPhotoKitAssetActionPerformer radarConfigurationProvider](self, "radarConfigurationProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetFileRadarActionPerformer.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("radarConfigurationProvider"));

  }
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke;
  aBlock[3] = &unk_1E5119150;
  v6 = v4;
  v18 = self;
  v19 = a2;
  v17 = v6;
  v7 = _Block_copy(aBlock);
  v8 = objc_msgSend(v6, "includeAssetImages");
  v9 = objc_msgSend(v6, "includeAssetThumbnails");
  if ((v8 & 1) != 0 || v9)
  {
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_5;
    v13[3] = &unk_1E5119178;
    v13[4] = self;
    v15 = v9;
    v14 = v7;
    +[PXFeedbackTapToRadarUtilities alertControllerWithInternalReleaseAgreementAndCompletion:](PXFeedbackTapToRadarUtilities, "alertControllerWithInternalReleaseAgreementAndCompletion:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v10))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present the TTR internal release agreement"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v11);

    }
  }
  else
  {
    (*((void (**)(void *, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  }

}

void __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v5 = (void *)a1[4];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "radarConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[5], CFSTR("PXPhotoKitAssetFileRadarActionPerformer.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("radarConfiguration"));

  }
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_2;
  v20[3] = &unk_1E5119128;
  v10 = v8;
  v21 = v10;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v20);
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_3;
  v18[3] = &unk_1E5119128;
  v19 = v10;
  v11 = v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);

  v12 = objc_msgSend(v7, "count");
  objc_msgSend(v11, "setAttachmentsIncludeAnyUserAsset:", v12 != 0);
  objc_msgSend(v11, "completionHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_4;
  v16[3] = &unk_1E5148348;
  v16[4] = a1[5];
  v17 = v13;
  v14 = v13;
  objc_msgSend(v11, "setCompletionHandler:", v16);
  PXFileRadarWithConfiguration(v11);

}

void __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_5(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  char v26;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "selectionSnapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = *(_BYTE *)(a1 + 48);
    v8 = v5;
    v9 = v6;
    v21 = v4;
    objc_msgSend(v21, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:
        objc_msgSend(v21, "selectedIndexPaths");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = ___AssetAttachmentsForSelection_block_invoke;
        v22[3] = &unk_1E51191A0;
        v26 = v7;
        v23 = v10;
        v24 = v8;
        v25 = v9;
        v12 = v10;
        v13 = v8;
        v14 = v9;
        objc_msgSend(v11, "enumerateItemIndexPathsUsingBlock:", v22);

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _AssetAttachmentsForSelection(PXSelectionSnapshot *__strong, NSMutableArray<NSURL *> *__strong, NSMutableArray<NSURL *> *__strong, BOOL)");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "px_descriptionForAssertionMessage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXPhotoKitAssetFileRadarActionPerformer.m"), 103, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("selectionSnapshot.dataSource"), v18, v20);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _AssetAttachmentsForSelection(PXSelectionSnapshot *__strong, NSMutableArray<NSURL *> *__strong, NSMutableArray<NSURL *> *__strong, BOOL)");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXPhotoKitAssetFileRadarActionPerformer.m"), 103, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("selectionSnapshot.dataSource"), v18);
    }

    goto LABEL_4;
  }
  objc_msgSend(v3, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

uint64_t __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addScreenshot:", a2);
}

uint64_t __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttachment:", a2);
}

void __69__PXPhotoKitAssetFileRadarActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to file TTR radar"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, v6);

  }
}

@end
