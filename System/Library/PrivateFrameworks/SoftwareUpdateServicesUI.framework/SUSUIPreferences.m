@implementation SUSUIPreferences

- (SUSUIPreferences)init
{
  __CFNotificationCenter *DarwinNotifyCenter;
  SUSUIPreferences *v4;
  SUSUIPreferences *v5;
  objc_super v6;
  SEL v7;
  SUSUIPreferences *v8;

  v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIPreferences;
  v5 = -[SUSUIPreferences init](&v6, sel_init);
  v8 = v5;
  objc_storeStrong((id *)&v8, v5);
  if (v5)
  {
    -[SUSUIPreferences _loadPreferences](v8, "_loadPreferences");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)__SUSUIPreferencesChanged, CFSTR("SUSUIPreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  v4 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v4;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v3;
  SEL v4;
  SUSUIPreferences *v5;

  v5 = self;
  v4 = a2;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v5, CFSTR("SUSUIPreferencesChangedNotification"), 0);
  v3.receiver = v5;
  v3.super_class = (Class)SUSUIPreferences;
  -[SUSUIPreferences dealloc](&v3, sel_dealloc);
}

+ (id)sharedInstance
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&sharedInstance_pred;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_0);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)sharedInstance___instance_0;
}

void __34__SUSUIPreferences_sharedInstance__block_invoke()
{
  SUSUIPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(SUSUIPreferences);
  v1 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v0;

}

- (void)_loadPreferences
{
  NSNumber *v2;
  NSNumber *passcodeRequiredDays;
  NSNumber *v4;
  NSNumber *installAlertIntervalMinutes;

  self->_alertAfterDownload = -[SUSUIPreferences _getBooleanPreferenceForKey:withDefaultValue:](self, "_getBooleanPreferenceForKey:withDefaultValue:", CFSTR("alertAfterDownload"), 0);
  v2 = -[SUSUIPreferences _copyNumberPreferenceForKey:](self, "_copyNumberPreferenceForKey:", CFSTR("passcodeRequiredDays"));
  passcodeRequiredDays = self->_passcodeRequiredDays;
  self->_passcodeRequiredDays = v2;

  self->_needsAlertPresentationAfterOTAUpdate = -[SUSUIPreferences _getBooleanPreferenceForKey:withDefaultValue:](self, "_getBooleanPreferenceForKey:withDefaultValue:", CFSTR("needsAlertAfterOTAUpdate"), 0);
  self->_preventCountdownAlert = -[SUSUIPreferences _getBooleanPreferenceForKey:withDefaultValue:](self, "_getBooleanPreferenceForKey:withDefaultValue:", CFSTR("preventCountdownAlert"), 0);
  v4 = -[SUSUIPreferences _copyNumberPreferenceForKey:](self, "_copyNumberPreferenceForKey:", CFSTR("installAlertInterval"));
  installAlertIntervalMinutes = self->_installAlertIntervalMinutes;
  self->_installAlertIntervalMinutes = v4;

  self->_preventRollbackPrompt = -[SUSUIPreferences _getBooleanPreferenceForKey:withDefaultValue:](self, "_getBooleanPreferenceForKey:withDefaultValue:", CFSTR("preventRollbackPrompt"), 0);
  self->_isSharedIPad = -[SUSUIPreferences _getBooleanPreferenceForKey:withDefaultValue:](self, "_getBooleanPreferenceForKey:withDefaultValue:", CFSTR("isSharedIPad"), 0);
  self->_IWillRebootLater = -[SUSUIPreferences _getBooleanPreferenceForKey:withDefaultValue:](self, "_getBooleanPreferenceForKey:withDefaultValue:", CFSTR("IWillRebootLater"), 0);
  self->_preventRebootAlert = -[SUSUIPreferences _getBooleanPreferenceForKey:withDefaultValue:](self, "_getBooleanPreferenceForKey:withDefaultValue:", CFSTR("preventRebootAlert"), 0);
  self->_lastAppliedUpdateWasSplatOnly = -[SUSUIPreferences _getBooleanPreferenceForKey:withDefaultValue:](self, "_getBooleanPreferenceForKey:withDefaultValue:", CFSTR("lastAppliedUpdateWasSplatOnly"), 0);
  self->_preventPostUpdateAlert = -[SUSUIPreferences _getBooleanPreferenceForKey:withDefaultValue:](self, "_getBooleanPreferenceForKey:withDefaultValue:", CFSTR("preventPostUpdateAlert"), 0);
}

