@implementation XCTTBDefaultLog

void __XCTTBDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dt.xctest", "Default");
  v1 = (void *)XCTTBDefaultLog_defaultLog;
  XCTTBDefaultLog_defaultLog = (uint64_t)v0;

}

@end
