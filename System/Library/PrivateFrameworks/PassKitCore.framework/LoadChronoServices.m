@implementation LoadChronoServices

void *__LoadChronoServices_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/ChronoServices.framework/ChronoServices", 2);
  LoadChronoServices_frameworkLibrary = (uint64_t)result;
  return result;
}

@end
