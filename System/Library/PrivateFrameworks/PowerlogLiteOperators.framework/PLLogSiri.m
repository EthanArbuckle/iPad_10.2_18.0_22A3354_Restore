@implementation PLLogSiri

void __PLLogSiri_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "siri");
  v1 = (void *)_MergedGlobals_1_13;
  _MergedGlobals_1_13 = (uint64_t)v0;

}

@end
