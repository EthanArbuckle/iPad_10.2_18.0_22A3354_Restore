@implementation SymptomPresentationFeedLibraryCore

void *__SymptomPresentationFeedLibraryCore_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Symptoms.framework/Frameworks/SymptomPresentationFeed.framework/SymptomPresentationFeed", 1);
  SymptomPresentationFeedLibraryCore_library = (uint64_t)result;
  return result;
}

@end
