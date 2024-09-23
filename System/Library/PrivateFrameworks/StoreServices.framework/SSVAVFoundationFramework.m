@implementation SSVAVFoundationFramework

void *__SSVAVFoundationFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AVFoundation.framework/AVFoundation", 1);
  SSVAVFoundationFramework_sHandle = (uint64_t)result;
  return result;
}

@end
