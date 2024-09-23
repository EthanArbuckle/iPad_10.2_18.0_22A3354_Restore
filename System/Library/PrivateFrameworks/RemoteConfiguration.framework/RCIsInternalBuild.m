@implementation RCIsInternalBuild

uint64_t __RCIsInternalBuild_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  RCIsInternalBuild_internalBuild = result;
  return result;
}

@end
