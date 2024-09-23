@implementation PUDuplicateActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BD08];
}

- (id)activityTitle
{
  return PULocalizedString(CFSTR("DUPLICATE_ASSET_ACTIVITY"));
}

- (id)_systemImageName
{
  return CFSTR("plus.square.on.square");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  -[PXActivity itemSourceController](self, "itemSourceController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPreparingIndividualItems");

  if (!v5)
    return 0;
  v6 = (void *)MEMORY[0x1E0D7B340];
  -[PXActivity itemSourceController](self, "itemSourceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v6, "canPerformOnAllAssets:", v8);

  return (char)v6;
}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

@end
