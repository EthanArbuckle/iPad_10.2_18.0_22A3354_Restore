@implementation TIAggdReporter

+ (id)sharedAggdReporter
{
  if (__testingInstance)
    return (id)__testingInstance;
  +[TIAggdReporter singletonInstance](TIAggdReporter, "singletonInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken != -1)
    dispatch_once(&singletonInstance_onceToken, &__block_literal_global_660);
  return (id)singletonInstance_singletonInstance;
}

void __35__TIAggdReporter_singletonInstance__block_invoke()
{
  TIAggdReporter *v0;
  void *v1;

  v0 = objc_alloc_init(TIAggdReporter);
  v1 = (void *)singletonInstance_singletonInstance;
  singletonInstance_singletonInstance = (uint64_t)v0;

}

- (int)commit
{
  return 0;
}

+ (id)getDefaultSoftwareLayout
{
  void *v2;

  v2 = (void *)__testingInstance;
  if (__testingInstance)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend((id)__testingInstance, "performSelector:", sel_getDefaultSoftwareLayout);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

+ (void)setSharedAggdReporter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)__testingInstance != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&__testingInstance, a3);
    v4 = v5;
  }

}

@end
