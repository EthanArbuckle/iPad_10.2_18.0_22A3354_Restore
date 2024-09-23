@implementation PFArchiveFileIsAppleInternal

uint64_t __PFArchiveFileIsAppleInternal_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  PFArchiveFileIsAppleInternal::isAppleInternal = result;
  return result;
}

@end
