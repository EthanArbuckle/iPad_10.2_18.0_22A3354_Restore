@implementation KeyboardUIServiceLog

void __KeyboardUIServiceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.keyboard", "KeyboardUIService");
  v1 = (void *)_MergedGlobals_1238;
  _MergedGlobals_1238 = (uint64_t)v0;

}

@end
