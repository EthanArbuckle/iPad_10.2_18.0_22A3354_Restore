@implementation DBSMostDisplaySpaceEnabled

uint64_t __DBSMostDisplaySpaceEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  DBSMostDisplaySpaceEnabled__isMostDisplaySpaceEnabled = result;
  return result;
}

@end
