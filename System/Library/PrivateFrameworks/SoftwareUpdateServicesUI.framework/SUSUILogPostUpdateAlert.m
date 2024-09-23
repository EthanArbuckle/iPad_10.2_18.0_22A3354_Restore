@implementation SUSUILogPostUpdateAlert

void __SUSUILogPostUpdateAlert_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SUSUISubsystem, "PostUpdateAlert");
  v1 = (void *)SUSUILogPostUpdateAlert___instance;
  SUSUILogPostUpdateAlert___instance = (uint64_t)v0;

}

@end
