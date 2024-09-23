@implementation SiriVOXLibrary

void *__SiriVOXLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SiriVOX.framework/SiriVOX", 2);
  SiriVOXLibrary_sLib = (uint64_t)result;
  return result;
}

@end
