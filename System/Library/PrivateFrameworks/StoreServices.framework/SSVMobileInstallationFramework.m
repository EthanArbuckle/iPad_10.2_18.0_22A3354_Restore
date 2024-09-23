@implementation SSVMobileInstallationFramework

void *__SSVMobileInstallationFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MobileInstallation.framework/MobileInstallation", 1);
  SSVMobileInstallationFramework_sHandle = (uint64_t)result;
  return result;
}

@end
