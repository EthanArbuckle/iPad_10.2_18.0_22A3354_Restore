@implementation SBApplicationPlaceholder

- (BOOL)prioritize
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0D4E420];
  -[SBHProxiedApplicationPlaceholder applicationBundleID](self, "applicationBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting to prioritize placeholder."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logStep:byParty:phase:success:forBundleID:description:", 6, 10, 3, 1, v4, v5);

  v7.receiver = self;
  v7.super_class = (Class)SBApplicationPlaceholder;
  return -[SBHProxiedApplicationPlaceholder prioritize](&v7, sel_prioritize);
}

- (BOOL)cancel
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0D4E420];
  -[SBHProxiedApplicationPlaceholder applicationBundleID](self, "applicationBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting to cancel placeholder."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logStep:byParty:phase:success:forBundleID:description:", 7, 10, 3, 1, v4, v5);

  v7.receiver = self;
  v7.super_class = (Class)SBApplicationPlaceholder;
  return -[SBHProxiedApplicationPlaceholder cancel](&v7, sel_cancel);
}

- (BOOL)pause
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0D4E420];
  -[SBHProxiedApplicationPlaceholder applicationBundleID](self, "applicationBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting to pause placeholder."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logStep:byParty:phase:success:forBundleID:description:", 8, 10, 3, 1, v4, v5);

  v7.receiver = self;
  v7.super_class = (Class)SBApplicationPlaceholder;
  return -[SBHProxiedApplicationPlaceholder pause](&v7, sel_pause);
}

- (BOOL)resume
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0D4E420];
  -[SBHProxiedApplicationPlaceholder applicationBundleID](self, "applicationBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting to resume placeholder."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logStep:byParty:phase:success:forBundleID:description:", 9, 10, 3, 1, v4, v5);

  v7.receiver = self;
  v7.super_class = (Class)SBApplicationPlaceholder;
  return -[SBHProxiedApplicationPlaceholder resume](&v7, sel_resume);
}

- (void)_reloadThumbnailImage
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)MEMORY[0x1E0D4E420];
  -[SBHProxiedApplicationPlaceholder applicationBundleID](self, "applicationBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reloading icon image."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logStep:byParty:phase:success:forBundleID:description:", 2, 10, 3, 1, v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)SBApplicationPlaceholder;
  -[SBHProxiedApplicationPlaceholder _reloadThumbnailImage](&v6, sel__reloadThumbnailImage);
}

@end
