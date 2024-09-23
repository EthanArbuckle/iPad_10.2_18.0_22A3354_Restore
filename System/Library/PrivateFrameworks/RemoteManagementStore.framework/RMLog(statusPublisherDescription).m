@implementation RMLog(statusPublisherDescription)

+ (id)statusPublisherDescription
{
  if (statusPublisherDescription_onceToken != -1)
    dispatch_once(&statusPublisherDescription_onceToken, &__block_literal_global_11);
  return (id)statusPublisherDescription_result;
}

@end
