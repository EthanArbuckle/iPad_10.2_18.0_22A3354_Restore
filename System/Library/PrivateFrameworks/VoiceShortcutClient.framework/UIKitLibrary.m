@implementation UIKitLibrary

void *__UIKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
  UIKitLibrary_sLib = (uint64_t)result;
  return result;
}

void *__UIKitLibrary_block_invoke_4411()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
  UIKitLibrary_sLib_4413 = (uint64_t)result;
  return result;
}

void *__UIKitLibrary_block_invoke_8522()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
  UIKitLibrary_sLib_8524 = (uint64_t)result;
  return result;
}

void *__UIKitLibrary_block_invoke_10442()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
  UIKitLibrary_sLib_10444 = (uint64_t)result;
  return result;
}

@end
