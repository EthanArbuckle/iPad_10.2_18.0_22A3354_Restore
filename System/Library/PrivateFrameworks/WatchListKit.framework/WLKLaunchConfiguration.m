@implementation WLKLaunchConfiguration

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_30);
  return (id)sharedInstance_sharedInstance_0;
}

void __40__WLKLaunchConfiguration_sharedInstance__block_invoke()
{
  WLKLaunchConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(WLKLaunchConfiguration);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (BOOL)useSharedURLSession
{
  return self->_useSharedURLSession;
}

- (void)setUseSharedURLSession:(BOOL)a3
{
  self->_useSharedURLSession = a3;
}

- (BOOL)alwaysPrefetchAppConfiguration
{
  return self->_alwaysPrefetchAppConfiguration;
}

- (void)setAlwaysPrefetchAppConfiguration:(BOOL)a3
{
  self->_alwaysPrefetchAppConfiguration = a3;
}

@end
