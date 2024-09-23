@implementation PXCMMPhotoKitDeleteActionPerformer

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedStringFromTable(CFSTR("PXCMMStopSharingConfirmationButtonTitle"), CFSTR("PhotosUICore"));
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[PXCMMActionPerformer session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentShare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PXCMMPhotoKitDeleteActionPerformer_performUserInteractionTask__block_invoke;
  v7[3] = &unk_1E5148B78;
  v7[4] = self;
  PXTrashMomentShares(v6, v5, v7);

}

uint64_t __64__PXCMMPhotoKitDeleteActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, a3);
}

@end
