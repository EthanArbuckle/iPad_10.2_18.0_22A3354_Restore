@implementation UITableConstantsUseUIPSidebarMetrics

uint64_t ___UITableConstantsUseUIPSidebarMetrics_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  if ((_DWORD)result)
    result = _os_feature_enabled_impl();
  _MergedGlobals_1235 = result;
  return result;
}

@end
