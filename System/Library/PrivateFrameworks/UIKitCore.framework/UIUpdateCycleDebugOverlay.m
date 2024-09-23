@implementation UIUpdateCycleDebugOverlay

void __38___UIUpdateCycleDebugOverlay_instance__block_invoke()
{
  int v0;
  int v1;
  uint64_t v2;
  void *v3;

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    v1 = _UIInternalPreference_UpdateCycleDebugOverlay;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_UpdateCycleDebugOverlay)
    {
      while (v0 >= v1)
      {
        _UIInternalPreferenceSync(v0, &_UIInternalPreference_UpdateCycleDebugOverlay, (uint64_t)CFSTR("UpdateCycleDebugOverlay"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v1 = _UIInternalPreference_UpdateCycleDebugOverlay;
        if (v0 == _UIInternalPreference_UpdateCycleDebugOverlay)
          return;
      }
      if (byte_1ECD75E64)
      {
        v2 = objc_opt_new();
        v3 = (void *)qword_1ECD7CBF8;
        qword_1ECD7CBF8 = v2;

        _UIUpdateCompletionObservationAddObserver(mainCompletionObservation, qword_1ECD7CBF8, 0);
      }
    }
  }
}

@end
