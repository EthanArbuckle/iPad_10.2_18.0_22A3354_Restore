@implementation PUAudioClassificationSettings

- (void)setDefaultValues
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PUAudioClassificationSettings;
  -[PTSettings setDefaultValues](&v2, sel_setDefaultValues);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Browse"), &__block_literal_global_8507);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D83078];
  v11[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D83078];
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "moduleWithTitle:contents:", CFSTR("Audio Classification Settings"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __61__PUAudioClassificationSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  PUAudioClassificationBrowserDebugViewController *v5;

  v2 = a2;
  v5 = -[PUAudioClassificationBrowserDebugViewController initWithStyle:]([PUAudioClassificationBrowserDebugViewController alloc], "initWithStyle:", 0);
  -[PUAudioClassificationBrowserDebugViewController navigationItem](v5, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", CFSTR("Audio Classification Browser"));

  objc_msgSend(v2, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pushViewController:animated:", v5, 1);
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

+ (PUAudioClassificationSettings)sharedInstance
{
  if (sharedInstance_onceToken_102840 != -1)
    dispatch_once(&sharedInstance_onceToken_102840, &__block_literal_global_102841);
  return (PUAudioClassificationSettings *)(id)sharedInstance_sharedInstance_102842;
}

void __47__PUAudioClassificationSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioClassificationSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_102842;
  sharedInstance_sharedInstance_102842 = v0;

}

@end
