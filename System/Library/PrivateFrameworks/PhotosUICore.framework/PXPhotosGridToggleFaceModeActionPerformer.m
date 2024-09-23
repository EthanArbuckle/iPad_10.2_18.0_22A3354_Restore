@implementation PXPhotosGridToggleFaceModeActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  return 1;
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeToggleFaceMode");
  return CFSTR("PXActivityTypeToggleFaceMode");
}

- (id)activitySystemImageName
{
  return CFSTR("face.smiling");
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v3;
  __CFString *v4;
  void *v5;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFaceModeEnabled"))
    v4 = CFSTR("PXPhotosDetailsBarAssetModeButton");
  else
    v4 = CFSTR("PXPhotosDetailsBarFaceModeButton");
  PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)performUserInteractionTask
{
  id v2;

  -[PXPhotosGridActionPerformer viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_54204);

}

void __71__PXPhotosGridToggleFaceModeActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setFaceModeEnabled:", objc_msgSend(v2, "isFaceModeEnabled") ^ 1);

}

@end
