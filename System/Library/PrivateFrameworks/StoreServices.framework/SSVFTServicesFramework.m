@implementation SSVFTServicesFramework

void *__SSVFTServicesFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FTServices.framework/FTServices", 1);
  SSVFTServicesFramework_sHandle = (uint64_t)result;
  return result;
}

@end
