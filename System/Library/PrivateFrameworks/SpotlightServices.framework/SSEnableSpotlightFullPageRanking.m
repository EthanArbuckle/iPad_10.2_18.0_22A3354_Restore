@implementation SSEnableSpotlightFullPageRanking

uint64_t __SSEnableSpotlightFullPageRanking_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  SSEnableSpotlightFullPageRanking_featureEnabled = result;
  return result;
}

@end
