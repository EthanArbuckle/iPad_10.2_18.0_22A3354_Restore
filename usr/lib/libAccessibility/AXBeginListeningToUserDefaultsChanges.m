@implementation AXBeginListeningToUserDefaultsChanges

void __AXBeginListeningToUserDefaultsChanges_block_invoke()
{
  int BooleanPreference;
  int v1;
  BOOL v2;
  char v3;

  BooleanPreference = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchEnabledPreference, 0);
  v3 = 0;
  v1 = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchEnabledByiTunesPreference, &v3);
  if (v3)
    v2 = v1 == BooleanPreference;
  else
    v2 = 1;
  if (!v2)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchEnabledByiTunesPreference, 0, 0, 0);
    _updateAccessibilitySettings();
  }
  if (BooleanPreference)
  {
    if (_AXSAssistiveTouchScannerEnabled_onceToken != -1)
      dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1215);
    if (_kAXSCacheSwitchControlEnabled)
      _AXSAssistiveTouchScannerSetEnabled(0);
    _AXSApplicationAccessibilitySetEnabled(1);
    _kickstartProcess("com.apple.VoiceOverTouch");
  }
}

void __AXBeginListeningToUserDefaultsChanges_block_invoke_2()
{
  if (_getBooleanPreference((const __CFString *)kAXSAssistiveTouchEnabledPreference, 0))
  {
    if (_AXSAssistiveTouchScannerEnabled_onceToken != -1)
      dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1215);
    if (_kAXSCacheSwitchControlEnabled)
      _AXSAssistiveTouchScannerSetEnabled(0);
    _kickstartProcess("com.apple.assistivetouchd");
  }
  else
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchHardwareEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 0), (const __CFString *)kAXSAssistiveTouchHardwareChangedNotification);
    _updateAccessibilitySettings();
  }
}

void __AXBeginListeningToUserDefaultsChanges_block_invoke_3()
{
  if (!_AXSCanDisableApplicationAccessibility())
    _AXSApplicationAccessibilitySetEnabled(1);
}

void __AXBeginListeningToUserDefaultsChanges_block_invoke_4()
{
  if (_getBooleanPreference((const __CFString *)kAXSAssistiveTouchScannerEnabledPreference, 0))
  {
    _disableConflictingSettingsForSwitchControl();
    _AXSApplicationAccessibilitySetEnabled(1);
    _kickstartProcess("com.apple.assistivetouchd");
  }
}

uint64_t __AXBeginListeningToUserDefaultsChanges_block_invoke_5()
{
  int v0;
  int BooleanPreference;
  _BOOL4 v3;
  char v5;

  v5 = 1;
  v0 = AXSGetPreferenceValue((const __CFString *)kAXSInvertColorsEnabledPreference, 0);
  BooleanPreference = _getBooleanPreference((const __CFString *)kAXSClassicInvertColorsPreference, &v5);
  v3 = v0 == 1 || BooleanPreference != 0;
  return _AXSInvertColorsDisplaySetEnabled(v3);
}

@end
