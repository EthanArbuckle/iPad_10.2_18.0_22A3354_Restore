@implementation UITouchAuthenticationIsEnabledForCurrentProcess

void ___UITouchAuthenticationIsEnabledForCurrentProcess_block_invoke()
{
  int v0;
  void *v1;
  id v2;
  char v3;
  int v4;
  id v5;

  _UIMainBundleIdentifier();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (v4 = _UIInternalPreference_BundleIdentifierForViewServiceWantingTouchAuthentication,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_BundleIdentifierForViewServiceWantingTouchAuthentication))
  {
    v1 = 0;
  }
  else
  {
    while (v0 >= v4)
    {
      _UIInternalPreferenceSync(v0, &_UIInternalPreference_BundleIdentifierForViewServiceWantingTouchAuthentication, (uint64_t)CFSTR("BundleIdentifierForViewServiceWantingTouchAuthentication"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateId);
      v1 = 0;
      v4 = _UIInternalPreference_BundleIdentifierForViewServiceWantingTouchAuthentication;
      if (v0 == _UIInternalPreference_BundleIdentifierForViewServiceWantingTouchAuthentication)
        goto LABEL_5;
    }
    v1 = (void *)qword_1ECD766A8;
  }
LABEL_5:
  v2 = v1;
  if ((objc_msgSend(MEMORY[0x1E0DC5C90], "shouldAuthenticateServiceBundleId:", v5) & 1) != 0)
  {
    v3 = 1;
  }
  else if (v2)
  {
    v3 = objc_msgSend(v5, "isEqualToString:", v2);
  }
  else
  {
    v3 = 0;
  }
  _MergedGlobals_1132 = v3;

}

@end
