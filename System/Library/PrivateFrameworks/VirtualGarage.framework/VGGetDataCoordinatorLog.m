@implementation VGGetDataCoordinatorLog

void __VGGetDataCoordinatorLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.navigation.VirtualGarage", "DataCoordinator");
  v1 = (void *)VGGetDataCoordinatorLog_log;
  VGGetDataCoordinatorLog_log = (uint64_t)v0;

}

@end
