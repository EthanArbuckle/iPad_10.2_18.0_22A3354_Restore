@implementation RMLog(configurationSingleApplicator)

+ (id)configurationSingleApplicator
{
  if (configurationSingleApplicator_onceToken != -1)
    dispatch_once(&configurationSingleApplicator_onceToken, &__block_literal_global_3);
  return (id)configurationSingleApplicator_result;
}

@end
