@implementation PTInstallIsAppleInternal

uint64_t __PTInstallIsAppleInternal_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  PTInstallIsAppleInternal_isAppleInternal = result;
  return result;
}

@end
