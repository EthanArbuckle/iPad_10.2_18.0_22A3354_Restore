@implementation PUInternalAutoLoopFeedbackActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BD58];
}

- (id)activityTitle
{
  return CFSTR("Variation Feedback");
}

- (id)activityImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  PLPhotoLibraryFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("RepeatBadge"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)asset
{
  void *v2;
  void *v3;
  void *v4;

  -[PXActivity itemSourceController](self, "itemSourceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  char v7;

  -[PXActivity itemSourceController](self, "itemSourceController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPreparingIndividualItems");

  -[PUInternalAutoLoopFeedbackActivity asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (MEMORY[0x1AF429AFC]() && v5)
  {
    if ((objc_msgSend(v6, "canPlayLoopingVideo") & 1) != 0)
      v7 = 1;
    else
      v7 = objc_msgSend(v6, "canPlayLongExposure");
  }

  return v7;
}

- (id)activityViewController
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D7B418]);
  -[PUInternalAutoLoopFeedbackActivity asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithAsset:delegate:", v4, self);

  objc_msgSend(v5, "setModalPresentationStyle:", 0);
  return v5;
}

- (void)feedbackAssetUIViewController:(id)a3 didFinish:(BOOL)a4
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", a4);
}

@end
