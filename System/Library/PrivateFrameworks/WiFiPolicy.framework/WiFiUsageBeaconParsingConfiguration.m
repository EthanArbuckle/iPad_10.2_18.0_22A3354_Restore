@implementation WiFiUsageBeaconParsingConfiguration

+ (void)initialize
{
  void *v2;

  v2 = (void *)_beaconParsing;
  _beaconParsing = 0;

}

+ (void)setConfig:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToDictionary:", _beaconParsing) & 1) == 0)
  {
    objc_storeStrong((id *)&_beaconParsing, a3);
    +[WiFiUsageParsedBeacon updateConfig](WiFiUsageParsedBeacon, "updateConfig");
    NSLog(CFSTR("%s: Updated WiFiUsageParsedBeacon config from Mobile Assets"), "+[WiFiUsageBeaconParsingConfiguration setConfig:]");
  }

}

+ (id)getConfigForKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (_beaconParsing)
  {
    objc_msgSend((id)_beaconParsing, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      NSLog(CFSTR("%s: %@ does not contain %@"), "+[WiFiUsageBeaconParsingConfiguration getConfigForKey:]", CFSTR("BeaconParsing"), v3);
  }
  else
  {
    NSLog(CFSTR("%s: Feature %@ hasn't been initialized yet, waiting on MobileAssets callback"), "+[WiFiUsageBeaconParsingConfiguration getConfigForKey:]", CFSTR("BeaconParsing"));
    v4 = 0;
  }

  return v4;
}

@end
