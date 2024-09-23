@implementation UIKitUserDefaults

uint64_t ___UIKitUserDefaults_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t result;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  v1 = (void *)_MergedGlobals_1283;
  _MergedGlobals_1283 = v0;

  result = os_variant_has_internal_diagnostics();
  if ((_DWORD)result)
    return objc_msgSend((id)_MergedGlobals_1283, "addSuiteNamed:", *MEMORY[0x1E0CB2878]);
  return result;
}

@end
