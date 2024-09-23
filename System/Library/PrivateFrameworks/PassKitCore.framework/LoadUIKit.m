@implementation LoadUIKit

void *__LoadUIKit_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
  LoadUIKit_frameworkLibrary = (uint64_t)result;
  return result;
}

@end
