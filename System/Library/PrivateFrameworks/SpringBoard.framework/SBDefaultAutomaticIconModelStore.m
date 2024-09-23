@implementation SBDefaultAutomaticIconModelStore

+ (SBDefaultAutomaticIconModelStore)sharedInstance
{
  if (sharedInstance___once_25 != -1)
    dispatch_once(&sharedInstance___once_25, &__block_literal_global_26_4);
  return (SBDefaultAutomaticIconModelStore *)(id)sharedInstance___instance_24;
}

void __50__SBDefaultAutomaticIconModelStore_sharedInstance__block_invoke()
{
  SBDefaultAutomaticIconModelStore *v0;
  void *v1;

  v0 = objc_alloc_init(SBDefaultAutomaticIconModelStore);
  v1 = (void *)sharedInstance___instance_24;
  sharedInstance___instance_24 = (uint64_t)v0;

}

- (SBDefaultAutomaticIconModelStore)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBDefaultAutomaticIconModelStore *v9;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(CFSTR("~/Library/SpringBoard/AutomaticIconState.plist"), "stringByExpandingTildeInPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(CFSTR("~/Library/SpringBoard/DesiredAutomaticIconState.plist"), "stringByExpandingTildeInPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBIconModelPropertyListFileStore initWithIconStateURL:desiredIconStateURL:](self, "initWithIconStateURL:desiredIconStateURL:", v5, v8);

  return v9;
}

@end
