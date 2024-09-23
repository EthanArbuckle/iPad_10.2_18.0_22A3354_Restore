@implementation VUIAppUserDefaults

- (id)dataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[VUIAppUserDefaults _isWLKDomain:](self, "_isWLKDomain:", v4))
    objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
  else
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  if (-[VUIAppUserDefaults _isWLKDomain:](self, "_isWLKDomain:", v6))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v6);

    objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v7, v6);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  }
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronize");

}

- (void)removeDataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (-[VUIAppUserDefaults _isWLKDomain:](self, "_isWLKDomain:", v4))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v4);

    objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v4);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  }
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronize");

}

+ (id)sharedUserDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__VUIAppUserDefaults_sharedUserDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedUserDefaults_onceToken != -1)
    dispatch_once(&sharedUserDefaults_onceToken, block);
  return (id)sharedUserDefaults_userDefaults;
}

void __40__VUIAppUserDefaults_sharedUserDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedUserDefaults_userDefaults;
  sharedUserDefaults_userDefaults = v0;

}

- (BOOL)_isWLKDomain:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("FeatureEnablementAdditionalFlags"));
}

@end
