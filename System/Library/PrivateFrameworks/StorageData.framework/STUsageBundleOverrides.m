@implementation STUsageBundleOverrides

- (STUsageBundleOverrides)initWithDictionary:(id)a3
{
  id v4;
  STUsageBundleOverrides *v5;
  STUsageBundleOverrides *v6;
  _QWORD v8[4];
  STUsageBundleOverrides *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STUsageBundleOverrides;
  v5 = -[STUsageBundleOverrides init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __45__STUsageBundleOverrides_initWithDictionary___block_invoke;
    v8[3] = &unk_24C75FB20;
    v9 = v5;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  return v6;
}

uint64_t __45__STUsageBundleOverrides_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", a3, a2);
}

+ (id)overrides
{
  if (overrides_onceToken != -1)
    dispatch_once(&overrides_onceToken, &__block_literal_global_5);
  return (id)_bundleOverrides;
}

void __35__STUsageBundleOverrides_overrides__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  STUsageBundleOverrides *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  _QWORD v25[4];
  _QWORD v26[5];

  v26[4] = *MEMORY[0x24BDAC8D0];
  v23 = CFSTR("ignore");
  v24 = &unk_24C768A08;
  v25[0] = CFSTR("MailUsage.bundle");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v0;
  v25[1] = CFSTR("MessagesUsagePreferencesPlugin.bundle");
  v21 = CFSTR("ignore");
  v22 = &unk_24C768A08;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v1;
  v25[2] = CFSTR("SoftwareUpdateUsage.bundle");
  v19 = CFSTR("replaceWithZeroSizeApp");
  v20 = CFSTR("com.apple.Preferences");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v2;
  v25[3] = CFSTR("VisualVoicemailUsage.bundle");
  v17 = CFSTR("replaceWithZeroSizeApp");
  v18 = CFSTR("com.apple.mobilephone");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __35__STUsageBundleOverrides_overrides__block_invoke_55;
  v15 = &unk_24C75FB20;
  v6 = v5;
  v16 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v12);
  v7 = (void *)_bundleOverrides;
  _bundleOverrides = (uint64_t)v6;
  v8 = v6;

  v9 = [STUsageBundleOverrides alloc];
  v10 = -[STUsageBundleOverrides initWithDictionary:](v9, "initWithDictionary:", MEMORY[0x24BDBD1B8], v12, v13, v14, v15);
  v11 = (void *)_defaultBundleOverrides;
  _defaultBundleOverrides = v10;

}

void __35__STUsageBundleOverrides_overrides__block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  STUsageBundleOverrides *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[STUsageBundleOverrides initWithDictionary:]([STUsageBundleOverrides alloc], "initWithDictionary:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

+ (id)overridesFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(a1, "overrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)_defaultBundleOverrides;
  if (v6)
    v7 = v6;
  v8 = v7;

  return v8;
}

- (BOOL)ignore
{
  return self->_ignore;
}

- (NSString)replaceWithZeroSizeApp
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceWithZeroSizeApp, 0);
}

@end
