@implementation UIImageViewIsResizableImagePretilingEnabled

void ___UIImageViewIsResizableImagePretilingEnabled_block_invoke()
{
  int v0;
  BOOL v1;
  char v2;
  int v3;

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (v3 = _UIInternalPreference_UIImageViewAllowResizableImagePretiling,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_UIImageViewAllowResizableImagePretiling))
  {
    v1 = 0;
  }
  else
  {
    do
    {
      v1 = v0 < v3;
      if (v0 < v3)
        break;
      _UIInternalPreferenceSync(v0, &_UIInternalPreference_UIImageViewAllowResizableImagePretiling, (uint64_t)CFSTR("UIImageViewAllowResizableImagePretiling"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v3 = _UIInternalPreference_UIImageViewAllowResizableImagePretiling;
    }
    while (v0 != _UIInternalPreference_UIImageViewAllowResizableImagePretiling);
  }
  if (byte_1ECD76AAC)
    v2 = v1;
  else
    v2 = 0;
  _MergedGlobals_1327 = v2;
}

@end
