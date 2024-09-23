@implementation SiriAnalyticsPreferences

- (SiriAnalyticsPreferences)init
{
  return -[SiriAnalyticsPreferences initWithPreferencesDomain:](self, "initWithPreferencesDomain:", CFSTR("com.apple.siri.analytics.assistant"));
}

- (SiriAnalyticsPreferences)initWithPreferencesDomain:(__CFString *)a3
{
  SiriAnalyticsPreferences *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriAnalyticsPreferences;
  v4 = -[SiriAnalyticsPreferences init](&v6, sel_init);
  if (v4)
    v4->_domain = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3);
  return v4;
}

- (BOOL)tailMessagesToOSLogEnabled
{
  return CFPreferencesGetAppBooleanValue(CFSTR("Tail to OSLog"), self->_domain, 0) != 0;
}

- (NSData)preprocessorBookmark
{
  return (NSData *)(id)CFPreferencesCopyAppValue(CFSTR("Preprocessor Bookmark"), self->_domain);
}

- (void)setPreprocessorBookmark:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("Preprocessor Bookmark"), a3, self->_domain);
}

- (unint64_t)unifiedStreamMaxSize
{
  return CFPreferencesGetAppIntegerValue(CFSTR("Unified Stream Max Size"), self->_domain, 0);
}

- (void)setUnifiedStreamMaxSize:(unint64_t)a3
{
  CFPreferencesSetAppValue(CFSTR("Unified Stream Max Size"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3), self->_domain);
}

- (unint64_t)unifiedStreamMaxSizeOrDefault
{
  unint64_t result;

  result = -[SiriAnalyticsPreferences unifiedStreamMaxSize](self, "unifiedStreamMaxSize");
  if (!result)
    return 50;
  return result;
}

- (double)unifiedStreamMaxAge
{
  return (double)CFPreferencesGetAppIntegerValue(CFSTR("Unified Stream Max Age"), self->_domain, 0);
}

- (void)setUnifiedStreamMaxAge:(double)a3
{
  CFPreferencesSetAppValue(CFSTR("Unified Stream Max Age"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)a3), self->_domain);
}

- (double)unifiedStreamMaxAgeOrDefault
{
  double result;

  -[SiriAnalyticsPreferences unifiedStreamMaxAge](self, "unifiedStreamMaxAge");
  if (result == 0.0)
    return 604800.0;
  return result;
}

- (id)pluginStateForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SiriAnalyticsPreferences pluginsState](self, "pluginsState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setPluginState:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SiriAnalyticsPreferences pluginsState](self, "pluginsState");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

  -[SiriAnalyticsPreferences setPluginsState:](self, "setPluginsState:", v8);
}

- (id)pluginsState
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("Plugins State"), self->_domain);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  }
  v4 = (void *)v3;

  return v4;
}

- (void)setPluginsState:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("Plugins State"), a3, self->_domain);
}

- (BOOL)killSwitchEnabled
{
  return CFPreferencesGetAppBooleanValue(CFSTR("Kill Switch"), self->_domain, 0) != 0;
}

- (void)setKillSwitchEnabled:(BOOL)a3
{
  const void *v4;

  if (a3)
    v4 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  else
    v4 = 0;
  CFPreferencesSetAppValue(CFSTR("Kill Switch"), v4, self->_domain);
}

- (BOOL)simulateCustomerImage
{
  return CFPreferencesGetAppBooleanValue(CFSTR("Simulate Customer Image"), self->_domain, 0) != 0;
}

- (void)synchronize
{
  CFPreferencesAppSynchronize(self->_domain);
}

- (void)setUnifiedStreamMaxAgeOrDefault:(double)a3
{
  self->_unifiedStreamMaxAgeOrDefault = a3;
}

@end
