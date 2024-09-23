@implementation UIObservationTrackingEnabled

void ___UIObservationTrackingEnabled_block_invoke()
{
  char v0;
  int v1;
  BOOL v2;
  int v3;
  id v4;

  +[_UIApplicationInfoParser mainBundleInfoParser](_UIApplicationInfoParser, "mainBundleInfoParser");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "observationTrackingEnabled") & 1) != 0)
  {
    v0 = 1;
  }
  else
  {
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v1 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1
      || (v3 = _UIInternalPreference_ObservationTrackingEnabled,
          _UIInternalPreferencesRevisionVar == _UIInternalPreference_ObservationTrackingEnabled))
    {
      v2 = 0;
    }
    else
    {
      do
      {
        v2 = v1 < v3;
        if (v1 < v3)
          break;
        _UIInternalPreferenceSync(v1, &_UIInternalPreference_ObservationTrackingEnabled, (uint64_t)CFSTR("ObservationTrackingEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v3 = _UIInternalPreference_ObservationTrackingEnabled;
      }
      while (v1 != _UIInternalPreference_ObservationTrackingEnabled);
    }
    if (byte_1ECD766CC)
      v0 = v2;
    else
      v0 = 0;
  }
  _MergedGlobals_1142 = v0;

}

@end
