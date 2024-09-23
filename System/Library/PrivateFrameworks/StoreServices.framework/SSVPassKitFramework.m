@implementation SSVPassKitFramework

void *__SSVPassKitFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/PassKit.framework/PassKit", 1);
  SSVPassKitFramework_sHandle = (uint64_t)result;
  return result;
}

@end
