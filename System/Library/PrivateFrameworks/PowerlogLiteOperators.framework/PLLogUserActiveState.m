@implementation PLLogUserActiveState

void __PLLogUserActiveState_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "userActiveState");
  v1 = (void *)_MergedGlobals_1_1;
  _MergedGlobals_1_1 = (uint64_t)v0;

}

@end
