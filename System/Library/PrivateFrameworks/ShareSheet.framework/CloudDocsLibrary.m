@implementation CloudDocsLibrary

void *__CloudDocsLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 2);
  CloudDocsLibrary_sLib = (uint64_t)result;
  return result;
}

@end
