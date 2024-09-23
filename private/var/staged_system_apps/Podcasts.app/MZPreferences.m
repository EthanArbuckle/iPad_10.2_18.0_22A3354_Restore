@implementation MZPreferences

- (MZPreferences)init
{
  MZPreferences *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MZPreferences;
  v2 = -[MZPreferences init](&v5, "init");
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000B0688, CFSTR("com.apple.storebookkeeper.defaultschange"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

+ (id)storeBookkeeperPreferences
{
  if (qword_1005673F0 != -1)
    dispatch_once(&qword_1005673F0, &stru_1004A9498);
  return (id)qword_1005673E8;
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

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.storebookkeeper.defaultschange"), self);
  v4.receiver = self;
  v4.super_class = (Class)MZPreferences;
  -[MZPreferences dealloc](&v4, "dealloc");
}

- (void)_preferencesDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("MZPreferencesDidChangeNotification"), self, 0);

}

- (void)registerDefaultsIfKeyNotSet:(id)a3 registrationBlock:(id)a4
{
  void (**v6)(_QWORD);
  id v7;

  v6 = (void (**)(_QWORD))a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("_didRegister-"), "stringByAppendingString:", a3));
  if (!-[MZPreferences BOOLForKey:](self, "BOOLForKey:"))
  {
    v6[2](v6);
    -[MZPreferences setBool:forKey:](self, "setBool:forKey:", 1, v7);
    CFPreferencesAppSynchronize(CFSTR("com.apple.storebookkeeper"));
  }

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, CFSTR("com.apple.storebookkeeper"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.storebookkeeper"));
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  __CFString *v5;
  id v6;

  v4 = a3;
  v5 = (__CFString *)a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  CFPreferencesSetAppValue(v5, v6, CFSTR("com.apple.storebookkeeper"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.storebookkeeper"));
}

- (BOOL)BOOLForKey:(id)a3
{
  return CFPreferencesGetAppBooleanValue((CFStringRef)a3, CFSTR("com.apple.storebookkeeper"), 0) != 0;
}

@end
