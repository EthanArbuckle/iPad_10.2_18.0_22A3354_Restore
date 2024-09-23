@implementation RMLog(profilesController)

+ (id)profilesController
{
  if (profilesController_onceToken != -1)
    dispatch_once(&profilesController_onceToken, &__block_literal_global_15);
  return (id)profilesController_result;
}

@end
