@implementation SVXSpeechSynthesisConfigurationStateManager

- (BOOL)updateConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  void *v18;
  SVXSpeechSynthesisConfiguration *v19;
  void *v20;
  SVXSpeechSynthesisConfiguration *v21;
  SVXSpeechSynthesisConfiguration *currentConfiguration;
  BOOL v23;
  NSObject *v24;
  NSObject *v25;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SVXSpeechSynthesisConfiguration locale](self->_currentConfiguration, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
  {
    v24 = *MEMORY[0x24BE08FB0];
    v8 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "-[SVXSpeechSynthesisConfigurationStateManager updateConfiguration:]";
      v30 = 2112;
      v31 = (unint64_t)v5;
      v32 = 2112;
      v33 = (unint64_t)v7;
      _os_log_impl(&dword_214934000, v24, OS_LOG_TYPE_INFO, "%s locale changed from %@ to %@.", buf, 0x20u);
    }
  }
  else
  {
    v8 = 0;
  }
  -[SVXSpeechSynthesisConfiguration outputVoiceInfo](self->_currentConfiguration, "outputVoiceInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputVoiceInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "isEqual:", v9) & 1) == 0)
  {
    v25 = *MEMORY[0x24BE08FB0];
    v12 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "-[SVXSpeechSynthesisConfigurationStateManager updateConfiguration:]";
      v30 = 2112;
      v31 = (unint64_t)v9;
      v32 = 2112;
      v33 = (unint64_t)v11;
      _os_log_impl(&dword_214934000, v25, OS_LOG_TYPE_INFO, "%s outputVoiceInfo changed from %@ to %@.", buf, 0x20u);
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = -[SVXSpeechSynthesisConfiguration audioSessionID](self->_currentConfiguration, "audioSessionID");
  v14 = objc_msgSend(v4, "audioSessionID");
  if (!(_DWORD)v14 || (v15 = v14, (_DWORD)v14 == (_DWORD)v13))
  {
    v15 = v13;
    if ((v8 | v12) != 1)
    {
      v23 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    v27 = v5;
    v16 = v8;
    v17 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "-[SVXSpeechSynthesisConfigurationStateManager updateConfiguration:]";
      v30 = 2048;
      v31 = v13;
      v32 = 2048;
      v33 = v15;
      _os_log_impl(&dword_214934000, v17, OS_LOG_TYPE_INFO, "%s audioSessionID changed from %lu to %lu.", buf, 0x20u);
    }
    v8 = v16;
    v5 = v27;
  }
  if (v8)
    v18 = v7;
  else
    v18 = v5;
  v19 = [SVXSpeechSynthesisConfiguration alloc];
  if (v12)
    v20 = v11;
  else
    v20 = v9;
  v21 = -[SVXSpeechSynthesisConfiguration initWithLocale:outputVoiceInfo:audioSessionID:](v19, "initWithLocale:outputVoiceInfo:audioSessionID:", v18, v20, v15);
  currentConfiguration = self->_currentConfiguration;
  self->_currentConfiguration = v21;

  v23 = 1;
LABEL_25:

  return v23;
}

- (SVXSpeechSynthesisConfiguration)currentConfiguration
{
  return self->_currentConfiguration;
}

- (SVXClientAudioSystemServicing)clientAudioSystemServicing
{
  return self->_clientAudioSystemServicing;
}

- (void)setClientAudioSystemServicing:(id)a3
{
  objc_storeStrong((id *)&self->_clientAudioSystemServicing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientAudioSystemServicing, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
}

@end
