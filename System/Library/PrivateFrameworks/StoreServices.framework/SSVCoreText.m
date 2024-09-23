@implementation SSVCoreText

void *__SSVCoreText_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreText.framework/CoreText", 1);
  SSVCoreText_sHandle = (uint64_t)result;
  return result;
}

@end
