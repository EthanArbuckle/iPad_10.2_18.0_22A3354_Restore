@implementation SSKLogRootDisplayDriver

void __SSKLogRootDisplayDriver_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ShellSceneKit", "RootDisplayDriver");
  v1 = (void *)SSKLogRootDisplayDriver___logObj;
  SSKLogRootDisplayDriver___logObj = (uint64_t)v0;

}

@end
