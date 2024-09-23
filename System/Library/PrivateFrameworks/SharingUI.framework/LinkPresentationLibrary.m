@implementation LinkPresentationLibrary

void *__LinkPresentationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/LinkPresentation.framework/LinkPresentation", 2);
  LinkPresentationLibrary_sLib = (uint64_t)result;
  return result;
}

void *__LinkPresentationLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/LinkPresentation.framework/LinkPresentation", 2);
  LinkPresentationLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
