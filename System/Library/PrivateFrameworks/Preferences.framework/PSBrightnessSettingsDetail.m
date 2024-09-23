@implementation PSBrightnessSettingsDetail

+ (id)preferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=DISPLAY"));
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithTypeIdentifier:", CFSTR("com.apple.graphic-icon.display"));
}

+ (double)currentValue
{
  float v2;

  PSBKSDisplayBrightnessGetCurrent();
  return v2;
}

+ (double)incrementedBrightnessValue:(double)a3
{
  float v4;
  double result;

  PSBKSDisplayBrightnessGetCurrent();
  result = fmax(v4 + a3, 0.0);
  if (result > 1.0)
    return 1.0;
  return result;
}

+ (void)incrementBrightnessValue:(double)a3
{
  float v4;
  double v5;
  float v6;

  PSBKSDisplayBrightnessGetCurrent();
  v5 = fmax(v4 + a3, 0.0);
  if (v5 > 1.0)
    v5 = 1.0;
  v6 = v5;
  PSBKSDisplayBrightnessSet(v6);
}

+ (void)setValue:(double)a3
{
  float v3;

  if (__transactionRef)
  {
    v3 = a3;
    PSBKSDisplayBrightnessSet(v3);
  }
  else
  {
    NSLog(CFSTR("########### %d %s - Warning: There was no __transactionRef when setting brightness value"), a2, a3, 683, "+[PSBrightnessSettingsDetail setValue:]");
  }
}

+ (void)beginBrightnessAdjustmentTransaction
{
  void *v2;
  void *v3;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  if (!__transactionRef)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x2020000000;
    v2 = getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr;
    v8 = getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr;
    if (!getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr)
    {
      v3 = (void *)BackBoardServicesLibrary();
      v2 = dlsym(v3, "BKSDisplayBrightnessTransactionCreate");
      v6[3] = (uint64_t)v2;
      getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr = v2;
    }
    _Block_object_dispose(&v5, 8);
    if (!v2)
    {
      v4 = (_Unwind_Exception *)PSPNCreateFormattedStringWithCountry_cold_1();
      _Block_object_dispose(&v5, 8);
      _Unwind_Resume(v4);
    }
    __transactionRef = ((uint64_t (*)(_QWORD))v2)(*MEMORY[0x1E0C9AE00]);
  }
}

+ (void)endBrightnessAdjustmentTransaction
{
  if (__transactionRef)
  {
    CFRelease((CFTypeRef)__transactionRef);
    __transactionRef = 0;
  }
}

+ (void)beginObservingExternalBrightnessChanges:(id)a3 changedAction:(id)a4
{
  id v5;
  id v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *observer;

  v5 = a4;
  v6 = a3;
  +[PSBrightnessController sharedController](PSBrightnessController, "sharedController");
  observer = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(observer, "setIsTracking:", v6);

  objc_msgSend(observer, "setBrightnessChangedExternally:", v5);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, observer, (CFNotificationCallback)_BrightnessChangedExternally, (CFStringRef)*MEMORY[0x1E0CEBB78], 0, CFNotificationSuspensionBehaviorDeliverImmediately);

}

+ (void)endObservingExternalBrightnessChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *observer;

  +[PSBrightnessController sharedController](PSBrightnessController, "sharedController");
  observer = (void *)objc_claimAutoreleasedReturnValue();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, observer, (CFNotificationName)*MEMORY[0x1E0CEBB78], 0);
  objc_msgSend(observer, "setIsTracking:", 0);
  objc_msgSend(observer, "setBrightnessChangedExternally:", 0);

}

+ (BOOL)deviceSupportsAutoBrightness
{
  return MGGetBoolAnswer();
}

+ (void)setAutoBrightnessEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(CFSTR("BKEnableALS"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0), CFSTR("com.apple.backboardd"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.backboardd"));
}

+ (BOOL)autoBrightnessEnabled
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.backboardd"));
  return CFPreferencesGetAppBooleanValue(CFSTR("BKEnableALS"), CFSTR("com.apple.backboardd"), 0) != 0;
}

@end
