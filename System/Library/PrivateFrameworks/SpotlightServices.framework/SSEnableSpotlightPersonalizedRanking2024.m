@implementation SSEnableSpotlightPersonalizedRanking2024

uint64_t __SSEnableSpotlightPersonalizedRanking2024_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  SSEnableSpotlightPersonalizedRanking2024_enabled = result;
  return result;
}

@end
