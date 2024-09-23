@implementation PUWelcomeSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUWelcomeSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PUWelcomeSettings setWhatsNewBehavior:](self, "setWhatsNewBehavior:", 2);
  -[PUWelcomeSettings setCloudPhotoWelcomeBehavior:](self, "setCloudPhotoWelcomeBehavior:", 2);
}

- (void)setWhatsNewBehavior:(unint64_t)a3
{
  self->_whatsNewBehavior = a3;
}

- (void)setCloudPhotoWelcomeBehavior:(unint64_t)a3
{
  self->_cloudPhotoWelcomeBehavior = a3;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  objc_msgSend(a3, "invalidate");
}

- (unint64_t)whatsNewBehavior
{
  return self->_whatsNewBehavior;
}

- (unint64_t)cloudPhotoWelcomeBehavior
{
  return self->_cloudPhotoWelcomeBehavior;
}

+ (PUWelcomeSettings)sharedInstance
{
  if (sharedInstance_onceToken_103281 != -1)
    dispatch_once(&sharedInstance_onceToken_103281, &__block_literal_global_103282);
  return (PUWelcomeSettings *)(id)sharedInstance_sharedInstance_103283;
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_whatsNewBehavior);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("What‘s New"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_possibleValues:formatter:", &unk_1E59BAA50, &__block_literal_global_10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v6;
  v7 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_cloudPhotoWelcomeBehavior);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Cloud Photo Welcome"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_possibleValues:formatter:", &unk_1E59BAA68, &__block_literal_global_23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v11, CFSTR("App launch prompts"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:action:", CFSTR("Reset All Last Shown Info"), &__block_literal_global_31_103256);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  v15 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:action:", CFSTR("Restore Defaults"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83078];
  v24[0] = v12;
  v24[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "moduleWithTitle:contents:", CFSTR("Welcome Settings"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

uint64_t __45__PUWelcomeSettings_settingsControllerModule__block_invoke_3()
{
  void *v0;

  +[PUWelcomeViewControllersManager defaultManager](PUWelcomeViewControllersManager, "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resetAllLastPresentationInfos");

  return objc_msgSend(MEMORY[0x1E0D7B450], "resetLastShownInfo");
}

const __CFString *__45__PUWelcomeSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  const __CFString *v3;

  v2 = objc_msgSend(a2, "integerValue");
  v3 = CFSTR("Always Show");
  if (v2 == 1)
    v3 = CFSTR("Never Show");
  if (v2 == 2)
    return CFSTR("Follow System Behavior");
  else
    return v3;
}

const __CFString *__45__PUWelcomeSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  const __CFString *v3;

  v2 = objc_msgSend(a2, "integerValue");
  v3 = CFSTR("Always Show");
  if (v2 == 1)
    v3 = CFSTR("Never Show");
  if (v2 == 2)
    return CFSTR("Follow System Behavior");
  else
    return v3;
}

void __35__PUWelcomeSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "welcomeSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_103283;
  sharedInstance_sharedInstance_103283 = v0;

}

@end
