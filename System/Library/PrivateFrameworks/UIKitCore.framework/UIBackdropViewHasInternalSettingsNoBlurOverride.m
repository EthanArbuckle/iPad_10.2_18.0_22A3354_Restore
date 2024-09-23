@implementation UIBackdropViewHasInternalSettingsNoBlurOverride

void ___UIBackdropViewHasInternalSettingsNoBlurOverride_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  if (os_variant_has_internal_diagnostics())
  {
    _UIKitPreferencesOnce();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("UIBackdropViewNoBlur"));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = v0;
    if (v0)
    {
      if (objc_msgSend(v0, "BOOLValue"))
        byte_1ECD7B699 = 1;
    }

  }
}

@end
