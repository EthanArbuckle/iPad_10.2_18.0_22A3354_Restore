@implementation SBLogShellSceneKit

void __SBLogShellSceneKit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "ShellSceneKit");
  v1 = (void *)SBLogShellSceneKit___logObj;
  SBLogShellSceneKit___logObj = (uint64_t)v0;

}

@end
