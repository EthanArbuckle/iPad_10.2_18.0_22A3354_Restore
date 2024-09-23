@implementation LoadFinHealth

void *__LoadFinHealth_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FinHealth.framework/FinHealth", 2);
  LoadFinHealth_frameworkLibrary = (uint64_t)result;
  return result;
}

void *__LoadFinHealth_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FinHealth.framework/FinHealth", 2);
  LoadFinHealth_frameworkLibrary_0 = (uint64_t)result;
  return result;
}

@end
