@implementation PXPhotoKitAssetCollectionCopyInternalURLActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v4;
  char v5;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canShowInternalUI");

  return v5;
}

+ (BOOL)canPerformOn:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "canShowInternalUI"))
    v5 = objc_msgSend(v3, "count") == 1;
  else
    v5 = 0;

  return v5;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  if (a3 == 2)
    return CFSTR("(Internal) Copy URL");
  else
    return CFSTR("Copy URL");
}

+ (id)localizedTitleForPerson:(id)a3
{
  return CFSTR("Copy URL");
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("link");
}

+ (id)systemImageNameForPerson:(id)a3
{
  return CFSTR("link");
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeFileRadar"), a5);
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PXAssetCollectionActionPerformer people](self, "people");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "px_navigationURL");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_navigationURL");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setURL:", v7);

  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

@end
