@implementation SSSignpostLog

void ___SSSignpostLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.screenshotservices", "signposts");
  v1 = (void *)_SSSignpostLog____SSSignpostLog;
  _SSSignpostLog____SSSignpostLog = (uint64_t)v0;

}

@end
