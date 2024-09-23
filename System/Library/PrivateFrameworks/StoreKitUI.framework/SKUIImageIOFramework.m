@implementation SKUIImageIOFramework

void *__SKUIImageIOFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/ImageIO.framework/ImageIO", 1);
  SKUIImageIOFramework_sHandle = (uint64_t)result;
  return result;
}

@end
