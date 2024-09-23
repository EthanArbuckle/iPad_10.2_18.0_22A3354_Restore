@implementation SKUIMPUFoundationFramework

void *__SKUIMPUFoundationFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MPUFoundation.framework/MPUFoundation", 1);
  SKUIMPUFoundationFramework_sHandle = (uint64_t)result;
  return result;
}

@end
