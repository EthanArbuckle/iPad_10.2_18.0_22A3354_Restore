@implementation RMLog(configurationSubscriberEventStream)

+ (id)configurationSubscriberEventStream
{
  if (configurationSubscriberEventStream_onceToken != -1)
    dispatch_once(&configurationSubscriberEventStream_onceToken, &__block_literal_global_7);
  return (id)configurationSubscriberEventStream_result;
}

@end
