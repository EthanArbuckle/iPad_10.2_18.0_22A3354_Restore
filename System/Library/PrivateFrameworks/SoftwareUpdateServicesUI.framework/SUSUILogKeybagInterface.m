@implementation SUSUILogKeybagInterface

void __SUSUILogKeybagInterface_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SUSUISubsystem, "Keybag");
  v1 = (void *)SUSUILogKeybagInterface___instance;
  SUSUILogKeybagInterface___instance = (uint64_t)v0;

}

@end
