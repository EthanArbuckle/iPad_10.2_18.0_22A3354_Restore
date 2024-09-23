@implementation SKUICoreMediaFramework

void *__SKUICoreMediaFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreMedia.framework/CoreMedia", 1);
  SKUICoreMediaFramework_sHandle = (uint64_t)result;
  return result;
}

@end
