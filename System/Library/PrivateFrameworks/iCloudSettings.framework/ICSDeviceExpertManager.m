@implementation ICSDeviceExpertManager

+ (_NSLocalizedStringResource)appleAccountTitle
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithKey:table:locale:bundleURL:", CFSTR("TITLE_APPLE_ACCOUNT"), CFSTR("Localizable-iCloud"), v3, v5);

  return (_NSLocalizedStringResource *)v6;
}

+ (_NSLocalizedStringResource)iCloudTitle
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithKey:table:locale:bundleURL:", CFSTR("TITLE_ICLOUD"), CFSTR("Localizable-iCloud"), v3, v5);

  return (_NSLocalizedStringResource *)v6;
}

+ (_NSLocalizedStringResource)manageStorageTitle
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithKey:table:locale:bundleURL:", CFSTR("MANAGE_STORAGE_TITLE_FALLBACK"), CFSTR("Localizable-iCloud"), v3, v5);

  return (_NSLocalizedStringResource *)v6;
}

+ (_NSLocalizedStringResource)backupTitle
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithKey:table:locale:bundleURL:", CFSTR("BACKUP_HEADER_TITLE"), CFSTR("Localizable-Backup"), v3, v5);

  return (_NSLocalizedStringResource *)v6;
}

+ (_NSLocalizedStringResource)savedToiCloudTitle
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithKey:table:locale:bundleURL:", CFSTR("TITLE_SAVED_TO_ICLOUD"), CFSTR("Localizable-iCloud"), v3, v5);

  return (_NSLocalizedStringResource *)v6;
}

@end
