@implementation SBRotateScenesWorkspaceTransaction

- (BOOL)_shouldResignActiveForAnimation
{
  return 0;
}

- (unint64_t)_serialOverlayPreDismissalOptions
{
  return -110;
}

- (unint64_t)_concurrentOverlayDismissalOptions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  objc_super v11;
  objc_super v12;

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "previousLayoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interfaceOrientation");

  objc_msgSend(v4, "layoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "interfaceOrientation");

  if ((unint64_t)(v6 - 3) > 1 || (unint64_t)(v8 - 1) > 1)
  {
    v11.receiver = self;
    v11.super_class = (Class)SBRotateScenesWorkspaceTransaction;
    v9 = -[SBAppToAppWorkspaceTransaction _concurrentOverlayDismissalOptions](&v11, sel__concurrentOverlayDismissalOptions) & 0xFFFFFFFFFFFFFFBELL;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRotateScenesWorkspaceTransaction;
    v9 = -[SBAppToAppWorkspaceTransaction _concurrentOverlayDismissalOptions](&v12, sel__concurrentOverlayDismissalOptions) | 1;
  }

  return v9;
}

@end
