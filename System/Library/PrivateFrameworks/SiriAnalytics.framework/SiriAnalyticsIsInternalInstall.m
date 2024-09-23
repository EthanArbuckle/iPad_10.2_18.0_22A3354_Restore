@implementation SiriAnalyticsIsInternalInstall

uint64_t __SiriAnalyticsIsInternalInstall_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  SiriAnalyticsIsInternalInstall_isInternal = result;
  return result;
}

@end
