@implementation SVXSynthesisVoiceConfigurer

- (SVXSynthesisVoiceConfigurer)initWithConfigurationManager:(id)a3 speechSynthesisUtils:(id)a4 sessionUtils:(id)a5 voiceGenderConverter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SVXSynthesisVoiceConfigurer *v15;
  SVXSynthesisVoiceConfigurer *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SVXSynthesisVoiceConfigurer;
  v15 = -[SVXSynthesisVoiceConfigurer init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configurationManager, a3);
    objc_storeStrong((id *)&v16->_speechSynthesisUtils, a4);
    objc_storeStrong((id *)&v16->_sessionUtils, a5);
    objc_storeStrong((id *)&v16->_voiceGenderConverter, a6);
  }

  return v16;
}

- (id)voiceForContext:(id)a3 preferences:(id)a4
{
  id v6;
  SVXSpeechSynthesisConfigurationStateManager *configurationManager;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  configurationManager = self->_configurationManager;
  v8 = a3;
  -[SVXSpeechSynthesisConfigurationStateManager currentConfiguration](configurationManager, "currentConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outputVoiceInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:](self->_speechSynthesisUtils, "getOutputVoiceInfoWithAllowsFallback:preferences:", 1, v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  -[SVXSynthesisVoiceConfigurer _determineLanguageCodeWithContext:outputVoiceInfo:preferences:](self, "_determineLanguageCodeWithContext:outputVoiceInfo:preferences:", v8, v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SVXSynthesisVoiceConfigurer _determineGenderWithContext:outputVoiceInfo:languageCode:](self, "_determineGenderWithContext:outputVoiceInfo:languageCode:", v8, v13, v14);
  -[SVXSynthesisVoiceConfigurer _determineVoiceNameWithContext:languageCode:outputVoiceInfo:gender:](self, "_determineVoiceNameWithContext:languageCode:outputVoiceInfo:gender:", v8, v14, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315906;
    v21 = "-[SVXSynthesisVoiceConfigurer voiceForContext:preferences:]";
    v22 = 2112;
    v23 = v16;
    v24 = 2112;
    v25 = v14;
    v26 = 2048;
    v27 = v15;
    _os_log_impl(&dword_214934000, v17, OS_LOG_TYPE_DEFAULT, "%s Voice name %@ for %@, %ld", (uint8_t *)&v20, 0x2Au);
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A58]), "initWithLanguage:name:", v14, v16);

  return v18;
}

- (id)_determineLanguageCodeWithContext:(id)a3 outputVoiceInfo:(id)a4 preferences:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(v8, "languageCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(v9, "languageCode");
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  if (!objc_msgSend(v11, "length"))
  {
    -[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:](self->_sessionUtils, "getLanguageCodeWithAllowsFallback:preferences:", 1, v10);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }

  return v11;
}

- (int64_t)_determineGenderWithContext:(id)a3 outputVoiceInfo:(id)a4 languageCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8
    || (v11 = -[SVXVoiceGenderConverter getSpeechGenderFromGender:](self->_voiceGenderConverter, "getSpeechGenderFromGender:", objc_msgSend(v8, "gender"))) == 0)
  {
    v11 = -[SVXVoiceGenderConverter getSpeechGenderFromVoiceInfo:](self->_voiceGenderConverter, "getSpeechGenderFromVoiceInfo:", v9);
    if (!v11)
    {
      if (objc_msgSend(MEMORY[0x24BE093A0], "defaultGenderForOutputVoiceLanguageCode:", v10) == 1)
        v11 = 1;
      else
        v11 = 2;
    }
  }

  return v11;
}

