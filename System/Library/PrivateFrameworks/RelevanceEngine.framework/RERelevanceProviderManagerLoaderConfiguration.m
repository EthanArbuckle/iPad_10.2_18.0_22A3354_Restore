@implementation RERelevanceProviderManagerLoaderConfiguration

- (Class)desiredClassForLoader
{
  return (Class)objc_opt_class();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_24);
  return (id)sharedInstance_Shared_0;
}

void __63__RERelevanceProviderManagerLoaderConfiguration_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_Shared_0;
  sharedInstance_Shared_0 = v0;

}

- (Class)desiredClassFromBundle:(id)a3 forKey:(id)a4
{
  return 0;
}

@end
