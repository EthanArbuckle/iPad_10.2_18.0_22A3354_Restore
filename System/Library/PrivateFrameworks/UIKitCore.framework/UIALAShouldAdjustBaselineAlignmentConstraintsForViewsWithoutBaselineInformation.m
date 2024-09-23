@implementation UIALAShouldAdjustBaselineAlignmentConstraintsForViewsWithoutBaselineInformation

void ___UIALAShouldAdjustBaselineAlignmentConstraintsForViewsWithoutBaselineInformation_block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  BOOL v3;
  int v4;
  int v5;
  id v6;

  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "valueForKey:", CFSTR("UIStackViewHorizontalBaselineAlignmentAdjustsForAbsentBaselineInformation"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v1 = v6;
    if (v6)
    {
      v2 = 1;
    }
    else
    {
      if (_UIInternalPreferencesRevisionOnce != -1)
      {
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
        v1 = 0;
      }
      if (_UIInternalPreferencesRevisionVar < 1
        || (v4 = _UIInternalPreference_UIStackViewHorizontalBaselineAlignmentAdjustsForAbsentBaselineInformation,
            _UIInternalPreferencesRevisionVar == _UIInternalPreference_UIStackViewHorizontalBaselineAlignmentAdjustsForAbsentBaselineInformation))
      {
        v3 = 1;
      }
      else
      {
        v5 = _UIInternalPreferencesRevisionVar;
        while (1)
        {
          v3 = v5 >= v4;
          if (v5 < v4)
            break;
          _UIInternalPreferenceSync(v5, &_UIInternalPreference_UIStackViewHorizontalBaselineAlignmentAdjustsForAbsentBaselineInformation, (uint64_t)CFSTR("UIStackViewHorizontalBaselineAlignmentAdjustsForAbsentBaselineInformation"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          v4 = _UIInternalPreference_UIStackViewHorizontalBaselineAlignmentAdjustsForAbsentBaselineInformation;
          v1 = 0;
          if (v5 == _UIInternalPreference_UIStackViewHorizontalBaselineAlignmentAdjustsForAbsentBaselineInformation)
            goto LABEL_9;
        }
        v1 = 0;
      }
LABEL_9:
      if (byte_1ECD769BC)
        v2 = 1;
      else
        v2 = v3;
    }
    _MergedGlobals_17_3 = v2;

  }
}

@end
