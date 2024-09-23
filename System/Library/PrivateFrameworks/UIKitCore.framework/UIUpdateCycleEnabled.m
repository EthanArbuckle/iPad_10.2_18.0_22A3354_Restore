@implementation UIUpdateCycleEnabled

void ___UIUpdateCycleEnabled_block_invoke()
{
  char *v0;

  if (_UIInternalPreferenceUsesDefault(&_UIInternalPreference_UpdateCycleEnabled, (uint64_t)CFSTR("UpdateCycleEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool))
  {
    v0 = &byte_1ECD7F572;
    if (qword_1ECD7F598 != -1)
      dispatch_once(&qword_1ECD7F598, &__block_literal_global_9_7);
  }
  else
  {
    v0 = &byte_1ECD7679C;
  }
  _MergedGlobals_1175[0] = *v0;
}

@end
