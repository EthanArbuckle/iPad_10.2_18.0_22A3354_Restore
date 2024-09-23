@implementation RMLog(statusPublisherDelegate)

+ (id)statusPublisherDelegate
{
  if (statusPublisherDelegate_onceToken != -1)
    dispatch_once(&statusPublisherDelegate_onceToken, &__block_literal_global_10);
  return (id)statusPublisherDelegate_result;
}

@end
