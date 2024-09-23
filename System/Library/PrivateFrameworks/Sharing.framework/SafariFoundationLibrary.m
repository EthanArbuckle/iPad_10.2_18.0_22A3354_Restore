@implementation SafariFoundationLibrary

void *__SafariFoundationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SafariFoundation.framework/SafariFoundation", 2);
  SafariFoundationLibrary_sLib = (uint64_t)result;
  return result;
}

@end
