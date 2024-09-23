@implementation ToneLibraryLibrary

void *__ToneLibraryLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ToneLibrary.framework/ToneLibrary", 2);
  ToneLibraryLibrary_sLib = (uint64_t)result;
  return result;
}

@end
