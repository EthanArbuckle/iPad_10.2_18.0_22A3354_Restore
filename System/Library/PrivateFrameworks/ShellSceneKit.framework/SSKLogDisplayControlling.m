@implementation SSKLogDisplayControlling

void __SSKLogDisplayControlling_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ShellSceneKit", "DisplayControlling");
  v1 = (void *)SSKLogDisplayControlling___logObj;
  SSKLogDisplayControlling___logObj = (uint64_t)v0;

}

@end
