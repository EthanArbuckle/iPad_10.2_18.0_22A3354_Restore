@implementation PFOSVariantHasInternalDiagnostics

uint64_t __PFOSVariantHasInternalDiagnostics_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  PFOSVariantHasInternalDiagnostics_hasInternalDiagnostics = result;
  return result;
}

@end
