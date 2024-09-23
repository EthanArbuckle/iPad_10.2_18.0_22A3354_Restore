@implementation UIStatisticsBundleIdentifier

uint64_t ___UIStatisticsBundleIdentifier_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t result;

  _MergedGlobals_1291 = os_variant_has_internal_diagnostics();
  _UIMainBundleIdentifier();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD820D8;
  qword_1ECD820D8 = v0;

  result = objc_msgSend((id)qword_1ECD820D8, "hasPrefix:", CFSTR("com.apple."));
  byte_1ECD82011 = result;
  return result;
}

@end
