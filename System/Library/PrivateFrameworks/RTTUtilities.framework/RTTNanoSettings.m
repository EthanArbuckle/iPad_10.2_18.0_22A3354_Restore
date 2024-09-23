@implementation RTTNanoSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_305 != -1)
    dispatch_once(&sharedInstance_onceToken_305, &__block_literal_global_306);
  return (id)sharedInstance_Settings_304;
}

void __33__RTTNanoSettings_sharedInstance__block_invoke()
{
  RTTNanoSettings *v0;
  void *v1;

  v0 = objc_alloc_init(RTTNanoSettings);
  v1 = (void *)sharedInstance_Settings_304;
  sharedInstance_Settings_304 = (uint64_t)v0;

}

- (RTTNanoSettings)init
{
  RTTNanoSettings *v2;
  id v3;
  uint64_t v4;
  NPSDomainAccessor *domainAccessor;
  uint64_t v6;
  NPSDomainAccessor *globalDomainAccessor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RTTNanoSettings;
  v2 = -[RTTSettings init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE6B2C0]);
    v4 = objc_msgSend(v3, "initWithDomain:", *MEMORY[0x24BED2928]);
    domainAccessor = v2->_domainAccessor;
    v2->_domainAccessor = (NPSDomainAccessor *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR(".GlobalPreferences"));
    globalDomainAccessor = v2->_globalDomainAccessor;
    v2->_globalDomainAccessor = (NPSDomainAccessor *)v6;

    if ((objc_msgSend(MEMORY[0x24BE4BD98], "currentProcessIsHeard") & 1) == 0
      && (objc_msgSend(MEMORY[0x24BE4BD98], "currentProcessIsPreferences") & 1) == 0)
    {
      -[RTTNanoSettings _setValue:forPreferenceKey:](v2, "_setValue:forPreferenceKey:", MEMORY[0x24BDBD1C8], CFSTR("TTYNanoIndependencePreference"));
    }
  }
  return v2;
}

- (id)currentLocale
{
  id v3;

  v3 = (id)-[NPSDomainAccessor synchronize](self->_globalDomainAccessor, "synchronize");
  return (id)-[NPSDomainAccessor objectForKey:](self->_globalDomainAccessor, "objectForKey:", CFSTR("AppleLocale"));
}

- (id)uuidFromContext:(id)a3
{
  return CFSTR("RTTWildcardContext");
}

- (void)_setValue:(id)a3 forPreferenceKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Setting value '%@' for key: '%@'", buf, 0x16u);
  }

  -[NPSDomainAccessor setObject:forKey:](self->_domainAccessor, "setObject:forKey:", v6, v7);
  v9 = (id)-[NPSDomainAccessor synchronize](self->_domainAccessor, "synchronize");
  v10 = (void *)objc_opt_new();
  v11 = *MEMORY[0x24BED2928];
  v12 = (void *)MEMORY[0x24BDBCF20];
  v15 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronizeNanoDomain:keys:", v11, v14);

}

- (id)valueForPreferenceKey:(id)a3 andContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (id)-[NPSDomainAccessor synchronize](self->_domainAccessor, "synchronize");
  -[NPSDomainAccessor objectForKey:](self->_domainAccessor, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Retrieved value '%@' for key: '%@'", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
  objc_storeStrong((id *)&self->_domainAccessor, a3);
}

- (NPSDomainAccessor)globalDomainAccessor
{
  return self->_globalDomainAccessor;
}

- (void)setGlobalDomainAccessor:(id)a3
{
  objc_storeStrong((id *)&self->_globalDomainAccessor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalDomainAccessor, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

@end
