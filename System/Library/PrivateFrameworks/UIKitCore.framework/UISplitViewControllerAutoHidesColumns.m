@implementation UISplitViewControllerAutoHidesColumns

uint64_t ___UISplitViewControllerAutoHidesColumns_block_invoke()
{
  uint64_t result;

  result = _resolvedPrefValue_0(CFSTR("UISplitViewControllerForceAutoHidesColumns"), 0);
  byte_1ECD7D4C1 = result;
  if ((result & 1) == 0)
  {
    result = _resolvedPrefValue_0(CFSTR("UISplitViewControllerAllowAutoHidesColumns"), 1);
    _MergedGlobals_1006 = result;
  }
  return result;
}

@end
