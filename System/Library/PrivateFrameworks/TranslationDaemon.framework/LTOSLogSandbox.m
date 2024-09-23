@implementation LTOSLogSandbox

void ___LTOSLogSandbox_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "Sandbox");
  v1 = (void *)_LTOSLogSandbox_log;
  _LTOSLogSandbox_log = (uint64_t)v0;

}

@end
