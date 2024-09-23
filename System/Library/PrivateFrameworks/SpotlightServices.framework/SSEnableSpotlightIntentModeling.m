@implementation SSEnableSpotlightIntentModeling

uint64_t __SSEnableSpotlightIntentModeling_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  SSEnableSpotlightIntentModeling_enabled = result;
  return result;
}

@end
