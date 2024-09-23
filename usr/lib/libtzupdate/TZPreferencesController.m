@implementation TZPreferencesController

+ (id)sharedPreferencesController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__TZPreferencesController_sharedPreferencesController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferencesController_once != -1)
    dispatch_once(&sharedPreferencesController_once, block);
  return (id)sharedPreferencesController_sharedController;
}

void __54__TZPreferencesController_sharedPreferencesController__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedPreferencesController_sharedController;
  sharedPreferencesController_sharedController = v0;

}

- (TZPreferencesController)init
{
  TZPreferencesController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TZPreferencesController;
  v2 = -[TZPreferencesController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_preferencesChanged_, CFSTR("com.apple.timezoneupdates.preferencesChanged"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_preferencesChanged_, CFSTR("com.apple.ManagedConfiguration.profileList"), 0);

  }
  return v2;
}

- (void)preferencesChanged:(id)a3
{
  CFPreferencesSynchronize(CFSTR("com.apple.timezoneupdates"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (BOOL)updatesEnabled
{
  return 1;
}

- (int64_t)loggingLevel
{
  const void *v2;
  CFTypeID v3;
  int64_t result;
  const void *Value;
  int64_t valuePtr;

  valuePtr = 0;
  v2 = CFPreferencesCopyAppValue(CFSTR("TimeZoneUpdatesLoggingLevel"), CFSTR("com.apple.timezoneupdates"));
  if (!v2)
  {
    if (_getManagedPreferencesDict_managedPreferencesOnce != -1)
      dispatch_once(&_getManagedPreferencesDict_managedPreferencesOnce, &__block_literal_global_2);
    if (_getManagedPreferencesDict__managedPreferencesCache
      && (Value = CFDictionaryGetValue((CFDictionaryRef)_getManagedPreferencesDict__managedPreferencesCache, CFSTR("TimeZoneUpdatesLoggingLevel"))) != 0)
    {
      v2 = Value;
      CFRetain(Value);
    }
    else
    {
      result = (int64_t)CFPreferencesCopyValue(CFSTR("TimeZoneUpdatesLoggingLevel"), CFSTR("com.apple.timezoneupdates"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
      v2 = (const void *)result;
      if (!result)
        return result;
    }
  }
  v3 = CFGetTypeID(v2);
  if (v3 == CFNumberGetTypeID())
    CFNumberGetValue((CFNumberRef)v2, kCFNumberIntType, &valuePtr);
  CFRelease(v2);
  return valuePtr;
}

@end
