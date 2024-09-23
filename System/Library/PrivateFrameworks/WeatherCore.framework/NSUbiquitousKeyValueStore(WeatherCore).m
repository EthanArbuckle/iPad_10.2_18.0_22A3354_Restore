@implementation NSUbiquitousKeyValueStore(WeatherCore)

+ (id)wc_sharedInstance
{
  if (wc_sharedInstance_onceToken != -1)
    dispatch_once(&wc_sharedInstance_onceToken, &__block_literal_global_0);
  return (id)wc_sharedInstance_sSharedInstance;
}

@end
