@implementation RXIsAppleInternal

uint64_t __RXIsAppleInternal_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  RXIsAppleInternal::isAppleInternal = result;
  return result;
}

@end
