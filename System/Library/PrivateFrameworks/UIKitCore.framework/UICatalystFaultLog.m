@implementation UICatalystFaultLog

void ___UICatalystFaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.UIKit", "CatalystUnsupportedIdiom");
  v1 = (void *)_MergedGlobals_1275;
  _MergedGlobals_1275 = (uint64_t)v0;

}

@end
