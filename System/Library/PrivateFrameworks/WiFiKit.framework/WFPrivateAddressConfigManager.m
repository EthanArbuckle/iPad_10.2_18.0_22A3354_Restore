@implementation WFPrivateAddressConfigManager

- (WFPrivateAddressConfigManager)init
{
  WFPrivateAddressConfigManager *v2;
  uint64_t v3;
  NSObject *v5;
  os_log_type_t v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)WFPrivateAddressConfigManager;
  v2 = -[WFPrivateAddressConfigManager init](&v7, sel_init);
  if (!v2)
  {
LABEL_9:

    return 0;
  }
  v3 = SCPreferencesCreateWithOptions();
  v2->_prefs = (__SCPreferences *)v3;
  if (!v3)
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[WFPrivateAddressConfigManager init]";
      _os_log_impl(&dword_219FC8000, v5, v6, "%s: failed to get SCPreferencesRef", buf, 0xCu);
    }

    goto LABEL_9;
  }
  return v2;
}

- (void)dealloc
{
  __SCPreferences *prefs;
  objc_super v4;

  prefs = self->_prefs;
  if (prefs)
  {
    CFRelease(prefs);
    self->_prefs = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WFPrivateAddressConfigManager;
  -[WFPrivateAddressConfigManager dealloc](&v4, sel_dealloc);
}

- (id)privateAddressConfig
{
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (-[WFPrivateAddressConfigManager prefs](self, "prefs"))
  {
    if (!SCPreferencesLock(-[WFPrivateAddressConfigManager prefs](self, "prefs"), 0))
    {
      SCPreferencesSynchronize(-[WFPrivateAddressConfigManager prefs](self, "prefs"));
      SCPreferencesLock(-[WFPrivateAddressConfigManager prefs](self, "prefs"), 1u);
    }
    SCPreferencesGetValue(-[WFPrivateAddressConfigManager prefs](self, "prefs"), CFSTR("List of scanned networks with private mac"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WFLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
    {
      v6 = 136315138;
      v7 = "-[WFPrivateAddressConfigManager privateAddressConfig]";
      _os_log_impl(&dword_219FC8000, v4, v5, "%s: failed to get SCPreferencesRef", (uint8_t *)&v6, 0xCu);
    }

    return 0;
  }
}

- (__SCPreferences)prefs
{
  return self->_prefs;
}

- (void)setPrefs:(__SCPreferences *)a3
{
  self->_prefs = a3;
}

@end
