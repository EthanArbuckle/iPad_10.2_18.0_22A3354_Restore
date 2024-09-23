@implementation STSIsInternalInstall

uint64_t __STSIsInternalInstall_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  STSIsInternalInstall_sIsInternal = result;
  return result;
}

@end
