@implementation VCIsInternalBuild

uint64_t __VCIsInternalBuild_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  VCIsInternalBuild_isInternal = result;
  return result;
}

@end
