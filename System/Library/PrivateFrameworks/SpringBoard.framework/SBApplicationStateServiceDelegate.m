@implementation SBApplicationStateServiceDelegate

- (id)dataSourceForApplicationBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationWithBundleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, 0);
    if (objc_msgSend(v6, "isWebAppPlaceholder"))
    {
      +[SBIconController sharedInstance](SBIconController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "model");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bookmarkIconForWebClipPlaceholderBundleIdentifier:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bookmark");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBSafeCast((uint64_t)v10, v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

@end
