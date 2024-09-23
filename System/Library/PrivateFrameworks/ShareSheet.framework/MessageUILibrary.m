@implementation MessageUILibrary

void *__MessageUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/MessageUI.framework/MessageUI", 2);
  MessageUILibrary_sLib = (uint64_t)result;
  return result;
}

void *__MessageUILibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/MessageUI.framework/MessageUI", 2);
  MessageUILibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
