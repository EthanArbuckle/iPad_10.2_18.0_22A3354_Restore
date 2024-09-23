@implementation SSVSymptomPresentationFeed

void *__SSVSymptomPresentationFeed_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Symptoms.framework/Frameworks/SymptomPresentationFeed.framework/SymptomPresentationFeed", 1);
  SSVSymptomPresentationFeed_sHandle = (uint64_t)result;
  return result;
}

@end
