@implementation UIImageViewSymbolPixelAlignmentEnabled

void ___UIImageViewSymbolPixelAlignmentEnabled_block_invoke()
{
  int v0;
  BOOL v1;
  int v2;

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (v2 = _UIInternalPreference_UIImageViewPreferredSymbolPixelAlignmentBehavior,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_UIImageViewPreferredSymbolPixelAlignmentBehavior))
  {
    v1 = 0;
  }
  else
  {
    while (v0 >= v2)
    {
      _UIInternalPreferenceSync(v0, &_UIInternalPreference_UIImageViewPreferredSymbolPixelAlignmentBehavior, (uint64_t)CFSTR("UIImageViewPreferredSymbolPixelAlignmentBehavior"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
      v1 = 0;
      v2 = _UIInternalPreference_UIImageViewPreferredSymbolPixelAlignmentBehavior;
      if (v0 == _UIInternalPreference_UIImageViewPreferredSymbolPixelAlignmentBehavior)
        goto LABEL_5;
    }
    v1 = qword_1ECD76AA0 == 1;
  }
LABEL_5:
  byte_1ECD79C72 = v1;
}

@end
