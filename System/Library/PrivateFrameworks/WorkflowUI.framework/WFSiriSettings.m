@implementation WFSiriSettings

+ (BOOL)isHeySiriEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceTriggerEnabled");

  return v3;
}

+ (BOOL)isSiriEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assistantIsEnabled");

  return v3;
}

+ (id)localizedTriggerPhraseWithMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[WFSiriSettings localizedTriggerPhrase](WFSiriSettings, "localizedTriggerPhrase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringWithKey(CFSTR("SIRI_TRIGGER_PHRASE_FORMAT"), CFSTR("%@, %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v5, v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)localizedTriggerPhrase
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC1DE8], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isCompactVoiceTriggerAvailableForLanguageCode:", v3))
  {
    v11 = 0;
    v5 = objc_msgSend(v4, "getUserPreferredVoiceTriggerPhraseTypeForDeviceType:endpointId:error:", 0, 0, &v11);
    v6 = v11;
    if (v6)
    {
      getWFGeneralLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "+[WFSiriSettings localizedTriggerPhrase]";
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_22007E000, v7, OS_LOG_TYPE_ERROR, "%s Error getting Siri phrase type: %@", buf, 0x16u);
      }

      goto LABEL_6;
    }
    if (v5 == 1)
    {
      objc_msgSend(v4, "localizedCompactTriggerPhraseForLanguageCode:", v3);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v5)
      {
LABEL_6:
        v8 = 0;
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(v4, "localizedTriggerPhraseForLanguageCode:", v3);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v9;
    goto LABEL_13;
  }
  objc_msgSend(v4, "localizedTriggerPhraseForLanguageCode:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v8;
}

@end
