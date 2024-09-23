@implementation UVLog

void __UVLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dt.Previews", "uv");
  v1 = (void *)UVLog___log;
  UVLog___log = (uint64_t)v0;

}

@end
