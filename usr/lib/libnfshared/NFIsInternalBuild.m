@implementation NFIsInternalBuild

uint64_t __NFIsInternalBuild_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  NFIsInternalBuild_bVal = result;
  return result;
}

@end
