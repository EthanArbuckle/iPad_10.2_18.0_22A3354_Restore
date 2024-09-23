@implementation SUSUILog

void __SUSUILog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SUSUISubsystem, "Common");
  v1 = (void *)SUSUILog___instance;
  SUSUILog___instance = (uint64_t)v0;

}

@end
