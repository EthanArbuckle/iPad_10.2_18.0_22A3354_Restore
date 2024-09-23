@implementation SidecarPresenterLogSubsystem

void __SidecarPresenterLogSubsystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.sidecar", "presenter");
  v1 = (void *)SidecarPresenterLogSubsystem_subsystem;
  SidecarPresenterLogSubsystem_subsystem = (uint64_t)v0;

}

@end
