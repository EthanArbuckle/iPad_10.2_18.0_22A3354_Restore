@implementation AMFDRPlatformDefaultCopyDefaultDataPathNative

CFURLRef ___AMFDRPlatformDefaultCopyDefaultDataPathNative_block_invoke()
{
  CFURLRef result;

  result = AMFDRPlatformCopyDefaultDataStoragePath();
  _AMFDRPlatformDefaultCopyDefaultDataPathNative_pathCached = (uint64_t)result;
  return result;
}

@end
