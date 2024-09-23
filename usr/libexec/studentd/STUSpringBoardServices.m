@implementation STUSpringBoardServices

+ (NSArray)applicationDisplayIdentifiers
{
  return (NSArray *)(id)SBSCopyApplicationDisplayIdentifiers(0, 0);
}

+ (NSString)applicationDisplayIdentifiersChangedNotificationName
{
  return (NSString *)CFSTR("com.apple.springboard.display-identifiers.changed");
}

+ (NSString)applicationLaunchFromURLOptionUnlockDeviceKey
{
  return (NSString *)SBSApplicationLaunchFromURLOptionUnlockDeviceKey;
}

@end
