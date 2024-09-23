void __preferencesQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.accessibility.perappprefs.queue", 0);
  v1 = (void *)preferencesQueue_PreferencesQueue;
  preferencesQueue_PreferencesQueue = (uint64_t)v0;

}

uint64_t _AXSAllowOpaqueTouchGestures()
{
  uint64_t result;
  char v1;

  v1 = 0;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSAllowOpaqueTouchGesturesPreference, &v1);
  if (v1)
    return result;
  else
    return 1;
}

uint64_t ___initializeVoiceOverCacheListener_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.vot"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchEnabledPreference, &v2);
  if (v2)
    _kAXSCacheVoiceOverTouchEnabled = result;
  return result;
}

uint64_t _AXSPhotosensitiveMitigationEnabled()
{
  if (_AXSPhotosensitiveMitigationEnabled_onceToken != -1)
    dispatch_once(&_AXSPhotosensitiveMitigationEnabled_onceToken, &__block_literal_global_1593);
  return _kAXSCachePhotosensitiveMitigationEnabled;
}

const __CFString *_AXSCopyPreferredContentSizeCategoryName()
{
  const __CFString *v0;
  const __CFString *v1;
  CFTypeID v2;

  if (cachedAppID_onceToken != -1)
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_1626);
  if (cachedAppID_CachedAppID)
  {
    v0 = (const __CFString *)_AXSCopyPreferredContentSizeCategoryNameApp((const __CFString *)cachedAppID_CachedAppID);
    if (v0)
    {
      v1 = v0;
      v2 = CFGetTypeID(v0);
      if (v2 == CFStringGetTypeID() && CFStringGetLength(v1))
        return v1;
      CFRelease(v1);
    }
  }
  return (const __CFString *)_AXSCopyPreferredContentSizeCategoryNameApp(0);
}

uint64_t _AXSCommandAndControlEnabled()
{
  if (_AXSCommandAndControlEnabled_onceToken != -1)
    dispatch_once(&_AXSCommandAndControlEnabled_onceToken, &__block_literal_global_1249);
  return _kAXSCacheCommandAndControlEnabled;
}

uint64_t _AXSReduceMotionAutoplayAnimatedImagesEnabled()
{
  if (_AXSReduceMotionAutoplayAnimatedImagesEnabled_onceToken != -1)
    dispatch_once(&_AXSReduceMotionAutoplayAnimatedImagesEnabled_onceToken, &__block_literal_global_1549);
  return _kAXSCacheReduceMotionAutoplayAnimatedImagesEnabled;
}

uint64_t AXSGetPreferenceValue(const __CFString *a1, const __CFString *a2)
{
  uint64_t v2;
  const __CFNumber *NumberPreference;
  unsigned int valuePtr;

  v2 = 0xFFFFFFFFLL;
  valuePtr = -1;
  NumberPreference = (const __CFNumber *)_getNumberPreference(a1, a2);
  if (NumberPreference)
  {
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    return valuePtr;
  }
  return v2;
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  if (_AXSAssistiveTouchScannerEnabled_onceToken != -1)
    dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1215);
  return _kAXSCacheSwitchControlEnabled;
}

uint64_t ___accessibilityEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.ax"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAccessibilityEnabledPreference, &v2);
  if (v2)
    _kAXSCacheAccessibilityEnabled = result;
  return result;
}

uint64_t _AXSHighContrastFocusIndicatorsEnabled()
{
  if (_AXSHighContrastFocusIndicatorsEnabled_onceToken != -1)
    dispatch_once(&_AXSHighContrastFocusIndicatorsEnabled_onceToken, &__block_literal_global_1551);
  return _kAXSCacheHighContrastFocusIndicatorsEnabled;
}

uint64_t _AXSLowercaseKeyboardDisplayEnabled()
{
  if (_AXSLowercaseKeyboardDisplayEnabled_onceToken != -1)
    dispatch_once(&_AXSLowercaseKeyboardDisplayEnabled_onceToken, &__block_literal_global_1559);
  return _kAXSCacheLowercaseKeyboardEnabled;
}

void ___initializePublicAPINotificationListeners_block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v1;
  __CFNotificationCenter *v2;
  __CFNotificationCenter *v3;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.captioning"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v1 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v1, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.mono.audio"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v2, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.quick.speak"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v3, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.differentiate.without.color"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.enhance.background.contrast"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.reduce.motion.reduce.slide.transitions"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (_initializeVoiceOverCacheListener_onceToken != -1)
    dispatch_once(&_initializeVoiceOverCacheListener_onceToken, &__block_literal_global_1925);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.grayscale"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  s_axDidInitializeListeners = 1;
}

void ___willGetPrefValue_block_invoke_2(uint64_t a1)
{
  uint64_t (*v2)();
  __CFNotificationCenter *DarwinNotifyCenter;

  if ((objc_msgSend((id)PrefsChangedNotifications, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend((id)PrefsChangedNotifications, "addObject:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 40))
      v2 = *(uint64_t (**)())(a1 + 40);
    else
      v2 = _handlePrefsChangedNotification;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)v2, *(CFStringRef *)(a1 + 32), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

uint64_t _AXSProcessLoadsInvertBundlesForPerAppSmartInvert()
{
  if (_AXSProcessLoadsInvertBundlesForPerAppSmartInvert_onceToken != -1)
    dispatch_once(&_AXSProcessLoadsInvertBundlesForPerAppSmartInvert_onceToken, &__block_literal_global_1629);
  if (cachedAppID_onceToken != -1)
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_1626);
  return objc_msgSend((id)_AXSProcessLoadsInvertBundlesForPerAppSmartInvert_appIDs, "containsObject:", cachedAppID_CachedAppID);
}

BOOL _AXSReduceMotionReduceSlideTransitionsEnabled()
{
  return AXSGetCachedPreference((unsigned int *)&_kAXSCacheReduceMotionReduceSlideTransitions, &_AXSReduceMotionReduceSlideTransitionsEnabled_onceToken, kAXSReduceMotionReduceSlideTransitionsPreference, (uint64_t)CFSTR("com.apple.accessibility.cache.reduce.motion.reduce.slide.transitions"), kAXSReduceMotionReduceSlideTransitionsChangedNotification) == 1;
}

void __cachedAppID_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cachedAppID_CachedAppID;
  cachedAppID_CachedAppID = v0;

}

uint64_t _AXSGrayscaleEnabled()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "grayscale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "grayscale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

  }
  else
  {
    if (_AXSGrayscaleEnabled_onceToken != -1)
      dispatch_once(&_AXSGrayscaleEnabled_onceToken, &__block_literal_global_1287);
    return _kAXSCacheGrayscaleEnabled;
  }
  return v4;
}

id _AXSClarityBoardEnabledDirectory()
{
  void *v0;
  void *v1;
  void *v2;

  AXCPSharedResourcesDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", AXCPSharedResourcesDirectory());
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Accessibility"), 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void *_AXSCopyPreferredContentSizeCategoryNameApp(const __CFString *a1)
{
  const __CFString *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  _BYTE v16[18];
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)AXCPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("/Library/Preferences/com.apple.UIKit")))
  {
    AXSupportLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      _AXSCopyPreferredContentSizeCategoryNameApp_cold_1();

    return 0;
  }
  v2 = a1;
  if (!a1)
    v2 = (const __CFString *)objc_msgSend((id)AXCPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("/Library/Preferences/com.apple.UIKit"));
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("UIPreferredContentSizeCategoryName"), v2);
  AXSupportLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v16 = v2;
    *(_WORD *)&v16[8] = 2112;
    *(_QWORD *)&v16[10] = a1;
    v17 = 2112;
    v18 = v3;
    _os_log_debug_impl(&dword_18F1A7000, v4, OS_LOG_TYPE_DEBUG, "CF Read Category Name: domain = %@, appID = %@ value = %@", buf, 0x20u);
  }

  AXSupportLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v16 = a1 != 0;
    *(_WORD *)&v16[4] = 2112;
    *(_QWORD *)&v16[6] = v3;
    _os_log_impl(&dword_18F1A7000, v5, OS_LOG_TYPE_DEFAULT, "Read CategoryName: per-app = %d, category name = %@", buf, 0x12u);
  }

  if (a1 && !v3)
  {
    if (cachedAppID_onceToken != -1)
      dispatch_once(&cachedAppID_onceToken, &__block_literal_global_1626);
    if (cachedAppID_CachedAppID && CFStringCompare(a1, (CFStringRef)cachedAppID_CachedAppID, 0))
    {
      v14 = 0;
      v6 = (void *)objc_msgSend(objc_alloc((Class)getLSApplicationRecordClass()), "initWithBundleIdentifier:allowPlaceholder:error:", a1, 0, &v14);
      v7 = v14;
      if (v7)
      {
        AXSupportLogCommon();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          _copyValuePreferenceApp_cold_1();

      }
      objc_msgSend(v6, "dataContainerURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(v6, "dataContainerURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "path");

        v3 = (void *)_CFPreferencesCopyAppValueWithContainer();
        AXSupportLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v16 = v10;
          *(_WORD *)&v16[8] = 2112;
          *(_QWORD *)&v16[10] = a1;
          v17 = 2112;
          v18 = v3;
          _os_log_debug_impl(&dword_18F1A7000, v11, OS_LOG_TYPE_DEBUG, "CF Read Category Name from Container: domain = %@, appID = %@, category name = %@ (-1 - empty, 0 - false, 1 - true)", buf, 0x20u);
        }

      }
      return v3;
    }
    return 0;
  }
  return v3;
}

const void *AXCPSharedResourcesDirectory()
{
  uid_t v0;
  const void *Value;
  char *pw_dir;
  passwd *v3;

  pthread_mutex_lock(&AXCPSharedResourcesDirectory_lock);
  v0 = geteuid();
  if (!v0)
    v0 = getuid();
  if (AXCPSharedResourcesDirectory_pathDictionary)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)AXCPSharedResourcesDirectory_pathDictionary, (const void *)v0);
    if (Value)
      goto LABEL_13;
  }
  else
  {
    AXCPSharedResourcesDirectory_pathDictionary = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  }
  pw_dir = getenv("IPHONE_SHARED_RESOURCES_DIRECTORY");
  if (pw_dir || (v3 = getpwuid(v0)) != 0 && (pw_dir = v3->pw_dir) != 0)
  {
    Value = CFStringCreateWithFileSystemRepresentation(0, pw_dir);
    if (Value)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)AXCPSharedResourcesDirectory_pathDictionary, (const void *)v0, Value);
      CFRelease(Value);
    }
  }
  else
  {
    Value = 0;
  }
LABEL_13:
  pthread_mutex_unlock(&AXCPSharedResourcesDirectory_lock);
  return Value;
}

BOOL _AXSDifferentiateWithoutColorEnabled()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "differentiateWithoutColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
    return AXSGetCachedPreference((unsigned int *)&_kAXSCacheDifferentiateWithoutColor, &_AXSDifferentiateWithoutColorEnabled_onceToken, kAXSDifferentiateWithoutColorPreference, (uint64_t)CFSTR("com.apple.accessibility.cache.differentiate.without.color"), (uint64_t)kAXSDifferentiateWithoutColorChangedNotification[0]) == 1;
  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "differentiateWithoutColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

uint64_t _AXSVisualAlertEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1)
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1243);
  if (_AXSClarityBoardEnabled_isEnabled)
    return 0;
  if (_AXSVisualAlertEnabled_onceToken != -1)
    dispatch_once(&_AXSVisualAlertEnabled_onceToken, &__block_literal_global_1434);
  return _kAXSCacheVisualAlertEnabled;
}

void _AXSApplicationAccessibilitySetEnabled(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v6;
  int v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  AXSupportLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 67109378;
    v7 = a1;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_DEFAULT, "Application accessibility enabled: %d, %@", (uint8_t *)&v6, 0x12u);

  }
  pthread_mutex_lock(&_AXSAccessibilityEnabledLock);
  _kAXSCacheApplicationAccessibilityEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSApplicationAccessibilityEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), 0);
  AXSupportLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 67109120;
    v7 = a1;
    _os_log_impl(&dword_18F1A7000, v4, OS_LOG_TYPE_DEFAULT, "Stored App AX setting: %d", (uint8_t *)&v6, 8u);
  }

  pthread_mutex_unlock(&_AXSAccessibilityEnabledLock);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.accessibility.cache.app.ax"), 0, 0, 1u);
  _updateAccessibilitySettings();
}

void _updateAccessibilitySettings()
{
  int v0;
  _BOOL4 v1;
  int v2;
  __CFArray *v3;
  NSObject *v4;
  NSObject *v5;
  const void **v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  _DWORD v16[2];
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v0 = _AXSApplicationAccessibilityEnabled();
  if (_AXSZoomTouchEnabled()
    || _AXSVoiceOverTouchEnabled()
    || _AXSGuidedAccessRequiresApplicationAccessibility()
    || _AXSQuickSpeakEnabled())
  {
    goto LABEL_49;
  }
  if (_AXSAssistiveTouchEnabled_onceToken != -1)
    dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1207);
  if (_kAXSAssistiveTouchEnabledCache)
    goto LABEL_49;
  if (_AXSAssistiveTouchScannerEnabled_onceToken != -1)
    dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1215);
  if (_kAXSCacheSwitchControlEnabled)
    goto LABEL_49;
  if (_AXSHearingAidsPaired_onceToken != -1)
    dispatch_once(&_AXSHearingAidsPaired_onceToken, &__block_literal_global_1309);
  if (_kAXSCacheHearingAidPaired || _AXSSpeakThisEnabled() || _AXSDefaultRouteForCall())
    goto LABEL_49;
  if (_AXSLocalizationCaptionMode_onceToken != -1)
    dispatch_once(&_AXSLocalizationCaptionMode_onceToken, &__block_literal_global_1402);
  if (_kAXSCacheLocalizationCaptionModeEnabled
    || _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSLetterFeedbackEnabledPreference, 0, (uint64_t)_handleLetterFeedbackPrefsChangedNotification)|| _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSPhoneticFeedbackEnabledPreference, 0, (uint64_t)_handlePhoneticFeedbackPrefsChangedNotification)|| _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSQuickTypePredictionFeedbackEnabledPreference, 0, (uint64_t)_handleQuickTypePredictionFeedbackPrefsChangedNotification)|| _AXSWordFeedbackEnabled())
  {
    goto LABEL_49;
  }
  if (_AXSClipTracerAccessibilityModeEnabled_onceToken != -1)
    dispatch_once(&_AXSClipTracerAccessibilityModeEnabled_onceToken, &__block_literal_global_1433);
  if (_kAXSCacheClipTracerAccessibilityModeEnabled)
    goto LABEL_49;
  if (_AXSNocturneAccessibilityModeEnabled_onceToken != -1)
    dispatch_once(&_AXSNocturneAccessibilityModeEnabled_onceToken, &__block_literal_global_1432);
  if (_kAXSCacheNocturneAccessibilityModeEnabled)
    goto LABEL_49;
  if (_AXSAuditInspectionModeEnabled_onceToken != -1)
    dispatch_once(&_AXSAuditInspectionModeEnabled_onceToken, &__block_literal_global_1431);
  if (_kAXSCacheAuditInspectionModeModeEnabled)
    goto LABEL_49;
  if (_AXSCommandAndControlEnabled_onceToken != -1)
    dispatch_once(&_AXSCommandAndControlEnabled_onceToken, &__block_literal_global_1249);
  if (_kAXSCacheCommandAndControlEnabled)
    goto LABEL_49;
  if (_AXSCommandAndControlCarPlayEnabled_onceToken != -1)
    dispatch_once(&_AXSCommandAndControlCarPlayEnabled_onceToken, &__block_literal_global_1251);
  if (_kAXSCacheCommandAndControlCarPlayEnabled)
    goto LABEL_49;
  if (_AXSAutomationEnabled_onceToken != -1)
    dispatch_once(&_AXSAutomationEnabled_onceToken, &__block_literal_global_1401);
  if (_kAXSCacheAutomationEnabled || _AXSFullKeyboardAccessEnabled())
    goto LABEL_49;
  if (_AXSWatchControlEnabled_onceToken != -1)
    dispatch_once(&_AXSWatchControlEnabled_onceToken, &__block_literal_global_1592);
  if (_kAXSCacheWatchControlEnabled || _AXSHoverTextEnabled())
    goto LABEL_49;
  if (_AXSHoverTextTypingEnabled_onceToken != -1)
    dispatch_once(&_AXSHoverTextTypingEnabled_onceToken, &__block_literal_global_1538);
  if (_kAXSCacheHoverTextTypingEnabled)
    goto LABEL_49;
  if (_AXSProcessIsSpringBoard_onceToken != -1)
    dispatch_once(&_AXSProcessIsSpringBoard_onceToken, &__block_literal_global_1634);
  if (_AXSProcessIsSpringBoard__AXSProcessIsSpringBoard == 1 && _AXSBackgroundSoundsEnabled())
  {
LABEL_49:
    v1 = 1;
  }
  else
  {
    _AXSInvertColorsEnabled();
    v1 = _kAXSCacheInvertColorsGlobal == 1;
  }
  v2 = v1 | v0;
  if (!(v1 | v0))
  {
    v3 = _AXSTripleClickCopyOptions();
    if (_AXSTripleClickContainsOption((_BOOL8)v3, 5) || _AXSTripleClickContainsOption((_BOOL8)v3, 8))
    {
      v2 = 1;
      if (!v3)
        goto LABEL_55;
      goto LABEL_54;
    }
    v2 = 0;
    if (v3)
LABEL_54:
      CFRelease(v3);
  }
LABEL_55:
  AXSupportLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109632;
    v16[1] = v0;
    v17 = 1024;
    v18 = v2;
    v19 = 1024;
    v20 = _kAXSCacheAccessibilityEnabled;
    _os_log_impl(&dword_18F1A7000, v4, OS_LOG_TYPE_DEFAULT, "AXS AccessibilityEnabled: (app ax: %d), ax settings: %d, cached: %d", (uint8_t *)v16, 0x14u);
  }

  if (_kAXSCacheAccessibilityEnabled != v2)
  {
    AXSupportLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      _updateAccessibilitySettings_cold_2();

    _kAXSCacheAccessibilityEnabled = v2;
    v6 = (const void **)MEMORY[0x1E0C9AE40];
    if (v2)
      v6 = (const void **)MEMORY[0x1E0C9AE50];
    _setPreferenceAppWithNotification((const __CFString *)kAXSAccessibilityEnabledPreference, 0, *v6, 0);
  }
  AXSupportLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    _updateAccessibilitySettings_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.accessibility.cache.ax"), 0, 0, 1u);
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  if (_AXSProcessIsSiri_onceToken != -1)
    dispatch_once(&_AXSProcessIsSiri_onceToken, &__block_literal_global_1837);
  if (_AXSProcessIsSiri__AXSProcessIsSiri == 1)
  {
    if (_AXSClarityBoardEnabled_onceToken != -1)
      dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1243);
    if (_AXSClarityBoardEnabled_isEnabled)
      return 1;
  }
  if (AXDisallowsUIBasedAccessibilityFeatures_onceToken != -1)
    dispatch_once(&AXDisallowsUIBasedAccessibilityFeatures_onceToken, &__block_literal_global_1606);
  if ((AXDisallowsUIBasedAccessibilityFeatures_DisallowedForClient & 1) != 0)
    return 0;
  _AXSAccessibilityEnabled();
  if (_AXSApplicationAccessibilityEnabled_onceToken != -1)
    dispatch_once(&_AXSApplicationAccessibilityEnabled_onceToken, &__block_literal_global_1225);
  return _kAXSCacheApplicationAccessibilityEnabled;
}

uint64_t _getPrefBooleanValueWithCustomCallback(__CFString *a1, int a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;

  v4 = _copyPrefValueWithCustomCallback(a1, a3);
  v5 = a2 != 0;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objc_msgSend(v4, "BOOLValue");
  }

  return v5;
}

void *_copyPrefValueWithCustomCallback(__CFString *a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  if (_willGetPrefValue_onceToken != -1)
    dispatch_once(&_willGetPrefValue_onceToken, &__block_literal_global_1825);
  -[__CFString stringByAppendingString:](a1, "stringByAppendingString:", CFSTR(".notification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PrefsChangedNotificationQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___willGetPrefValue_block_invoke_2;
  v8[3] = &unk_1E293A010;
  v9 = v4;
  v10 = a2;
  v6 = v4;
  dispatch_sync(v5, v8);

  return _copyValuePreferenceApp(a1, 0, 0);
}

BOOL _AXSTripleClickContainsOption(_BOOL8 a1, int a2)
{
  _BOOL8 v2;
  CFNumberRef v3;
  int valuePtr;
  CFRange v6;

  v2 = a1;
  valuePtr = a2;
  if (a1)
  {
    v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
    v6.length = CFArrayGetCount((CFArrayRef)v2);
    v6.location = 0;
    v2 = CFArrayContainsValue((CFArrayRef)v2, v6, v3) != 0;
    CFRelease(v3);
  }
  return v2;
}

uint64_t _AXSGuidedAccessEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1)
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1243);
  if (_AXSClarityBoardEnabled_isEnabled)
    return 0;
  if (_AXSGuidedAccessEnabled_onceToken != -1)
    dispatch_once(&_AXSGuidedAccessEnabled_onceToken, &__block_literal_global_1261);
  return _kAXSCacheGuidedAccessEnabled;
}

uint64_t _AXSAssistiveTouchEnabled()
{
  if (_AXSAssistiveTouchEnabled_onceToken != -1)
    dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1207);
  return _kAXSAssistiveTouchEnabledCache;
}

uint64_t _AXSZoomTouchEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1)
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1243);
  if (_AXSClarityBoardEnabled_isEnabled)
    return 0;
  if (_AXSZoomTouchEnabled_onceToken != -1)
    dispatch_once(&_AXSZoomTouchEnabled_onceToken, &__block_literal_global_1546);
  return _kAXSCacheZoomTouchEnabled;
}

uint64_t _AXSHoverTextEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1)
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1243);
  if (_AXSClarityBoardEnabled_isEnabled)
    return 0;
  if (_AXSHoverTextEnabled_onceToken != -1)
    dispatch_once(&_AXSHoverTextEnabled_onceToken, &__block_literal_global_1537);
  return _kAXSCacheHoverTextEnabled;
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1)
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1243);
  if (_AXSClarityBoardEnabled_isEnabled)
    return 0;
  if (_AXSFullKeyboardAccessEnabled_onceToken != -1)
    dispatch_once(&_AXSFullKeyboardAccessEnabled_onceToken, &__block_literal_global_1252);
  return _kAXSCacheFullKeyboardAccessEnabled;
}

uint64_t _AXSClarityBoardEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1)
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1243);
  return _AXSClarityBoardEnabled_isEnabled;
}

BOOL _AXSReduceMotionAutoplayVideoPreviewsEnabled()
{
  int v0;

  v0 = AXSGetCachedPreference(&_kAXSCacheReduceMotionAutoplayVideoPreviews, &_AXSReduceMotionAutoplayVideoPreviewsEnabled_onceToken, kAXSReduceMotionAutoplayVideoPreviewsPreference, (uint64_t)CFSTR("com.apple.accessibility.cache.reduce.motion.autoplay.video.previews"), kAXSReduceMotionAutoplayVideoPreviewsChangedNotification);
  if (_AXSVoiceOverTouchEnabled())
    return v0 == 1;
  else
    return v0 != 0;
}

BOOL _AXSVoiceOverTouchEnabled()
{
  if (VoiceOverTemporaryOverride)
  {
    if (cachedAppID_onceToken != -1)
      dispatch_once(&cachedAppID_onceToken, &__block_literal_global_1626);
    if (cachedAppID_CachedAppID
      && (objc_msgSend((id)cachedAppID_CachedAppID, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
    {
      return VoiceOverTemporaryOverride == 1;
    }
  }
  if (_initializeVoiceOverCacheListener_onceToken != -1)
    dispatch_once(&_initializeVoiceOverCacheListener_onceToken, &__block_literal_global_1925);
  return _kAXSCacheVoiceOverTouchEnabled != 0;
}

uint64_t _AXSWordFeedbackEnabled()
{
  if (_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken != -1)
    dispatch_once(&_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken, &__block_literal_global_1323);
  if (_kAXSCacheSpeechSettingsDisabledByManagedConfiguration)
    return 0;
  else
    return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSWordFeedbackEnabledPreference, 0, (uint64_t)_handleWordFeedbackPrefsChangedNotification);
}

uint64_t _AXSSpeakThisEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1)
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1243);
  if (_AXSClarityBoardEnabled_isEnabled)
    return 0;
  if (_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken != -1)
    dispatch_once(&_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken, &__block_literal_global_1323);
  if (_kAXSCacheSpeechSettingsDisabledByManagedConfiguration)
    return 0;
  if (_AXSSpeakThisEnabled_onceToken != -1)
    dispatch_once(&_AXSSpeakThisEnabled_onceToken, &__block_literal_global_1399);
  return _kAXSCacheSpeakThisEnabled;
}

BOOL _AXSGuidedAccessRequiresApplicationAccessibility()
{
  if (_AXSGuidedAccessEnabledByManagedConfiguration_onceToken != -1)
    dispatch_once(&_AXSGuidedAccessEnabledByManagedConfiguration_onceToken, &__block_literal_global_1266);
  return _kAXSCacheGuidedAccessEnabledByManagedConfiguration || _AXSGuidedAccessEnabled() != 0;
}

uint64_t _AXSQuickSpeakEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1)
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1243);
  if (_AXSClarityBoardEnabled_isEnabled)
    return 0;
  if (_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken != -1)
    dispatch_once(&_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken, &__block_literal_global_1323);
  if (_kAXSCacheSpeechSettingsDisabledByManagedConfiguration)
    return 0;
  if (_AXSQuickSpeakEnabled_onceToken != -1)
    dispatch_once(&_AXSQuickSpeakEnabled_onceToken, &__block_literal_global_1324);
  return _kAXSCacheQuickSpeakEnabled;
}

void _setPreferenceAppWithNotification(const __CFString *a1, __CFString *a2, const void *a3, const __CFString *a4)
{
  char *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  _BYTE buf[24];
  __CFString *v26;
  __int16 v27;
  const void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = getenv("__AX_UNIT_TEST_SETTER");
    if (v8 && !strcmp(v8, "TRUE"))
      goto LABEL_13;
    if (!CFEqual(a1, (CFTypeRef)kAXSRosebudLoggingEnabledPreference)
      && !CFEqual(a1, (CFTypeRef)kAXSSpeechSynthesisOptionsPreference))
    {
      goto LABEL_48;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v9 = getAXProcessIsBackboardSymbolLoc_ptr;
    v26 = (__CFString *)getAXProcessIsBackboardSymbolLoc_ptr;
    if (!getAXProcessIsBackboardSymbolLoc_ptr)
    {
      v10 = (void *)AccessibilityUtilitiesLibrary();
      v9 = dlsym(v10, "AXProcessIsBackboard");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v9;
      getAXProcessIsBackboardSymbolLoc_ptr = v9;
    }
    _Block_object_dispose(buf, 8);
    if (!v9)
      _setPreferenceAppWithNotification_cold_4();
    if ((((uint64_t (*)(void))v9)() & 1) == 0)
    {
LABEL_13:
      geteuid();
    }
    else
    {
LABEL_48:
      if (geteuid())
      {
        if (CFEqual(a1, (CFTypeRef)kAXSAccessibilityNeedsMicrophoneOnLockScreenPreference))
        {
          CFPreferencesSetAppValue(a1, a3, (CFStringRef)kAXSAssistiveTouchPreferenceDomain);
LABEL_23:
          if (a4)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFNotificationCenterPostNotification(DarwinNotifyCenter, a4, 0, 0, 1u);
          }
          return;
        }
        if (a2)
          v15 = a2;
        else
          v15 = (const __CFString *)kAXSAccessibilityPreferenceDomain;
        if (a2)
        {
          v24 = 0;
          v16 = (void *)objc_msgSend(objc_alloc((Class)getLSApplicationRecordClass()), "initWithBundleIdentifier:allowPlaceholder:error:", a2, 0, &v24);
          v17 = v24;
          if (v17)
          {
            AXSupportLogCommon();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              _copyValuePreferenceApp_cold_1();

          }
          objc_msgSend(v16, "dataContainerURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "path");

          if (v20)
          {
            if ((-[__CFString hasPrefix:](a2, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
            {
LABEL_42:
              _CFPreferencesSetValueWithContainer();
              AXSupportLogCommon();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138413058;
                *(_QWORD *)&buf[4] = v20;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = a1;
                *(_WORD *)&buf[22] = 2112;
                v26 = a2;
                v27 = 2112;
                v28 = a3;
                _os_log_debug_impl(&dword_18F1A7000, v23, OS_LOG_TYPE_DEBUG, "CF Save to Container: domain = %@, preference = %@, appID = %@, value = %@ (-1 - empty, 0 - false, 1 - true)", buf, 0x2Au);
              }

              goto LABEL_23;
            }
            v21 = 0;
LABEL_39:
            CFPreferencesSetValue(a1, a3, v15, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
            AXSupportLogCommon();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v15;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = a1;
              *(_WORD *)&buf[22] = 2112;
              v26 = a2;
              v27 = 2112;
              v28 = a3;
              _os_log_debug_impl(&dword_18F1A7000, v22, OS_LOG_TYPE_DEBUG, "CF Save: domain = %@, preference = %@, appID = %@, value = %@ (-1 - empty, 0 - false, 1 - true)", buf, 0x2Au);
            }

            if ((v21 & 1) != 0)
              goto LABEL_23;
            goto LABEL_42;
          }
        }
        else
        {
          v20 = 0;
        }
        v21 = 1;
        goto LABEL_39;
      }
    }
    if (!a2)
    {
      AXUtilsBackBoardServer();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        AXSupportLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          _setPreferenceAppWithNotification_cold_1();

        objc_msgSend(v12, "setAccessibilityPreferenceAsMobile:value:notification:", a1, a3, a4);
      }

      goto LABEL_23;
    }
    AXSupportLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      _setPreferenceAppWithNotification_cold_2();

  }
}

void sub_18F1AB2E4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  id v11;
  NSObject *v12;

  if (a2 == 1)
  {
    v11 = objc_begin_catch(a1);
    AXSupportLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_18F1A7000, v12, OS_LOG_TYPE_DEFAULT, "Error setting mobile pref: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x18F1AB07CLL);
  }
  _Unwind_Resume(a1);
}

__CFArray *_AXSTripleClickCopyOptions()
{
  const __CFNumber *v0;
  const __CFNumber *v1;
  CFTypeID v2;
  const __CFAllocator *v3;
  __CFArray *Mutable;
  __CFArray *v5;
  uint64_t i;
  CFNumberRef v7;
  CFTypeID v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  int valuePtr;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v0 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSTripleClickPreference, 0, 0);
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      CFNumberGetValue(v1, kCFNumberIntType, &valuePtr);
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      v5 = Mutable;
      if (valuePtr)
      {
        if (valuePtr == 3)
        {
          for (i = 0; i != 3; ++i)
          {
            v19 = dword_18F1CEE64[i];
            v7 = CFNumberCreate(v3, kCFNumberIntType, &v19);
            CFArrayAppendValue(v5, v7);
            CFRelease(v7);
          }
        }
        else
        {
          CFArrayAppendValue(Mutable, v1);
        }
      }
      _AXSSetTripleClickOptions(v5);
    }
    else
    {
      v8 = CFGetTypeID(v1);
      if (v8 == CFArrayGetTypeID())
        v5 = (__CFArray *)CFRetain(v1);
      else
        v5 = 0;
    }
    CFRelease(v1);
  }
  else
  {
    v5 = 0;
  }
  if (_AXSGuidedAccessEnabled())
  {
    if (_AXSTripleClickContainsOption((_BOOL8)v5, 7))
    {
      AXSupportLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        valuePtr = 138412290;
        v21 = v10;
        _os_log_impl(&dword_18F1A7000, v9, OS_LOG_TYPE_DEFAULT, "Found GA (%@) in list of triple click options from preferences. Removing it from preferences, as it should be returned dynamically.", (uint8_t *)&valuePtr, 0xCu);

      }
      _AXSSetTripleClickOptions(v5);
      if (v5)
        CFRetain(v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

      if (v5)
      {
        objc_msgSend(v11, "addObjectsFromArray:", v5);
        CFRelease(v5);
      }
      v5 = (__CFArray *)CFRetain(v11);

    }
  }
  if ((_os_feature_enabled_impl() & 1) == 0 && _AXSTripleClickContainsOption((_BOOL8)v5, 27))
  {
    v13 = (void *)-[__CFArray mutableCopy](v5, "mutableCopy");

    objc_msgSend(v13, "removeObject:", &unk_1E2941968);
    v5 = (__CFArray *)v13;
  }
  if ((_os_feature_enabled_impl() & 1) == 0 && _AXSTripleClickContainsOption((_BOOL8)v5, 28))
  {
    v14 = (void *)-[__CFArray mutableCopy](v5, "mutableCopy");

    objc_msgSend(v14, "removeObject:", &unk_1E2941980);
    v5 = (__CFArray *)v14;
  }
  if ((_os_feature_enabled_impl() & 1) == 0 && _AXSTripleClickContainsOption((_BOOL8)v5, 31))
  {
    v15 = (void *)-[__CFArray mutableCopy](v5, "mutableCopy");

    objc_msgSend(v15, "removeObject:", &unk_1E2941998);
    v5 = (__CFArray *)v15;
  }
  if (!AXRuntimeCheck_SupportsLiveCaptions() && _AXSTripleClickContainsOption((_BOOL8)v5, 29))
  {
    v16 = (void *)-[__CFArray mutableCopy](v5, "mutableCopy");

    objc_msgSend(v16, "removeObject:", &unk_1E29419B0);
    v5 = (__CFArray *)v16;
  }
  if ((AXRuntimeCheck_SupportsOnDeviceEyeTracking() & 1) == 0 && _AXSTripleClickContainsOption((_BOOL8)v5, 42))
  {
    v17 = (void *)-[__CFArray mutableCopy](v5, "mutableCopy");

    objc_msgSend(v17, "removeObject:", &unk_1E29419C8);
    return (__CFArray *)v17;
  }
  return v5;
}

uint64_t _AXSDefaultRouteForCall()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if ((_AXSDefaultRouteForCall_didRegister & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_defaultRouteChangeCallback, (CFStringRef)kAXSDefaultRouteChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    _defaultRouteChangeCallback();
    _AXSDefaultRouteForCall_didRegister = 1;
  }
  return _kAXSCachedDefaultRouteForCall;
}

void _defaultRouteChangeCallback()
{
  const __CFNumber *v0;
  const __CFNumber *v1;
  CFTypeID v2;

  v0 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSDefaultRouteForCallPreference, 0, 0);
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFNumberGetTypeID())
      CFNumberGetValue(v1, kCFNumberIntType, &_kAXSCachedDefaultRouteForCall);
    else
      _kAXSCachedDefaultRouteForCall = 0;
    CFRelease(v1);
  }
  else
  {
    _kAXSCachedDefaultRouteForCall = 0;
  }
}

BOOL _AXSButtonShapesEnabled()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "buttonShapes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
    return AXSGetCachedPreference((unsigned int *)&_kAXSCacheButtonShapes, &_AXSButtonShapesEnabled_onceToken, kAXSButtonShapesEnabledPreference, (uint64_t)CFSTR("com.apple.accessibility.cache.button.shapes.enabled"), (uint64_t)kAXSButtonShapesEnabledNotification[0]) == 1;
  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonShapes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

uint64_t _AXSUseSingleSystemColor()
{
  if (_AXSUseSingleSystemColor_onceToken != -1)
    dispatch_once(&_AXSUseSingleSystemColor_onceToken, &__block_literal_global_1552);
  return _kAXSCacheUseSingleSystemColor;
}

id preferencesQueue()
{
  if (preferencesQueue_onceToken != -1)
    dispatch_once(&preferencesQueue_onceToken, &__block_literal_global_1627);
  return (id)preferencesQueue_PreferencesQueue;
}

uint64_t _getBooleanPreference(const __CFString *a1, char *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;

  v4 = (void *)MEMORY[0x1940002E8]();
  v5 = _copyValuePreferenceApp(a1, 0, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "BOOLValue");
    v7 = 1;
    if (!a2)
      goto LABEL_6;
    goto LABEL_5;
  }
  v7 = 0;
  v6 = 0;
  if (a2)
LABEL_5:
    *a2 = v7;
LABEL_6:

  objc_autoreleasePoolPop(v4);
  return v6;
}

id _getNumberPreference(const __CFString *a1, const __CFString *a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1940002E8]();
  v5 = _copyValuePreferenceApp(a1, a2, 0);
  objc_opt_class();
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;

  objc_autoreleasePoolPop(v4);
  return v6;
}

void *_copyValuePreferenceApp(const __CFString *cf1, const __CFString *a2, _BYTE *a3)
{
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 1;
  if (a2)
    v6 = (uint64_t)a2;
  else
    v6 = kAXSAccessibilityPreferenceDomain;
  if (CFEqual(cf1, (CFTypeRef)kAXSEnabledSoundDetectionStatePreference))
    v6 = kAXSSoundDetectionPreferenceDomain;
  if (CFEqual(cf1, (CFTypeRef)kAXSAccessibilityNeedsMicrophoneOnLockScreenPreference))
    v7 = (const __CFString *)kAXSAssistiveTouchPreferenceDomain;
  else
    v7 = (const __CFString *)v6;
  if (!geteuid())
  {
    AXUtilsBackBoardServer();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPreferenceRetrievalRequiresValidConnection:", 0);
    objc_msgSend(v16, "accessibilityPreferenceAsMobile:domain:", cf1, v7);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v8 = (void *)v17;

      return v8;
    }
    v8 = (void *)CFPreferencesCopyValue(cf1, v7, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);

    if (v8)
      return v8;
  }
  v8 = (void *)CFPreferencesCopyAppValue(cf1, v7);
  AXSupportLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v21 = (uint64_t)v7;
    v22 = 2112;
    v23 = cf1;
    v24 = 2112;
    v25 = a2;
    v26 = 2112;
    v27 = v8;
    _os_log_debug_impl(&dword_18F1A7000, v9, OS_LOG_TYPE_DEBUG, "CF Read: domain = %@, preference = %@, appID = %@ result = %@ (-1 - empty, 0 - false, 1 - true)", buf, 0x2Au);
  }

  if (a2 && !v8)
  {
    if (cachedAppID_onceToken != -1)
      dispatch_once(&cachedAppID_onceToken, &__block_literal_global_1626);
    if (!cachedAppID_CachedAppID || CFStringCompare(a2, (CFStringRef)cachedAppID_CachedAppID, 0) == kCFCompareEqualTo)
      goto LABEL_33;
    v19 = 0;
    v10 = (void *)objc_msgSend(objc_alloc((Class)getLSApplicationRecordClass()), "initWithBundleIdentifier:allowPlaceholder:error:", a2, 0, &v19);
    v11 = v19;
    if (v11)
    {
      AXSupportLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        _copyValuePreferenceApp_cold_1();

    }
    objc_msgSend(v10, "dataContainerURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v10, "dataContainerURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "path");

      v8 = (void *)_CFPreferencesCopyValueWithContainer();
      AXSupportLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v21 = v14;
        v22 = 2112;
        v23 = cf1;
        v24 = 2112;
        v25 = a2;
        v26 = 2112;
        v27 = v8;
        _os_log_debug_impl(&dword_18F1A7000, v15, OS_LOG_TYPE_DEBUG, "CF Read from Container: domain = %@, preference = %@, appID = %@, value = %@ (-1 - empty, 0 - false, 1 - true)", buf, 0x2Au);
      }

    }
  }
  if (v8)
    return v8;
LABEL_33:
  if (a2)
  {
    v8 = 0;
    if (!a3)
      return v8;
    goto LABEL_41;
  }
  if (_AXSAccessibilityPreferenceDomain_onceToken != -1)
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1076);
  v8 = (void *)CFPreferencesCopyValue(cf1, (CFStringRef)_AXSAccessibilityPreferenceDomain_Domain, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (a3)
  {
LABEL_41:
    if (!v8)
      *a3 = 0;
  }
  return v8;
}

void AXSInitializeAsynchronouslyPerAppSmartInvert()
{
  dispatch_time_t v0;

  v0 = dispatch_time(0, 500000000);
  dispatch_after(v0, MEMORY[0x1E0C80D38], &__block_literal_global_1067);
}

BOOL _AXSEnhanceBackgroundContrastEnabled()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "reduceTransparency");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
    return AXSGetCachedPreference((unsigned int *)&_kAXSCacheEnhanceBackgroundContrast, &_AXSEnhanceBackgroundContrastEnabled_onceToken, kAXSEnhanceBackgroundContrastPreference, (uint64_t)CFSTR("com.apple.accessibility.cache.enhance.background.contrast"), (uint64_t)kAXSEnhanceBackgroundContrastChangedNotification[0]) == 1;
  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reduceTransparency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

BOOL _AXSReduceMotionEnabled()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "reduceMotion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
    return AXSGetCachedPreference((unsigned int *)&_kAXSCacheReduceMotion, &_AXSReduceMotionEnabled_onceToken, kAXSReduceMotionPreference, (uint64_t)CFSTR("com.apple.accessibility.cache.reduce.motion"), (uint64_t)CFSTR("com.apple.accessibility.cache.reduce.motion")) == 1;
  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reduceMotion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

uint64_t _AXSAccessibilityEnabled()
{
  char v0;
  BOOL v1;
  BOOL v4;

  if (_AXSAccessibilityEnabled_onceToken != -1)
    dispatch_once(&_AXSAccessibilityEnabled_onceToken, &__block_literal_global_1220);
  if (_AXSAccessibilityEnabled_isPreBoard | _AXSAccessibilityEnabled_isCheckerBoard)
  {
    if (_accessibilityEnabled_onceToken != -1)
      dispatch_once(&_accessibilityEnabled_onceToken, &__block_literal_global_1219);
    return 1;
  }
  if (_AXLoadsBundlesUnconditionallyForUnmanagedASAM_onceToken != -1)
    dispatch_once(&_AXLoadsBundlesUnconditionallyForUnmanagedASAM_onceToken, &__block_literal_global_1835);
  if (_AXLoadsBundlesUnconditionallyForUnmanagedASAM_LoadsBundlesUnconditionallyForUnmanagedASAM)
  {
    if (_AXHasUnmanagedASAMEntitlement_entitlementOnceToken != -1)
      dispatch_once(&_AXHasUnmanagedASAMEntitlement_entitlementOnceToken, &__block_literal_global_1836);
    if (_AXHasUnmanagedASAMEntitlement_hasUnmanagedASAMEntitlement)
      return 1;
  }
  if (_accessibilityEnabled_onceToken != -1)
    dispatch_once(&_accessibilityEnabled_onceToken, &__block_literal_global_1219);
  v0 = _kAXSCacheAccessibilityEnabled;
  v1 = _AXSInvertColorsEnabled();
  if (_AXSShouldLoadInvertBundles_onceToken != -1)
  {
    v4 = v1;
    dispatch_once(&_AXSShouldLoadInvertBundles_onceToken, &__block_literal_global_2);
    v1 = v4;
  }
  return (v1 | v0 | _kAXSystemUIProcessShouldLoadInvertBundles);
}

BOOL _AXSInvertColorsEnabled()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "smartInvert");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "smartInvert");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

  }
  else
  {
    if (AXSGetCachedSmartInvert_onceToken != -1)
      dispatch_once(&AXSGetCachedSmartInvert_onceToken, &__block_literal_global_1068);
    return _kAXSCacheInvertColors == 1;
  }
  return v4;
}

BOOL _AXSEnhanceTextLegibilityEnabled()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "boldText");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
    return AXSGetCachedPreference((unsigned int *)&_kAXSCacheEnhanceTextLegibility, &_AXSEnhanceTextLegibilityEnabled_onceToken, kAXSEnhanceTextLegibilityPreference, (uint64_t)CFSTR("com.apple.accessibility.cache.enhance.text.legibility"), (uint64_t)kAXSEnhanceTextLegibilityChangedNotification[0]) == 1;
  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boldText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

BOOL _AXDarkenSystemColors()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "increaseContrast");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
    return AXSGetCachedPreference(&_kAXSCacheDarkenSystemColors, &_AXDarkenSystemColors_onceToken, kAXSDarkenSystemColorsEnabledPreference, (uint64_t)CFSTR("com.apple.accessibility.cache.darken.system.colors.enabled"), (uint64_t)kAXSDarkenSystemColorsEnabledNotification[0]) == 1;
  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "increaseContrast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

uint64_t AXSGetCachedPreference(unsigned int *a1, dispatch_once_t *predicate, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v7[8];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __AXSGetCachedPreference_block_invoke;
  v7[3] = &__block_descriptor_64_e5_v8__0l;
  v7[4] = a4;
  v7[5] = a3;
  v7[6] = a1;
  v7[7] = a5;
  if (*predicate != -1)
    dispatch_once(predicate, v7);
  return *a1;
}

uint64_t _AXSUseDarkerKeyboard()
{
  return 0;
}

uint64_t _AXSAutomationEnabled()
{
  if (_AXSAutomationEnabled_onceToken != -1)
    dispatch_once(&_AXSAutomationEnabled_onceToken, &__block_literal_global_1401);
  return _kAXSCacheAutomationEnabled;
}

uint64_t _AXSAutomationPreferredLocalization()
{
  if (_AXSAutomationPreferredLocalization_onceToken != -1)
    dispatch_once(&_AXSAutomationPreferredLocalization_onceToken, &__block_literal_global_1405);
  return _AXSAutomationPreferredLocalization_loc;
}

uint64_t _AXSAutomationLocalizedStringLookupInfoEnabled()
{
  if (_AXSAutomationLocalizedStringLookupInfoEnabled_onceToken != -1)
    dispatch_once(&_AXSAutomationLocalizedStringLookupInfoEnabled_onceToken, &__block_literal_global_1404);
  return _kAXSCacheAutomationLocalizedStringLookup;
}

uint64_t AXDisallowsUIBasedAccessibilityFeatures()
{
  if (AXDisallowsUIBasedAccessibilityFeatures_onceToken != -1)
    dispatch_once(&AXDisallowsUIBasedAccessibilityFeatures_onceToken, &__block_literal_global_1606);
  return AXDisallowsUIBasedAccessibilityFeatures_DisallowedForClient;
}

void ___initializePublicAPINotificationListeners_block_invoke()
{
  if (s_axDidInitializeListeners_block_invoke_onceToken != -1)
    dispatch_once(&s_axDidInitializeListeners_block_invoke_onceToken, &__block_literal_global_1834);
}

uint64_t _AXSReduceMotionEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSReduceMotionPreference, a1);
}

uint64_t _AXSInvertColorsEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSInvertColorsEnabledPreference, a1);
}

uint64_t _AXSIncreaseButtonLegibilityApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSIncreaseButtonLegibilityPreference, a1);
}

uint64_t _AXSEnhanceTextLegibilityEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSEnhanceTextLegibilityPreference, a1);
}

uint64_t _AXDarkenSystemColorsApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSDarkenSystemColorsEnabledPreference, a1);
}

CFStringRef AXCPCopySharedResourcesPreferencesDomainForDomain(uint64_t a1)
{
  const __CFAllocator *v2;
  const void *v3;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = AXCPSharedResourcesDirectory();
  return CFStringCreateWithFormat(v2, 0, CFSTR("%@/Library/Preferences/%@"), v3, a1);
}

uint64_t _AXSProcessDrawsAssistiveUI()
{
  if (_AXSProcessDrawsAssistiveUI_onceToken != -1)
    dispatch_once(&_AXSProcessDrawsAssistiveUI_onceToken, &__block_literal_global_1301);
  return _AXSProcessDrawsAssistiveUI_result;
}

uint64_t _AXSPhoneticFeedbackEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSPhoneticFeedbackEnabledPreference, 0, (uint64_t)_handlePhoneticFeedbackPrefsChangedNotification);
}

uint64_t _AXSLetterFeedbackEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSLetterFeedbackEnabledPreference, 0, (uint64_t)_handleLetterFeedbackPrefsChangedNotification);
}

uint64_t _AXSMossdeepEnabled()
{
  return 0;
}

uint64_t _AXSInUnitTestMode()
{
  return _inUnitTestMode;
}

uint64_t _AXSQuickTypePredictionFeedbackEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSQuickTypePredictionFeedbackEnabledPreference, 0, (uint64_t)_handleQuickTypePredictionFeedbackPrefsChangedNotification);
}

BOOL _AXSIncreaseButtonLegibility()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "onOffLabels");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
    return AXSGetCachedPreference((unsigned int *)&_kAXSCacheIncreaseButtonLegibility, &_AXSIncreaseButtonLegibility_onceToken, kAXSIncreaseButtonLegibilityPreference, (uint64_t)CFSTR("com.apple.accessibility.cache.increase.button.legibility"), (uint64_t)kAXSIncreaseButtonLegibilityNotification[0]) == 1;
  +[AccessibilitySupportOverrides shared](AccessibilitySupportOverrides, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onOffLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

void ___willGetPrefValue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.accessibility.cachedprefs.queue", 0);
  v1 = (void *)PrefsChangedNotificationQueue;
  PrefsChangedNotificationQueue = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = (void *)PrefsChangedNotifications;
  PrefsChangedNotifications = (uint64_t)v2;

}

BOOL _AXSExtendedKeyboardPredictionsEnabled()
{
  if (_AXSAssistiveTouchScannerEnabled_onceToken != -1)
    dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1215);
  if (_kAXSCacheSwitchControlEnabled)
  {
    if (_AXSSwitchControlExtendedKeyboardPredictionsEnabled_onceToken != -1)
      dispatch_once(&_AXSSwitchControlExtendedKeyboardPredictionsEnabled_onceToken, &__block_literal_global_1217);
    if (_kAXSCacheSwitchControlUseExtendedKeyboardPredictionsEnabled)
      return 1;
  }
  if (_AXSAssistiveTouchEnabled_onceToken != -1)
    dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1207);
  if (!_kAXSAssistiveTouchEnabledCache)
    return 0;
  if (_AXSAssistiveTouchExtendedKeyboardPredictionsEnabled_onceToken != -1)
    dispatch_once(&_AXSAssistiveTouchExtendedKeyboardPredictionsEnabled_onceToken, &__block_literal_global_1218);
  return _kAXSCacheAssistiveTouchUseExtendedKeyboardPredictionsEnabled != 0;
}

uint64_t _AXSShouldLoadInvertBundles()
{
  if (_AXSShouldLoadInvertBundles_onceToken != -1)
    dispatch_once(&_AXSShouldLoadInvertBundles_onceToken, &__block_literal_global_2);
  return _kAXSystemUIProcessShouldLoadInvertBundles;
}

uint64_t _AXSReportValidationErrors()
{
  if (_AXSReportValidationErrors_onceToken != -1)
    dispatch_once(&_AXSReportValidationErrors_onceToken, &__block_literal_global_1283);
  return _kAXSCacheReportValidationErrors;
}

uint64_t _AXSHearingDevicePairedEars()
{
  void *v0;
  uint64_t v1;

  v0 = _copyValuePreferenceApp((const __CFString *)kAXSHearingDevicePairedEarsPreference, 0, 0);
  v1 = objc_msgSend(v0, "unsignedIntegerValue");

  return v1;
}

uint64_t _AXSIsNonUIBuild()
{
  return os_variant_has_factory_content();
}

const __CFBoolean *_AXSClosedCaptionsEnabled()
{
  const __CFBoolean *result;
  const __CFBoolean *v1;
  uint64_t Value;

  if (_AXSClosedCaptionsEnabled_onceToken != -1)
    dispatch_once(&_AXSClosedCaptionsEnabled_onceToken, &__block_literal_global_1293);
  result = (const __CFBoolean *)MACaptionAppearancePrefCopyPreferAccessibleCaptions();
  if (result)
  {
    v1 = result;
    Value = CFBooleanGetValue(result);
    CFRelease(v1);
    return (const __CFBoolean *)Value;
  }
  return result;
}

uint64_t _AXSMonoAudioEnabled()
{
  if (_AXSMonoAudioEnabled_onceToken != -1)
    dispatch_once(&_AXSMonoAudioEnabled_onceToken, &__block_literal_global_1311);
  return _kAXSCacheMonoAudioEnabled;
}

BOOL _AXSPrefersHorizontalTextLayout()
{
  return AXSGetCachedPreference((unsigned int *)&_kAXSCachePrefersHorizontalText, &_AXSPrefersHorizontalTextLayout_onceToken, kAXSPrefersHorizontalTextPreference, (uint64_t)CFSTR("com.apple.accessibility.cache.prefers.horizontal.text"), kAXSPrefersHorizontalTextNotification) == 1;
}

uint64_t _AXSPointerStrokeColor()
{
  if (_AXSPointerStrokeColor_onceToken != -1)
    dispatch_once(&_AXSPointerStrokeColor_onceToken, &__block_literal_global_1572);
  return _kAXSCachePointerStrokeColor;
}

uint64_t _AXSInDataMigrationMode()
{
  return _InDataMigrationMode;
}

uint64_t _AXSBackTapEnabled()
{
  if (_AXSBackTapEnabled_onceToken != -1)
    dispatch_once(&_AXSBackTapEnabled_onceToken, &__block_literal_global_1585);
  return _kAXSCacheBackTapEnabled;
}

uint64_t _AXSAccessibilityPreferenceDomain()
{
  if (_AXSAccessibilityPreferenceDomain_onceToken != -1)
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1076);
  return _AXSAccessibilityPreferenceDomain_Domain;
}

uint64_t _AXSAccessibilityHasNoticedOpaqueTouchDevice()
{
  uint64_t result;
  char v1;

  v1 = 0;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSOpaqueTouchDeviceEverNoticedPreference, &v1);
  if (v1)
    return result;
  else
    return 0;
}

const __CFString *AXSystemRootDirectory()
{
  return CFSTR("/");
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("System/Library/AccessibilityBundles"));
}

id AXCBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)AXCBundle_CUBundle;
  if (!AXCBundle_CUBundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXCoreUtilities"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)AXCBundle_CUBundle;
    AXCBundle_CUBundle = v1;

    v0 = (void *)AXCBundle_CUBundle;
  }
  return v0;
}

id AXCLanguageToCanonicalPlistPath()
{
  void *v0;
  void *v1;

  AXCBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("AXLanguageToLocale"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AXCLanguageFallbackPlistPath()
{
  void *v0;
  void *v1;

  AXCBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("AXLanguageToFallback"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AXCLanguageToLocales()
{
  if (AXCLanguageToLocales_onceToken != -1)
    dispatch_once(&AXCLanguageToLocales_onceToken, &__block_literal_global_0);
  return (id)AXCLanguageToLocales_LanguageToLangLocale;
}

id AXCLanguageToFallbacks()
{
  if (AXCLanguageToFallbacks_onceToken != -1)
    dispatch_once(&AXCLanguageToFallbacks_onceToken, &__block_literal_global_13);
  return (id)AXCLanguageToFallbacks_LanguageToFallback;
}

uint64_t AXAccessibilityMacCatalystBundlesDirectory()
{
  return objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("System/iOSSupport/System/Library/AccessibilityBundles"));
}

void AXBackgroundLog(void *a1, os_log_type_t a2, void *a3)
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  NSObject *v9;
  id v10;
  os_log_type_t v11;

  v5 = a1;
  v6 = a3;
  if (os_log_type_enabled(v5, a2))
  {
    if (_AXBackgroundLoggingQueue_onceToken != -1)
      dispatch_once(&_AXBackgroundLoggingQueue_onceToken, &__block_literal_global_323);
    v7 = _AXBackgroundLoggingQueue__queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __AXBackgroundLog_block_invoke;
    block[3] = &unk_1E2937998;
    v10 = v6;
    v9 = v5;
    v11 = a2;
    dispatch_async(v7, block);

  }
}

id AXLogCommon()
{
  if (AXLogCommon_onceToken != -1)
    dispatch_once(&AXLogCommon_onceToken, &__block_literal_global_1);
  return (id)AXLogCommon___logObj;
}

id AXSupportLogCommon()
{
  if (AXSupportLogCommon_onceToken != -1)
    dispatch_once(&AXSupportLogCommon_onceToken, &__block_literal_global_3);
  return (id)AXSupportLogCommon___logObj;
}

id AXRuntimeLogCommon()
{
  if (AXRuntimeLogCommon_onceToken != -1)
    dispatch_once(&AXRuntimeLogCommon_onceToken, &__block_literal_global_5);
  return (id)AXRuntimeLogCommon___logObj;
}

id AXRuntimeLogPID()
{
  if (AXRuntimeLogPID_onceToken != -1)
    dispatch_once(&AXRuntimeLogPID_onceToken, &__block_literal_global_7);
  return (id)AXRuntimeLogPID___logObj;
}

id AXRuntimeLogNotifications()
{
  if (AXRuntimeLogNotifications_onceToken != -1)
    dispatch_once(&AXRuntimeLogNotifications_onceToken, &__block_literal_global_9);
  return (id)AXRuntimeLogNotifications___logObj;
}

id AXRuntimeLogSerialization()
{
  if (AXRuntimeLogSerialization_onceToken != -1)
    dispatch_once(&AXRuntimeLogSerialization_onceToken, &__block_literal_global_11);
  return (id)AXRuntimeLogSerialization___logObj;
}

id AXRuntimeLogElementFetcher()
{
  if (AXRuntimeLogElementFetcher_onceToken != -1)
    dispatch_once(&AXRuntimeLogElementFetcher_onceToken, &__block_literal_global_13_0);
  return (id)AXRuntimeLogElementFetcher___logObj;
}

id AXTTSLogCommon()
{
  if (AXTTSLogCommon_onceToken != -1)
    dispatch_once(&AXTTSLogCommon_onceToken, &__block_literal_global_15);
  return (id)AXTTSLogCommon___logObj;
}

id AXTTSLogRange()
{
  if (AXTTSLogRange_onceToken != -1)
    dispatch_once(&AXTTSLogRange_onceToken, &__block_literal_global_17);
  return (id)AXTTSLogRange___logObj;
}

id AXTTSLogVoiceBank()
{
  if (AXTTSLogVoiceBank_onceToken != -1)
    dispatch_once(&AXTTSLogVoiceBank_onceToken, &__block_literal_global_19);
  return (id)AXTTSLogVoiceBank___logObj;
}

id AXTTSLogResourceManager()
{
  if (AXTTSLogResourceManager_onceToken != -1)
    dispatch_once(&AXTTSLogResourceManager_onceToken, &__block_literal_global_21);
  return (id)AXTTSLogResourceManager___logObj;
}

id AXTTSLogResourceMigration()
{
  if (AXTTSLogResourceMigration_onceToken != -1)
    dispatch_once(&AXTTSLogResourceMigration_onceToken, &__block_literal_global_23);
  return (id)AXTTSLogResourceMigration___logObj;
}

id AXTTSLogKona()
{
  if (AXTTSLogKona_onceToken != -1)
    dispatch_once(&AXTTSLogKona_onceToken, &__block_literal_global_25);
  return (id)AXTTSLogKona___logObj;
}

id AXLogEventTap()
{
  if (AXLogEventTap_onceToken != -1)
    dispatch_once(&AXLogEventTap_onceToken, &__block_literal_global_27);
  return (id)AXLogEventTap___logObj;
}

id AXLogIPC()
{
  if (AXLogIPC_onceToken != -1)
    dispatch_once(&AXLogIPC_onceToken, &__block_literal_global_29);
  return (id)AXLogIPC___logObj;
}

id AXLogDisplay()
{
  if (AXLogDisplay_onceToken != -1)
    dispatch_once(&AXLogDisplay_onceToken, &__block_literal_global_31);
  return (id)AXLogDisplay___logObj;
}

id AXLogUserInterfaceService()
{
  if (AXLogUserInterfaceService_onceToken != -1)
    dispatch_once(&AXLogUserInterfaceService_onceToken, &__block_literal_global_33);
  return (id)AXLogUserInterfaceService___logObj;
}

id AXLogUIViewService()
{
  if (AXLogUIViewService_onceToken != -1)
    dispatch_once(&AXLogUIViewService_onceToken, &__block_literal_global_35);
  return (id)AXLogUIViewService___logObj;
}

id AXLogBrokenHomeButton()
{
  if (AXLogBrokenHomeButton_onceToken != -1)
    dispatch_once(&AXLogBrokenHomeButton_onceToken, &__block_literal_global_37);
  return (id)AXLogBrokenHomeButton___logObj;
}

id AXLogMIDI()
{
  if (AXLogMIDI_onceToken != -1)
    dispatch_once(&AXLogMIDI_onceToken, &__block_literal_global_39);
  return (id)AXLogMIDI___logObj;
}

id AXLogDataMigrator()
{
  if (AXLogDataMigrator_onceToken != -1)
    dispatch_once(&AXLogDataMigrator_onceToken, &__block_literal_global_41);
  return (id)AXLogDataMigrator___logObj;
}

id AXLogDragging()
{
  if (AXLogDragging_onceToken != -1)
    dispatch_once(&AXLogDragging_onceToken, &__block_literal_global_43);
  return (id)AXLogDragging___logObj;
}

id AXLogSettings()
{
  if (AXLogSettings_onceToken != -1)
    dispatch_once(&AXLogSettings_onceToken, &__block_literal_global_45);
  return (id)AXLogSettings___logObj;
}

id AXLogSiriShortcuts()
{
  if (AXLogSiriShortcuts_onceToken != -1)
    dispatch_once(&AXLogSiriShortcuts_onceToken, &__block_literal_global_47);
  return (id)AXLogSiriShortcuts___logObj;
}

id AXLogAssertions()
{
  if (AXLogAssertions_onceToken != -1)
    dispatch_once(&AXLogAssertions_onceToken, &__block_literal_global_49);
  return (id)AXLogAssertions___logObj;
}

id AXLogTimeProfile()
{
  if (AXLogTimeProfile_onceToken != -1)
    dispatch_once(&AXLogTimeProfile_onceToken, &__block_literal_global_51);
  return (id)AXLogTimeProfile___logObj;
}

id AXLogMemoryProfile()
{
  if (AXLogMemoryProfile_onceToken != -1)
    dispatch_once(&AXLogMemoryProfile_onceToken, &__block_literal_global_53);
  return (id)AXLogMemoryProfile___logObj;
}

id AXLogLookingGlass()
{
  if (AXLogLookingGlass_onceToken != -1)
    dispatch_once(&AXLogLookingGlass_onceToken, &__block_literal_global_55);
  return (id)AXLogLookingGlass___logObj;
}

id AXLogLookingGlassUI()
{
  if (AXLogLookingGlassUI_onceToken != -1)
    dispatch_once(&AXLogLookingGlassUI_onceToken, &__block_literal_global_57);
  return (id)AXLogLookingGlassUI___logObj;
}

id AXLogAccessories()
{
  if (AXLogAccessories_onceToken != -1)
    dispatch_once(&AXLogAccessories_onceToken, &__block_literal_global_59);
  return (id)AXLogAccessories___logObj;
}

id AXLogUI()
{
  if (AXLogUI_onceToken != -1)
    dispatch_once(&AXLogUI_onceToken, &__block_literal_global_61);
  return (id)AXLogUI___logObj;
}

id AXLogBackboardServer()
{
  if (AXLogBackboardServer_onceToken != -1)
    dispatch_once(&AXLogBackboardServer_onceToken, &__block_literal_global_63);
  return (id)AXLogBackboardServer___logObj;
}

id AXLogSpringboardServer()
{
  if (AXLogSpringboardServer_onceToken != -1)
    dispatch_once(&AXLogSpringboardServer_onceToken, &__block_literal_global_65);
  return (id)AXLogSpringboardServer___logObj;
}

id AXLogSystemApp()
{
  if (AXLogSystemApp_onceToken != -1)
    dispatch_once(&AXLogSystemApp_onceToken, &__block_literal_global_67);
  return (id)AXLogSystemApp___logObj;
}

id AXLogPhysicalInteraction()
{
  if (AXLogPhysicalInteraction_onceToken != -1)
    dispatch_once(&AXLogPhysicalInteraction_onceToken, &__block_literal_global_69);
  return (id)AXLogPhysicalInteraction___logObj;
}

id AXLogAudioRouting()
{
  if (AXLogAudioRouting_onceToken != -1)
    dispatch_once(&AXLogAudioRouting_onceToken, &__block_literal_global_71);
  return (id)AXLogAudioRouting___logObj;
}

id ASTLogCommon()
{
  if (ASTLogCommon_onceToken != -1)
    dispatch_once(&ASTLogCommon_onceToken, &__block_literal_global_73);
  return (id)ASTLogCommon___logObj;
}

id ASTLogMouse()
{
  if (ASTLogMouse_onceToken != -1)
    dispatch_once(&ASTLogMouse_onceToken, &__block_literal_global_75);
  return (id)ASTLogMouse___logObj;
}

id AXLogAggregate()
{
  if (AXLogAggregate_onceToken != -1)
    dispatch_once(&AXLogAggregate_onceToken, &__block_literal_global_77);
  return (id)AXLogAggregate___logObj;
}

id AXLogUIA()
{
  if (AXLogUIA_onceToken != -1)
    dispatch_once(&AXLogUIA_onceToken, &__block_literal_global_79);
  return (id)AXLogUIA___logObj;
}

id AXLogLocCaptionPanel()
{
  if (AXLogLocCaptionPanel_onceToken != -1)
    dispatch_once(&AXLogLocCaptionPanel_onceToken, &__block_literal_global_81);
  return (id)AXLogLocCaptionPanel___logObj;
}

id AXLogContextKit()
{
  if (AXLogContextKit_onceToken != -1)
    dispatch_once(&AXLogContextKit_onceToken, &__block_literal_global_83);
  return (id)AXLogContextKit___logObj;
}

id AXLogPronunciations()
{
  if (AXLogPronunciations_onceToken != -1)
    dispatch_once(&AXLogPronunciations_onceToken, &__block_literal_global_85);
  return (id)AXLogPronunciations___logObj;
}

id AXLogBrailleHW()
{
  if (AXLogBrailleHW_onceToken != -1)
    dispatch_once(&AXLogBrailleHW_onceToken, &__block_literal_global_87);
  return (id)AXLogBrailleHW___logObj;
}

id AXLogBluetooth()
{
  if (AXLogBluetooth_onceToken != -1)
    dispatch_once(&AXLogBluetooth_onceToken, &__block_literal_global_89);
  return (id)AXLogBluetooth___logObj;
}

id AXLogFocusEngine()
{
  if (AXLogFocusEngine_onceToken != -1)
    dispatch_once(&AXLogFocusEngine_onceToken, &__block_literal_global_91);
  return (id)AXLogFocusEngine___logObj;
}

id AXLogSoundBoard()
{
  if (AXLogSoundBoard_onceToken != -1)
    dispatch_once(&AXLogSoundBoard_onceToken, &__block_literal_global_93);
  return (id)AXLogSoundBoard___logObj;
}

id FKALogCommon()
{
  if (FKALogCommon_onceToken != -1)
    dispatch_once(&FKALogCommon_onceToken, &__block_literal_global_95);
  return (id)FKALogCommon___logObj;
}

id GAXLogCommon()
{
  if (GAXLogCommon_onceToken != -1)
    dispatch_once(&GAXLogCommon_onceToken, &__block_literal_global_97);
  return (id)GAXLogCommon___logObj;
}

id GAXLogTimeRestrictions()
{
  if (GAXLogTimeRestrictions_onceToken != -1)
    dispatch_once(&GAXLogTimeRestrictions_onceToken, &__block_literal_global_99);
  return (id)GAXLogTimeRestrictions___logObj;
}

id GAXLogIntegrity()
{
  if (GAXLogIntegrity_onceToken != -1)
    dispatch_once(&GAXLogIntegrity_onceToken, &__block_literal_global_101);
  return (id)GAXLogIntegrity___logObj;
}

id GAXLogAppLaunching()
{
  if (GAXLogAppLaunching_onceToken != -1)
    dispatch_once(&GAXLogAppLaunching_onceToken, &__block_literal_global_103);
  return (id)GAXLogAppLaunching___logObj;
}

id GAXLogBlockedTouches()
{
  if (GAXLogBlockedTouches_onceToken != -1)
    dispatch_once(&GAXLogBlockedTouches_onceToken, &__block_literal_global_105);
  return (id)GAXLogBlockedTouches___logObj;
}

id AXLogInvertColors()
{
  if (AXLogInvertColors_onceToken != -1)
    dispatch_once(&AXLogInvertColors_onceToken, &__block_literal_global_107);
  return (id)AXLogInvertColors___logObj;
}

id AXLogInvertColorsTraversal()
{
  if (AXLogInvertColorsTraversal_onceToken != -1)
    dispatch_once(&AXLogInvertColorsTraversal_onceToken, &__block_literal_global_109);
  return (id)AXLogInvertColorsTraversal___logObj;
}

id AXLogInvertColorsLoadBundles()
{
  if (AXLogInvertColorsLoadBundles_onceToken != -1)
    dispatch_once(&AXLogInvertColorsLoadBundles_onceToken, &__block_literal_global_111);
  return (id)AXLogInvertColorsLoadBundles___logObj;
}

id AXLogMuseAccessibility()
{
  if (AXLogMuseAccessibility_onceToken != -1)
    dispatch_once(&AXLogMuseAccessibility_onceToken, &__block_literal_global_113);
  return (id)AXLogMuseAccessibility___logObj;
}

id AXLogAppAccessibility()
{
  if (AXLogAppAccessibility_onceToken != -1)
    dispatch_once(&AXLogAppAccessibility_onceToken, &__block_literal_global_115);
  return (id)AXLogAppAccessibility___logObj;
}

id AXLogAppCompareGeometry()
{
  if (AXLogAppCompareGeometry_onceToken != -1)
    dispatch_once(&AXLogAppCompareGeometry_onceToken, &__block_literal_global_117);
  return (id)AXLogAppCompareGeometry___logObj;
}

id AXLogValidations()
{
  if (AXLogValidations_onceToken != -1)
    dispatch_once(&AXLogValidations_onceToken, &__block_literal_global_119);
  return (id)AXLogValidations___logObj;
}

id AXLogValidationRunner()
{
  if (AXLogValidationRunner_onceToken != -1)
    dispatch_once(&AXLogValidationRunner_onceToken, &__block_literal_global_121);
  return (id)AXLogValidationRunner___logObj;
}

id AXLogElementTraversal()
{
  if (AXLogElementTraversal_onceToken != -1)
    dispatch_once(&AXLogElementTraversal_onceToken, &__block_literal_global_123);
  return (id)AXLogElementTraversal___logObj;
}

id AXLogFirstElement()
{
  if (AXLogFirstElement_onceToken != -1)
    dispatch_once(&AXLogFirstElement_onceToken, &__block_literal_global_125);
  return (id)AXLogFirstElement___logObj;
}

id AXLogHitTest()
{
  if (AXLogHitTest_onceToken != -1)
    dispatch_once(&AXLogHitTest_onceToken, &__block_literal_global_127);
  return (id)AXLogHitTest___logObj;
}

id AXLogScrollToVisible()
{
  if (AXLogScrollToVisible_onceToken != -1)
    dispatch_once(&AXLogScrollToVisible_onceToken, &__block_literal_global_129);
  return (id)AXLogScrollToVisible___logObj;
}

id AXLogVisibleFrame()
{
  if (AXLogVisibleFrame_onceToken != -1)
    dispatch_once(&AXLogVisibleFrame_onceToken, &__block_literal_global_131);
  return (id)AXLogVisibleFrame___logObj;
}

id AXLogOpaqueElements()
{
  if (AXLogOpaqueElements_onceToken != -1)
    dispatch_once(&AXLogOpaqueElements_onceToken, &__block_literal_global_133);
  return (id)AXLogOpaqueElements___logObj;
}

id AXLogLoading()
{
  if (AXLogLoading_onceToken != -1)
    dispatch_once(&AXLogLoading_onceToken, &__block_literal_global_135);
  return (id)AXLogLoading___logObj;
}

id AXLogVectorKit()
{
  if (AXLogVectorKit_onceToken != -1)
    dispatch_once(&AXLogVectorKit_onceToken, &__block_literal_global_137);
  return (id)AXLogVectorKit___logObj;
}

id AXLogRemoteElement()
{
  if (AXLogRemoteElement_onceToken != -1)
    dispatch_once(&AXLogRemoteElement_onceToken, &__block_literal_global_139);
  return (id)AXLogRemoteElement___logObj;
}

id AXLogEscape()
{
  if (AXLogEscape_onceToken != -1)
    dispatch_once(&AXLogEscape_onceToken, &__block_literal_global_141);
  return (id)AXLogEscape___logObj;
}

id MAGLogCommon()
{
  if (MAGLogCommon_onceToken != -1)
    dispatch_once(&MAGLogCommon_onceToken, &__block_literal_global_143);
  return (id)MAGLogCommon___logObj;
}

id MAGLogBrightness()
{
  if (MAGLogBrightness_onceToken != -1)
    dispatch_once(&MAGLogBrightness_onceToken, &__block_literal_global_145);
  return (id)MAGLogBrightness___logObj;
}

id AXLogMotionCues()
{
  if (AXLogMotionCues_onceToken != -1)
    dispatch_once(&AXLogMotionCues_onceToken, &__block_literal_global_147);
  return (id)AXLogMotionCues___logObj;
}

id AXLogSpeechAssetDownload()
{
  if (AXLogSpeechAssetDownload_onceToken != -1)
    dispatch_once(&AXLogSpeechAssetDownload_onceToken, &__block_literal_global_149);
  return (id)AXLogSpeechAssetDownload___logObj;
}

id AXLogCharacterVoices()
{
  if (AXLogCharacterVoices_onceToken != -1)
    dispatch_once(&AXLogCharacterVoices_onceToken, &__block_literal_global_151);
  return (id)AXLogCharacterVoices___logObj;
}

id AXLogSpeechSynthesis()
{
  if (AXLogSpeechSynthesis_onceToken != -1)
    dispatch_once(&AXLogSpeechSynthesis_onceToken, &__block_literal_global_153);
  return (id)AXLogSpeechSynthesis___logObj;
}

id AXLogOrator()
{
  if (AXLogOrator_onceToken != -1)
    dispatch_once(&AXLogOrator_onceToken, &__block_literal_global_155);
  return (id)AXLogOrator___logObj;
}

id AXLogSpeakSelection()
{
  if (AXLogSpeakSelection_onceToken != -1)
    dispatch_once(&AXLogSpeakSelection_onceToken, &__block_literal_global_157);
  return (id)AXLogSpeakSelection___logObj;
}

id AXLogSpeakTyping()
{
  if (AXLogSpeakTyping_onceToken != -1)
    dispatch_once(&AXLogSpeakTyping_onceToken, &__block_literal_global_159);
  return (id)AXLogSpeakTyping___logObj;
}

id AXLogSpeakScreen()
{
  if (AXLogSpeakScreen_onceToken != -1)
    dispatch_once(&AXLogSpeakScreen_onceToken, &__block_literal_global_161);
  return (id)AXLogSpeakScreen___logObj;
}

id AXLogSpeakFingerManager()
{
  if (AXLogSpeakFingerManager_onceToken != -1)
    dispatch_once(&AXLogSpeakFingerManager_onceToken, &__block_literal_global_163);
  return (id)AXLogSpeakFingerManager___logObj;
}

id AXLogSpokenContentTextProcessing()
{
  if (AXLogSpokenContentTextProcessing_onceToken != -1)
    dispatch_once(&AXLogSpokenContentTextProcessing_onceToken, &__block_literal_global_165);
  return (id)AXLogSpokenContentTextProcessing___logObj;
}

id SWCHLogCommon()
{
  if (SWCHLogCommon_onceToken != -1)
    dispatch_once(&SWCHLogCommon_onceToken, &__block_literal_global_167);
  return (id)SWCHLogCommon___logObj;
}

id SWCHLogElementNav()
{
  if (SWCHLogElementNav_onceToken != -1)
    dispatch_once(&SWCHLogElementNav_onceToken, &__block_literal_global_169);
  return (id)SWCHLogElementNav___logObj;
}

id SWCHLogPauseResume()
{
  if (SWCHLogPauseResume_onceToken != -1)
    dispatch_once(&SWCHLogPauseResume_onceToken, &__block_literal_global_171);
  return (id)SWCHLogPauseResume___logObj;
}

id SWCHLogHW()
{
  if (SWCHLogHW_onceToken != -1)
    dispatch_once(&SWCHLogHW_onceToken, &__block_literal_global_173);
  return (id)SWCHLogHW___logObj;
}

id AXLogTapticTime()
{
  if (AXLogTapticTime_onceToken != -1)
    dispatch_once(&AXLogTapticTime_onceToken, &__block_literal_global_175);
  return (id)AXLogTapticTime___logObj;
}

id AXLogTouchAccommodations()
{
  if (AXLogTouchAccommodations_onceToken != -1)
    dispatch_once(&AXLogTouchAccommodations_onceToken, &__block_literal_global_177);
  return (id)AXLogTouchAccommodations___logObj;
}

id AXLogIDS()
{
  if (AXLogIDS_onceToken != -1)
    dispatch_once(&AXLogIDS_onceToken, &__block_literal_global_179);
  return (id)AXLogIDS___logObj;
}

id VOTLogCommon()
{
  if (VOTLogCommon_onceToken != -1)
    dispatch_once(&VOTLogCommon_onceToken, &__block_literal_global_181);
  return (id)VOTLogCommon___logObj;
}

id VOTLogLayoutChange()
{
  if (VOTLogLayoutChange_onceToken != -1)
    dispatch_once(&VOTLogLayoutChange_onceToken, &__block_literal_global_183);
  return (id)VOTLogLayoutChange___logObj;
}

id VOTLogHandwriting()
{
  if (VOTLogHandwriting_onceToken != -1)
    dispatch_once(&VOTLogHandwriting_onceToken, &__block_literal_global_185);
  return (id)VOTLogHandwriting___logObj;
}

id VOTLogSpeech()
{
  if (VOTLogSpeech_onceToken != -1)
    dispatch_once(&VOTLogSpeech_onceToken, &__block_literal_global_187);
  return (id)VOTLogSpeech___logObj;
}

id VOTLogICloud()
{
  if (VOTLogICloud_onceToken != -1)
    dispatch_once(&VOTLogICloud_onceToken, &__block_literal_global_189);
  return (id)VOTLogICloud___logObj;
}

id VOTLogAudio()
{
  if (VOTLogAudio_onceToken != -1)
    dispatch_once(&VOTLogAudio_onceToken, &__block_literal_global_191);
  return (id)VOTLogAudio___logObj;
}

id VOTLogElement()
{
  if (VOTLogElement_onceToken != -1)
    dispatch_once(&VOTLogElement_onceToken, &__block_literal_global_193);
  return (id)VOTLogElement___logObj;
}

id VOTLogEvent()
{
  if (VOTLogEvent_onceToken != -1)
    dispatch_once(&VOTLogEvent_onceToken, &__block_literal_global_195);
  return (id)VOTLogEvent___logObj;
}

id VOTLogBraille()
{
  if (VOTLogBraille_onceToken != -1)
    dispatch_once(&VOTLogBraille_onceToken, &__block_literal_global_197);
  return (id)VOTLogBraille___logObj;
}

id VOTLogBrailleGestures()
{
  if (VOTLogBrailleGestures_onceToken != -1)
    dispatch_once(&VOTLogBrailleGestures_onceToken, &__block_literal_global_199);
  return (id)VOTLogBrailleGestures___logObj;
}

id VOTLogNotifications()
{
  if (VOTLogNotifications_onceToken != -1)
    dispatch_once(&VOTLogNotifications_onceToken, &__block_literal_global_201);
  return (id)VOTLogNotifications___logObj;
}

id VOTLogKeyboard()
{
  if (VOTLogKeyboard_onceToken != -1)
    dispatch_once(&VOTLogKeyboard_onceToken, &__block_literal_global_203);
  return (id)VOTLogKeyboard___logObj;
}

id VOTLogTVFocus()
{
  if (VOTLogTVFocus_onceToken != -1)
    dispatch_once(&VOTLogTVFocus_onceToken, &__block_literal_global_205);
  return (id)VOTLogTVFocus___logObj;
}

id VOTLogTVExplorer()
{
  if (VOTLogTVExplorer_onceToken != -1)
    dispatch_once(&VOTLogTVExplorer_onceToken, &__block_literal_global_207);
  return (id)VOTLogTVExplorer___logObj;
}

id VOTLogIAP()
{
  if (VOTLogIAP_onceToken != -1)
    dispatch_once(&VOTLogIAP_onceToken, &__block_literal_global_209);
  return (id)VOTLogIAP___logObj;
}

id VOTLogLifeCycle()
{
  if (VOTLogLifeCycle_onceToken != -1)
    dispatch_once(&VOTLogLifeCycle_onceToken, &__block_literal_global_211);
  return (id)VOTLogLifeCycle___logObj;
}

id VOTLogMagicTap()
{
  if (VOTLogMagicTap_onceToken != -1)
    dispatch_once(&VOTLogMagicTap_onceToken, &__block_literal_global_213);
  return (id)VOTLogMagicTap___logObj;
}

id VOTLogRotor()
{
  if (VOTLogRotor_onceToken != -1)
    dispatch_once(&VOTLogRotor_onceToken, &__block_literal_global_215);
  return (id)VOTLogRotor___logObj;
}

id VOTLogQuickSettings()
{
  if (VOTLogQuickSettings_onceToken != -1)
    dispatch_once(&VOTLogQuickSettings_onceToken, &__block_literal_global_217);
  return (id)VOTLogQuickSettings___logObj;
}

id VOTLogSimpleTap()
{
  if (VOTLogSimpleTap_onceToken != -1)
    dispatch_once(&VOTLogSimpleTap_onceToken, &__block_literal_global_219);
  return (id)VOTLogSimpleTap___logObj;
}

id AXLogPunctuationStorage()
{
  if (AXLogPunctuationStorage_onceToken != -1)
    dispatch_once(&AXLogPunctuationStorage_onceToken, &__block_literal_global_221);
  return (id)AXLogPunctuationStorage___logObj;
}

id VOTLogActivities()
{
  if (VOTLogActivities_onceToken != -1)
    dispatch_once(&VOTLogActivities_onceToken, &__block_literal_global_223);
  return (id)VOTLogActivities___logObj;
}

id VOTLogWebPageMovement()
{
  if (VOTLogWebPageMovement_onceToken != -1)
    dispatch_once(&VOTLogWebPageMovement_onceToken, &__block_literal_global_225);
  return (id)VOTLogWebPageMovement___logObj;
}

id VOTLogCommands()
{
  if (VOTLogCommands_onceToken != -1)
    dispatch_once(&VOTLogCommands_onceToken, &__block_literal_global_227);
  return (id)VOTLogCommands___logObj;
}

id VOTLogImageExplorer()
{
  if (VOTLogImageExplorer_onceToken != -1)
    dispatch_once(&VOTLogImageExplorer_onceToken, &__block_literal_global_229);
  return (id)VOTLogImageExplorer___logObj;
}

id AXLogVisualAlerts()
{
  if (AXLogVisualAlerts_onceToken != -1)
    dispatch_once(&AXLogVisualAlerts_onceToken, &__block_literal_global_231);
  return (id)AXLogVisualAlerts___logObj;
}

id AXLogRTT()
{
  if (AXLogRTT_onceToken != -1)
    dispatch_once(&AXLogRTT_onceToken, &__block_literal_global_233);
  return (id)AXLogRTT___logObj;
}

id AXLogUltron()
{
  if (AXLogUltron_onceToken != -1)
    dispatch_once(&AXLogUltron_onceToken, &__block_literal_global_235);
  return (id)AXLogUltron___logObj;
}

id AXLogUltronKShot()
{
  if (AXLogUltronKShot_onceToken != -1)
    dispatch_once(&AXLogUltronKShot_onceToken, &__block_literal_global_237);
  return (id)AXLogUltronKShot___logObj;
}

id AXLogAudiogram()
{
  if (AXLogAudiogram_onceToken != -1)
    dispatch_once(&AXLogAudiogram_onceToken, &__block_literal_global_239);
  return (id)AXLogAudiogram___logObj;
}

id AXLogDisplayFilters()
{
  if (AXLogDisplayFilters_onceToken != -1)
    dispatch_once(&AXLogDisplayFilters_onceToken, &__block_literal_global_241);
  return (id)AXLogDisplayFilters___logObj;
}

id ZOOMLogCommon()
{
  if (ZOOMLogCommon_onceToken != -1)
    dispatch_once(&ZOOMLogCommon_onceToken, &__block_literal_global_243);
  return (id)ZOOMLogCommon___logObj;
}

id ZOOMLogEvents()
{
  if (ZOOMLogEvents_onceToken != -1)
    dispatch_once(&ZOOMLogEvents_onceToken, &__block_literal_global_245);
  return (id)ZOOMLogEvents___logObj;
}

id AXLogUnitTesting()
{
  if (AXLogUnitTesting_onceToken != -1)
    dispatch_once(&AXLogUnitTesting_onceToken, &__block_literal_global_247);
  return (id)AXLogUnitTesting___logObj;
}

id AXLogPerfTesting()
{
  if (AXLogPerfTesting_onceToken != -1)
    dispatch_once(&AXLogPerfTesting_onceToken, &__block_literal_global_249);
  return (id)AXLogPerfTesting___logObj;
}

id AXMediaLogCommon()
{
  if (AXMediaLogCommon_onceToken != -1)
    dispatch_once(&AXMediaLogCommon_onceToken, &__block_literal_global_251);
  return (id)AXMediaLogCommon___logObj;
}

id AXMediaLogSettings()
{
  if (AXMediaLogSettings_onceToken != -1)
    dispatch_once(&AXMediaLogSettings_onceToken, &__block_literal_global_253);
  return (id)AXMediaLogSettings___logObj;
}

id AXMediaLogService()
{
  if (AXMediaLogService_onceToken != -1)
    dispatch_once(&AXMediaLogService_onceToken, &__block_literal_global_255);
  return (id)AXMediaLogService___logObj;
}

id AXMediaLogEngineCache()
{
  if (AXMediaLogEngineCache_onceToken != -1)
    dispatch_once(&AXMediaLogEngineCache_onceToken, &__block_literal_global_257);
  return (id)AXMediaLogEngineCache___logObj;
}

id AXMediaLogEnginePriority()
{
  if (AXMediaLogEnginePriority_onceToken != -1)
    dispatch_once(&AXMediaLogEnginePriority_onceToken, &__block_literal_global_259);
  return (id)AXMediaLogEnginePriority___logObj;
}

id AXMediaLogScreenGrab()
{
  if (AXMediaLogScreenGrab_onceToken != -1)
    dispatch_once(&AXMediaLogScreenGrab_onceToken, &__block_literal_global_261);
  return (id)AXMediaLogScreenGrab___logObj;
}

id AXMediaLogOCR()
{
  if (AXMediaLogOCR_onceToken != -1)
    dispatch_once(&AXMediaLogOCR_onceToken, &__block_literal_global_263);
  return (id)AXMediaLogOCR___logObj;
}

id AXMediaLogMLElement()
{
  if (AXMediaLogMLElement_onceToken != -1)
    dispatch_once(&AXMediaLogMLElement_onceToken, &__block_literal_global_265);
  return (id)AXMediaLogMLElement___logObj;
}

id AXMediaLogTextProcessing()
{
  if (AXMediaLogTextProcessing_onceToken != -1)
    dispatch_once(&AXMediaLogTextProcessing_onceToken, &__block_literal_global_267);
  return (id)AXMediaLogTextProcessing___logObj;
}

id AXMediaLogElementVision()
{
  if (AXMediaLogElementVision_onceToken != -1)
    dispatch_once(&AXMediaLogElementVision_onceToken, &__block_literal_global_269);
  return (id)AXMediaLogElementVision___logObj;
}

id AXMediaLogTextLayout()
{
  if (AXMediaLogTextLayout_onceToken != -1)
    dispatch_once(&AXMediaLogTextLayout_onceToken, &__block_literal_global_271);
  return (id)AXMediaLogTextLayout___logObj;
}

id AXMediaLogResults()
{
  if (AXMediaLogResults_onceToken != -1)
    dispatch_once(&AXMediaLogResults_onceToken, &__block_literal_global_273);
  return (id)AXMediaLogResults___logObj;
}

id AXMediaLogTracking()
{
  if (AXMediaLogTracking_onceToken != -1)
    dispatch_once(&AXMediaLogTracking_onceToken, &__block_literal_global_275);
  return (id)AXMediaLogTracking___logObj;
}

id AXMediaLogOutput()
{
  if (AXMediaLogOutput_onceToken != -1)
    dispatch_once(&AXMediaLogOutput_onceToken, &__block_literal_global_277);
  return (id)AXMediaLogOutput___logObj;
}

id AXMediaLogSpeech()
{
  if (AXMediaLogSpeech_onceToken != -1)
    dispatch_once(&AXMediaLogSpeech_onceToken, &__block_literal_global_279);
  return (id)AXMediaLogSpeech___logObj;
}

id AXMediaLogSounds()
{
  if (AXMediaLogSounds_onceToken != -1)
    dispatch_once(&AXMediaLogSounds_onceToken, &__block_literal_global_281);
  return (id)AXMediaLogSounds___logObj;
}

id AXMediaLogHaptics()
{
  if (AXMediaLogHaptics_onceToken != -1)
    dispatch_once(&AXMediaLogHaptics_onceToken, &__block_literal_global_283);
  return (id)AXMediaLogHaptics___logObj;
}

id AXMediaLogCaptionDescriptions()
{
  if (AXMediaLogCaptionDescriptions_onceToken != -1)
    dispatch_once(&AXMediaLogCaptionDescriptions_onceToken, &__block_literal_global_285);
  return (id)AXMediaLogCaptionDescriptions___logObj;
}

id AXMediaLogDiagnostics()
{
  if (AXMediaLogDiagnostics_onceToken != -1)
    dispatch_once(&AXMediaLogDiagnostics_onceToken, &__block_literal_global_287);
  return (id)AXMediaLogDiagnostics___logObj;
}

id AXMediaLogLanguageTranslation()
{
  if (AXMediaLogLanguageTranslation_onceToken != -1)
    dispatch_once(&AXMediaLogLanguageTranslation_onceToken, &__block_literal_global_289);
  return (id)AXMediaLogLanguageTranslation___logObj;
}

id AXLogAirPodSettings()
{
  if (AXLogAirPodSettings_onceToken != -1)
    dispatch_once(&AXLogAirPodSettings_onceToken, &__block_literal_global_291);
  return (id)AXLogAirPodSettings___logObj;
}

id AXLogAssetLoader()
{
  if (AXLogAssetLoader_onceToken != -1)
    dispatch_once(&AXLogAssetLoader_onceToken, &__block_literal_global_293);
  return (id)AXLogAssetLoader___logObj;
}

id AXLogAssetDaemon()
{
  if (AXLogAssetDaemon_onceToken != -1)
    dispatch_once(&AXLogAssetDaemon_onceToken, &__block_literal_global_295);
  return (id)AXLogAssetDaemon___logObj;
}

id AXPlatformTranslationLogCommon()
{
  if (AXPlatformTranslationLogCommon_onceToken != -1)
    dispatch_once(&AXPlatformTranslationLogCommon_onceToken, &__block_literal_global_297);
  return (id)AXPlatformTranslationLogCommon___logObj;
}

id AXLogTemp()
{
  if (AXLogTemp_onceToken != -1)
    dispatch_once(&AXLogTemp_onceToken, &__block_literal_global_299);
  return (id)AXLogTemp___logObj;
}

id BRLLogTranslation()
{
  if (BRLLogTranslation_onceToken != -1)
    dispatch_once(&BRLLogTranslation_onceToken, &__block_literal_global_301);
  return (id)BRLLogTranslation___logObj;
}

id AXLogBackTap()
{
  if (AXLogBackTap_onceToken != -1)
    dispatch_once(&AXLogBackTap_onceToken, &__block_literal_global_303);
  return (id)AXLogBackTap___logObj;
}

id AXLogSoundActions()
{
  if (AXLogSoundActions_onceToken != -1)
    dispatch_once(&AXLogSoundActions_onceToken, &__block_literal_global_305);
  return (id)AXLogSoundActions___logObj;
}

id CLFLogCommon()
{
  if (CLFLogCommon_onceToken != -1)
    dispatch_once(&CLFLogCommon_onceToken, &__block_literal_global_307);
  return (id)CLFLogCommon___logObj;
}

id CLFLogSettings()
{
  if (CLFLogSettings_onceToken != -1)
    dispatch_once(&CLFLogSettings_onceToken, &__block_literal_global_309);
  return (id)CLFLogSettings___logObj;
}

id HTLogCommon()
{
  if (HTLogCommon_onceToken != -1)
    dispatch_once(&HTLogCommon_onceToken, &__block_literal_global_311);
  return (id)HTLogCommon___logObj;
}

id LiveSpeechLogCommon()
{
  if (LiveSpeechLogCommon_onceToken != -1)
    dispatch_once(&LiveSpeechLogCommon_onceToken, &__block_literal_global_313);
  return (id)LiveSpeechLogCommon___logObj;
}

id AXLogLiveTranscription()
{
  if (AXLogLiveTranscription_onceToken != -1)
    dispatch_once(&AXLogLiveTranscription_onceToken, &__block_literal_global_315);
  return (id)AXLogLiveTranscription___logObj;
}

id AXLogTwiceRemoteScreen()
{
  if (AXLogTwiceRemoteScreen_onceToken != -1)
    dispatch_once(&AXLogTwiceRemoteScreen_onceToken, &__block_literal_global_317);
  return (id)AXLogTwiceRemoteScreen___logObj;
}

id AXLogHapticMusic()
{
  if (AXLogHapticMusic_onceToken != -1)
    dispatch_once(&AXLogHapticMusic_onceToken, &__block_literal_global_319);
  return (id)AXLogHapticMusic___logObj;
}

id AXLogAVS()
{
  if (AXLogAVS_onceToken != -1)
    dispatch_once(&AXLogAVS_onceToken, &__block_literal_global_321);
  return (id)AXLogAVS___logObj;
}

uint64_t _AXSIsInternalUIBuild()
{
  return os_variant_has_internal_ui();
}

uint64_t _AXSSetWriteableClient(uint64_t result)
{
  _kAXSWriteableClient = result;
  return result;
}

uint64_t AXSAccessibilityUtilitiesPath()
{
  void *v0;
  uint64_t v1;

  AXSystemRootDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("System/Library/PrivateFrameworks/AccessibilityUtilities.framework"));

  return v1;
}

uint64_t _AXSCopyPathForAccessibilityBundle(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  AXAccessibilityBundlesDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.axbundle"), a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = objc_claimAutoreleasedReturnValue();

  return v4;
}

void _axsHandlePrefChanged(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___axsHandlePrefChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void _axsHandlePrefChangedApp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___axsHandlePrefChangedApp_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void _axsHandleSystemUILoadInvertBundles()
{
  NSObject *v0;
  NSObject *v1;
  __CFNotificationCenter *LocalCenter;
  uint8_t v3[16];

  if (_AXSProcessLoadsInvertBundlesForPerAppSmartInvert())
  {
    AXLogInvertColorsLoadBundles();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
      _axsHandleSystemUILoadInvertBundles_cold_1();

    if (!_kAXSystemUIProcessShouldLoadInvertBundles)
    {
      if (_AXSProcessIsSpringBoard_onceToken != -1)
        dispatch_once(&_AXSProcessIsSpringBoard_onceToken, &__block_literal_global_1634);
      if (_AXSProcessIsSpringBoard__AXSProcessIsSpringBoard == 1)
      {
        AXLogInvertColorsLoadBundles();
        v1 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v3 = 0;
          _os_log_impl(&dword_18F1A7000, v1, OS_LOG_TYPE_DEFAULT, "Saving SystemUIProcessShouldLoadInvertBundles as true", v3, 2u);
        }

        CFPreferencesSetValue(CFSTR("AXSSystemUIProcessAppSmartInvertEnabledPreference"), (CFPropertyListRef)*MEMORY[0x1E0C9AE50], (CFStringRef)kAXSAccessibilityPreferenceDomain, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      }
    }
    _kAXSystemUIProcessShouldLoadInvertBundles = 1;
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, kAXSInvertColorsEnabledNotification[0], 0, 0, 1u);
  }
}

uint64_t AXSGetCachedSmartInvert()
{
  if (AXSGetCachedSmartInvert_onceToken != -1)
    dispatch_once(&AXSGetCachedSmartInvert_onceToken, &__block_literal_global_1068);
  return _kAXSCacheInvertColors;
}

uint64_t _AXSDisableDomainSynching(uint64_t result)
{
  _AXDisableSynching = result;
  return result;
}

uint64_t _AXSVideosPreferenceDomain()
{
  if (_AXSVideosPreferenceDomain_onceToken != -1)
    dispatch_once(&_AXSVideosPreferenceDomain_onceToken, &__block_literal_global_1073);
  return _AXSVideosPreferenceDomain_Domain;
}

uint64_t _AXSHearingAidsPaired()
{
  if (_AXSHearingAidsPaired_onceToken != -1)
    dispatch_once(&_AXSHearingAidsPaired_onceToken, &__block_literal_global_1309);
  return _kAXSCacheHearingAidPaired;
}

uint64_t _AXSLocalizationCaptionMode()
{
  if (_AXSLocalizationCaptionMode_onceToken != -1)
    dispatch_once(&_AXSLocalizationCaptionMode_onceToken, &__block_literal_global_1402);
  return _kAXSCacheLocalizationCaptionModeEnabled;
}

uint64_t _AXSClipTracerAccessibilityModeEnabled()
{
  if (_AXSClipTracerAccessibilityModeEnabled_onceToken != -1)
    dispatch_once(&_AXSClipTracerAccessibilityModeEnabled_onceToken, &__block_literal_global_1433);
  return _kAXSCacheClipTracerAccessibilityModeEnabled;
}

uint64_t _AXSNocturneAccessibilityModeEnabled()
{
  if (_AXSNocturneAccessibilityModeEnabled_onceToken != -1)
    dispatch_once(&_AXSNocturneAccessibilityModeEnabled_onceToken, &__block_literal_global_1432);
  return _kAXSCacheNocturneAccessibilityModeEnabled;
}

uint64_t _AXSAuditInspectionModeEnabled()
{
  if (_AXSAuditInspectionModeEnabled_onceToken != -1)
    dispatch_once(&_AXSAuditInspectionModeEnabled_onceToken, &__block_literal_global_1431);
  return _kAXSCacheAuditInspectionModeModeEnabled;
}

uint64_t _AXSCommandAndControlCarPlayEnabled()
{
  if (_AXSCommandAndControlCarPlayEnabled_onceToken != -1)
    dispatch_once(&_AXSCommandAndControlCarPlayEnabled_onceToken, &__block_literal_global_1251);
  return _kAXSCacheCommandAndControlCarPlayEnabled;
}

uint64_t _AXSWatchControlEnabled()
{
  if (_AXSWatchControlEnabled_onceToken != -1)
    dispatch_once(&_AXSWatchControlEnabled_onceToken, &__block_literal_global_1592);
  return _kAXSCacheWatchControlEnabled;
}

uint64_t _AXSHoverTextTypingEnabled()
{
  if (_AXSHoverTextTypingEnabled_onceToken != -1)
    dispatch_once(&_AXSHoverTextTypingEnabled_onceToken, &__block_literal_global_1538);
  return _kAXSCacheHoverTextTypingEnabled;
}

const __CFBoolean *_AXSBackgroundSoundsEnabled()
{
  const __CFBoolean *result;
  const __CFBoolean *v1;
  uint64_t Value;

  result = (const __CFBoolean *)_copyValuePreferenceApp(CFSTR("comfortSoundsEnabled"), CFSTR("com.apple.ComfortSounds"), 0);
  if (result)
  {
    v1 = result;
    Value = CFBooleanGetValue(result);
    CFRelease(v1);
    return (const __CFBoolean *)Value;
  }
  return result;
}

BOOL _AXSInvertColorsEnabledGlobalCached()
{
  _AXSInvertColorsEnabled();
  return _kAXSCacheInvertColorsGlobal == 1;
}

void _AXSAccessibilitySetiTunesPreference(__CFString *a1, void *a2)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  id v5;

  _setPreferenceAppWithNotification(a1, 0, a2, (const __CFString *)-[__CFString stringByAppendingString:](a1, "stringByAppendingString:", CFSTR(".notification")));
  v5 = a2;
  if (CFEqual(a1, (CFTypeRef)kAXSVoiceOverTouchEnabledByiTunesPreference))
  {
    _kAXSCacheVoiceOverTouchEnabled = objc_msgSend(v5, "BOOLValue");
  }
  else if (CFEqual(a1, (CFTypeRef)kAXSZoomTouchEnabledByiTunesPreference))
  {
    _kAXSCacheZoomTouchEnabled = objc_msgSend(v5, "BOOLValue");
  }
  else if (CFEqual(a1, (CFTypeRef)kAXSInvertColorsEnabledByiTunesPreference))
  {
    _AXSInvertColorsSetEnabled(objc_msgSend(v5, "BOOLValue"));
  }
  else if (CFEqual(a1, (CFTypeRef)kAXSMonoAudioEnabledByiTunesPreference))
  {
    _kAXSCacheMonoAudioEnabled = objc_msgSend(v5, "BOOLValue");
  }
  else if (CFEqual(a1, (CFTypeRef)kAXSAssistiveTouchEnabledByiTunesPreference))
  {
    _kAXSAssistiveTouchEnabledCache = objc_msgSend(v5, "BOOLValue");
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSiTunesAccessibilityStatusChangedNotification, 0, 0, 1u);

}

void _AXSInvertColorsSetEnabled(int a1)
{
  int BooleanPreference;
  BOOL v3;
  char v4;

  _kAXSCacheInvertColorsGlobal = a1 != 0;
  _AXSInvertColorsSetEnabledApp(_kAXSCacheInvertColorsGlobal, 0);
  _AXSInvertColorsDisplaySetEnabled(a1);
  v4 = 0;
  BooleanPreference = _getBooleanPreference((const __CFString *)kAXSInvertColorsEnabledByiTunesPreference, &v4);
  if (v4)
    v3 = BooleanPreference == a1;
  else
    v3 = 1;
  if (!v3)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSInvertColorsEnabledByiTunesPreference, 0, 0, 0);
    _updateAccessibilitySettings();
  }
}

CFNumberRef _AXSAccessibilityCopyiTunesPreference(const void *a1)
{
  unsigned __int8 AppBooleanValue;
  char v4;
  char valuePtr;

  valuePtr = 0;
  if (CFEqual(a1, (CFTypeRef)kAXSVoiceOverTouchEnabledByiTunesPreference))
  {
    AppBooleanValue = _AXSVoiceOverTouchEnabled();
  }
  else if (CFEqual(a1, (CFTypeRef)kAXSZoomTouchEnabledByiTunesPreference))
  {
    AppBooleanValue = _AXSZoomTouchEnabled();
  }
  else
  {
    if (!CFEqual(a1, (CFTypeRef)kAXSInvertColorsEnabledByiTunesPreference))
    {
      if (CFEqual(a1, (CFTypeRef)kAXSMonoAudioEnabledByiTunesPreference))
      {
        if (_AXSMonoAudioEnabled_onceToken != -1)
          dispatch_once(&_AXSMonoAudioEnabled_onceToken, &__block_literal_global_1311);
        v4 = _kAXSCacheMonoAudioEnabled;
      }
      else
      {
        if (!CFEqual(a1, (CFTypeRef)kAXSAssistiveTouchEnabledByiTunesPreference))
        {
          if (CFEqual(a1, (CFTypeRef)kAXSSpeakAutoCorrectionsEnabledByiTunesPreference))
          {
            AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)kAXSSpeakCorrectionsEnabledPreference, (CFStringRef)kAXSAccessibilityPreferenceDomain, 0);
          }
          else
          {
            if (!CFEqual(a1, (CFTypeRef)kAXSClosedCaptioningEnabledByiTunesPreference))
              return CFNumberCreate(0, kCFNumberCharType, &valuePtr);
            AppBooleanValue = _AXSClosedCaptionsEnabled();
          }
          goto LABEL_7;
        }
        if (_AXSAssistiveTouchEnabled_onceToken != -1)
          dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1207);
        v4 = _kAXSAssistiveTouchEnabledCache;
      }
      valuePtr = v4;
      return CFNumberCreate(0, kCFNumberCharType, &valuePtr);
    }
    AppBooleanValue = _AXSInvertColorsEnabled();
  }
LABEL_7:
  valuePtr = AppBooleanValue;
  return CFNumberCreate(0, kCFNumberCharType, &valuePtr);
}

void _removePreference(const __CFString *a1, const __CFString *a2)
{
  _setPreferenceAppWithNotification(a1, 0, 0, a2);
  _updateAccessibilitySettings();
}

void *_AXSCopyPreferenceValue(const __CFString *a1, _BYTE *a2)
{
  return _copyValuePreferenceApp(a1, 0, a2);
}

void _AXSetPreferenceWithNotification(const __CFString *a1, const void *a2, const __CFString *a3)
{
  _setPreferenceAppWithNotification(a1, 0, a2, a3);
  _updateAccessibilitySettings();
}

float _getFloatPreference(const __CFString *a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  float v7;
  float v8;

  v5 = (void *)MEMORY[0x1940002E8]();
  if (a3)
    *a3 = 1;
  v6 = _copyValuePreferenceApp(a1, 0, 0);
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "floatValue");
    v8 = v7;
  }
  else
  {
    if (a3)
      *a3 = 0;
    v8 = 3.4028e38;
  }

  objc_autoreleasePoolPop(v5);
  return v8;
}

void _AXSAssistiveTouchKickstart()
{
  _kickstartProcess("com.apple.assistivetouchd");
}

void _kickstartProcess(char *service_name)
{
  kern_return_t v2;
  BOOL v3;
  kern_return_t v4;
  NSObject *v5;
  mach_msg_id_t v6;
  const char *v7;
  const char *v8;
  uint8_t *p_msg;
  NSObject *v10;
  uint32_t v11;
  mach_msg_return_t v12;
  mach_msg_return_t v13;
  mach_port_t sp;
  uint8_t buf[4];
  char *v16;
  __int16 v17;
  mach_msg_return_t v18;
  __int16 v19;
  mach_port_t v20;
  mach_msg_header_t msg;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  sp = 0;
  v2 = bootstrap_look_up(*MEMORY[0x1E0C81720], service_name, &sp);
  if (sp)
    v3 = v2 == 0;
  else
    v3 = 0;
  if (v3)
  {
    *(_QWORD *)&msg.msgh_bits = 0x1800001413;
    msg.msgh_remote_port = sp;
    msg.msgh_local_port = 0;
    msg.msgh_voucher_port = 0;
    msg.msgh_id = 1776;
    v12 = mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0);
    if (!v12)
      return;
    v13 = v12;
    AXSupportLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = service_name;
      v17 = 1024;
      v18 = v13;
      v19 = 1024;
      v20 = sp;
      v8 = "Could not kickstart %s [%d - port: %d]";
      p_msg = buf;
      v10 = v5;
      v11 = 24;
      goto LABEL_12;
    }
  }
  else
  {
    v4 = v2;
    AXSupportLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = sp;
      v7 = bootstrap_strerror(v4);
      msg.msgh_bits = 136315906;
      *(_QWORD *)&msg.msgh_size = service_name;
      LOWORD(msg.msgh_local_port) = 1024;
      *(mach_port_t *)((char *)&msg.msgh_local_port + 2) = v4;
      HIWORD(msg.msgh_voucher_port) = 1024;
      msg.msgh_id = v6;
      v22 = 2080;
      v23 = v7;
      v8 = "Could not look up process with name: %s [%d - port: %d] - error: %s";
      p_msg = (uint8_t *)&msg;
      v10 = v5;
      v11 = 34;
LABEL_12:
      _os_log_error_impl(&dword_18F1A7000, v10, OS_LOG_TYPE_ERROR, v8, p_msg, v11);
    }
  }

}

void _setValuePreference(const __CFString *a1, const void *a2, const __CFString *a3)
{
  _setPreferenceAppWithNotification(a1, 0, a2, a3);
}

uint64_t _isProcessDistributedNotificationSender()
{
  if (_AXSCurrentProcessIsWebContent_onceToken != -1)
    dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
  return _AXSCurrentProcessIsWebContent_IsWebContent ^ 1u;
}

uint64_t _AXSCurrentProcessIsWebContent()
{
  if (_AXSCurrentProcessIsWebContent_onceToken != -1)
    dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
  return _AXSCurrentProcessIsWebContent_IsWebContent;
}

void _AXSForcePreferenceUpdate(const __CFString *a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v3;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;
  __CFNotificationCenter *v7;
  __CFNotificationCenter *v8;

  if (CFEqual(a1, (CFTypeRef)kAXSVoiceOverTouchEnabledPreference))
  {
    _kAXSCacheVoiceOverTouchEnabled = _getBooleanPreference(a1, 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSVoiceOverTouchEnabledNotification, 0, 0, 1u);
  }
  if (CFEqual(a1, (CFTypeRef)kAXSBrailleScreenInputEnabledPreference))
  {
    _kAXSCacheBrailleScreenInputEnabled = _getBooleanPreference(a1, 0);
    v3 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v3, (CFNotificationName)kAXSBrailleScreenInputEnabledNotification, 0, 0, 1u);
  }
  if (CFEqual(a1, (CFTypeRef)kAXSHoverTextEnabledPreference))
  {
    _kAXSCacheHoverTextEnabled = _getBooleanPreference(a1, 0);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v4, (CFNotificationName)kAXSHoverTextEnabledNotification, 0, 0, 1u);
  }
  if (CFEqual(a1, (CFTypeRef)kAXSHoverTextTypingEnabledPreference))
  {
    _kAXSCacheHoverTextTypingEnabled = _getBooleanPreference(a1, 0);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v5, (CFNotificationName)kAXSHoverTextTypingEnabledNotification, 0, 0, 1u);
  }
  if (CFEqual(a1, (CFTypeRef)kAXSLiveSpeechEnabledPreference))
  {
    _kAXSCacheLiveSpeechEnabled = _getBooleanPreference(a1, 0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v6, (CFNotificationName)kAXSLiveSpeechEnabledNotification, 0, 0, 1u);
  }
  if (CFEqual(a1, (CFTypeRef)kAXSZoomTouchEnabledPreference))
  {
    _kAXSCacheZoomTouchEnabled = _getBooleanPreference(a1, 0);
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v7, (CFNotificationName)kAXSZoomTouchEnabledNotification, 0, 0, 1u);
  }
  if (CFEqual(a1, (CFTypeRef)kAXSMonoAudioEnabledPreference))
  {
    _kAXSCacheMonoAudioEnabled = _getBooleanPreference(a1, 0);
    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v8, (CFNotificationName)kAXSMonoAudioEnabledNotification, 0, 0, 1u);
  }
}

id _axsPrefsToNotificationMap()
{
  _QWORD v1[4];
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v1[0] = kAXSHoverTextEnabledPreference;
  v1[1] = kAXSZoomTouchEnabledPreference;
  v2[0] = CFSTR("com.apple.accessibility.cache.hovertext");
  v2[1] = CFSTR("com.apple.accessibility.cache.zoom");
  v1[2] = kAXSVoiceOverTouchEnabledPreference;
  v1[3] = kAXSBrailleScreenInputEnabledPreference;
  v2[2] = CFSTR("com.apple.accessibility.cache.vot");
  v2[3] = CFSTR("com.apple.accessibility.cache.bsi");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void _AXSSetInUnitTestMode(int a1)
{
  int v2;
  int v3;

  _inUnitTestMode = a1;
  v2 = _AXSApplicationAccessibilityEnabled();
  if (a1 || !v2)
  {
    v3 = _AXSApplicationAccessibilityEnabled();
    if (a1 && !v3)
      _AXSApplicationAccessibilitySetEnabled(1);
  }
  else if (_AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(0);
  }
}

uint64_t _AXSFaceTimeCaptionsEnabled()
{
  if (_AXSFaceTimeCaptionsEnabled_onceToken != -1)
    dispatch_once(&_AXSFaceTimeCaptionsEnabled_onceToken, &__block_literal_global_1079);
  return _kAXSCacheFaceTimeCaptionsEnabled;
}

void _AXSSetFaceTimeCaptionsEnabled(uint64_t a1)
{
  _kAXSCacheFaceTimeCaptionsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSFaceTimeCaptionsPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.FaceTimeCaptions"));
  _updateAccessibilitySettings();
}

uint64_t _AXSInPerformanceTestMode()
{
  if (_AXSInPerformanceTestMode_onceToken != -1)
    dispatch_once(&_AXSInPerformanceTestMode_onceToken, &__block_literal_global_1080);
  return _kAXSCacheInPerformanceTestMode;
}

void _AXSSetInPerformanceTestMode(uint64_t a1)
{
  _kAXSCacheInPerformanceTestMode = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSInPerformanceTestModePreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.performance.testing.mode"));
  _updateAccessibilitySettings();
}

uint64_t _AXSCurrentAccessibilitySettingsCanSupportLoginUI()
{
  void *v0;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", AXSAccessibilityUtilitiesPath());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "load");

  if (_AXSVoiceOverTouchEnabled())
    return 0;
  if (_AXSAssistiveTouchEnabled_onceToken != -1)
    dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1207);
  if (_kAXSAssistiveTouchEnabledCache)
    return 0;
  if (_AXSAssistiveTouchScannerEnabled_onceToken != -1)
    dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1215);
  if (_kAXSCacheSwitchControlEnabled
    || _AXSZoomTouchEnabled()
    || _AXSInvertColorsEnabled()
    || _AXSReduceWhitePointEnabled()
    || MADisplayFilterPrefGetCategoryEnabled()
    || MADisplayFilterPrefGetCategoryEnabled()
    || MADisplayFilterPrefGetCategoryEnabled()
    || MADisplayFilterPrefGetCategoryEnabled()
    || MADisplayFilterPrefGetCategoryEnabled()
    || _AXSEnhanceTextLegibilityEnabled()
    || _AXDarkenSystemColors()
    || _AXSEnhanceBackgroundContrastEnabled())
  {
    return 0;
  }
  if (_AXSHearingAidsPaired_onceToken != -1)
    dispatch_once(&_AXSHearingAidsPaired_onceToken, &__block_literal_global_1309);
  if (_kAXSCacheHearingAidPaired)
    return 0;
  -[objc_class valueForKey:](NSClassFromString(CFSTR("AXSettings")), "valueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("touchAccommodationsEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue") ^ 1;

  return v4;
}

uint64_t _AXSScreenFilterApplied()
{
  return 0;
}

uint64_t _AXSReduceWhitePointEnabled()
{
  uint64_t result;

  result = MADisplayFilterPrefGetCategoryEnabled();
  if ((_DWORD)result)
    return MADisplayFilterPrefGetType() == 128;
  return result;
}

void _AXSSetAllowOpaqueTouchGestures(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSAllowOpaqueTouchGesturesPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)kAXSAllowOpaqueTouchGesturesChangedNotification);
  _updateAccessibilitySettings();
}

uint64_t _AXSPencilExtendedSqueezeRangeEnabled()
{
  if (_AXSPencilExtendedSqueezeRangeEnabled_onceToken != -1)
    dispatch_once(&_AXSPencilExtendedSqueezeRangeEnabled_onceToken, &__block_literal_global_1098);
  return _kAXSCachePencilExtendedSqueezeRangeEnabled;
}

void _AXSSetPencilExtendedSqueezeRangeEnabled(uint64_t a1)
{
  _kAXSCachePencilExtendedSqueezeRangeEnabled = (_DWORD)a1 != 0;
  _setPreferenceAppWithNotification(CFSTR("AXSPencilExtendedSqueezeRangeEnabledPreference"), 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.pencil.extended.squeeze.range"));
  _updateAccessibilitySettings();
}

uint64_t _AXSSpatialAudioHeadTracking()
{
  void *v0;
  BOOL v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v0 = _copyValuePreferenceApp(CFSTR("AXSAirPodsSpatialAudioLockToDevice"), 0, &v6);
  if (v0)
    v1 = v6 == 0;
  else
    v1 = 1;
  if (!v1)
  {
    AXLogAirPodSettings();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v0;
      _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_INFO, "Migrated lock to device to spatial audio %@", buf, 0xCu);
    }

    if (objc_msgSend(v0, "BOOLValue"))
      v3 = 3;
    else
      v3 = 0;
    _kAXSCacheSpatialAudioHeadTracking = v3;
    _setPreferenceAppWithNotification(CFSTR("AXSSpatialAudioHeadTracking"), 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:"), CFSTR("com.apple.accessibility.SpatialAudioHeadTracking.notification"));
    _setPreferenceAppWithNotification(CFSTR("AXSAirPodsSpatialAudioLockToDevice"), 0, 0, 0);
  }
  if (_AXSSpatialAudioHeadTracking_onceToken != -1)
    dispatch_once(&_AXSSpatialAudioHeadTracking_onceToken, &__block_literal_global_1099);
  v4 = _kAXSCacheSpatialAudioHeadTracking;

  return v4;
}

void _AXSSetSpatialAudioHeadTracking(uint64_t a1)
{
  _kAXSCacheSpatialAudioHeadTracking = a1;
  _setPreferenceAppWithNotification(CFSTR("AXSSpatialAudioHeadTracking"), 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a1), CFSTR("com.apple.accessibility.SpatialAudioHeadTracking.notification"));
}

uint64_t _AXSAirPodsSpatialAudioLockToDevice()
{
  if (_AXSAirPodsSpatialAudioLockToDevice_onceToken != -1)
    dispatch_once(&_AXSAirPodsSpatialAudioLockToDevice_onceToken, &__block_literal_global_1100);
  return _kAXSCacheAirPodsSpatialAudioLockToDeviceEnabled;
}

void _AXSSetAirPodsSpatialAudioLockToDevice(uint64_t a1)
{
  _kAXSCacheAirPodsSpatialAudioLockToDeviceEnabled = (_DWORD)a1 != 0;
  _setPreferenceAppWithNotification(CFSTR("AXSAirPodsSpatialAudioLockToDevice"), 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.airpod.spatial.audio.lock.to.device"));
  _updateAccessibilitySettings();
}

id AXSAirPodsDictionaryForPreference(const __CFString *a1)
{
  void *v1;
  id v2;
  char v4;

  v4 = 0;
  v1 = _copyValuePreferenceApp(a1, 0, &v4);
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id AXSAirPodsUpdatedDictionaryForPreference(const __CFString *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  AXSAirPodsDictionaryForPreference(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, a2);

  return v8;
}

id _AXSAirPodSettingForDevice(const __CFString *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;

  if (a2)
  {
    AXSAirPodsDictionaryForPreference(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    AXLogAirPodSettings();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      _AXSAirPodSettingForDevice_cold_1();

    v6 = 0;
  }
  return v6;
}

void _AXSAirPodSettingSetForDevice(const __CFString *a1, uint64_t a2, const __CFString *a3, void *a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a2)
  {
    AXSAirPodsUpdatedDictionaryForPreference(a1, a2, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    _setPreferenceAppWithNotification(a1, 0, v8, a3);
    AXLogAirPodSettings();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412802;
      v11 = a1;
      v12 = 2112;
      v13 = a2;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_18F1A7000, v9, OS_LOG_TYPE_INFO, "Setting airpods %@:%@ %@", (uint8_t *)&v10, 0x20u);
    }

  }
  else
  {
    AXLogAirPodSettings();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      _AXSAirPodSettingSetForDevice_cold_1();
  }

}

uint64_t _AXSAirPodsNoiseCancellationWithOneUnit(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  uint64_t v4;

  v2 = (const __CFString *)kAXSAirPodsNoiseCancellationWithOneUnitPreference;
  objc_opt_class();
  _AXSAirPodSettingForDevice(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

void _AXSSetAirPodsNoiseCancellationWithOneUnit(uint64_t a1, uint64_t a2)
{
  const __CFString *v3;
  const __CFString *v4;
  id v5;

  v3 = (const __CFString *)kAXSAirPodsNoiseCancellationWithOneUnitPreference;
  v4 = (const __CFString *)kAXSAirPodsNoiseCancellationWithOneUnitChangedNotification;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  _AXSAirPodSettingSetForDevice(v3, a2, v4, v5);

}

float _AXSAirPodsTapSpeed(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  v2 = (const __CFString *)kAXSAirPodsTouchTapSpeedPreference;
  objc_opt_class();
  _AXSAirPodSettingForDevice(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v6 = v5;
  }
  else
  {
    v6 = 0.25;
  }

  return v6;
}

void _AXSSetAirPodsTapSpeed(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  id v4;

  v2 = (const __CFString *)kAXSAirPodsTouchTapSpeedPreference;
  v3 = (const __CFString *)kAXSAirPodsTapSpeedChangedNotification;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AXSAirPodSettingSetForDevice(v2, a1, v3, v4);

}

uint64_t _AXSAirPodsDefaultToneVolume(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (const __CFString *)kAXSAirPodsDefaultToneVolumePreference;
  objc_opt_class();
  _AXSAirPodSettingForDevice(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntValue");
  else
    v5 = 80;

  return v5;
}

void _AXSSetAirPodsDefaultToneVolume(uint64_t a1, uint64_t a2)
{
  const __CFString *v3;
  const __CFString *v4;
  id v5;

  v3 = (const __CFString *)kAXSAirPodsDefaultToneVolumePreference;
  v4 = (const __CFString *)kAXSAirPodsDefaultToneVolumeChangedNotification;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  _AXSAirPodSettingSetForDevice(v3, a2, v4, v5);

}

uint64_t _AXSAirPodsToneVolume(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (const __CFString *)kAXSAirPodsToneVolumePreference;
  objc_opt_class();
  _AXSAirPodSettingForDevice(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "unsignedIntValue");
  else
    v5 = 80;

  return v5;
}

uint64_t _AXSHeadsetCaseTonesEnabled(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (const __CFString *)kAXSHeadsetCaseTonesPreference;
  objc_opt_class();
  _AXSAirPodSettingForDevice(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

void _AXSSetHeadsetCaseTonesEnabled(uint64_t a1, uint64_t a2)
{
  const __CFString *v3;
  const __CFString *v4;
  id v5;

  v3 = (const __CFString *)kAXSHeadsetCaseTonesPreference;
  v4 = (const __CFString *)kAXSHeadsetCaseTonesChangedNotification;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  _AXSAirPodSettingSetForDevice(v3, a2, v4, v5);

}

void _AXSSetAirPodsToneVolume(unsigned int a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  id v7;

  if (a1 >= 0x64)
    v3 = 100;
  else
    v3 = a1;
  if (v3 <= 0xF)
    v4 = 15;
  else
    v4 = v3;
  v5 = (const __CFString *)kAXSAirPodsToneVolumePreference;
  v6 = (const __CFString *)kAXSAirPodsToneVolumeChangedNotification;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  _AXSAirPodSettingSetForDevice(v5, a2, v6, v7);

}

float _AXSAirPodsHoldDuration(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  v2 = (const __CFString *)kAXSAirPodsHoldDurationPreference;
  objc_opt_class();
  _AXSAirPodSettingForDevice(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v6 = v5;
  }
  else
  {
    v6 = 0.5;
  }

  return v6;
}

void _AXSSetAirPodsHoldDuration(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  id v4;

  v2 = (const __CFString *)kAXSAirPodsHoldDurationPreference;
  v3 = (const __CFString *)kAXSAirPodsHoldDurationChangedNotification;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AXSAirPodSettingSetForDevice(v2, a1, v3, v4);

}

uint64_t _AXSAirPodsVolumeSwipeEnabled(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (const __CFString *)kAXSAirPodsVolumeSwipeEnabledPreference;
  objc_opt_class();
  _AXSAirPodSettingForDevice(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

void _AXSSetAirPodsVolumeSwipeEnabled(uint64_t a1, uint64_t a2)
{
  const __CFString *v3;
  const __CFString *v4;
  id v5;

  v3 = (const __CFString *)kAXSAirPodsVolumeSwipeEnabledPreference;
  v4 = (const __CFString *)kAXSAirPodsVolumeSwipeEnabledChangedNotification;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  _AXSAirPodSettingSetForDevice(v3, a2, v4, v5);

}

float _AXSAirPodsVolumeSwipeDuration(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  v2 = (const __CFString *)kAXSAirPodsVolumeSwipeDurationPreference;
  objc_opt_class();
  _AXSAirPodSettingForDevice(v2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v6 = v5;
  }
  else
  {
    v6 = 0.5;
  }

  return v6;
}

void _AXSSetAirPodsVolumeSwipeDuration(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  id v4;

  v2 = (const __CFString *)kAXSAirPodsVolumeSwipeDurationPreference;
  v3 = (const __CFString *)kAXSAirPodsVolumeSwipeDurationChangedNotification;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _AXSAirPodSettingSetForDevice(v2, a1, v3, v4);

}

float _AXSOpaqueTouchTapSpeed()
{
  float result;
  char v1;

  v1 = 0;
  result = _getFloatPreference((const __CFString *)kAXSOpaqueTouchTapSpeedPreference, 0, &v1);
  if (!v1)
    return 0.5;
  return result;
}

void _AXSSetOpaqueTouchTapSpeed(float a1)
{
  float v1;

  v1 = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSOpaqueTouchTapSpeedPreference, kCFNumberFloatType, &v1, (__CFString *)kAXSOpaqueTouchTapSpeedChangedNotification, 0);
}

void _AXSSetAccessibilityHasNoticedOpaqueTouchDevice(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSOpaqueTouchDeviceEverNoticedPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), 0);
  _updateAccessibilitySettings();
}

void sub_18F1B5930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void AXBeginListeningToUserDefaultsChanges()
{
  void *v0;
  void *v1;
  char v2;
  AXSupportDefaultsObserver *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.backboardd"));

  if ((v2 & 1) != 0)
  {
    v3 = objc_alloc_init(AXSupportDefaultsObserver);
    v4 = (void *)defaultsObserver;
    defaultsObserver = (uint64_t)v3;

    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSLiveSpeechEnabledPreference, CFSTR("com.apple.accessibility.cache.livespeech"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSHoverTextEnabledPreference, CFSTR("com.apple.accessibility.cache.hovertext"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSZoomTouchEnabledPreference, CFSTR("com.apple.accessibility.cache.zoom"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSVoiceOverTouchEnabledPreference, CFSTR("com.apple.accessibility.cache.vot"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSBrailleScreenInputEnabledPreference, CFSTR("com.apple.accessibility.cache.bsi"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andPerformBlock:", kAXSVoiceOverTouchEnabledPreference, &__block_literal_global_1201);
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSAssistiveTouchEnabledPreference, CFSTR("com.apple.accessibility.cache.ast"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andPerformBlock:", kAXSAssistiveTouchEnabledPreference, &__block_literal_global_1203);
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSDwellControlEnabledPreference, CFSTR("com.apple.accessibility.cache.dwell.control"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSVisualAlertEnabledPreference, CFSTR("com.apple.accessibility.cache.visual.alert"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSMonoAudioEnabledPreference, CFSTR("com.apple.accessibility.cache.mono.audio"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSEarpieceNoiseCancellationPreference, CFSTR("com.apple.accessibility.cache.earpiece.noise"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSExtendedVoiceIsolationMediaModesEnabledPreference, CFSTR("com.apple.accessibility.cache.extendedvoiceisolationmodes"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSHearingAidCompliancePreference, CFSTR("com.apple.accessibility.cache.hac.audio"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSGrayscaleEnabledPreference, CFSTR("com.apple.accessibility.cache.grayscale"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSDisplayFilterShowInitialAlertPreference, CFSTR("com.apple.accessibility.cache.displayfilter.showinitialalert"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSSpeechSettingsDisabledByManagedConfigurationPreference, CFSTR("com.apple.accessibility.cache.speech.settings.disabled.by.mc"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSQuickSpeakEnabledPreference, CFSTR("com.apple.accessibility.cache.quick.speak"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSQuickSpeakHighlightTextEnabledPreference, CFSTR("com.apple.accessibility.cache.quick.speak.highlight.text"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSApplicationAccessibilityEnabledPreference, CFSTR("com.apple.accessibility.cache.app.ax"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andPerformBlock:", kAXSApplicationAccessibilityEnabledPreference, &__block_literal_global_1204);
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSAssistiveTouchScannerEnabledPreference, CFSTR("com.apple.accessibility.cache.switch.control"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andPerformBlock:", kAXSAssistiveTouchScannerEnabledPreference, &__block_literal_global_1205);
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSAccessibilityEnabledPreference, CFSTR("com.apple.accessibility.cache.ax"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSGuidedAccessEnabledPreference, CFSTR("com.apple.accessibility.cache.guided.access"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSGuidedAccessEnabledByManagedConfigurationPreference, CFSTR("com.apple.accessibility.cache.guided.access.via.mdm"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSGuidedAccessHasPasscodePreference, CFSTR("com.apple.accessibility.cache.gax.haspasscode"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSZoomSpeakUnderFingerEnabledPreference, CFSTR("com.apple.accessibility.cache.zoom.speakunderfinger"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSZoomTouchSmoothScalingPreference, CFSTR("com.apple.accessibility.cache.zoom.smoothscaling"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSZoomTouchReadyForObserversPreference, CFSTR("com.apple.accessibility.cache.zoom.readyForObservers"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSLogValidationErrorsPreference, CFSTR("com.apple.accessibility.cache.internal.logvalidationerrors"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSReportValidationErrorsPreference, CFSTR("com.apple.accessibility.cache.internal.reportvalidationerrors"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSCrashOnValidationErrorsPreference, CFSTR("com.apple.accessibility.cache.internal.crashonvalidationerrors"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSInPerformanceTestModePreference, CFSTR("com.apple.accessibility.cache.performance.testing.mode"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSAXInspectorPreference, CFSTR("com.apple.accessibility.cache.internal.axinspector"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSClosedCaptioningEnabledByiTunesPreference, CFSTR("com.apple.accessibility.cache.captioning"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSVoiceOverTouchUsageConfirmedPreference, CFSTR("com.apple.accessibility.cache.vo.usage.confirm"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSVoiceOverTouchUserHasReadNoHomeButtonGesturePreference, CFSTR("com.apple.accessibility.cache.vo.user.has.read.no.home.button.gesture"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSVoiceOverTouchScreenCurtainPreference, CFSTR("com.apple.accessibility.cache.vo.screen.curtain"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSAutomationLocalizedStringLookupInfoEnabledPreference, CFSTR("com.apple.accessibility.cache.automation.localized.lookup"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSAutomationEnabledPreference, CFSTR("com.apple.accessibility.cache.automation.enabled"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSAutomationHitpointWarpingEnabledPreference, CFSTR("com.apple.accessibility.cache.automation.hitpoint_warping.enabled"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSSiriSemanticContextEnabledPreference, CFSTR("com.apple.accessibility.cache.siri.semantic.context.enabled"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSPreferredFontSizePreference, CFSTR("com.apple.accessibility.cache.large.text.change"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSVoiceOverTouchSpeakingRatePreference, CFSTR("com.apple.accessibility.cache.vot.speaking.rate"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSVoiceOverTouchVolumePreference, CFSTR("com.apple.accessibility.cache.vot.volume"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSVoiceOverTouchMediaDuckingVolumePreference, CFSTR("com.apple.accessibility.cache.vot.media.ducking.volume"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSVoiceOverTouchMediaDuckingModePreference, CFSTR("com.apple.accessibility.cache.vot.media.ducking.mode"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSVoiceOverTouchTutorialUsageConfirmedPreference, CFSTR("com.apple.accessibility.cache.vo.usage.tutorial.confirm"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSEnhanceTextLegibilityPreference, CFSTR("com.apple.accessibility.cache.enhance.text.legibility"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSEnhanceBackgroundContrastPreference, CFSTR("com.apple.accessibility.cache.enhance.background.contrast"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSReduceMotionPreference, CFSTR("com.apple.accessibility.cache.reduce.motion"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSReduceMotionAutoplayMessagesEffectsPreference, CFSTR("com.apple.accessibility.cache.reduce.motion.autoplay.messages.effects"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSReduceMotionAutoplayAnimatedImagesPreference, CFSTR("com.apple.accessibility.cache.reduce.motion.autoplay.animated.images"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSReduceMotionAutoplayVideoPreviewsPreference, CFSTR("com.apple.accessibility.cache.reduce.motion.autoplay.video.previews"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSReduceMotionReduceSlideTransitionsPreference, CFSTR("com.apple.accessibility.cache.reduce.motion.reduce.slide.transitions"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSIncreaseButtonLegibilityPreference, CFSTR("com.apple.accessibility.cache.increase.button.legibility"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSButtonShapesEnabledPreference, CFSTR("com.apple.accessibility.cache.button.shapes.enabled"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSUseDarkerKeyboardPreference, CFSTR("com.apple.accessibility.cache.use.darker.keyboard.enabled"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSDarkenSystemColorsEnabledPreference, CFSTR("com.apple.accessibility.cache.darken.system.colors.enabled"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSHighContrastFocusIndicatorsEnabledPreference, CFSTR("com.apple.accessibility.cache.use.prominent.focus.indicators"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSUseSingleSystemColorPreference, CFSTR("com.apple.accessibility.cache.use.single.system.color.enabled"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSLowerCaseKeyboardEnabledPreference, CFSTR("com.apple.accessibility.cache.lower.case.keyboard.enabled"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSHearingAidRingtoneStreamingPreference, CFSTR("com.apple.accessibility.cache.hearing.aid.ringtone.streaming"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSVoiceOverTouchSpeakTimeOnWakePreference, CFSTR("com.apple.accessibility.cache.AXSCacheVoiceOverSpeakTimeOnWakeNotification"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSWalkieTalkieTapToTalkPreference, CFSTR("com.apple.accessibility.cache.AXSCacheWalkieTalkieTapToTalkNotification"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSAppSwitcherAutoSelectPreference, CFSTR("com.apple.accessibility.cache.AXSCacheAppSwitcherAutoSelectNotification"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSHoverTextFontSizePreference, CFSTR("com.apple.accessibility.cache.hovertext.fontsize.change"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSHoverTextBackgroundOpacityPreference, CFSTR("com.apple.accessibility.cache.hovertext.backgroundopacity.change"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSHoverTextDisplayModePreference, CFSTR("com.apple.accessibility.cache.hovertext.displaymode.change"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSHoverTextTypingDisplayModePreference, CFSTR("com.apple.accessibility.cache.hovertext.typing.displaymode.change"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSForceTouchEnabledPreference, CFSTR("com.apple.accessibility.cache.forcetouch.enabled.changed"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSForceTouchSensitivityPreference, CFSTR("com.apple.accessibility.cache.forcetouch.sensitivity.changed"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSForceTouchTimingPreference, CFSTR("com.apple.accessibility.cache.forcetouch.timing.changed"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSIncreaseBrightnessFloorEnabledPreference, CFSTR("com.apple.accessibility.cache.increase.brightness.floor.enabled"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andPerformBlock:", kAXSInvertColorsEnabledPreference, &__block_literal_global_1206);
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andPerformBlock:", kAXSClassicInvertColorsPreference, &__block_literal_global_1206);
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSInvertColorsEnabledPreference, CFSTR("com.apple.accessibility.cache.invert.colors"));
    objc_msgSend((id)defaultsObserver, "startObservingPreference:andBroadcastDarwinNotification:", kAXSClassicInvertColorsPreference, CFSTR("com.apple.accessibility.cache.classic.invert.colors"));
    if (!_AXSCanDisableApplicationAccessibility() && !_AXSApplicationAccessibilityEnabled())
    {
      AXLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18F1A7000, v5, OS_LOG_TYPE_INFO, "Checking for user defaults inconsistencies and can't disable AX just yet.", buf, 2u);
      }

      _AXSApplicationAccessibilitySetEnabled(1);
    }
  }
  else
  {
    AXSupportLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18F1A7000, v6, OS_LOG_TYPE_DEFAULT, "This process is not responsible for listening to AX user defaults changes. Please file a bug.", v7, 2u);
    }

  }
}

uint64_t _AXSCanDisableApplicationAccessibility()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t (**v7)(void);
  int v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _AXSAccessibilityEnablers();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v0, "allKeys", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v0, "objectForKey:", v6);
        v7 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
        v8 = v7[2]();

        if (v8)
        {
          AXLogCommon();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v6;
            _os_log_impl(&dword_18F1A7000, v10, OS_LOG_TYPE_DEFAULT, "Still an ax enabler: %@", buf, 0xCu);
          }

          v9 = 0;
          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      if (v3)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_13:

  return v9;
}

void _disableConflictingSettingsForSwitchControl()
{
  if (_AXSAssistiveTouchEnabled_onceToken != -1)
    dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1207);
  if (_kAXSAssistiveTouchEnabledCache)
    _AXSAssistiveTouchSetEnabled(0);
  if (_AXSVoiceOverTouchEnabled())
    _AXSVoiceOverTouchSetEnabled(0);
  if (_AXSFullKeyboardAccessEnabled())
  {
    _kAXSCacheFullKeyboardAccessEnabled = 0;
    _setPreferenceAppWithNotification((const __CFString *)kAXSFullKeyboardAccessEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 0), CFSTR("com.apple.accessibility.cache.full.keyboard.access"));
    _updateAccessibilitySettings();
    if (_AXSCanDisableApplicationAccessibility())
      _AXSApplicationAccessibilitySetEnabled(0);
  }
}

BOOL _AXSInvertColorsEnabledGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSInvertColorsEnabledPreference, 0) == 1;
}

uint64_t _AXSInvertColorsDisplaySetEnabled(int a1)
{
  NSObject *v2;
  uint64_t result;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  AXSupportLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a1;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_DEFAULT, "Invert colors HW display toggled: %d", (uint8_t *)v4, 8u);
  }

  if (a1)
  {
    MADisplayFilterPrefSetType();
    return MADisplayFilterPrefSetCategoryEnabled();
  }
  result = MADisplayFilterPrefGetType();
  if (result == 512)
  {
    result = MADisplayFilterPrefGetCategoryEnabled();
    if ((_DWORD)result)
      return MADisplayFilterPrefSetCategoryEnabled();
  }
  return result;
}

void _AXSAssistiveTouchSetEnabled(uint64_t a1)
{
  int v1;
  int BooleanPreference;
  char v3;

  v1 = a1;
  _kAXSAssistiveTouchEnabledCache = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.ast"));
  _updateAccessibilitySettings();
  if (!v1)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchHardwareEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 0), (const __CFString *)kAXSAssistiveTouchHardwareChangedNotification);
    _updateAccessibilitySettings();
  }
  v3 = 0;
  BooleanPreference = _getBooleanPreference((const __CFString *)kAXSAssistiveTouchEnabledByiTunesPreference, &v3);
  if (v3 && BooleanPreference != v1)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchEnabledByiTunesPreference, 0, 0, 0);
    _updateAccessibilitySettings();
  }
  if (v1)
  {
    if (_AXSAssistiveTouchScannerEnabled_onceToken != -1)
      dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1215);
    if (_kAXSCacheSwitchControlEnabled)
      _AXSAssistiveTouchScannerSetEnabled(0);
  }
}

uint64_t _AXSDwellControlEnabled()
{
  if (_AXSDwellControlEnabled_onceToken != -1)
    dispatch_once(&_AXSDwellControlEnabled_onceToken, &__block_literal_global_1208);
  return _kAXSCacheDwellControlEnabled;
}

void _AXSDwellControlSetEnabled(uint64_t a1)
{
  _kAXSCacheDwellControlEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSDwellControlEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.dwell.control"));
  _updateAccessibilitySettings();
}

uint64_t _AXSSoundActionEnabledForSwitchControl()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[objc_class valueForKey:](NSClassFromString(CFSTR("AXSettings")), "valueForKey:", CFSTR("sharedInstance"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForKey:", CFSTR("assistiveTouchSwitches"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v12;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6), "source", (_QWORD)v11);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("SCATSwitchSourceSound"));

          if ((v8 & 1) != 0)
          {
            v9 = 1;
            goto LABEL_12;
          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t _AXSSwitchControlEnabledAndNeedsCameraOnLockScreen()
{
  uint64_t v0;
  int v1;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (_AXSSwitchControlEnabledAndNeedsCameraOnLockScreen_onceToken != -1)
    dispatch_once(&_AXSSwitchControlEnabledAndNeedsCameraOnLockScreen_onceToken, &__block_literal_global_1213);
  v0 = _kAXSCacheSwitchControlNeedsCameraOnLockScreen;
  v1 = _kAXSCacheNeedsCameraOnLockScreen;
  if (_kAXSCacheNeedsCameraOnLockScreen)
  {
    if (_AXSAssistiveTouchScannerEnabled_onceToken != -1)
      dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1215);
    v1 = _kAXSCacheSwitchControlEnabled != 0;
  }
  _kAXSCacheSwitchControlNeedsCameraOnLockScreen = v1;
  if ((_DWORD)v0 != v1)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)kAXSSwitchControlNeedsCameraOnLockScreenNotification, 0, 0, 1u);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSSwitchControlNeedsCameraOnLockScreenNotification, 0, 0, 1u);
    return _kAXSCacheSwitchControlNeedsCameraOnLockScreen;
  }
  return v0;
}

void _AXSSetAccessibilityNeedsCameraOnLockScreen(uint64_t a1)
{
  _kAXSCacheNeedsCameraOnLockScreen = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAccessibilityNeedsCameraOnLockScreenPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.needs.camera.cache"));
  _updateAccessibilitySettings();
}

uint64_t _AXSSwitchControlEnabledAndNeedsMicrophoneOnLockScreen()
{
  uint64_t v0;
  int v1;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (_AXSSwitchControlEnabledAndNeedsMicrophoneOnLockScreen_onceToken != -1)
    dispatch_once(&_AXSSwitchControlEnabledAndNeedsMicrophoneOnLockScreen_onceToken, &__block_literal_global_1214);
  v0 = _kAXSCacheSwitchControlNeedsMicrophoneOnLockScreen;
  v1 = _kAXSCacheNeedsMicrophoneOnLockScreen;
  if (_kAXSCacheNeedsMicrophoneOnLockScreen)
  {
    if (_AXSAssistiveTouchScannerEnabled_onceToken != -1)
      dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1215);
    v1 = _kAXSCacheSwitchControlEnabled != 0;
  }
  _kAXSCacheSwitchControlNeedsMicrophoneOnLockScreen = v1;
  if ((_DWORD)v0 != v1)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)kAXSSwitchControlNeedsMicrophoneOnLockScreenNotification, 0, 0, 1u);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSSwitchControlNeedsMicrophoneOnLockScreenNotification, 0, 0, 1u);
    return _kAXSCacheSwitchControlNeedsMicrophoneOnLockScreen;
  }
  return v0;
}

void _AXSSetAccessibilityNeedsMicrophoneOnLockScreen(uint64_t a1)
{
  _kAXSCacheNeedsMicrophoneOnLockScreen = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAccessibilityNeedsMicrophoneOnLockScreenPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.needs.microphone.cache"));
  _updateAccessibilitySettings();
}

uint64_t _AXSAssistiveTouchRepairIncarnationModeEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSAssistiveTouchRepairIncarnationModePreference, 0, (uint64_t)_handleAssistiveTouchPrefsChangedNotification);
}

void _handleAssistiveTouchPrefsChangedNotification()
{
  _handlePreferenceChangeWithLocalNotification((const __CFString *)kAXSAssistiveTouchSettingsChangedNotification);
}

void _AXSAssistiveTouchSetRepairIncarnationModeEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchRepairIncarnationModePreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), 0);
  _updateAccessibilitySettings();
  _AXSAssistiveTouchSetEnabled(a1);
  _AXSAssistiveTouchSetUIEnabled(a1);
}

void _AXSAssistiveTouchSetUIEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchUIEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), 0);
  _updateAccessibilitySettings();
}

uint64_t _AXSAssistiveTouchUIEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSAssistiveTouchUIEnabledPreference, 0, (uint64_t)_handleAssistiveTouchPrefsChangedNotification);
}

uint64_t _AXSAssistiveTouchHardwareEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSAssistiveTouchHardwareEnabledPreference, 0, (uint64_t)_handleAssistiveTouchPrefsChangedNotification);
}

void _AXSAssistiveTouchSetHardwareEnabled(uint64_t a1)
{
  uint64_t PrefBooleanValueWithCustomCallback;

  _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchHardwareEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)kAXSAssistiveTouchHardwareChangedNotification);
  _updateAccessibilitySettings();
  if ((_DWORD)a1)
  {
    if (_AXSAssistiveTouchEnabled_onceToken != -1)
      dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1207);
    if (!_kAXSAssistiveTouchEnabledCache)
    {
      _AXSAssistiveTouchSetEnabled(a1);
      _AXSAssistiveTouchSetUIEnabled(0);
    }
  }
  else
  {
    if (_AXSAssistiveTouchEnabled_onceToken != -1)
      dispatch_once(&_AXSAssistiveTouchEnabled_onceToken, &__block_literal_global_1207);
    if (_kAXSAssistiveTouchEnabledCache)
    {
      PrefBooleanValueWithCustomCallback = _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSAssistiveTouchUIEnabledPreference, 0, (uint64_t)_handleAssistiveTouchPrefsChangedNotification);
      if (!(_DWORD)PrefBooleanValueWithCustomCallback)
        _AXSAssistiveTouchSetEnabled(PrefBooleanValueWithCustomCallback);
    }
  }
}

void _AXSAssistiveTouchScannerSetEnabled(uint64_t a1)
{
  int v1;

  v1 = a1;
  if (_kAXSCacheSwitchControlEnabled != (_DWORD)a1)
  {
    _kAXSCacheSwitchControlEnabled = a1;
    _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchScannerEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.switch.control"));
    _updateAccessibilitySettings();
  }
  if (v1)
  {
    _disableConflictingSettingsForSwitchControl();
    _kickstartProcess("com.apple.assistivetouchd");
  }
}

uint64_t _AXSAccessibilitySecureIntentProvider()
{
  if (_AXSAccessibilitySecureIntentProvider_onceToken != -1)
    dispatch_once(&_AXSAccessibilitySecureIntentProvider_onceToken, &__block_literal_global_1216);
  return _kAXSCacheSecureIntentProviderPreference;
}

void _AXSAccessibilitySetSecureIntentProvider(uint64_t a1)
{
  _kAXSCacheSecureIntentProviderPreference = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSSecureIntentProviderPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1), CFSTR("com.apple.accessibility.cache.secure.intent.provider"));
}

uint64_t _AXSSwitchControlExtendedKeyboardPredictionsEnabled()
{
  if (_AXSSwitchControlExtendedKeyboardPredictionsEnabled_onceToken != -1)
    dispatch_once(&_AXSSwitchControlExtendedKeyboardPredictionsEnabled_onceToken, &__block_literal_global_1217);
  return _kAXSCacheSwitchControlUseExtendedKeyboardPredictionsEnabled;
}

uint64_t _AXSAssistiveTouchExtendedKeyboardPredictionsEnabled()
{
  if (_AXSAssistiveTouchExtendedKeyboardPredictionsEnabled_onceToken != -1)
    dispatch_once(&_AXSAssistiveTouchExtendedKeyboardPredictionsEnabled_onceToken, &__block_literal_global_1218);
  return _kAXSCacheAssistiveTouchUseExtendedKeyboardPredictionsEnabled;
}

void _AXSSwitchControlExtendedKeyboardPredictionsSetEnabled(uint64_t a1)
{
  _kAXSCacheSwitchControlUseExtendedKeyboardPredictionsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSSwitchControlUseExtendedKeyboardPredictionsEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.switch.control.useextendedkeyboardpredictions"));
  _updateAccessibilitySettings();
}

void _AXSAssistiveTouchExtendedKeyboardPredictionsSetEnabled(uint64_t a1)
{
  _kAXSCacheAssistiveTouchUseExtendedKeyboardPredictionsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAssistiveTouchUseExtendedKeyboardPredictionsEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.assistivetouch.useextendedkeyboardpredictions"));
  _updateAccessibilitySettings();
}

uint64_t _AXSDidInitializeNotificationListeners()
{
  return s_axDidInitializeListeners;
}

uint64_t _accessibilityEnabled()
{
  if (_accessibilityEnabled_onceToken != -1)
    dispatch_once(&_accessibilityEnabled_onceToken, &__block_literal_global_1219);
  return _kAXSCacheAccessibilityEnabled;
}

void _AXSSetAccessibilityEnabled()
{
  if (!_kAXSCacheAccessibilityEnabled)
  {
    _kAXSCacheAccessibilityEnabled = 1;
    _setPreferenceAppWithNotification((const __CFString *)kAXSAccessibilityEnabledPreference, 0, (const void *)*MEMORY[0x1E0C9AE50], CFSTR("com.apple.accessibility.cache.ax"));
  }
}

void _AXSTripleClickAddOption(uint64_t a1)
{
  __CFArray *v2;
  id v3;
  void *v4;
  void *v5;
  __CFArray *v6;

  if ((_isComputedTripleClickOption(a1) & 1) == 0)
  {
    v2 = _AXSTripleClickCopyOptions();
    v6 = v2;
    if (v2)
      v3 = (id)-[__CFArray mutableCopy](v2, "mutableCopy");
    else
      v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[__CFArray containsObject:](v6, "containsObject:", v5) & 1) == 0)
    {
      objc_msgSend(v4, "addObject:", v5);
      _AXSSetTripleClickOptions(v4);
    }

  }
}

uint64_t _isComputedTripleClickOption(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  _computedTripleClickOptions();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

void _AXSSetTripleClickOptions(void *a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "count");
  if (v3 != objc_msgSend(v2, "count"))
  {
    AXSupportLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      _AXSSetTripleClickOptions_cold_1();

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  _computedTripleClickOptions();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v2, "containsObject:", v10, (_QWORD)v16))
        {
          v11 = (void *)objc_msgSend(v2, "mutableCopy");
          objc_msgSend(v11, "removeObject:", v10);

          v2 = v11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v7);
  }

  objc_msgSend(v2, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = a1;
    _os_log_impl(&dword_18F1A7000, v13, OS_LOG_TYPE_DEFAULT, "Setting triple click options: %@", buf, 0xCu);
  }

  if (os_variant_has_internal_ui())
  {
    AXLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v15;
      _os_log_impl(&dword_18F1A7000, v14, OS_LOG_TYPE_DEFAULT, "Setting triple click options: %@", buf, 0xCu);

    }
  }
  _setPreferenceAppWithNotification((const __CFString *)kAXSTripleClickPreference, 0, v12, 0);
  _didUpdateTripleClickOptions();

}

void _AXSTripleClickRemoveOption(uint64_t a1)
{
  __CFArray *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFArray *v7;

  if ((_isComputedTripleClickOption(a1) & 1) == 0)
  {
    v2 = _AXSTripleClickCopyOptions();
    v7 = v2;
    if (v2)
      v3 = (id)-[__CFArray mutableCopy](v2, "mutableCopy");
    else
      v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "indexOfObject:", v5);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "removeObjectAtIndex:", v6);
      _AXSSetTripleClickOptions(v4);
    }

  }
}

void _AXSHandleTripleClickHomeButtonPress()
{
  void *v0;
  NSObject *v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  AXUtilsBackBoardServer();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v0, "tripleClickHomeButtonPress");
  }
  else
  {
    AXSupportLogCommon();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_18F1A7000, v1, OS_LOG_TYPE_DEFAULT, "BB Server does not respond to triple click", v2, 2u);
    }

  }
}

void sub_18F1B7974(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  id v9;
  NSObject *v10;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    AXSupportLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 138412290;
      *(_QWORD *)((char *)&a9 + 4) = v9;
      _os_log_impl(&dword_18F1A7000, v10, OS_LOG_TYPE_DEFAULT, "couldn't message BB server: %@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x18F1B7948);
  }
  _Unwind_Resume(exception_object);
}

id AXUtilsBackBoardServer()
{
  if (AXUtilsBackBoardServer_onceToken != -1)
    dispatch_once(&AXUtilsBackBoardServer_onceToken, &__block_literal_global_1838);
  -[objc_class valueForKey:](NSClassFromString(CFSTR("AXBackBoardServer")), "valueForKey:", CFSTR("server"));
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_18F1B7A9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  id v9;
  NSObject *v10;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    AXSupportLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 138412290;
      *(_QWORD *)((char *)&a9 + 4) = v9;
      _os_log_impl(&dword_18F1A7000, v10, OS_LOG_TYPE_DEFAULT, "couldn't load AXBackBoardServer: %@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x18F1B7A58);
  }
  _Unwind_Resume(exception_object);
}

void _AXSHandleHomeButtonPressSwallowedForGuidedAccess()
{
  char v0;
  void *v1;
  void *v2;

  AXUtilsBackBoardServer();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v0 = objc_opt_respondsToSelector();
  v1 = v2;
  if ((v0 & 1) != 0)
  {
    objc_msgSend(v2, "homeClickSwallowedForGuidedAccess");
    v1 = v2;
  }

}

void sub_18F1B7C4C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t _AXSTripleClickIsComputedOption(uint64_t a1)
{
  return _isComputedTripleClickOption(a1);
}

uint64_t _AXSTripleClickCopyAllComputedOptions()
{
  _computedTripleClickOptions();
  return objc_claimAutoreleasedReturnValue();
}

id _computedTripleClickOptions()
{
  if (_computedTripleClickOptions_onceToken != -1)
    dispatch_once(&_computedTripleClickOptions_onceToken, &__block_literal_global_1843);
  return (id)_computedTripleClickOptions_ComputedOptions;
}

uint64_t _didUpdateTripleClickOptions()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSTripleHomeEnabledNotification, 0, 0, 1u);
  return _updateAccessibilitySettings();
}

uint64_t _AXSGenericAccessibilityClientEnabled()
{
  if (_AXSGenericAccessibilityClientEnabled_onceToken != -1)
    dispatch_once(&_AXSGenericAccessibilityClientEnabled_onceToken, &__block_literal_global_1241);
  return _kAXSCacheGenericAccessibilityClientEnabled;
}

void _AXSSetGenericAccessibilityClientEnabled(uint64_t a1)
{
  int v1;

  v1 = a1;
  _kAXSCacheGenericAccessibilityClientEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSGenericAccessibilityClientEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.generic.accessibility.client"));
  _updateAccessibilitySettings();
  if (v1)
  {
    _AXSApplicationAccessibilitySetEnabled(1);
  }
  else if (_AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(0);
  }
}

uint64_t _AXSClarityUIEnabled()
{
  if (_AXSClarityUIEnabled_onceToken != -1)
    dispatch_once(&_AXSClarityUIEnabled_onceToken, &__block_literal_global_1242);
  return _kAXSCacheClarityUIEnabled;
}

uint64_t _AXSClarityUISetEnabled(uint64_t a1)
{
  _kAXSCacheClarityUIEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSClarityUIEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.clarityui"));
  _updateAccessibilitySettings();
  return _didUpdateTripleClickOptions();
}

id _AXSStandardBundleIdentifierForClarityBundleIdentifier(void *a1)
{
  return _AXSClarityUIConvertBundleIdentifier(a1, 1);
}

id _AXSClarityUIConvertBundleIdentifier(void *a1, int a2)
{
  id v3;
  uint64_t *v4;
  id v5;

  v3 = a1;
  if (_AXSClarityUIConvertBundleIdentifier_onceToken != -1)
    dispatch_once(&_AXSClarityUIConvertBundleIdentifier_onceToken, &__block_literal_global_1851);
  v4 = &_AXSClarityUIConvertBundleIdentifier_ClarityToStandardBundleIdentifiers;
  if (!a2)
    v4 = &_AXSClarityUIConvertBundleIdentifier_StandardToClarityBundleIdentifiers;
  objc_msgSend((id)*v4, "objectForKeyedSubscript:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = v3;

  return v5;
}

id _AXSClarityBundleIdentifierForStandardBundleIdentifier(void *a1)
{
  return _AXSClarityUIConvertBundleIdentifier(a1, 0);
}

void _AXSCommandAndControlSetEnabled(uint64_t a1)
{
  int v1;
  uint64_t v2;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v1 = a1;
  v5 = *MEMORY[0x1E0C80C00];
  _kAXSCacheCommandAndControlEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSCommandAndControlEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.command.and.control"));
  _updateAccessibilitySettings();
  if (v1)
  {
    v2 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility())
      goto LABEL_6;
    v2 = 0;
  }
  _AXSApplicationAccessibilitySetEnabled(v2);
LABEL_6:
  AXSupportLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v1;
    _os_log_impl(&dword_18F1A7000, v3, OS_LOG_TYPE_DEFAULT, "Set Voice Control enabled: %d", (uint8_t *)v4, 8u);
  }

  if (v1)
    _kickstartProcess("com.apple.commandandcontrol");
}

void _AXSCommandAndControlCarPlaySetEnabled(uint64_t a1)
{
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  AXSupportLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_DEFAULT, "Set Voice Control CarPlay enabled: %d", (uint8_t *)v3, 8u);
  }

  _kAXSCacheCommandAndControlCarPlayEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSCommandAndControlCarPlayEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.command.and.control.carplay"));
  _updateAccessibilitySettings();
  if ((_DWORD)a1)
  {
    _AXSApplicationAccessibilitySetEnabled(1);
    _kickstartProcess("com.apple.commandandcontrol");
  }
  else if (_AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(0);
  }
}

void _AXSFullKeyboardAccessSetEnabled(uint64_t a1)
{
  int v1;

  v1 = a1;
  _kAXSCacheFullKeyboardAccessEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSFullKeyboardAccessEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.full.keyboard.access"));
  _updateAccessibilitySettings();
  if (v1)
  {
    _AXSApplicationAccessibilitySetEnabled(1);
    if (_AXSAssistiveTouchScannerEnabled_onceToken != -1)
      dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1215);
    if (_kAXSCacheSwitchControlEnabled)
      _AXSAssistiveTouchScannerSetEnabled(0);
    _kickstartProcess("com.apple.fullkeyboardaccess");
  }
  else if (_AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(0);
  }
}

uint64_t _AXSFullKeyboardAccessFocusRingEnabled()
{
  if (_AXSFullKeyboardAccessFocusRingEnabled_onceToken != -1)
    dispatch_once(&_AXSFullKeyboardAccessFocusRingEnabled_onceToken, &__block_literal_global_1254);
  return _kAXSCacheFullKeyboardAccessFocusRingEnabled;
}

void _AXSFullKeyboardAccessSetFocusRingEnabled(uint64_t a1)
{
  _kAXSCacheFullKeyboardAccessFocusRingEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSFullKeyboardAccessFocusRingEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.full.keyboard.access.focus.ring"));
  _updateAccessibilitySettings();
}

uint64_t _AXSFullKeyboardAccessPassthroughModeEnabled()
{
  if (_AXSFullKeyboardAccessPassthroughModeEnabled_onceToken != -1)
    dispatch_once(&_AXSFullKeyboardAccessPassthroughModeEnabled_onceToken, &__block_literal_global_1255);
  return _kAXSCacheFullKeyboardAccessPassthroughModeEnabled;
}

void _AXSFullKeyboardAccessSetPassthroughModeEnabled(uint64_t a1)
{
  _kAXSCacheFullKeyboardAccessPassthroughModeEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSFullKeyboardAccessPassthroughModeEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.full.keyboard.access.passthrough.mode"));
  _updateAccessibilitySettings();
}

uint64_t _AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation()
{
  if (_AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation_onceToken != -1)
    dispatch_once(&_AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation_onceToken, &__block_literal_global_1256);
  return _AXSFullKeyboardAccessUsesSimulatedKeyboardForAutomation_UsesSimulatedKeyboard;
}

uint64_t _AXSLiveTranscriptionEnabled()
{
  if (_AXSClarityBoardEnabled_onceToken != -1)
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1243);
  if (_AXSClarityBoardEnabled_isEnabled)
    return 0;
  if (_AXSLiveTranscriptionEnabled_onceToken != -1)
    dispatch_once(&_AXSLiveTranscriptionEnabled_onceToken, &__block_literal_global_1259);
  return _kAXSCacheLiveTranscriptionEnabled;
}

void _AXSLiveTranscriptionSetEnabled(uint64_t a1)
{
  _kAXSCacheLiveTranscriptionEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSLiveTranscriptionEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("_AXSCacheLiveTranscriptionNotification"));
  _updateAccessibilitySettings();
}

uint64_t _AXSLiveTranscriptionInCallEnabled()
{
  return 1;
}

uint64_t _AXSLiveTranscriptionMicOn()
{
  return _getBooleanPreference((const __CFString *)_kAXSLiveTranscriptionMicOnPreference, 0);
}

void _AXSLiveTranscriptionSetMicOn(uint64_t a1)
{
  const __CFString *v1;
  const void *v2;

  v1 = (const __CFString *)_kAXSLiveTranscriptionMicOnPreference;
  v2 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1);
  _setPreferenceAppWithNotification(v1, 0, v2, (const __CFString *)kAXSLiveTranscriptionMicOnDidChangeNotification);
}

uint64_t _AXSLiveTranscriptionPaused()
{
  return _getBooleanPreference((const __CFString *)_kAXSLiveTranscriptionPausedPreference, 0);
}

void _AXSLiveTranscriptionSetPaused(uint64_t a1)
{
  const __CFString *v1;
  const void *v2;

  v1 = (const __CFString *)_kAXSLiveTranscriptionPausedPreference;
  v2 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1);
  _setPreferenceAppWithNotification(v1, 0, v2, (const __CFString *)kAXSLiveTranscriptionPausedDidChangeNotification);
}

void *_AXSLiveTranscriptionCopyTextColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSLiveTranscriptionTextColorPreference, 0, 0);
}

void _AXSLiveTranscriptionSetTextColorData(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSLiveTranscriptionTextColorPreference, 0, a1, (const __CFString *)kAXSLiveTranscriptionTextColorDidChangeNotification);
}

void *_AXSLiveTranscriptionCopyBackgroundColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSLiveTranscriptionBackgroundColorPreference, 0, 0);
}

void _AXSLiveTranscriptionSetBackgroundColorData(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSLiveTranscriptionBackgroundColorPreference, 0, a1, (const __CFString *)kAXSLiveTranscriptionBackgroundColorDidChangeNotification);
}

uint64_t _AXSLiveTranscriptionScreenshotHidingEnabled()
{
  uint64_t result;
  char v1;

  v1 = 0;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSLiveTranscriptionScreenshotHidingPreference, &v1);
  if (v1)
    return result;
  else
    return 1;
}

void _AXSLiveTranscriptionSetScreenshotHidingEnabled(uint64_t a1)
{
  const __CFString *v1;
  const void *v2;

  v1 = (const __CFString *)kAXSLiveTranscriptionScreenshotHidingPreference;
  v2 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1);
  _setPreferenceAppWithNotification(v1, 0, v2, (const __CFString *)kAXSLiveTranscriptionScreenshotHidingDidChangeNotification);
}

void *_AXSLiveCaptionsNubbitIdleOpacity()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSLiveCaptionsNubbitIdleOpacityPreference, 0, 0);
}

void _AXSLiveCaptionsSetNubbitIdleOpacity(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSLiveCaptionsNubbitIdleOpacityPreference, 0, a1, (const __CFString *)kAXSLiveCaptionsNubbitIdleOpacityDidChangeNotification);
}

void *_AXSLiveCaptionsCopyContentSizeCategoryName()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSLiveCaptionsContentSizeCategoryNamePreference, 0, 0);
}

void _AXSLiveCaptionsSetContentSizeCategoryName(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSLiveCaptionsContentSizeCategoryNamePreference, 0, a1, (const __CFString *)kAXSLiveCaptionsContentSizeCategoryNameChangeNotification);
}

uint64_t _AXSLiveCaptionsBoldTextEnabled()
{
  uint64_t v0;
  const __CFNumber *NumberPreference;
  unsigned int valuePtr;

  v0 = 0xFFFFFFFFLL;
  valuePtr = -1;
  NumberPreference = (const __CFNumber *)_getNumberPreference((const __CFString *)kAXSLiveCaptionsBoldTextChangePreference, 0);
  if (NumberPreference)
  {
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    return valuePtr;
  }
  return v0;
}

void _AXSLiveCaptionsSetBoldTextEnabled(uint64_t a1)
{
  const __CFString *v1;
  const void *v2;

  v1 = (const __CFString *)kAXSLiveCaptionsBoldTextChangePreference;
  v2 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  _setPreferenceAppWithNotification(v1, 0, v2, (const __CFString *)kAXSLiveCaptionsBoldTextChangeNotification);
}

uint64_t _AXSUIFocusRingEnabled()
{
  if (_AXSUIFocusRingEnabled_onceToken != -1)
    dispatch_once(&_AXSUIFocusRingEnabled_onceToken, &__block_literal_global_1260);
  return _kAXSCacheUIFocusRingEnabled;
}

void _AXSSetUIFocusRingEnabled(uint64_t a1)
{
  _kAXSCacheUIFocusRingEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSUIFocusRingEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.ui.focus.ring"));
  _updateAccessibilitySettings();
}

BOOL _AXSPrefersNonBlinkingCursorIndicator()
{
  return AXSGetCachedPreference((unsigned int *)&_kAXSCachePrefersNonBlinkingCursorIndicator, &_AXSPrefersNonBlinkingCursorIndicator_onceToken, kAXSPrefersNonBlinkingCursorIndicatorPreference, (uint64_t)CFSTR("com.apple.accessibility.cache.non.blinking.cursor.status"), kAXSPrefersNonBlinkingCursorIndicatorDidChangeNotification) == 1;
}

BOOL _AXSPrefersNonBlinkingCursorIndicatorGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSPrefersNonBlinkingCursorIndicatorPreference, 0) == 1;
}

uint64_t _AXSPrefersNonBlinkingCursorIndicatorApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSPrefersNonBlinkingCursorIndicatorPreference, a1);
}

void _AXSSetPrefersNonBlinkingCursorIndicator(int a1)
{
  _AXSSetPrefersNonBlinkingCursorIndicatorApp(a1 != 0, 0);
}

void _AXSSetPrefersNonBlinkingCursorIndicatorApp(int a1, __CFString *a2)
{
  int v4;

  v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSPrefersNonBlinkingCursorIndicatorPreference, a1, (void (*)(void))_AXSPrefersNonBlinkingCursorIndicator);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSPrefersNonBlinkingCursorIndicatorPreference, a2, &_kAXSCachePrefersNonBlinkingCursorIndicator, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSPrefersNonBlinkingCursorIndicatorPreference, kCFNumberIntType, &v4, CFSTR("com.apple.accessibility.cache.non.blinking.cursor.status"), a2);
}

void _subscribeOnCacheNotificationsIfNeeded(uint64_t a1, int a2, void (*a3)(void))
{
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (_AXSCurrentProcessIsWebContent_onceToken != -1)
    dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
  if (_AXSCurrentProcessIsWebContent_IsWebContent)
  {
    if (a3)
      a3();
    AXSupportLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = a1;
      v9 = 1024;
      v10 = a2;
      _os_log_impl(&dword_18F1A7000, v6, OS_LOG_TYPE_INFO, "API Setting value for Web: preference = %@, value = %d", (uint8_t *)&v7, 0x12u);
    }

  }
}

void _updateCachePreferenceAfterChange(const __CFString *a1, CFStringRef theString1, int *a3, int a4)
{
  uint64_t v7;
  int *v8;
  const __CFString *v9;
  const __CFString *v10;
  int *v11;
  NSObject *v12;
  int v13;
  int v14;
  uint8_t buf[4];
  CFStringRef v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  if (cachedAppID_onceToken != -1)
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_1626);
  v7 = cachedAppID_CachedAppID;
  if (!theString1)
  {
    v11 = &v14;
    v9 = a1;
    v10 = (const __CFString *)cachedAppID_CachedAppID;
    v8 = 0;
    goto LABEL_8;
  }
  if (cachedAppID_CachedAppID
    && CFStringCompare(theString1, (CFStringRef)cachedAppID_CachedAppID, 0) == kCFCompareEqualTo)
  {
    v8 = &v14;
    v9 = a1;
    v10 = (const __CFString *)v7;
    v11 = 0;
LABEL_8:
    *a3 = _fetchCachePreference(v9, v10, v11, v8);
  }
  AXSupportLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = *a3;
    *(_DWORD *)buf = 138412802;
    v16 = theString1;
    v17 = 2112;
    v18 = a1;
    v19 = 1024;
    v20 = v13;
    _os_log_debug_impl(&dword_18F1A7000, v12, OS_LOG_TYPE_DEBUG, "Settings Update Cache Value: appID = %@, preference = %@, result = %d (-1 - empty, 0 - false, 1 - true)", buf, 0x1Cu);
  }

}

void _setNumberPreferenceApp(const __CFString *a1, CFNumberType a2, const void *a3, __CFString *a4, __CFString *a5)
{
  CFNumberRef v8;
  NSObject *v9;
  int v10;
  __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  CFNumberRef v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, a3);
    AXSupportLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412802;
      v11 = a5;
      v12 = 2112;
      v13 = a1;
      v14 = 2112;
      v15 = v8;
      _os_log_debug_impl(&dword_18F1A7000, v9, OS_LOG_TYPE_DEBUG, "Settings Setting Value: appID = %@, preference = %@, value = %@ (-1 - empty, 0 - false, 1 - true)", (uint8_t *)&v10, 0x20u);
    }

    if (a4)
    {
      if (a5)
        a4 = (__CFString *)-[__CFString stringByAppendingString:](a4, "stringByAppendingString:", a5);
    }
    _setPreferenceAppWithNotification(a1, a5, v8, a4);
    CFRelease(v8);
  }
}

BOOL _AXSPrefersHorizontalTextLayoutGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSPrefersHorizontalTextPreference, 0) == 1;
}

uint64_t _AXSPrefersHorizontalTextLayoutApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSPrefersHorizontalTextPreference, a1);
}

void _AXSSetPrefersHorizontalTextLayout(int a1)
{
  _AXSSetPrefersHorizontalTextLayoutApp(a1 != 0, 0);
}

void _AXSSetPrefersHorizontalTextLayoutApp(int a1, __CFString *a2)
{
  int v4;

  v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSPrefersHorizontalTextPreference, a1, (void (*)(void))_AXSPrefersHorizontalTextLayout);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSPrefersHorizontalTextPreference, a2, (int *)&_kAXSCachePrefersHorizontalText, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSPrefersHorizontalTextPreference, kCFNumberIntType, &v4, CFSTR("com.apple.accessibility.cache.prefers.horizontal.text"), a2);
}

void _AXSGuidedAccessStartSession()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSGuidedAccessActivateNotification, 0, 0, 1u);
}

uint64_t _AXSGuidedAccessEnabledNoCaching()
{
  if (_AXSClarityBoardEnabled_onceToken != -1)
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1243);
  if (_AXSClarityBoardEnabled_isEnabled)
    return 0;
  else
    return _getBooleanPreference((const __CFString *)kAXSGuidedAccessEnabledPreference, 0);
}

uint64_t _AXSAutoBrightnessEnabled()
{
  uint64_t result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  LODWORD(result) = CFPreferencesGetAppBooleanValue(CFSTR("BKEnableALS"), CFSTR("com.apple.backboardd"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    return result;
  else
    return 1;
}

uint64_t _AXSGuidedAccessSetEnabled(uint64_t a1)
{
  _kAXSCacheGuidedAccessEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSGuidedAccessEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.guided.access"));
  _updateAccessibilitySettings();
  return _didUpdateTripleClickOptions();
}

uint64_t _AXSGuidedAccessEnabledByManagedConfiguration()
{
  if (_AXSGuidedAccessEnabledByManagedConfiguration_onceToken != -1)
    dispatch_once(&_AXSGuidedAccessEnabledByManagedConfiguration_onceToken, &__block_literal_global_1266);
  return _kAXSCacheGuidedAccessEnabledByManagedConfiguration;
}

void _AXSGuidedAccessSetEnabledByManagedConfiguration(uint64_t a1)
{
  _kAXSCacheGuidedAccessEnabledByManagedConfiguration = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSGuidedAccessEnabledByManagedConfigurationPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.guided.access.via.mdm"));
  _updateAccessibilitySettings();
}

uint64_t _AXSGuidedAccessHasPasscode()
{
  if (_AXSGuidedAccessHasPasscode_onceToken != -1)
    dispatch_once(&_AXSGuidedAccessHasPasscode_onceToken, &__block_literal_global_1267);
  return _kAXSCacheGuidedAccessHasPasscode;
}

void _AXSGuidedAccessSetHasPasscode(uint64_t a1)
{
  _kAXSCacheGuidedAccessHasPasscode = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSGuidedAccessHasPasscodePreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.gax.haspasscode"));
  _updateAccessibilitySettings();
}

BOOL _AXSSideButtonClickSpeedEnabled()
{
  float FloatPreference;
  BOOL v1;
  float v2;
  char v4;

  v4 = 0;
  FloatPreference = _getFloatPreference((const __CFString *)kAXSSideButtonClickSpeedPreference, 0, &v4);
  if (v4)
    v1 = FloatPreference < 0.0;
  else
    v1 = 1;
  v2 = FloatPreference + -0.4;
  if (v1)
    v2 = 0.0;
  return fabsf(v2) > 0.01;
}

float _AXSSideButtonClickSpeed()
{
  float result;
  BOOL v1;
  char v2;

  v2 = 0;
  result = _getFloatPreference((const __CFString *)kAXSSideButtonClickSpeedPreference, 0, &v2);
  if (v2)
    v1 = result < 0.0;
  else
    v1 = 1;
  if (v1)
    return 0.4;
  return result;
}

void _AXSSetSideButtonClickSpeed(float a1)
{
  float v1;
  _BOOL4 v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v4;

  if (fabsf(a1 + -1.2) >= 0.01)
  {
    if (fabsf(a1 + -0.7) >= 0.01)
    {
      if (fabsf(a1 + -0.4) >= 0.01)
        return;
      v4 = 1053609165;
      v1 = 0.0;
    }
    else
    {
      v4 = 1060320051;
      v1 = 0.3;
    }
  }
  else
  {
    v4 = 1067030938;
    v1 = 0.8;
  }
  v2 = _AXSSideButtonClickSpeedEnabled();
  _setNumberPreferenceApp((const __CFString *)kAXSSideButtonClickSpeedPreference, kCFNumberFloatType, &v4, (__CFString *)kAXSSideButtonClickSpeedChangedNotification, 0);
  if (v2 != fabsf(v1) > 0.01)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSSideButtonClickSpeedEnabledNotification, 0, 0, 1u);
  }
}

BOOL _AXSHomeClickEnabled()
{
  float FloatPreference;
  BOOL v1;
  float v2;
  char v4;

  v4 = 0;
  FloatPreference = _getFloatPreference((const __CFString *)kAXSHomeClickSpeedPreference, 0, &v4);
  if (v4)
    v1 = FloatPreference < 0.0;
  else
    v1 = 1;
  v2 = FloatPreference + -0.35;
  if (v1)
    v2 = 0.0;
  return fabsf(v2) > 0.01;
}

float _AXSHomeClickSpeed()
{
  float result;
  BOOL v1;
  char v2;

  v2 = 0;
  result = _getFloatPreference((const __CFString *)kAXSHomeClickSpeedPreference, 0, &v2);
  if (v2)
    v1 = result < 0.0;
  else
    v1 = 1;
  if (v1)
    return 0.35;
  return result;
}

void _AXSHomeClickSetSpeed(float a1)
{
  float v1;
  _BOOL4 v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v4;

  if (fabsf(a1 + -0.7) >= 0.01)
  {
    if (fabsf(a1 + -0.5) >= 0.01)
    {
      if (fabsf(a1 + -0.35) >= 0.01)
        return;
      v4 = 1051931443;
      v1 = 0.34;
    }
    else
    {
      v4 = 1056964608;
      v1 = 0.49;
    }
  }
  else
  {
    v4 = 1060320051;
    v1 = 0.69;
  }
  v2 = _AXSHomeClickEnabled();
  _setNumberPreferenceApp((const __CFString *)kAXSHomeClickSpeedPreference, kCFNumberFloatType, &v4, (__CFString *)kAXSHomeClickSpeedChangedNotification, 0);
  if (v2 != fabsf(v1) > 0.01)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSHomeClickEnabledNotification, 0, 0, 1u);
  }
}

float _AXSLockClickDownPressDurationScaleFactor()
{
  float FloatPreference;
  BOOL v1;
  float result;
  char v3;

  v3 = 0;
  FloatPreference = _getFloatPreference((const __CFString *)kAXSHomeClickSpeedPreference, 0, &v3);
  if (v3)
    v1 = FloatPreference < 0.0;
  else
    v1 = 1;
  result = FloatPreference / 0.35;
  if (v1)
    return 1.0;
  return result;
}

float _AXSLockClickVarianceScaleFactor()
{
  float FloatPreference;
  BOOL v1;
  float result;
  char v3;

  v3 = 0;
  FloatPreference = _getFloatPreference((const __CFString *)kAXSHomeClickSpeedPreference, 0, &v3);
  if (v3)
    v1 = FloatPreference < 0.0;
  else
    v1 = 1;
  result = FloatPreference / 0.35;
  if (v1)
    return 1.0;
  return result;
}

uint64_t _AXSPearlAuthenticationHapticsEnabled()
{
  if (_AXSPearlAuthenticationHapticsEnabled_onceToken != -1)
    dispatch_once(&_AXSPearlAuthenticationHapticsEnabled_onceToken, &__block_literal_global_1268);
  return _kAXSCachePearlAuthenticationHapticsEnabled;
}

void _AXSSetPearlAuthenticationHapticsEnabled(uint64_t a1)
{
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  AXSupportLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_DEFAULT, "Set pearl-auth haptics: %d", (uint8_t *)v3, 8u);
  }

  _kAXSCachePearlAuthenticationHapticsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPearlAuthenticationHapticsPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.perl.auth.haptics"));
  _updateAccessibilitySettings();
}

uint64_t _AXSPearlRestingUnlock()
{
  unsigned __int8 v1;

  v1 = 0;
  _getBooleanPreference((const __CFString *)kAXSRestingPearlUnlockPreference, (char *)&v1);
  return v1;
}

uint64_t _AXSPearlRestingUnlockEverSet()
{
  NSObject *v0;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  AXSupportLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109120;
    v2[1] = _kAXSCacheRestingPearlUnlockEnabled;
    _os_log_impl(&dword_18F1A7000, v0, OS_LOG_TYPE_DEFAULT, "Retrieving pearl-resting unlock: %d", (uint8_t *)v2, 8u);
  }

  if (_AXSPearlRestingUnlockEverSet_onceToken != -1)
    dispatch_once(&_AXSPearlRestingUnlockEverSet_onceToken, &__block_literal_global_1269);
  return _kAXSCacheRestingPearlUnlockEnabled;
}

void _AXSPearlSetRestingUnlock(uint64_t a1)
{
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  AXSupportLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_DEFAULT, "Set pearl-resting unlock: %d", (uint8_t *)v3, 8u);
  }

  _kAXSCacheRestingPearlUnlockEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSRestingPearlUnlockPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.resting.home.button.unlock"));
  _updateAccessibilitySettings();
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (_AXSAttentionAwarenessFeaturesEnabled_twiceToken != -1)
    dispatch_once(&_AXSAttentionAwarenessFeaturesEnabled_twiceToken, &__block_literal_global_1270);
  if (!_AXSAttentionAwarenessFeaturesEnabled_supported)
    return 0;
  AXSupportLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    _AXSAttentionAwarenessFeaturesEnabled_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  if (_AXSAttentionAwarenessFeaturesEnabled_onceToken != -1)
    dispatch_once(&_AXSAttentionAwarenessFeaturesEnabled_onceToken, &__block_literal_global_1274);
  return _kAXSCacheAttentionAwarenessFeaturesEnabled;
}

void _AXSSetAttentionAwarenessFeaturesEnabled(uint64_t a1)
{
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  AXSupportLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_DEFAULT, "Set attention aware: %d", (uint8_t *)v3, 8u);
  }

  _kAXSCacheAttentionAwarenessFeaturesEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAttentionAwarenessFeaturesEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.attention.awareness"));
  _updateAccessibilitySettings();
}

uint64_t _AXSUserEnabledPasscodeForPurchases()
{
  if (_AXSUserEnabledPasscodeForPurchases_onceToken != -1)
    dispatch_once(&_AXSUserEnabledPasscodeForPurchases_onceToken, &__block_literal_global_1275);
  return _kAXSCachePasscodeForPurchases;
}

void _AXSSetUserEnabledPasscodeForPurchases(uint64_t a1)
{
  _kAXSCachePasscodeForPurchases = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPasscodeForPurchasesPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.passcode.purchases"));
  _updateAccessibilitySettings();
}

uint64_t _AXSHomeButtonRestingUnlockEverSet()
{
  unsigned __int8 v1;

  v1 = 0;
  _getBooleanPreference((const __CFString *)kAXSRestingHomeButtonUnlockPreference, (char *)&v1);
  return v1;
}

uint64_t _AXSHomeButtonRestingUnlockPreferredForDevice()
{
  int v0;
  uint64_t result;

  v0 = MGGetSInt32Answer();
  result = 0;
  if (v0 == 2)
    return MGGetBoolAnswer();
  return result;
}

uint64_t _AXSHomeButtonRestingUnlock()
{
  NSObject *v0;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  if (_kAXSCacheRestingHomeButtonUnlockEnabled == -1)
    _kAXSCacheRestingHomeButtonUnlockEnabled = _AXSHomeButtonRestingUnlockPreferredForDevice();
  AXSupportLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v2[0] = 67109120;
    v2[1] = _kAXSCacheRestingHomeButtonUnlockEnabled;
    _os_log_impl(&dword_18F1A7000, v0, OS_LOG_TYPE_DEFAULT, "Retrieving resting unlock: %d", (uint8_t *)v2, 8u);
  }

  if (_AXSHomeButtonRestingUnlock_onceToken != -1)
    dispatch_once(&_AXSHomeButtonRestingUnlock_onceToken, &__block_literal_global_1280);
  return _kAXSCacheRestingHomeButtonUnlockEnabled;
}

void _AXSHomeButtonSetRestingUnlock(uint64_t a1)
{
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  AXSupportLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_DEFAULT, "Set resting unlock: %d", (uint8_t *)v3, 8u);
  }

  _kAXSCacheRestingHomeButtonUnlockEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSRestingHomeButtonUnlockPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.resting.home.button.unlock"));
  _updateAccessibilitySettings();
}

uint64_t _AXSAXInspectorEnabled()
{
  if (_AXSAXInspectorEnabled_onceToken != -1)
    dispatch_once(&_AXSAXInspectorEnabled_onceToken, &__block_literal_global_1281);
  return _kAXSCacheAXInspectorEnabled;
}

uint64_t _AXSLogValidationErrors()
{
  if (_AXSLogValidationErrors_onceToken != -1)
    dispatch_once(&_AXSLogValidationErrors_onceToken, &__block_literal_global_1282);
  return _kAXSCacheLogValidationErrors;
}

void _AXSSetLogValidationErrors(uint64_t a1)
{
  _kAXSCacheLogValidationErrors = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSLogValidationErrorsPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.internal.logvalidationerrors"));
  _updateAccessibilitySettings();
}

void _AXSSetReportValidationErrors(uint64_t a1)
{
  _kAXSCacheReportValidationErrors = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSReportValidationErrorsPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.internal.reportvalidationerrors"));
  _updateAccessibilitySettings();
}

uint64_t _AXSCrashOnValidationErrors()
{
  if (_AXSCrashOnValidationErrors_onceToken != -1)
    dispatch_once(&_AXSCrashOnValidationErrors_onceToken, &__block_literal_global_1284);
  return _kAXSCacheCrashOnValidationErrors;
}

void _AXSSetCrashOnValidationErrors(uint64_t a1)
{
  _kAXSCacheCrashOnValidationErrors = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSCrashOnValidationErrorsPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.internal.crashonvalidationerrors"));
  _updateAccessibilitySettings();
}

uint64_t _AXSClassicInvertColorsEnabled()
{
  if (_AXSClassicInvertColorsEnabled_onceToken != -1)
    dispatch_once(&_AXSClassicInvertColorsEnabled_onceToken, &__block_literal_global_1285);
  return _kAXSCacheClassicInvertColorsEnabled;
}

BOOL _AXSInvertColorsEnabledAppCached(_BOOL8 result)
{
  const __CFString *v1;
  void *v2;
  const __CFNumber *v3;
  int v4;
  const __CFNumber *NumberPreference;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFNumber *v10;
  const __CFString *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v13;
  NSObject *v14;
  int valuePtr;
  unsigned int v16;

  if (result)
  {
    v1 = (const __CFString *)result;
    valuePtr = -1;
    cachedSmartInvertPreferences();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (const __CFNumber *)objc_msgSend(v2, "valueForKey:", v1);

    if (!v3 || (CFNumberGetValue(v3, kCFNumberIntType, &valuePtr), v4 = valuePtr, valuePtr == -2))
    {
      v16 = -1;
      NumberPreference = (const __CFNumber *)_getNumberPreference((const __CFString *)kAXSInvertColorsEnabledPreference, v1);
      if (!NumberPreference || (CFNumberGetValue(NumberPreference, kCFNumberIntType, &v16), v16 == -1))
      {
        v6 = _kAXSCacheInvertColorsGlobal;
        if (_kAXSCacheInvertColorsGlobal == -1)
          v6 = 0;
        v16 = v6;
      }
      cachedSmartInvertPreferences();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v8, v1);

      cachedSmartInvertPreferences();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (const __CFNumber *)objc_msgSend(v9, "valueForKey:", v1);

      if (valuePtr != -2)
      {
        v11 = (const __CFString *)objc_msgSend(CFSTR("com.apple.accessibility.cache.invert.colors"), "stringByAppendingString:", v1);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandleSmartInvertPrefChangedApp, v11, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
        AXSupportLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          _AXSInvertColorsEnabledAppCached_cold_2();

      }
      if (v10)
        CFNumberGetValue(v10, kCFNumberIntType, &valuePtr);
      AXSupportLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        _AXSInvertColorsEnabledAppCached_cold_1();

      v4 = valuePtr;
    }
    return v4 == 1;
  }
  return result;
}

id cachedSmartInvertPreferences()
{
  if (cachedSmartInvertPreferences_onceToken != -1)
    dispatch_once(&cachedSmartInvertPreferences_onceToken, &__block_literal_global_1891);
  return (id)cachedSmartInvertPreferences_CachedSmartInvertPreferences;
}

void _axsHandleSmartInvertPrefChangedApp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", a3);
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("com.apple.accessibility.cache.invert.colors"), &stru_1E29402B0, 0, 0, objc_msgSend(v3, "length"));
  _invalidateCacheSmartInvertPreference((uint64_t)v3);

}

void _AXSInvertColorsSetEnabledApp(int a1, __CFString *a2)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  int v6;

  v6 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSInvertColorsEnabledPreference, a1, (void (*)(void))_AXSInvertColorsEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSInvertColorsEnabledPreference, a2, &_kAXSCacheInvertColors, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSInvertColorsEnabledPreference, kCFNumberIntType, &v6, CFSTR("com.apple.accessibility.cache.invert.colors"), a2);
  if (v6 == 1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSPreLoadInvertColorsEnabledNotification, 0, 0, 1u);
  }
  _updateAccessibilitySettings();
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v5, (CFNotificationName)kAXSInvertColorsStatusDidChangeNotification, 0, 0, 1u);
}

void _AXSClassicInvertColorsSetEnabled(uint64_t a1)
{
  if ((_DWORD)a1 && _AXSInvertColorsEnabled())
    _AXSInvertColorsSetEnabled(0);
  _kAXSCacheClassicInvertColorsEnabled = a1;
  _AXSInvertColorsDisplaySetEnabled(a1);
  _setPreferenceAppWithNotification((const __CFString *)kAXSClassicInvertColorsPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.classic.invert.colors"));
  _updateAccessibilitySettings();
}

uint64_t _AXSSetInDataMigrationMode(uint64_t result)
{
  _InDataMigrationMode = (_DWORD)result != 0;
  return result;
}

void _AXSInvertColorsMarkInvertColorsPreloadComplete()
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, kAXSInvertColorsEnabledNotification[0], 0, 0, 1u);
}

uint64_t _AXSInvertColorsReloadPreferenceImmediately()
{
  return _getBooleanPreference((const __CFString *)kAXSInvertColorsEnabledPreference, 0);
}

uint64_t _AXSDisplayFilterColorEnabled()
{
  return MADisplayFilterPrefGetCategoryEnabled();
}

uint64_t _AXSDisplayFilterColorSetEnabled(uint64_t a1)
{
  uint64_t result;

  MADisplayFilterPrefSetCategoryEnabled();
  result = MADisplayFilterPrefGetType();
  if (result == 1)
    return _AXSGrayscaleSetEnabled(a1);
  return result;
}

uint64_t _AXSGrayscaleSetEnabled(uint64_t a1)
{
  int v1;
  uint64_t result;

  v1 = a1;
  _kAXSCacheGrayscaleEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSGrayscaleEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.grayscale"));
  _updateAccessibilitySettings();
  if (v1)
  {
    MADisplayFilterPrefSetType();
    return MADisplayFilterPrefSetCategoryEnabled();
  }
  result = MADisplayFilterPrefGetType();
  if (result == 1)
  {
    result = MADisplayFilterPrefGetCategoryEnabled();
    if ((_DWORD)result)
      return MADisplayFilterPrefSetCategoryEnabled();
  }
  return result;
}

void _AXSUpdateGrayscaleEnabledCache()
{
  BOOL v0;

  if (MADisplayFilterPrefGetCategoryEnabled())
    v0 = MADisplayFilterPrefGetType() == 1;
  else
    v0 = 0;
  _kAXSCacheGrayscaleEnabled = v0;
  _setPreferenceAppWithNotification((const __CFString *)kAXSGrayscaleEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:"), 0);
  _updateAccessibilitySettings();
  _setPreferenceAppWithNotification((const __CFString *)kAXSDidCheckGrayscalePreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 1), 0);
  _updateAccessibilitySettings();
}

uint64_t _AXSRedGreenFilterEnabled()
{
  uint64_t result;

  result = MADisplayFilterPrefGetCategoryEnabled();
  if ((_DWORD)result)
    return MADisplayFilterPrefGetType() == 2;
  return result;
}

uint64_t _AXSRedGreenFilterSetEnabled(int a1)
{
  uint64_t result;

  if (a1)
  {
    MADisplayFilterPrefSetType();
    return MADisplayFilterPrefSetCategoryEnabled();
  }
  result = MADisplayFilterPrefGetType();
  if (result == 2)
  {
    result = MADisplayFilterPrefGetCategoryEnabled();
    if ((_DWORD)result)
      return MADisplayFilterPrefSetCategoryEnabled();
  }
  return result;
}

uint64_t _AXSRedGreenFilterSetIntensity()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  MADisplayFilterPrefSuspendNotifications();
  MADisplayFilterPrefSetRedColorCorrectionIntensity();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSDisplayFilterForceUpdateNotification, 0, 0, 1u);
  return MADisplayFilterPrefSuspendNotifications();
}

uint64_t _AXSGreenRedFilterEnabled()
{
  uint64_t result;

  result = MADisplayFilterPrefGetCategoryEnabled();
  if ((_DWORD)result)
    return MADisplayFilterPrefGetType() == 4;
  return result;
}

uint64_t _AXSGreenRedFilterSetEnabled(int a1)
{
  uint64_t result;

  if (a1)
  {
    MADisplayFilterPrefSetType();
    return MADisplayFilterPrefSetCategoryEnabled();
  }
  result = MADisplayFilterPrefGetType();
  if (result == 4)
  {
    result = MADisplayFilterPrefGetCategoryEnabled();
    if ((_DWORD)result)
      return MADisplayFilterPrefSetCategoryEnabled();
  }
  return result;
}

uint64_t _AXSGreenRedFilterSetIntensity()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  MADisplayFilterPrefSuspendNotifications();
  MADisplayFilterPrefSetGreenColorCorrectionIntensity();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSDisplayFilterForceUpdateNotification, 0, 0, 1u);
  return MADisplayFilterPrefSuspendNotifications();
}

uint64_t _AXSBlueYellowFilterEnabled()
{
  uint64_t result;

  result = MADisplayFilterPrefGetCategoryEnabled();
  if ((_DWORD)result)
    return MADisplayFilterPrefGetType() == 8;
  return result;
}

uint64_t _AXSBlueYellowFilterSetEnabled(int a1)
{
  uint64_t result;

  if (a1)
  {
    MADisplayFilterPrefSetType();
    return MADisplayFilterPrefSetCategoryEnabled();
  }
  result = MADisplayFilterPrefGetType();
  if (result == 8)
  {
    result = MADisplayFilterPrefGetCategoryEnabled();
    if ((_DWORD)result)
      return MADisplayFilterPrefSetCategoryEnabled();
  }
  return result;
}

uint64_t _AXSBlueYellowFilterSetIntensity()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  MADisplayFilterPrefSuspendNotifications();
  MADisplayFilterPrefSetBlueColorCorrectionIntensity();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSDisplayFilterForceUpdateNotification, 0, 0, 1u);
  return MADisplayFilterPrefSuspendNotifications();
}

uint64_t _AXSColorTintFilterEnabled()
{
  uint64_t result;

  result = MADisplayFilterPrefGetCategoryEnabled();
  if ((_DWORD)result)
    return MADisplayFilterPrefGetType() == 16;
  return result;
}

uint64_t _AXSColorTintSetEnabled(int a1)
{
  uint64_t result;

  if (a1)
  {
    MADisplayFilterPrefSetType();
    return MADisplayFilterPrefSetCategoryEnabled();
  }
  result = MADisplayFilterPrefGetType();
  if (result == 16)
  {
    result = MADisplayFilterPrefGetCategoryEnabled();
    if ((_DWORD)result)
      return MADisplayFilterPrefSetCategoryEnabled();
  }
  return result;
}

uint64_t _AXSScreenFilterShowInitialAlert()
{
  if (_AXSScreenFilterShowInitialAlert_onceToken != -1)
    dispatch_once(&_AXSScreenFilterShowInitialAlert_onceToken, &__block_literal_global_1290);
  return _kAXSCacheDisplayFilterShowInitialAlert;
}

void _AXSScreenFilterSetShowInitialAlert(uint64_t a1)
{
  _kAXSCacheDisplayFilterShowInitialAlert = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSDisplayFilterShowInitialAlertPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.displayfilter.showinitialalert"));
  _updateAccessibilitySettings();
}

uint64_t _AXSDisableScreenFilters()
{
  uint64_t result;

  if (_AXSInvertColorsEnabled())
    _AXSInvertColorsSetEnabled(0);
  result = _AXSGrayscaleEnabled();
  if ((_DWORD)result)
    return _AXSGrayscaleSetEnabled(0);
  return result;
}

void *_AXSCachedValueForBrightnessFilter(const void *a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  void *v4;

  v2 = (const __CFDictionary *)_copyValuePreferenceApp((const __CFString *)kAXSCachedBrightnessFiltersPreference, 0, 0);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = (void *)objc_msgSend((id)CFDictionaryGetValue(v2, a1), "copy");
  CFRelease(v3);

  return v4;
}

void _AXSSetCacheForBrightnessFilter(const void *a1, const void *a2)
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  CFIndex Count;
  __CFDictionary *MutableCopy;
  __CFDictionary *Mutable;

  v4 = (const __CFDictionary *)_copyValuePreferenceApp((const __CFString *)kAXSCachedBrightnessFiltersPreference, 0, 0);
  if (v4)
  {
    v5 = v4;
    Count = CFDictionaryGetCount(v4);
    MutableCopy = CFDictionaryCreateMutableCopy(0, Count, v5);
    CFRelease(v5);
    if (a2)
      CFDictionarySetValue(MutableCopy, a1, a2);
    else
      CFDictionaryRemoveValue(MutableCopy, a1);
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    MutableCopy = Mutable;
    if (a2)
      CFDictionaryAddValue(Mutable, a1, a2);
  }
  _setPreferenceAppWithNotification((const __CFString *)kAXSCachedBrightnessFiltersPreference, 0, MutableCopy, (const __CFString *)kAXSCachedBrightnessFiltersPreferenceChangedNotification);
  CFRelease(MutableCopy);
}

void _AXSClosedCaptionsSetEnabled(int a1)
{
  MACaptionAppearanceDisplayType v2;
  int BooleanPreference;
  BOOL v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;
  char v7;

  if (a1)
    v2 = kMACaptionAppearanceDisplayTypeAlwaysOn;
  else
    v2 = kMACaptionAppearanceDisplayTypeAutomatic;
  MACaptionAppearanceSetDisplayType(kMACaptionAppearanceDomainDefault, v2);
  MACaptionAppearancePrefSetPreferAccessibleCaptions();
  v7 = 0;
  BooleanPreference = _getBooleanPreference((const __CFString *)kAXSClosedCaptioningEnabledByiTunesPreference, &v7);
  if (v7)
    v4 = BooleanPreference == a1;
  else
    v4 = 1;
  if (!v4)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSClosedCaptioningEnabledByiTunesPreference, 0, 0, 0);
    _updateAccessibilitySettings();
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileipod.notify.MovieClosedCaptioningEnabledSetting"), 0, 0, 1u);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v6, CFSTR("com.apple.accessibility.cache.captioning"), 0, 0, 1u);
}

uint64_t _AXSExtendedVoiceIsolationMediaModesEnabled()
{
  if (_AXSExtendedVoiceIsolationMediaModesEnabled_onceToken != -1)
    dispatch_once(&_AXSExtendedVoiceIsolationMediaModesEnabled_onceToken, &__block_literal_global_1294);
  return _kAXSCacheExtendedVoiceIsolationMediaModesEnabled;
}

void _AXSSetExtendedVoiceIsolationMediaModesEnabled(uint64_t a1)
{
  _kAXSCacheExtendedVoiceIsolationMediaModesEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSExtendedVoiceIsolationMediaModesEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.extendedvoiceisolationmodes"));
  _updateAccessibilitySettings();
}

void *_AXSCopyPreferredContentSizeCategoryNameGlobal()
{
  return _AXSCopyPreferredContentSizeCategoryNameApp(0);
}

void _AXSSetPreferredContentSizeCategoryName(const void *a1)
{
  _AXSSetPreferredContentSizeCategoryNameApp(a1, 0);
}

void _AXSSetPreferredContentSizeCategoryNameApp(const void *a1, __CFString *a2)
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  char v9;
  const __CFString *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uid_t v17;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *LocalCenter;
  id v20;
  uint8_t buf[4];
  _BYTE v22[20];
  const void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v20 = 0;
    v4 = (void *)objc_msgSend(objc_alloc((Class)getLSApplicationRecordClass()), "initWithBundleIdentifier:allowPlaceholder:error:", a2, 0, &v20);
    v5 = v20;
    if (v5)
    {
      AXSupportLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        _copyValuePreferenceApp_cold_1();

    }
    objc_msgSend(v4, "dataContainerURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "path");

    if (v8)
    {
      if (!-[__CFString hasPrefix:](a2, "hasPrefix:", CFSTR("com.apple.")))
      {
LABEL_17:
        _CFPreferencesSetAppValueWithContainer();
        AXSupportLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v22 = v8;
          *(_WORD *)&v22[8] = 2112;
          *(_QWORD *)&v22[10] = a2;
          *(_WORD *)&v22[18] = 2112;
          v23 = a1;
          _os_log_debug_impl(&dword_18F1A7000, v14, OS_LOG_TYPE_DEBUG, "CF Save CategoryName to Container: domain = %@, appID = %@, category name = %@", buf, 0x20u);
        }

        AXSupportLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v22 = a1;
          _os_log_impl(&dword_18F1A7000, v15, OS_LOG_TYPE_DEFAULT, "Saved CategoryName to Contaier: category name = %@", buf, 0xCu);
        }

        goto LABEL_22;
      }
      v9 = 0;
    }
    else
    {
      v9 = 1;
    }
    v10 = a2;
  }
  else
  {
    v10 = (const __CFString *)objc_msgSend((id)AXCPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("/Library/Preferences/com.apple.UIKit"));
    v8 = 0;
    v9 = 1;
  }
  CFPreferencesSetAppValue(CFSTR("UIPreferredContentSizeCategoryName"), a1, v10);
  v11 = CFPreferencesAppSynchronize(v10);
  AXSupportLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v22 = v10;
    *(_WORD *)&v22[8] = 2112;
    *(_QWORD *)&v22[10] = a2;
    *(_WORD *)&v22[18] = 2112;
    v23 = a1;
    _os_log_debug_impl(&dword_18F1A7000, v12, OS_LOG_TYPE_DEBUG, "CF Save CategoryName: domain = %@, appID = %@, category name = %@", buf, 0x20u);
  }

  AXSupportLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v22 = a2 != 0;
    *(_WORD *)&v22[4] = 2112;
    *(_QWORD *)&v22[6] = a1;
    *(_WORD *)&v22[14] = 1024;
    *(_DWORD *)&v22[16] = v11;
    _os_log_impl(&dword_18F1A7000, v13, OS_LOG_TYPE_DEFAULT, "Saved CategoryName to Domain: per-app = %d, category name = %@, synced = %d", buf, 0x18u);
  }

  if ((v9 & 1) == 0)
    goto LABEL_17;
LABEL_22:
  AXSupportLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = geteuid();
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v22 = a2 != 0;
    *(_WORD *)&v22[4] = 2112;
    *(_QWORD *)&v22[6] = a1;
    *(_WORD *)&v22[14] = 1024;
    *(_DWORD *)&v22[16] = v17 != 0;
    _os_log_impl(&dword_18F1A7000, v16, OS_LOG_TYPE_DEFAULT, "Saved CategoryName: per-app = %d, category name = %@, usermode = %d", buf, 0x18u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSApplePreferredContentSizeCategoryNotification, 0, 0, 1u);
  if (_inUnitTestMode)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)kAXSApplePreferredContentSizeCategoryNotification, 0, 0, 1u);
  }
}

id getLSApplicationRecordClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getLSApplicationRecordClass_softClass;
  v7 = getLSApplicationRecordClass_softClass;
  if (!getLSApplicationRecordClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getLSApplicationRecordClass_block_invoke;
    v3[3] = &unk_1E2939F70;
    v3[4] = &v4;
    __getLSApplicationRecordClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18F1BB400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _AXSLargeTextUsesExtendedRange()
{
  return CFPreferencesGetAppIntegerValue((CFStringRef)kLargeTextUsesExtendedRange, (CFStringRef)kPreferencesFrameworkDomain, 0) == 1;
}

void _AXSSetLargeTextUsesExtendedRange(int a1)
{
  const __CFString *v1;
  const void *v2;

  v1 = (const __CFString *)kLargeTextUsesExtendedRange;
  v2 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1 != 0);
  CFPreferencesSetAppValue(v1, v2, (CFStringRef)kPreferencesFrameworkDomain);
}

float _AXSPreferredFontSize()
{
  if (_AXSPreferredFontSize_onceToken != -1)
    dispatch_once(&_AXSPreferredFontSize_onceToken, &__block_literal_global_1299);
  return *(float *)&_kAXSCachedPreferredFontSize;
}

void _AXSPreferredFontSizeSetSize(float a1)
{
  float v1;

  v1 = a1;
  _kAXSCachedPreferredFontSize = LODWORD(a1);
  _setNumberPreferenceApp((const __CFString *)kAXSPreferredFontSizePreference, kCFNumberFloatType, &v1, CFSTR("com.apple.accessibility.cache.large.text.change"), 0);
}

uint64_t _AXSPhoneLockToEndCallEnabled()
{
  if (_AXSPhoneLockToEndCallEnabled_onceToken != -1)
    dispatch_once(&_AXSPhoneLockToEndCallEnabled_onceToken, &__block_literal_global_1300);
  return _kAXSCachePhoneLockToEndCall;
}

void _AXSPhoneLockToEndCallSetEnabled(uint64_t a1)
{
  _kAXSCachePhoneLockToEndCall = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPhoneLockToEndCallPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.lock.to.end.call"));
  _updateAccessibilitySettings();
}

void _AXSSetDefaultRouteForCall(int a1)
{
  int v1;

  v1 = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSDefaultRouteForCallPreference, kCFNumberIntType, &v1, (__CFString *)kAXSDefaultRouteChangedNotification, 0);
  _AXSSetAccessibilityEnabled();
}

float _AXSScreenContrast()
{
  float result;
  char v1;

  v1 = 1;
  result = _getFloatPreference((const __CFString *)kAXSScreenConstrastPreference, 0, &v1);
  if (!v1)
    return 0.0;
  return result;
}

void _AXSSetScreenContrast(float a1)
{
  float v1;

  v1 = a1;
  if (_getFloatPreference((const __CFString *)kAXSScreenConstrastPreference, 0, 0) != a1)
    _setNumberPreferenceApp((const __CFString *)kAXSScreenConstrastPreference, kCFNumberFloatType, &v1, (__CFString *)kAXSScreenContrastChangedNotification, 0);
}

uint64_t _AXSEarpieceNoiseCancellationEnabled()
{
  if (_AXSEarpieceNoiseCancellationEnabled_onceToken != -1)
    dispatch_once(&_AXSEarpieceNoiseCancellationEnabled_onceToken, &__block_literal_global_1308);
  return _kAXSCacheEarpieceNoiseCancellation;
}

void _AXSEarpieceNoiseCancellationSetEnabled(uint64_t a1)
{
  _kAXSCacheEarpieceNoiseCancellation = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSEarpieceNoiseCancellationPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.earpiece.noise"));
  _updateAccessibilitySettings();
}

void _AXSHearingAidsSetPaired(uint64_t a1)
{
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  AXSupportLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_INFO, "Setting hearing aids paired: %d", (uint8_t *)v3, 8u);
  }

  _kAXSCacheHearingAidPaired = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHearingAidPairedPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.hearing.aid.paired"));
  _updateAccessibilitySettings();
}

uint64_t _AXSHearingAidRingtoneStreamingEnabled()
{
  if (_AXSHearingAidRingtoneStreamingEnabled_onceToken != -1)
    dispatch_once(&_AXSHearingAidRingtoneStreamingEnabled_onceToken, &__block_literal_global_1310);
  return _kAXSCacheHearingAidRingtonStreamingEnabled;
}

void _AXSHearingAidRingtoneStreamingSetEnabled(uint64_t a1)
{
  _kAXSCacheHearingAidRingtonStreamingEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHearingAidRingtoneStreamingPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)kAXSHearingAidRingtoneStreamPreferenceChangedNotification);
  _updateAccessibilitySettings();
}

void _AXSMonoAudioSetEnabled(uint64_t a1)
{
  int v1;
  int BooleanPreference;
  BOOL v3;
  char v4;

  v1 = a1;
  _kAXSCacheMonoAudioEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSMonoAudioEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.mono.audio"));
  _updateAccessibilitySettings();
  v4 = 0;
  BooleanPreference = _getBooleanPreference((const __CFString *)kAXSMonoAudioEnabledByiTunesPreference, &v4);
  if (v4)
    v3 = BooleanPreference == v1;
  else
    v3 = 1;
  if (!v3)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSMonoAudioEnabledByiTunesPreference, 0, 0, 0);
    _updateAccessibilitySettings();
  }
}

uint64_t _AXSHearingAidComplianceEnabled()
{
  if (_AXSHearingAidComplianceEnabled_onceToken != -1)
    dispatch_once(&_AXSHearingAidComplianceEnabled_onceToken, &__block_literal_global_1312);
  return _kAXSCacheHearingAidComplianceEnabled;
}

void _AXSHearingAidComplianceSetEnabled(uint64_t a1)
{
  _kAXSCacheHearingAidComplianceEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHearingAidCompliancePreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.hac.audio"));
  _updateAccessibilitySettings();
}

void _AXSHearingSetDevicePairedEars(uint64_t a1)
{
  const __CFString *v1;
  const void *v2;

  v1 = (const __CFString *)kAXSHearingDevicePairedEarsPreference;
  v2 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a1);
  _setPreferenceAppWithNotification(v1, 0, v2, (const __CFString *)kAXSHearingDevicePairedEarsPreferenceChangedNotification);
}

void *_AXSHearingDevicePairedUUIDs()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHearingDevicePairedUUIDsPreference, 0, 0);
}

void _AXSHearingSetDevicePairedUUIDs(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHearingDevicePairedUUIDsPreference, 0, a1, (const __CFString *)kAXSHearingDevicePairedUUIDsPreferenceChangedNotification);
}

uint64_t _AXSHearingDeviceStreamingEars()
{
  void *v0;
  uint64_t v1;

  v0 = _copyValuePreferenceApp((const __CFString *)kAXSHearingDeviceStreamingEarsPreference, 0, 0);
  v1 = objc_msgSend(v0, "unsignedIntegerValue");

  return v1;
}

void _AXSHearingSetDeviceStreamingEars(uint64_t a1)
{
  const __CFString *v1;
  const void *v2;

  v1 = (const __CFString *)kAXSHearingDeviceStreamingEarsPreference;
  v2 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a1);
  _setPreferenceAppWithNotification(v1, 0, v2, (const __CFString *)kAXSHearingDeviceStreamingEarsPreferenceChangedNotification);
}

uint64_t _AXSSoftwareTTYEnabled()
{
  if (_AXSSoftwareTTYEnabled_onceToken != -1)
    dispatch_once(&_AXSSoftwareTTYEnabled_onceToken, &__block_literal_global_1313);
  return _kAXSCacheSoftwareTTYEnabled;
}

void _AXSSoftwareTTYSetEnabled(uint64_t a1)
{
  _kAXSCacheSoftwareTTYEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSSoftwareTTYPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.softwaretty"));
  _updateAccessibilitySettings();
}

id _AXSHearingCCAllOptions()
{
  if (_AXSHearingCCAllOptions_registerOnce != -1)
    dispatch_once(&_AXSHearingCCAllOptions_registerOnce, &__block_literal_global_1314);
  return (id)_AXSHearingCCAllOptions_hearingCCOptions;
}

id _AXSHearingCCEnabledOptions()
{
  void *v0;
  id v1;
  char v3;

  v3 = 0;
  v0 = _copyValuePreferenceApp((const __CFString *)kAXSHearingCCOptionsPreference, 0, &v3);
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v1 = v0;
  else
    v1 = 0;

  return v1;
}

void _AXSHearingCCSetEnabledOptions(const void *a1)
{
  if (a1)
    _setPreferenceAppWithNotification((const __CFString *)kAXSHearingCCOptionsPreference, 0, a1, (const __CFString *)kAXSHearingCCOptionsNotification);
}

float _AXSLeftRightAudioBalance()
{
  const __CFNumber *v0;
  const __CFNumber *v1;
  CFTypeID TypeID;
  float valuePtr;

  valuePtr = 0.0;
  v0 = (const __CFNumber *)CFPreferencesCopyValue((CFStringRef)kAXSLeftRightBalancePreference, (CFStringRef)kAXSAccessibilityPreferenceDomain, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (!v0)
    return 0.0;
  v1 = v0;
  TypeID = CFNumberGetTypeID();
  if (TypeID == CFGetTypeID(v1))
    CFNumberGetValue(v1, kCFNumberFloatType, &valuePtr);
  CFRelease(v1);
  return valuePtr;
}

uint64_t _AXSSetLeftRightAudioBalance(float a1)
{
  CFNumberRef v1;
  float valuePtr;

  valuePtr = a1;
  v1 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
  CFPreferencesSetAppValue((CFStringRef)kAXSLeftRightBalancePreference, v1, (CFStringRef)kAXSAccessibilityPreferenceDomain);
  CFRelease(v1);
  return notify_post("com.apple.coreaudio.aqmeBalance");
}

uint64_t _AXSHomeButtonAssistant()
{
  if (_AXSHomeButtonAssistant_onceToken != -1)
    dispatch_once(&_AXSHomeButtonAssistant_onceToken, &__block_literal_global_1322);
  return _kAXSHomeButtonAssistant;
}

void _AXSSetHomeButtonAssistant(uint64_t a1)
{
  _kAXSHomeButtonAssistant = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHomeButtonAssistantPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1), CFSTR("com.apple.accessibility.cache.homebuttonassistant"));
}

uint64_t _AXSSpeechSettingsDisabledByManagedConfiguration()
{
  if (_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken != -1)
    dispatch_once(&_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken, &__block_literal_global_1323);
  return _kAXSCacheSpeechSettingsDisabledByManagedConfiguration;
}

void _AXSSpeechSettingsSetDisabledByManagedConfiguration(uint64_t a1)
{
  _kAXSCacheSpeechSettingsDisabledByManagedConfiguration = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSSpeechSettingsDisabledByManagedConfigurationPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.speech.settings.disabled.by.mc"));
  _updateAccessibilitySettings();
}

void _AXSQuickSpeakSetEnabled(uint64_t a1)
{
  if (!(_DWORD)a1)
    _setPreferenceAppWithNotification((const __CFString *)kAXSQuickSpeakLocaleForLanguagePreference, 0, 0, (const __CFString *)kAXSQuickSpeakLocaleForLanguageNotification);
  _kAXSCacheQuickSpeakEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSQuickSpeakEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.quick.speak"));
  _updateAccessibilitySettings();
}

void *_AXSQuickSpeakCopyPreferredLocalesForLanguages()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSQuickSpeakLocaleForLanguagePreference, 0, 0);
}

void _AXSQuickSpeakSetPreferredLocaleForLanguage(const void *a1, const void *a2)
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  CFIndex Count;
  __CFDictionary *MutableCopy;

  v4 = (const __CFDictionary *)_copyValuePreferenceApp((const __CFString *)kAXSQuickSpeakLocaleForLanguagePreference, 0, 0);
  if (v4)
  {
    v5 = v4;
    Count = CFDictionaryGetCount(v4);
    MutableCopy = CFDictionaryCreateMutableCopy(0, Count, v5);
    CFRelease(v5);
    CFDictionarySetValue(MutableCopy, a2, a1);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionaryAddValue(MutableCopy, a2, a1);
  }
  _setPreferenceAppWithNotification((const __CFString *)kAXSQuickSpeakLocaleForLanguagePreference, 0, MutableCopy, (const __CFString *)kAXSQuickSpeakLocaleForLanguageNotification);
  CFRelease(MutableCopy);
}

uint64_t _AXSQuickSpeakHighlightTextEnabled()
{
  if (_AXSQuickSpeakHighlightTextEnabled_onceToken != -1)
    dispatch_once(&_AXSQuickSpeakHighlightTextEnabled_onceToken, &__block_literal_global_1325);
  return _kAXSCacheQuickSpeakHighlightTextEnabled;
}

void _AXSQuickSpeakSetHighlightTextEnabled(uint64_t a1)
{
  _kAXSCacheQuickSpeakHighlightTextEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSQuickSpeakHighlightTextEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.quick.speak.highlight.text"));
  _updateAccessibilitySettings();
}

id _AXSAccessibilityEnablers()
{
  if (_AXSAccessibilityEnablers_onceToken != -1)
    dispatch_once(&_AXSAccessibilityEnablers_onceToken, &__block_literal_global_1326);
  return (id)_AXSAccessibilityEnablers_Enablers;
}

uint64_t _AXSSiriSemanticContextEnabled()
{
  if (_AXSSiriSemanticContextEnabled_onceToken != -1)
    dispatch_once(&_AXSSiriSemanticContextEnabled_onceToken, &__block_literal_global_1408);
  return _kAXSCacheSiriSemanticContextEnabled;
}

uint64_t _AXSZoomSpeakUnderFingerEnabled()
{
  if (_AXSZoomSpeakUnderFingerEnabled_onceToken != -1)
    dispatch_once(&_AXSZoomSpeakUnderFingerEnabled_onceToken, &__block_literal_global_1544);
  return _kAXSCacheZoomSpeakUnderFingerEnabled;
}

uint64_t _AXSSpeakThisEnabledNoCaching()
{
  if (_AXSClarityBoardEnabled_onceToken != -1)
    dispatch_once(&_AXSClarityBoardEnabled_onceToken, &__block_literal_global_1243);
  if (_AXSClarityBoardEnabled_isEnabled)
    return 0;
  if (_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken != -1)
    dispatch_once(&_AXSSpeechSettingsDisabledByManagedConfiguration_onceToken, &__block_literal_global_1323);
  if (_kAXSCacheSpeechSettingsDisabledByManagedConfiguration)
    return 0;
  else
    return _getBooleanPreference((const __CFString *)kAXSSpeakThisEnabledPreference, 0);
}

void _AXSSetSpeakThisEnabled(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = a1;
  _kAXSCacheSpeakThisEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSSpeakThisEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.speak.this"));
  _updateAccessibilitySettings();
  if (v1)
  {
    v2 = 1;
LABEL_5:
    _AXSApplicationAccessibilitySetEnabled(v2);
    goto LABEL_6;
  }
  if (_AXSCanDisableApplicationAccessibility())
  {
    v2 = 0;
    goto LABEL_5;
  }
LABEL_6:
  _updateAccessibilitySettings();
}

uint64_t _AXSSpeakThisHighlightVisible()
{
  if (_AXSSpeakThisHighlightVisible_onceToken != -1)
    dispatch_once(&_AXSSpeakThisHighlightVisible_onceToken, &__block_literal_global_1400);
  return _kAXSCacheSpeakThisHighlightVisible;
}

void _AXSSpeakThisSetHighlightVisible(uint64_t a1)
{
  NSObject *v2;

  if (_kAXSWriteableClient)
    goto LABEL_5;
  AXLogSpeakScreen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    _AXSSpeakThisSetHighlightVisible_cold_1();

  if (_kAXSWriteableClient)
  {
LABEL_5:
    _kAXSCacheSpeakThisHighlightVisible = a1;
    _setPreferenceAppWithNotification((const __CFString *)kAXSSpeakThisHighlightVisiblePreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.speak.this.highlight.visible"));
    _updateAccessibilitySettings();
  }
}

void _AXSSetAutomationEnabled(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  AXSupportLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a1;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_DEFAULT, "Setting automation enabled: %d", (uint8_t *)v4, 8u);
  }

  _kAXSCacheAutomationEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomationEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.automation.enabled"));
  _updateAccessibilitySettings();
  if ((_DWORD)a1)
  {
    v3 = 1;
  }
  else
  {
    if (!_AXSCanDisableApplicationAccessibility())
      return;
    v3 = 0;
  }
  _AXSApplicationAccessibilitySetEnabled(v3);
}

void _AXSSetLocalizationCaptionModeEnabled(uint64_t a1)
{
  _kAXSCacheLocalizationCaptionModeEnabled = a1;
  _AXSAutomationLocalizedStringLookupInfoSetEnabled(a1);
  _setPreferenceAppWithNotification((const __CFString *)kAXSLocalizationCaptionModeEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.loc.caption.mode.enabled"));
  _updateAccessibilitySettings();
  if ((_DWORD)a1)
  {
    _AXSApplicationAccessibilitySetEnabled(1);
  }
  else if (_AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(0);
  }
}

void _AXSAutomationLocalizedStringLookupInfoSetEnabled(uint64_t a1)
{
  _kAXSCacheAutomationLocalizedStringLookup = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomationLocalizedStringLookupInfoEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.automation.localized.lookup"));
  _updateAccessibilitySettings();
}

uint64_t _AXSAutomationHitpointWarpingEnabled()
{
  if (_AXSAutomationHitpointWarpingEnabled_onceToken != -1)
    dispatch_once(&_AXSAutomationHitpointWarpingEnabled_onceToken, &__block_literal_global_1403);
  return _kAXSCacheAutomationHitpointWarpingEnabled;
}

void _AXSAutomationSetHitpointWarpingEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomationHitpointWarpingEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.automation.hitpoint_warping.enabled"));
  _updateAccessibilitySettings();
}

void _AXSAutomationSetFauxTableViewCellsEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomationEnableFauxTableViewCellsPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), 0);
  _updateAccessibilitySettings();
}

uint64_t _AXSAutomationFauxTableViewCellsEnabled()
{
  uint64_t result;
  char v1;

  v1 = 0;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSAutomationEnableFauxTableViewCellsPreference, &v1);
  if (v1)
    return result;
  else
    return 1;
}

void _AXSAutomationSetFauxCollectionViewCellsEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomationEnableFauxCollectionCellsPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), 0);
  _updateAccessibilitySettings();
}

uint64_t _AXSAutomationFauxCollectionViewCellsEnabled()
{
  return _getBooleanPreference((const __CFString *)kAXSAutomationEnableFauxCollectionCellsPreference, 0);
}

void _AXSSetSiriSemanticContextEnabled(uint64_t a1)
{
  int v1;

  v1 = a1;
  _kAXSCacheSiriSemanticContextEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSSiriSemanticContextEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.siri.semantic.context.enabled"));
  _updateAccessibilitySettings();
  if (v1)
  {
    _AXSApplicationAccessibilitySetEnabled(1);
  }
  else if (_AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(0);
  }
}

uint64_t _AXSContextKitContextIsLoneEnabler()
{
  return 0;
}

uint64_t _AXSContextKitAppIsAllowed()
{
  uint64_t IsAllowed;
  void *v1;
  void *v2;

  if (_AXSContextKitAppIsAllowed_DidSetAllowedList == 1)
    return _AXSContextKitAppIsAllowed_IsOnAllowedlist;
  _AXSContextKitAppIsAllowed_DidSetAllowedList = 1;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple"))
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.news")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.iBooks")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Pages")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Keynote")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Numbers")) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.siri.context.companion")))
  {
    _AXSContextKitAppIsAllowed_IsOnAllowedlist = 1;
  }
  IsAllowed = _AXSContextKitAppIsAllowed();
  _AXSContextKitAppIsAllowed_IsOnAllowedlist = IsAllowed;

  return IsAllowed;
}

uint64_t _AXSContextKitContextIsLoneApplicationAccessibilityEnabler()
{
  return 0;
}

void _AXSSetAuditInspectionModeEnabled(uint64_t a1)
{
  int v1;

  v1 = a1;
  _kAXSCacheAuditInspectionModeModeEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAuditInspectionModeEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.audit.inspection.mode"));
  _updateAccessibilitySettings();
  if (v1)
  {
    _AXSApplicationAccessibilitySetEnabled(1);
  }
  else if (_AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(0);
  }
}

void _AXSSetNocturneAccessibilityModeEnabled(uint64_t a1)
{
  uint64_t v2;

  _kAXSCacheNocturneAccessibilityModeEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSNocturneAccessibilityModeEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.nocturne.enabled"));
  _updateAccessibilitySettings();
  if ((_DWORD)a1)
  {
    v2 = 1;
LABEL_5:
    _AXSApplicationAccessibilitySetEnabled(v2);
    goto LABEL_6;
  }
  if (_AXSCanDisableApplicationAccessibility())
  {
    v2 = 0;
    goto LABEL_5;
  }
LABEL_6:
  _AXSAutomationLocalizedStringLookupInfoSetEnabled(a1);
}

void _AXSSetClipTracerAccessibilityModeEnabled(uint64_t a1)
{
  uint64_t v2;

  _kAXSCacheClipTracerAccessibilityModeEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSClipTracerAccessibilityModeEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.clip.tracer.enabled"));
  _updateAccessibilitySettings();
  if ((_DWORD)a1)
  {
    v2 = 1;
LABEL_5:
    _AXSApplicationAccessibilitySetEnabled(v2);
    goto LABEL_6;
  }
  if (_AXSCanDisableApplicationAccessibility())
  {
    v2 = 0;
    goto LABEL_5;
  }
LABEL_6:
  _AXSAutomationLocalizedStringLookupInfoSetEnabled(a1);
}

void _AXSVisualAlertSetEnabled(uint64_t a1)
{
  _kAXSCacheVisualAlertEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVisualAlertEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.visual.alert"));
  _updateAccessibilitySettings();
}

CFComparisonResult _langSort(const __CFDictionary *a1, const __CFDictionary *a2)
{
  const __CFString *Value;
  const __CFString *v4;

  Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("RotorItem"));
  v4 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("RotorItem"));
  return CFStringCompare(Value, v4, 1uLL);
}

uint64_t _AXSVoiceOverTouchLanguageRotorItemsExist()
{
  uint64_t result;

  result = (uint64_t)_copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchLanguageRotorPreference, 0, 0);
  if (result)
  {
    CFRelease((CFTypeRef)result);
    return 1;
  }
  return result;
}

uint64_t AXRetrieveSupportedAccessibilityLanguages()
{
  if (AXRetrieveSupportedAccessibilityLanguages_registerOnce != -1)
    dispatch_once(&AXRetrieveSupportedAccessibilityLanguages_registerOnce, &__block_literal_global_1437);
  return AXRetrieveSupportedAccessibilityLanguages_Langauges;
}

CFArrayRef _AXSVoiceOverTouchCopyLanguageRotorItems(int a1)
{
  const __CFArray *v1;
  const __CFAllocator *v2;
  const __CFArray *v3;
  const __CFArray *MutableCopy;
  uint64_t Count;
  __CFSet *Mutable;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  const __CFArray *v10;
  CFIndex v11;
  CFIndex v12;
  CFIndex v13;
  CFIndex v14;
  int v15;
  const void *v16;
  const void *v17;
  __CFDictionary *v18;
  CFArrayRef Copy;

  v1 = (const __CFArray *)_copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchLanguageRotorPreference, 0, 0);
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (v1)
  {
    v3 = v1;
    MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v1);
    CFRelease(v3);
  }
  else
  {
    MutableCopy = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  }
  Count = CFArrayGetCount(MutableCopy);
  Mutable = CFSetCreateMutable(v2, Count, MEMORY[0x1E0C9B3B0]);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(MutableCopy, i);
      Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("RotorItem"));
      CFSetAddValue(Mutable, Value);
    }
  }
  if (AXRetrieveSupportedAccessibilityLanguages_registerOnce != -1)
    dispatch_once(&AXRetrieveSupportedAccessibilityLanguages_registerOnce, &__block_literal_global_1437);
  v10 = (const __CFArray *)AXRetrieveSupportedAccessibilityLanguages_Langauges;
  v11 = CFArrayGetCount((CFArrayRef)AXRetrieveSupportedAccessibilityLanguages_Langauges);
  if (v11 == CFArrayGetCount(MutableCopy) || (v12 = CFArrayGetCount(v10), v12 < 1))
  {
    v15 = 0;
  }
  else
  {
    v13 = v12;
    v14 = 0;
    v15 = 0;
    v16 = (const void *)*MEMORY[0x1E0C9AE40];
    do
    {
      v17 = CFArrayGetValueAtIndex(v10, v14);
      if (!CFSetContainsValue(Mutable, v17))
      {
        v18 = CFDictionaryCreateMutable(v2, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        CFDictionaryAddValue(v18, CFSTR("RotorItem"), v17);
        CFDictionaryAddValue(v18, CFSTR("Enabled"), v16);
        CFArrayAppendValue(MutableCopy, v18);
        CFRelease(v18);
        v15 = 1;
      }
      ++v14;
    }
    while (v13 != v14);
  }
  Copy = CFArrayCreateCopy(v2, MutableCopy);
  CFRelease(Mutable);
  CFRelease(MutableCopy);
  if (a1 && v15)
    _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchLanguageRotorPreference, 0, Copy, 0);
  return Copy;
}

uint64_t _AXSVoiceOverTouchEnabledThroughAccessory()
{
  uint64_t result;
  char v1;

  v1 = 0;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchEnabledThroughAccessoryPreference, &v1);
  if (v1)
    return result;
  else
    return 0;
}

void _AXSVoiceOverTouchSetEnabledThroughAccessory(uint64_t a1)
{
  if ((_DWORD)a1)
    _AXSVoiceOverTouchSetUsageConfirmed(a1);
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchEnabledThroughAccessoryPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)kAXSVoiceOverTouchEnabledThroughAccessoryNotification);
  _updateAccessibilitySettings();
}

void _AXSVoiceOverTouchSetUsageConfirmed(uint64_t a1)
{
  _kAXSCacheVoiceOverUsageConfirmation = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchUsageConfirmedPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.vo.usage.confirm"));
  _updateAccessibilitySettings();
}

void *_AXSVoiceOverTouchCopyBrailleBluetoothDisplay()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleBluetoothDisplayPreference, 0, 0);
}

void _AXSVoiceOverTouchSetBrailleBluetoothDisplay(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchBrailleBluetoothDisplayPreference, 0, a1, (const __CFString *)kAXSVoiceOverTouchBrailleBluetoothDisplayChangedNotification);
}

void *_AXSVoiceOverTouchCopyTactileGraphicsDisplay()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchTactileGraphicsDisplayPreference, 0, 0);
}

void _AXSVoiceOverTouchSetTactileGraphicsDisplay(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchTactileGraphicsDisplayPreference, 0, a1, (const __CFString *)kAXSVoiceOverTouchTactileGraphicsDisplayChangedNotification);
}

uint64_t _AXSVoiceOverTouchActive2DBrailleDisplays()
{
  if (_AXSVoiceOverTouchActive2DBrailleDisplays_onceToken != -1)
    dispatch_once(&_AXSVoiceOverTouchActive2DBrailleDisplays_onceToken, &__block_literal_global_1442);
  return _kAXSCacheActive2DBrailleDisplays;
}

CFTypeID _AXSVoiceOverTouchUpdateActive2DBrailleDisplays()
{
  void *v0;
  BOOL v1;
  uint64_t v2;
  CFTypeID v3;
  CFTypeID result;
  char v5;

  if (_kAXSCacheActive2DBrailleDisplays)
  {
    CFRelease((CFTypeRef)_kAXSCacheActive2DBrailleDisplays);
    _kAXSCacheActive2DBrailleDisplays = 0;
  }
  v5 = 0;
  v0 = _copyValuePreferenceApp((const __CFString *)kAXSVoiceOverHasActive2DBrailleDisplayPreference, 0, &v5);
  if (v5)
    v1 = v0 == 0;
  else
    v1 = 1;
  if (v1 || (v2 = (uint64_t)v0, v3 = CFGetTypeID(v0), result = CFArrayGetTypeID(), v3 != result))
  {
    result = (CFTypeID)CFRetain(MEMORY[0x1E0C9AA60]);
    v2 = result;
  }
  _kAXSCacheActive2DBrailleDisplays = v2;
  return result;
}

void _AXSVoiceOverTouchSetActive2DBrailleDisplays(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverHasActive2DBrailleDisplayPreference, 0, a1, CFSTR("com.apple.accessibility.cache.HasActive2DBrailleDisplay"));
}

void *_AXSVoiceOverTouchCopyBrailleTableIdentifier()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleTableIdentifierPreference, 0, 0);
}

void _AXSVoiceOverTouchSetBrailleTableIdentifier(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchBrailleTableIdentifierPreference, 0, a1, (const __CFString *)kAXSVoiceOverTouchBrailleTableIdentifierChangedNotification);
}

uint64_t _AXSVoiceOverTouchBrailleVirtualStatusAlignment()
{
  void *v0;
  void *v1;
  uint64_t v2;
  char v4;

  v4 = 0;
  v0 = _copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleVirtualStatusAlignmentPreference, 0, &v4);
  v1 = v0;
  if (v4)
    v2 = objc_msgSend(v0, "integerValue");
  else
    v2 = 0;

  return v2;
}

void _AXSVoiceOverTouchSetBrailleVirtualStatusAlignment(uint64_t a1)
{
  uint64_t v1;

  v1 = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleVirtualStatusAlignmentPreference, kCFNumberCFIndexType, &v1, (__CFString *)kAXSVoiceOverTouchBrailleVirtualStatusAlignmentChangedNotification, 0);
}

uint64_t _AXSVoiceOverTouchBrailleMasterStatusCellIndex()
{
  void *v0;
  uint64_t v1;
  char v3;

  CFPreferencesAppSynchronize((CFStringRef)kAXSAccessibilityPreferenceDomain);
  v3 = 0;
  v0 = _copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleMasterStatusCellIndexPreference, 0, &v3);
  v1 = objc_msgSend(v0, "integerValue");

  return v1;
}

uint64_t _AXSVoiceOverTouchUIEnabled()
{
  return _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchUIEnabledPreference, 0);
}

void _AXSVoiceOverTouchSetUIEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchUIEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), 0);
  _updateAccessibilitySettings();
}

uint64_t _AXSVoiceOverTouchShouldRouteToSpeakerWithProximity()
{
  uint64_t result;
  char v1;

  v1 = 0;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchShouldRouteToSpeakerWithProximityPreference, &v1);
  if (v1)
    return result;
  else
    return 1;
}

void _AXSVoiceOverTouchSetShouldRouteToSpeakerWithProximity(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchShouldRouteToSpeakerWithProximityPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), 0);
  _updateAccessibilitySettings();
}

uint64_t _AXSVoiceOverTouchSpeakTimeOnWake()
{
  if (_AXSVoiceOverTouchSpeakTimeOnWake_onceToken != -1)
    dispatch_once(&_AXSVoiceOverTouchSpeakTimeOnWake_onceToken, &__block_literal_global_1443);
  return _kAXSCacheVoiceOverSpeakTimeOnWake;
}

void _AXSVoiceOverTouchSetSpeakTimeOnWake(uint64_t a1)
{
  _kAXSCacheVoiceOverSpeakTimeOnWake = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchSpeakTimeOnWakePreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.AXSCacheVoiceOverSpeakTimeOnWakeNotification"));
  _updateAccessibilitySettings();
}

uint64_t _AXSWalkieTalkieTapToTalkEnabled()
{
  if (_AXSWalkieTalkieTapToTalkEnabled_onceToken != -1)
    dispatch_once(&_AXSWalkieTalkieTapToTalkEnabled_onceToken, &__block_literal_global_1444);
  return _kAXSCacheWalkieTalkieTapToTalk;
}

void _AXSWalkieTalkieSetTapToTalkEnabled(uint64_t a1)
{
  _kAXSCacheWalkieTalkieTapToTalk = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSWalkieTalkieTapToTalkPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.AXSCacheWalkieTalkieTapToTalkNotification"));
  _updateAccessibilitySettings();
}

uint64_t _AXSAppSwitcherAutoSelectEnabled()
{
  if (_AXSAppSwitcherAutoSelectEnabled_onceToken != -1)
    dispatch_once(&_AXSAppSwitcherAutoSelectEnabled_onceToken, &__block_literal_global_1445);
  return _kAXSCacheAppSwitcherAutoSelect;
}

void _AXSAppSwitcherSetAutoSelectEnabled(uint64_t a1)
{
  _kAXSCacheAppSwitcherAutoSelect = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAppSwitcherAutoSelectPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.AXSCacheAppSwitcherAutoSelectNotification"));
  _updateAccessibilitySettings();
}

uint64_t _AXSCharacterVoiceDefaultSupportedLanguages()
{
  if (_AXSCharacterVoiceDefaultSupportedLanguages_onceToken != -1)
    dispatch_once(&_AXSCharacterVoiceDefaultSupportedLanguages_onceToken, &__block_literal_global_1446);
  return _AXSCharacterVoiceDefaultSupportedLanguages_supportedLanguages;
}

uint64_t _AXSCharacterVoiceSupportedForLocale(uint64_t result)
{
  void *v1;

  if (result)
  {
    v1 = (void *)MEMORY[0x193FFFF04]();
    return _AXSCharacterVoiceSupportedForLocaleIdentifier(v1);
  }
  return result;
}

uint64_t _AXSCharacterVoiceSupportedForLocaleIdentifier(void *a1)
{
  const __CFArray *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  id v8;
  void *v9;
  const __CFArray *v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  CFRange v20;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 1;
  if (_AXSCharacterVoiceDefaultSupportedLanguages_onceToken != -1)
    dispatch_once(&_AXSCharacterVoiceDefaultSupportedLanguages_onceToken, &__block_literal_global_1446);
  v2 = (const __CFArray *)_AXSCharacterVoiceDefaultSupportedLanguages_supportedLanguages;
  v20.length = CFArrayGetCount((CFArrayRef)_AXSCharacterVoiceDefaultSupportedLanguages_supportedLanguages);
  v20.location = 0;
  if (CFArrayContainsValue(v2, v20, a1))
    return 1;
  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ca-es")) & 1) != 0
    || (objc_msgSend(v5, "hasPrefix:", CFSTR("ca")) & 1) != 0)
  {
    v6 = CFSTR("es-ES");
  }
  else
  {
    if (!objc_msgSend(v5, "hasPrefix:", CFSTR("nb")))
      goto LABEL_10;
    v6 = CFSTR("no-NO");
  }

  v5 = (void *)v6;
LABEL_10:
  if ((-[__CFArray containsObject:](v2, "containsObject:", v5) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v7 = objc_msgSend(v5, "rangeOfString:", CFSTR("-"));
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v5;
    }
    else
    {
      objc_msgSend(v5, "substringToIndex:", v7 + 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10 = v2;
    v3 = -[__CFArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v3)
    {
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v10);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "hasPrefix:", v9, (_QWORD)v14) & 1) != 0)
          {
            v3 = 1;
            goto LABEL_27;
          }
        }
        v3 = -[__CFArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_27:

  }
  return v3;
}

void _AXSVoiceOverTouchSetEnabledAppTemporaryOverride(uint64_t a1)
{
  __CFNotificationCenter *LocalCenter;

  VoiceOverTemporaryOverride = a1;
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("com.apple.accessibility.cache.vot"), 0, 0, 1u);
}

void _AXSVoiceOverTouchSetEnabled(uint64_t a1)
{
  NSObject *v2;
  int BooleanPreference;
  uint64_t v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  AXSupportLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a1;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_INFO, "Requesting VoiceOver enabled: %d", (uint8_t *)v6, 8u);
  }

  _kAXSCacheVoiceOverTouchEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.vot"));
  _updateAccessibilitySettings();
  LOBYTE(v6[0]) = 0;
  BooleanPreference = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchEnabledByiTunesPreference, (char *)v6);
  if (LOBYTE(v6[0]) && BooleanPreference != (_DWORD)a1)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchEnabledByiTunesPreference, 0, 0, 0);
    _updateAccessibilitySettings();
  }
  if ((_DWORD)a1)
  {
    if (_AXSAssistiveTouchScannerEnabled_onceToken != -1)
      dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1215);
    if (_kAXSCacheSwitchControlEnabled)
      _AXSAssistiveTouchScannerSetEnabled(0);
    _kickstartProcess("com.apple.VoiceOverTouch");
    v4 = 1;
  }
  else
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSBrailleInputDeviceConnectedPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 0), CFSTR("com.apple.accessibility.cache.braille.input.connection.changed"));
    _updateAccessibilitySettings();
    v5 = _AXSCanDisableApplicationAccessibility();
    v4 = 0;
    if (!v5)
      return;
  }
  _AXSApplicationAccessibilitySetEnabled(v4);
}

void _AXSVoiceOverTouchSetEnabledAndAutoConfirmUsage(uint64_t a1)
{
  if ((_DWORD)a1)
  {
    _AXSApplicationAccessibilitySetEnabled(1);
    _AXSVoiceOverTouchSetUsageConfirmed(1);
  }
  _AXSVoiceOverTouchSetEnabled(a1);
}

uint64_t _AXSVoiceOverTouchUsageConfirmed()
{
  if (_AXSVoiceOverTouchUsageConfirmed_onceToken != -1)
    dispatch_once(&_AXSVoiceOverTouchUsageConfirmed_onceToken, &__block_literal_global_1527);
  return _kAXSCacheVoiceOverUsageConfirmation;
}

uint64_t _AXSVoiceOverTouchUserHasReadNoHomeButtonGestureDescription()
{
  if (_AXSVoiceOverTouchUserHasReadNoHomeButtonGestureDescription_onceToken != -1)
    dispatch_once(&_AXSVoiceOverTouchUserHasReadNoHomeButtonGestureDescription_onceToken, &__block_literal_global_1528);
  return _kAXSCacheVOTUserHasReadNoHomeButtonGesture;
}

void _AXSVoiceOverTouchSetUserHasReadNoHomeButtonGestureDescription(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchUserHasReadNoHomeButtonGesturePreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.vo.user.has.read.no.home.button.gesture"));
  _updateAccessibilitySettings();
}

uint64_t _AXSVoiceOverTouchScreenCurtainEnabled()
{
  if (_AXSVoiceOverTouchScreenCurtainEnabled_onceToken != -1)
    dispatch_once(&_AXSVoiceOverTouchScreenCurtainEnabled_onceToken, &__block_literal_global_1529);
  return _kAXSCacheVoiceOverScreenCurtain;
}

void _AXSVoiceOverTouchSetScreenCurtainEnabled(uint64_t a1)
{
  _kAXSCacheVoiceOverScreenCurtain = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchScreenCurtainPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.vo.screen.curtain"));
  _updateAccessibilitySettings();
}

float _AXSVoiceOverTouchVolume()
{
  if (_AXSVoiceOverTouchVolume_onceToken != -1)
    dispatch_once(&_AXSVoiceOverTouchVolume_onceToken, &__block_literal_global_1530);
  return *(float *)&_kAXSCachedVoiceOverVolume;
}

void _AXSVoiceOverTouchSetVolume(float a1)
{
  int v2;
  float v3;
  float v4;

  v2 = AXRuntimeCheck_SupportsVoiceoverIndepedentVolume();
  v3 = 1.99;
  if (!v2)
    v3 = 1.0;
  v4 = fminf(v3, fmaxf(a1, 0.0));
  _kAXSCachedVoiceOverVolume = LODWORD(v4);
  _setNumberPreferenceApp((const __CFString *)kAXSVoiceOverTouchVolumePreference, kCFNumberFloatType, &v4, CFSTR("com.apple.accessibility.cache.vot.volume"), 0);
}

float _AXSVoiceOverTouchSpeakingRate()
{
  void *v0;
  void *v1;
  float v2;
  float v3;

  -[objc_class valueForKey:](NSClassFromString(CFSTR("AXSettings")), "valueForKey:", CFSTR("sharedInstance"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForKey:", CFSTR("voiceOverSpeakingRate"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

void _AXSVoiceOverTouchSetLanguageRotorItems(const void *a1)
{
  if (a1)
    _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchLanguageRotorPreference, 0, a1, (const __CFString *)kAXSVoiceOverTouchLanguageRotorChangedNotification);
}

void *_AXSVoiceOverTouchCopyBrailleLanguageRotorItems()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleLanguageRotorPreference, 0, 0);
}

void _AXSVoiceOverTouchSetBrailleLanguageRotorItems(const void *a1)
{
  if (a1)
    _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchBrailleLanguageRotorPreference, 0, a1, (const __CFString *)kAXSVoiceOverTouchBrailleLanguageRotorChangedNotification);
}

void _AXSVoiceOverTouchSetBrailleMasterStatusCellIndex(uint64_t a1)
{
  uint64_t v1;

  v1 = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleMasterStatusCellIndexPreference, kCFNumberCFIndexType, &v1, (__CFString *)kAXSVoiceOverTouchBrailleMasterStatusCellIndexChangedNotification, 0);
}

CFIndex _AXSVoiceOverTouchBrailleContractionMode()
{
  CFIndex result;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize((CFStringRef)kAXSAccessibilityPreferenceDomain);
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue((CFStringRef)kAXSVoiceOverTouchBrailleContractionModePreference, (CFStringRef)kAXSAccessibilityPreferenceDomain, &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    return 1;
  return result;
}

void _AXSVoiceOverTouchSetBrailleContractionMode(uint64_t a1)
{
  uint64_t v1;

  v1 = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSVoiceOverTouchBrailleContractionModePreference, kCFNumberCFIndexType, &v1, (__CFString *)kAXSVoiceOverTouchBrailleContractionModeChangedNotification, 0);
}

uint64_t _AXSVoiceOverTouchBrailleEightDotMode()
{
  uint64_t result;
  char v1;

  v1 = 1;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchBrailleEightDotModePreference, &v1);
  if (v1)
    return result;
  else
    return 1;
}

void _AXSVoiceOverTouchSetBrailleEightDotMode(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchBrailleEightDotModePreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)kAXSVoiceOverTouchBrailleEightDotModeChangedNotification);
  _updateAccessibilitySettings();
}

uint64_t _AXSVoiceOverTouchBrailleDisplayDisconnectOnSleep()
{
  uint64_t result;
  char v1;

  v1 = 1;
  LODWORD(result) = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchBrailleDisplayDisconnectOnSleepPreference, &v1);
  if (v1)
    return result;
  else
    return 1;
}

void _AXSVoiceOverTouchSetBrailleDisplayDisconnectOnSleep(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchBrailleDisplayDisconnectOnSleepPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)kAXSVoiceOverTouchBrailleBrailleDisplayDisconnectOnSleepChangedNotification);
  _updateAccessibilitySettings();
}

void _AXSVoiceOverTouchSetTypingMode(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchTypingModePreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a1), (const __CFString *)objc_msgSend((id)kAXSVoiceOverTouchTypingModePreference, "stringByAppendingString:", CFSTR(".notification")));
}

uint64_t _AXSVoiceOverTouchTypingMode()
{
  void *v0;
  uint64_t v1;

  _copyPrefValueWithCustomCallback((__CFString *)kAXSVoiceOverTouchTypingModePreference, (uint64_t)_handleVoiceOverTypingModeChangedNotification);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v1 = objc_msgSend(v0, "integerValue");
  else
    v1 = 0;

  return v1;
}

void _handleVoiceOverTypingModeChangedNotification()
{
  _handlePreferenceChangeWithLocalNotification((const __CFString *)kAXSVoiceOverTouchTypingModeChangedNotification);
}

uint64_t _AXSWebAccessibilityEventsEnabled()
{
  return 1;
}

void _AXSSetWebAccessibilityEventsEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSWebAccessibilityEventsEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.web.accessibility.events.enabled"));
  _updateAccessibilitySettings();
}

float _AXSVoiceOverTouchMediaDuckingVolume()
{
  if (_AXSVoiceOverTouchMediaDuckingVolume_onceToken != -1)
    dispatch_once(&_AXSVoiceOverTouchMediaDuckingVolume_onceToken, &__block_literal_global_1533);
  return *(float *)&_kAXSCachedVoiceOverMediaDuckingVolume;
}

void _AXSVoiceOverTouchMediaDuckingSetVolume(float a1)
{
  float v1;

  v1 = a1;
  _kAXSCachedVoiceOverMediaDuckingVolume = LODWORD(a1);
  _setNumberPreferenceApp((const __CFString *)kAXSVoiceOverTouchMediaDuckingVolumePreference, kCFNumberFloatType, &v1, CFSTR("com.apple.accessibility.cache.vot.media.ducking.volume"), 0);
}

uint64_t _AXSVoiceOverMediaDuckingMode()
{
  if (_AXSVoiceOverMediaDuckingMode_onceToken != -1)
    dispatch_once(&_AXSVoiceOverMediaDuckingMode_onceToken, &__block_literal_global_1534);
  return _kAXSCachedVoiceOverMediaDuckingMode;
}

void _AXSVoiceOverMediaDuckingSetMode(uint64_t a1)
{
  uint64_t v1;

  v1 = a1;
  _kAXSCachedVoiceOverMediaDuckingMode = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSVoiceOverTouchMediaDuckingModePreference, kCFNumberIntType, &v1, CFSTR("com.apple.accessibility.cache.vot.media.ducking.mode"), 0);
}

uint64_t _AXSVoiceOverTouchTutorialUsageConfirmed()
{
  if (_AXSVoiceOverTouchTutorialUsageConfirmed_onceToken != -1)
    dispatch_once(&_AXSVoiceOverTouchTutorialUsageConfirmed_onceToken, &__block_literal_global_1535);
  return _kAXSCacheVoiceOverTutorialUsageConfirmation;
}

void _AXSVoiceOverTouchSetTutorialUsageConfirmed(uint64_t a1)
{
  _kAXSCacheVoiceOverTutorialUsageConfirmation = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverTouchTutorialUsageConfirmedPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.vo.usage.tutorial.confirm"));
  _updateAccessibilitySettings();
}

uint64_t _AXSBrailleScreenInputEnabled()
{
  uint64_t result;

  result = _AXSVoiceOverTouchEnabled();
  if ((_DWORD)result)
  {
    if (_AXSBrailleScreenInputEnabled_onceToken != -1)
      dispatch_once(&_AXSBrailleScreenInputEnabled_onceToken, &__block_literal_global_1536);
    return _kAXSCacheBrailleScreenInputEnabled;
  }
  return result;
}

void _AXSBrailleScreenInputSetEnabled(uint64_t a1)
{
  _kAXSCacheBrailleScreenInputEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSBrailleScreenInputEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.bsi"));
  _updateAccessibilitySettings();
}

void _AXSHoverTextSetEnabled(uint64_t a1)
{
  _kAXSCacheHoverTextEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.hovertext"));
  _updateAccessibilitySettings();
}

void _AXSHoverTextTypingSetEnabled(uint64_t a1)
{
  _kAXSCacheHoverTextTypingEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextTypingEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.hovertext.typing"));
  _updateAccessibilitySettings();
}

uint64_t _AXSHoverTextTypingDisplayMode()
{
  if (_AXSHoverTextTypingDisplayMode_onceToken != -1)
    dispatch_once(&_AXSHoverTextTypingDisplayMode_onceToken, &__block_literal_global_1539);
  return _kAXSCacheHoverTextTypingDisplayMode;
}

void _AXSHoverTextTypingSetDisplayMode(uint64_t a1)
{
  uint64_t v1;

  v1 = a1;
  _kAXSCacheHoverTextTypingDisplayMode = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSHoverTextTypingDisplayModePreference, kCFNumberIntType, &v1, CFSTR("com.apple.accessibility.cache.hovertext.typing.displaymode.change"), 0);
}

void *_AXSHoverTextTypingCopyFontName()
{
  void *result;

  result = _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingFontNamePreference, 0, 0);
  if (!result)
    return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextFontNamePreference, 0, 0);
  return result;
}

void *_AXSHoverTextCopyFontName()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextFontNamePreference, 0, 0);
}

void _AXSHoverTextTypingSetFontName(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextTypingFontNamePreference, 0, a1, (const __CFString *)kAXSHoverTextTypingFontNameChangedNotification);
}

void *_AXSHoverTextTypingCopyTextColorData()
{
  void *result;

  result = _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingTextColorDataPreference, 0, 0);
  if (!result)
    return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTextColorDataPreference, 0, 0);
  return result;
}

void *_AXSHoverTextCopyTextColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTextColorDataPreference, 0, 0);
}

void _AXSHoverTextTypingSetTextColorData(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextTypingTextColorDataPreference, 0, a1, (const __CFString *)kAXSHoverTextTypingTextColorDataChangedNotification);
}

void *_AXSHoverTextTypingCopyInsertionPointColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingInsertionPointColorDataPreference, 0, 0);
}

void _AXSHoverTextTypingSetInsertionPointColorData(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextTypingInsertionPointColorDataPreference, 0, a1, (const __CFString *)kAXSHoverTextTypingInsertionPointColorDataChangedNotification);
}

void *_AXSHoverTextTypingCopyBackgroundColorData()
{
  void *result;

  result = _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingBackgroundColorDataPreference, 0, 0);
  if (!result)
    return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextBackgroundColorDataPreference, 0, 0);
  return result;
}

void *_AXSHoverTextCopyBackgroundColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextBackgroundColorDataPreference, 0, 0);
}

void _AXSHoverTextTypingSetBackgroundColorData(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextTypingBackgroundColorDataPreference, 0, a1, (const __CFString *)kAXSHoverTextTypingBackgroundColorDataChangedNotification);
}

void *_AXSHoverTextTypingCopyBorderColorData()
{
  void *result;

  result = _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingBorderColorDataPreference, 0, 0);
  if (!result)
    return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextBorderColorDataPreference, 0, 0);
  return result;
}

void *_AXSHoverTextCopyBorderColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextBorderColorDataPreference, 0, 0);
}

void _AXSHoverTextTypingSetBorderColorData(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextTypingBorderColorDataPreference, 0, a1, (const __CFString *)kAXSHoverTextTypingBorderColorDataChangedNotification);
}

void *_AXSHoverTextTypingCopyTextStyle()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingTextStylePreference, 0, 0);
}

void _AXSHoverTextTypingSetTextStyle(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextTypingTextStylePreference, 0, a1, (const __CFString *)kAXSHoverTextTypingFontNameChangedNotification);
}

void *_AXSHoverTextTypingCopyMisspelledTextColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingMisspelledTextColorDataPreference, 0, 0);
}

void _AXSHoverTextTypingSetMisspelledTextColorData(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextTypingMisspelledTextColorDataPreference, 0, a1, (const __CFString *)kAXSHoverTextTypingMisspelledTextColorDataChangedNotification);
}

void *_AXSHoverTextTypingCopyAutocorrectedTextColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextTypingAutocorrectedTextColorDataPreference, 0, 0);
}

void _AXSHoverTextTypingSetAutocorrectedTextColorData(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextTypingAutocorrectedTextColorDataPreference, 0, a1, (const __CFString *)kAXSHoverTextTypingAutocorrectedTextColorDataChangedNotification);
}

float _AXSHoverTextFontSize()
{
  if (_AXSHoverTextFontSize_onceToken != -1)
    dispatch_once(&_AXSHoverTextFontSize_onceToken, &__block_literal_global_1540);
  return *(float *)&_kAXSCachedHoverTextFontSize;
}

void _AXSHoverTextSetFontSize(float a1)
{
  float v1;

  v1 = a1;
  _kAXSCachedHoverTextFontSize = LODWORD(a1);
  _setNumberPreferenceApp((const __CFString *)kAXSHoverTextFontSizePreference, kCFNumberFloatType, &v1, CFSTR("com.apple.accessibility.cache.hovertext.fontsize.change"), 0);
}

void _AXSHoverTextSetFontName(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextFontNamePreference, 0, a1, (const __CFString *)kAXSHoverTextFontNameChangedNotification);
}

void _AXSHoverTextSetTextColorData(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextTextColorDataPreference, 0, a1, (const __CFString *)kAXSHoverTextTextColorDataChangedNotification);
}

void *_AXSHoverTextCopyInsertionPointColorData()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextInsertionPointColorDataPreference, 0, 0);
}

void _AXSHoverTextSetInsertionPointColorData(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextInsertionPointColorDataPreference, 0, a1, (const __CFString *)kAXSHoverTextInsertionPointColorDataChangedNotification);
}

void _AXSHoverTextSetBackgroundColorData(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextBackgroundColorDataPreference, 0, a1, (const __CFString *)kAXSHoverTextBackgroundColorDataChangedNotification);
}

void _AXSHoverTextSetBorderColorData(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextBorderColorDataPreference, 0, a1, (const __CFString *)kAXSHoverTextBorderColorDataChangedNotification);
}

float _AXSHoverTextBackgroundOpacity()
{
  if (_AXSHoverTextBackgroundOpacity_onceToken != -1)
    dispatch_once(&_AXSHoverTextBackgroundOpacity_onceToken, &__block_literal_global_1541);
  return *(float *)&_kAXSCachedHoverTextBackgroundOpacity;
}

float _AXSHoverTextSetBackgroundOpacity(float a1)
{
  double v1;
  int v2;
  float result;
  int v4;

  v1 = a1;
  if (v1 < 0.35)
    v1 = 0.35;
  *(float *)&v2 = fmin(v1, 1.0);
  v4 = v2;
  _kAXSCachedHoverTextBackgroundOpacity = v2;
  _setNumberPreferenceApp((const __CFString *)kAXSHoverTextBackgroundOpacityPreference, kCFNumberFloatType, &v4, CFSTR("com.apple.accessibility.cache.hovertext.backgroundopacity.change"), 0);
  return result;
}

uint64_t _AXSHoverTextDisplayMode()
{
  if (_AXSHoverTextDisplayMode_onceToken != -1)
    dispatch_once(&_AXSHoverTextDisplayMode_onceToken, &__block_literal_global_1542);
  return _kAXSCachedHoverTextDisplayMode;
}

void _AXSHoverTextSetDisplayMode(uint64_t a1)
{
  uint64_t v1;

  v1 = a1;
  _kAXSCachedHoverTextDisplayMode = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSHoverTextDisplayModePreference, kCFNumberIntType, &v1, CFSTR("com.apple.accessibility.cache.hovertext.displaymode.change"), 0);
}

void *_AXSHoverTextCopyContentSize()
{
  return _copyValuePreferenceApp((const __CFString *)kAXSHoverTextContentSizePreference, 0, 0);
}

void _AXSHoverTextSetContentSize(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSHoverTextContentSizePreference, 0, a1, (const __CFString *)kAXSHoverTextContentSizeChangedNotification);
}

uint64_t _AXSLiveSpeechEnabled()
{
  if (_AXSLiveSpeechEnabled_onceToken != -1)
    dispatch_once(&_AXSLiveSpeechEnabled_onceToken, &__block_literal_global_1543);
  return _kAXSCacheLiveSpeechEnabled;
}

void _AXSLiveSpeechSetEnabled(uint64_t a1)
{
  _kAXSCacheLiveSpeechEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSLiveSpeechEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.livespeech"));
  _updateAccessibilitySettings();
}

uint64_t _AXSZoomTouchToggledByVoiceOver()
{
  return _getBooleanPreference((const __CFString *)kAXSZoomTouchToggledByVoiceOverPreference, 0);
}

void _AXSZoomTouchSetToggledByVoiceOver(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSZoomTouchToggledByVoiceOverPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), 0);
  _updateAccessibilitySettings();
}

uint64_t _AXSZoomTouchToggledByPreferenceSwitch()
{
  return _getBooleanPreference((const __CFString *)kAXSZoomTouchToggledByPreferenceSwitchPreference, 0);
}

void _AXSZoomTouchSetToggledByPreferenceSwitch(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSZoomTouchToggledByPreferenceSwitchPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), 0);
  _updateAccessibilitySettings();
}

void _AXSZoomSpeakUnderFingerSetEnabled(uint64_t a1)
{
  int v1;

  v1 = a1;
  _kAXSCacheZoomSpeakUnderFingerEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSZoomSpeakUnderFingerEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.zoom.speakunderfinger"));
  _updateAccessibilitySettings();
  if (_AXSZoomTouchEnabled())
  {
    if (v1)
    {
      _AXSApplicationAccessibilitySetEnabled(1);
    }
    else if (_AXSCanDisableApplicationAccessibility())
    {
      _AXSApplicationAccessibilitySetEnabled(0);
    }
  }
}

uint64_t _AXSZoomTouchSmoothScalingDisabled()
{
  if (_AXSZoomTouchSmoothScalingDisabled_onceToken != -1)
    dispatch_once(&_AXSZoomTouchSmoothScalingDisabled_onceToken, &__block_literal_global_1545);
  return _kAXSCacheZoomTouchSmoothScalingDisabled;
}

void _AXSZoomTouchSetSmoothScalingDisabled(uint64_t a1)
{
  _kAXSCacheZoomTouchSmoothScalingDisabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSZoomTouchSmoothScalingPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.zoom.smoothscaling"));
  _updateAccessibilitySettings();
}

void _AXSZoomTouchSetEnabled(uint64_t a1)
{
  int v1;
  int BooleanPreference;
  BOOL v3;
  uint64_t v4;
  char v5;

  v1 = a1;
  _kAXSCacheZoomTouchEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSZoomTouchEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.zoom"));
  _updateAccessibilitySettings();
  v5 = 0;
  BooleanPreference = _getBooleanPreference((const __CFString *)kAXSZoomTouchEnabledByiTunesPreference, &v5);
  if (v5)
    v3 = BooleanPreference == v1;
  else
    v3 = 1;
  if (!v3)
  {
    _setPreferenceAppWithNotification((const __CFString *)kAXSZoomTouchEnabledByiTunesPreference, 0, 0, 0);
    _updateAccessibilitySettings();
  }
  if (_AXSZoomSpeakUnderFingerEnabled_onceToken != -1)
    dispatch_once(&_AXSZoomSpeakUnderFingerEnabled_onceToken, &__block_literal_global_1544);
  if (_kAXSCacheZoomSpeakUnderFingerEnabled)
  {
    if (v1)
    {
      v4 = 1;
    }
    else
    {
      if (!_AXSCanDisableApplicationAccessibility())
        return;
      v4 = 0;
    }
    _AXSApplicationAccessibilitySetEnabled(v4);
  }
}

uint64_t _AXSZoomTouchReadyForObservers()
{
  if (_AXSZoomTouchReadyForObservers_onceToken != -1)
    dispatch_once(&_AXSZoomTouchReadyForObservers_onceToken, &__block_literal_global_1547);
  return _kAXSCacheZoomTouchReadyForObservers;
}

void _AXSZoomTouchSetReadyForObservers(uint64_t a1)
{
  _kAXSCacheZoomTouchReadyForObservers = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSZoomTouchReadyForObserversPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.zoom.readyForObservers"));
  _updateAccessibilitySettings();
}

BOOL _AXSEnhanceTextLegibilityEnabledGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSEnhanceTextLegibilityPreference, 0) == 1;
}

void _AXSSetEnhanceTextLegibilityEnabled(int a1)
{
  _AXSSetEnhanceTextLegibilityEnabledApp(a1 != 0, 0);
}

void _AXSSetEnhanceTextLegibilityEnabledApp(int a1, __CFString *a2)
{
  int v4;

  v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSEnhanceTextLegibilityPreference, a1, (void (*)(void))_AXSEnhanceTextLegibilityEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSEnhanceTextLegibilityPreference, a2, (int *)&_kAXSCacheEnhanceTextLegibility, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSEnhanceTextLegibilityPreference, kCFNumberIntType, &v4, CFSTR("com.apple.accessibility.cache.enhance.text.legibility"), a2);
}

uint64_t _AXSCarPlayEnhanceTextLegibilityEnabled()
{
  if (_AXSCarPlayEnhanceTextLegibilityEnabled_onceToken != -1)
    dispatch_once(&_AXSCarPlayEnhanceTextLegibilityEnabled_onceToken, &__block_literal_global_1548);
  return _kAXSCacheCarPlayEnhanceTextLegibility;
}

void _AXSSetCarPlayEnhanceTextLegibilityEnabled(uint64_t a1)
{
  _kAXSCacheCarPlayEnhanceTextLegibility = a1;
  _setPreferenceAppWithNotification(CFSTR("CarPlayEnhancedTextLegibilityEnabled"), 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.carplay.enhance.text.legibility"));
  _updateAccessibilitySettings();
}

uint64_t _AXSEnhanceTextTrackingEnabled()
{
  return _getBooleanPreference((const __CFString *)kAXSEnhanceTextTrackingPreference, 0);
}

void _AXSSetEnhanceTextTrackingEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSEnhanceTextTrackingPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), 0);
  _updateAccessibilitySettings();
}

BOOL _AXSEnhanceBackgroundContrastEnabledGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSEnhanceBackgroundContrastPreference, 0) == 1;
}

uint64_t _AXSEnhanceBackgroundContrastEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSEnhanceBackgroundContrastPreference, a1);
}

void _AXSSetEnhanceBackgroundContrastEnabled(int a1)
{
  _AXSSetEnhanceBackgroundContrastEnabledApp(a1 != 0, 0);
}

void _AXSSetEnhanceBackgroundContrastEnabledApp(int a1, __CFString *a2)
{
  int v4;

  v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSEnhanceBackgroundContrastPreference, a1, (void (*)(void))_AXSEnhanceBackgroundContrastEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSEnhanceBackgroundContrastPreference, a2, (int *)&_kAXSCacheEnhanceBackgroundContrast, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSEnhanceBackgroundContrastPreference, kCFNumberIntType, &v4, CFSTR("com.apple.accessibility.cache.enhance.background.contrast"), a2);
}

BOOL _AXSDifferentiateWithoutColorEnabledGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSDifferentiateWithoutColorPreference, 0) == 1;
}

uint64_t _AXSDifferentiateWithoutColorEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSDifferentiateWithoutColorPreference, a1);
}

void _AXSSetDifferentiateWithoutColorEnabled(int a1)
{
  _AXSSetDifferentiateWithoutColorEnabledApp(a1 != 0, 0);
}

void _AXSSetDifferentiateWithoutColorEnabledApp(int a1, __CFString *a2)
{
  int v4;

  v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSDifferentiateWithoutColorPreference, a1, (void (*)(void))_AXSDifferentiateWithoutColorEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSDifferentiateWithoutColorPreference, a2, (int *)&_kAXSCacheDifferentiateWithoutColor, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSDifferentiateWithoutColorPreference, kCFNumberIntType, &v4, CFSTR("com.apple.accessibility.cache.differentiate.without.color"), a2);
}

BOOL _AXSReduceMotionEnabledGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSReduceMotionPreference, 0) == 1;
}

void _AXSSetReduceMotionEnabled(int a1)
{
  BOOL v1;
  _BOOL4 v2;
  uint64_t v3;

  v1 = a1 == 0;
  v2 = a1 != 0;
  v3 = v1;
  _AXSSetReduceMotionEnabledApp(v2, 0);
  _AXSPointerAllowAppCustomizationSetEnabled(v3);
  _AXSPointerEffectScalingSetEnabled(v3);
}

void _AXSSetReduceMotionEnabledApp(int a1, __CFString *a2)
{
  int v4;

  v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSReduceMotionPreference, a1, (void (*)(void))_AXSReduceMotionEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSReduceMotionPreference, a2, (int *)&_kAXSCacheReduceMotion, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSReduceMotionPreference, kCFNumberIntType, &v4, CFSTR("com.apple.accessibility.cache.reduce.motion"), a2);
}

void _AXSPointerAllowAppCustomizationSetEnabled(uint64_t a1)
{
  _kAXSCachePointerAllowAppCustomizationEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPointerAllowAppCustomizationEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.pointer.allow.app.customization"));
  _updateAccessibilitySettings();
}

void _AXSPointerEffectScalingSetEnabled(uint64_t a1)
{
  _kAXSCachePointerEffectScalingEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPointerEffectScalingEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.pointer.effect.scaling"));
  _updateAccessibilitySettings();
}

void _AXSSetReduceMotionAutoplayAnimatedImagesEnabled(uint64_t a1)
{
  _kAXSCacheReduceMotionAutoplayAnimatedImagesEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSReduceMotionAutoplayAnimatedImagesPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.reduce.motion.autoplay.animated.images"));
  _updateAccessibilitySettings();
}

BOOL _AXSReduceMotionReduceSlideTransitionsEnabledGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSReduceMotionReduceSlideTransitionsPreference, 0) == 1;
}

uint64_t _AXSReduceMotionReduceSlideTransitionsEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSReduceMotionReduceSlideTransitionsPreference, a1);
}

void _AXSSetReduceMotionReduceSlideTransitionsEnabled(int a1)
{
  _AXSSetReduceMotionReduceSlideTransitionsEnabledApp(a1 != 0, 0);
}

void _AXSSetReduceMotionReduceSlideTransitionsEnabledApp(int a1, __CFString *a2)
{
  int v4;

  v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSReduceMotionReduceSlideTransitionsPreference, a1, (void (*)(void))_AXSReduceMotionReduceSlideTransitionsEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSReduceMotionReduceSlideTransitionsPreference, a2, (int *)&_kAXSCacheReduceMotionReduceSlideTransitions, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSReduceMotionReduceSlideTransitionsPreference, kCFNumberIntType, &v4, CFSTR("com.apple.accessibility.cache.reduce.motion.reduce.slide.transitions"), a2);
}

uint64_t _AXSReduceMotionAutoplayMessagesEffectsEnabled()
{
  if (_AXSReduceMotionAutoplayMessagesEffectsEnabled_onceToken != -1)
    dispatch_once(&_AXSReduceMotionAutoplayMessagesEffectsEnabled_onceToken, &__block_literal_global_1550);
  return _kAXSCacheReduceMotionAutoplayMessagesEffectsEnabled;
}

void _AXSSetReduceMotionAutoplayMessagesEffectsEnabled(uint64_t a1)
{
  _kAXSCacheReduceMotionAutoplayMessagesEffectsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSReduceMotionAutoplayMessagesEffectsPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.reduce.motion.autoplay.messages.effects"));
  _updateAccessibilitySettings();
}

BOOL _AXSReduceMotionAutoplayVideoPreviewsEnabledValueFromValueRespectingVoiceOverDefault(int a1)
{
  if (_AXSVoiceOverTouchEnabled())
    return a1 == 1;
  else
    return a1 != 0;
}

BOOL _AXSReduceMotionAutoplayVideoPreviewsEnabledGlobal()
{
  int v0;

  v0 = AXSGetPreferenceValue((const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsPreference, 0);
  if (_AXSVoiceOverTouchEnabled())
    return v0 == 1;
  else
    return v0 != 0;
}

uint64_t _AXSReduceMotionAutoplayVideoPreviewsEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsPreference, a1);
}

void _AXSSetReduceMotionAutoplayVideoPreviewsEnabled(int a1)
{
  _AXSSetReduceMotionAutoplayVideoPreviewsEnabledApp(a1 != 0, 0);
}

void _AXSSetReduceMotionAutoplayVideoPreviewsEnabledApp(int a1, __CFString *a2)
{
  int v4;

  v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSReduceMotionAutoplayVideoPreviewsPreference, a1, (void (*)(void))_AXSReduceMotionAutoplayVideoPreviewsEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsPreference, a2, (int *)&_kAXSCacheReduceMotionAutoplayVideoPreviews, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsPreference, kCFNumberIntType, &v4, CFSTR("com.apple.accessibility.cache.reduce.motion.autoplay.video.previews"), a2);
}

uint64_t _AXSUpdateWebAccessibilitySettings()
{
  NSObject *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  const __CFNumber *v4;
  const __CFNumber *v5;
  CFTypeID v6;
  uint64_t result;
  char v8;
  int v9;
  _BYTE buf[12];
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  AXLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F1A7000, v0, OS_LOG_TYPE_DEFAULT, "Updating web accessibility settings", buf, 2u);
  }

  _updateBoolCachePreferenceAndRepostNotification((const __CFString *)kAXSAccessibilityEnabledPreference, CFSTR("com.apple.accessibility.cache.ax"), (unsigned __int8 *)&_kAXSCacheAccessibilityEnabled);
  _updateBoolCachePreferenceAndRepostNotification((const __CFString *)kAXSApplicationAccessibilityEnabledPreference, CFSTR("com.apple.accessibility.cache.app.ax"), (unsigned __int8 *)&_kAXSCacheApplicationAccessibilityEnabled);
  _updateCachePreferenceAndRepostNotification((const __CFString *)kAXSIncreaseButtonLegibilityPreference, kAXSIncreaseButtonLegibilityNotification[0], 0, (int *)&_kAXSCacheIncreaseButtonLegibility);
  _updateCachePreferenceAndRepostNotification((const __CFString *)kAXSReduceMotionPreference, kAXSReduceMotionChangedNotification[0], 0, (int *)&_kAXSCacheReduceMotion);
  _updateCachePreferenceAndRepostNotification((const __CFString *)kAXSEnhanceTextLegibilityPreference, kAXSEnhanceTextLegibilityChangedNotification[0], 0, (int *)&_kAXSCacheEnhanceTextLegibility);
  _updateCachePreferenceAndRepostNotification((const __CFString *)kAXSDarkenSystemColorsEnabledPreference, kAXSDarkenSystemColorsEnabledNotification[0], 0, (int *)&_kAXSCacheDarkenSystemColors);
  v9 = -1;
  _updateCachePreferenceAndRepostNotification(CFSTR("AXSAirPodsSpatialAudioLockToDevice"), (const __CFString *)kAXSAirPodSpatialAudioLockToDeviceChangedNotification, 0, &v9);
  _kAXSCacheAirPodsSpatialAudioLockToDeviceEnabled = v9 == 1;
  AXLogCommon();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _kAXSCacheAccessibilityEnabled);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _kAXSCacheApplicationAccessibilityEnabled);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v2;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_18F1A7000, v1, OS_LOG_TYPE_DEFAULT, "New accessibility: %@, app ax: %@", buf, 0x16u);

  }
  v8 = 0;
  v4 = (const __CFNumber *)_copyValuePreferenceApp(CFSTR("AXSSpatialAudioHeadTracking"), 0, &v8);
  v5 = v4;
  if (v8 && v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 == CFNumberGetTypeID())
    {
      *(_QWORD *)buf = 0;
      CFNumberGetValue(v5, kCFNumberCFIndexType, buf);
      _kAXSCacheSpatialAudioHeadTracking = *(_QWORD *)buf;
    }
    goto LABEL_10;
  }
  if (v4)
LABEL_10:
    CFRelease(v5);
  _updateCacheSmartInvertAndRepostNotification(0);
  result = _getBooleanPreference((const __CFString *)kAXSGrayscaleEnabledPreference, 0);
  _kAXSCacheGrayscaleEnabled = result;
  return result;
}

void _updateBoolCachePreferenceAndRepostNotification(const __CFString *a1, const __CFString *a2, unsigned __int8 *a3)
{
  NSObject *v6;

  *a3 = _fetchCachePreference(a1, 0, 0, 0) == 1;
  AXSupportLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    _updateBoolCachePreferenceAndRepostNotification_cold_1((uint64_t)a1, a3, v6);

  postNotification(a2);
}

void _updateCachePreferenceAndRepostNotification(const __CFString *a1, const __CFString *a2, const __CFString *a3, int *a4)
{
  NSObject *v8;
  int v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *a4 = _fetchCachePreference(a1, a3, 0, 0);
  AXSupportLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = *a4;
    v10 = 138412802;
    v11 = a3;
    v12 = 2112;
    v13 = a1;
    v14 = 1024;
    v15 = v9;
    _os_log_debug_impl(&dword_18F1A7000, v8, OS_LOG_TYPE_DEBUG, "Update Cache Value On Notification: appID = %@, preference = %@, result = %d (-1 - empty, 0 - false, 1 - true)", (uint8_t *)&v10, 0x1Cu);
  }

  postNotification(a2);
}

void _updateCacheSmartInvertAndRepostNotification(const __CFString *a1)
{
  int v1;
  const __CFNumber *NumberPreference;
  NSObject *v3;
  const __CFNumber *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  int valuePtr;

  v1 = -1;
  valuePtr = -1;
  NumberPreference = (const __CFNumber *)_getNumberPreference((const __CFString *)kAXSInvertColorsEnabledPreference, a1);
  if (NumberPreference)
  {
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    AXSupportLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      _updateCacheSmartInvertAndRepostNotification_cold_4();

    v1 = valuePtr;
  }
  _kAXSCacheInvertColors = v1;
  v4 = (const __CFNumber *)_getNumberPreference((const __CFString *)kAXSInvertColorsEnabledPreference, 0);
  if (v4)
  {
    CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
    _kAXSCacheInvertColorsGlobal = valuePtr;
    AXSupportLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      _updateCacheSmartInvertAndRepostNotification_cold_3();

  }
  if (_kAXSCacheInvertColors == -1)
    _kAXSCacheInvertColors = _kAXSCacheInvertColorsGlobal;
  AXSupportLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    _updateCacheSmartInvertAndRepostNotification_cold_2();

  if (_kAXSCacheInvertColors == 1 && _kAXSCacheInvertColorsGlobal != 1)
  {
    AXSupportLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      _updateCacheSmartInvertAndRepostNotification_cold_1();

    if (_AXSCurrentProcessIsWebContent_onceToken != -1)
      dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
    if (!_AXSCurrentProcessIsWebContent_IsWebContent)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSAccessibilityEnabledNotification, 0, 0, 1u);
    }
  }
  postNotification(kAXSInvertColorsEnabledNotification[0]);
}

BOOL _AXSIncreaseButtonLegibilityGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSIncreaseButtonLegibilityPreference, 0) == 1;
}

void _AXSSetIncreaseButtonLegibility(int a1)
{
  _AXSSetIncreaseButtonLegibilityApp(a1 != 0, 0);
}

void _AXSSetIncreaseButtonLegibilityApp(int a1, __CFString *a2)
{
  int v3;

  v3 = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSIncreaseButtonLegibilityPreference, kCFNumberIntType, &v3, CFSTR("com.apple.accessibility.cache.increase.button.legibility"), a2);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSIncreaseButtonLegibilityPreference, a2, (int *)&_kAXSCacheIncreaseButtonLegibility, v3);
}

BOOL _AXSButtonShapesEnabledGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSButtonShapesEnabledPreference, 0) == 1;
}

uint64_t _AXSButtonShapesEnabledApp(const __CFString *a1)
{
  return AXSGetPreferenceValue((const __CFString *)kAXSButtonShapesEnabledPreference, a1);
}

void _AXSSetButtonShapesEnabled(int a1)
{
  _AXSSetButtonShapesEnabledApp(a1 != 0, 0);
}

void _AXSSetButtonShapesEnabledApp(int a1, __CFString *a2)
{
  int v4;

  v4 = a1;
  _subscribeOnCacheNotificationsIfNeeded(kAXSButtonShapesEnabledPreference, a1, (void (*)(void))_AXSButtonShapesEnabled);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSButtonShapesEnabledPreference, a2, (int *)&_kAXSCacheButtonShapes, a1);
  _setNumberPreferenceApp((const __CFString *)kAXSButtonShapesEnabledPreference, kCFNumberIntType, &v4, CFSTR("com.apple.accessibility.cache.button.shapes.enabled"), a2);
}

uint64_t _AXSSetReduceWhitePointEnabled(int a1)
{
  uint64_t result;

  if (a1)
  {
    MADisplayFilterPrefSetType();
    return MADisplayFilterPrefSetCategoryEnabled();
  }
  result = MADisplayFilterPrefGetType();
  if (result == 128)
  {
    result = MADisplayFilterPrefGetCategoryEnabled();
    if ((_DWORD)result)
      return MADisplayFilterPrefSetCategoryEnabled();
  }
  return result;
}

void _AXSSetUseDarkerKeyboard(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSUseDarkerKeyboardPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.use.darker.keyboard.enabled"));
  _updateAccessibilitySettings();
}

void _AXSSetHighContrastFocusIndicatorsEnabled(uint64_t a1)
{
  _kAXSCacheHighContrastFocusIndicatorsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHighContrastFocusIndicatorsEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.use.prominent.focus.indicators"));
  _updateAccessibilitySettings();
}

void _AXSSetUseSingleSystemColor(uint64_t a1)
{
  _kAXSCacheUseSingleSystemColor = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSUseSingleSystemColorPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.use.single.system.color.enabled"));
  _updateAccessibilitySettings();
}

uint64_t _AXSSingleSystemColorValues(int a1, int *a2, int *a3, int *a4, _DWORD *a5)
{
  uint64_t result;
  int v7;
  int v8;
  int v9;

  result = 0;
  v7 = 1065221630;
  v8 = 1051898547;
  v9 = 1042325665;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      goto LABEL_8;
    case 2:
      v8 = 1006665857;
      v9 = 1062721496;
      v7 = 1006665857;
      goto LABEL_8;
    case 3:
      v7 = 1006665857;
      v8 = 1051503789;
      v9 = 1064300528;
      goto LABEL_8;
    case 4:
      v9 = 0;
      v7 = 1037621465;
      v8 = 1056635643;
      goto LABEL_8;
    case 5:
      v8 = 0;
      v7 = 1049529999;
      v9 = 1063511012;
      goto LABEL_8;
    case 6:
      v8 = 0;
      v7 = 1062260945;
      v9 = 1060616120;
      goto LABEL_8;
    case 7:
      v7 = 1046010073;
      v8 = 1054135509;
      v9 = 1058247572;
LABEL_8:
      *a2 = v9;
      *a3 = v8;
      *a4 = v7;
      *a5 = 1065353216;
      break;
    default:
      return 1;
  }
  return 1;
}

uint64_t _AXSNamedSingleSystemColor()
{
  void *v0;
  uint64_t v1;

  v0 = _copyValuePreferenceApp((const __CFString *)kAXSNamedSystemColorChoicePreference, 0, 0);
  if (v0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v1 = objc_msgSend(v0, "intValue");
  else
    v1 = 0;

  return v1;
}

void _AXSSetNamedSingleSystemColor(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  _setPreferenceAppWithNotification((const __CFString *)kAXSNamedSystemColorChoicePreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1), (const __CFString *)objc_msgSend((id)kAXSNamedSystemColorChoicePreference, "stringByAppendingString:", CFSTR(".notification")));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.accessibility.cache.use.single.system.color.enabled"), 0, 0, 1u);
}

BOOL _AXDarkenSystemColorsGlobal()
{
  return AXSGetPreferenceValue((const __CFString *)kAXSDarkenSystemColorsEnabledPreference, 0) == 1;
}

void _AXSSetDarkenSystemColors(uint64_t a1)
{
  _AXSSetDarkenSystemColorsApp(a1 != 0, 0);
  _AXSPointerIncreasedContrastSetEnabled(a1);
}

void _AXSSetDarkenSystemColorsApp(int a1, __CFString *a2)
{
  int v3;

  v3 = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSDarkenSystemColorsEnabledPreference, kCFNumberIntType, &v3, CFSTR("com.apple.accessibility.cache.darken.system.colors.enabled"), a2);
  _updateCachePreferenceAfterChange((const __CFString *)kAXSDarkenSystemColorsEnabledPreference, a2, (int *)&_kAXSCacheDarkenSystemColors, v3);
}

void _AXSPointerIncreasedContrastSetEnabled(uint64_t a1)
{
  _kAXSCachePointerIncreasedContrastEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPointerIncreasedContrastEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.pointer.increased.contrast"));
  _updateAccessibilitySettings();
}

uint64_t _AXSShakeToUndoDisabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSShakeToUndoDisabledPreference, 0, (uint64_t)_handleShakeToUndoDisabledPreferenceDidChangeNotification);
}

void _handleShakeToUndoDisabledPreferenceDidChangeNotification()
{
  _handlePreferenceChangeWithLocalNotification((const __CFString *)kAXSShakeToUndoDisabledPreferenceDidChangeNotification);
}

void _AXSSetShakeToUndoDisabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSShakeToUndoDisabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)objc_msgSend((id)kAXSShakeToUndoDisabledPreference, "stringByAppendingString:", CFSTR(".notification")));
}

uint64_t _AXSVibrationDisabled()
{
  if (_AXSVibrationDisabled_onceToken != -1)
    dispatch_once(&_AXSVibrationDisabled_onceToken, &__block_literal_global_1553);
  return _kAXSCacheVibrationDisabled;
}

void _AXSSetVibrationDisabled(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  _kAXSCacheVibrationDisabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVibrationDisabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.VibrationDisabled"));
  _updateAccessibilitySettings();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("VibrationDisabledPreferenceDidChange"), 0, 0, 1u);
}

uint64_t _AXSForceTouchEnabled()
{
  if (_AXSForceTouchEnabled_onceToken != -1)
    dispatch_once(&_AXSForceTouchEnabled_onceToken, &__block_literal_global_1556);
  return _kAXSCachedForceTouchEnabled;
}

void _AXSSetForceTouchEnabled(uint64_t a1)
{
  _kAXSCachedForceTouchEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSForceTouchEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.forcetouch.enabled.changed"));
  _updateAccessibilitySettings();
}

uint64_t _AXSForceTouchTimeDuration()
{
  if (_AXSForceTouchTimeDuration_onceToken != -1)
    dispatch_once(&_AXSForceTouchTimeDuration_onceToken, &__block_literal_global_1557);
  return *(float *)&_kAXSCachedForceTouchTiming;
}

void _AXSSetForceTouchTimeDuration(unsigned int a1)
{
  unsigned int v1;

  v1 = a1;
  *(float *)&_kAXSCachedForceTouchTiming = (float)a1;
  _setNumberPreferenceApp((const __CFString *)kAXSForceTouchTimingPreference, kCFNumberIntType, &v1, CFSTR("com.apple.accessibility.cache.forcetouch.timing.changed"), 0);
}

float _AXSForceTouchSensitivity()
{
  if (_AXSForceTouchSensitivity_onceToken != -1)
    dispatch_once(&_AXSForceTouchSensitivity_onceToken, &__block_literal_global_1558);
  return *(float *)&_kAXSCachedForceTouchSensitivity;
}

void _AXSSetForceTouchSensitivity(float a1)
{
  float v1;

  v1 = fminf(fmaxf(a1, 0.8), 1.2);
  _kAXSCachedForceTouchSensitivity = LODWORD(v1);
  _setNumberPreferenceApp((const __CFString *)kAXSForceTouchSensitivityPreference, kCFNumberFloatType, &v1, CFSTR("com.apple.accessibility.cache.forcetouch.sensitivity.changed"), 0);
}

void _AXSSetLowercaseKeyboardDisplayEnabled(uint64_t a1)
{
  _kAXSCacheLowercaseKeyboardEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSLowerCaseKeyboardEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.lower.case.keyboard.enabled"));
  _updateAccessibilitySettings();
}

uint64_t _AXSSlowKeysEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSSlowKeysEnabledPreference, 0, (uint64_t)_handleSlowKeysEnabledPreferenceDidChangeNotification);
}

void _handleSlowKeysEnabledPreferenceDidChangeNotification()
{
  _handlePreferenceChangeWithLocalNotification((const __CFString *)kAXSSlowKeysEnabledPreferenceDidChangeNotification);
}

void _AXSSetSlowKeysEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSSlowKeysEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)objc_msgSend((id)kAXSSlowKeysEnabledPreference, "stringByAppendingString:", CFSTR(".notification")));
}

double _AXSSlowKeysAcceptanceDelay()
{
  return _getPrefTimeIntervalValueWithCustomCallback((__CFString *)kAXSSlowKeysAcceptanceDelayPreference, (uint64_t)_handleSlowKeysAcceptanceDelayPreferenceDidChangeNotification, 0.3);
}

double _getPrefTimeIntervalValueWithCustomCallback(__CFString *a1, uint64_t a2, double a3)
{
  void *v4;
  double v5;

  v4 = _copyPrefValueWithCustomCallback(a1, a2);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "doubleValue");
      a3 = v5;
    }
  }

  return a3;
}

void _handleSlowKeysAcceptanceDelayPreferenceDidChangeNotification()
{
  _handlePreferenceChangeWithLocalNotification((const __CFString *)kAXSSlowKeysAcceptanceDelayPreferenceDidChangeNotification);
}

void _AXSSetSlowKeysAcceptanceDelay()
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSSlowKeysAcceptanceDelayPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), (const __CFString *)objc_msgSend((id)kAXSSlowKeysAcceptanceDelayPreference, "stringByAppendingString:", CFSTR(".notification")));
}

uint64_t _AXSKeyRepeatEnabled()
{
  return _getPrefBooleanValueWithCustomCallback((__CFString *)kAXSKeyRepeatEnabledPreference, 1, 0);
}

void _AXSSetKeyRepeatEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSKeyRepeatEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)objc_msgSend((id)kAXSKeyRepeatEnabledPreference, "stringByAppendingString:", CFSTR(".notification")));
}

double _AXSKeyRepeatInterval()
{
  double PrefTimeIntervalValueWithCustomCallback;
  double v1;

  PrefTimeIntervalValueWithCustomCallback = _getPrefTimeIntervalValueWithCustomCallback((__CFString *)kAXSKeyRepeatIntervalPreference, 0, 0.1);
  if (_getPrefBooleanValueWithCustomCallback((__CFString *)kAXSSlowKeysEnabledPreference, 0, (uint64_t)_handleSlowKeysEnabledPreferenceDidChangeNotification))
  {
    v1 = _getPrefTimeIntervalValueWithCustomCallback((__CFString *)kAXSSlowKeysAcceptanceDelayPreference, (uint64_t)_handleSlowKeysAcceptanceDelayPreferenceDidChangeNotification, 0.3);
    if (PrefTimeIntervalValueWithCustomCallback < v1)
      return v1;
  }
  return PrefTimeIntervalValueWithCustomCallback;
}

void _AXSSetKeyRepeatInterval()
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSKeyRepeatIntervalPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), (const __CFString *)objc_msgSend((id)kAXSKeyRepeatIntervalPreference, "stringByAppendingString:", CFSTR(".notification")));
}

double _AXSKeyRepeatDelay()
{
  double PrefTimeIntervalValueWithCustomCallback;
  double v1;

  PrefTimeIntervalValueWithCustomCallback = _getPrefTimeIntervalValueWithCustomCallback((__CFString *)kAXSKeyRepeatDelayPreference, 0, 0.4);
  if (_getPrefBooleanValueWithCustomCallback((__CFString *)kAXSSlowKeysEnabledPreference, 0, (uint64_t)_handleSlowKeysEnabledPreferenceDidChangeNotification))
  {
    v1 = _getPrefTimeIntervalValueWithCustomCallback((__CFString *)kAXSSlowKeysAcceptanceDelayPreference, (uint64_t)_handleSlowKeysAcceptanceDelayPreferenceDidChangeNotification, 0.3);
    if (PrefTimeIntervalValueWithCustomCallback < v1)
      return v1;
  }
  return PrefTimeIntervalValueWithCustomCallback;
}

void _AXSSetKeyRepeatDelay()
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSKeyRepeatDelayPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), (const __CFString *)objc_msgSend((id)kAXSKeyRepeatDelayPreference, "stringByAppendingString:", CFSTR(".notification")));
}

void _handlePhoneticFeedbackPrefsChangedNotification()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (_AXSAccessibilityPreferenceDomain_onceToken != -1)
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1076);
  CFPreferencesAppSynchronize((CFStringRef)_AXSAccessibilityPreferenceDomain_Domain);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSPhoneticFeedbackEnabledNotification, 0, 0, 1u);
}

void _AXSSetPhoneticFeedbackEnabled(uint64_t a1)
{
  int v1;

  v1 = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPhoneticFeedbackEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)objc_msgSend((id)kAXSPhoneticFeedbackEnabledPreference, "stringByAppendingString:", CFSTR(".notification")));
  _updateAccessibilitySettings();
  if (v1)
  {
    _AXSApplicationAccessibilitySetEnabled(1);
  }
  else if (_AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(0);
  }
}

void _handleLetterFeedbackPrefsChangedNotification()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (_AXSAccessibilityPreferenceDomain_onceToken != -1)
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1076);
  CFPreferencesAppSynchronize((CFStringRef)_AXSAccessibilityPreferenceDomain_Domain);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSLetterFeedbackEnabledNotification, 0, 0, 1u);
}

void _AXSSetLetterFeedbackEnabled(uint64_t a1)
{
  int v1;

  v1 = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSLetterFeedbackEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)objc_msgSend((id)kAXSLetterFeedbackEnabledPreference, "stringByAppendingString:", CFSTR(".notification")));
  _updateAccessibilitySettings();
  if (v1)
  {
    _AXSApplicationAccessibilitySetEnabled(1);
  }
  else if (_AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(0);
  }
}

void _handleQuickTypePredictionFeedbackPrefsChangedNotification()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (_AXSAccessibilityPreferenceDomain_onceToken != -1)
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1076);
  CFPreferencesAppSynchronize((CFStringRef)_AXSAccessibilityPreferenceDomain_Domain);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSQuickTypePredictionFeedbackEnabledNotification, 0, 0, 1u);
}

void _AXSSetQuickTypePredictionFeedbackEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSQuickTypePredictionFeedbackEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)objc_msgSend((id)kAXSQuickTypePredictionFeedbackEnabledPreference, "stringByAppendingString:", CFSTR(".notification")));
  _updateAccessibilitySettings();
}

void _handleWordFeedbackPrefsChangedNotification()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (_AXSAccessibilityPreferenceDomain_onceToken != -1)
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1076);
  CFPreferencesAppSynchronize((CFStringRef)_AXSAccessibilityPreferenceDomain_Domain);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kAXSWordFeedbackEnabledNotification, 0, 0, 1u);
}

void _AXSSetWordFeedbackEnabled(uint64_t a1)
{
  int v1;

  v1 = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSWordFeedbackEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)objc_msgSend((id)kAXSWordFeedbackEnabledPreference, "stringByAppendingString:", CFSTR(".notification")));
  _updateAccessibilitySettings();
  if (v1)
  {
    _AXSApplicationAccessibilitySetEnabled(1);
  }
  else if (_AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(0);
  }
}

uint64_t _AXSWebProcessAllowsSecondaryThreadAccess()
{
  if (_AXSWebProcessAllowsSecondaryThreadAccess_onceToken != -1)
    dispatch_once(&_AXSWebProcessAllowsSecondaryThreadAccess_onceToken, &__block_literal_global_1560);
  return _kAXSCacheWebProcessAllowsSecondaryThreadEnabled;
}

void _AXSSetWebProcessAllowsSecondaryThreadAccess(uint64_t a1)
{
  _kAXSCacheWebProcessAllowsSecondaryThreadEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSWebProcessAllowsSecondaryThreadEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.allows.notification"));
  _updateAccessibilitySettings();
}

BOOL _AXHasBooleanEntitlement(const __CFString *a1)
{
  void *v1;
  void *v2;
  _BOOL8 value;

  CFStringGetCStringPtr(a1, 0x8000100u);
  v1 = (void *)xpc_copy_entitlement_for_self();
  v2 = v1;
  if (v1)
    value = xpc_BOOL_get_value(v1);
  else
    value = 0;

  return value;
}

uint64_t _AXSPointerAllowAppCustomizationEnabled()
{
  if (_AXSPointerAllowAppCustomizationEnabled_onceToken != -1)
    dispatch_once(&_AXSPointerAllowAppCustomizationEnabled_onceToken, &__block_literal_global_1564);
  return _kAXSCachePointerAllowAppCustomizationEnabled;
}

void _AXSPointerInertiaSetEnabled(uint64_t a1)
{
  _kAXSCachePointerInertiaEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPointerInertiaEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.pointer.inertia"));
  _updateAccessibilitySettings();
}

uint64_t _AXSPointerInertiaEnabled()
{
  if (_AXSPointerInertiaEnabled_onceToken != -1)
    dispatch_once(&_AXSPointerInertiaEnabled_onceToken, &__block_literal_global_1565);
  return _kAXSCachePointerInertiaEnabled;
}

uint64_t _AXSPointerEffectScalingEnabled()
{
  if (_AXSPointerEffectScalingEnabled_onceToken != -1)
    dispatch_once(&_AXSPointerEffectScalingEnabled_onceToken, &__block_literal_global_1566);
  return _kAXSCachePointerEffectScalingEnabled;
}

void _AXSPointerSetSizeMultiplier(float a1)
{
  float v1;
  float v2;

  v1 = fminf(a1, 5.0);
  if (v1 < 1.0)
    v1 = 1.0;
  v2 = v1;
  _kAXSCachePointerSizeMultiplier = LODWORD(v1);
  _setNumberPreferenceApp((const __CFString *)kAXSPointerSizeMultiplierPreference, kCFNumberFloatType, &v2, CFSTR("com.apple.accessibility.cache.pointer.size.multiplier"), 0);
}

float _AXSPointerSizeMultiplier()
{
  if (_AXSPointerSizeMultiplier_onceToken != -1)
    dispatch_once(&_AXSPointerSizeMultiplier_onceToken, &__block_literal_global_1567);
  return *(float *)&_kAXSCachePointerSizeMultiplier;
}

BOOL _AXSPointerShouldShowCenterPoint()
{
  if (_AXSPointerSizeMultiplier_onceToken != -1)
    dispatch_once(&_AXSPointerSizeMultiplier_onceToken, &__block_literal_global_1567);
  return *(float *)&_kAXSCachePointerSizeMultiplier >= 3.0;
}

uint64_t _AXSPointerIncreasedContrastEnabled()
{
  if (_AXSPointerIncreasedContrastEnabled_onceToken != -1)
    dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_1568);
  return _kAXSCachePointerIncreasedContrastEnabled;
}

void _AXSPointerAutoHideSetEnabled(uint64_t a1)
{
  _kAXSCachePointerAutoHideEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPointerAutoHideEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.pointer.auto.hide"));
  _updateAccessibilitySettings();
}

uint64_t _AXSPointerAutoHideEnabled()
{
  if (_AXSPointerAutoHideEnabled_onceToken != -1)
    dispatch_once(&_AXSPointerAutoHideEnabled_onceToken, &__block_literal_global_1569);
  return _kAXSCachePointerAutoHideEnabled;
}

void _AXSPointerSetAutoHideDuration(float a1)
{
  float v1;

  v1 = a1;
  _kAXSCachePointerAutoHideDuration = LODWORD(a1);
  _setNumberPreferenceApp((const __CFString *)kAXSPointerAutoHideDurationPreference, kCFNumberFloatType, &v1, CFSTR("com.apple.accessibility.cache.pointer.auto.hide.duration"), 0);
}

float _AXSPointerAutoHideDuration()
{
  if (_AXSPointerAutoHideDuration_onceToken != -1)
    dispatch_once(&_AXSPointerAutoHideDuration_onceToken, &__block_literal_global_1570);
  return *(float *)&_kAXSCachePointerAutoHideDuration;
}

void _AXSPointerSetStrokeColorWidth(float a1)
{
  float v1;

  v1 = a1;
  _kAXSCachePointerStrokeColorWidth = LODWORD(a1);
  _setNumberPreferenceApp((const __CFString *)kAXSPointerStrokeColorWidthPreference, kCFNumberFloatType, &v1, CFSTR("com.apple.accessibility.cache.pointer.stroke.color.width"), 0);
}

float _AXSPointerStrokeColorWidth()
{
  if (_AXSPointerStrokeColorWidth_onceToken != -1)
    dispatch_once(&_AXSPointerStrokeColorWidth_onceToken, &__block_literal_global_1571);
  return *(float *)&_kAXSCachePointerStrokeColorWidth;
}

void _AXSPointerSetStrokeColor(int a1)
{
  int v1;

  v1 = a1;
  _kAXSCachePointerStrokeColor = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSPointerStrokeColorPreference, kCFNumberIntType, &v1, CFSTR("com.apple.accessibility.cache.pointer.stroke.color"), 0);
}

uint64_t _AXSPointerStrokeColorValues(int a1, float *a2, float *a3, float *a4, _DWORD *a5)
{
  float v9;
  float v10;
  float v11;
  uint64_t result;
  BOOL v13;
  float v14;
  _BOOL4 v15;
  float *v16;
  _BOOL4 v17;
  float v18;
  float *v19;

  switch(a1)
  {
    case 1:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1)
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_1568);
      v9 = 1.0;
      v10 = 1.0;
      v11 = 1.0;
      goto LABEL_31;
    case 2:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1)
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_1568);
      v13 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      v9 = -0.25;
      if (!_kAXSCachePointerIncreasedContrastEnabled)
        v9 = 0.0;
      v10 = flt_18F1CEDA0[_kAXSCachePointerIncreasedContrastEnabled == 0];
      v11 = 0.75;
      v14 = 1.0;
      goto LABEL_29;
    case 3:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1)
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_1568);
      v15 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      v9 = 0.75;
      if (!_kAXSCachePointerIncreasedContrastEnabled)
        v9 = 1.0;
      v10 = flt_18F1CED90[_kAXSCachePointerIncreasedContrastEnabled == 0];
      v16 = (float *)&unk_18F1CED98;
      goto LABEL_19;
    case 4:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1)
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_1568);
      v15 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      v9 = flt_18F1CED78[_kAXSCachePointerIncreasedContrastEnabled == 0];
      v10 = flt_18F1CED80[_kAXSCachePointerIncreasedContrastEnabled == 0];
      v16 = (float *)&unk_18F1CED88;
LABEL_19:
      v11 = v16[v15];
      goto LABEL_31;
    case 5:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1)
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_1568);
      v13 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      v17 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      v9 = 0.75;
      v18 = 1.0;
      v19 = (float *)&unk_18F1CED70;
      goto LABEL_26;
    case 6:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1)
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_1568);
      v13 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      v17 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      v9 = 0.75;
      v18 = 1.0;
      v19 = (float *)&unk_18F1CED68;
LABEL_26:
      if (v13)
        v9 = v18;
      v10 = v19[v17];
      v11 = -0.25;
      v14 = 0.0;
LABEL_29:
      if (v13)
        v11 = v14;
LABEL_31:
      *a2 = v9;
      *a3 = v10;
      *a4 = v11;
      *a5 = 1065353216;
      result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t _ASTVirtualTrackpadColorValues(int a1, float *a2, float *a3, float *a4, _DWORD *a5)
{
  float v9;
  float v10;
  float v11;
  uint64_t result;
  BOOL v13;
  float v14;
  _BOOL4 v15;
  float *v16;
  _BOOL4 v17;
  float v18;
  float *v19;

  switch(a1)
  {
    case 0:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1)
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_1568);
      v9 = flt_18F1CEDA8[_kAXSCachePointerIncreasedContrastEnabled == 0];
      v10 = v9;
      v11 = v9;
      goto LABEL_34;
    case 1:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1)
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_1568);
      v9 = 1.0;
      v10 = 1.0;
      v11 = 1.0;
      goto LABEL_34;
    case 2:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1)
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_1568);
      v13 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      v9 = -0.25;
      if (!_kAXSCachePointerIncreasedContrastEnabled)
        v9 = 0.0;
      v10 = flt_18F1CEDA0[_kAXSCachePointerIncreasedContrastEnabled == 0];
      v11 = 0.75;
      v14 = 1.0;
      goto LABEL_32;
    case 3:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1)
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_1568);
      v15 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      v9 = 0.75;
      if (!_kAXSCachePointerIncreasedContrastEnabled)
        v9 = 1.0;
      v10 = flt_18F1CED90[_kAXSCachePointerIncreasedContrastEnabled == 0];
      v16 = (float *)&unk_18F1CED98;
      goto LABEL_22;
    case 4:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1)
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_1568);
      v15 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      v9 = flt_18F1CED78[_kAXSCachePointerIncreasedContrastEnabled == 0];
      v10 = flt_18F1CED80[_kAXSCachePointerIncreasedContrastEnabled == 0];
      v16 = (float *)&unk_18F1CED88;
LABEL_22:
      v11 = v16[v15];
      goto LABEL_34;
    case 5:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1)
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_1568);
      v13 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      v17 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      v9 = 0.75;
      v18 = 1.0;
      v19 = (float *)&unk_18F1CED70;
      goto LABEL_29;
    case 6:
      if (_AXSPointerIncreasedContrastEnabled_onceToken != -1)
        dispatch_once(&_AXSPointerIncreasedContrastEnabled_onceToken, &__block_literal_global_1568);
      v13 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      v17 = _kAXSCachePointerIncreasedContrastEnabled == 0;
      v9 = 0.75;
      v18 = 1.0;
      v19 = (float *)&unk_18F1CED68;
LABEL_29:
      if (v13)
        v9 = v18;
      v10 = v19[v17];
      v11 = -0.25;
      v14 = 0.0;
LABEL_32:
      if (v13)
        v11 = v14;
LABEL_34:
      *a2 = v9;
      *a3 = v10;
      *a4 = v11;
      *a5 = 1065353216;
      result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

void _AXSPointerSetVoiceOverCursorOption(int a1)
{
  int v1;

  v1 = a1;
  _kAXSCachePointerVoiceOverCursorOption = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSPointerVoiceOverCursorOptionPreference, kCFNumberIntType, &v1, CFSTR("com.apple.accessibility.cache.pointer.voiceover.option"), 0);
}

uint64_t _AXSPointerVoiceOverCursorOption()
{
  if (_AXSPointerVoiceOverCursorOption_onceToken != -1)
    dispatch_once(&_AXSPointerVoiceOverCursorOption_onceToken, &__block_literal_global_1573);
  return _kAXSCachePointerVoiceOverCursorOption;
}

void _AXSVoiceOverSpeakUnderPointerSetEnabled(uint64_t a1)
{
  _kAXSCacheVoiceOverSpeakUnderPointer = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSVoiceOverSpeakUnderPointerPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.voiceover.speak.under.pointer"));
  _updateAccessibilitySettings();
}

uint64_t _AXSVoiceOverSpeakUnderPointerEnabled()
{
  if (_AXSVoiceOverSpeakUnderPointerEnabled_onceToken != -1)
    dispatch_once(&_AXSVoiceOverSpeakUnderPointerEnabled_onceToken, &__block_literal_global_1574);
  return _kAXSCacheVoiceOverSpeakUnderPointer;
}

void _AXSVoiceOverSpeakUnderPointerSetDelay(float a1)
{
  float v1;

  v1 = a1;
  _kAXSCacheVoiceOverSpeakUnderPointerDelay = LODWORD(a1);
  _setNumberPreferenceApp((const __CFString *)kAXSVoiceOverSpeakUnderPointerDelayPreference, kCFNumberFloatType, &v1, CFSTR("com.apple.accessibility.cache.voiceover.speak.under.pointer"), 0);
}

float _AXSVoiceOverSpeakUnderPointerDelay()
{
  if (_AXSVoiceOverSpeakUnderPointerDelay_onceToken != -1)
    dispatch_once(&_AXSVoiceOverSpeakUnderPointerDelay_onceToken, &__block_literal_global_1575);
  return *(float *)&_kAXSCacheVoiceOverSpeakUnderPointerDelay;
}

void _AXSPointerScaleWithZoomLevelSetEnabled(uint64_t a1)
{
  _kAXSCachePointerScaleWithZoomLevelEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSPointerScaleWithZoomLevelEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.pointer.scale.with.zoom.level"));
  _updateAccessibilitySettings();
}

uint64_t _AXSPointerScaleWithZoomLevelEnabled()
{
  if (_AXSPointerScaleWithZoomLevelEnabled_onceToken != -1)
    dispatch_once(&_AXSPointerScaleWithZoomLevelEnabled_onceToken, &__block_literal_global_1576);
  return _kAXSCachePointerScaleWithZoomLevelEnabled;
}

void _AXSSetHapticMusicEnabled(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  AXLogHapticMusic();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_DEFAULT, "Enabling haptic music: %@: %@", (uint8_t *)&v5, 0x16u);

  }
  _kAXSCacheHapticMusicEnabled = (_DWORD)a1 != 0;
  _setPreferenceAppWithNotification((const __CFString *)kAXSHapticMusicEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)_kAXSCacheHapticMusicDidChangeNotification);
  _updateAccessibilitySettings();
}

uint64_t _AXSHapticMusicEnabled()
{
  if (_AXSHapticMusicEnabled_onceToken != -1)
    dispatch_once(&_AXSHapticMusicEnabled_onceToken, &__block_literal_global_1577);
  return _kAXSCacheHapticMusicEnabled;
}

void _AXSSetAudioDonationSiriImprovementEnabled(uint64_t a1)
{
  _kAXSCacheAudioDonationSiriImprovementEnabled = (_DWORD)a1 != 0;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAudioDonationSiriImprovementEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)_kAXSCacheAudioDonationSiriImprovementDidChangeNotification);
  _updateAccessibilitySettings();
}

uint64_t _AXSAudioDonationSiriImprovementEnabled()
{
  if (_AXSAudioDonationSiriImprovementEnabled_onceToken != -1)
    dispatch_once(&_AXSAudioDonationSiriImprovementEnabled_onceToken, &__block_literal_global_1578);
  return _kAXSCacheAudioDonationSiriImprovementEnabled;
}

void _AXSSetMotionCuesActive(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  AXLogMotionCues();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_DEFAULT, "Set motion cues active: %@", (uint8_t *)&v4, 0xCu);

  }
  _kAXSCacheMotionCuesActive = (_DWORD)a1 != 0;
  _setPreferenceAppWithNotification(CFSTR("AXSMotionCuesActive"), 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)_kAXSCacheMotionCuesActiveDidChangeNotification);
  _updateAccessibilitySettings();
}

uint64_t _AXSMotionCuesActive()
{
  if (_AXSMotionCuesActive_onceToken != -1)
    dispatch_once(&_AXSMotionCuesActive_onceToken, &__block_literal_global_1579);
  return _kAXSCacheMotionCuesActive;
}

void _AXSSetMotionCuesShouldShowBanner(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  AXLogMotionCues();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_DEFAULT, "Set motion cues shouldShowBanner: %@", (uint8_t *)&v4, 0xCu);

  }
  _kAXSCacheMotionCuesShouldShowBanner = (_DWORD)a1 != 0;
  _setPreferenceAppWithNotification(CFSTR("AXSMotionCuesShouldShowBanner"), 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)_kAXSCacheMotionCuesShouldShowBannerDidChangeNotification);
  _updateAccessibilitySettings();
}

uint64_t _AXSMotionCuesShouldShowBanner()
{
  if (_AXSMotionCuesShouldShowBanner_onceToken != -1)
    dispatch_once(&_AXSMotionCuesShouldShowBanner_onceToken, &__block_literal_global_1580);
  return _kAXSCacheMotionCuesShouldShowBanner;
}

void _AXSSetMotionCuesEnabled(uint64_t a1)
{
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  AXLogMotionCues();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_DEFAULT, "Set enabled=%{BOOL}d", (uint8_t *)v3, 8u);
  }

  _kAXSCacheMotionCuesEnabled = (_DWORD)a1 != 0;
  _setPreferenceAppWithNotification((const __CFString *)kAXSMotionCuesEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)_kAXSCacheMotionCuesDidChangeNotification);
  _updateAccessibilitySettings();
}

uint64_t _AXSMotionCuesEnabled()
{
  if (_AXSMotionCuesEnabled_onceToken != -1)
    dispatch_once(&_AXSMotionCuesEnabled_onceToken, &__block_literal_global_1581);
  return _kAXSCacheMotionCuesEnabled;
}

void _AXSSetMotionCuesMode(unsigned int a1)
{
  _AXSSetMotionCuesModeAndShowBanner(a1, 1);
}

void _AXSSetMotionCuesModeAndShowBanner(unsigned int a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  unsigned int v6;
  uint8_t buf[4];
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  if (_AXSMotionCuesMode_onceToken != -1)
    dispatch_once(&_AXSMotionCuesMode_onceToken, &__block_literal_global_1582);
  if (a2 && _kAXSCacheMotionCuesMode != a1)
    _AXSSetMotionCuesShouldShowBanner(1);
  AXLogMotionCues();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v8 = a1;
    _os_log_impl(&dword_18F1A7000, v4, OS_LOG_TYPE_DEFAULT, "Set mode=%d", buf, 8u);
  }

  if (a1 > 1)
  {
    if (a1 == 2)
    {
      if (_AXSMotionCuesEnabled_onceToken != -1)
        dispatch_once(&_AXSMotionCuesEnabled_onceToken, &__block_literal_global_1581);
      if (_kAXSCacheMotionCuesEnabled)
      {
        v5 = 0;
        goto LABEL_18;
      }
    }
  }
  else
  {
    if (_AXSMotionCuesEnabled_onceToken != -1)
      dispatch_once(&_AXSMotionCuesEnabled_onceToken, &__block_literal_global_1581);
    if (!_kAXSCacheMotionCuesEnabled)
    {
      v5 = 1;
LABEL_18:
      _AXSSetMotionCuesEnabled(v5);
    }
  }
  _kAXSCacheMotionCuesMode = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSMotionCuesModePreference, kCFNumberIntType, &v6, (__CFString *)_kAXSCacheMotionCuesModeDidChangeNotification, 0);
}

uint64_t _AXSMotionCuesMode()
{
  if (_AXSMotionCuesMode_onceToken != -1)
    dispatch_once(&_AXSMotionCuesMode_onceToken, &__block_literal_global_1582);
  return _kAXSCacheMotionCuesMode;
}

void _AXSSetIsolatedTreeMode(int a1)
{
  int v1;

  v1 = a1;
  _kAXSCacheIsolatedTreeMode = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSIsolatedTreeModeEnabledPreference, kCFNumberIntType, &v1, CFSTR("com.apple.accessibility.cache.isolated.tree.mode"), 0);
}

uint64_t _AXSIsolatedTreeMode()
{
  if (_AXSIsolatedTreeMode_onceToken != -1)
    dispatch_once(&_AXSIsolatedTreeMode_onceToken, &__block_literal_global_1583);
  return _kAXSCacheIsolatedTreeMode;
}

void _AXSSetShowAudioTranscriptions(uint64_t a1)
{
  _kAXSCacheShowAudioTranscriptionsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSShowAudioTranscriptionsEnabled, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.show.audio.transcriptions"));
  _updateAccessibilitySettings();
}

uint64_t _AXSShowAudioTranscriptions()
{
  if (_AXSShowAudioTranscriptions_onceToken != -1)
    dispatch_once(&_AXSShowAudioTranscriptions_onceToken, &__block_literal_global_1584);
  return _kAXSCacheShowAudioTranscriptionsEnabled;
}

void _AXSBackTapSetEnabled(uint64_t a1)
{
  _kAXSCacheBackTapEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSBackTapEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.back.tap.enabled"));
  _updateAccessibilitySettings();
}

void _AXSBrailleInputDeviceSetConnected(uint64_t a1)
{
  _kAXSCacheBrailleInputDeviceConnected = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSBrailleInputDeviceConnectedPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.braille.input.connection.changed"));
  _updateAccessibilitySettings();
}

uint64_t _AXSBrailleInputDeviceConnected()
{
  uint64_t result;

  result = _AXSVoiceOverTouchEnabled();
  if ((_DWORD)result)
  {
    if (_AXSBrailleInputDeviceConnected_onceToken != -1)
      dispatch_once(&_AXSBrailleInputDeviceConnected_onceToken, &__block_literal_global_1586);
    return _kAXSCacheBrailleInputDeviceConnected;
  }
  return result;
}

uint64_t _AXSLiveHeadphoneLevelEnabled()
{
  if (_AXSLiveHeadphoneLevelEnabled_onceToken != -1)
    dispatch_once(&_AXSLiveHeadphoneLevelEnabled_onceToken, &__block_literal_global_1587);
  return _kAXSCacheLiveHeadphoneLevelEnabled;
}

void _AXSLiveHeadphoneLevelSetEnabled(uint64_t a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSLiveHeadphoneLevelEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), (const __CFString *)kAXSLiveHeadphoneLevelEnabledDidChangeNotification);
  _updateAccessibilitySettings();
}

CFTypeRef _AXSLiveHeadphoneLevelAutomationSampleData()
{
  void *v0;

  v0 = _copyValuePreferenceApp((const __CFString *)kAXSLiveHeadphoneLevelAutomationSampleDataPreference, 0, 0);
  return CFAutorelease(v0);
}

void _AXSLiveHeadphoneLevelSetAutomationSampleData(const void *a1)
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSLiveHeadphoneLevelAutomationSampleDataPreference, 0, a1, (const __CFString *)kAXSLiveHeadphoneLevelAutomationSampleDataDidChangeNotification);
}

uint64_t __AXSSoundDetectionState()
{
  if (__AXSSoundDetectionState_onceToken != -1)
    dispatch_once(&__AXSSoundDetectionState_onceToken, &__block_literal_global_1588);
  return _kAXSCacheSoundDetectionState;
}

uint64_t _AXSSoundDetectionRunning()
{
  int v0;
  unsigned int v1;

  if (__AXSSoundDetectionState_onceToken != -1)
    dispatch_once(&__AXSSoundDetectionState_onceToken, &__block_literal_global_1588);
  v0 = _kAXSCacheSoundDetectionState;
  if (_AXSAssistiveTouchScannerEnabled_onceToken != -1)
    dispatch_once(&_AXSAssistiveTouchScannerEnabled_onceToken, &__block_literal_global_1215);
  v1 = _kAXSCacheSwitchControlEnabled;
  if (_kAXSCacheSwitchControlEnabled)
    v1 = _AXSSoundActionEnabledForSwitchControl() != 0;
  if (v0)
    return 1;
  else
    return v1;
}

uint64_t _AXSWatchTypeToSiriEnabled()
{
  if (_AXSWatchTypeToSiriEnabled_onceToken != -1)
    dispatch_once(&_AXSWatchTypeToSiriEnabled_onceToken, &__block_literal_global_1589);
  return _kAXSCacheWatchTypeToSiriEnabled;
}

void _AXSWatchTypeToSiriSetEnabled(uint64_t a1)
{
  _kAXSCacheWatchTypeToSiriEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSWatchTypeToSiriEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.watch.typetosiri.enabled"));
  _updateAccessibilitySettings();
}

uint64_t _AXSWatchQuickActionsState()
{
  if (_AXSWatchQuickActionsState_onceToken != -1)
    dispatch_once(&_AXSWatchQuickActionsState_onceToken, &__block_literal_global_1590);
  return _kAXSCacheWatchQuickActionsState;
}

void _AXSWatchQuickActionsSetState(int a1)
{
  int v1;

  v1 = a1;
  _kAXSCacheWatchQuickActionsState = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSWatchQuickActionsStatePreference, kCFNumberIntType, &v1, CFSTR("com.apple.accessibility.cache.watch.quickactions.state"), 0);
}

uint64_t _AXSWatchQuickActionsEnabled()
{
  if (_AXSWatchQuickActionsState_onceToken != -1)
    dispatch_once(&_AXSWatchQuickActionsState_onceToken, &__block_literal_global_1590);
  return _AXSWatchQuickActionsResolvedEnabledStateForState(_kAXSCacheWatchQuickActionsState);
}

uint64_t _AXSWatchQuickActionsResolvedEnabledStateForState(int a1)
{
  if (a1 == 2)
    return 0;
  if (a1)
    return 1;
  if (_AXSWatchControlEnabled_onceToken != -1)
    dispatch_once(&_AXSWatchControlEnabled_onceToken, &__block_literal_global_1592);
  return _kAXSCacheWatchControlEnabled;
}

uint64_t _AXSWatchQuickActionBannerAppearance()
{
  if (_AXSWatchQuickActionBannerAppearance_onceToken != -1)
    dispatch_once(&_AXSWatchQuickActionBannerAppearance_onceToken, &__block_literal_global_1591);
  return _kAXSCacheWatchQuickActionBannerAppearance;
}

void _AXSWatchQuickActionSetBannerAppearance(int a1)
{
  int v1;

  v1 = a1;
  _kAXSCacheWatchQuickActionBannerAppearance = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSWatchQuickActionBannerAppearancePreference, kCFNumberIntType, &v1, CFSTR("com.apple.accessibility.cache.watch.quickactions.banner.appearance"), 0);
}

void _AXSWatchControlSetEnabled(uint64_t a1)
{
  int v1;

  v1 = a1;
  _kAXSCacheWatchControlEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSWatchControlEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.watch.control.enabled"));
  _updateAccessibilitySettings();
  if (v1)
  {
    _AXSApplicationAccessibilitySetEnabled(1);
  }
  else if (_AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled(0);
  }
}

void _AXSPhotosensitiveMitigationSetEnabled(uint64_t a1)
{
  _kAXSCachePhotosensitiveMitigationEnabled = a1;
  _setPreferenceAppWithNotification(CFSTR("PhotosensitiveMitigation"), 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.pse.mitigation"));
  _updateAccessibilitySettings();
}

uint64_t _AXSPhotosensitiveSourceCopyDebuggingEnabled()
{
  if (_AXSPhotosensitiveSourceCopyDebuggingEnabled_onceToken != -1)
    dispatch_once(&_AXSPhotosensitiveSourceCopyDebuggingEnabled_onceToken, &__block_literal_global_1594);
  return _kAXSCachePhotosensitiveSourceCopyDebuggingEnabled;
}

void _AXSPhotosensitiveSourceCopyDebuggingSetEnabled(uint64_t a1)
{
  _kAXSCachePhotosensitiveSourceCopyDebuggingEnabled = a1;
  _setPreferenceAppWithNotification(CFSTR("PhotosensitiveSourceCopyDebugging"), 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.pse.source.copy.debugging"));
  _updateAccessibilitySettings();
}

uint64_t _AXSPhotosensitiveVisualDebuggingEnabled()
{
  if (_AXSPhotosensitiveVisualDebuggingEnabled_onceToken != -1)
    dispatch_once(&_AXSPhotosensitiveVisualDebuggingEnabled_onceToken, &__block_literal_global_1595);
  return _kAXSCachePhotosensitiveVisualDebuggingEnabled;
}

void _AXSPhotosensitiveVisualDebuggingSetEnabled(uint64_t a1)
{
  _kAXSCachePhotosensitiveVisualDebuggingEnabled = a1;
  _setPreferenceAppWithNotification(CFSTR("PhotosensitiveVisualDebugging"), 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.pse.visual.debugging"));
  _updateAccessibilitySettings();
}

uint64_t _AXSTwiceRemoteScreenEnabled()
{
  if (_AXSTwiceRemoteScreenEnabled_onceToken != -1)
    dispatch_once(&_AXSTwiceRemoteScreenEnabled_onceToken, &__block_literal_global_1596);
  return _kAXSCacheTwiceRemoteScreenEnabled;
}

void _AXSTwiceRemoteScreenSetEnabled(uint64_t a1)
{
  _kAXSCacheTwiceRemoteScreenEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSTwiceRemoteScreenEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.twice.remote.screen.enabled"));
  _updateAccessibilitySettings();
}

uint64_t _AXSTwiceRemoteScreenPlatform()
{
  if (_AXSTwiceRemoteScreenPlatform_onceToken != -1)
    dispatch_once(&_AXSTwiceRemoteScreenPlatform_onceToken, &__block_literal_global_1597);
  return _kAXSCacheTwiceRemoteScreenPlatform;
}

void _AXSTwiceRemoteScreenSetPlatform(uint64_t a1)
{
  uint64_t v1;

  v1 = a1;
  _kAXSCacheTwiceRemoteScreenPlatform = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSTwiceRemoteScreenPlatformPreference, kCFNumberCFIndexType, &v1, CFSTR("com.apple.accessibility.cache.twice.remote.screen.platform"), 0);
}

uint64_t _AXSIncreaseBrightnessFloorEnabled()
{
  if (_AXSIncreaseBrightnessFloorEnabled_onceToken != -1)
    dispatch_once(&_AXSIncreaseBrightnessFloorEnabled_onceToken, &__block_literal_global_1598);
  return _kAXSCacheIncreaseBrightnessFloorEnabled;
}

void _AXSIncreaseBrightnessFloorSetEnabled(uint64_t a1)
{
  _kAXSCacheIncreaseBrightnessFloorEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSIncreaseBrightnessFloorEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.increase.brightness.floor.enabled"));
  _updateAccessibilitySettings();
}

void _AXSSetAppleTVRemoteUsesSimpleGestures(uint64_t a1)
{
  _kAXSCacheAppleTVSimpleGesturesEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAppleTVSimpleGesturesEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.apple.tv.simple.gestures"));
  _updateAccessibilitySettings();
}

uint64_t _AXSAppleTVRemoteUsesSimpleGestures()
{
  if (_AXSAppleTVRemoteUsesSimpleGestures_onceToken != -1)
    dispatch_once(&_AXSAppleTVRemoteUsesSimpleGestures_onceToken, &__block_literal_global_1599);
  return _kAXSCacheAppleTVSimpleGesturesEnabled;
}

void _AXSSetAppleTVRemoteForceLiveTVButtons(uint64_t a1)
{
  _kAXSCacheAppleTVForceLiveTVButtonsEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAppleTVForceLiveTVButtonsEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.apple.tv.live.tv.buttons"));
  _updateAccessibilitySettings();
}

uint64_t _AXSAppleTVRemoteForceLiveTVButtons()
{
  if (_AXSAppleTVRemoteForceLiveTVButtons_onceToken != -1)
    dispatch_once(&_AXSAppleTVRemoteForceLiveTVButtons_onceToken, &__block_literal_global_1600);
  return _kAXSCacheAppleTVForceLiveTVButtonsEnabled;
}

void _AXSSetAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled(uint64_t a1)
{
  _kAXSCacheAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.AppleTVRemoteClickpadTapsForDirectionalNavigationEnabled"));
  _updateAccessibilitySettings();
}

uint64_t _AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled()
{
  if (_AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled_onceToken != -1)
    dispatch_once(&_AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled_onceToken, &__block_literal_global_1601);
  return _kAXSCacheAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled;
}

void _AXSSetAppleTVScaledUIEnabled(uint64_t a1)
{
  _kAXSCacheAppleTVScaledUIEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAppleTVScaledUIEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.AppleTVScaledUIEnabled"));
  _updateAccessibilitySettings();
}

uint64_t _AXSAppleTVScaledUIEnabled()
{
  if (_AXSAppleTVScaledUIEnabled_onceToken != -1)
    dispatch_once(&_AXSAppleTVScaledUIEnabled_onceToken, &__block_literal_global_1602);
  return _kAXSCacheAppleTVScaledUIEnabled;
}

uint64_t _AXSGetUSBRMDisablers()
{
  if (_AXSGetUSBRMDisablers_onceToken != -1)
    dispatch_once(&_AXSGetUSBRMDisablers_onceToken, &__block_literal_global_1603);
  return _kAXSCacheUSBRMDisablers;
}

void _AXSSetUSBRMDisablers(int a1)
{
  int v1;

  v1 = a1;
  _kAXSCacheUSBRMDisablers = a1;
  _setNumberPreferenceApp((const __CFString *)kAXSUSBRMDisablersPreference, kCFNumberIntType, &v1, CFSTR("com.apple.accessibility.cache.AXSUSBRMDisablersNotification"), 0);
}

const void *_AXSCopySettingsDataBlobForBuddy()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)objc_msgSend(getAXBuddyDataPackageClass(), "dataBlobForBuddy");
  v1 = v0;
  if (v0)
    CFRetain(v0);
  return v1;
}

id getAXBuddyDataPackageClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAXBuddyDataPackageClass_softClass;
  v7 = getAXBuddyDataPackageClass_softClass;
  if (!getAXBuddyDataPackageClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAXBuddyDataPackageClass_block_invoke;
    v3[3] = &unk_1E2939F70;
    v3[4] = &v4;
    __getAXBuddyDataPackageClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18F1C5110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AXSRestoreSettingsFromDataBlobForBuddy(uint64_t a1)
{
  return objc_msgSend(getAXBuddyDataPackageClass(), "restoreDataBlobForBuddy:", a1);
}

void _AXSResetAccessibilityFeatures()
{
  uint64_t v0;
  void *v1;
  char v2;
  void *v3;

  AXUtilsBackBoardServer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
  {
    v3 = (void *)v0;
    v2 = objc_opt_respondsToSelector();
    v1 = v3;
    if ((v2 & 1) != 0)
    {
      objc_msgSend(v3, "resetAccessibilityFeatures");
      v1 = v3;
    }
  }

}

id AXNSLocalizedStringForLocale(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  const __CFAllocator *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const __CFURL *v14;
  __CFBundle *v15;
  void *v16;

  if (a4)
  {
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v10 = a5;
    v11 = a3;
    v12 = a2;
    v13 = a1;
    objc_msgSend(a4, "bundleURL");
    v14 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v15 = CFBundleCreate(v9, v14);

    AXLocalizedStringForLocale((uint64_t)v13, (uint64_t)v12, (int)v11, v15, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      CFRelease(v15);
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

CFTypeRef AXLocalizedStringForLocale(uint64_t a1, uint64_t a2, int a3, CFBundleRef bundle, void *a5)
{
  void *v8;
  CFURLRef v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CFTypeRef v15;

  if (!bundle)
    return 0;
  v8 = (void *)MEMORY[0x1E0CB34D0];
  v9 = CFBundleCopyBundleURL(bundle);
  objc_msgSend(v8, "bundleWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  AXLocalizationForLocale(a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)CFBundleCopyLocalizedStringForLocalization();
  v13 = v12;
  if (v11)
  {
    if (v12)
    {
      if ((objc_msgSend(v12, "isEqualToString:", a2) & 1) == 0
        && (a2 || !objc_msgSend(v13, "isEqualToString:", a1)))
      {
        goto LABEL_10;
      }
      CFRelease(v13);
    }
    v13 = (void *)CFBundleCopyLocalizedStringForLocalization();
  }
LABEL_10:
  v15 = CFAutorelease(v13);

  return v15;
}

id AXLocalizationForLocale(void *a1, void *a2)
{
  void *v2;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v2 = 0;
  v10[1] = *MEMORY[0x1E0C80C00];
  if (a1 && a2)
  {
    v4 = (void *)MEMORY[0x1E0CB34D0];
    v5 = a1;
    objc_msgSend(a2, "localizations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredLocalizationsFromArray:forPreferences:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

uint64_t _AXSVoltaDataCollectionEnabled()
{
  return 0;
}

uint64_t AXSVoltaDataDirectory()
{
  return 0;
}

uint64_t _AXSAutomaticSubtitlesShowWhenLanguageMismatch()
{
  if (_AXSAutomaticSubtitlesShowWhenLanguageMismatch_onceToken != -1)
    dispatch_once(&_AXSAutomaticSubtitlesShowWhenLanguageMismatch_onceToken, &__block_literal_global_1614);
  return _kAXSCacheAutomaticSubtitlesShowWhenLanguageMismatch;
}

void _AXSSetAutomaticSubtitlesShowWhenLanguageMismatch(uint64_t a1)
{
  _kAXSCacheAutomaticSubtitlesShowWhenLanguageMismatch = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomaticSubtitlesShowWhenLanguageMismatchPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.AutomaticSubtitlesShowWhenLanguageMismatch"));
  _updateAccessibilitySettings();
}

uint64_t _AXSAutomaticSubtitlesShowWhenMuted()
{
  if (_AXSAutomaticSubtitlesShowWhenMuted_onceToken != -1)
    dispatch_once(&_AXSAutomaticSubtitlesShowWhenMuted_onceToken, &__block_literal_global_1615);
  return _kAXSCacheAutomaticSubtitlesShowWhenMuted;
}

void _AXSSetAutomaticSubtitlesShowWhenMuted(uint64_t a1)
{
  _kAXSCacheAutomaticSubtitlesShowWhenMuted = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomaticSubtitlesShowWhenMutedPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.AutomationSubtitlesShowWhenMuted"));
  _updateAccessibilitySettings();
}

uint64_t _AXSAutomaticSubtitlesShowOnSkipBack()
{
  if (_AXSAutomaticSubtitlesShowOnSkipBack_onceToken != -1)
    dispatch_once(&_AXSAutomaticSubtitlesShowOnSkipBack_onceToken, &__block_literal_global_1616);
  return _kAXSCacheAutomaticSubtitlesShowOnSkipBack;
}

void _AXSSetAutomaticSubtitlesShowOnSkipBack(uint64_t a1)
{
  _kAXSCacheAutomaticSubtitlesShowOnSkipBack = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSAutomaticSubtitlesShowOnSkipBackPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.AutomationSubtitlesShowOnSkipBack"));
  _updateAccessibilitySettings();
}

uint64_t _AXSRosebudLoggingEnabled()
{
  if (_AXSRosebudLoggingEnabled_onceToken != -1)
    dispatch_once(&_AXSRosebudLoggingEnabled_onceToken, &__block_literal_global_1617);
  return _kAXSCacheRosebudLoggingEnabled;
}

void _AXSRosebudLoggingSetEnabled(uint64_t a1)
{
  _kAXSCacheRosebudLoggingEnabled = a1;
  _setPreferenceAppWithNotification((const __CFString *)kAXSRosebudLoggingEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.rosebud.logging.enabled"));
  _updateAccessibilitySettings();
}

uint64_t _AXSSpeechSynthesisOptions()
{
  if (!os_variant_has_internal_ui())
    return 0;
  if (_AXSSpeechSynthesisOptions_onceToken != -1)
    dispatch_once(&_AXSSpeechSynthesisOptions_onceToken, &__block_literal_global_1618);
  return _kAXSCacheSpeechSynthesisOptions;
}

void _AXSSpeechSynthesisSetOptions(uint64_t a1)
{
  uint64_t v2;

  v2 = a1;
  if (os_variant_has_internal_ui())
  {
    _kAXSCacheSpeechSynthesisOptions = a1;
    _setNumberPreferenceApp((const __CFString *)kAXSSpeechSynthesisOptionsPreference, kCFNumberCFIndexType, &v2, CFSTR("com.apple.accessibility.cache.speech.synth.options"), 0);
  }
}

uint64_t _AXSAllowsMixToUplink()
{
  if (_AXSAllowsMixToUplink_onceToken != -1)
    dispatch_once(&_AXSAllowsMixToUplink_onceToken, &__block_literal_global_1621);
  return _kAXSCacheAllowsMixToUplink;
}

void _AXSSetAllowsMixToUplink(uint64_t a1)
{
  _kAXSCacheAllowsMixToUplink = a1;
  _setPreferenceAppWithNotification(CFSTR("AXSAllowsMixToUplinkPreference"), 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a1), CFSTR("com.apple.accessibility.cache.mix.to.uplink.notification"));
  _updateAccessibilitySettings();
}

const __CFBoolean *_AXSOnDeviceEyeTrackingEnabled()
{
  const __CFBoolean *result;
  const __CFBoolean *v1;
  uint64_t Value;

  result = (const __CFBoolean *)_copyValuePreferenceApp(CFSTR("AssistiveTouchMouseOnDeviceEyeTrackingEnabledPreference"), CFSTR("com.apple.AssistiveTouch"), 0);
  if (result)
  {
    v1 = result;
    Value = CFBooleanGetValue(result);
    CFRelease(v1);
    return (const __CFBoolean *)Value;
  }
  return result;
}

uint64_t AccessibilityUtilitiesLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E2939F90;
    v3 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    AccessibilityUtilitiesLibrary_cold_1(&v1);
  return AccessibilityUtilitiesLibraryCore_frameworkLibrary;
}

void ___axsHandlePrefChangedApp_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  const void *v3;
  const void *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  int *v8;

  if (cachedAppID_onceToken != -1)
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_1626);
  v2 = (const __CFString *)cachedAppID_CachedAppID;
  v3 = *(const void **)(a1 + 32);
  if (cachedAppID_CachedAppID)
  {
    if (!CFEqual(v3, (CFTypeRef)objc_msgSend(CFSTR("com.apple.accessibility.cache.enhance.text.legibility"), "stringByAppendingString:", cachedAppID_CachedAppID)))
    {
      if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)objc_msgSend(CFSTR("com.apple.accessibility.cache.button.shapes.enabled"), "stringByAppendingString:", v2)))
      {
        if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)objc_msgSend(CFSTR("com.apple.accessibility.cache.darken.system.colors.enabled"), "stringByAppendingString:", v2)))
        {
          if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)objc_msgSend(CFSTR("com.apple.accessibility.cache.increase.button.legibility"), "stringByAppendingString:", v2)))
          {
            if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)objc_msgSend(CFSTR("com.apple.accessibility.cache.differentiate.without.color"), "stringByAppendingString:", v2)))
            {
              if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)objc_msgSend(CFSTR("com.apple.accessibility.cache.enhance.background.contrast"), "stringByAppendingString:", v2)))
              {
                if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)objc_msgSend(CFSTR("com.apple.accessibility.cache.prefers.horizontal.text"), "stringByAppendingString:", v2)))
                {
                  if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)objc_msgSend(CFSTR("com.apple.accessibility.cache.reduce.motion"), "stringByAppendingString:", v2)))
                  {
                    if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)objc_msgSend(CFSTR("com.apple.accessibility.cache.reduce.motion.reduce.slide.transitions"), "stringByAppendingString:", v2)))
                    {
                      if (!CFEqual(*(CFTypeRef *)(a1 + 32), (CFTypeRef)objc_msgSend(CFSTR("com.apple.accessibility.cache.reduce.motion.autoplay.video.previews"), "stringByAppendingString:", v2)))
                      {
                        v4 = *(const void **)(a1 + 32);
                        v5 = (const __CFString *)objc_msgSend(CFSTR("com.apple.accessibility.cache.invert.colors"), "stringByAppendingString:", v2);
                        goto LABEL_37;
                      }
                      goto LABEL_34;
                    }
                    goto LABEL_32;
                  }
                  goto LABEL_30;
                }
                goto LABEL_28;
              }
              goto LABEL_26;
            }
            goto LABEL_24;
          }
          goto LABEL_22;
        }
        goto LABEL_20;
      }
      goto LABEL_18;
    }
LABEL_16:
    v6 = (const __CFString *)kAXSEnhanceTextLegibilityPreference;
    v7 = kAXSEnhanceTextLegibilityChangedNotification[0];
    v8 = (int *)&_kAXSCacheEnhanceTextLegibility;
LABEL_35:
    _updateCachePreferenceAndRepostNotification(v6, v7, v2, v8);
    return;
  }
  if (CFEqual(v3, CFSTR("com.apple.accessibility.cache.enhance.text.legibility")))
    goto LABEL_16;
  if (CFEqual(*(CFTypeRef *)(a1 + 32), CFSTR("com.apple.accessibility.cache.button.shapes.enabled")))
  {
LABEL_18:
    v6 = (const __CFString *)kAXSButtonShapesEnabledPreference;
    v7 = kAXSButtonShapesEnabledNotification[0];
    v8 = (int *)&_kAXSCacheButtonShapes;
    goto LABEL_35;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 32), CFSTR("com.apple.accessibility.cache.darken.system.colors.enabled")))
  {
LABEL_20:
    v6 = (const __CFString *)kAXSDarkenSystemColorsEnabledPreference;
    v7 = kAXSDarkenSystemColorsEnabledNotification[0];
    v8 = (int *)&_kAXSCacheDarkenSystemColors;
    goto LABEL_35;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 32), CFSTR("com.apple.accessibility.cache.increase.button.legibility")))
  {
LABEL_22:
    v6 = (const __CFString *)kAXSIncreaseButtonLegibilityPreference;
    v7 = kAXSIncreaseButtonLegibilityNotification[0];
    v8 = (int *)&_kAXSCacheIncreaseButtonLegibility;
    goto LABEL_35;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 32), CFSTR("com.apple.accessibility.cache.differentiate.without.color")))
  {
LABEL_24:
    v6 = (const __CFString *)kAXSDifferentiateWithoutColorPreference;
    v7 = kAXSDifferentiateWithoutColorChangedNotification[0];
    v8 = (int *)&_kAXSCacheDifferentiateWithoutColor;
    goto LABEL_35;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 32), CFSTR("com.apple.accessibility.cache.enhance.background.contrast")))
  {
LABEL_26:
    v6 = (const __CFString *)kAXSEnhanceBackgroundContrastPreference;
    v7 = kAXSEnhanceBackgroundContrastChangedNotification[0];
    v8 = (int *)&_kAXSCacheEnhanceBackgroundContrast;
    goto LABEL_35;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 32), CFSTR("com.apple.accessibility.cache.prefers.horizontal.text")))
  {
LABEL_28:
    v6 = (const __CFString *)kAXSPrefersHorizontalTextPreference;
    v7 = (const __CFString *)kAXSPrefersHorizontalTextNotification;
    v8 = (int *)&_kAXSCachePrefersHorizontalText;
    goto LABEL_35;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 32), CFSTR("com.apple.accessibility.cache.reduce.motion")))
  {
LABEL_30:
    v6 = (const __CFString *)kAXSReduceMotionPreference;
    v7 = kAXSReduceMotionChangedNotification[0];
    v8 = (int *)&_kAXSCacheReduceMotion;
    goto LABEL_35;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 32), CFSTR("com.apple.accessibility.cache.reduce.motion.reduce.slide.transitions")))
  {
LABEL_32:
    v6 = (const __CFString *)kAXSReduceMotionReduceSlideTransitionsPreference;
    v7 = (const __CFString *)kAXSReduceMotionReduceSlideTransitionsChangedNotification;
    v8 = (int *)&_kAXSCacheReduceMotionReduceSlideTransitions;
    goto LABEL_35;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 32), CFSTR("com.apple.accessibility.cache.reduce.motion.autoplay.video.previews")))
  {
LABEL_34:
    v6 = (const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsPreference;
    v7 = (const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsChangedNotification;
    v8 = (int *)&_kAXSCacheReduceMotionAutoplayVideoPreviews;
    goto LABEL_35;
  }
  v4 = *(const void **)(a1 + 32);
  v5 = CFSTR("com.apple.accessibility.cache.invert.colors");
LABEL_37:
  if (CFEqual(v4, v5))
    _updateCacheSmartInvertAndRepostNotification(v2);
}

void ___axsHandlePrefChanged_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  CFTypeRef *v3;
  const void *v4;
  const __CFString *v5;
  const __CFString *v6;
  int *v7;
  NSObject *v8;
  const char *v9;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v12;
  __CFNotificationCenter *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  const __CFString *v18;
  __CFNotificationCenter *v19;
  __CFNotificationCenter *v20;
  __CFNotificationCenter *v21;
  __CFNotificationCenter *v22;
  __CFNotificationCenter *v23;
  const __CFString *v24;
  __CFNotificationCenter *v25;
  __CFNotificationCenter *v26;
  __CFNotificationCenter *v27;
  __CFNotificationCenter *v28;
  __CFNotificationCenter *v29;
  __CFNotificationCenter *v30;
  __CFNotificationCenter *v31;
  __CFNotificationCenter *v32;
  __CFNotificationCenter *v33;
  __CFNotificationCenter *v34;
  __CFNotificationCenter *v35;
  __CFNotificationCenter *v36;
  __CFNotificationCenter *v37;
  __CFNotificationCenter *v38;
  __CFNotificationCenter *v39;
  __CFNotificationCenter *v40;
  __CFNotificationCenter *v41;
  __CFNotificationCenter *v42;
  __CFNotificationCenter *v43;
  __CFNotificationCenter *v44;
  __CFNotificationCenter *v45;
  __CFNotificationCenter *v46;
  __CFNotificationCenter *v47;
  __CFNotificationCenter *v48;
  __CFNotificationCenter *v49;
  __CFNotificationCenter *v50;
  __CFNotificationCenter *v51;
  __CFNotificationCenter *v52;
  __CFNotificationCenter *v53;
  __CFNotificationCenter *v54;
  __CFNotificationCenter *v55;
  __CFNotificationCenter *v56;
  __CFNotificationCenter *v57;
  __CFNotificationCenter *v58;
  __CFNotificationCenter *v59;
  __CFNotificationCenter *v60;
  __CFNotificationCenter *v61;
  __CFNotificationCenter *v62;
  __CFNotificationCenter *v63;
  __CFNotificationCenter *v64;
  __CFNotificationCenter *v65;
  __CFNotificationCenter *v66;
  __CFNotificationCenter *v67;
  const __CFNumber *v68;
  const __CFNumber *v69;
  CFTypeID v70;
  const __CFNumber *v71;
  const __CFNumber *v72;
  CFTypeID v73;
  __CFNotificationCenter *v74;
  __CFNotificationCenter *v75;
  __CFNotificationCenter *v76;
  __CFNotificationCenter *v77;
  __CFNotificationCenter *v78;
  __CFNotificationCenter *v79;
  __CFNotificationCenter *v80;
  __CFNotificationCenter *v81;
  const __CFNumber *v82;
  const __CFNumber *v83;
  CFTypeID v84;
  __CFNotificationCenter *v85;
  __CFNotificationCenter *v86;
  __CFNotificationCenter *v87;
  const __CFNumber *v88;
  const __CFNumber *v89;
  CFTypeID v90;
  __CFNotificationCenter *v91;
  __CFNotificationCenter *v92;
  __CFNotificationCenter *v93;
  __CFNotificationCenter *v94;
  __CFNotificationCenter *v95;
  __CFNotificationCenter *v96;
  __CFNotificationCenter *v97;
  __CFNotificationCenter *v98;
  __CFNotificationCenter *v99;
  __CFNotificationCenter *v100;
  __CFNotificationCenter *v101;
  __CFNotificationCenter *v102;
  __CFNotificationCenter *v103;
  __CFNotificationCenter *v104;
  int v105;
  const __CFNumber *v106;
  const __CFNumber *v107;
  CFTypeID v108;
  const __CFNumber *v109;
  const __CFNumber *v110;
  CFTypeID v111;
  __CFNotificationCenter *v112;
  __CFNotificationCenter *v113;
  __CFNotificationCenter *v114;
  __CFNotificationCenter *v115;
  const __CFString *v116;
  const __CFNumber *v117;
  const __CFNumber *v118;
  CFTypeID v119;
  __CFNotificationCenter *v120;
  __CFNotificationCenter *v121;
  __CFNotificationCenter *v122;
  __CFNotificationCenter *v123;
  __CFNotificationCenter *v124;
  __CFNotificationCenter *v125;
  NSObject *v126;
  int v127;
  __CFNotificationCenter *v128;
  __CFNotificationCenter *v129;
  __CFNotificationCenter *v130;
  __CFNotificationCenter *v131;
  __CFNotificationCenter *v132;
  __CFNotificationCenter *v133;
  __CFNotificationCenter *v134;
  __CFNotificationCenter *v135;
  __CFNotificationCenter *v136;
  __CFNotificationCenter *v137;
  __CFNotificationCenter *v138;
  __CFNotificationCenter *v139;
  __CFNotificationCenter *v140;
  __CFNotificationCenter *v141;
  __CFNotificationCenter *v142;
  __CFNotificationCenter *v143;
  __CFNotificationCenter *v144;
  __CFNotificationCenter *v145;
  __CFNotificationCenter *v146;
  __CFNotificationCenter *v147;
  __CFNotificationCenter *v148;
  __CFNotificationCenter *v149;
  __CFNotificationCenter *v150;
  __CFNotificationCenter *v151;
  const __CFNumber *v152;
  const __CFNumber *v153;
  CFTypeID v154;
  __CFNotificationCenter *v155;
  __CFNotificationCenter *v156;
  __CFNotificationCenter *v157;
  __CFNotificationCenter *v158;
  __CFNotificationCenter *v159;
  __CFNotificationCenter *v160;
  __CFNotificationCenter *v161;
  __CFNotificationCenter *v162;
  __CFNotificationCenter *v163;
  __CFNotificationCenter *v164;
  __CFNotificationCenter *v165;
  __CFNotificationCenter *v166;
  __CFNotificationCenter *v167;
  __CFNotificationCenter *v168;
  __CFNotificationCenter *v169;
  __CFNotificationCenter *v170;
  __CFNotificationCenter *v171;
  __CFNotificationCenter *v172;
  __CFNotificationCenter *v173;
  __CFNotificationCenter *v174;
  const __CFNumber *v175;
  const __CFNumber *v176;
  CFTypeID v177;
  __CFNotificationCenter *v178;
  __CFNotificationCenter *v179;
  __CFNotificationCenter *v180;
  __CFNotificationCenter *v181;
  const __CFNumber *v182;
  const __CFNumber *v183;
  CFTypeID v184;
  __CFNotificationCenter *v185;
  __CFNotificationCenter *v186;
  __CFNotificationCenter *v187;
  const __CFNumber *v188;
  const __CFNumber *v189;
  CFTypeID v190;
  __CFNotificationCenter *v191;
  __CFNotificationCenter *v192;
  __CFNotificationCenter *v193;
  const __CFNumber *v194;
  const __CFNumber *v195;
  CFTypeID v196;
  __CFNotificationCenter *v197;
  __CFNotificationCenter *v198;
  __CFNotificationCenter *v199;
  __CFNotificationCenter *v200;
  const __CFNumber *v201;
  const __CFNumber *v202;
  CFTypeID v203;
  __CFNotificationCenter *v204;
  __CFNotificationCenter *v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  char v210;
  _QWORD v211[3];
  uint8_t v212[128];
  uint8_t buf[4];
  int v214;
  __int16 v215;
  int v216;
  __int16 v217;
  int v218;
  uint64_t v219;

  v219 = *MEMORY[0x1E0C80C00];
  if (cachedAppID_onceToken != -1)
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_1626);
  v2 = (const __CFString *)cachedAppID_CachedAppID;
  v4 = *(const void **)(a1 + 32);
  v3 = (CFTypeRef *)(a1 + 32);
  if (CFEqual(v4, CFSTR("com.apple.accessibility.cache.button.shapes.enabled")))
  {
    v5 = (const __CFString *)kAXSButtonShapesEnabledPreference;
    v6 = kAXSButtonShapesEnabledNotification[0];
    v7 = (int *)&_kAXSCacheButtonShapes;
LABEL_5:
    _updateCachePreferenceAndRepostNotification(v5, v6, v2, v7);
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.use.darker.keyboard.enabled")))
  {
    _getBooleanPreference((const __CFString *)kAXSUseDarkerKeyboardPreference, 0);
    if (kAXSUseDarkerKeyboardEnabledNotification)
    {
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)kAXSUseDarkerKeyboardEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSUseDarkerKeyboardEnabledNotification;
LABEL_15:
        CFNotificationCenterPostNotification(DarwinNotifyCenter, v12, 0, 0, 1u);
        goto LABEL_6;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.darken.system.colors.enabled")))
  {
    v5 = (const __CFString *)kAXSDarkenSystemColorsEnabledPreference;
    v6 = kAXSDarkenSystemColorsEnabledNotification[0];
    v7 = (int *)&_kAXSCacheDarkenSystemColors;
    goto LABEL_5;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.VibrationDisabled")))
  {
    _kAXSCacheVibrationDisabled = _getBooleanPreference((const __CFString *)kAXSVibrationDisabledPreference, 0);
    if (kAXSVibrationDisabledPreferenceDidChangeNotification)
    {
      v13 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v13, (CFNotificationName)kAXSVibrationDisabledPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSVibrationDisabledPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.use.prominent.focus.indicators")))
  {
    _kAXSCacheHighContrastFocusIndicatorsEnabled = _getBooleanPreference((const __CFString *)kAXSHighContrastFocusIndicatorsEnabledPreference, 0);
    if (kAXSHighContrastFocusIndicatorsEnabledNotification)
    {
      v21 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v21, (CFNotificationName)kAXSHighContrastFocusIndicatorsEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSHighContrastFocusIndicatorsEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.use.single.system.color.enabled")))
  {
    _kAXSCacheUseSingleSystemColor = _getBooleanPreference((const __CFString *)kAXSUseSingleSystemColorPreference, 0);
    if (kAXSUseSingleSystemColorNotification)
    {
      v25 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v25, (CFNotificationName)kAXSUseSingleSystemColorNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSUseSingleSystemColorNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.increase.button.legibility")))
  {
    v5 = (const __CFString *)kAXSIncreaseButtonLegibilityPreference;
    v6 = kAXSIncreaseButtonLegibilityNotification[0];
    v7 = (int *)&_kAXSCacheIncreaseButtonLegibility;
    goto LABEL_5;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.differentiate.without.color")))
  {
    v5 = (const __CFString *)kAXSDifferentiateWithoutColorPreference;
    v6 = kAXSDifferentiateWithoutColorChangedNotification[0];
    v7 = (int *)&_kAXSCacheDifferentiateWithoutColor;
    goto LABEL_5;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.reduce.motion")))
  {
    v5 = (const __CFString *)kAXSReduceMotionPreference;
    v6 = kAXSReduceMotionChangedNotification[0];
    v7 = (int *)&_kAXSCacheReduceMotion;
    goto LABEL_5;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.reduce.motion.autoplay.messages.effects")))
  {
    _kAXSCacheReduceMotionAutoplayMessagesEffectsEnabled = _getBooleanPreference((const __CFString *)kAXSReduceMotionAutoplayMessagesEffectsPreference, 0);
    if (kAXSReduceMotionAutoplayMessagesEffectsChangedNotification)
    {
      v27 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v27, (CFNotificationName)kAXSReduceMotionAutoplayMessagesEffectsChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSReduceMotionAutoplayMessagesEffectsChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.reduce.motion.autoplay.animated.images")))
  {
    _kAXSCacheReduceMotionAutoplayAnimatedImagesEnabled = _getBooleanPreference((const __CFString *)kAXSReduceMotionAutoplayAnimatedImagesPreference, 0);
    if (kAXSReduceMotionAutoplayAnimatedImagesChangedNotification)
    {
      v28 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v28, (CFNotificationName)kAXSReduceMotionAutoplayAnimatedImagesChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSReduceMotionAutoplayAnimatedImagesChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.reduce.motion.autoplay.video.previews")))
  {
    v5 = (const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsPreference;
    v6 = (const __CFString *)kAXSReduceMotionAutoplayVideoPreviewsChangedNotification;
    v7 = (int *)&_kAXSCacheReduceMotionAutoplayVideoPreviews;
    goto LABEL_5;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.reduce.motion.reduce.slide.transitions")))
  {
    v5 = (const __CFString *)kAXSReduceMotionReduceSlideTransitionsPreference;
    v6 = (const __CFString *)kAXSReduceMotionReduceSlideTransitionsChangedNotification;
    v7 = (int *)&_kAXSCacheReduceMotionReduceSlideTransitions;
    goto LABEL_5;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.enhance.background.contrast")))
  {
    v5 = (const __CFString *)kAXSEnhanceBackgroundContrastPreference;
    v6 = kAXSEnhanceBackgroundContrastChangedNotification[0];
    v7 = (int *)&_kAXSCacheEnhanceBackgroundContrast;
    goto LABEL_5;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.enhance.text.legibility")))
  {
    v5 = (const __CFString *)kAXSEnhanceTextLegibilityPreference;
    v6 = kAXSEnhanceTextLegibilityChangedNotification[0];
    v7 = (int *)&_kAXSCacheEnhanceTextLegibility;
    goto LABEL_5;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.zoom")))
  {
    _kAXSCacheZoomTouchEnabled = _getBooleanPreference((const __CFString *)kAXSZoomTouchEnabledPreference, 0);
    if (kAXSZoomTouchEnabledNotification)
    {
      v29 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v29, (CFNotificationName)kAXSZoomTouchEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSZoomTouchEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.livespeech")))
  {
    _kAXSCacheLiveSpeechEnabled = _getBooleanPreference((const __CFString *)kAXSLiveSpeechEnabledPreference, 0);
    if (kAXSLiveSpeechEnabledNotification)
    {
      v30 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v30, (CFNotificationName)kAXSLiveSpeechEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSLiveSpeechEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.hovertext")))
  {
    _kAXSCacheHoverTextEnabled = _getBooleanPreference((const __CFString *)kAXSHoverTextEnabledPreference, 0);
    if (kAXSHoverTextEnabledNotification)
    {
      v31 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v31, (CFNotificationName)kAXSHoverTextEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSHoverTextEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.hovertext.fontsize.change")))
  {
    _kAXSCachedHoverTextFontSize = _getFloatPreference((const __CFString *)kAXSHoverTextFontSizePreference, 0, 0);
    if (kAXSHoverTextFontSizeChangedNotification)
    {
      v32 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v32, (CFNotificationName)kAXSHoverTextFontSizeChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSHoverTextFontSizeChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.hovertext.backgroundopacity.change")))
  {
    _kAXSCachedHoverTextBackgroundOpacity = _getFloatPreference((const __CFString *)kAXSHoverTextBackgroundOpacityPreference, 0, 0);
    if (kAXSHoverTextBackgroundOpacityChangedNotification)
    {
      v33 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v33, (CFNotificationName)kAXSHoverTextBackgroundOpacityChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSHoverTextBackgroundOpacityChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.hovertext.displaymode.change")))
  {
    _kAXSCachedHoverTextDisplayMode = (uint64_t)_getFloatPreference((const __CFString *)kAXSHoverTextDisplayModePreference, 0, 0);
    if (kAXSHoverTextDisplayModeChangedNotification)
    {
      v34 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v34, (CFNotificationName)kAXSHoverTextDisplayModeChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSHoverTextDisplayModeChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.hovertext.typing")))
  {
    _kAXSCacheHoverTextTypingEnabled = _getBooleanPreference((const __CFString *)kAXSHoverTextTypingEnabledPreference, 0);
    if (kAXSHoverTextTypingEnabledNotification)
    {
      v35 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v35, (CFNotificationName)kAXSHoverTextTypingEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSHoverTextTypingEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.hovertext.typing.displaymode.change")))
  {
    _kAXSCacheHoverTextTypingDisplayMode = (uint64_t)_getFloatPreference((const __CFString *)kAXSHoverTextTypingDisplayModePreference, 0, 0);
    if (kAXSHoverTextTypingDisplayModeChangedNotification)
    {
      v36 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v36, (CFNotificationName)kAXSHoverTextTypingDisplayModeChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSHoverTextTypingDisplayModeChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.ast")))
  {
    _kAXSAssistiveTouchEnabledCache = _getBooleanPreference((const __CFString *)kAXSAssistiveTouchEnabledPreference, 0);
    if (kAXSAssistiveTouchEnabledNotification)
    {
      v37 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v37, (CFNotificationName)kAXSAssistiveTouchEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSAssistiveTouchEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.vot")))
  {
    _kAXSCacheVoiceOverTouchEnabled = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchEnabledPreference, 0);
    if (kAXSVoiceOverTouchEnabledNotification)
    {
      v38 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v38, (CFNotificationName)kAXSVoiceOverTouchEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSVoiceOverTouchEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.bsi")))
  {
    _kAXSCacheBrailleScreenInputEnabled = _getBooleanPreference((const __CFString *)kAXSBrailleScreenInputEnabledPreference, 0);
    if (kAXSBrailleScreenInputEnabledNotification)
    {
      v39 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v39, (CFNotificationName)kAXSBrailleScreenInputEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSBrailleScreenInputEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.AXSCacheVoiceOverSpeakTimeOnWakeNotification")))
  {
    _kAXSCacheVoiceOverSpeakTimeOnWake = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchSpeakTimeOnWakePreference, 0);
    if (kAXSVoiceOverTouchSpeakTimeOnWakeChangedNotification)
    {
      v40 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v40, (CFNotificationName)kAXSVoiceOverTouchSpeakTimeOnWakeChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSVoiceOverTouchSpeakTimeOnWakeChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.AXSCacheWalkieTalkieTapToTalkNotification")))
  {
    _kAXSCacheWalkieTalkieTapToTalk = _getBooleanPreference((const __CFString *)kAXSWalkieTalkieTapToTalkPreference, 0);
    if (kAXSWalkieTalkieTapToTalkChangedNotification)
    {
      v41 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v41, (CFNotificationName)kAXSWalkieTalkieTapToTalkChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSWalkieTalkieTapToTalkChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.AXSCacheAppSwitcherAutoSelectNotification")))
  {
    _kAXSCacheAppSwitcherAutoSelect = _getBooleanPreference((const __CFString *)kAXSAppSwitcherAutoSelectPreference, 0);
    if (kAXSAppSwitcherAutoSelectChangedNotification)
    {
      v42 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v42, (CFNotificationName)kAXSAppSwitcherAutoSelectChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSAppSwitcherAutoSelectChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.visual.alert")))
  {
    _kAXSCacheVisualAlertEnabled = _getBooleanPreference((const __CFString *)kAXSVisualAlertEnabledPreference, 0);
    if (kAXSVisualAlertEnabledNotification)
    {
      v43 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v43, (CFNotificationName)kAXSVisualAlertEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSVisualAlertEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.earpiece.noise")))
  {
    _kAXSCacheEarpieceNoiseCancellation = _getBooleanPreference((const __CFString *)kAXSEarpieceNoiseCancellationPreference, 0);
    if (kAXSEarpieceNoiseCancellationEnabledNotification)
    {
      v44 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v44, (CFNotificationName)kAXSEarpieceNoiseCancellationEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSEarpieceNoiseCancellationEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.extendedvoiceisolationmodes")))
  {
    _kAXSCacheExtendedVoiceIsolationMediaModesEnabled = _getBooleanPreference((const __CFString *)kAXSExtendedVoiceIsolationMediaModesEnabledPreference, 0);
    if (kAXSExtendedVoiceIsolationMediaModesEnabledNotification)
    {
      v45 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v45, (CFNotificationName)kAXSExtendedVoiceIsolationMediaModesEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSExtendedVoiceIsolationMediaModesEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.lock.to.end.call")))
  {
    _kAXSCachePhoneLockToEndCall = _getBooleanPreference((const __CFString *)kAXSPhoneLockToEndCallPreference, 0);
    if (kAXSPhoneLockToEndCallNotification)
    {
      v46 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v46, (CFNotificationName)kAXSPhoneLockToEndCallNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSPhoneLockToEndCallNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.mono.audio")))
  {
    _kAXSCacheMonoAudioEnabled = _getBooleanPreference((const __CFString *)kAXSMonoAudioEnabledPreference, 0);
    if (kAXSMonoAudioEnabledNotification)
    {
      v47 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v47, (CFNotificationName)kAXSMonoAudioEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSMonoAudioEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.hac.audio")))
  {
    _kAXSCacheHearingAidComplianceEnabled = _getBooleanPreference((const __CFString *)kAXSHearingAidCompliancePreference, 0);
    if (kAXSHearingAidComplianceNotification)
    {
      v48 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v48, (CFNotificationName)kAXSHearingAidComplianceNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSHearingAidComplianceNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.grayscale")))
  {
    _kAXSCacheGrayscaleEnabled = _getBooleanPreference((const __CFString *)kAXSGrayscaleEnabledPreference, 0);
    if (kAXSGrayscaleEnabledNotification[0])
    {
      v49 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v49, kAXSGrayscaleEnabledNotification[0], 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = kAXSGrayscaleEnabledNotification[0];
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.invert.colors")))
  {
    _updateCacheSmartInvertAndRepostNotification(v2);
    _invalidateAllCacheSmartInvertPreferences();
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.classic.invert.colors")))
  {
    _kAXSCacheClassicInvertColorsEnabled = _getBooleanPreference((const __CFString *)kAXSClassicInvertColorsPreference, 0);
    v50 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v50, (CFNotificationName)kAXSClassicInvertColorsEnabledNotification, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken != -1)
      dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
    if (!_AXSCurrentProcessIsWebContent_IsWebContent)
    {
      v51 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v51, (CFNotificationName)kAXSClassicInvertColorsEnabledNotification, 0, 0, 1u);
      DarwinNotifyCenter = CFNotificationCenterGetLocalCenter();
      v12 = kAXSInvertColorsEnabledNotification[0];
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.displayfilter.showinitialalert")))
  {
    _kAXSCacheDisplayFilterShowInitialAlert = _getBooleanPreference((const __CFString *)kAXSDisplayFilterShowInitialAlertPreference, 0);
    if (kAXSDisplayShowInitialAlertNotification)
    {
      v52 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v52, (CFNotificationName)kAXSDisplayShowInitialAlertNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSDisplayShowInitialAlertNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.quick.speak")))
  {
    _kAXSCacheQuickSpeakEnabled = _getBooleanPreference((const __CFString *)kAXSQuickSpeakEnabledPreference, 0);
    if (kAXSQuickSpeakEnabledNotification)
    {
      v53 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v53, (CFNotificationName)kAXSQuickSpeakEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSQuickSpeakEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.quick.speak.highlight.text")))
  {
    _kAXSCacheQuickSpeakHighlightTextEnabled = _getBooleanPreference((const __CFString *)kAXSQuickSpeakHighlightTextEnabledPreference, 0);
    if (kAXSQuickSpeakHighlightTextEnabledNotification)
    {
      v54 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v54, (CFNotificationName)kAXSQuickSpeakHighlightTextEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSQuickSpeakHighlightTextEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.internal.logvalidationerrors")))
  {
    _kAXSCacheLogValidationErrors = _getBooleanPreference((const __CFString *)kAXSLogValidationErrorsPreference, 0);
    if (kAXSLogValidationErrorsNotification)
    {
      v55 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v55, (CFNotificationName)kAXSLogValidationErrorsNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSLogValidationErrorsNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.internal.reportvalidationerrors")))
  {
    _kAXSCacheReportValidationErrors = _getBooleanPreference((const __CFString *)kAXSReportValidationErrorsPreference, 0);
    if (kAXSReportValidationErrorsNotification)
    {
      v56 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v56, (CFNotificationName)kAXSReportValidationErrorsNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSReportValidationErrorsNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.internal.crashonvalidationerrors")))
  {
    _kAXSCacheCrashOnValidationErrors = _getBooleanPreference((const __CFString *)kAXSCrashOnValidationErrorsPreference, 0);
    if (kAXSCrashOnValidationErrorsNotification)
    {
      v57 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v57, (CFNotificationName)kAXSCrashOnValidationErrorsNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSCrashOnValidationErrorsNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.web.accessibility.events.enabled")))
  {
    _getBooleanPreference((const __CFString *)kAXSWebAccessibilityEventsEnabledPreference, 0);
    if (kAXSWebAccessibilityEventsEnabledNotification)
    {
      v58 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v58, (CFNotificationName)kAXSWebAccessibilityEventsEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSWebAccessibilityEventsEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.allows.notification")))
  {
    _kAXSCacheWebProcessAllowsSecondaryThreadEnabled = _getBooleanPreference((const __CFString *)kAXSWebProcessAllowsSecondaryThreadEnabledPreference, 0);
    if (kAXSWebProcessAllowsSecondaryThreadEnabledNotification)
    {
      v59 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v59, (CFNotificationName)kAXSWebProcessAllowsSecondaryThreadEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSWebProcessAllowsSecondaryThreadEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pointer.allow.app.customization")))
  {
    _kAXSCachePointerAllowAppCustomizationEnabled = _getBooleanPreference((const __CFString *)kAXSPointerAllowAppCustomizationEnabledPreference, 0);
    if (kAXSPointerAllowAppCustomizationPreferenceDidChangeNotification)
    {
      v60 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v60, (CFNotificationName)kAXSPointerAllowAppCustomizationPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSPointerAllowAppCustomizationPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pointer.inertia")))
  {
    _kAXSCachePointerInertiaEnabled = _getBooleanPreference((const __CFString *)kAXSPointerInertiaEnabledPreference, 0);
    if (kAXSPointerInertiaPreferenceDidChangeNotification)
    {
      v61 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v61, (CFNotificationName)kAXSPointerInertiaPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSPointerInertiaPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pointer.effect.scaling")))
  {
    _kAXSCachePointerEffectScalingEnabled = _getBooleanPreference((const __CFString *)kAXSPointerEffectScalingEnabledPreference, 0);
    if (kAXSPointerEffectScalingPreferenceDidChangeNotification)
    {
      v62 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v62, (CFNotificationName)kAXSPointerEffectScalingPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSPointerEffectScalingPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pointer.size.multiplier")))
  {
    _kAXSCachePointerSizeMultiplier = _getFloatPreference((const __CFString *)kAXSPointerSizeMultiplierPreference, 0, 0);
    if (kAXSPointerSizeMultiplierPreferenceDidChangeNotification)
    {
      v63 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v63, (CFNotificationName)kAXSPointerSizeMultiplierPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSPointerSizeMultiplierPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pointer.increased.contrast")))
  {
    _kAXSCachePointerIncreasedContrastEnabled = _getBooleanPreference((const __CFString *)kAXSPointerIncreasedContrastEnabledPreference, 0);
    if (kAXSPointerIncreasedContrastPreferenceDidChangeNotification)
    {
      v64 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v64, (CFNotificationName)kAXSPointerIncreasedContrastPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSPointerIncreasedContrastPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pointer.auto.hide")))
  {
    _kAXSCachePointerAutoHideEnabled = _getBooleanPreference((const __CFString *)kAXSPointerAutoHideEnabledPreference, 0);
    if (kAXSPointerAutoHidePreferenceDidChangeNotification)
    {
      v65 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v65, (CFNotificationName)kAXSPointerAutoHidePreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSPointerAutoHidePreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pointer.auto.hide.duration")))
  {
    _kAXSCachePointerAutoHideDuration = _getFloatPreference((const __CFString *)kAXSPointerAutoHideDurationPreference, 0, 0);
    if (kAXSPointerAutoHideDurationPreferenceDidChangeNotification)
    {
      v66 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v66, (CFNotificationName)kAXSPointerAutoHideDurationPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSPointerAutoHideDurationPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pointer.stroke.color.width")))
  {
    _kAXSCachePointerStrokeColorWidth = _getFloatPreference((const __CFString *)kAXSPointerStrokeColorWidthPreference, 0, 0);
    if (!kAXSPointerStrokeColorPreferenceDidChangeNotification)
      goto LABEL_6;
    v67 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v67, (CFNotificationName)kAXSPointerStrokeColorPreferenceDidChangeNotification, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken != -1)
      dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
    if (_AXSCurrentProcessIsWebContent_IsWebContent)
      goto LABEL_6;
    goto LABEL_361;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pointer.stroke.color")))
  {
    v210 = 1;
    v68 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSPointerStrokeColorPreference, 0, &v210);
    v69 = v68;
    if (v210 && v68)
    {
      v70 = CFGetTypeID(v68);
      if (v70 == CFNumberGetTypeID())
      {
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v69, kCFNumberIntType, buf);
        _kAXSCachePointerStrokeColor = *(_DWORD *)buf;
      }
    }
    else if (!v68)
    {
LABEL_347:
      if (!kAXSPointerStrokeColorPreferenceDidChangeNotification)
        goto LABEL_6;
      v74 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v74, (CFNotificationName)kAXSPointerStrokeColorPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (_AXSCurrentProcessIsWebContent_IsWebContent)
        goto LABEL_6;
LABEL_361:
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v12 = (const __CFString *)kAXSPointerStrokeColorPreferenceDidChangeNotification;
      goto LABEL_15;
    }
    CFRelease(v69);
    goto LABEL_347;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pointer.voiceover.option")))
  {
    v210 = 1;
    v71 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSPointerVoiceOverCursorOptionPreference, 0, &v210);
    v72 = v71;
    if (v210 && v71)
    {
      v73 = CFGetTypeID(v71);
      if (v73 == CFNumberGetTypeID())
      {
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v72, kCFNumberIntType, buf);
        _kAXSCachePointerVoiceOverCursorOption = *(_DWORD *)buf;
      }
    }
    else if (!v71)
    {
LABEL_356:
      if (kAXSPointerVoiceOverCursorOptionPreferenceDidChangeNotification)
      {
        v76 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v76, (CFNotificationName)kAXSPointerVoiceOverCursorOptionPreferenceDidChangeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSPointerVoiceOverCursorOptionPreferenceDidChangeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    CFRelease(v72);
    goto LABEL_356;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.voiceover.speak.under.pointer")))
  {
    _kAXSCacheVoiceOverSpeakUnderPointer = _getBooleanPreference((const __CFString *)kAXSVoiceOverSpeakUnderPointerPreference, 0);
    if (!kAXSVoiceOverSpeakUnderPointerPreferenceDidChangeNotification)
      goto LABEL_6;
    v75 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v75, (CFNotificationName)kAXSVoiceOverSpeakUnderPointerPreferenceDidChangeNotification, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken == -1)
      goto LABEL_366;
    goto LABEL_365;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.voiceover.speak.under.pointer")))
  {
    _kAXSCacheVoiceOverSpeakUnderPointerDelay = _getFloatPreference((const __CFString *)kAXSVoiceOverSpeakUnderPointerDelayPreference, 0, 0);
    if (!kAXSVoiceOverSpeakUnderPointerPreferenceDidChangeNotification)
      goto LABEL_6;
    v77 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v77, (CFNotificationName)kAXSVoiceOverSpeakUnderPointerPreferenceDidChangeNotification, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken == -1)
      goto LABEL_366;
LABEL_365:
    dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
LABEL_366:
    if (!_AXSCurrentProcessIsWebContent_IsWebContent)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v12 = (const __CFString *)kAXSVoiceOverSpeakUnderPointerPreferenceDidChangeNotification;
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pointer.scale.with.zoom.level")))
  {
    _kAXSCachePointerScaleWithZoomLevelEnabled = _getBooleanPreference((const __CFString *)kAXSPointerScaleWithZoomLevelEnabledPreference, 0);
    if (kAXSPointerScaleWithZoomLevelPreferenceDidChangeNotification)
    {
      v78 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v78, (CFNotificationName)kAXSPointerScaleWithZoomLevelPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSPointerScaleWithZoomLevelPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, (CFTypeRef)_kAXSCacheMotionCuesActiveDidChangeNotification))
  {
    _kAXSCacheMotionCuesActive = _getBooleanPreference(CFSTR("AXSMotionCuesActive"), 0);
    if (!kAXSMotionCuesPreferenceDidChangeNotification)
      goto LABEL_6;
    v79 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v79, (CFNotificationName)kAXSMotionCuesPreferenceDidChangeNotification, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken == -1)
      goto LABEL_390;
LABEL_389:
    dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
    goto LABEL_390;
  }
  if (CFEqual(*v3, (CFTypeRef)_kAXSCacheMotionCuesShouldShowBannerDidChangeNotification))
  {
    _kAXSCacheMotionCuesShouldShowBanner = _getBooleanPreference(CFSTR("AXSMotionCuesShouldShowBanner"), 0);
    if (!kAXSMotionCuesPreferenceDidChangeNotification)
      goto LABEL_6;
    v80 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v80, (CFNotificationName)kAXSMotionCuesPreferenceDidChangeNotification, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken != -1)
      goto LABEL_389;
LABEL_390:
    if (_AXSCurrentProcessIsWebContent_IsWebContent)
      goto LABEL_6;
    goto LABEL_415;
  }
  if (CFEqual(*v3, (CFTypeRef)_kAXSCacheMotionCuesDidChangeNotification))
  {
    _kAXSCacheMotionCuesEnabled = _getBooleanPreference((const __CFString *)kAXSMotionCuesEnabledPreference, 0);
    if (!kAXSMotionCuesPreferenceDidChangeNotification)
      goto LABEL_6;
    v81 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(v81, (CFNotificationName)kAXSMotionCuesPreferenceDidChangeNotification, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken != -1)
      goto LABEL_389;
    goto LABEL_390;
  }
  if (CFEqual(*v3, (CFTypeRef)_kAXSCacheMotionCuesModeDidChangeNotification))
  {
    v210 = 1;
    v82 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSMotionCuesModePreference, 0, &v210);
    v83 = v82;
    if (v210 && v82)
    {
      v84 = CFGetTypeID(v82);
      if (v84 == CFNumberGetTypeID())
      {
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v83, kCFNumberIntType, buf);
        _kAXSCacheMotionCuesMode = *(_DWORD *)buf;
      }
    }
    else if (!v82)
    {
LABEL_403:
      if (!kAXSMotionCuesPreferenceDidChangeNotification)
        goto LABEL_6;
      v86 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v86, (CFNotificationName)kAXSMotionCuesPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (_AXSCurrentProcessIsWebContent_IsWebContent)
        goto LABEL_6;
LABEL_415:
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v12 = (const __CFString *)kAXSMotionCuesPreferenceDidChangeNotification;
      goto LABEL_15;
    }
    CFRelease(v83);
    goto LABEL_403;
  }
  if (CFEqual(*v3, (CFTypeRef)_kAXSCacheHapticMusicDidChangeNotification))
  {
    _kAXSCacheHapticMusicEnabled = _getBooleanPreference((const __CFString *)kAXSHapticMusicEnabledPreference, 0);
    if (kAXSHapticMusicPreferenceDidChangeNotification)
    {
      v85 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v85, (CFNotificationName)kAXSHapticMusicPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSHapticMusicPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, (CFTypeRef)_kAXSCacheAudioDonationSiriImprovementDidChangeNotification))
  {
    _kAXSCacheAudioDonationSiriImprovementEnabled = _getBooleanPreference((const __CFString *)kAXSAudioDonationSiriImprovementEnabledPreference, 0);
    if (kAXSAudioDonationSiriImprovementPreferenceDidChangeNotification)
    {
      v87 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v87, (CFNotificationName)kAXSAudioDonationSiriImprovementPreferenceDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSAudioDonationSiriImprovementPreferenceDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.isolated.tree.mode")))
  {
    v210 = 1;
    v88 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSIsolatedTreeModeEnabledPreference, 0, &v210);
    v89 = v88;
    if (v210 && v88)
    {
      v90 = CFGetTypeID(v88);
      if (v90 == CFNumberGetTypeID())
      {
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v89, kCFNumberIntType, buf);
        _kAXSCacheIsolatedTreeMode = *(_DWORD *)buf;
      }
    }
    else if (!v88)
    {
LABEL_430:
      if (kAXSIsolatedTreeModePreferenceDidChangeNotification)
      {
        v92 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v92, (CFNotificationName)kAXSIsolatedTreeModePreferenceDidChangeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSIsolatedTreeModePreferenceDidChangeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    CFRelease(v89);
    goto LABEL_430;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.back.tap.enabled")))
  {
    _kAXSCacheBackTapEnabled = _getBooleanPreference((const __CFString *)kAXSBackTapEnabledPreference, 0);
    if (kAXSBackTapEnabledDidChangeNotification)
    {
      v91 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v91, (CFNotificationName)kAXSBackTapEnabledDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSBackTapEnabledDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.braille.input.connection.changed")))
  {
    _kAXSCacheBrailleInputDeviceConnected = _getBooleanPreference((const __CFString *)kAXSBrailleInputDeviceConnectedPreference, 0);
    if (kAXSBrailleInputDeviceConnectedDidChangeNotification)
    {
      v93 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v93, (CFNotificationName)kAXSBrailleInputDeviceConnectedDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSBrailleInputDeviceConnectedDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.apple.tv.simple.gestures")))
  {
    _kAXSCacheAppleTVSimpleGesturesEnabled = _getBooleanPreference((const __CFString *)kAXSAppleTVSimpleGesturesEnabledPreference, 0);
    if (kAXSAppleTVRemoteSimpleGesturesEnabledNotification)
    {
      v94 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v94, (CFNotificationName)kAXSAppleTVRemoteSimpleGesturesEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSAppleTVRemoteSimpleGesturesEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.apple.tv.live.tv.buttons")))
  {
    _kAXSCacheAppleTVForceLiveTVButtonsEnabled = _getBooleanPreference((const __CFString *)kAXSAppleTVForceLiveTVButtonsEnabledPreference, 0);
    if (kAXSAppleTVRemoteForceLiveTVButtonsEnabledNotification)
    {
      v95 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v95, (CFNotificationName)kAXSAppleTVRemoteForceLiveTVButtonsEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSAppleTVRemoteForceLiveTVButtonsEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.AppleTVRemoteClickpadTapsForDirectionalNavigationEnabled")))
  {
    _kAXSCacheAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled = _getBooleanPreference((const __CFString *)kAXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabledPreference, 0);
    if (kAXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabledNotification)
    {
      v96 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v96, (CFNotificationName)kAXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.AppleTVScaledUIEnabled")))
  {
    _kAXSCacheAppleTVScaledUIEnabled = _getBooleanPreference((const __CFString *)kAXSAppleTVScaledUIEnabledPreference, 0);
    if (kAXSAppleTVScaledUIEnabledNotification)
    {
      v97 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v97, (CFNotificationName)kAXSAppleTVScaledUIEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSAppleTVScaledUIEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.AutomaticSubtitlesShowWhenLanguageMismatch")))
  {
    _kAXSCacheAutomaticSubtitlesShowWhenLanguageMismatch = _getBooleanPreference((const __CFString *)kAXSAutomaticSubtitlesShowWhenLanguageMismatchPreference, 0);
    if (kAXSAutomaticSubtitlesShowWhenLanguageMismatchEnabledNotification)
    {
      v98 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v98, (CFNotificationName)kAXSAutomaticSubtitlesShowWhenLanguageMismatchEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSAutomaticSubtitlesShowWhenLanguageMismatchEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.AutomationSubtitlesShowOnSkipBack")))
  {
    _kAXSCacheAutomaticSubtitlesShowOnSkipBack = _getBooleanPreference((const __CFString *)kAXSAutomaticSubtitlesShowOnSkipBackPreference, 0);
    if (kAXSAutomaticSubtitlesShowOnSkipBackEnabledNotification)
    {
      v99 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v99, (CFNotificationName)kAXSAutomaticSubtitlesShowOnSkipBackEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSAutomaticSubtitlesShowOnSkipBackEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.AutomationSubtitlesShowWhenMuted")))
  {
    _kAXSCacheAutomaticSubtitlesShowWhenMuted = _getBooleanPreference((const __CFString *)kAXSAutomaticSubtitlesShowWhenMutedPreference, 0);
    if (kAXSAutomaticSubtitlesShowWhenMutedEnabledNotification)
    {
      v100 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v100, (CFNotificationName)kAXSAutomaticSubtitlesShowWhenMutedEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSAutomaticSubtitlesShowWhenMutedEnabledNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.show.audio.transcriptions")))
  {
    _kAXSCacheShowAudioTranscriptionsEnabled = _getBooleanPreference((const __CFString *)kAXSShowAudioTranscriptionsEnabled, 0);
    if (kAXSShowAudioTranscriptionsChangedNotification)
    {
      v101 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v101, (CFNotificationName)kAXSShowAudioTranscriptionsChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSShowAudioTranscriptionsChangedNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.live.headphone.level.enabled")))
  {
    _kAXSCacheLiveHeadphoneLevelEnabled = _getBooleanPreference((const __CFString *)kAXSLiveHeadphoneLevelEnabledPreference, 0);
    if (kAXSLiveHeadphoneLevelEnabledDidChangeNotification)
    {
      v102 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v102, (CFNotificationName)kAXSLiveHeadphoneLevelEnabledDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSLiveHeadphoneLevelEnabledDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("_AXNotification_AXSEnabledSoundDetectionState")))
  {
    _kAXSCacheSoundDetectionState = _getBooleanPreference((const __CFString *)kAXSEnabledSoundDetectionStatePreference, 0);
    if (kAXSSoundDetectionStateDidChangeNotification)
    {
      v103 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v103, (CFNotificationName)kAXSSoundDetectionStateDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSSoundDetectionStateDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.watch.typetosiri.enabled")))
  {
    _kAXSCacheWatchTypeToSiriEnabled = _getBooleanPreference((const __CFString *)kAXSWatchTypeToSiriEnabledPreference, 0);
    if (kAXSWatchTypeToSiriEnabledDidChangeNotification)
    {
      v104 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v104, (CFNotificationName)kAXSWatchTypeToSiriEnabledDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSWatchTypeToSiriEnabledDidChangeNotification;
        goto LABEL_15;
      }
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.watch.quickactions.state")))
  {
    v105 = _AXSWatchQuickActionsEnabled();
    if (!CFEqual(*v3, CFSTR("com.apple.accessibility.cache.watch.quickactions.state")))
      goto LABEL_558;
    v210 = 1;
    v106 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSWatchQuickActionsStatePreference, 0, &v210);
    v107 = v106;
    if (v210 && v106)
    {
      v108 = CFGetTypeID(v106);
      if (v108 == CFNumberGetTypeID())
      {
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v107, kCFNumberIntType, buf);
        _kAXSCacheWatchQuickActionsState = *(_DWORD *)buf;
      }
    }
    else if (!v106)
    {
LABEL_536:
      if (kAXSWatchQuickActionsStateDidChangeNotification)
      {
        v112 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v112, (CFNotificationName)kAXSWatchQuickActionsStateDidChangeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          v115 = CFNotificationCenterGetDarwinNotifyCenter();
          v116 = (const __CFString *)kAXSWatchQuickActionsStateDidChangeNotification;
LABEL_557:
          CFNotificationCenterPostNotification(v115, v116, 0, 0, 1u);
          goto LABEL_558;
        }
      }
      goto LABEL_558;
    }
    CFRelease(v107);
    goto LABEL_536;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.watch.quickactions.banner.appearance")))
  {
    v210 = 1;
    v109 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSWatchQuickActionBannerAppearancePreference, 0, &v210);
    v110 = v109;
    if (v210 && v109)
    {
      v111 = CFGetTypeID(v109);
      if (v111 == CFNumberGetTypeID())
      {
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v110, kCFNumberIntType, buf);
        _kAXSCacheWatchQuickActionBannerAppearance = *(_DWORD *)buf;
      }
    }
    else if (!v109)
    {
LABEL_546:
      if (kAXSWatchQuickActionBannerAppearanceDidChangeNotification)
      {
        v114 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v114, (CFNotificationName)kAXSWatchQuickActionBannerAppearanceDidChangeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSWatchQuickActionBannerAppearanceDidChangeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    CFRelease(v110);
    goto LABEL_546;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.watch.control.enabled")))
  {
    v105 = _AXSWatchQuickActionsEnabled();
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.watch.control.enabled")))
    {
      _kAXSCacheWatchControlEnabled = _getBooleanPreference((const __CFString *)kAXSWatchControlEnabledPreference, 0);
      if (kAXSWatchControlEnabledDidChangeNotification)
      {
        v113 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v113, (CFNotificationName)kAXSWatchControlEnabledDidChangeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          v115 = CFNotificationCenterGetDarwinNotifyCenter();
          v116 = (const __CFString *)kAXSWatchControlEnabledDidChangeNotification;
          goto LABEL_557;
        }
      }
    }
LABEL_558:
    if (v105 != _AXSWatchQuickActionsEnabled())
    {
      DarwinNotifyCenter = CFNotificationCenterGetLocalCenter();
      v12 = (const __CFString *)kAXSWatchQuickActionsEnabledDidChangeNotification;
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.rosebud.logging.enabled")))
  {
    _kAXSCacheRosebudLoggingEnabled = _getBooleanPreference((const __CFString *)kAXSRosebudLoggingEnabledPreference, 0);
    goto LABEL_6;
  }
  if (!CFEqual(*v3, CFSTR("com.apple.accessibility.cache.speech.synth.options")))
  {
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.twice.remote.screen.enabled")))
    {
      _kAXSCacheTwiceRemoteScreenEnabled = _getBooleanPreference((const __CFString *)kAXSTwiceRemoteScreenEnabledPreference, 0);
      if (kAXSTwiceRemoteScreenNotification)
      {
        v120 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v120, (CFNotificationName)kAXSTwiceRemoteScreenNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSTwiceRemoteScreenNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.twice.remote.screen.platform")))
    {
      _kAXSCacheTwiceRemoteScreenPlatform = _getBooleanPreference((const __CFString *)kAXSTwiceRemoteScreenPlatformPreference, 0);
      if (kAXSTwiceRemoteScreenPlatformNotification)
      {
        v121 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v121, (CFNotificationName)kAXSTwiceRemoteScreenPlatformNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSTwiceRemoteScreenPlatformNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.carplay.enhance.text.legibility")))
    {
      _kAXSCacheCarPlayEnhanceTextLegibility = _getBooleanPreference(CFSTR("CarPlayEnhancedTextLegibilityEnabled"), 0);
      if (kAXSCarPlayEnhanceTextLegibilityChangedNotification)
      {
        v122 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v122, (CFNotificationName)kAXSCarPlayEnhanceTextLegibilityChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSCarPlayEnhanceTextLegibilityChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pse.mitigation")))
    {
      _kAXSCachePhotosensitiveMitigationEnabled = _getBooleanPreference(CFSTR("PhotosensitiveMitigation"), 0);
      if (kAXSPhotosensitiveMitigationEnabledNotification)
      {
        v123 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v123, (CFNotificationName)kAXSPhotosensitiveMitigationEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSPhotosensitiveMitigationEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pse.visual.debugging")))
    {
      _kAXSCachePhotosensitiveVisualDebuggingEnabled = _getBooleanPreference(CFSTR("PhotosensitiveVisualDebugging"), 0);
      if (kAXSPhotosensitiveVisualDebuggingEnabledNotification)
      {
        v124 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v124, (CFNotificationName)kAXSPhotosensitiveVisualDebuggingEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSPhotosensitiveVisualDebuggingEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pse.source.copy.debugging")))
    {
      _kAXSCachePhotosensitiveSourceCopyDebuggingEnabled = _getBooleanPreference(CFSTR("PhotosensitiveSourceCopyDebugging"), 0);
      if (kAXSPhotosensitiveSourceCopyDebuggingEnabledNotification)
      {
        v125 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v125, (CFNotificationName)kAXSPhotosensitiveSourceCopyDebuggingEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSPhotosensitiveSourceCopyDebuggingEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.ax"))
      || CFEqual(*v3, CFSTR("com.apple.accessibility.cache.app.ax")))
    {
      pthread_mutex_lock(&_AXSAccessibilityEnabledLock);
      _kAXSCacheAccessibilityEnabled = _getBooleanPreference((const __CFString *)kAXSAccessibilityEnabledPreference, 0);
      _kAXSCacheApplicationAccessibilityEnabled = _getBooleanPreference((const __CFString *)kAXSApplicationAccessibilityEnabledPreference, 0);
      AXSupportLogCommon();
      v126 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
      {
        v127 = CFEqual(*v3, CFSTR("com.apple.accessibility.cache.app.ax"));
        *(_DWORD *)buf = 67109632;
        v214 = v127;
        v215 = 1024;
        v216 = _kAXSCacheAccessibilityEnabled;
        v217 = 1024;
        v218 = _kAXSCacheApplicationAccessibilityEnabled;
        _os_log_impl(&dword_18F1A7000, v126, OS_LOG_TYPE_INFO, "Update on AX Enabled Notification, App Notification: %d, AX Enabled: %d, AX App Enabled: %d", buf, 0x14u);
      }

      pthread_mutex_unlock(&_AXSAccessibilityEnabledLock);
      if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.ax")))
      {
        v128 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v128, (CFNotificationName)kAXSAccessibilityEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSAccessibilityEnabledNotification;
          goto LABEL_15;
        }
      }
      else if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.app.ax")))
      {
        v130 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v130, (CFNotificationName)kAXSApplicationAccessibilityEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSApplicationAccessibilityEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.large.text.change")))
    {
      _kAXSCachedPreferredFontSize = _getFloatPreference((const __CFString *)kAXSPreferredFontSizePreference, 0, 0);
      if (kAXSPreferredFontSizeChangedNotification)
      {
        v129 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v129, (CFNotificationName)kAXSPreferredFontSizeChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSPreferredFontSizeChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.vot.speaking.rate")))
    {
      _getFloatPreference((const __CFString *)kAXSVoiceOverTouchSpeakingRatePreference, 0, 0);
      if (kAXSVoiceOverTouchSpeakingRateChangedNotification)
      {
        v131 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v131, (CFNotificationName)kAXSVoiceOverTouchSpeakingRateChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSVoiceOverTouchSpeakingRateChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.vot.volume")))
    {
      _kAXSCachedVoiceOverVolume = _getFloatPreference((const __CFString *)kAXSVoiceOverTouchVolumePreference, 0, 0);
      if (kAXSVoiceOverTouchVolumeChangedNotification)
      {
        v132 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v132, (CFNotificationName)kAXSVoiceOverTouchVolumeChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSVoiceOverTouchVolumeChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.guided.access")))
    {
      _kAXSCacheGuidedAccessEnabled = _getBooleanPreference((const __CFString *)kAXSGuidedAccessEnabledPreference, 0);
      if (!kAXSGuidedAccessEnabledNotification)
        goto LABEL_6;
      v133 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v133, (CFNotificationName)kAXSGuidedAccessEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken == -1)
        goto LABEL_661;
      goto LABEL_660;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.gax.haspasscode")))
    {
      _kAXSCacheGuidedAccessHasPasscode = _getBooleanPreference((const __CFString *)kAXSGuidedAccessHasPasscodePreference, 0);
      if (kAXSGuidedAccessHasPasscodeNotification)
      {
        v134 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v134, (CFNotificationName)kAXSGuidedAccessHasPasscodeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSGuidedAccessHasPasscodeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.guided.access.via.mdm")))
    {
      _kAXSCacheGuidedAccessEnabledByManagedConfiguration = _getBooleanPreference((const __CFString *)kAXSGuidedAccessEnabledByManagedConfigurationPreference, 0);
      if (!kAXSGuidedAccessEnabledNotification)
        goto LABEL_6;
      v135 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v135, (CFNotificationName)kAXSGuidedAccessEnabledNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken == -1)
        goto LABEL_661;
LABEL_660:
      dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
LABEL_661:
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSGuidedAccessEnabledNotification;
        goto LABEL_15;
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.zoom.speakunderfinger")))
    {
      _kAXSCacheZoomSpeakUnderFingerEnabled = _getBooleanPreference((const __CFString *)kAXSZoomSpeakUnderFingerEnabledPreference, 0);
      if (kAXSZoomSpeakUnderFingerEnabledNotification)
      {
        v136 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v136, (CFNotificationName)kAXSZoomSpeakUnderFingerEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSZoomSpeakUnderFingerEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.zoom.smoothscaling")))
    {
      _kAXSCacheZoomTouchSmoothScalingDisabled = _getBooleanPreference((const __CFString *)kAXSZoomTouchSmoothScalingPreference, 0);
      if (kAXSZoomTouchSmoothScalingNotification)
      {
        v137 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v137, (CFNotificationName)kAXSZoomTouchSmoothScalingNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSZoomTouchSmoothScalingNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.zoom.readyForObservers")))
    {
      _kAXSCacheZoomTouchReadyForObservers = _getBooleanPreference((const __CFString *)kAXSZoomTouchReadyForObserversPreference, 0);
      if (kAXSZoomTouchReadyForObserversNotification)
      {
        v138 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v138, (CFNotificationName)kAXSZoomTouchReadyForObserversNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSZoomTouchReadyForObserversNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.switch.control")))
    {
      _kAXSCacheSwitchControlEnabled = _getBooleanPreference((const __CFString *)kAXSAssistiveTouchScannerEnabledPreference, 0);
      if (kAXSAssistiveTouchScannerEnabledNotification)
      {
        v139 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v139, (CFNotificationName)kAXSAssistiveTouchScannerEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSAssistiveTouchScannerEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.dwell.control")))
    {
      _kAXSCacheDwellControlEnabled = _getBooleanPreference((const __CFString *)kAXSDwellControlEnabledPreference, 0);
      if (kAXSDwellControlEnabledNotification)
      {
        v140 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v140, (CFNotificationName)kAXSDwellControlEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSDwellControlEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.clarityui")))
    {
      _kAXSCacheClarityUIEnabled = _getBooleanPreference((const __CFString *)kAXSClarityUIEnabledPreference, 0);
      if (kAXSClarityUIEnabledNotification)
      {
        v141 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v141, (CFNotificationName)kAXSClarityUIEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSClarityUIEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.command.and.control")))
    {
      _kAXSCacheCommandAndControlEnabled = _getBooleanPreference((const __CFString *)kAXSCommandAndControlEnabledPreference, 0);
      if (kAXSCommandAndControlEnabledNotification)
      {
        v142 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v142, (CFNotificationName)kAXSCommandAndControlEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSCommandAndControlEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.command.and.control.carplay")))
    {
      _kAXSCacheCommandAndControlCarPlayEnabled = _getBooleanPreference((const __CFString *)kAXSCommandAndControlCarPlayEnabledPreference, 0);
      if (kAXSCommandAndControlCarPlayEnabledNotification)
      {
        v143 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v143, (CFNotificationName)kAXSCommandAndControlCarPlayEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSCommandAndControlCarPlayEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.speak.this")))
    {
      _kAXSCacheSpeakThisEnabled = _getBooleanPreference((const __CFString *)kAXSSpeakThisEnabledPreference, 0);
      if (kAXSSpeakThisEnabledNotification)
      {
        v144 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v144, (CFNotificationName)kAXSSpeakThisEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSSpeakThisEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.speak.this.highlight.visible")))
    {
      _kAXSCacheSpeakThisHighlightVisible = _getBooleanPreference((const __CFString *)kAXSSpeakThisHighlightVisiblePreference, 0);
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.generic.accessibility.client")))
    {
      _kAXSCacheGenericAccessibilityClientEnabled = _getBooleanPreference((const __CFString *)kAXSGenericAccessibilityClientEnabledPreference, 0);
      if (kAXSGenericAccessibilityClientEnabledNotification)
      {
        v145 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v145, (CFNotificationName)kAXSGenericAccessibilityClientEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSGenericAccessibilityClientEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.needs.camera.cache")))
    {
      _kAXSCacheNeedsCameraOnLockScreen = _getBooleanPreference((const __CFString *)kAXSAccessibilityNeedsCameraOnLockScreenPreference, 0);
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.needs.microphone.cache")))
    {
      _kAXSCacheNeedsMicrophoneOnLockScreen = _getBooleanPreference((const __CFString *)kAXSAccessibilityNeedsMicrophoneOnLockScreenPreference, 0);
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.full.keyboard.access")))
    {
      _kAXSCacheFullKeyboardAccessEnabled = _getBooleanPreference((const __CFString *)kAXSFullKeyboardAccessEnabledPreference, 0);
      if (kAXSFullKeyboardAccessEnabledNotification)
      {
        v146 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v146, (CFNotificationName)kAXSFullKeyboardAccessEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSFullKeyboardAccessEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.full.keyboard.access.focus.ring")))
    {
      _kAXSCacheFullKeyboardAccessFocusRingEnabled = _getBooleanPreference((const __CFString *)kAXSFullKeyboardAccessFocusRingEnabledPreference, 0);
      if (kAXSFullKeyboardAccessFocusRingEnabledNotification)
      {
        v147 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v147, (CFNotificationName)kAXSFullKeyboardAccessFocusRingEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSFullKeyboardAccessFocusRingEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.full.keyboard.access.passthrough.mode")))
    {
      _kAXSCacheFullKeyboardAccessPassthroughModeEnabled = _getBooleanPreference((const __CFString *)kAXSFullKeyboardAccessPassthroughModeEnabledPreference, 0);
      if (kAXSFullKeyboardAccessPassthroughModeEnabledNotification)
      {
        v148 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v148, (CFNotificationName)kAXSFullKeyboardAccessPassthroughModeEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSFullKeyboardAccessPassthroughModeEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("_AXSCacheLiveTranscriptionNotification")))
    {
      _kAXSCacheLiveTranscriptionEnabled = _getBooleanPreference((const __CFString *)kAXSLiveTranscriptionEnabledPreference, 0);
      if (kAXSLiveTranscriptionEnabledDidChangeNotification)
      {
        v149 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v149, (CFNotificationName)kAXSLiveTranscriptionEnabledDidChangeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSLiveTranscriptionEnabledDidChangeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.ui.focus.ring")))
    {
      _kAXSCacheUIFocusRingEnabled = _getBooleanPreference((const __CFString *)kAXSUIFocusRingEnabledPreference, 0);
      if (kAXSUIFocusRingEnabledNotification)
      {
        v150 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v150, (CFNotificationName)kAXSUIFocusRingEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSUIFocusRingEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.non.blinking.cursor.status")))
    {
      _kAXSCachePrefersNonBlinkingCursorIndicator = _getBooleanPreference((const __CFString *)kAXSPrefersNonBlinkingCursorIndicatorPreference, 0);
      if (kAXSPrefersNonBlinkingCursorIndicatorDidChangeNotification)
      {
        v151 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v151, (CFNotificationName)kAXSPrefersNonBlinkingCursorIndicatorDidChangeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSPrefersNonBlinkingCursorIndicatorDidChangeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.prefers.horizontal.text")))
    {
      v5 = (const __CFString *)kAXSPrefersHorizontalTextPreference;
      v6 = (const __CFString *)kAXSPrefersHorizontalTextNotification;
      v7 = (int *)&_kAXSCachePrefersHorizontalText;
      goto LABEL_5;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.SpatialAudioHeadTracking.notification")))
    {
      v210 = 1;
      v152 = (const __CFNumber *)_copyValuePreferenceApp(CFSTR("AXSSpatialAudioHeadTracking"), 0, &v210);
      v153 = v152;
      if (v210 && v152)
      {
        v154 = CFGetTypeID(v152);
        if (v154 == CFNumberGetTypeID())
        {
          *(_DWORD *)buf = 0;
          CFNumberGetValue(v153, kCFNumberIntType, buf);
          _kAXSCacheSpatialAudioHeadTracking = *(int *)buf;
        }
      }
      else if (!v152)
      {
        goto LABEL_797;
      }
      CFRelease(v153);
LABEL_797:
      if (!kAXSAirPodSpatialAudioLockToDeviceChangedNotification)
        goto LABEL_6;
      v156 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v156, (CFNotificationName)kAXSAirPodSpatialAudioLockToDeviceChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken == -1)
        goto LABEL_805;
LABEL_804:
      dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
LABEL_805:
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        v12 = (const __CFString *)kAXSAirPodSpatialAudioLockToDeviceChangedNotification;
        goto LABEL_15;
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.airpod.spatial.audio.lock.to.device")))
    {
      _kAXSCacheAirPodsSpatialAudioLockToDeviceEnabled = _getBooleanPreference(CFSTR("AXSAirPodsSpatialAudioLockToDevice"), 0);
      if (!kAXSAirPodSpatialAudioLockToDeviceChangedNotification)
        goto LABEL_6;
      v155 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v155, (CFNotificationName)kAXSAirPodSpatialAudioLockToDeviceChangedNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken == -1)
        goto LABEL_805;
      goto LABEL_804;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.pencil.extended.squeeze.range")))
    {
      _kAXSCachePencilExtendedSqueezeRangeEnabled = _getBooleanPreference(CFSTR("AXSPencilExtendedSqueezeRangeEnabledPreference"), 0);
      if (kAXSPencilExtendedSqueezeRangeEnabledChangedNotification)
      {
        v157 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v157, (CFNotificationName)kAXSPencilExtendedSqueezeRangeEnabledChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSPencilExtendedSqueezeRangeEnabledChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.captioning")))
    {
      DarwinNotifyCenter = CFNotificationCenterGetLocalCenter();
      v12 = (const __CFString *)kAXSClosedCaptioningChangedNotification;
      goto LABEL_15;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.vo.usage.confirm")))
    {
      _kAXSCacheVoiceOverUsageConfirmation = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchUsageConfirmedPreference, 0);
      if (kAXSVoiceOverTouchUsageConfirmedNotification)
      {
        v158 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v158, (CFNotificationName)kAXSVoiceOverTouchUsageConfirmedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSVoiceOverTouchUsageConfirmedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.vo.user.has.read.no.home.button.gesture")))
    {
      _kAXSCacheVOTUserHasReadNoHomeButtonGesture = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchUserHasReadNoHomeButtonGesturePreference, 0);
      if (kAXSVoiceOverTouchUserHasReadNoHomeButtonGestureNotification)
      {
        v159 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v159, (CFNotificationName)kAXSVoiceOverTouchUserHasReadNoHomeButtonGestureNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSVoiceOverTouchUserHasReadNoHomeButtonGestureNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.vo.screen.curtain")))
    {
      _kAXSCacheVoiceOverScreenCurtain = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchScreenCurtainPreference, 0);
      if (kAXSVoiceOverTouchScreenCurtainNotification)
      {
        v160 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v160, (CFNotificationName)kAXSVoiceOverTouchScreenCurtainNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSVoiceOverTouchScreenCurtainNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.automation.localized.lookup")))
    {
      _kAXSCacheAutomationLocalizedStringLookup = _getBooleanPreference((const __CFString *)kAXSAutomationLocalizedStringLookupInfoEnabledPreference, 0);
      if (_kAXSAutomationLocalizedStringLookupInfoEnabledNotification)
      {
        v161 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v161, (CFNotificationName)_kAXSAutomationLocalizedStringLookupInfoEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)_kAXSAutomationLocalizedStringLookupInfoEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.resting.home.button.unlock")))
    {
      _kAXSCacheRestingHomeButtonUnlockEnabled = _getBooleanPreference((const __CFString *)kAXSRestingHomeButtonUnlockPreference, 0);
      if (kAXSRestingHomeButtonUnlockEnabledNotification)
      {
        v162 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v162, (CFNotificationName)kAXSRestingHomeButtonUnlockEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSRestingHomeButtonUnlockEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.passcode.purchases")))
    {
      _kAXSCachePasscodeForPurchases = _getBooleanPreference((const __CFString *)kAXSPasscodeForPurchasesPreference, 0);
      if (kAXSCachePasscodeForPurchasesNotification)
      {
        v163 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v163, (CFNotificationName)kAXSCachePasscodeForPurchasesNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSCachePasscodeForPurchasesNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.resting.pearl.unlock")))
    {
      _kAXSCacheRestingPearlUnlockEnabled = _getBooleanPreference((const __CFString *)kAXSRestingPearlUnlockPreference, 0);
      if (kAXSRestingPearlUnlockEnabledNotification)
      {
        v164 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v164, (CFNotificationName)kAXSRestingPearlUnlockEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSRestingPearlUnlockEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.perl.auth.haptics")))
    {
      _kAXSCachePearlAuthenticationHapticsEnabled = _getBooleanPreference((const __CFString *)kAXSPearlAuthenticationHapticsPreference, 0);
      if (kAXSPearlAuthenticationHapticsEnabledNotification)
      {
        v165 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v165, (CFNotificationName)kAXSPearlAuthenticationHapticsEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSPearlAuthenticationHapticsEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.attention.awareness")))
    {
      _kAXSCacheAttentionAwarenessFeaturesEnabled = _getBooleanPreference((const __CFString *)kAXSAttentionAwarenessFeaturesEnabledPreference, 0);
      if (kAXSAttentionAwarenessFeaturesEnabledNotification)
      {
        v166 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v166, (CFNotificationName)kAXSAttentionAwarenessFeaturesEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSAttentionAwarenessFeaturesEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.internal.axinspector")))
    {
      _kAXSCacheAXInspectorEnabled = _getBooleanPreference((const __CFString *)kAXSAXInspectorPreference, 0);
      if (kAXSAXInspectorEnabledNotification)
      {
        v167 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v167, (CFNotificationName)kAXSAXInspectorEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSAXInspectorEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.automation.enabled")))
    {
      _kAXSCacheAutomationEnabled = _getBooleanPreference((const __CFString *)kAXSAutomationEnabledPreference, 0);
      if (kAXSAutomationEnabledNotification)
      {
        v168 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v168, (CFNotificationName)kAXSAutomationEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSAutomationEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.siri.semantic.context.enabled")))
    {
      _kAXSCacheSiriSemanticContextEnabled = _getBooleanPreference((const __CFString *)kAXSSiriSemanticContextEnabledPreference, 0);
      if (kAXSSiriSemanticContextEnabledNotification)
      {
        v169 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v169, (CFNotificationName)kAXSSiriSemanticContextEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSSiriSemanticContextEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.clip.tracer.enabled")))
    {
      _kAXSCacheClipTracerAccessibilityModeEnabled = _getBooleanPreference((const __CFString *)kAXSClipTracerAccessibilityModeEnabledPreference, 0);
      if (kAXSClipTracerAccessibilityModeNotification)
      {
        v170 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v170, (CFNotificationName)kAXSClipTracerAccessibilityModeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSClipTracerAccessibilityModeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.nocturne.enabled")))
    {
      _kAXSCacheNocturneAccessibilityModeEnabled = _getBooleanPreference((const __CFString *)kAXSNocturneAccessibilityModeEnabledPreference, 0);
      if (kAXSNocturneAccessibilityModeNotification)
      {
        v171 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v171, (CFNotificationName)kAXSNocturneAccessibilityModeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSNocturneAccessibilityModeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.audit.inspection.mode")))
    {
      _kAXSCacheAuditInspectionModeModeEnabled = _getBooleanPreference((const __CFString *)kAXSAuditInspectionModeEnabledPreference, 0);
      if (kAXSAuditInspectionModeNotification)
      {
        v172 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v172, (CFNotificationName)kAXSAuditInspectionModeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSAuditInspectionModeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.lower.case.keyboard.enabled")))
    {
      _kAXSCacheLowercaseKeyboardEnabled = _getBooleanPreference((const __CFString *)kAXSLowerCaseKeyboardEnabledPreference, 0);
      if (kAXSLowercaseKeyboardDisplayPreferenceNotification)
      {
        v173 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v173, (CFNotificationName)kAXSLowercaseKeyboardDisplayPreferenceNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSLowercaseKeyboardDisplayPreferenceNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.forcetouch.sensitivity.changed")))
    {
      _kAXSCachedForceTouchSensitivity = _getFloatPreference((const __CFString *)kAXSForceTouchSensitivityPreference, 0, 0);
      if (kAXSForceTouchSensitivityChangedNotification)
      {
        v174 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v174, (CFNotificationName)kAXSForceTouchSensitivityChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSForceTouchSensitivityChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.forcetouch.timing.changed")))
    {
      v210 = 1;
      v175 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSForceTouchTimingPreference, 0, &v210);
      v176 = v175;
      if (v210 && v175)
      {
        v177 = CFGetTypeID(v175);
        if (v177 == CFNumberGetTypeID())
        {
          *(_DWORD *)buf = 0;
          CFNumberGetValue(v176, kCFNumberIntType, buf);
          *(float *)&_kAXSCachedForceTouchTiming = (float)*(int *)buf;
        }
      }
      else if (!v175)
      {
LABEL_942:
        if (kAXSForceTouchTimingChangedNotification)
        {
          v179 = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(v179, (CFNotificationName)kAXSForceTouchTimingChangedNotification, 0, 0, 1u);
          if (_AXSCurrentProcessIsWebContent_onceToken != -1)
            dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
          if (!_AXSCurrentProcessIsWebContent_IsWebContent)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            v12 = (const __CFString *)kAXSForceTouchTimingChangedNotification;
            goto LABEL_15;
          }
        }
        goto LABEL_6;
      }
      CFRelease(v176);
      goto LABEL_942;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.forcetouch.enabled.changed")))
    {
      _kAXSCachedForceTouchEnabled = _getBooleanPreference((const __CFString *)kAXSForceTouchEnabledPreference, 0);
      if (kAXSForceTouchEnabledPreferenceNotification)
      {
        v178 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v178, (CFNotificationName)kAXSForceTouchEnabledPreferenceNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSForceTouchEnabledPreferenceNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.hearing.aid.ringtone.streaming")))
    {
      _kAXSCacheHearingAidRingtonStreamingEnabled = _getBooleanPreference((const __CFString *)kAXSHearingAidRingtoneStreamingPreference, 0);
      if (kAXSHearingAidRingtoneStreamPreferenceChangedNotification)
      {
        v180 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v180, (CFNotificationName)kAXSHearingAidRingtoneStreamPreferenceChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSHearingAidRingtoneStreamPreferenceChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.automation.hitpoint_warping.enabled")))
    {
      _kAXSCacheAutomationHitpointWarpingEnabled = _getBooleanPreference((const __CFString *)kAXSAutomationHitpointWarpingEnabledPreference, 0);
      if (kAXSAutomationHitpointWarpingEnabledNotification)
      {
        v181 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v181, (CFNotificationName)kAXSAutomationHitpointWarpingEnabledNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSAutomationHitpointWarpingEnabledNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.AXSUSBRMDisablersNotification")))
    {
      v210 = 1;
      v182 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSUSBRMDisablersPreference, 0, &v210);
      v183 = v182;
      if (v210 && v182)
      {
        v184 = CFGetTypeID(v182);
        if (v184 == CFNumberGetTypeID())
        {
          *(_DWORD *)buf = 0;
          CFNumberGetValue(v183, kCFNumberIntType, buf);
          _kAXSCacheUSBRMDisablers = *(_DWORD *)buf;
        }
      }
      else if (!v182)
      {
LABEL_976:
        if (kAXSUSBRMDisablersChangedNotification)
        {
          v186 = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(v186, (CFNotificationName)kAXSUSBRMDisablersChangedNotification, 0, 0, 1u);
          if (_AXSCurrentProcessIsWebContent_onceToken != -1)
            dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
          if (!_AXSCurrentProcessIsWebContent_IsWebContent)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            v12 = (const __CFString *)kAXSUSBRMDisablersChangedNotification;
            goto LABEL_15;
          }
        }
        goto LABEL_6;
      }
      CFRelease(v183);
      goto LABEL_976;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.loc.caption.mode.enabled")))
    {
      _kAXSCacheLocalizationCaptionModeEnabled = _getBooleanPreference((const __CFString *)kAXSLocalizationCaptionModeEnabledPreference, 0);
      if (kAXSLocalizationCaptionModeNotification)
      {
        v185 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v185, (CFNotificationName)kAXSLocalizationCaptionModeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSLocalizationCaptionModeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.softwaretty")))
    {
      _kAXSCacheSoftwareTTYEnabled = _getBooleanPreference((const __CFString *)kAXSSoftwareTTYPreference, 0);
      if (kAXSSoftwareTTYChangedNotification)
      {
        v187 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v187, (CFNotificationName)kAXSSoftwareTTYChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSSoftwareTTYChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.homebuttonassistant")))
    {
      v210 = 1;
      v188 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSHomeButtonAssistantPreference, 0, &v210);
      v189 = v188;
      if (v210 && v188)
      {
        v190 = CFGetTypeID(v188);
        if (v190 == CFNumberGetTypeID())
        {
          *(_DWORD *)buf = 0;
          CFNumberGetValue(v189, kCFNumberIntType, buf);
          _kAXSHomeButtonAssistant = *(_DWORD *)buf;
        }
      }
      else if (!v188)
      {
LABEL_1003:
        if (kAXSHomeButtonAssistantChangedNotification)
        {
          v192 = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(v192, (CFNotificationName)kAXSHomeButtonAssistantChangedNotification, 0, 0, 1u);
          if (_AXSCurrentProcessIsWebContent_onceToken != -1)
            dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
          if (!_AXSCurrentProcessIsWebContent_IsWebContent)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            v12 = (const __CFString *)kAXSHomeButtonAssistantChangedNotification;
            goto LABEL_15;
          }
        }
        goto LABEL_6;
      }
      CFRelease(v189);
      goto LABEL_1003;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.switch.control.useextendedkeyboardpredictions")))
    {
      _kAXSCacheSwitchControlUseExtendedKeyboardPredictionsEnabled = _getBooleanPreference((const __CFString *)kAXSSwitchControlUseExtendedKeyboardPredictionsEnabledPreference, 0);
      if (kAXSSwitchControlUseExtendedKeyboardPredictionsChangedNotification)
      {
        v191 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v191, (CFNotificationName)kAXSSwitchControlUseExtendedKeyboardPredictionsChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSSwitchControlUseExtendedKeyboardPredictionsChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.assistivetouch.useextendedkeyboardpredictions")))
    {
      _kAXSCacheAssistiveTouchUseExtendedKeyboardPredictionsEnabled = _getBooleanPreference((const __CFString *)kAXSAssistiveTouchUseExtendedKeyboardPredictionsEnabledPreference, 0);
      if (kAXSAssistiveTouchUseExtendedKeyboardPredictionsChangedNotification)
      {
        v193 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v193, (CFNotificationName)kAXSAssistiveTouchUseExtendedKeyboardPredictionsChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSAssistiveTouchUseExtendedKeyboardPredictionsChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.secure.intent.provider")))
    {
      v210 = 1;
      v194 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSSecureIntentProviderPreference, 0, &v210);
      v195 = v194;
      if (v210 && v194)
      {
        v196 = CFGetTypeID(v194);
        if (v196 == CFNumberGetTypeID())
        {
          *(_DWORD *)buf = 0;
          CFNumberGetValue(v195, kCFNumberIntType, buf);
          _kAXSCacheSecureIntentProviderPreference = *(_DWORD *)buf;
        }
      }
      else if (!v194)
      {
LABEL_1028:
        if (kAXSSecureIntentProviderChangedNotification)
        {
          v197 = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(v197, (CFNotificationName)kAXSSecureIntentProviderChangedNotification, 0, 0, 1u);
          if (_AXSCurrentProcessIsWebContent_onceToken != -1)
            dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
          if (!_AXSCurrentProcessIsWebContent_IsWebContent)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            v12 = (const __CFString *)kAXSSecureIntentProviderChangedNotification;
            goto LABEL_15;
          }
        }
        goto LABEL_6;
      }
      CFRelease(v195);
      goto LABEL_1028;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.hearing.aid.paired")))
    {
      _kAXSCacheHearingAidPaired = _getBooleanPreference((const __CFString *)kAXSHearingAidPairedPreference, 0);
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.performance.testing.mode")))
    {
      _kAXSCacheInPerformanceTestMode = _getBooleanPreference((const __CFString *)kAXSInPerformanceTestModePreference, 0);
      if (kAXSInPerformanceTestModeNotification)
      {
        v198 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v198, (CFNotificationName)kAXSInPerformanceTestModeNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSInPerformanceTestModeNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.FaceTimeCaptions")))
    {
      _kAXSCacheFaceTimeCaptionsEnabled = _getBooleanPreference((const __CFString *)kAXSFaceTimeCaptionsPreference, 0);
      if (kAXFaceTimeCaptionsChangedNotification)
      {
        v199 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v199, (CFNotificationName)kAXFaceTimeCaptionsChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXFaceTimeCaptionsChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.vot.media.ducking.volume")))
    {
      _kAXSCachedVoiceOverMediaDuckingVolume = _getFloatPreference((const __CFString *)kAXSVoiceOverTouchMediaDuckingVolumePreference, 0, 0);
      if (kAXSVoiceOverTouchMediaDuckingVolumeChangedNotification)
      {
        v200 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v200, (CFNotificationName)kAXSVoiceOverTouchMediaDuckingVolumeChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSVoiceOverTouchMediaDuckingVolumeChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    if (!CFEqual(*v3, CFSTR("com.apple.accessibility.cache.vot.media.ducking.mode")))
    {
      if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.vo.usage.tutorial.confirm")))
      {
        _kAXSCacheVoiceOverTutorialUsageConfirmation = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchTutorialUsageConfirmedPreference, 0);
        if (kAXSVoiceOverTouchTutorialUsageConfirmedNotification)
        {
          v204 = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(v204, (CFNotificationName)kAXSVoiceOverTouchTutorialUsageConfirmedNotification, 0, 0, 1u);
          if (_AXSCurrentProcessIsWebContent_onceToken != -1)
            dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
          if (!_AXSCurrentProcessIsWebContent_IsWebContent)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            v12 = (const __CFString *)kAXSVoiceOverTouchTutorialUsageConfirmedNotification;
            goto LABEL_15;
          }
        }
      }
      goto LABEL_6;
    }
    v210 = 1;
    v201 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSVoiceOverTouchMediaDuckingModePreference, 0, &v210);
    v202 = v201;
    if (v210 && v201)
    {
      v203 = CFGetTypeID(v201);
      if (v203 == CFNumberGetTypeID())
      {
        *(_DWORD *)buf = 0;
        CFNumberGetValue(v202, kCFNumberIntType, buf);
        _kAXSCachedVoiceOverMediaDuckingMode = *(int *)buf;
      }
    }
    else if (!v201)
    {
LABEL_1066:
      if (kAXSVoiceOverTouchMediaDuckingModeChangedNotification)
      {
        v205 = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(v205, (CFNotificationName)kAXSVoiceOverTouchMediaDuckingModeChangedNotification, 0, 0, 1u);
        if (_AXSCurrentProcessIsWebContent_onceToken != -1)
          dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
        if (!_AXSCurrentProcessIsWebContent_IsWebContent)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          v12 = (const __CFString *)kAXSVoiceOverTouchMediaDuckingModeChangedNotification;
          goto LABEL_15;
        }
      }
      goto LABEL_6;
    }
    CFRelease(v202);
    goto LABEL_1066;
  }
  v210 = 1;
  v117 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSSpeechSynthesisOptionsPreference, 0, &v210);
  v118 = v117;
  if (v210 && v117)
  {
    v119 = CFGetTypeID(v117);
    if (v119 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v118, kCFNumberIntType, buf);
      _kAXSCacheSpeechSynthesisOptions = *(int *)buf;
    }
  }
  else if (!v117)
  {
    goto LABEL_6;
  }
  CFRelease(v118);
LABEL_6:
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.resting.home.button.unlock")))
  {
    AXSupportLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v214 = _kAXSCacheRestingHomeButtonUnlockEnabled;
      v9 = "Received update for resting unlock: %d";
LABEL_19:
      _os_log_impl(&dword_18F1A7000, v8, OS_LOG_TYPE_INFO, v9, buf, 8u);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.automation.enabled")))
  {
    AXSupportLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v214 = _kAXSCacheAutomationEnabled;
      v9 = "Received update for automation: %d";
      goto LABEL_19;
    }
LABEL_20:

    return;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.HasActive2DBrailleDisplay")))
  {
    _AXSVoiceOverTouchUpdateActive2DBrailleDisplays();
    return;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.speech.settings.disabled.by.mc")))
  {
    _kAXSCacheSpeechSettingsDisabledByManagedConfiguration = _getBooleanPreference((const __CFString *)kAXSSpeechSettingsDisabledByManagedConfigurationPreference, 0);
    v206 = 0u;
    v207 = 0u;
    v208 = 0u;
    v209 = 0u;
    v211[0] = kAXSQuickSpeakEnabledNotification;
    v211[1] = kAXSSpeakThisEnabledNotification;
    v211[2] = kAXSWordFeedbackEnabledNotification;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v211, 3, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v206, v212, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v207;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v207 != v16)
            objc_enumerationMutation(v8);
          v18 = *(const __CFString **)(*((_QWORD *)&v206 + 1) + 8 * i);
          v19 = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(v19, v18, 0, 0, 1u);
          v20 = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(v20, v18, 0, 0, 1u);
        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v206, v212, 16);
      }
      while (v15);
    }
    goto LABEL_20;
  }
  if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.increase.brightness.floor.enabled")))
  {
    _kAXSCacheIncreaseBrightnessFloorEnabled = _getBooleanPreference((const __CFString *)kAXSIncreaseBrightnessFloorEnabledPreference, 0);
    if (kAXSIncreaseBrightnessFloorEnabledDidChangeNotification)
    {
      v22 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v22, (CFNotificationName)kAXSIncreaseBrightnessFloorEnabledDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        v23 = CFNotificationCenterGetDarwinNotifyCenter();
        v24 = (const __CFString *)kAXSIncreaseBrightnessFloorEnabledDidChangeNotification;
LABEL_65:
        CFNotificationCenterPostNotification(v23, v24, 0, 0, 1u);
      }
    }
  }
  else if (CFEqual(*v3, CFSTR("com.apple.accessibility.cache.mix.to.uplink.notification")))
  {
    _kAXSCacheAllowsMixToUplink = _getBooleanPreference(CFSTR("AXSAllowsMixToUplinkPreference"), 0);
    if (kAXSAllowsMixToUplinkDidChangeNotification)
    {
      v26 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v26, (CFNotificationName)kAXSAllowsMixToUplinkDidChangeNotification, 0, 0, 1u);
      if (_AXSCurrentProcessIsWebContent_onceToken != -1)
        dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
      if (!_AXSCurrentProcessIsWebContent_IsWebContent)
      {
        v23 = CFNotificationCenterGetDarwinNotifyCenter();
        v24 = (const __CFString *)kAXSAllowsMixToUplinkDidChangeNotification;
        goto LABEL_65;
      }
    }
  }
}

void _invalidateAllCacheSmartInvertPreferences()
{
  id v0;

  cachedSmartInvertPreferences();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_1661);

}

void ___invalidateAllCacheSmartInvertPreferences_block_invoke(uint64_t a1, uint64_t a2)
{
  _invalidateCacheSmartInvertPreference(a2);
}

void _invalidateCacheSmartInvertPreference(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  cachedSmartInvertPreferences();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", &unk_1E2941A58, a1);

  AXSupportLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    _invalidateCacheSmartInvertPreference_cold_1();

}

uint64_t _handlePrefsChangedNotification()
{
  if (_AXSAccessibilityPreferenceDomain_onceToken != -1)
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1076);
  return CFPreferencesAppSynchronize((CFStringRef)_AXSAccessibilityPreferenceDomain_Domain);
}

void _handlePreferenceChangeWithLocalNotification(const __CFString *a1)
{
  __CFNotificationCenter *LocalCenter;

  if (_AXSAccessibilityPreferenceDomain_onceToken != -1)
    dispatch_once(&_AXSAccessibilityPreferenceDomain_onceToken, &__block_literal_global_1076);
  CFPreferencesAppSynchronize((CFStringRef)_AXSAccessibilityPreferenceDomain_Domain);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, a1, 0, 0, 1u);
}

void ___computedTripleClickOptions_block_invoke()
{
  void *v0;

  v0 = (void *)_computedTripleClickOptions_ComputedOptions;
  _computedTripleClickOptions_ComputedOptions = (uint64_t)&unk_1E2941AF0;

}

uint64_t _fetchCachePreference(const __CFString *a1, const __CFString *a2, int *p_valuePtr, int *a4)
{
  int v7;
  const __CFNumber *NumberPreference;
  NSObject *v9;
  const __CFNumber *v11;
  NSObject *v12;
  int valuePtr;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  valuePtr = -1;
  if (a4)
  {
    v7 = *a4;
    valuePtr = *a4;
  }
  else
  {
    NumberPreference = (const __CFNumber *)_getNumberPreference(a1, a2);
    if (!NumberPreference)
      goto LABEL_9;
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    AXSupportLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v15 = a2;
      v16 = 2112;
      v17 = a1;
      v18 = 1024;
      v19 = valuePtr;
      _os_log_debug_impl(&dword_18F1A7000, v9, OS_LOG_TYPE_DEBUG, "Read Local: appID = %@, preference = %@, result = %d (-1 - empty, 0 - false, 1 - true)", buf, 0x1Cu);
    }

    v7 = valuePtr;
  }
  if (v7 != -1)
  {
LABEL_8:
    p_valuePtr = &valuePtr;
    goto LABEL_10;
  }
LABEL_9:
  if (!p_valuePtr)
  {
    v11 = (const __CFNumber *)_getNumberPreference(a1, 0);
    if (v11)
    {
      CFNumberGetValue(v11, kCFNumberIntType, &valuePtr);
      AXSupportLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v15 = a2;
        v16 = 2112;
        v17 = a1;
        v18 = 1024;
        v19 = valuePtr;
        _os_log_debug_impl(&dword_18F1A7000, v12, OS_LOG_TYPE_DEBUG, "Read Global: appID = %@, preference = %@, result = %d (-1 - empty, 0 - false, 1 - true)", buf, 0x1Cu);
      }

    }
    goto LABEL_8;
  }
LABEL_10:
  if (*p_valuePtr == -1)
    return 0;
  else
    return *p_valuePtr;
}

void ___updateInvertColorsValueFromMediaAccessibility_block_invoke()
{
  _setPreferenceAppWithNotification((const __CFString *)kAXSInvertColorsEnabledPreference, 0, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", _kAXSCacheInvertColors), 0);
  _updateAccessibilitySettings();
}

void __cachedSmartInvertPreferences_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)cachedSmartInvertPreferences_CachedSmartInvertPreferences;
  cachedSmartInvertPreferences_CachedSmartInvertPreferences = v0;

}

Class __getLSApplicationRecordClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E293A0F0;
    v5 = 0;
    CoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreServicesLibraryCore_frameworkLibrary)
    __getLSApplicationRecordClass_block_invoke_cold_1(&v3);
  result = objc_getClass("LSApplicationRecord");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLSApplicationRecordClass_block_invoke_cold_2();
  getLSApplicationRecordClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void postNotification(const __CFString *a1)
{
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (a1)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, a1, 0, 0, 1u);
    if (_AXSCurrentProcessIsWebContent_onceToken != -1)
      dispatch_once(&_AXSCurrentProcessIsWebContent_onceToken, &__block_literal_global_1561);
    if (!_AXSCurrentProcessIsWebContent_IsWebContent)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, a1, 0, 0, 1u);
    }
  }
}

Class __getAXBuddyDataPackageClass_block_invoke(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary();
  result = objc_getClass("AXBuddyDataPackage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXBuddyDataPackageClass_block_invoke_cold_1();
  getAXBuddyDataPackageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x1Cu);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

uint64_t AXRuntimeCheck_HasANE()
{
  if (AXRuntimeCheck_HasANE_onceToken != -1)
    dispatch_once(&AXRuntimeCheck_HasANE_onceToken, &__block_literal_global_3);
  return AXRuntimeCheck_HasANE__hasANE;
}

id get_ANEDeviceInfoClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_ANEDeviceInfoClass_softClass;
  v7 = get_ANEDeviceInfoClass_softClass;
  if (!get_ANEDeviceInfoClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __get_ANEDeviceInfoClass_block_invoke;
    v3[3] = &unk_1E2939F70;
    v3[4] = &v4;
    __get_ANEDeviceInfoClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18F1CC2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXRuntimeCheck_isANEDeviceH13plus()
{
  if (AXRuntimeCheck_isANEDeviceH13plus_onceToken != -1)
    dispatch_once(&AXRuntimeCheck_isANEDeviceH13plus_onceToken, &__block_literal_global_1);
  return AXRuntimeCheck_isANEDeviceH13plus_isANEH13plus;
}

uint64_t AXRuntimeCheck_SupportsMedina()
{
  if (AXRuntimeCheck_SupportsMedina_onceToken != -1)
    dispatch_once(&AXRuntimeCheck_SupportsMedina_onceToken, &__block_literal_global_3_0);
  return AXRuntimeCheck_SupportsMedina__supportsMedina;
}

void sub_18F1CC508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXRuntimeCheck_SupportsNearbyDeviceControl()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    return AXDeviceIsPhone() || AXDeviceIsPod() || AXDeviceIsWatch();
  return result;
}

uint64_t AXRuntimeCheck_SupportsMacAXV2()
{
  if (AXRuntimeCheck_SupportsMacAXV2_onceToken != -1)
    dispatch_once(&AXRuntimeCheck_SupportsMacAXV2_onceToken, &__block_literal_global_8);
  return AXRuntimeCheck_SupportsMacAXV2__supportsMacAXV2;
}

uint64_t AXRuntimeCheck_VoiceOverSupportsNeuralVoices()
{
  if (AXRuntimeCheck_VoiceOverSupportsNeuralVoices_onceToken != -1)
    dispatch_once(&AXRuntimeCheck_VoiceOverSupportsNeuralVoices_onceToken, &__block_literal_global_10);
  return AXRuntimeCheck_VoiceOverSupportsNeuralVoices__supportsMacAXV2;
}

BOOL AXRuntimeCheck_MauiSSE()
{
  if (AXRuntimeCheck_MauiSSE_onceToken != -1)
    dispatch_once(&AXRuntimeCheck_MauiSSE_onceToken, &__block_literal_global_12);
  if (AXRuntimeCheck_MauiSSE__mauiSSE)
    return 1;
  if (AXRuntimeCheck_MauiSSEOnly_onceToken_MauiSSEOnly != -1)
    dispatch_once(&AXRuntimeCheck_MauiSSEOnly_onceToken_MauiSSEOnly, &__block_literal_global_16);
  return AXRuntimeCheck_MauiSSEOnly__ffEnabled_MauiSSEOnly != 0;
}

uint64_t AXRuntimeCheck_MauiSSEOnly()
{
  if (AXRuntimeCheck_MauiSSEOnly_onceToken_MauiSSEOnly != -1)
    dispatch_once(&AXRuntimeCheck_MauiSSEOnly_onceToken_MauiSSEOnly, &__block_literal_global_16);
  return AXRuntimeCheck_MauiSSEOnly__ffEnabled_MauiSSEOnly;
}

uint64_t AXRuntimeCheck_PerVoiceSettings()
{
  if (AXRuntimeCheck_PerVoiceSettings_onceToken_PerVoiceSettings != -1)
    dispatch_once(&AXRuntimeCheck_PerVoiceSettings_onceToken_PerVoiceSettings, &__block_literal_global_14);
  return AXRuntimeCheck_PerVoiceSettings__ffEnabled_PerVoiceSettings;
}

uint64_t AXRuntimeCheck_SiriSSEOnly()
{
  if (AXRuntimeCheck_SiriSSEOnly_onceToken_SiriSSEOnly != -1)
    dispatch_once(&AXRuntimeCheck_SiriSSEOnly_onceToken_SiriSSEOnly, &__block_literal_global_18);
  return AXRuntimeCheck_SiriSSEOnly__ffEnabled_SiriSSEOnly;
}

uint64_t AXRuntimeCheck_SpeakUp()
{
  if (AXRuntimeCheck_SpeakUp_onceToken_SpeakUp != -1)
    dispatch_once(&AXRuntimeCheck_SpeakUp_onceToken_SpeakUp, &__block_literal_global_20);
  return AXRuntimeCheck_SpeakUp__ffEnabled_SpeakUp;
}

uint64_t AXRuntimeCheck_MediaAnalysisSupport()
{
  if (AXRuntimeCheck_MediaAnalysisSupport_onceToken != -1)
    dispatch_once(&AXRuntimeCheck_MediaAnalysisSupport_onceToken, &__block_literal_global_22);
  return AXRuntimeCheck_MediaAnalysisSupport__supportsMediaAnalysisServices;
}

uint64_t AXRuntimeCheck_ScreenRecognitionSupport()
{
  if (AXRuntimeCheck_ScreenRecognitionSupport_onceToken != -1)
    dispatch_once(&AXRuntimeCheck_ScreenRecognitionSupport_onceToken, &__block_literal_global_24);
  return AXRuntimeCheck_ScreenRecognitionSupport__supportsScreenRecognition;
}

BOOL AXRuntimeCheck_SupportsLiveCaptions()
{
  void *v0;
  _BOOL8 v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v0, "isEqualToString:", CFSTR("en")))
    {
      if (AXRuntimeCheck_HasANE_onceToken != -1)
        dispatch_once(&AXRuntimeCheck_HasANE_onceToken, &__block_literal_global_3);
      v1 = AXRuntimeCheck_HasANE__hasANE != 0;
    }
    else
    {
      v1 = 0;
    }

  }
  else
  {
    v1 = 0;
  }
  AXLogLiveTranscription();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB37E8];
    if (AXRuntimeCheck_HasANE_onceToken != -1)
      dispatch_once(&AXRuntimeCheck_HasANE_onceToken, &__block_literal_global_3);
    objc_msgSend(v6, "numberWithBool:", AXRuntimeCheck_HasANE__hasANE);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138413058;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_18F1A7000, v2, OS_LOG_TYPE_DEFAULT, "Live captions supported: %@ [%@,%@,%@]", (uint8_t *)&v9, 0x2Au);

  }
  return v1;
}

uint64_t AXRuntimeCheck_SupportsFocusEverywhere()
{
  return 0;
}

uint64_t AXRuntimeCheck_SupportsOnDeviceEyeTracking()
{
  if (AXRuntimeCheck_isANEDeviceH13plus_onceToken != -1)
    dispatch_once(&AXRuntimeCheck_isANEDeviceH13plus_onceToken, &__block_literal_global_1);
  if (AXRuntimeCheck_isANEDeviceH13plus_isANEH13plus)
    return _os_feature_enabled_impl();
  else
    return 0;
}

uint64_t AXRuntimeCheck_SoundRecognitionMedinaSupportEnabled()
{
  if (AXRuntimeCheck_SupportsMedina_onceToken != -1)
    dispatch_once(&AXRuntimeCheck_SupportsMedina_onceToken, &__block_literal_global_3_0);
  if (AXRuntimeCheck_SupportsMedina__supportsMedina)
    return _os_feature_enabled_impl();
  else
    return 0;
}

uint64_t AXRuntimeCheck_SoundRecognitionMedinaKShotEnrollmentEnabled()
{
  if (AXRuntimeCheck_SupportsMedina_onceToken != -1)
    dispatch_once(&AXRuntimeCheck_SupportsMedina_onceToken, &__block_literal_global_3_0);
  if (AXRuntimeCheck_SupportsMedina__supportsMedina)
    return _os_feature_enabled_impl();
  else
    return 0;
}

uint64_t AXRuntimeCheck_SupportsIncreaseBrightnessFloor()
{
  if (AXRuntimeCheck_SupportsIncreaseBrightnessFloor_onceToken != -1)
    dispatch_once(&AXRuntimeCheck_SupportsIncreaseBrightnessFloor_onceToken, &__block_literal_global_33_0);
  return AXRuntimeCheck_SupportsIncreaseBrightnessFloor__supportsIncreaseBrightnessFloor;
}

uint64_t AXRuntimeCheck_SupportsDoseAnalysis()
{
  if (AXRuntimeCheck_SupportsDoseAnalysis_onceToken != -1)
    dispatch_once(&AXRuntimeCheck_SupportsDoseAnalysis_onceToken, &__block_literal_global_35_0);
  return AXRuntimeCheck_SupportsDoseAnalysis__supportsDoseAnalysis;
}

uint64_t AXRuntimeCheck_SupportsVoiceoverIndepedentVolume()
{
  if (AXRuntimeCheck_SupportsVoiceoverIndepedentVolume_onceToken != -1)
    dispatch_once(&AXRuntimeCheck_SupportsVoiceoverIndepedentVolume_onceToken, &__block_literal_global_37_0);
  return AXRuntimeCheck_SupportsVoiceoverIndepedentVolume__supportsVoiceoverIndepedentVolume;
}

void *__getMGGetBoolAnswerSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (void *)libMobileGestaltLibraryCore_frameworkLibrary;
  v8 = libMobileGestaltLibraryCore_frameworkLibrary;
  if (!libMobileGestaltLibraryCore_frameworkLibrary)
  {
    v9 = xmmword_1E293A1E0;
    v10 = 0;
    v2 = (void *)_sl_dlopen();
    v6[3] = (uint64_t)v2;
    libMobileGestaltLibraryCore_frameworkLibrary = (uint64_t)v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(&v4);
  if (v4)
    free(v4);
  result = dlsym(v2, "MGGetBoolAnswer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMGGetBoolAnswerSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18F1CD070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL AXDeviceIsPad()
{
  if (AXDeviceGetType__AXCurrentDeviceTypeOnceToken != -1)
    dispatch_once(&AXDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_4);
  return AXDeviceGetType__AXDeviceType == 3;
}

uint64_t AXDeviceGetType()
{
  if (AXDeviceGetType__AXCurrentDeviceTypeOnceToken != -1)
    dispatch_once(&AXDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_4);
  return AXDeviceGetType__AXDeviceType;
}

BOOL AXDeviceIsPhone()
{
  if (AXDeviceGetType__AXCurrentDeviceTypeOnceToken != -1)
    dispatch_once(&AXDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_4);
  return AXDeviceGetType__AXDeviceType == 1;
}

void sub_18F1CD238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL AXDeviceIsPod()
{
  if (AXDeviceGetType__AXCurrentDeviceTypeOnceToken != -1)
    dispatch_once(&AXDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_4);
  return AXDeviceGetType__AXDeviceType == 2;
}

BOOL AXDeviceIsWatch()
{
  if (AXDeviceGetType__AXCurrentDeviceTypeOnceToken != -1)
    dispatch_once(&AXDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_4);
  return AXDeviceGetType__AXDeviceType == 5;
}

void *__getMGGetSInt32AnswerSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (void *)libMobileGestaltLibraryCore_frameworkLibrary_0;
  v8 = libMobileGestaltLibraryCore_frameworkLibrary_0;
  if (!libMobileGestaltLibraryCore_frameworkLibrary_0)
  {
    v9 = xmmword_1E293A1F8;
    v10 = 0;
    v2 = (void *)_sl_dlopen();
    v6[3] = (uint64_t)v2;
    libMobileGestaltLibraryCore_frameworkLibrary_0 = (uint64_t)v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    __getMGGetSInt32AnswerSymbolLoc_block_invoke_cold_1(&v4);
  if (v4)
    free(v4);
  result = dlsym(v2, "MGGetSInt32Answer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMGGetSInt32AnswerSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_18F1CD3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _axsHandleSystemUILoadInvertBundles_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_18F1A7000, v0, v1, "Per-App SmartInvert is true for some launched app", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void _updateAccessibilitySettings_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_18F1A7000, a1, a3, "Update, AX Enabled: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void _updateAccessibilitySettings_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_18F1A7000, v0, v1, "Sending notification, kAXSAccessibilityEnabledPreference", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void _copyValuePreferenceApp_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18F1A7000, v0, v1, "Request for application info error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _setPreferenceAppWithNotification_cold_1()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v2 = 2112;
  v3 = 0;
  _os_log_debug_impl(&dword_18F1A7000, v0, OS_LOG_TYPE_DEBUG, "Save as Mobile preference: %@, appID = %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void _setPreferenceAppWithNotification_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18F1A7000, v0, v1, "Error setting Per-App Setting pref: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _setPreferenceAppWithNotification_cold_4()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL AXProcessIsBackboard_Soft(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AccessibilitySupport.m"), 54, CFSTR("%s"), dlerror());

  __break(1u);
}

void _AXSAirPodSettingForDevice_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18F1A7000, v0, v1, "Need to pass in the device address to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _AXSAirPodSettingSetForDevice_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18F1A7000, v0, v1, "No device address for setting%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _AXSSetTripleClickOptions_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_18F1A7000, v0, OS_LOG_TYPE_FAULT, "Invalid attempt to insert duplicates into the triple click menu: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _AXSAttentionAwarenessFeaturesEnabled_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_18F1A7000, a1, a3, "Retrieved attention aware: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void _AXSInvertColorsEnabledAppCached_cold_1()
{
  int v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 1024;
  v4 = v0;
  OUTLINED_FUNCTION_6(&dword_18F1A7000, v1, (uint64_t)v1, "Fetched cachedSmartInvertPreferences to App: appID = %@, res = %d (-1 - empty, 0 - false, 1 - true)", v2);
  OUTLINED_FUNCTION_1();
}

void _AXSInvertColorsEnabledAppCached_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_12(&dword_18F1A7000, v0, v1, "Registered for SmartInvert Notifications for App = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _AXSCopyPreferredContentSizeCategoryNameApp_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_18F1A7000, v0, v1, "PreferredContentSizeCategoryNameApp AX_UIKIT_PREF_PATH is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void _AXSSpeakThisSetHighlightVisible_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_18F1A7000, v0, v1, "Only backboardd is allowed to set the highlight's visibility.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void _updateBoolCachePreferenceAndRepostNotification_cold_1(uint64_t a1, unsigned __int8 *a2, NSObject *a3)
{
  __int128 v3;

  LODWORD(v3) = 0;
  WORD2(v3) = 2112;
  *(_QWORD *)((char *)&v3 + 6) = a1;
  HIWORD(v3) = 1024;
  OUTLINED_FUNCTION_8(&dword_18F1A7000, (uint64_t)a2, a3, "Update Cache Value On Notification: appID = %@, preference = %@, result = %d", 138412802, v3, *a2);
  OUTLINED_FUNCTION_11();
}

void _updateCacheSmartInvertAndRepostNotification_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_18F1A7000, v0, v1, "Update on Notification, Per-App Smart Invert is ON, AX Enabled: true", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void _updateCacheSmartInvertAndRepostNotification_cold_2()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_18F1A7000, v0, OS_LOG_TYPE_DEBUG, "Updated Cache: appID = %@, preference = %@, result = %d (-1 - empty, 0 - false, 1 - true)", v1, 0x1Cu);
  OUTLINED_FUNCTION_11();
}

void _updateCacheSmartInvertAndRepostNotification_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_18F1A7000, v0, v1, "Read Global: appID = %@, preference = %@, result = %d (-1 - empty, 0 - false, 1 - true)");
  OUTLINED_FUNCTION_11();
}

void _updateCacheSmartInvertAndRepostNotification_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_18F1A7000, v0, v1, "Read Local: appID = %@, preference = %@, result = %d (-1 - empty, 0 - false, 1 - true)");
  OUTLINED_FUNCTION_11();
}

void AccessibilityUtilitiesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AccessibilityUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AccessibilitySupport.m"), 50, CFSTR("%s"), *a1);

  __break(1u);
}

void _invalidateCacheSmartInvertPreference_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_12(&dword_18F1A7000, v0, v1, "Invalidate cachedSmartInvertPreferences to App: appID = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __getLSApplicationRecordClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AccessibilitySupport.m"), 64, CFSTR("%s"), *a1);

  __break(1u);
}

void __getLSApplicationRecordClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getLSApplicationRecordClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AccessibilitySupport.m"), 65, CFSTR("Unable to find class %s"), "LSApplicationRecord");

  __break(1u);
}

void __getAXBuddyDataPackageClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAXBuddyDataPackageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AccessibilitySupport.m"), 51, CFSTR("Unable to find class %s"), "AXBuddyDataPackage");

  __break(1u);
}

void __getMGGetBoolAnswerSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *libMobileGestaltLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXFeatureRuntimeSupport.m"), 36, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMGGetSInt32AnswerSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;
  CFMutableArrayRef v4;
  const void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *libMobileGestaltLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SoftGestalt.h"), 11, CFSTR("%s"), *a1);

  __break(1u);
  CFArrayAppendValue(v4, v5);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98000](bundle);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x1E0C98060]();
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987D8](locale);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1E0C99008](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t MACaptionAppearancePrefCopyPreferAccessibleCaptions()
{
  return MEMORY[0x1E0CC1BF0]();
}

uint64_t MACaptionAppearancePrefSetPreferAccessibleCaptions()
{
  return MEMORY[0x1E0CC1C00]();
}

void MACaptionAppearanceSetDisplayType(MACaptionAppearanceDomain domain, MACaptionAppearanceDisplayType displayType)
{
  MEMORY[0x1E0CC1C10](domain, displayType);
}

uint64_t MADisplayFilterPrefGetBlueColorCorrectionIntensity()
{
  return MEMORY[0x1E0CC1C20]();
}

uint64_t MADisplayFilterPrefGetCategoryEnabled()
{
  return MEMORY[0x1E0CC1C28]();
}

uint64_t MADisplayFilterPrefGetGreenColorCorrectionIntensity()
{
  return MEMORY[0x1E0CC1C30]();
}

uint64_t MADisplayFilterPrefGetRedColorCorrectionIntensity()
{
  return MEMORY[0x1E0CC1C38]();
}

uint64_t MADisplayFilterPrefGetType()
{
  return MEMORY[0x1E0CC1C40]();
}

uint64_t MADisplayFilterPrefSetBlueColorCorrectionIntensity()
{
  return MEMORY[0x1E0CC1C48]();
}

uint64_t MADisplayFilterPrefSetCategoryEnabled()
{
  return MEMORY[0x1E0CC1C50]();
}

uint64_t MADisplayFilterPrefSetGreenColorCorrectionIntensity()
{
  return MEMORY[0x1E0CC1C58]();
}

uint64_t MADisplayFilterPrefSetRedColorCorrectionIntensity()
{
  return MEMORY[0x1E0CC1C60]();
}

uint64_t MADisplayFilterPrefSetType()
{
  return MEMORY[0x1E0CC1C68]();
}

uint64_t MADisplayFilterPrefSuspendNotifications()
{
  return MEMORY[0x1E0CC1C70]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return MEMORY[0x1E0C9A308]();
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x1E0C9A320]();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return MEMORY[0x1E0C9A378]();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return MEMORY[0x1E0C9A398]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1E0C81730](*(_QWORD *)&r);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_has_factory_content()
{
  return MEMORY[0x1E0C849E8]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1E0C86118]();
}

