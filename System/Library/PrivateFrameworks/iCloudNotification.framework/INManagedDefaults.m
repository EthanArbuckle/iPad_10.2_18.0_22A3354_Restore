@implementation INManagedDefaults

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance___sManagedDefaults;
}

void __35__INManagedDefaults_sharedInstance__block_invoke()
{
  INManagedDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(INManagedDefaults);
  v1 = (void *)sharedInstance___sManagedDefaults;
  sharedInstance___sManagedDefaults = (uint64_t)v0;

}

- (id)_readManagedDefaults
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", CFSTR("/Library/Managed Preferences/mobile/.GlobalPreferences.plist"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  return v2;
}

- (void)_writeManagedDefaults:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a3;
  _INLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[INManagedDefaults _writeManagedDefaults:].cold.2((uint64_t)v3, v5);

    _CFPreferencesWriteManagedDomainForUser();
    _CFPreferencesPostValuesChangedInDomains();
    _CFPreferencesManagementStatusChangedForDomains();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[INManagedDefaults _writeManagedDefaults:].cold.1(v5);

  }
}

- (id)valueForManagedDefault:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[INManagedDefaults _readManagedDefaults](self, "_readManagedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_7;
  if (!objc_msgSend(v6, "isNSNumber"))
  {
    if (objc_msgSend(v6, "isNSString"))
    {
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", objc_msgSend(v6, "intValue"));
      goto LABEL_6;
    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v7 = v6;
LABEL_6:
  v8 = v7;
LABEL_8:

  return v8;
}

- (void)setValue:(id)a3 forManagedDefault:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[INManagedDefaults _readManagedDefaults](self, "_readManagedDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setValue:forKey:", v7, v6);
  -[INManagedDefaults _writeManagedDefaults:](self, "_writeManagedDefaults:", v9);

}

- (void)_writeManagedDefaults:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219044000, log, OS_LOG_TYPE_ERROR, "No defaults dictionary!", v1, 2u);
}

- (void)_writeManagedDefaults:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_219044000, a2, OS_LOG_TYPE_DEBUG, "Writing new set of managed defaults: %@", (uint8_t *)&v2, 0xCu);
}

@end
