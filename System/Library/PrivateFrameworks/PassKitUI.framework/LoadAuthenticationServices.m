@implementation LoadAuthenticationServices

void *__LoadAuthenticationServices_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AuthenticationServices.framework/AuthenticationServices", 2);
  qword_1ED06C6B8 = (uint64_t)result;
  return result;
}

@end
