@implementation SEMSandboxSettings

+ (id)defaultSandboxSettings
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;

  v2 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_defaultLocalization(SEMLocalization, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend_initWithLocalization_assistantEnabled_(v2, v6, (uint64_t)v5, 1);

  return v7;
}

+ (SEMSandboxSettings)sandboxSettingsWithLocale:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  SEMLocalization *v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend_supportedLanguageCodeFromLocale_(SEMLocalization, v6, (uint64_t)v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = [SEMLocalization alloc];
    v12 = (void *)objc_msgSend_initWithSiriLanguageCode_(v10, v11, (uint64_t)v9);
    v13 = objc_alloc((Class)objc_opt_class());
    v15 = (void *)objc_msgSend_initWithLocalization_assistantEnabled_(v13, v14, (uint64_t)v12, 1);

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD0FC8];
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_localeIdentifier(v5, v7, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v17, v19, (uint64_t)CFSTR("Unsupported locale: %@"), v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v20;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v21, (uint64_t)v28, &v27, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v23, (uint64_t)CFSTR("com.apple.siri.inference.EntityMatcher.sandbox"), 4, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a4 && v24)
      *a4 = objc_retainAutorelease(v24);

    v15 = 0;
  }

  return (SEMSandboxSettings *)v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t isAssistantEnabled;
  const char *v13;
  const char *v14;
  id v15;

  v4 = a3;
  objc_msgSend_localization(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, CFSTR("l"));

  v9 = (void *)MEMORY[0x24BDD16E0];
  isAssistantEnabled = objc_msgSend_isAssistantEnabled(self, v10, v11);
  objc_msgSend_numberWithBool_(v9, v13, isAssistantEnabled);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v15, CFSTR("a"));

}

- (SEMSandboxSettings)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  SEMSandboxSettings *v15;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, CFSTR("l"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, CFSTR("a"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend_BOOLValue(v10, v11, v12);
  v15 = (SEMSandboxSettings *)objc_msgSend_initWithLocalization_assistantEnabled_(self, v14, (uint64_t)v7, v13);

  return v15;
}

- (BOOL)isSupportedDevicePlatform:(unsigned __int8)a3
{
  return a3 != 0;
}

@end
