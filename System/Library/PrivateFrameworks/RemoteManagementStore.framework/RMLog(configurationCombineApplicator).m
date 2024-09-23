@implementation RMLog(configurationCombineApplicator)

+ (id)configurationCombineApplicator
{
  if (configurationCombineApplicator_onceToken != -1)
    dispatch_once(&configurationCombineApplicator_onceToken, &__block_literal_global_1);
  return (id)configurationCombineApplicator_result;
}

@end
