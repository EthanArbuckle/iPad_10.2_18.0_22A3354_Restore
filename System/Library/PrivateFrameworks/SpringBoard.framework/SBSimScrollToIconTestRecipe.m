@implementation SBSimScrollToIconTestRecipe

- (id)title
{
  return CFSTR("Simulate Scroll To Icon");
}

- (void)handleVolumeIncrease
{
  -[SBSimScrollToIconTestRecipe _simulateScrollToIconWithDisplayIdentifier:](self, "_simulateScrollToIconWithDisplayIdentifier:", CFSTR("com.apple.Preferences"));
}

- (void)_simulateScrollToIconWithDisplayIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leafIconForIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "setIconToReveal:revealingPrevious:", v6, 1);
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mainWindowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "switcherController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

      if (v11)
        NSLog(CFSTR("expected a switcherController!"));
    }
    objc_msgSend(v7, "transientOverlayPresentationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "hasActivePresentation"))
    {

    }
    else
    {
      objc_msgSend(v9, "layoutStatePrimaryElement");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "workspaceEntity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "applicationSceneEntity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sceneHandle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(v4, "tryScrollToIconToRevealAnimated:", 1);
        goto LABEL_10;
      }
    }
    SBWorkspaceSuspendActiveDisplay();
LABEL_10:

  }
}

@end
