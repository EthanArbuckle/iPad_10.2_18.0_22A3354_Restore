@implementation ACMPreferencesCFPreferencesStore

+ (id)preferencesStoreWithCFPreferences
{
  return (id)objc_opt_new();
}

- (__CFString)preferenceID
{
  return CFSTR("com.apple.ist.ds.appleconnect.mobile.external");
}

- (id)preferencesValueForKey:(id)a3
{
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  CFPropertyListRef v8;

  v5 = -[ACMPreferencesCFPreferencesStore preferenceID](self, "preferenceID");
  v6 = (const __CFString *)*MEMORY[0x24BDBD590];
  v7 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSynchronize(v5, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  v8 = (id)CFPreferencesCopyValue((CFStringRef)a3, -[ACMPreferencesCFPreferencesStore preferenceID](self, "preferenceID"), v6, v7);
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMPreferencesCFPreferencesStore preferencesValueForKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMPreferencesCFPreferencesStore.m", 33, 0, "Preferences key: %@ is set to %@", a3, v8);
  return (id)v8;
}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4
{
  __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACMPreferencesCFPreferencesStore setPreferencesValue:forKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMPreferencesCFPreferencesStore.m", 39, 0, "Updating preferences key: %@ with value %@", a4, a3);
  v7 = -[ACMPreferencesCFPreferencesStore preferenceID](self, "preferenceID");
  v8 = (const __CFString *)*MEMORY[0x24BDBD590];
  v9 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSetValue((CFStringRef)a4, a3, v7, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  CFPreferencesSynchronize(-[ACMPreferencesCFPreferencesStore preferenceID](self, "preferenceID"), v8, v9);
}

- (id)multiplePreferencesValuesForKeys:(id)a3
{
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  v5 = -[ACMPreferencesCFPreferencesStore preferenceID](self, "preferenceID");
  v6 = (const __CFString *)*MEMORY[0x24BDBD590];
  v7 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSynchronize(v5, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  return CFPreferencesCopyMultiple((CFArrayRef)a3, -[ACMPreferencesCFPreferencesStore preferenceID](self, "preferenceID"), v6, v7);
}

- (void)setMultiplePreferencesValues:(id)a3
{
  const __CFArray *v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  v5 = (const __CFArray *)objc_msgSend(a3, "allKeys");
  v6 = -[ACMPreferencesCFPreferencesStore preferenceID](self, "preferenceID");
  v7 = (const __CFString *)*MEMORY[0x24BDBD590];
  v8 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSetMultiple(0, v5, v6, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  CFPreferencesSetMultiple((CFDictionaryRef)a3, 0, -[ACMPreferencesCFPreferencesStore preferenceID](self, "preferenceID"), v7, v8);
  CFPreferencesSynchronize(-[ACMPreferencesCFPreferencesStore preferenceID](self, "preferenceID"), v7, v8);
}

- (id)allValues
{
  __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = -[ACMPreferencesCFPreferencesStore preferenceID](self, "preferenceID");
  v4 = (const __CFString *)*MEMORY[0x24BDBD590];
  v5 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSynchronize(v3, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  return CFPreferencesCopyMultiple(0, -[ACMPreferencesCFPreferencesStore preferenceID](self, "preferenceID"), v4, v5);
}

- (void)removeAllValues
{
  const __CFArray *v3;
  __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = (const __CFArray *)objc_msgSend(-[ACMPreferencesCFPreferencesStore allValues](self, "allValues"), "allKeys");
  v4 = -[ACMPreferencesCFPreferencesStore preferenceID](self, "preferenceID");
  v5 = (const __CFString *)*MEMORY[0x24BDBD590];
  v6 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSetMultiple(0, v3, v4, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  CFPreferencesSynchronize(-[ACMPreferencesCFPreferencesStore preferenceID](self, "preferenceID"), v5, v6);
}

- (void)replaceAllValues:(id)a3 withOptions:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;

  if (ACFLogNS && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLogNS(7, (uint64_t)"-[ACMPreferencesCFPreferencesStore replaceAllValues:withOptions:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMPreferencesCFPreferencesStore.m", 105, 0, (uint64_t)CFSTR("Replacing preferences: %@"), v6, v7, (uint64_t)a3);
  if (a3)
  {
    -[ACMPreferencesCFPreferencesStore removeAllValues](self, "removeAllValues", a3, a4);
    -[ACMPreferencesCFPreferencesStore setMultiplePreferencesValues:](self, "setMultiplePreferencesValues:", a3);
  }
}

@end
