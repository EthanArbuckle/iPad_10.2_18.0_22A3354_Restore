@implementation SVXSpeechSynthesisUtils

- (SVXSpeechSynthesisUtils)init
{
  SVXNSLocaleFactory *v3;
  SVXSessionUtils *v4;
  SVXSpeechSynthesisUtils *v5;

  v3 = objc_alloc_init(SVXNSLocaleFactory);
  v4 = objc_alloc_init(SVXSessionUtils);
  v5 = -[SVXSpeechSynthesisUtils initWithLocaleFactory:sessionUtils:](self, "initWithLocaleFactory:sessionUtils:", v3, v4);

  return v5;
}

- (SVXSpeechSynthesisUtils)initWithLocaleFactory:(id)a3 sessionUtils:(id)a4
{
  id v7;
  id v8;
  SVXSpeechSynthesisUtils *v9;
  SVXSpeechSynthesisUtils *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXSpeechSynthesisUtils;
  v9 = -[SVXSpeechSynthesisUtils init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localeFactory, a3);
    objc_storeStrong((id *)&v10->_sessionUtils, a4);
  }

  return v10;
}

- (int64_t)getGenderFromVoiceGender:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (id)createLocaleFromLanguageCode:(id)a3
{
  id v4;
  void *v5;
  SVXNSLocaleFactory *localeFactory;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[SVXNSLocaleFactory canonicalLocaleIdentifierFromString:](self->_localeFactory, "canonicalLocaleIdentifierFromString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      localeFactory = self->_localeFactory;
      v7 = v5;
    }
    else
    {
      v10 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      {
        v12 = 136315394;
        v13 = "-[SVXSpeechSynthesisUtils createLocaleFromLanguageCode:]";
        v14 = 2112;
        v15 = v4;
        _os_log_error_impl(&dword_214934000, v10, OS_LOG_TYPE_ERROR, "%s Canonical locale identifier is nil, fallback to use language code %@ directly.", (uint8_t *)&v12, 0x16u);
      }
      localeFactory = self->_localeFactory;
      v7 = v4;
    }
    -[SVXNSLocaleFactory localeWithLocaleIdentifier:](localeFactory, "localeWithLocaleIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[SVXSpeechSynthesisUtils createLocaleFromLanguageCode:]";
      _os_log_error_impl(&dword_214934000, v8, OS_LOG_TYPE_ERROR, "%s No language code.", (uint8_t *)&v12, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (id)getLocaleWithAllowsFallback:(BOOL)a3 preferences:(id)a4
{
  _BOOL8 v4;
  id v6;
  __CFString *v7;
  __CFString *v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SVXSpeechSynthesisUtils getLocaleWithAllowsFallback:preferences:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("SVXSpeechSynthesisUtils.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferences != nil"));

  }
  -[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:](self->_sessionUtils, "getLanguageCodeWithAllowsFallback:preferences:", v4, v6);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[SVXSpeechSynthesisUtils createLocaleFromLanguageCode:](self, "createLocaleFromLanguageCode:", v7);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = (os_log_t *)MEMORY[0x24BE08FB0];
    v10 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v12 = v10;
      v13 = -[__CFString length](v7, "length");
      v14 = CFSTR("nil");
      if (v13)
        v14 = v7;
      *(_DWORD *)buf = 136315394;
      v19 = "-[SVXSpeechSynthesisUtils getLocaleWithAllowsFallback:preferences:]";
      v20 = 2112;
      v21 = v14;
      _os_log_error_impl(&dword_214934000, v12, OS_LOG_TYPE_ERROR, "%s Locale is nil. (Siri language code is %@)", buf, 0x16u);

      if (v4)
        goto LABEL_6;
    }
    else if (v4)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[SVXSpeechSynthesisUtils getLocaleWithAllowsFallback:preferences:]";
        v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s Resolved locale is %@.", buf, 0x16u);
      }
      goto LABEL_12;
    }
    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (id)getOutputVoiceInfoWithAllowsFallback:(BOOL)a3 preferences:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  os_log_t *v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("SVXSpeechSynthesisUtils.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferences != nil"));

  }
  objc_msgSend(v6, "outputVoice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    v10 = (os_log_t *)MEMORY[0x24BE08FB0];
    v11 = *MEMORY[0x24BE08FB0];
    v12 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:]";
        v13 = "%s Output voice info does not have language code.";
        goto LABEL_17;
      }
    }
    else if (v12)
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:]";
      v13 = "%s Output voice info is nil.";
LABEL_17:
      _os_log_error_impl(&dword_214934000, v11, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
      if (!v4)
        goto LABEL_18;
      goto LABEL_9;
    }
    if (!v4)
    {
LABEL_18:
      v18 = 0;
      v14 = v7;
LABEL_19:

      v7 = (void *)v18;
      goto LABEL_20;
    }
LABEL_9:
    -[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:](self->_sessionUtils, "getLanguageCodeWithAllowsFallback:preferences:", 1, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:]";
      v25 = 2112;
      v26 = (uint64_t)v14;
      _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s Siri language code is %@.", buf, 0x16u);
    }
    AFOutputVoiceLanguageForRecognitionLanguage();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:]";
      v25 = 2112;
      v26 = (uint64_t)v16;
      _os_log_impl(&dword_214934000, v17, OS_LOG_TYPE_INFO, "%s Output voice language code is %@.", buf, 0x16u);
    }
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BE093A0]), "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", v16, objc_msgSend(v7, "gender"), 1, 0, 0, 0, 0);

    v19 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:]";
      v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_214934000, v19, OS_LOG_TYPE_INFO, "%s Resolved output voice info is %@.", buf, 0x16u);
    }

    goto LABEL_19;
  }
LABEL_20:

  return v7;
}

- (id)createAudioFromUIAudioData:(id)a3
{
  id v3;
  SVXSpeechSynthesisAudio *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SVXSpeechSynthesisAudio *v10;

  if (a3)
  {
    v3 = a3;
    v4 = [SVXSpeechSynthesisAudio alloc];
    objc_msgSend(v3, "audioBuffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decoderStreamDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SVXAudioStreamBasicDescriptionCreateFromUIAudioDescription(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "playerStreamDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    SVXAudioStreamBasicDescriptionCreateFromUIAudioDescription(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SVXSpeechSynthesisAudio initWithData:decoderASBD:playerASBD:](v4, "initWithData:decoderASBD:playerASBD:", v5, v7, v9);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BOOL)requestHasSpeakableContents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "speakableText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5
    || (objc_msgSend(v3, "presynthesizedAudio"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "data"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v6,
        v8))
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v3, "localizationKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "length") != 0;

  }
  return v9;
}

- (id)createPhaticPrompt
{
  return -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:]([SVXSpeechSynthesisRequest alloc], "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", 2, 0, CFSTR("\x1B\\mrk=play=phat\\"), 0, 0, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUtils, 0);
  objc_storeStrong((id *)&self->_localeFactory, 0);
}

@end
