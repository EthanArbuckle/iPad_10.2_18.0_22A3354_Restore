@implementation PXStoryDemoActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeInternalStoryDemo");
  return CFSTR("PXActivityTypeInternalStoryDemo");
}

- (id)activityTitle
{
  return CFSTR("(Internal) Interactive Memory Demo");
}

- (id)_systemImageName
{
  return CFSTR("play.rectangle.fill");
}

- (id)assets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXActivity itemSourceController](self, "itemSourceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v2, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  BOOL v8;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canShowInternalUI");

  if (!v5)
    return 0;
  -[PXActivity itemSourceController](self, "itemSourceController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 0;

  return v8;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  PXStoryConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PXStoryConfiguration *v15;
  void *v16;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = [PXStoryConfiguration alloc];
  -[PXActivity itemSourceController](self, "itemSourceController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultFromArray();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PXStoryConfiguration initWithAssets:](v10, "initWithAssets:", v14);

  +[PXStoryUIFactory viewControllerWithConfiguration:contentViewController:](PXStoryUIFactory, "viewControllerWithConfiguration:contentViewController:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v16, v5, v8);

  return 1;
}

@end
