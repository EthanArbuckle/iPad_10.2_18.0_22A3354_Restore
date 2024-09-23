@implementation SystemConfigurationLibrary

void *__SystemConfigurationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/SystemConfiguration.framework/SystemConfiguration", 2);
  SystemConfigurationLibrary_sLib = (uint64_t)result;
  return result;
}

@end