- (BOOL)_getBooleanPreferenceForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  BOOL v6;
  const __CFBoolean *BOOLean;
  id location[2];
  SUSUIPreferences *v9;
  BOOL v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOLean = -[SUSUIPreferences _copyPreferenceForKey:ofType:](v9, "_copyPreferenceForKey:ofType:", location[0], CFBooleanGetTypeID());
  if (BOOLean)
  {
    v6 = CFBooleanGetValue(BOOLean) != 0;
    CFRelease(BOOLean);
    v10 = v6;
  }
  else
  {
    v10 = a4;
  }
  objc_storeStrong(location, 0);
  return v10;
}

- (id)_copyStringPreferenceForKey:(id)a3
{
  void *v4;
  id location[2];
  SUSUIPreferences *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[SUSUIPreferences _copyPreferenceForKey:ofType:](v6, "_copyPreferenceForKey:ofType:", location[0], CFStringGetTypeID());
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_copyNumberPreferenceForKey:(id)a3
{
  void *v4;
  id location[2];
  SUSUIPreferences *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[SUSUIPreferences _copyPreferenceForKey:ofType:](v6, "_copyPreferenceForKey:ofType:", location[0], CFNumberGetTypeID());
  objc_storeStrong(location, 0);
  return v4;
}

- (void)_copyPreferenceForKey:(__CFString *)a3 ofType:(unint64_t)a4
{
  CFTypeRef cf;

  cf = CFPreferencesCopyAppValue(a3, CFSTR("com.apple.susui"));
  if (cf && CFGetTypeID(cf) == a4)
    return (void *)cf;
  if (cf)
    CFRelease(cf);
  return 0;
}

- (void)setNeedsAlertPresentationAfterOTAUpdate:(BOOL)a3
{
  if (a3 != self->_needsAlertPresentationAfterOTAUpdate)
  {
    self->_needsAlertPresentationAfterOTAUpdate = a3;
    -[SUSUIPreferences _setBooleanPreferenceForKey:value:](self, "_setBooleanPreferenceForKey:value:", CFSTR("needsAlertAfterOTAUpdate"), a3);
  }
}

- (void)setLastAppliedUpdateWasSplatOnly:(BOOL)a3
{
  self->_lastAppliedUpdateWasSplatOnly = a3;
  -[SUSUIPreferences _setBooleanPreferenceForKey:value:](self, "_setBooleanPreferenceForKey:value:", CFSTR("lastAppliedUpdateWasSplatOnly"), a3);
}

- (void)_setBooleanPreferenceForKey:(id)a3 value:(BOOL)a4
{
  CFPropertyListRef value;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4)
    value = (CFPropertyListRef)*MEMORY[0x24BDBD270];
  else
    value = (CFPropertyListRef)*MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue((CFStringRef)location[0], value, CFSTR("com.apple.susui"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.susui"));
  objc_storeStrong(location, 0);
}

- (BOOL)alertAfterDownload
{
  return self->_alertAfterDownload;
}

- (NSNumber)passcodeRequiredDays
{
  return self->_passcodeRequiredDays;
}

- (BOOL)needsAlertPresentationAfterOTAUpdate
{
  return self->_needsAlertPresentationAfterOTAUpdate;
}

- (BOOL)preventCountdownAlert
{
  return self->_preventCountdownAlert;
}

- (NSNumber)installAlertIntervalMinutes
{
  return self->_installAlertIntervalMinutes;
}

- (BOOL)preventRollbackPrompt
{
  return self->_preventRollbackPrompt;
}

- (BOOL)isSharedIPad
{
  return self->_isSharedIPad;
}

- (BOOL)IWillRebootLater
{
  return self->_IWillRebootLater;
}

- (BOOL)preventRebootAlert
{
  return self->_preventRebootAlert;
}

- (BOOL)lastAppliedUpdateWasSplatOnly
{
  return self->_lastAppliedUpdateWasSplatOnly;
}

- (BOOL)preventPostUpdateAlert
{
  return self->_preventPostUpdateAlert;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installAlertIntervalMinutes, 0);
  objc_storeStrong((id *)&self->_passcodeRequiredDays, 0);
}

@end
