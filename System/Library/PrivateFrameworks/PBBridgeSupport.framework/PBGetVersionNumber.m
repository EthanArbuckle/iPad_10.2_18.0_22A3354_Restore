@implementation PBGetVersionNumber

uint64_t __PBGetVersionNumber_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((result & 1) != 0 || (result = MGGetBoolAnswer(), (_DWORD)result))
    PBGetVersionNumber_versionNumber = 4;
  return result;
}

CFIndex __PBGetVersionNumber_block_invoke_2()
{
  CFIndex result;

  CFPreferencesAppSynchronize(CFSTR("com.apple.Bridge"));
  result = CFPreferencesGetAppIntegerValue(CFSTR("pairingVersionNumber"), CFSTR("com.apple.Bridge"), (Boolean *)&PBGetVersionNumber_keyExists);
  if (PBGetVersionNumber_keyExists)
    PBGetVersionNumber_versionNumber = result;
  return result;
}

@end
