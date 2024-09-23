@implementation STSystemStatusIsInternalLoggingEnabled

uint64_t __STSystemStatusIsInternalLoggingEnabled_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled = result;
  return result;
}

@end
