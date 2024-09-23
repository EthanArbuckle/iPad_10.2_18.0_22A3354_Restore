@implementation SafariServicesLibrary

void *__SafariServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/SafariServices.framework/SafariServices", 2);
  SafariServicesLibrary_sLib = (uint64_t)result;
  return result;
}

void *__SafariServicesLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/SafariServices.framework/SafariServices", 2);
  SafariServicesLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
