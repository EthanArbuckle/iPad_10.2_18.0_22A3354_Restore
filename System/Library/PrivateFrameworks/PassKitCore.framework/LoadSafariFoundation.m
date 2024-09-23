@implementation LoadSafariFoundation

void *__LoadSafariFoundation_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SafariFoundation.framework/SafariFoundation", 2);
  LoadSafariFoundation_frameworkLibrary = (uint64_t)result;
  return result;
}

void *__LoadSafariFoundation_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SafariFoundation.framework/SafariFoundation", 2);
  qword_1EE1DB5A0 = (uint64_t)result;
  return result;
}

void *__LoadSafariFoundation_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SafariFoundation.framework/SafariFoundation", 2);
  LoadSafariFoundation_frameworkLibrary_0 = (uint64_t)result;
  return result;
}

@end
