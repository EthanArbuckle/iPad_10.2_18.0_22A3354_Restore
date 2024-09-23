@implementation AXSAccessibilityEnablers

uint64_t ___AXSAccessibilityEnablers_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_AXSAccessibilityEnablers_Enablers;
  _AXSAccessibilityEnablers_Enablers = (uint64_t)v0;

  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1328, CFSTR("_AXSAutomationEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1331, CFSTR("_AXSLocalizationCaptionMode"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1334, CFSTR("_AXSVoiceOverTouchEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1337, CFSTR("_AXSAssistiveTouchScannerEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1340, CFSTR("_AXSSpeakThisEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1343, CFSTR("_AXSSiriSemanticContextEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1346, CFSTR("_AXSClipTracerAccessibilityModeEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1349, CFSTR("_AXSNocturneAccessibilityModeEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1352, CFSTR("_AXSWordFeedbackEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1355, CFSTR("_AXSLetterFeedbackEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1358, CFSTR("_AXSPhoneticFeedbackEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1361, CFSTR("_AXSAuditInspectionModeEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1364, CFSTR("_AXSHoverTextEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1367, CFSTR("_AXSHoverTextTypingEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1371, CFSTR("_AXSZoomSpeakUnderFingerEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1374, CFSTR("_AXSCommandAndControlEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1377, CFSTR("_AXSCommandAndControlCarPlayEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1380, CFSTR("_AXSFullKeyboardAccessEnabled"));
  objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1383, CFSTR("_AXSWatchControlEnabled"));
  return objc_msgSend((id)_AXSAccessibilityEnablers_Enablers, "setObject:forKey:", &__block_literal_global_1386, CFSTR("_inUnitTestMode"));
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_2()
{
  _kAXSCacheAutomationEnabled = _getBooleanPreference((const __CFString *)kAXSAutomationEnabledPreference, 0);
  if (_AXSAutomationEnabled_onceToken != -1)
    dispatch_once(&_AXSAutomationEnabled_onceToken, &__block_literal_global_1401);
  return _kAXSCacheAutomationEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_3()
{
  if (_AXSLocalizationCaptionMode_onceToken != -1)
    dispatch_once(&_AXSLocalizationCaptionMode_onceToken, &__block_literal_global_1402);
  return _kAXSCacheLocalizationCaptionModeEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_5()
{
  if (_AXSAssistiveTouchScannerEnabled_onceToken != -1)
    dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1215);
  return _kAXSCacheSwitchControlEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_7()
{
  if (_AXSSiriSemanticContextEnabled_onceToken != -1)
    dispatch_once(&_AXSSiriSemanticContextEnabled_onceToken, &__block_literal_global_1408);
  return _kAXSCacheSiriSemanticContextEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_8()
{
  if (_AXSClipTracerAccessibilityModeEnabled_onceToken != -1)
    dispatch_once(&_AXSClipTracerAccessibilityModeEnabled_onceToken, &__block_literal_global_1433);
  return _kAXSCacheClipTracerAccessibilityModeEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_9()
{
  if (_AXSNocturneAccessibilityModeEnabled_onceToken != -1)
    dispatch_once(&_AXSNocturneAccessibilityModeEnabled_onceToken, &__block_literal_global_1432);
  return _kAXSCacheNocturneAccessibilityModeEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_11()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSLetterFeedbackEnabledPreference, 0, (uint64_t)_handleLetterFeedbackPrefsChangedNotification);
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_12()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSPhoneticFeedbackEnabledPreference, 0, (uint64_t)_handlePhoneticFeedbackPrefsChangedNotification);
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_13()
{
  if (_AXSAuditInspectionModeEnabled_onceToken != -1)
    dispatch_once(&_AXSAuditInspectionModeEnabled_onceToken, &__block_literal_global_1431);
  return _kAXSCacheAuditInspectionModeModeEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_15()
{
  if (_AXSHoverTextTypingEnabled_onceToken != -1)
    dispatch_once(&_AXSHoverTextTypingEnabled_onceToken, &__block_literal_global_1538);
  return _kAXSCacheHoverTextTypingEnabled;
}

BOOL ___AXSAccessibilityEnablers_block_invoke_16()
{
  if (_AXSZoomSpeakUnderFingerEnabled_onceToken != -1)
    dispatch_once(&_AXSZoomSpeakUnderFingerEnabled_onceToken, &__block_literal_global_1544);
  return _kAXSCacheZoomSpeakUnderFingerEnabled && _AXSZoomTouchEnabled() != 0;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_17()
{
  if (_AXSCommandAndControlEnabled_onceToken != -1)
    dispatch_once(&_AXSCommandAndControlEnabled_onceToken, &__block_literal_global_1249);
  return _kAXSCacheCommandAndControlEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_18()
{
  if (_AXSCommandAndControlCarPlayEnabled_onceToken != -1)
    dispatch_once(&_AXSCommandAndControlCarPlayEnabled_onceToken, &__block_literal_global_1251);
  return _kAXSCacheCommandAndControlCarPlayEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_20()
{
  if (_AXSWatchControlEnabled_onceToken != -1)
    dispatch_once(&_AXSWatchControlEnabled_onceToken, &__block_literal_global_1592);
  return _kAXSCacheWatchControlEnabled;
}

uint64_t ___AXSAccessibilityEnablers_block_invoke_21()
{
  return _inUnitTestMode;
}

@end
