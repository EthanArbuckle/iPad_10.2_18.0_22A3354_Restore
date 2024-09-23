@implementation _UIFocusBehavior_CarPlayTouch

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___UIFocusBehavior_CarPlayTouch_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD81DF8 != -1)
    dispatch_once(&qword_1ECD81DF8, block);
  return (id)_MergedGlobals_1278;
}

- (int64_t)focusDeferral
{
  int v2;
  BOOL v3;
  int v5;

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v2 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (v5 = _UIInternalPreference_CarPlayFocusNewDeferralBehavior,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_CarPlayFocusNewDeferralBehavior))
  {
    v3 = 0;
  }
  else
  {
    do
    {
      v3 = v2 < v5;
      if (v2 < v5)
        break;
      _UIInternalPreferenceSync(v2, &_UIInternalPreference_CarPlayFocusNewDeferralBehavior, (uint64_t)CFSTR("CarPlayFocusNewDeferralBehavior"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v5 = _UIInternalPreference_CarPlayFocusNewDeferralBehavior;
    }
    while (v2 != _UIInternalPreference_CarPlayFocusNewDeferralBehavior);
  }
  if (v3 && byte_1EDDA8374 != 0)
    return 1;
  else
    return 4;
}

- (BOOL)searchBarTextFieldCanBecomeFocused
{
  return 1;
}

@end
