@implementation WRIsAppleInternal

uint64_t __WRIsAppleInternal_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  WRIsAppleInternal_appleInternal = result;
  return result;
}

@end
