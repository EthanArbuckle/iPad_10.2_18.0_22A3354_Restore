@implementation LoadAppIntents

void *__LoadAppIntents_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AppIntents.framework/AppIntents", 2);
  LoadAppIntents_frameworkLibrary = (uint64_t)result;
  return result;
}

@end
