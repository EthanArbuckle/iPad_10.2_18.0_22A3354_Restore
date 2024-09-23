@implementation SBExternalGlobalDefaults

- (SBExternalGlobalDefaults)init
{
  return (SBExternalGlobalDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple"));
}

+ (BOOL)__useDynamicMethodResolution
{
  return 0;
}

- (NSString)locale
{
  return (NSString *)(id)CFPreferencesCopyValue(CFSTR("AppleLocale"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (void)setLocale:(id)a3
{
  CFPreferencesSetValue(CFSTR("AppleLocale"), a3, (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (NSArray)languages
{
  return (NSArray *)(id)CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (void)setLanguages:(id)a3
{
  CFPreferencesSetValue(CFSTR("AppleLanguages"), a3, (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (NSArray)keyboards
{
  return (NSArray *)(id)CFPreferencesCopyValue(CFSTR("AppleKeyboards"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (void)setKeyboards:(id)a3
{
  CFPreferencesSetValue(CFSTR("AppleKeyboards"), a3, (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (void)removeFormattedPhoneNumberFromGlobalPreferences
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B250];
  CFPreferencesSetValue(CFSTR("SBFormattedPhoneNumber"), 0, (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  CFPreferencesSynchronize(v2, v3, v4);
}

- (void)flushExternalCaches
{
  _CFPreferencesFlushCachesForIdentifier();
}

@end
