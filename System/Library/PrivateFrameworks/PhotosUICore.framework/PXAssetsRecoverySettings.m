@implementation PXAssetsRecoverySettings

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (void)setDefaultValues
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PXAssetsRecoverySettings;
  -[PTSettings setDefaultValues](&v2, sel_setDefaultValues);
}

+ (PXAssetsRecoverySettings)sharedInstance
{
  if (sharedInstance_onceToken_237716 != -1)
    dispatch_once(&sharedInstance_onceToken_237716, &__block_literal_global_237717);
  return (PXAssetsRecoverySettings *)(id)sharedInstance_sharedInstance_237718;
}

+ (id)settingsControllerModule
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)MEMORY[0x1E0D83078];
  v4 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_135_237707);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:action:", CFSTR("Clear Dismissal Date"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0D83078], "moduleWithTitle:contents:", CFSTR("Assets Recovery"), v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __52__PXAssetsRecoverySettings_settingsControllerModule__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "px_localDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setDate:forKey:", 0, CFSTR("AssetsRecoveryBannerDismissalDate"));

  return 1;
}

void __42__PXAssetsRecoverySettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetsRecoverySettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_237718;
  sharedInstance_sharedInstance_237718 = v0;

}

@end
