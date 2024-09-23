@implementation PXPhotoKitAssetCollectionStoryDemoActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXStoryConfiguration *v7;
  PXStoryConfiguration *v8;
  void *v9;
  int v10;
  PXStoryConfiguration *v11;
  void *v12;
  PXStoryConfiguration *v13;
  _QWORD v14[4];
  PXStoryConfiguration *v15;
  PXPhotoKitAssetCollectionStoryDemoActionPerformer *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  -[PXAssetCollectionActionPerformer assetsDataSource](self, "assetsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_11;
  -[PXAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCollectionReferenceForAssetCollectionReference:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (objc_msgSend(v3, "containerCollection"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "canContainAssets"),
        v9,
        v10)
    && (objc_msgSend(v3, "containerCollection"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = -[PXStoryConfiguration initWithAssetCollection:]([PXStoryConfiguration alloc], "initWithAssetCollection:", v6);
  }
  else
  {
    if (objc_msgSend(v3, "numberOfSections") <= 0)
    {

LABEL_11:
      v11 = [PXStoryConfiguration alloc];
      -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PXStoryConfiguration initWithAssetCollection:](v11, "initWithAssetCollection:", v12);

      goto LABEL_12;
    }
    v17 = objc_msgSend(v3, "identifier");
    v18 = xmmword_1A7C0C1F0;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v3, "assetsInSectionIndexPath:", &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXStoryConfiguration initWithAssets:]([PXStoryConfiguration alloc], "initWithAssets:", v6);
  }
  v8 = v7;

  if (!v8)
    goto LABEL_11;
LABEL_12:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__PXPhotoKitAssetCollectionStoryDemoActionPerformer_performUserInteractionTask__block_invoke;
  v14[3] = &unk_1E5148D08;
  v15 = v8;
  v16 = self;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __79__PXPhotoKitAssetCollectionStoryDemoActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  id v2;

  +[PXStoryUIFactory viewControllerWithConfiguration:contentViewController:](PXStoryUIFactory, "viewControllerWithConfiguration:contentViewController:", *(_QWORD *)(a1 + 32), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:", v2);
  objc_msgSend(*(id *)(a1 + 40), "completeUserInteractionTaskWithSuccess:error:", 1, 0);

}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;

  v4 = a3;
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "canShowInternalUI"))
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "enableDemoAction") & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      objc_msgSend(v4, "assetCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

    }
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled", a3, a4, a5))
    return CFSTR("Play as Standalone Memory");
  else
    return CFSTR("Interactive Memory Demo");
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled", a3, a4))
    return CFSTR("memories");
  else
    return CFSTR("play.rectangle.fill");
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeDebugCuration"), a5);
}

@end
