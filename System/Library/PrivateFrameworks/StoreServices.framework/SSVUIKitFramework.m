@implementation SSVUIKitFramework

void *__SSVUIKitFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 1);
  SSVUIKitFramework_sHandle = (uint64_t)result;
  return result;
}

@end
