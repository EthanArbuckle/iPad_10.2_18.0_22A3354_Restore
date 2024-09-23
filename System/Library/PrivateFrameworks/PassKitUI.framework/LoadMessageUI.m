@implementation LoadMessageUI

void *__LoadMessageUI_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/MessageUI.framework/MessageUI", 2);
  LoadMessageUI_frameworkLibrary = (uint64_t)result;
  return result;
}

void *__LoadMessageUI_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/MessageUI.framework/MessageUI", 2);
  LoadMessageUI_frameworkLibrary_0 = (uint64_t)result;
  return result;
}

@end
