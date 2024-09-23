@implementation UIViewControllerDetachedInheritsContentOverlayInsetsFromSuperview

void ___UIViewControllerDetachedInheritsContentOverlayInsetsFromSuperview_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;

  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectForKey:", CFSTR("UIViewControllerDetachedInheritsContentOverlayInsetsFromSuperview"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if (v1
      || (_UIKitPreferencesOnce(),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "objectForKey:", CFSTR("UIViewControllerDetachedInheritsContentOverlayInsetsFromSuperview")),
          v1 = (void *)objc_claimAutoreleasedReturnValue(),
          v2,
          v1))
    {
      v3 = objc_msgSend(v1, "BOOLValue");

    }
    else
    {
      v3 = dyld_program_sdk_at_least();
    }
    byte_1EDDB0F7A = v3;
  }
}

@end
