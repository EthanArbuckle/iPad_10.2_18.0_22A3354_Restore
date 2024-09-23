@implementation UIScreenSupportsDynamicMainScreen

uint64_t ___UIScreenSupportsDynamicMainScreen_block_invoke()
{
  uint64_t result;
  char v1;

  result = _os_feature_enabled_impl();
  if ((result & 1) != 0)
  {
    v1 = 1;
  }
  else
  {
    result = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_DynamicMainScreen, (uint64_t)CFSTR("DynamicMainScreen"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    v1 = (byte_1ECD76594 != 0) & ~(_BYTE)result;
  }
  byte_1ECD7992C = v1;
  return result;
}

@end
