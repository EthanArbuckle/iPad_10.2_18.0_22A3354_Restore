@implementation SymptomPresentationLiteLibraryCore

void *__SymptomPresentationLiteLibraryCore_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Symptoms.framework/Frameworks/SymptomPresentationLite.framework/SymptomPresentationLite", 1);
  SymptomPresentationLiteLibraryCore_library = (uint64_t)result;
  return result;
}

@end
