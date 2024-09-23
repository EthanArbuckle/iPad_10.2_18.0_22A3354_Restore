@implementation WFResourceManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_2 != -1)
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_21);
  return (id)sharedManager_sSharedManager;
}

void __34__WFResourceManager_sharedManager__block_invoke()
{
  WFResourceManager *v0;
  void *v1;

  v0 = objc_alloc_init(WFResourceManager);
  v1 = (void *)sharedManager_sSharedManager;
  sharedManager_sSharedManager = (uint64_t)v0;

}

- (id)tableName
{
  return CFSTR("OSX-Localizable");
}

- (id)frameworkBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

- (id)localizedStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFResourceManager frameworkBundle](self, "frameworkBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFResourceManager tableName](self, "tableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_24CCA55E8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
