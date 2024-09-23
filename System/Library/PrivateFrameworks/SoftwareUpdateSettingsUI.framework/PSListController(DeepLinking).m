@implementation PSListController(DeepLinking)

- (void)addNavigationEventForSystemSettings:()DeepLinking
{
  id location[2];
  id v4;

  v4 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  objc_msgSend(v4, "addNavigationEventForSystemSettings:andRelativeLinkToSoftwareUpdate:", location[0], 0);
  objc_storeStrong(location, 0);
}

- (void)addNavigationEventForSystemSettings:()DeepLinking andRelativeLinkToSoftwareUpdate:
{
  __CFString *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;
  char v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  void *v20;
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v15 = 0;
  if (v18)
  {
    v16 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("settings-navigation://com.apple.Settings.General/SOFTWARE_UPDATE_LINK"), v18);
    v15 = 1;
    v4 = (__CFString *)v16;
  }
  else
  {
    v4 = CFSTR("settings-navigation://com.apple.Settings.General/SOFTWARE_UPDATE_LINK");
  }
  v17 = v4;
  if ((v15 & 1) != 0)

  v7 = v20;
  v6 = objc_alloc(MEMORY[0x24BDD19B8]);
  v5 = location[0];
  v12 = (id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (id)objc_msgSend(v11, "bundleURL");
  v9 = (id)objc_msgSend(v6, "initWithKey:table:locale:bundleURL:", v5, 0, v12);
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v17);
  objc_msgSend(v7, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.gear"), v9, MEMORY[0x24BDBD1A8]);

  v14 = _SUSUILoggingFacility();
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v21, (uint64_t)"-[PSListController(DeepLinking) addNavigationEventForSystemSettings:andRelativeLinkToSoftwareUpdate:]", (uint64_t)v17);
    _os_log_impl(&dword_21BF33000, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "%s: NavigationEventForSystemSettings added to '%@'", v21, 0x16u);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

@end
