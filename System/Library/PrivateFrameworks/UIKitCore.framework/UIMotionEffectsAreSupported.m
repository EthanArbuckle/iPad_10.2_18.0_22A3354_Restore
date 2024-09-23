@implementation UIMotionEffectsAreSupported

void ___UIMotionEffectsAreSupported_block_invoke()
{
  int has_internal_diagnostics;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = (void *)MGCopyAnswer();
  _MergedGlobals_13_4 = objc_msgSend(v5, "BOOLValue");
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v1 = v5;
  if (has_internal_diagnostics)
  {
    _UIKitUserDefaults();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("UIMotionEffectsEnabled"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && objc_msgSend(v3, "BOOLValue"))
      _MergedGlobals_13_4 = 1;

    v1 = v5;
  }

}

@end
