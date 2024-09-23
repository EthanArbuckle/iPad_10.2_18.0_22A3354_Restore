@implementation SymptomAnalyticsLibraryCore

void *__SymptomAnalyticsLibraryCore_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Symptoms.framework/Frameworks/SymptomAnalytics.framework/SymptomAnalytics", 1);
  SymptomAnalyticsLibraryCore_library = (uint64_t)result;
  return result;
}

@end
