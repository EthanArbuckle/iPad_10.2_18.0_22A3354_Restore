@implementation PGIsAppleInternal

uint64_t __PGIsAppleInternal_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  PGIsAppleInternal_isAppleInternal = result;
  return result;
}

@end
