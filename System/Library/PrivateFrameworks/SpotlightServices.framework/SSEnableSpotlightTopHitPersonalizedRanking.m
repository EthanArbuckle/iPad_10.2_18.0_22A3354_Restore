@implementation SSEnableSpotlightTopHitPersonalizedRanking

uint64_t __SSEnableSpotlightTopHitPersonalizedRanking_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  SSEnableSpotlightTopHitPersonalizedRanking_featureEnabled = result;
  return result;
}

@end
