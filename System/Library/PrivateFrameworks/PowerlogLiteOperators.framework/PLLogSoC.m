@implementation PLLogSoC

void __PLLogSoC_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "soc");
  v1 = (void *)_MergedGlobals_85;
  _MergedGlobals_85 = (uint64_t)v0;

}

@end
