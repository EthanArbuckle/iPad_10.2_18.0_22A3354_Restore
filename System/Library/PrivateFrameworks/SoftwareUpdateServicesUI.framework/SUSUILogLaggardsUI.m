@implementation SUSUILogLaggardsUI

void __SUSUILogLaggardsUI_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SUSUISubsystem, "LaggardsUI");
  v1 = (void *)SUSUILogLaggardsUI___instance;
  SUSUILogLaggardsUI___instance = (uint64_t)v0;

}

@end
