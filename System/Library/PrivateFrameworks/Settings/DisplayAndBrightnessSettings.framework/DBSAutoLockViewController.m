@implementation DBSAutoLockViewController

- (void)loadView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DBSAutoLockViewController;
  -[DBSAutoLockViewController loadView](&v9, sel_loadView);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveValueForSetting:", *MEMORY[0x24BE637F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (int)*MEMORY[0x24BE757A8];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v5), "titleDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DBSAutoLockViewController _staticTextMessageForAutoLockTime:autoLockTimeString:](self, "_staticTextMessageForAutoLockTime:autoLockTimeString:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v5), "setProperty:forKey:", v8, *MEMORY[0x24BE75CD0]);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)DBSAutoLockViewController;
  -[DBSAutoLockViewController viewDidAppear:](&v16, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Display/AUTOLOCK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD19B8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithKey:defaultValue:table:locale:bundleURL:", CFSTR("DISPLAY_AND_BRIGHTNESS"), 0, CFSTR("Display"), v6, v8);

    v10 = objc_alloc(MEMORY[0x24BDD19B8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithKey:defaultValue:table:locale:bundleURL:", CFSTR("AUTOLOCK"), 0, CFSTR("Display"), v11, v13);

    v17[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSAutoLockViewController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.display"), v14, v15, v4);

  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DBSAutoLockViewController;
  v6 = a4;
  -[PSListItemsController tableView:didSelectRowAtIndexPath:](&v16, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "cellForRowAtIndexPath:", v6, v16.receiver, v16.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSAutoLockViewController _specifierWithName:](self, "_specifierWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "integerValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSAutoLockViewController _staticTextMessageForAutoLockTime:autoLockTimeString:](self, "_staticTextMessageForAutoLockTime:autoLockTimeString:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "specifierForID:", CFSTR("LIST_ITEMS_GROUP_SPECIFIER"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProperty:forKey:", v14, *MEMORY[0x24BE75A68]);
  -[DBSAutoLockViewController reloadSpecifier:](self, "reloadSpecifier:", v15);

}

- (id)_specifierWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__DBSAutoLockViewController__specifierWithName___block_invoke;
  v9[3] = &unk_24F025E28;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __48__DBSAutoLockViewController__specifierWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_staticTextMessageForAutoLockTime:(id)a3 autoLockTimeString:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  int v8;
  int v9;
  char v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  char v17;
  uint64_t v18;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "intValue") == 0x7FFFFFFF || objc_msgSend(v5, "intValue") == -1)
  {
    DBS_LocalizedStringForDisplays(CFSTR("DNB_AUTOLOCK_NEVER_WARNING_DESCRIPTION"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  else
  {
    v7 = &stru_24F026548;
    v8 = 1;
  }
  if ((MGGetBoolAnswer() & 1) == 0)
  {
    v15 = v7;
LABEL_12:
    v14 = v15;
    goto LABEL_13;
  }
  v9 = _AXSAttentionAwarenessFeaturesEnabled();
  v10 = v8 ^ 1;
  if (((v8 ^ 1) & 1) == 0 && v9)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = CFSTR("DNB_AUTOLOCK_ENABLED_ATTENTION_AWARENESS_ENABLED");
    goto LABEL_9;
  }
  if (v9)
    v17 = v8;
  else
    v17 = 1;
  if ((v17 & 1) == 0)
  {
    DBS_LocalizedStringForDisplays(CFSTR("DNB_AUTOLOCK_DISABLED_ATTENTION_AWARENESS_ENABLED"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (v9)
    v10 = 1;
  if ((v10 & 1) != 0)
  {
    if (v8 & 1 | (v9 != 0))
    {
      v14 = &stru_24F026548;
      goto LABEL_13;
    }
    DBS_LocalizedStringForDisplays(CFSTR("DNB_AUTOLOCK_DISABLED_ATTENTION_AWARENESS_DISABLED"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), v7, v13);
    goto LABEL_10;
  }
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = CFSTR("DNB_AUTOLOCK_ENABLED_ATTENTION_AWARENESS_DISABLED");
LABEL_9:
  DBS_LocalizedStringForDisplays(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13, v6, v18);
LABEL_10:
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v14;
}

@end
