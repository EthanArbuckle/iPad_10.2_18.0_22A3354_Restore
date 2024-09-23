@implementation LoadBiometricKit

void *__LoadBiometricKit_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit", 2);
  LoadBiometricKit_frameworkLibrary = (uint64_t)result;
  return result;
}

void *__LoadBiometricKit_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit", 2);
  LoadBiometricKit_frameworkLibrary_0 = (uint64_t)result;
  return result;
}

@end
