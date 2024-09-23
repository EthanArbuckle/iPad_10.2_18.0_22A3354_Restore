@implementation UIApplication(SMUPrivate)

+ (id)smu_applicationWillEnterIdleMode
{
  return (id)*MEMORY[0x24BEBEA48];
}

+ (id)smu_applicationWillExitIdleMode
{
  return (id)*MEMORY[0x24BEBEA50];
}

@end
