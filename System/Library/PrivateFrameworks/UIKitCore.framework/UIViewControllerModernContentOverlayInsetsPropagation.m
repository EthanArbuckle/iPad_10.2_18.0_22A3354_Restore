@implementation UIViewControllerModernContentOverlayInsetsPropagation

void ___UIViewControllerModernContentOverlayInsetsPropagation_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;

  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectForKey:", CFSTR("ModernContentOverlayInsetsPropagation"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if (v1
      || (_UIKitPreferencesOnce(),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "objectForKey:", CFSTR("ModernContentOverlayInsetsPropagation")),
          v1 = (void *)objc_claimAutoreleasedReturnValue(),
          v2,
          v1))
    {
      v3 = objc_msgSend(v1, "BOOLValue");

    }
    else
    {
      v3 = 1;
    }
    byte_1EDDB0F74 = v3;
  }
}

@end
