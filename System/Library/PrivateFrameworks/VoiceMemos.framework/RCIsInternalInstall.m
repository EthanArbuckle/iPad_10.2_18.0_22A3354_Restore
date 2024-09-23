@implementation RCIsInternalInstall

uint64_t __RCIsInternalInstall_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_ui();
  RCIsInternalInstall_isInternalInstall = result;
  return result;
}

@end
