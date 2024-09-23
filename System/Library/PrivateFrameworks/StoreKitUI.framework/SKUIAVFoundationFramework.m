@implementation SKUIAVFoundationFramework

void *__SKUIAVFoundationFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AVFoundation.framework/AVFoundation", 1);
  SKUIAVFoundationFramework_sHandle = (uint64_t)result;
  return result;
}

@end
