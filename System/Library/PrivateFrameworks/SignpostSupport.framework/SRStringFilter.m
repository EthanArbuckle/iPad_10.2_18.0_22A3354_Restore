@implementation SRStringFilter

void __SRStringFilter_debugLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SignpostSupport", "signpost_reporter_string_filter");
  v1 = (void *)SRStringFilter_debugLog_debugLog;
  SRStringFilter_debugLog_debugLog = (uint64_t)v0;

}

@end
