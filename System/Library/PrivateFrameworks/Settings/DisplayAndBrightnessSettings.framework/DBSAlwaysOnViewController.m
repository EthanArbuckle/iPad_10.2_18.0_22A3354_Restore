@implementation DBSAlwaysOnViewController

+ (id)alwaysOnSpecifierNamed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BE75590];
  v5 = a3;
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, a1, 0, sel_isAlwaysOnEnabled_, objc_opt_class(), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProperty:forKey:", CFSTR("j8/Omm6s1lsmTDFsXjsBfA"), *MEMORY[0x24BE75C30]);
  v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
  DBS_LocalizedStringForDisplays(CFSTR("ALWAYS_ON_DISABLED"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  DBS_LocalizedStringForDisplays(CFSTR("ALWAYS_ON_ENABLED"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithArray:", v10);

  objc_msgSend(v6, "setValues:titles:", &unk_24F02FB10, v11);
  return v6;
}

+ (id)isAlwaysOnEnabled:(id)a3
{
  int AppBooleanValue;
  BOOL v4;
  uint64_t v5;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 1;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SBEnableAlwaysOn"), CFSTR("com.apple.springboard"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 0;
  v5 = !v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ALWAYS_ON_DESCRIPTION_GROUP"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_LocalizedStringForDisplays(CFSTR("ALWAYS_ON_DESCRIPTION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BE75A68];
    objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75A68]);

    objc_msgSend(v5, "addObject:", v6);
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ALWAYS_ON_SECONDARY_DESCRIPTION_GROUP"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_LocalizedStringForDisplays(CFSTR("ALWAYS_ON_SECONDARY_DESCRIPTION"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v10, v8);

    objc_msgSend(v5, "addObject:", v9);
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ALWAYS_ON_DISPLAY_GROUP"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);
    -[DBSAlwaysOnViewController _alwaysOnDisplaySpecifier](self, "_alwaysOnDisplaySpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);
    objc_msgSend(v12, "performGetter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    -[DBSAlwaysOnViewController _updatesForSpecifiers:isAlwaysOnEnabled:animated:](self, "_updatesForSpecifiers:isAlwaysOnEnabled:animated:", v5, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentSpecifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setArray:", v16);

    v17 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_alwaysOnDisplaySpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  DBS_LocalizedStringForDisplays(CFSTR("ALWAYS_ON_DISPLAY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel_setAlwaysOnDisplayEnabled_specifier_, sel_readPreferenceValue_, 0, 6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setProperty:forKey:", CFSTR("ALWAYS_ON_DISPLAY"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v5, "setProperty:forKey:", CFSTR("com.apple.springboard"), *MEMORY[0x24BE759E8]);
  objc_msgSend(v5, "setProperty:forKey:", CFSTR("SBEnableAlwaysOn"), *MEMORY[0x24BE75B50]);
  objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759E0]);
  return v5;
}

- (id)_showWallpaperSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  DBS_LocalizedStringForDisplays(CFSTR("ALWAYS_ON_SHOW_WALLPAPER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel_setPreferenceValue_specifier_, sel_readPreferenceValue_, 0, 6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setProperty:forKey:", CFSTR("ALWAYS_ON_SHOW_WALLPAPER"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v5, "setProperty:forKey:", CFSTR("com.apple.springboard"), *MEMORY[0x24BE759E8]);
  objc_msgSend(v5, "setProperty:forKey:", CFSTR("SBShowWallpaperInAlwaysOn"), *MEMORY[0x24BE75B50]);
  objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759E0]);
  return v5;
}

- (id)_showNotificationsSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  DBS_LocalizedStringForDisplays(CFSTR("ALWAYS_ON_SHOW_NOTIFICATIONS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel_setPreferenceValue_specifier_, sel_readPreferenceValue_, 0, 6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setProperty:forKey:", CFSTR("ALWAYS_ON_SHOW_NOTIFICATIONS"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v5, "setProperty:forKey:", CFSTR("j8/Omm6s1lsmTDFsXjsBfA"), *MEMORY[0x24BE75C30]);
  objc_msgSend(v5, "setProperty:forKey:", CFSTR("com.apple.springboard"), *MEMORY[0x24BE759E8]);
  objc_msgSend(v5, "setProperty:forKey:", CFSTR("SBShowNotificationsInAlwaysOn"), *MEMORY[0x24BE75B50]);
  objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759E0]);
  return v5;
}

- (id)_updatesForSpecifiers:(id)a3 isAlwaysOnEnabled:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(MEMORY[0x24BE755A0], "updatesWithSpecifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "specifierForID:", CFSTR("ALWAYS_ON_DISPLAY_GROUP"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = (void *)MEMORY[0x24BE75590];
    DBS_LocalizedStringForDisplays(CFSTR("CUSTOMIZE_HEADER"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "groupSpecifierWithID:name:", CFSTR("ALWAYS_ON_CONFIGURATION_GROUP"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObject:", v14);
    -[DBSAlwaysOnViewController _showWallpaperSpecifier](self, "_showWallpaperSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v15);

    -[DBSAlwaysOnViewController _showNotificationsSpecifier](self, "_showNotificationsSpecifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v16);

    DBS_LocalizedStringForDisplays(CFSTR("ALWAYS_ON_FOOTER"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v17, *MEMORY[0x24BE75A68]);

    objc_msgSend(v9, "insertContiguousSpecifiers:atIndex:", v11, 2);
  }
  else
  {
    v18 = objc_msgSend(v8, "indexOfSpecifierWithID:", CFSTR("ALWAYS_ON_CONFIGURATION_GROUP"));
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = v18;
      objc_msgSend(v10, "removePropertyForKey:", *MEMORY[0x24BE75A68]);
      objc_msgSend(v9, "removeSpecifiersInRange:", v19, v19 + 1);
    }
  }
  objc_msgSend(v9, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAnimated:", v5);

  return v9;
}

- (void)setAlwaysOnDisplayEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  CFPreferencesSetAppValue(CFSTR("SBEnableAlwaysOn"), v5, CFSTR("com.apple.springboard"));
  v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v7 = objc_msgSend(v5, "BOOLValue");

  -[DBSAlwaysOnViewController _updatesForSpecifiers:isAlwaysOnEnabled:animated:](self, "_updatesForSpecifiers:isAlwaysOnEnabled:animated:", v6, v7, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[DBSAlwaysOnViewController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("ALWAYS_ON_DISPLAY_GROUP"));
  -[DBSAlwaysOnViewController performSpecifierUpdates:](self, "performSpecifierUpdates:", v8);

}

@end
