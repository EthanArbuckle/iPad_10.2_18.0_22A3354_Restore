@implementation AccessibilityUtilitiesLibrary

void *__AccessibilityUtilitiesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AccessibilityUtilities.framework/AccessibilityUtilities", 2);
  AccessibilityUtilitiesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
