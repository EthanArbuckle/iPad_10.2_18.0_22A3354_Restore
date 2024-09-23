@implementation REBundleCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  return (id)sharedInstance_SharedCache;
}

void __31__REBundleCache_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_SharedCache;
  sharedInstance_SharedCache = v0;

}

- (REBundleCache)init
{
  REBundleCache *v2;
  REConcurrentDictionary *v3;
  REConcurrentDictionary *cachedBundles;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REBundleCache;
  v2 = -[REBundleCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(REConcurrentDictionary);
    cachedBundles = v2->_cachedBundles;
    v2->_cachedBundles = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)REBundleCache;
  -[REBundleCache dealloc](&v2, sel_dealloc);
}

- (id)bundleAtPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  objc_msgSend(a3, "stringByStandardizingPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[REConcurrentDictionary objectForKeyedSubscript:](self->_cachedBundles, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("NSPrincipalClass"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v5, "load");
        -[REConcurrentDictionary setObject:forKeyedSubscript:](self->_cachedBundles, "setObject:forKeyedSubscript:", v5, v4);
      }
      else
      {
        RELogForDomain(0);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[REBundleCache bundleAtPath:].cold.1((uint64_t)v4, v7);

      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedBundles, 0);
}

- (void)bundleAtPath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "Skipping %@ - No NSPrincipalClass", (uint8_t *)&v2, 0xCu);
}

@end
