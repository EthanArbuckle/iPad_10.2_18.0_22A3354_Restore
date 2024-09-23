@implementation SSVQuartzCoreFramework

void *__SSVQuartzCoreFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/QuartzCore.framework/QuartzCore", 1);
  SSVQuartzCoreFramework_sHandle = (uint64_t)result;
  return result;
}

@end
