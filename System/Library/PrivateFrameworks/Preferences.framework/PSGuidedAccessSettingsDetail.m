@implementation PSGuidedAccessSettingsDetail

+ (id)preferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=GUIDED_ACCESS_TITLE"));
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithTypeIdentifier:", CFSTR("com.apple.graphic-icon.accessibility"));
}

+ (BOOL)guidedAccessHasPasscode
{
  return _AXSGuidedAccessHasPasscode() != 0;
}

+ (void)setGuidedAccessSwitchEnabled:(BOOL)a3
{
  _AXSGuidedAccessSetEnabled();
}

+ (void)enterGuidedAccessMode
{
  if (+[PSGuidedAccessSettingsDetail guidedAccessHasPasscode](PSGuidedAccessSettingsDetail, "guidedAccessHasPasscode"))
  {
    _AXSGuidedAccessStartSession();
  }
}

+ (unint64_t)guidedAccessAvailability
{
  uint64_t (*v2)(void);
  _Unwind_Exception *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (uint64_t (*)(void))getAXGuidedAccessGetAvailabilitySymbolLoc_ptr;
  v9 = getAXGuidedAccessGetAvailabilitySymbolLoc_ptr;
  if (!getAXGuidedAccessGetAvailabilitySymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getAXGuidedAccessGetAvailabilitySymbolLoc_block_invoke;
    v5[3] = &unk_1E4A65650;
    v5[4] = &v6;
    __getAXGuidedAccessGetAvailabilitySymbolLoc_block_invoke((uint64_t)v5);
    v2 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v4 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  return v2();
}

@end
