@implementation RMLog(configurationMultipleApplicator)

+ (id)configurationMultipleApplicator
{
  if (configurationMultipleApplicator_onceToken != -1)
    dispatch_once(&configurationMultipleApplicator_onceToken, &__block_literal_global_2);
  return (id)configurationMultipleApplicator_result;
}

@end
