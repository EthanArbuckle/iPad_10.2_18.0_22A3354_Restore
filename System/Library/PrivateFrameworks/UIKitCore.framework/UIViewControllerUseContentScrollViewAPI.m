@implementation UIViewControllerUseContentScrollViewAPI

void ___UIViewControllerUseContentScrollViewAPI_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;

  _MergedGlobals_138 = _UIBarsApplyChromelessEverywhere();
  if ((_MergedGlobals_138 & 1) == 0 && dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectForKey:", CFSTR("UIViewControllerUseContentScrollViewAPI"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if (v1
      || (_UIKitPreferencesOnce(),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "objectForKey:", CFSTR("UIViewControllerUseContentScrollViewAPI")),
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
    _MergedGlobals_138 = v3;
  }
}

@end
