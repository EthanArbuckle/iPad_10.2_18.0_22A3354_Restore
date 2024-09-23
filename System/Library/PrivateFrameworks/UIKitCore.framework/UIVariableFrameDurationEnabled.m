@implementation UIVariableFrameDurationEnabled

void ___UIVariableFrameDurationEnabled_block_invoke()
{
  char *v0;

  if (qword_1ECD7F580 != -1)
    dispatch_once(&qword_1ECD7F580, &__block_literal_global_414);
  if (_MergedGlobals_1175[0])
  {
    if (_UIInternalPreferenceUsesDefault(&_UIInternalPreference_UpdateAdaptiveRateNeeded, (uint64_t)CFSTR("UpdateAdaptiveRateNeeded"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool))
    {
      v0 = &byte_1ECD7F573;
      if (qword_1ECD7F598 != -1)
        dispatch_once(&qword_1ECD7F598, &__block_literal_global_9_7);
    }
    else
    {
      v0 = &byte_1ECD767A4;
    }
    byte_1ECD7F571 = *v0;
  }
}

@end
