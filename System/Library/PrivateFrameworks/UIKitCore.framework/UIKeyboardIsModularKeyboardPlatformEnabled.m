@implementation UIKeyboardIsModularKeyboardPlatformEnabled

uint64_t __UIKeyboardIsModularKeyboardPlatformEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    _MergedGlobals_1234 = 1;
  return result;
}

@end
