@implementation ICSKeychainSyncController

+ (BOOL)isKeychainSyncEnabled
{
  return objc_msgSend(MEMORY[0x24BE1A440], "isUserVisibleKeychainSyncEnabled");
}

@end
