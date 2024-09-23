@implementation REDataSourceLoaderConfiguration

- (Class)desiredClassForLoader
{
  return (Class)objc_opt_class();
}

- (Class)desiredClassFromBundle:(id)a3 forKey:(id)a4
{
  __CFString *v5;
  void *v6;

  v5 = (__CFString *)a4;
  if (!v5)
    v5 = CFSTR("REPrimaryDataSourceKey");
  objc_msgSend(a3, "dataSourceClassForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_38);
  return (id)sharedInstance_Shared;
}

void __49__REDataSourceLoaderConfiguration_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_Shared;
  sharedInstance_Shared = v0;

}

- (BOOL)shouldLoadBundleClass:(Class)a3 forKey:(id)a4
{
  __CFString *v4;
  char v5;

  v4 = (__CFString *)a4;
  if (!v4)
    v4 = CFSTR("REPrimaryDataSourceKey");
  if ((-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("REPrimaryDataSourceKey")) & 1) != 0)
    v5 = 1;
  else
    v5 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("REDemoDataSourceKey"));

  return v5;
}

@end
