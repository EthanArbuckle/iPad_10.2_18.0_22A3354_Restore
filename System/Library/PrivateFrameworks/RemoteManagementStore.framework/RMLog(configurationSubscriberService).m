@implementation RMLog(configurationSubscriberService)

+ (id)configurationSubscriberService
{
  if (configurationSubscriberService_onceToken != -1)
    dispatch_once(&configurationSubscriberService_onceToken, &__block_literal_global_8);
  return (id)configurationSubscriberService_result;
}

@end
