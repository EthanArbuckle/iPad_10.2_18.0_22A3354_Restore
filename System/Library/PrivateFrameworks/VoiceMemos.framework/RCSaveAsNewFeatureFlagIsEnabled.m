@implementation RCSaveAsNewFeatureFlagIsEnabled

uint64_t __RCSaveAsNewFeatureFlagIsEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  RCSaveAsNewFeatureFlagIsEnabled_saveAsNewEnabled = result;
  return result;
}

@end
