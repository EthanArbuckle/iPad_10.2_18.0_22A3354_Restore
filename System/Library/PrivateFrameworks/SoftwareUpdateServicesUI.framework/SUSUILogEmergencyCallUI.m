@implementation SUSUILogEmergencyCallUI

void __SUSUILogEmergencyCallUI_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SUSUISubsystem, "EmergencyCall");
  v1 = (void *)SUSUILogEmergencyCallUI___instance;
  SUSUILogEmergencyCallUI___instance = (uint64_t)v0;

}

@end
