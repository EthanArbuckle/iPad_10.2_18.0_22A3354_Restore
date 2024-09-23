@implementation PXPhotoKitCollectionListRenameActionPerformer

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return objc_msgSend(a3, "canPerformEditOperation:", 7);
}

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  return PXLocalizedStringFromTable(CFSTR("PXRenameFolderActionName"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4
{
  return CFSTR("pencil");
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[PXPhotoKitCollectionListActionPerformer collectionList](self, "collectionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer undoManager](self, "undoManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__PXPhotoKitCollectionListRenameActionPerformer_performUserInteractionTask__block_invoke;
  v7[3] = &unk_1E5148B78;
  v7[4] = self;
  PXCollectionRenameActionAlertController(v3, v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present collection list rename alert"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

  }
}

uint64_t __75__PXPhotoKitCollectionListRenameActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, a3);
}

@end
