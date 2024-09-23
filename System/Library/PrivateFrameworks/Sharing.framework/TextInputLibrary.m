@implementation TextInputLibrary

void *__TextInputLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/TextInput.framework/TextInput", 2);
  TextInputLibrary_sLib = (uint64_t)result;
  return result;
}

@end
