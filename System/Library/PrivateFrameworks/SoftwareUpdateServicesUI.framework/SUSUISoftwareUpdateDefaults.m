@implementation SUSUISoftwareUpdateDefaults

- (SUSUISoftwareUpdateDefaults)init
{
  id v2;
  id v4;
  id v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id v11;
  id location;
  SUSUISoftwareUpdateDefaults *v13;

  location = self;
  v6 = (id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v7 = (id)objc_msgSend(v6, "bundleIdentifier");
  v10 = 0;
  v8 = 0;
  if ((objc_msgSend(v7, "isEqualToString:", init_springBoardBundleIdentifier) & 1) != 0)
  {
    v11 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = 1;
    v4 = v11;
  }
  else
  {
    v2 = objc_alloc(MEMORY[0x24BDBCF50]);
    v9 = (id)objc_msgSend(v2, "initWithSuiteName:", init_springBoardBundleIdentifier);
    v8 = 1;
    v4 = v9;
  }
  location = -[SUSUISoftwareUpdateDefaults _initWithLegacyDefaults:](self, "_initWithLegacyDefaults:", v4, v4);
  v13 = (SUSUISoftwareUpdateDefaults *)location;
  if ((v8 & 1) != 0)

  if ((v10 & 1) != 0)
  objc_storeStrong(&location, 0);
  return v13;
}

- (id)_initWithLegacyDefaults:(id)a3
{
  SUSUISoftwareUpdateDefaults *v3;
  SUSUISoftwareUpdateDefaults *v5;
  SUSUISoftwareUpdateDefaults *v6;
  id location[2];
  SUSUISoftwareUpdateDefaults *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6 = -[BSAbstractDefaultDomain _initWithDomain:](v3, "_initWithDomain:", CFSTR("com.apple.softwareupdateservices.ui.ios"));
  v8 = v6;
  objc_storeStrong((id *)&v8, v6);
  if (v6)
    objc_storeStrong((id *)&v8->_sbLegacyDefaults, location[0]);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (void)_bindAndRegisterDefaults
{
  id v3;
  id v4;
  id v5;

  v3 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "lastOSVersion");
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:");

  v4 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "softwareUpdateState");
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:");

  v5 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "needsAlertPresentationAfterOTAUpdate");
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:");

}

- (void)migrateAndClearLegacyPreferences
{
  id v2;

  -[SUSUISoftwareUpdateDefaults _migrateLegacySpringBoardPreferences](self, "_migrateLegacySpringBoardPreferences");
  -[SUSUISoftwareUpdateDefaults _clearLegacySpringBoardPreferences](self, "_clearLegacySpringBoardPreferences");
  -[SUSUISoftwareUpdateDefaults setNeedsAlertPresentationAfterOTAUpdate:](self, "setNeedsAlertPresentationAfterOTAUpdate:", 0);
  v2 = -[BSAbstractDefaultDomain _store](self, "_store");
  objc_msgSend(v2, "synchronize");

}

- (void)_migrateLegacySpringBoardPreferences
{
  SUSUIPreferences *v2;
  NSObject *log;
  os_log_type_t type;
  id v5;
  char v6;
  uint8_t v7[7];
  os_log_type_t v8;
  id location;
  char v10;
  char v11;
  char v12;
  id v13[2];
  SUSUISoftwareUpdateDefaults *v14;

  v14 = self;
  v13[1] = (id)a2;
  v13[0] = -[NSUserDefaults dictionaryForKey:](self->_sbLegacyDefaults, "dictionaryForKey:", CFSTR("SBBootTransitionContext"));
  v5 = (id)objc_msgSend(v13[0], "valueForKey:", CFSTR("__fromOTASoftwareUpdate"));
  v6 = objc_msgSend(v5, "BOOLValue");

  v12 = v6 & 1;
  v11 = 0;
  v11 = -[NSUserDefaults BOOLForKey:](v14->_sbLegacyDefaults, "BOOLForKey:", CFSTR("SBFromOTASoftwareUpdate"));
  v10 = -[SUSUISoftwareUpdateDefaults needsAlertPresentationAfterOTAUpdate](v14, "needsAlertPresentationAfterOTAUpdate") & 1;
  if ((v11 & 1) != 0 || (v12 & 1) != 0 || (v10 & 1) != 0)
  {
    location = SUSUILog();
    v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = location;
      type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_impl(&dword_218F45000, log, type, "Found legacy needOTAAlert preference", v7, 2u);
    }
    objc_storeStrong(&location, 0);
    v2 = +[SUSUIPreferences sharedInstance](SUSUIPreferences, "sharedInstance");
    -[SUSUIPreferences setNeedsAlertPresentationAfterOTAUpdate:](v2, "setNeedsAlertPresentationAfterOTAUpdate:", 1);

  }
  objc_storeStrong(v13, 0);
}

- (void)_clearLegacySpringBoardPreferences
{
  -[NSUserDefaults removeObjectForKey:](self->_sbLegacyDefaults, "removeObjectForKey:", CFSTR("SBFromOTASoftwareUpdate"));
  -[NSUserDefaults removeObjectForKey:](self->_sbLegacyDefaults, "removeObjectForKey:", CFSTR("SBSoftwareUpdateBadgedSettings"));
  -[NSUserDefaults removeObjectForKey:](self->_sbLegacyDefaults, "removeObjectForKey:", CFSTR("SBSoftwareUpdateOSVersion"));
  -[NSUserDefaults removeObjectForKey:](self->_sbLegacyDefaults, "removeObjectForKey:", CFSTR("SBSoftwareUpdateState"));
  -[NSUserDefaults synchronize](self->_sbLegacyDefaults, "synchronize");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbLegacyDefaults, 0);
}

@end