- (id)_determineVoiceNameWithContext:(id)a3 languageCode:(id)a4 outputVoiceInfo:(id)a5 gender:(int64_t)a6
{
  id v10;
  __CFString *v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  os_log_t *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int64_t v20;
  NSObject *v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  const __CFString *v28;
  NSObject *v29;
  int v31;
  const char *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  int64_t v38;
  __int16 v39;
  int64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (__CFString *)a4;
  v12 = a5;
  if (v10)
  {
    objc_msgSend(v10, "voiceName");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  if (-[__CFString length](v13, "length"))
  {
    v14 = v13;
    goto LABEL_16;
  }
  v15 = (os_log_t *)MEMORY[0x24BE08FB0];
  v16 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    objc_msgSend(v12, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 136315906;
    v32 = "-[SVXSynthesisVoiceConfigurer _determineVoiceNameWithContext:languageCode:outputVoiceInfo:gender:]";
    v33 = 2112;
    v34 = v11;
    v35 = 2048;
    v36 = a6;
    v37 = 2112;
    v38 = (int64_t)v18;
    _os_log_impl(&dword_214934000, v17, OS_LOG_TYPE_DEFAULT, "%s languageCode: %@, gender: %ld, outputVoiceInfo: %@", (uint8_t *)&v31, 0x2Au);

  }
  objc_msgSend(v12, "languageCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqualToString:", v11))
  {
    v20 = -[SVXVoiceGenderConverter getSpeechGenderFromVoiceInfo:](self->_voiceGenderConverter, "getSpeechGenderFromVoiceInfo:", v12);

    if (v20 == a6)
    {
      objc_msgSend(v12, "name");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v21 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
      {
        v31 = 136315906;
        v32 = "-[SVXSynthesisVoiceConfigurer _determineVoiceNameWithContext:languageCode:outputVoiceInfo:gender:]";
        v33 = 2112;
        v34 = v14;
        v35 = 2112;
        v36 = (int64_t)v11;
        v37 = 2048;
        v38 = a6;
        _os_log_impl(&dword_214934000, v21, OS_LOG_TYPE_DEFAULT, "%s Using voice name %@ for %@, %ld", (uint8_t *)&v31, 0x2Au);
      }
      goto LABEL_16;
    }
  }
  else
  {

  }
  AFOutputVoiceLanguageForRecognitionLanguage();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SVXVoiceGenderConverter getAFVoiceGenderFromTTSAssetVoiceGender:](self->_voiceGenderConverter, "getAFVoiceGenderFromTTSAssetVoiceGender:", a6);
  objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "voiceNamesForOutputLanguageCode:gender:", v22, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v26 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 136316162;
    v32 = "-[SVXSynthesisVoiceConfigurer _determineVoiceNameWithContext:languageCode:outputVoiceInfo:gender:]";
    v33 = 2112;
    v34 = v14;
    v35 = 2112;
    v36 = (int64_t)v11;
    v37 = 2112;
    v38 = (int64_t)v22;
    v39 = 2048;
    v40 = a6;
    _os_log_impl(&dword_214934000, v26, OS_LOG_TYPE_DEFAULT, "%s Using fallback voice name %@ for language code: %@ outputLanguageCode: %@, %ld", (uint8_t *)&v31, 0x34u);
  }

LABEL_16:
  if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("hattori")))
  {
    v27 = *MEMORY[0x24BE08FB0];
    v28 = CFSTR("hiro");
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v31 = 136315394;
      v32 = "-[SVXSynthesisVoiceConfigurer _determineVoiceNameWithContext:languageCode:outputVoiceInfo:gender:]";
      v33 = 2112;
      v34 = CFSTR("hiro");
      _os_log_impl(&dword_214934000, v27, OS_LOG_TYPE_DEFAULT, "%s Old male voice name in ja-JP was used. Updating to %@", (uint8_t *)&v31, 0x16u);
    }
LABEL_23:

    v14 = (__CFString *)v28;
    goto LABEL_24;
  }
  if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("oren")))
  {
    v29 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v31 = 136315394;
      v32 = "-[SVXSynthesisVoiceConfigurer _determineVoiceNameWithContext:languageCode:outputVoiceInfo:gender:]";
      v33 = 2112;
      v34 = CFSTR("hiro");
      _os_log_impl(&dword_214934000, v29, OS_LOG_TYPE_DEFAULT, "%s Old female voice name in ja-JP was used. Updating to %@", (uint8_t *)&v31, 0x16u);
    }
    v28 = CFSTR("sakura");
    goto LABEL_23;
  }
LABEL_24:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceGenderConverter, 0);
  objc_storeStrong((id *)&self->_sessionUtils, 0);
  objc_storeStrong((id *)&self->_speechSynthesisUtils, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end
