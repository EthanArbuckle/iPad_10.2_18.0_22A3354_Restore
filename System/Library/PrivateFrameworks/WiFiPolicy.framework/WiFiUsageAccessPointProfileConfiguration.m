@implementation WiFiUsageAccessPointProfileConfiguration

+ (void)initialize
{
  void *v2;

  v2 = (void *)_apProfileConfig;
  _apProfileConfig = 0;

}

+ (void)setConfig:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToDictionary:", _apProfileConfig) & 1) == 0)
  {
    objc_storeStrong((id *)&_apProfileConfig, a3);
    +[WiFiUsageAccessPointProfile updateConfig](WiFiUsageAccessPointProfile, "updateConfig");
    NSLog(CFSTR("%s: Updated WiFiUsageAccessPointProfile config from Mobile Assets"), "+[WiFiUsageAccessPointProfileConfiguration setConfig:]");
  }

}

+ (id)getConfigForKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (_apProfileConfig)
  {
    objc_msgSend((id)_apProfileConfig, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      NSLog(CFSTR("%s: %@ does not contain %@"), "+[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]", CFSTR("AccessPointProfile"), v3);
  }
  else
  {
    NSLog(CFSTR("%s: Feature %@ hasn't been initialized yet, waiting on MobileAssets callback"), "+[WiFiUsageAccessPointProfileConfiguration getConfigForKey:]", CFSTR("AccessPointProfile"));
    v4 = 0;
  }

  return v4;
}

@end
