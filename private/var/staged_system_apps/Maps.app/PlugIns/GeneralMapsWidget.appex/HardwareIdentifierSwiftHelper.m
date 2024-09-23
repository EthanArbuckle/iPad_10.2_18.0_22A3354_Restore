@implementation HardwareIdentifierSwiftHelper

+ (void)configureGEOServiceTraitsAndClientCapabilitiesHardwareIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hardwareIdentifier"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  objc_msgSend(v3, "setDefaultTraitsHardwareIdentifier:", v5);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  objc_msgSend(v4, "setClientCapabilitiesHardwareIdentifier:", v5);

}

@end
