@implementation SKUICoreImageFramework

void *__SKUICoreImageFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreImage.framework/CoreImage", 1);
  SKUICoreImageFramework_sHandle = (uint64_t)result;
  return result;
}

@end
