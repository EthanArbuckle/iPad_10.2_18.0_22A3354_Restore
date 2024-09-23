@implementation AXMediaLogDiagnostics

void __AXMediaLogDiagnostics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaDiagnostics");
  v1 = (void *)AXMediaLogDiagnostics___logObj;
  AXMediaLogDiagnostics___logObj = (uint64_t)v0;

}

@end
