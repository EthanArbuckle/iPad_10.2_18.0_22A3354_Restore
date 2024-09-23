@implementation VGGetPersistingLog

void __VGGetPersistingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.navigation.VirtualGarage", "Persisting");
  v1 = (void *)VGGetPersistingLog_log;
  VGGetPersistingLog_log = (uint64_t)v0;

}

@end
