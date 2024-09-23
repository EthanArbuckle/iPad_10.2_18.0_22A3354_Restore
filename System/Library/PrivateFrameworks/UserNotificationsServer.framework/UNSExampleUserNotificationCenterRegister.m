@implementation UNSExampleUserNotificationCenterRegister

void __UNSExampleUserNotificationCenterRegister_block_invoke()
{
  void *v0;
  UNSExampleUserNotificationCenter *v1;
  void *v2;

  v0 = (void *)MEMORY[0x219A03098]();
  v1 = objc_alloc_init(UNSExampleUserNotificationCenter);
  v2 = (void *)__sharedInstance;
  __sharedInstance = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

@end
