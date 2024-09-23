@implementation STFamilyCircleSpecifierProvider

+ (id)familySpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BE75590];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ScreenTimeControllerTitle"), &stru_24DB8A1D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, a1, 0, 0, objc_opt_class(), 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD640];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("ScreenTime"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_applicationIconImageForFormat:precomposed:", 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75AC8]);

  objc_msgSend(v6, "setIdentifier:", CFSTR("STSharedServicesScreenTimeSpecifierId"));
  return v6;
}

@end
