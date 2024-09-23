@implementation SCDAIsInternalInstall

uint64_t __SCDAIsInternalInstall_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  SCDAIsInternalInstall_isInternal = result;
  return result;
}

@end
