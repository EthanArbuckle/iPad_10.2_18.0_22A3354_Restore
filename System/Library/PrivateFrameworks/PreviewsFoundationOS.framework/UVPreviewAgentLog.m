@implementation UVPreviewAgentLog

void __UVPreviewAgentLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dt.Previews", "Agent");
  v1 = (void *)UVPreviewAgentLog___log;
  UVPreviewAgentLog___log = (uint64_t)v0;

}

@end
