@implementation RMLog(configurationSubscriberClient)

+ (id)configurationSubscriberClient
{
  if (configurationSubscriberClient_onceToken != -1)
    dispatch_once(&configurationSubscriberClient_onceToken, &__block_literal_global_4);
  return (id)configurationSubscriberClient_result;
}

@end
