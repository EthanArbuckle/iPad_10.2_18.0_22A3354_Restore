@implementation SSVLocalAuthenticationFramework

void *__SSVLocalAuthenticationFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/LocalAuthentication.framework/LocalAuthentication", 1);
  SSVLocalAuthenticationFramework_sHandle = (uint64_t)result;
  return result;
}

@end
