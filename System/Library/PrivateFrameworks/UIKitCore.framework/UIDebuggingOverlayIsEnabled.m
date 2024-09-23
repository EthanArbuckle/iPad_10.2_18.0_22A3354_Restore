@implementation UIDebuggingOverlayIsEnabled

uint64_t __UIDebuggingOverlayIsEnabled_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  if ((_DWORD)result)
  {
    result = _UIGetDebuggingOverlayEnabled();
    if ((_DWORD)result)
      result = dyld_program_sdk_at_least();
  }
  _MergedGlobals_11_15 = result;
  return result;
}

@end
