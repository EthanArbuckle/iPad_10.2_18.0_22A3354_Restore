@implementation SSKLogDisplayTransforming

void __SSKLogDisplayTransforming_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ShellSceneKit", "DisplayTransforming");
  v1 = (void *)SSKLogDisplayTransforming___logObj;
  SSKLogDisplayTransforming___logObj = (uint64_t)v0;

}

@end
