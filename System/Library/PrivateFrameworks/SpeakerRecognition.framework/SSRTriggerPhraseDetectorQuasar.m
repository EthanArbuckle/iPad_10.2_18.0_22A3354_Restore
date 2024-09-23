@implementation SSRTriggerPhraseDetectorQuasar

- (SSRTriggerPhraseDetectorQuasar)initWithLocale:(id)a3 configPath:(id)a4 resourcePath:(id)a5
{
  id v9;
  id v10;
  id v11;
  SSRTriggerPhraseDetectorQuasar *v12;
  SSRTriggerPhraseDetectorQuasar *v13;
  uint64_t v14;
  _EARSyncSpeechRecognizer *syncRecognizer;
  SSRTriggerPhraseDetectorQuasar *v16;
  objc_super v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SSRTriggerPhraseDetectorQuasar;
  v12 = -[SSRTriggerPhraseDetectorQuasar init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_locale, a3);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE2E740]), "initWithConfiguration:", v10);
    syncRecognizer = v13->_syncRecognizer;
    v13->_syncRecognizer = (_EARSyncSpeechRecognizer *)v14;

  }
  v16 = v13;

  return v16;
}

- (void)reset
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SSRTriggerPhraseDetectorQuasar reset]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  LODWORD(v5) = 120;
  LOBYTE(v4) = 0;
  -[_EARSyncSpeechRecognizer resetWithSamplingRate:language:taskType:userId:sessionId:deviceId:farField:audioSource:maxAudioBufferSizeSeconds:](self->_syncRecognizer, "resetWithSamplingRate:language:taskType:userId:sessionId:deviceId:farField:audioSource:maxAudioBufferSizeSeconds:", 16000, self->_locale, CFSTR("Dictation"), &stru_24CC88468, &stru_24CC88468, &stru_24CC88468, v4, CFSTR("Second Pass"), v5);
}

- (id)analyzeWavData:(id)a3 numSamples:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[_EARSyncSpeechRecognizer resultsWithAddedAudio:numberOfSamples:taskName:](self->_syncRecognizer, "resultsWithAddedAudio:numberOfSamples:taskName:", v6, a4, &stru_24CC88468);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "tokens");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "count");

    if (v11)
    {
      v17 = CFSTR("best_score");
      v12 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v9, "tokens");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "confidence");
      objc_msgSend(v12, "numberWithDouble:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)endAudio
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[_EARSyncSpeechRecognizer resultsWithEndedAudio](self->_syncRecognizer, "resultsWithEndedAudio");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "tokens");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "count");

    if (v6)
    {
      v12 = CFSTR("best_score");
      v7 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "tokens");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "confidence");
      objc_msgSend(v7, "numberWithDouble:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_syncRecognizer, 0);
}

@end
