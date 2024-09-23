@implementation LTOSLogSELFLogging

void ___LTOSLogSELFLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "SELFLogging");
  v1 = (void *)_LTOSLogSELFLogging_log;
  _LTOSLogSELFLogging_log = (uint64_t)v0;

}

@end
