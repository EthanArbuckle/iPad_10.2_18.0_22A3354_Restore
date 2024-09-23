@implementation WAProviderAttributionManager

+ (WAProviderAttributionManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_21);
  return (WAProviderAttributionManager *)(id)sharedManager_sharedManager;
}

void __45__WAProviderAttributionManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = v0;

}

- (WAProviderAttributionManager)init
{
  WAProviderAttributionManager *v2;
  uint64_t v3;
  NSUserDefaults *weatherUserDefaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WAProviderAttributionManager;
  v2 = -[WAProviderAttributionManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("group.com.apple.weather"));
    weatherUserDefaults = v2->_weatherUserDefaults;
    v2->_weatherUserDefaults = (NSUserDefaults *)v3;

  }
  return v2;
}

- (NSString)providerName
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  -[WAProviderAttributionManager weatherUserDefaults](self, "weatherUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("WeatherProviderName"));
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("The Weather Channel");
  return (NSString *)v4;
}

- (NSUserDefaults)weatherUserDefaults
{
  return self->_weatherUserDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weatherUserDefaults, 0);
}

@end
