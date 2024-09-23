@implementation PFOSVariantHasInternalUI

uint64_t __PFOSVariantHasInternalUI_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_ui();
  PFOSVariantHasInternalUI_isAppleInternal = result;
  return result;
}

@end
