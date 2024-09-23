@implementation RMLog(profilesAdapter)

+ (id)profilesAdapter
{
  if (profilesAdapter_onceToken != -1)
    dispatch_once(&profilesAdapter_onceToken, &__block_literal_global_14);
  return (id)profilesAdapter_result;
}

@end
