@implementation SUSUILogAuthenticationUI

void __SUSUILogAuthenticationUI_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SUSUISubsystem, "AuthenticationUI");
  v1 = (void *)SUSUILogAuthenticationUI___instance;
  SUSUILogAuthenticationUI___instance = (uint64_t)v0;

}

@end
