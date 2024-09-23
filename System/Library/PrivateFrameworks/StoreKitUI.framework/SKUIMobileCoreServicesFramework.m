@implementation SKUIMobileCoreServicesFramework

void *__SKUIMobileCoreServicesFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 1);
  SKUIMobileCoreServicesFramework_sHandle = (uint64_t)result;
  return result;
}

@end
