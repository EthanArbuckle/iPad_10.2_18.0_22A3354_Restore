@implementation SKUIPassKitUIFramework

void *__SKUIPassKitUIFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/PassKitUI.framework/PassKitUI", 1);
  SKUIPassKitUIFramework_sHandle = (uint64_t)result;
  return result;
}

@end
