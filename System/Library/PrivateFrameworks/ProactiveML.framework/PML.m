@implementation PML

void __PML_LogHandle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x2199EA600]();
  v1 = os_log_create("com.apple.proactive", "pml");
  v2 = (void *)PML_LogHandle__pasExprOnceResult;
  PML_LogHandle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

@end
