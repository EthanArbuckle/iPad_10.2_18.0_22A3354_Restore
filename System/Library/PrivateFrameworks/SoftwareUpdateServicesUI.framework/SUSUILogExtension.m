@implementation SUSUILogExtension

void __SUSUILogExtension_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SUSUISubsystem, "Extension");
  v1 = (void *)SUSUILogExtension___instance;
  SUSUILogExtension___instance = (uint64_t)v0;

}

@end
