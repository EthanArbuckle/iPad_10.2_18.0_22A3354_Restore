@implementation UIFocusBehaviorAPIBehavior

void ___UIFocusBehaviorAPIBehavior_block_invoke()
{
  void *v0;
  char v1;
  char v2;
  char v3;

  +[_UIApplicationInfoParser mainBundleInfoParser](_UIApplicationInfoParser, "mainBundleInfoParser");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "forcesDefaultFocusAppearance");

  if ((v1 & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v3 = _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference__UIFocusDefaultAppearanceEnabled, (uint64_t)CFSTR("_UIFocusDefaultAppearanceEnabled"));
    if (byte_1EDDA835C)
      v2 = v3;
    else
      v2 = 1;
  }
  _UIFocusBehaviorAPIBehavior_apiFocusBehavior = v2;
}

@end
