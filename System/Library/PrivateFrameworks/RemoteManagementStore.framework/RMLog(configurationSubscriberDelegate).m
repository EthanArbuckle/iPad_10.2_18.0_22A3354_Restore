@implementation RMLog(configurationSubscriberDelegate)

+ (id)configurationSubscriberDelegate
{
  if (configurationSubscriberDelegate_onceToken != -1)
    dispatch_once(&configurationSubscriberDelegate_onceToken, &__block_literal_global_5);
  return (id)configurationSubscriberDelegate_result;
}

@end
