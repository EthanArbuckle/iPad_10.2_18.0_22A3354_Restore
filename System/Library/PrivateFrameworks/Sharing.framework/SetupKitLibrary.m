@implementation SetupKitLibrary

void *__SetupKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SetupKit.framework/SetupKit", 2);
  SetupKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
