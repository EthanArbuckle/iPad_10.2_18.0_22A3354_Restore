@implementation RESiriActionsDonationsWhitelist

- (id)intentWhitelistedRelevanceThresholdForBundleID:(id)a3 andTypeName:(id)a4
{
  NSDictionary *whitelist;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  whitelist = self->_whitelist;
  v6 = a4;
  v7 = a3;
  -[NSDictionary objectForKeyedSubscript:](whitelist, "objectForKeyedSubscript:", CFSTR("Intents"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)intentIsWhitelistedForBundleID:(id)a3 andTypeName:(id)a4
{
  void *v4;
  BOOL v5;

  -[RESiriActionsDonationsWhitelist intentWhitelistedRelevanceThresholdForBundleID:andTypeName:](self, "intentWhitelistedRelevanceThresholdForBundleID:andTypeName:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_58);
  return (id)sharedInstance__whitelist;
}

void __49__RESiriActionsDonationsWhitelist_sharedInstance__block_invoke()
{
  RESiriActionsDonationsWhitelist *v0;
  void *v1;

  v0 = objc_alloc_init(RESiriActionsDonationsWhitelist);
  v1 = (void *)sharedInstance__whitelist;
  sharedInstance__whitelist = (uint64_t)v0;

}

- (RESiriActionsDonationsWhitelist)init
{
  RESiriActionsDonationsWhitelist *v2;
  RESiriActionsDonationsWhitelist *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *whitelist;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RESiriActionsDonationsWhitelist;
  v2 = -[RESiriActionsDonationsWhitelist init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", CFSTR("DonationsWhitelist"), CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithContentsOfFile:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    whitelist = v3->_whitelist;
    v3->_whitelist = (NSDictionary *)v7;

  }
  return v3;
}

- (id)userActivityWhitelistedRelevanceThresholdForBundleID:(id)a3 andActivityType:(id)a4
{
  NSDictionary *whitelist;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  whitelist = self->_whitelist;
  v6 = a4;
  v7 = a3;
  -[NSDictionary objectForKeyedSubscript:](whitelist, "objectForKeyedSubscript:", CFSTR("UserActivities"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)userActivityIsWhitelistedForBundleID:(id)a3 andActivityType:(id)a4
{
  void *v4;
  BOOL v5;

  -[RESiriActionsDonationsWhitelist userActivityWhitelistedRelevanceThresholdForBundleID:andActivityType:](self, "userActivityWhitelistedRelevanceThresholdForBundleID:andActivityType:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (NSSet)intentWhitelistBundleIDs
{
  os_unfair_lock_s *p_lock;
  NSSet **p_intentWhitelistBundleIDs;
  NSSet *v5;
  id v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_intentWhitelistBundleIDs = &self->_intentWhitelistBundleIDs;
  v5 = self->_intentWhitelistBundleIDs;
  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCF20]);
    -[NSDictionary objectForKeyedSubscript:](self->_whitelist, "objectForKeyedSubscript:", CFSTR("Intents"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSSet *)objc_msgSend(v6, "initWithArray:", v8);

    objc_storeStrong((id *)p_intentWhitelistBundleIDs, v5);
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (NSSet)userActivityWhitelistBundleIDs
{
  os_unfair_lock_s *p_lock;
  NSSet **p_userActivityWhitelistBundleIDs;
  NSSet *v5;
  id v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_userActivityWhitelistBundleIDs = &self->_userActivityWhitelistBundleIDs;
  v5 = self->_userActivityWhitelistBundleIDs;
  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCF20]);
    -[NSDictionary objectForKeyedSubscript:](self->_whitelist, "objectForKeyedSubscript:", CFSTR("UserActivities"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSSet *)objc_msgSend(v6, "initWithArray:", v8);

    objc_storeStrong((id *)p_userActivityWhitelistBundleIDs, v5);
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityWhitelistBundleIDs, 0);
  objc_storeStrong((id *)&self->_intentWhitelistBundleIDs, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
}

@end
