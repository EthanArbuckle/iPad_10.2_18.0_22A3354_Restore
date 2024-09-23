@implementation RemoteTextInputLibrary

void *__RemoteTextInputLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/RemoteTextInput.framework/RemoteTextInput", 2);
  RemoteTextInputLibrary_sLib = (uint64_t)result;
  return result;
}

void *__RemoteTextInputLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/RemoteTextInput.framework/RemoteTextInput", 2);
  RemoteTextInputLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void *__RemoteTextInputLibrary_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/RemoteTextInput.framework/RemoteTextInput", 2);
  RemoteTextInputLibrary_sLib_1 = (uint64_t)result;
  return result;
}

@end
