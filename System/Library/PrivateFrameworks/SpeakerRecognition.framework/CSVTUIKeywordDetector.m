@implementation CSVTUIKeywordDetector

- (CSVTUIKeywordDetector)initWithAsset:(id)a3
{
  id v4;
  CSVTUIKeywordDetector *v5;
  void *v6;
  void *v7;
  SSRTriggerPhraseDetectorNDAPI *v8;
  SSRTriggerPhraseDetectorNDAPI *keywordAnalyzer;
  void *v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  id v16;
  int v17;
  int v18;
  int v19;
  double v20;
  double v21;
  uint64_t v22;
  CSAudioCircularBuffer *audioBuffer;
  CSVTUIKeywordDetector *v24;
  NSObject *v25;
  NSObject *v26;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CSVTUIKeywordDetector;
  v5 = -[CSVTUIKeywordDetector init](&v28, sel_init);
  if (!v5)
    goto LABEL_5;
  if (!v4)
  {
    v25 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[CSVTUIKeywordDetector initWithAsset:]";
      _os_log_error_impl(&dword_2117D4000, v25, OS_LOG_TYPE_ERROR, "%s Cannot create CSVTUIKeywordDetector since there is no asset available", buf, 0xCu);
    }
    goto LABEL_11;
  }
  objc_msgSend(v4, "resourcePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("config.txt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SSRTriggerPhraseDetectorNDAPI initWithConfigPath:resourcePath:phId:]([SSRTriggerPhraseDetectorNDAPI alloc], "initWithConfigPath:resourcePath:phId:", v7, v6, 0);
  keywordAnalyzer = v5->_keywordAnalyzer;
  v5->_keywordAnalyzer = v8;

  if (!v5->_keywordAnalyzer)
  {
    v26 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[CSVTUIKeywordDetector initWithAsset:]";
      _os_log_error_impl(&dword_2117D4000, v26, OS_LOG_TYPE_ERROR, "%s Cannot create CSVTUIKeywordDetector since we cannot initialize NDAPI", buf, 0xCu);
    }

LABEL_11:
    v24 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BE283F8], "decodeConfigFrom:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "threshold");
  v5->_keywordThreshold = v11;
  objc_msgSend(MEMORY[0x24BE284B0], "decodeConfigFrom:forFirstPassSource:", v4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preTriggerAudioTime");
  v14 = v13;
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  v5->_extraSamplesAtStart = (unint64_t)(float)(v14 * v15);
  v16 = objc_alloc(MEMORY[0x24BE28398]);
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingDurationInSecs");
  v18 = v17;
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  LODWORD(v20) = v19;
  LODWORD(v21) = v18;
  v22 = objc_msgSend(v16, "initWithNumChannels:recordingDuration:samplingRate:", 1, v21, v20);
  audioBuffer = v5->_audioBuffer;
  v5->_audioBuffer = (CSAudioCircularBuffer *)v22;

  -[CSVTUIKeywordDetector reset](v5, "reset");
LABEL_5:
  v24 = v5;
LABEL_12:

  return v24;
}

- (void)reset
{
  self->_lastKeywordScore = -10000.0;
  -[SSRTriggerPhraseDetectorNDAPI reset](self->_keywordAnalyzer, "reset");
  -[CSAudioCircularBuffer reset](self->_audioBuffer, "reset");
}

- (id)analyze:(id)a3
{
  id v4;
  unint64_t v5;
  unsigned int v6;
  CSAudioCircularBuffer *audioBuffer;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  float lastKeywordScore;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingBytesPerFrame");
  audioBuffer = self->_audioBuffer;
  v8 = v5 / v6;
  v9 = objc_retainAutorelease(v4);
  -[CSAudioCircularBuffer addSamples:numSamples:](audioBuffer, "addSamples:numSamples:", objc_msgSend(v9, "bytes"), v8);
  -[SSRTriggerPhraseDetectorNDAPI analyzeWavData:numSamples:](self->_keywordAnalyzer, "analyzeWavData:numSamples:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "bestScore");
    v13 = v12;
    lastKeywordScore = self->_lastKeywordScore;
    v15 = lastKeywordScore >= v13 && lastKeywordScore >= self->_keywordThreshold;
    v17 = lastKeywordScore >= v13;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "bestStart"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v18, *MEMORY[0x24BE285D8]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "bestEnd"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v19, *MEMORY[0x24BE285B8]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "samplesFed"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v20, *MEMORY[0x24BE285A8]);

    *(float *)&v21 = self->_lastKeywordScore;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v22, *MEMORY[0x24BE285D0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v23, *MEMORY[0x24BE28580]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v24, *MEMORY[0x24BE28578]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v11, "phId"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v25, *MEMORY[0x24BE28568]);

    self->_lastKeywordScore = v13;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)triggeredUtterance:(id)a3
{
  void *v4;
  unsigned int v5;
  unint64_t extraSamplesAtStart;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BE285D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  extraSamplesAtStart = self->_extraSamplesAtStart;
  if (extraSamplesAtStart <= v5)
    v7 = v5 - extraSamplesAtStart;
  else
    v7 = 0;
  v8 = (void *)-[CSAudioCircularBuffer copySamplesFrom:to:](self->_audioBuffer, "copySamplesFrom:to:", -[CSAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount")- -[CSVTUIKeywordDetector _sampleLengthFrom:To:](self, "_sampleLengthFrom:To:", v7, -[CSAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount")), -[CSAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount"));
  objc_msgSend(v8, "dataForChannel:", objc_msgSend(MEMORY[0x24BE283F0], "channelForProcessedInput"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)_sampleLengthFrom:(unsigned int)a3 To:(unsigned int)a4
{
  unsigned int v4;

  v4 = -a3;
  if (a3 > a4)
    v4 = ~a3;
  return v4 + a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzer, 0);
}

@end
