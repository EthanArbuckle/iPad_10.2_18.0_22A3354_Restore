@implementation SARegisterSystemApertureLogging

void __SARegisterSystemApertureLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create((const char *)SALogSubsystem, "Element");
  v1 = (void *)SALogElement;
  SALogElement = (uint64_t)v0;

  v2 = os_log_create((const char *)SALogSubsystem, "System");
  v3 = (void *)SALogSystem;
  SALogSystem = (uint64_t)v2;

}

@end
