@implementation UITabBarControllerWantsFloatingTabBar

void ___UITabBarControllerWantsFloatingTabBar_block_invoke()
{
  int v0;
  _BOOL4 v1;
  _BOOL4 v2;
  void *v3;
  void *v4;
  char v5;
  int v6;
  id v7;

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (v6 = _UIInternalPreference_IgnoreFloatingTabBarLinkCheck,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_IgnoreFloatingTabBarLinkCheck))
  {
    v1 = 0;
  }
  else
  {
    do
    {
      v1 = v0 < v6;
      if (v0 < v6)
        break;
      _UIInternalPreferenceSync(v0, &_UIInternalPreference_IgnoreFloatingTabBarLinkCheck, (uint64_t)CFSTR("IgnoreFloatingTabBarLinkCheck"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v6 = _UIInternalPreference_IgnoreFloatingTabBarLinkCheck;
    }
    while (v0 != _UIInternalPreference_IgnoreFloatingTabBarLinkCheck);
  }
  if (byte_1EDDA7ED4)
    v2 = v1;
  else
    v2 = 0;
  _UIMainBundleIdentifier();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((dyld_program_sdk_at_least() & 1) != 0 || v2)
  {
    _UIKitUserDefaults();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("UseFloatingTabBar"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_msgSend(v4, "BOOLValue");
    }
    else if ((_os_feature_enabled_impl() & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v5 = _os_feature_enabled_impl();
    }
    _MergedGlobals_43_0 = v5;

  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.DocumentManagerUICore.Service")))
    _MergedGlobals_43_0 = _UIDocumentViewControllerWantsUIPDocumentLanding();

}

@end
