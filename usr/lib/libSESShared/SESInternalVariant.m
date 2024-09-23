@implementation SESInternalVariant

uint64_t __SESInternalVariant_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  SESInternalVariant_ret = result;
  return result;
}

@end
