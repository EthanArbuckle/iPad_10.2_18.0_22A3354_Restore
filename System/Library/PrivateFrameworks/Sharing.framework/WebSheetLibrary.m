@implementation WebSheetLibrary

void *__WebSheetLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/WebSheet.framework/WebSheet", 2);
  WebSheetLibrary_sLib = (uint64_t)result;
  return result;
}

@end
