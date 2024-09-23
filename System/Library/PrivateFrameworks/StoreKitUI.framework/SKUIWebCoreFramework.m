@implementation SKUIWebCoreFramework

void *__SKUIWebCoreFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/WebCore.framework/WebCore", 1);
  SKUIWebCoreFramework_sHandle = (uint64_t)result;
  return result;
}

@end
