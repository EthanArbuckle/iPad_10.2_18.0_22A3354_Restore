@implementation SKUIPassKitCoreFramework

void *__SKUIPassKitCoreFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/PassKitCore.framework/PassKitCore", 1);
  SKUIPassKitCoreFramework_sHandle = (uint64_t)result;
  return result;
}

@end
