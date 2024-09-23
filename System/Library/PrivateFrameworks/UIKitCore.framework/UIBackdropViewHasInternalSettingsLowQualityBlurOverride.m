@implementation UIBackdropViewHasInternalSettingsLowQualityBlurOverride

void ___UIBackdropViewHasInternalSettingsLowQualityBlurOverride_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  if (os_variant_has_internal_diagnostics())
  {
    _UIKitPreferencesOnce();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("UIBackdropViewUsesLowQualityBlur"));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v0;
    if (v0)
    {
      if (objc_msgSend(v0, "BOOLValue"))
        byte_1ECD7B69A = 1;
    }

  }
}

@end
