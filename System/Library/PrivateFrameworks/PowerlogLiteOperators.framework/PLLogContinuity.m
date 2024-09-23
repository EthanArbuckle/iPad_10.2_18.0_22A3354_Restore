@implementation PLLogContinuity

void __PLLogContinuity_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "continuity");
  v1 = (void *)_MergedGlobals_90;
  _MergedGlobals_90 = (uint64_t)v0;

}

@end
