@implementation PXPhotoKitExpungeAssetActionPerformer

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

- (int64_t)destructivePhotosAction
{
  return 6;
}

- (id)actionType
{
  __CFString *v2;

  v2 = CFSTR("PXAssetActionTypeExpunge");
  return CFSTR("PXAssetActionTypeExpunge");
}

@end
