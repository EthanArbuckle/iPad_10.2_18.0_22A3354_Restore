@implementation SHSKeyboardClicksControllerViewController

+ (NSString)combinedDescription
{
  _BOOL4 v2;
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v2 = CFPreferencesGetAppBooleanValue(CFSTR("keyboard-audio"), CFSTR("com.apple.preferences.sounds"), &keyExistsAndHasValidFormat) == 0;
  v3 = keyExistsAndHasValidFormat != 0;
  objc_msgSend(MEMORY[0x24BEBD6F8], "sharedPreferencesController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "visceral");
  v6 = CFSTR("HAPTIC");
  if (!v5)
    v6 = CFSTR("NONE");
  if (v3 && v2 || v5 == 0)
    v7 = CFSTR("SOUND");
  else
    v7 = CFSTR("SOUND_AND_HAPTIC");
  if (v3 && v2)
    v8 = (__CFString *)v6;
  else
    v8 = (__CFString *)v7;

  SHS_LocalizedStringForSounds(v8);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SHSKeyboardClicksControllerViewController;
  -[SHSKeyboardClicksControllerViewController loadView](&v4, sel_loadView);
  SHS_LocalizedStringForSounds(CFSTR("KEYBOARD_FEEDBACK"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSKeyboardClicksControllerViewController setTitle:](self, "setTitle:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SHSKeyboardClicksControllerViewController;
  -[SHSKeyboardClicksControllerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SHSKeyboardClicksControllerViewController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)SHSKeyboardClicksControllerViewController;
  -[SHSKeyboardClicksControllerViewController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  v4 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SHS_BundleForSoundsAndHapticsSettingsFramework();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithKey:table:locale:bundleURL:", CFSTR("KEYBOARD_FEEDBACK"), CFSTR("Sounds"), v5, v7);

  objc_msgSend(MEMORY[0x24BDD19B8], "shs_rootPaneComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Sounds/KEYBOARD_FEEDBACK"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSKeyboardClicksControllerViewController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.sound"), v8, v10, v11);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)MEMORY[0x24BE75590];
    SHS_LocalizedStringForSounds(CFSTR("SOUND"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, sel__setSoundValue_specifier_, sel_readPreferenceValue_, 0, 6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setProperty:forKey:", CFSTR("com.apple.preferences.sounds"), *MEMORY[0x24BE759E8]);
    objc_msgSend(v7, "setProperty:forKey:", CFSTR("keyboard-audio"), *MEMORY[0x24BE75B50]);
    objc_msgSend(v7, "setProperty:forKey:", CFSTR("com.apple.preferences.sounds.changed"), *MEMORY[0x24BE75D98]);
    objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759E0]);
    v8 = (void *)MEMORY[0x24BE75590];
    SHS_LocalizedStringForSounds(CFSTR("HAPTIC"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, sel__setHapticValue_specifier_, sel__hapticValue_, 0, 6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v7;
    v14[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v11 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v11;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_setSoundValue:(id)a3 specifier:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;

  -[SHSKeyboardClicksControllerViewController setPreferenceValue:specifier:](self, "setPreferenceValue:specifier:", a3, a4);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDD13F0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", v6, v7);

  -[SHSKeyboardClicksControllerViewController _updateReloadSpecifierInParentController](self, "_updateReloadSpecifierInParentController");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.preferences.sounds.keyboard-audio.changed"), 0, 0, 1u);
}

- (id)_hapticValue:(id)a3
{
  void *v3;
  _BOOL8 v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBD6F8], "sharedPreferencesController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "visceral") != 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setHapticValue:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v7;

  if (objc_msgSend(a3, "BOOLValue"))
    v5 = 2;
  else
    v5 = 0;
  objc_msgSend(MEMORY[0x24BEBD6F8], "sharedPreferencesController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVisceral:", v5);
  -[SHSKeyboardClicksControllerViewController _updateReloadSpecifierInParentController](self, "_updateReloadSpecifierInParentController");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.keyboard.preferences.haptic-feedback.changed"), 0, 0, 1u);

}

- (void)_updateReloadSpecifierInParentController
{
  id v3;
  void *v4;
  id v5;

  -[SHSKeyboardClicksControllerViewController parentController](self, "parentController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v5;
    -[SHSKeyboardClicksControllerViewController specifier](self, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadSpecifier:", v4);

  }
}

@end
