@implementation RMLog(storeKeychainController)

+ (id)storeKeychainController
{
  if (storeKeychainController_onceToken != -1)
    dispatch_once(&storeKeychainController_onceToken, &__block_literal_global_12);
  return (id)storeKeychainController_result;
}

@end
