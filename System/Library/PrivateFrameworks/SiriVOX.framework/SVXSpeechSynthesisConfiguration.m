@implementation SVXSpeechSynthesisConfiguration

- (SVXSpeechSynthesisConfiguration)initWithLocale:(id)a3 outputVoiceInfo:(id)a4 audioSessionID:(unsigned int)a5
{
  id v8;
  id v9;
  SVXSpeechSynthesisConfiguration *v10;
  uint64_t v11;
  NSLocale *locale;
  uint64_t v13;
  AFVoiceInfo *outputVoiceInfo;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SVXSpeechSynthesisConfiguration;
  v10 = -[SVXSpeechSynthesisConfiguration init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    locale = v10->_locale;
    v10->_locale = (NSLocale *)v11;

    v13 = objc_msgSend(v9, "copy");
    outputVoiceInfo = v10->_outputVoiceInfo;
    v10->_outputVoiceInfo = (AFVoiceInfo *)v13;

    v10->_audioSessionID = a5;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  SVXSpeechSynthesisConfiguration *v4;
  SVXSpeechSynthesisConfiguration *v5;
  NSLocale *v6;
  NSLocale *locale;
  AFVoiceInfo *v8;
  AFVoiceInfo *outputVoiceInfo;
  unsigned int audioSessionID;
  BOOL v11;

  v4 = (SVXSpeechSynthesisConfiguration *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SVXSpeechSynthesisConfiguration locale](v5, "locale");
      v6 = (NSLocale *)objc_claimAutoreleasedReturnValue();
      locale = self->_locale;
      if (locale == v6 || -[NSLocale isEqual:](locale, "isEqual:", v6))
      {
        -[SVXSpeechSynthesisConfiguration outputVoiceInfo](v5, "outputVoiceInfo");
        v8 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue();
        outputVoiceInfo = self->_outputVoiceInfo;
        if (outputVoiceInfo == v8 || -[AFVoiceInfo isEqual:](outputVoiceInfo, "isEqual:", v8))
        {
          audioSessionID = self->_audioSessionID;
          v11 = audioSessionID == -[SVXSpeechSynthesisConfiguration audioSessionID](v5, "audioSessionID");
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (AFVoiceInfo)outputVoiceInfo
{
  return self->_outputVoiceInfo;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_outputVoiceInfo, 0);
}

+ (SVXSpeechSynthesisConfiguration)configurationWithLocale:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocale:outputVoiceInfo:audioSessionID:", v3, 0, 0);

  return (SVXSpeechSynthesisConfiguration *)v4;
}

+ (SVXSpeechSynthesisConfiguration)configurationWithOutputVoiceInfo:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocale:outputVoiceInfo:audioSessionID:", 0, v3, 0);

  return (SVXSpeechSynthesisConfiguration *)v4;
}

+ (SVXSpeechSynthesisConfiguration)configurationWithAudioSessionID:(unsigned int)a3
{
  return (SVXSpeechSynthesisConfiguration *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocale:outputVoiceInfo:audioSessionID:", 0, 0, *(_QWORD *)&a3);
}

@end
