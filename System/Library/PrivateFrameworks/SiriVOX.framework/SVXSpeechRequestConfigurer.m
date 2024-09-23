@implementation SVXSpeechRequestConfigurer

- (SVXSpeechRequestConfigurer)initWithConfigurationManager:(id)a3 voiceConfigurer:(id)a4
{
  id v7;
  id v8;
  SVXSpeechRequestConfigurer *v9;
  SVXSpeechRequestConfigurer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXSpeechRequestConfigurer;
  v9 = -[SVXSpeechRequestConfigurer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configurationManager, a3);
    objc_storeStrong((id *)&v10->_voiceConfigurer, a4);
  }

  return v10;
}

- (id)speechRequestForContext:(id)a3 preferences:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SVXSynthesisVoiceConfigurer voiceForContext:preferences:](self->_voiceConfigurer, "voiceForContext:preferences:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA7A40]), "initWithText:voice:", &stru_24D24F378, v7);
  objc_msgSend(v8, "speakableContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContextInfo:", v10);

  v11 = objc_msgSend(v6, "audioSessionID");
  if (!(_DWORD)v11)
  {
    objc_msgSend(v6, "audioSessionAssertion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "audioSessionID");
    if (!(_DWORD)v11)
    {
      -[SVXSpeechSynthesisConfigurationStateManager currentConfiguration](self->_configurationManager, "currentConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "audioSessionID");

    }
  }
  v14 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v16 = 136315394;
    v17 = "-[SVXSpeechRequestConfigurer speechRequestForContext:preferences:]";
    v18 = 2048;
    v19 = v11;
    _os_log_impl(&dword_214934000, v14, OS_LOG_TYPE_INFO, "%s audioSessionID = %lu", (uint8_t *)&v16, 0x16u);
  }
  objc_msgSend(v9, "setAudioSessionId:", v11);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceConfigurer, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end
