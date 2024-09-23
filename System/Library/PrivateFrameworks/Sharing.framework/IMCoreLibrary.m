@implementation IMCoreLibrary

void *__IMCoreLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/IMCore.framework/IMCore", 2);
  IMCoreLibrary_sLib = (uint64_t)result;
  return result;
}

@end
