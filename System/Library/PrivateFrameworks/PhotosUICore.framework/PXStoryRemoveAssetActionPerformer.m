@implementation PXStoryRemoveAssetActionPerformer

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  unsigned __int8 v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isAnyItemSelected")
    && (objc_msgSend(v8, "dataSource"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "containsMultipleItems"),
        v11,
        v12))
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___PXStoryRemoveAssetActionPerformer;
    v13 = objc_msgSendSuper2(&v15, sel_canPerformWithSelectionSnapshot_person_socialGroup_, v8, v9, v10);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return a3 != 0;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedStringFromTable(CFSTR("InteractiveMemoryActionTitle_HideFromMemory"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("minus.circle");
}

- (BOOL)shouldPreventTargetedDismissalAnimation
{
  return 1;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXStoryAssetActionPerformer storyViewActionPerformer](self, "storyViewActionPerformer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    -[PXPhotoKitAssetActionPerformer assets](self, "assets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "removeAssetsFromCuration:", v5);
  }
  else
  {
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }

}

@end
