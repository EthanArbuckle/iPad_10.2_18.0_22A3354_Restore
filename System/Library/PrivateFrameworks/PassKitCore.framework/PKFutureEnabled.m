@implementation PKFutureEnabled

uint64_t __PKFutureEnabled_block_invoke()
{
  uint64_t result;
  BOOL v1;

  result = os_variant_has_internal_ui();
  if ((_DWORD)result)
  {
    result = CFPreferencesGetAppBooleanValue(CFSTR("PKFutureEnabled"), CFSTR("com.apple.stockholm"), 0);
    v1 = (_DWORD)result != 0;
  }
  else
  {
    v1 = 0;
  }
  _MergedGlobals_239 = v1;
  return result;
}

@end
