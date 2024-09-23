@implementation SULogInstallConstraints

void __SULogInstallConstraints_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.softwareupdateservices", "InstallationConstraints");
  v1 = (void *)SULogInstallConstraints___instance;
  SULogInstallConstraints___instance = (uint64_t)v0;

}

@end
