@implementation SEMAssistantSettingsBridge

- (SEMAssistantSettingsBridge)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (BOOL)isSiriUODSupported
{
  if ((AFDeviceSupportsSiriUOD() & 1) != 0)
    return 1;
  else
    return AFShouldRunAsrOnServerForUOD();
}

+ (BOOL)isASRSupported
{
  if ((AFDeviceSupportsSiriUOD() & 1) != 0)
    return 1;
  else
    return AFOfflineDictationCapable();
}

+ (id)currentSiriLanguageCode
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;

  objc_msgSend_sharedPreferences(MEMORY[0x24BE09270], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_languageCode(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_length(v6, v7, v8))
  {
    objc_msgSend_sharedPreferences(MEMORY[0x24BE09270], v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bestSupportedLanguageCodeForLanguageCode_(v11, v12, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v13;
  }
  return v6;
}

+ (id)currentDictationLanguageCodes
{
  id v2;
  const char *v3;
  void *v4;
  const char *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v2 = objc_alloc_init(MEMORY[0x24BDE9E08]);
  objc_msgSend_installationStatusForLanguagesWithAssetType_(v2, v3, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_2462FF494;
  v13 = sub_2462FF4A4;
  v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2462FF4AC;
  v8[3] = &unk_251782D78;
  v8[4] = &v9;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v4, v5, (uint64_t)v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (BOOL)isSpeechProfileEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isLinkVocabularyEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)getConformingSharedUserIds
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315138;
    v7 = "+[SEMAssistantSettingsBridge getConformingSharedUserIds]";
    _os_log_error_impl(&dword_2462C4000, v2, OS_LOG_TYPE_ERROR, "%s Unexpected call to getConformingSharedUserIds from non-tvOS platform, returning empty results", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend_set(MEMORY[0x24BDBCF20], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isAssistantEnabled
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char IsEnabled;

  objc_msgSend_sharedPreferences(MEMORY[0x24BE09270], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsEnabled = objc_msgSend_assistantIsEnabled(v3, v4, v5);

  return IsEnabled;
}

+ (BOOL)isDictationEnabled
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char IsEnabled;

  objc_msgSend_sharedPreferences(MEMORY[0x24BE09270], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsEnabled = objc_msgSend_dictationIsEnabled(v3, v4, v5);

  return IsEnabled;
}

@end
