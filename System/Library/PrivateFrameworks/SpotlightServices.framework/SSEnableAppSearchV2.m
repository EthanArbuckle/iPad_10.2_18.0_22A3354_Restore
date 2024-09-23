@implementation SSEnableAppSearchV2

uint64_t __SSEnableAppSearchV2_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  SSEnableAppSearchV2_featureEnabled = result;
  return result;
}

@end
