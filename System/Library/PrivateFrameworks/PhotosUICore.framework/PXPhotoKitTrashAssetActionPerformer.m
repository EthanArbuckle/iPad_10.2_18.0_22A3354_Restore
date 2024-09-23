@implementation PXPhotoKitTrashAssetActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v7;
  id v8;
  char v9;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isTrashBin") & 1) != 0
    || (objc_msgSend(v8, "px_isRecoveredSmartAlbum") & 1) != 0
    || !objc_msgSend(v8, "canPerformEditOperation:", 1))
  {
    v9 = 0;
  }
  else
  {
    v9 = objc_msgSend(v7, "canPerformEditOperation:", 1);
  }

  return v9;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  objc_class *v6;
  id v7;
  void *v8;

  v6 = (objc_class *)MEMORY[0x1E0DC34F0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithBarButtonSystemItem:target:action:", 16, v7, a4);

  return v8;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("trash");
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (a3 > 2)
    v5 = 0;
  else
    v5 = off_1E5124918[a3];
  v6 = v5;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PXPhotoKitAssetActionManager%@Title_Trash_Library"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)isActionDestructive
{
  return 1;
}

- (int64_t)destructivePhotosAction
{
  return 0;
}

- (id)actionType
{
  __CFString *v2;

  v2 = CFSTR("PXAssetActionTypeTrash");
  return CFSTR("PXAssetActionTypeTrash");
}

@end
