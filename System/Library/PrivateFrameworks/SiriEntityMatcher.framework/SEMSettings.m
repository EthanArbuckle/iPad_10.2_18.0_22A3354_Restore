@implementation SEMSettings

+ (id)defaultSettings
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t isAssistantEnabled;
  const char *v9;
  void *v10;

  v2 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_defaultLocalization(SEMLocalization, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isAssistantEnabled = objc_msgSend_isAssistantEnabled(SEMAssistantSettingsBridge, v6, v7);
  v10 = (void *)objc_msgSend_initWithLocalization_assistantEnabled_(v2, v9, (uint64_t)v5, isAssistantEnabled);

  return v10;
}

+ (BOOL)useSensitiveLogging
{
  void *v2;
  BOOL v3;

  v2 = (void *)xpc_copy_entitlements_for_self();
  v3 = xpc_dictionary_get_BOOL(v2, "com.apple.siri.inference.EntityMatcher.useSensitiveLogging");

  return v3;
}

- (SEMSettings)initWithLocalization:(id)a3 assistantEnabled:(BOOL)a4
{
  id v7;
  SEMSettings *v8;
  SEMSettings *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SEMSettings;
  v8 = -[SEMSettings init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_localization, a3);
    atomic_store(a4, (unsigned __int8 *)&v9->_assistantEnabled);
  }

  return v9;
}

- (void)refresh
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SEMSettings refresh]";
    _os_log_impl(&dword_2462C4000, v3, OS_LOG_TYPE_INFO, "%s Refreshing localization and enablement options", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend_refresh(self->_localization, v4, v5);
  atomic_store(objc_msgSend_isAssistantEnabled(SEMAssistantSettingsBridge, v6, v7), (unsigned __int8 *)&self->_assistantEnabled);
}

- (BOOL)isAssistantEnabled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_assistantEnabled);
  return v2 & 1;
}

- (BOOL)isEvaluationEnabled
{
  uint64_t v2;
  CFPropertyListRef v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  char v7;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend_isCustomerInstall(SEMAssistantSettingsBridge, a2, v2) & 1) == 0)
  {
    v3 = CFPreferencesCopyAppValue(CFSTR("Evaluation Enabled"), CFSTR("com.apple.SiriEntityMatcher"));
    if (v3)
    {
      v4 = (void *)v3;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v7 = objc_msgSend_BOOLValue(v4, v5, v6);

        return v7;
      }
      v9 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v10 = 136315650;
        v11 = "_BOOLValueForKey";
        v12 = 2112;
        v13 = v4;
        v14 = 2112;
        v15 = CFSTR("Evaluation Enabled");
        _os_log_error_impl(&dword_2462C4000, v9, OS_LOG_TYPE_ERROR, "%s value %@ for key %@ should respond to -BOOLValue", (uint8_t *)&v10, 0x20u);
      }

    }
  }
  return 0;
}

- (void)setEvaluationEnabled:(BOOL)a3
{
  id v3;

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], a2, a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("Evaluation Enabled"), v3, CFSTR("com.apple.SiriEntityMatcher"));

}

- (BOOL)_isSiriUODSupported
{
  uint64_t v2;
  char isSiriUODSupported;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  isSiriUODSupported = objc_msgSend_isSiriUODSupported(SEMAssistantSettingsBridge, a2, v2);
  if ((isSiriUODSupported & 1) == 0)
  {
    v4 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[SEMSettings _isSiriUODSupported]";
      _os_log_impl(&dword_2462C4000, v4, OS_LOG_TYPE_INFO, "%s Siri Understanding on Device not supported", (uint8_t *)&v6, 0xCu);
    }
  }
  return isSiriUODSupported;
}

- (BOOL)isUserExclusiveSet:(id)a3
{
  return 0;
}

- (BOOL)isSupportedDevicePlatform:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend_isAssistantEnabled(self, a2, a3) & 1) == 0)
  {
    v7 = qword_25441F970;
    v6 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
    if (!v6)
      return v6;
    v13 = 136315138;
    v14 = "-[SEMSettings isSupportedDevicePlatform:]";
    _os_log_impl(&dword_2462C4000, v7, OS_LOG_TYPE_INFO, "%s Siri Assistant is not enabled in settings", (uint8_t *)&v13, 0xCu);
LABEL_8:
    LOBYTE(v6) = 0;
    return v6;
  }
  if (v3 < 2)
    goto LABEL_8;
  if ((_DWORD)v3 == 3)
  {
    LOBYTE(v6) = MEMORY[0x24BEDD108](self, sel__isSiriUODSupported, v5);
    return v6;
  }
  if ((_DWORD)v3 != 2)
  {
    v8 = (void *)qword_25441F970;
    v6 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR);
    if (!v6)
      return v6;
    v9 = v8;
    sub_2462FF088(v3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[SEMSettings isSupportedDevicePlatform:]";
    v15 = 2112;
    v16 = v11;
    _os_log_error_impl(&dword_2462C4000, v9, OS_LOG_TYPE_ERROR, "%s Unexpected capability type: %@", (uint8_t *)&v13, 0x16u);

    goto LABEL_8;
  }
  LOBYTE(v6) = 1;
  return v6;
}

+ (void)enableOverrideAcceptAllSets
{
  const __CFString *v2;

  v2 = (const __CFString *)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Accept %@"), CFSTR("*"));
  CFPreferencesSetAppValue(v2, MEMORY[0x24BDBD1C8], CFSTR("com.apple.SiriEntityMatcher"));
}

+ (void)disableOverrideAcceptAllSets
{
  const __CFString *v2;

  v2 = (const __CFString *)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Accept %@"), CFSTR("*"));
  CFPreferencesSetAppValue(v2, 0, CFSTR("com.apple.SiriEntityMatcher"));
}

- (SEMLocalization)localization
{
  return (SEMLocalization *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localization, 0);
}

@end
