@implementation MBSettingsContext

+ (id)defaultSettingsContext
{
  return objc_alloc_init(MBSettingsContext);
}

- (MBSettingsContext)init
{
  MBSettingsContext *v2;
  MBMobileInstallation *v3;
  MBMobileInstallation *v4;
  MBMobileInstallation *mobileInstallation;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MBSettingsContext;
  v2 = -[MBSettingsContext init](&v11, "init");
  if (v2)
  {
    v3 = [MBMobileInstallation alloc];
    v4 = -[MBMobileInstallation initWithSafeHarborDir:](v3, "initWithSafeHarborDir:", kMBSafeHarborDir);
    mobileInstallation = v2->_mobileInstallation;
    v2->_mobileInstallation = v4;

    v6 = (void *)CFPreferencesCopyValue(CFSTR("SafeHarborExpirationPeriod"), CFSTR("com.apple.MobileBackup"), kMBMobileUserName, kCFPreferencesAnyHost);
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      v9 = v8;
    }
    else
    {
      sub_100081D30();
      v9 = 0x4143C68000000000;
    }

    *(_QWORD *)&v2->_safeHarborExpiration = v9;
    v2->_backupPolicy = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMobileInstallation:", self->_mobileInstallation);
  objc_msgSend(v4, "setSafeHarborExpiration:", self->_safeHarborExpiration);
  objc_msgSend(v4, "setShouldPreserveSettings:", self->_shouldPreserveSettings);
  objc_msgSend(v4, "setBackupPolicy:", self->_backupPolicy);
  return v4;
}

- (MBMobileInstallation)mobileInstallation
{
  return self->_mobileInstallation;
}

- (void)setMobileInstallation:(id)a3
{
  objc_storeStrong((id *)&self->_mobileInstallation, a3);
}

- (double)safeHarborExpiration
{
  return self->_safeHarborExpiration;
}

- (void)setSafeHarborExpiration:(double)a3
{
  self->_safeHarborExpiration = a3;
}

- (BOOL)shouldPreserveSettings
{
  return self->_shouldPreserveSettings;
}

- (void)setShouldPreserveSettings:(BOOL)a3
{
  self->_shouldPreserveSettings = a3;
}

- (BOOL)shouldRestoreSystemFiles
{
  return self->_shouldRestoreSystemFiles;
}

- (void)setShouldRestoreSystemFiles:(BOOL)a3
{
  self->_shouldRestoreSystemFiles = a3;
}

- (NSArray)plugins
{
  return self->_plugins;
}

- (void)setPlugins:(id)a3
{
  objc_storeStrong((id *)&self->_plugins, a3);
}

- (int64_t)backupPolicy
{
  return self->_backupPolicy;
}

- (void)setBackupPolicy:(int64_t)a3
{
  self->_backupPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugins, 0);
  objc_storeStrong((id *)&self->_mobileInstallation, 0);
}

@end
