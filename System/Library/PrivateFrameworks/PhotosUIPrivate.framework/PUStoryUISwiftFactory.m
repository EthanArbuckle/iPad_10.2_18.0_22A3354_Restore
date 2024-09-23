@implementation PUStoryUISwiftFactory

+ (id)viewControllerWithConfiguration:(id)a3 contentViewController:(id *)a4
{
  id v5;
  PUStoryViewController *v6;
  PUNavigationController *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  PUNavigationController *v16;

  v5 = a3;
  v6 = -[PUStoryViewController initWithConfiguration:]([PUStoryViewController alloc], "initWithConfiguration:", v5);

  v7 = -[PUNavigationController initWithRootViewController:]([PUNavigationController alloc], "initWithRootViewController:", v6);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9
    || (objc_msgSend(MEMORY[0x1E0D7BA70], "sharedInstance"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "allowsFormSheetPresentation"),
        v10,
        !v11))
  {
    -[PUNavigationController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 0);
  }
  else
  {
    -[PUNavigationController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
    -[PUNavigationController presentationController](v7, "presentationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[PUNavigationController presentationController](v7, "presentationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setWantsFullScreen:", 1);
      objc_msgSend(v14, "_setShouldScaleDownBehindDescendantSheets:", 1);

    }
  }
  -[PUStoryViewController px_enableBarAppearance](v6, "px_enableBarAppearance");
  -[PUStoryViewController px_barAppearance](v6, "px_barAppearance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "performChangesWithAnimationOptions:changes:", 0, &__block_literal_global_13702);

  v16 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v16;
}

+ (id)thumbnailActionPerformerWithModel:(id)a3
{
  id v3;
  PUStoryThumbnailActionPerformer *v4;

  v3 = a3;
  v4 = -[PUStoryThumbnailActionPerformer initWithModel:]([PUStoryThumbnailActionPerformer alloc], "initWithModel:", v3);

  return v4;
}

void __79__PUStoryUISwiftFactory_viewControllerWithConfiguration_contentViewController___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPrefersNavigationBarVisible:", 0);
  objc_msgSend(v2, "setPrefersStatusBarVisible:", 0);

}

@end
