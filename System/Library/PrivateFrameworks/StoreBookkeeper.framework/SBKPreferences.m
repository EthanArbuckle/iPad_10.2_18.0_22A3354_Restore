@implementation SBKPreferences

- (SBKPreferences)init
{
  SBKPreferences *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBKPreferences;
  v2 = -[SBKPreferences init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_PreferencesDidChangeNotification, CFSTR("com.apple.storebookkeeper.defaultschange"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.storebookkeeper.defaultschange"), self);
  v4.receiver = self;
  v4.super_class = (Class)SBKPreferences;
  -[SBKPreferences dealloc](&v4, sel_dealloc);
}

- (void)_preferencesDidChange
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("SBKPreferencesDidChangeNotification"), self, 0);

}

- (void)registerDefaultsIfKeyNotSet:(id)a3 registrationBlock:(id)a4
{
  void (**v6)(_QWORD);
  id v7;

  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(CFSTR("_didRegister-"), "stringByAppendingString:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[SBKPreferences BOOLForKey:](self, "BOOLForKey:"))
  {
    v6[2](v6);
    -[SBKPreferences setBool:forKey:](self, "setBool:forKey:", 1, v7);
    CFPreferencesAppSynchronize(CFSTR("com.apple.storebookkeeper"));
  }

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, CFSTR("com.apple.storebookkeeper"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.storebookkeeper"));
}

- (id)objectForKey:(id)a3 withDefaultValue:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.storebookkeeper"));
  if (!v6)
    v6 = v5;

  return v6;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v5;
  __CFString *v6;
  id v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = (__CFString *)a4;
  objc_msgSend(v5, "numberWithBool:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(v6, v7, CFSTR("com.apple.storebookkeeper"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.storebookkeeper"));
}

- (BOOL)BOOLForKey:(id)a3
{
  return CFPreferencesGetAppBooleanValue((CFStringRef)a3, CFSTR("com.apple.storebookkeeper"), 0) != 0;
}

+ (id)storeBookkeeperPreferences
{
  if (storeBookkeeperPreferences_onceToken != -1)
    dispatch_once(&storeBookkeeperPreferences_onceToken, &__block_literal_global_532);
  return (id)storeBookkeeperPreferences_storeBookkeeperPreferences;
}

void __44__SBKPreferences_storeBookkeeperPreferences__block_invoke()
{
  SBKPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(SBKPreferences);
  v1 = (void *)storeBookkeeperPreferences_storeBookkeeperPreferences;
  storeBookkeeperPreferences_storeBookkeeperPreferences = (uint64_t)v0;

}

@end
