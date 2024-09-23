@implementation SKUISocialFramework

void *__SKUISocialFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/Social.framework/Social", 1);
  SKUISocialFramework_sHandle = (uint64_t)result;
  return result;
}

@end
