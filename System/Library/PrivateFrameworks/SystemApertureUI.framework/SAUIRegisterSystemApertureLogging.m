@implementation SAUIRegisterSystemApertureLogging

void __SAUIRegisterSystemApertureLogging_block_invoke()
{
  const char **v0;
  os_log_t v1;
  void *v2;
  os_log_t v3;
  void *v4;

  SARegisterSystemApertureLogging();
  v0 = (const char **)MEMORY[0x24BEB36C0];
  v1 = os_log_create((const char *)*MEMORY[0x24BEB36C0], "Manager");
  v2 = (void *)SAUILogManager;
  SAUILogManager = (uint64_t)v1;

  v3 = os_log_create(*v0, "ElementViewControlling");
  v4 = (void *)SAUILogElementViewControlling;
  SAUILogElementViewControlling = (uint64_t)v3;

}

@end
