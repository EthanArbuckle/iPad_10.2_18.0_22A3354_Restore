@implementation StolenDeviceProtectionWrapper

+ (BOOL)isRatchetFeatureAvailable
{
  return objc_msgSend(getPSUIDeviceTakeOverControllerClass(), "isRatchetFeatureAvailable");
}

+ (BOOL)isRatchetEnabled
{
  id v2;
  char v3;

  v2 = objc_alloc_init((Class)getPSUIDeviceTakeOverControllerClass());
  v3 = objc_msgSend(v2, "isRatchetEnabled");

  return v3;
}

@end
