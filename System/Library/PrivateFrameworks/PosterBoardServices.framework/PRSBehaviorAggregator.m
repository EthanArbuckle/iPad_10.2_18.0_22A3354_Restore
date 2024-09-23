@implementation PRSBehaviorAggregator

+ (BOOL)supportsPosterCustomization
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSharedIPad") ^ 1;

  return v3;
}

- (PRSBehaviorAggregator)initWithIdentifier:(id)a3
{
  id v5;
  PRSBehaviorAggregator *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PRSBehaviorAggregator;
  v6 = -[PRSBehaviorAggregator init](&v8, sel_init);
  if (v6 == self)
    objc_storeStrong((id *)&self->_identifier, a3);

  return v6;
}

+ (PRSBehaviorAggregator)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_13);
  return (PRSBehaviorAggregator *)(id)sharedInstance___aggregator;
}

void __39__PRSBehaviorAggregator_sharedInstance__block_invoke()
{
  PRSBehaviorAggregator *v0;
  void *v1;

  v0 = -[PRSBehaviorAggregator initWithIdentifier:]([PRSBehaviorAggregator alloc], "initWithIdentifier:", CFSTR("com.apple.PosterBoard"));
  v1 = (void *)sharedInstance___aggregator;
  sharedInstance___aggregator = (uint64_t)v0;

}

+ (BOOL)shouldUseSharedDataStore
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSharedIPad");

  return v3;
}

- (NSURL)sharedDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  BSSystemSharedDirectoryForIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSURL)sharedResourcesDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  BSSystemSharedResourcesDirectoryForIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

+ (NSString)dataStoreContainerDirectoryPath
{
  if (objc_msgSend(a1, "shouldUseSharedDataStore"))
    return (NSString *)CFSTR("/var/containers/Data/System/");
  else
    return (NSString *)CFSTR("/var/mobile/Containers/Data/Application/");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
