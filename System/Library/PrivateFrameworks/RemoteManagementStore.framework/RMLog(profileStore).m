@implementation RMLog(profileStore)

+ (id)profileStore
{
  if (profileStore_onceToken != -1)
    dispatch_once(&profileStore_onceToken, &__block_literal_global_9);
  return (id)profileStore_result;
}

@end
