@implementation PXPhotoKitMomentShareTrashActionPerformer

- (void)performUserInteractionTask
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD aBlock[6];

  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2195, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollection"), v22, v24);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2195, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollection"), v22);
  }

LABEL_3:
  _TrashMomentShareActionTitle(v4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "px_momentShareType");
  v25 = v4;
  if (!v5)
  {
    v6 = CFSTR("PXCMMStopSharingAlertMessage");
    goto LABEL_7;
  }
  if (v5 == 1)
  {
    v6 = CFSTR("PXCMMDeclineSharingAlertMessage");
LABEL_7:
    PXLocalizedStringFromTable(v6, CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v7 = 0;
LABEL_9:
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke;
  aBlock[3] = &unk_1E5149198;
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  v32[0] = v9;
  v32[1] = 3221225472;
  v32[2] = __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_2;
  v32[3] = &unk_1E5149198;
  v32[4] = self;
  v11 = _Block_copy(v32);
  v31[0] = v9;
  v31[1] = 3221225472;
  v31[2] = __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_3;
  v31[3] = &unk_1E5149198;
  v31[4] = self;
  v12 = (void (**)(_QWORD))_Block_copy(v31);
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v7, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3448];
  v29[0] = v9;
  v29[1] = 3221225472;
  v29[2] = __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_4;
  v29[3] = &unk_1E5142658;
  v15 = v10;
  v30 = v15;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v26, 2, v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v16);

  v17 = (void *)MEMORY[0x1E0DC3448];
  v27[0] = v9;
  v27[1] = 3221225472;
  v27[2] = __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_5;
  v27[3] = &unk_1E5142658;
  v28 = v11;
  v18 = v11;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v8, 1, v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v19);

  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v13))
    v12[2](v12);

}

- (void)performBackgroundTask
{
  void *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[16];

  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2246, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollection"), v10);
LABEL_9:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2246, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollection"), v10, v12);

    goto LABEL_9;
  }
LABEL_3:
  PLSharingGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ActionPerformerTrashMomentShare", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__PXPhotoKitMomentShareTrashActionPerformer_performBackgroundTask__block_invoke;
  v13[3] = &unk_1E5148B78;
  v13[4] = self;
  PXTrashMomentShare(v4, v13);

}

void __66__PXPhotoKitMomentShareTrashActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  id v8;
  uint8_t buf[16];

  v4 = a3;
  PLSharingGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, *(const void **)(a1 + 32));
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_END, v7, "ActionPerformerTrashMomentShare", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v8 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __66__PXPhotoKitMomentShareTrashActionPerformer_performBackgroundTask__block_invoke_888(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

void __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(*(id *)(a1 + 32), "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1001, CFSTR("User cancelled action to trash a CMM share: %@"), v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, v4);
}

void __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(*(id *)(a1 + 32), "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1002, CFSTR("Failed to present confirmation alert to trash a CMM share: %@"), v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, v4);
}

uint64_t __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__PXPhotoKitMomentShareTrashActionPerformer_performUserInteractionTask__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v6;
  BOOL v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  objc_msgSend(a3, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2168, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2168, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v11, v13);

    goto LABEL_6;
  }
LABEL_3:
  v7 = objc_msgSend(v6, "assetCollectionType") == 7;

  return v7;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  void *v7;
  void *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  objc_msgSend(a4, "assetCollection", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2174, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v12);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2174, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v12, v14);

    goto LABEL_6;
  }
LABEL_3:
  _TrashMomentShareActionTitle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("xmark.circle");
}

+ (BOOL)isActionDestructive
{
  return 1;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  const __CFString *v5;

  if (a5)
    v5 = (const __CFString *)a5;
  else
    v5 = &stru_1E5149688;
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeTrashMomentShare"), v5);
}

@end
