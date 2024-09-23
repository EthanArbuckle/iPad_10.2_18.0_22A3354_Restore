@implementation LoadChatKit

void *__LoadChatKit_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ChatKit.framework/ChatKit", 2);
  LoadChatKit_frameworkLibrary = (uint64_t)result;
  return result;
}

void *__LoadChatKit_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ChatKit.framework/ChatKit", 2);
  LoadChatKit_frameworkLibrary_0 = (uint64_t)result;
  return result;
}

@end
