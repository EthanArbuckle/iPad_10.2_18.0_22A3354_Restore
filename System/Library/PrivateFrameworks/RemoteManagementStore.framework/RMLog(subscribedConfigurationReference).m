@implementation RMLog(subscribedConfigurationReference)

+ (id)subscribedConfigurationReference
{
  if (subscribedConfigurationReference_onceToken != -1)
    dispatch_once(&subscribedConfigurationReference_onceToken, &__block_literal_global_16);
  return (id)subscribedConfigurationReference_result;
}

@end
