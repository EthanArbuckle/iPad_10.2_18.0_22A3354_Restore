@implementation CloudKitLibrary

void *__CloudKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CloudKit.framework/CloudKit", 2);
  CloudKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
