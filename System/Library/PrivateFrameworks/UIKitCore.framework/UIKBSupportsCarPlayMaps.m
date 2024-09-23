@implementation UIKBSupportsCarPlayMaps

uint64_t ___UIKBSupportsCarPlayMaps_block_invoke()
{
  uint64_t result;

  result = UISelfTaskHasEntitlement(CFSTR("com.apple.developer.carplay-maps"));
  _MergedGlobals_1157 = result;
  return result;
}

@end
