@implementation PXPhotoKitAssetCopyInternalURLActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  void *v7;
  char v8;
  BOOL v9;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canShowInternalUI");
  if (a3)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  if (a3 == 2)
    return CFSTR("(Internal) Copy URL");
  else
    return CFSTR("Copy URL");
}

+ (id)systemImageNameForActionManager:(id)a3
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  -[PXPhotoKitAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v28 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotoKitAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "transientIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(":"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v28, "px_isSuggestion"))
    {
      objc_msgSend(v28, "localIdentifier");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
LABEL_9:
        objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("photos://asset"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0CB39D8];
        objc_msgSend(v7, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "queryItemWithName:value:", CFSTR("uuid"), v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v22);

        objc_msgSend(v28, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
LABEL_12:
          objc_msgSend(v13, "setQueryItems:", v8);
          objc_msgSend(v13, "URL");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setURL:", v26);

          -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
          goto LABEL_13;
        }
        v24 = (void *)MEMORY[0x1E0CB39D8];
        objc_msgSend(v28, "uuid");
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("albumuuid");
        v17 = v24;
        v19 = v12;
LABEL_11:
        objc_msgSend(v17, "queryItemWithName:value:", v18, v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v25);

        goto LABEL_12;
      }
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("PXFeaturedPhotosVirtualCollection")))
        goto LABEL_9;
      -[PXPhotoKitAssetActionPerformer dataSourceUserInfo](self, "dataSourceUserInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v15);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("photos://featuredPhoto"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("identifier"), v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v16);

    v17 = (void *)MEMORY[0x1E0CB39D8];
    v18 = CFSTR("source");
    v19 = CFSTR("widget");
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("No asset available in %@"), self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v13);
LABEL_13:

}

@end
