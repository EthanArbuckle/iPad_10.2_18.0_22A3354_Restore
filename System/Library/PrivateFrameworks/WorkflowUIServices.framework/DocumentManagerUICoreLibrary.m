@implementation DocumentManagerUICoreLibrary

void *__DocumentManagerUICoreLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/DocumentManagerUICore.framework/DocumentManagerUICore", 2);
  DocumentManagerUICoreLibrary_sLib = (uint64_t)result;
  return result;
}

@end
