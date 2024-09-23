@implementation VTSyncKeywordAnalyzerQuasar

- (VTSyncKeywordAnalyzerQuasar)initWithConfigPath:(id)a3 triggerTokensArray:(id)a4 preventDuplicatedReset:(BOOL)a5 memoryLock:(BOOL)a6
{
  _BOOL8 v6;
  double v10;
  id v11;
  VTSyncKeywordAnalyzerQuasar *v12;
  uint64_t v13;
  NSDictionary *phToPhIdMap;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  _EARSyncSpeechRecognizer *syncRecognizer;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  VTSyncKeywordAnalyzerQuasar *v25;
  objc_super v27;
  uint8_t buf[4];
  double v29;
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x24BDAC8D0];
  v10 = COERCE_DOUBLE(a3);
  v11 = a4;
  v27.receiver = self;
  v27.super_class = (Class)VTSyncKeywordAnalyzerQuasar;
  v12 = -[VTSyncKeywordAnalyzerQuasar init](&v27, sel_init);
  if (v12)
  {
    +[VTSyncKeywordAnalyzerQuasar _phToPhIdMapFromTriggerTokensArray:](VTSyncKeywordAnalyzerQuasar, "_phToPhIdMapFromTriggerTokensArray:", v11);
    v13 = objc_claimAutoreleasedReturnValue();
    phToPhIdMap = v12->_phToPhIdMap;
    v12->_phToPhIdMap = (NSDictionary *)v13;

    v12->_numPhrases = objc_msgSend(v11, "count");
    v12->_preventDuplicatedReset = a5;
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "systemUptime");
    v17 = v16;

    v18 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v10;
      _os_log_impl(&dword_20D965000, v18, OS_LOG_TYPE_DEFAULT, "Initializing Quasar with config: %{public}@", buf, 0xCu);
    }
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BE2E740]), "initWithConfiguration:memoryLock:", *(_QWORD *)&v10, v6);
    syncRecognizer = v12->_syncRecognizer;
    v12->_syncRecognizer = (_EARSyncSpeechRecognizer *)v19;

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "systemUptime");
    v23 = v22;

    v12->_requireReset = 1;
    v24 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v29 = (v23 - v17) * 1000.0;
      _os_log_impl(&dword_20D965000, v24, OS_LOG_TYPE_DEFAULT, "Speech model loading took %{public}.3fms", buf, 0xCu);
    }
  }
  v25 = v12;

  return v25;
}

- (void)reset
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t buf[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }
  if (self->_requireReset)
  {
    LODWORD(v5) = 120;
    LOBYTE(v4) = 0;
    -[_EARSyncSpeechRecognizer resetWithSamplingRate:language:taskType:userId:sessionId:deviceId:farField:audioSource:maxAudioBufferSizeSeconds:](self->_syncRecognizer, "resetWithSamplingRate:language:taskType:userId:sessionId:deviceId:farField:audioSource:maxAudioBufferSizeSeconds:", 16000, &stru_24C7F6FB8, CFSTR("Dictation"), &stru_24C7F6FB8, &stru_24C7F6FB8, &stru_24C7F6FB8, v4, &stru_24C7F6FB8, v5);
    if (self->_preventDuplicatedReset)
      self->_requireReset = 0;
  }
}

- (void)flushAudio
{
  id v2;

  v2 = -[VTSyncKeywordAnalyzerQuasar getResultsFromFlushedAudio](self, "getResultsFromFlushedAudio");
}

- (id)getResultsFromFlushedAudio
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t buf[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }
  -[_EARSyncSpeechRecognizer resultsWithEndedAudio](self->_syncRecognizer, "resultsWithEndedAudio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTSyncKeywordAnalyzerQuasar _getAnalyzedResults:](self, "_getAnalyzedResults:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getAnalyzedResultsFromFloatAudioBuffer:(id)a3 numSamples:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  self->_requireReset = 1;
  -[_EARSyncSpeechRecognizer resultsWithAddedFloatAudio:numberOfSamples:taskName:](self->_syncRecognizer, "resultsWithAddedFloatAudio:numberOfSamples:taskName:", v6, a4, &stru_24C7F6FB8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTSyncKeywordAnalyzerQuasar _getAnalyzedResults:](self, "_getAnalyzedResults:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getAnalyzedResultsFromInt16AudioBuffer:(id)a3 numSamples:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  self->_requireReset = 1;
  -[_EARSyncSpeechRecognizer resultsWithAddedAudio:numberOfSamples:taskName:](self->_syncRecognizer, "resultsWithAddedAudio:numberOfSamples:taskName:", v6, a4, &stru_24C7F6FB8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTSyncKeywordAnalyzerQuasar _getAnalyzedResults:](self, "_getAnalyzedResults:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_getAnalyzedResults:(id)a3
{
  void *v4;
  unint64_t v5;
  VTSyncKeywordAnalyzerQuasarResult *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSDictionary *phToPhIdMap;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  VTSyncKeywordAnalyzerQuasar *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  unint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_numPhrases)
  {
    v5 = 0;
    do
    {
      v6 = -[VTSyncKeywordAnalyzerQuasarResult initWithConfidence:]([VTSyncKeywordAnalyzerQuasarResult alloc], "initWithConfidence:", -1000.0);
      objc_msgSend(v4, "addObject:", v6);

      ++v5;
    }
    while (v5 < self->_numPhrases);
  }
  v32 = self;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v31;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v10), "tokens");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12
          || (objc_msgSend(v12, "tokenName"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = v13 == 0,
              v13,
              v14))
        {
          v28 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v38 = (unint64_t)v12;
            _os_log_error_impl(&dword_20D965000, v28, OS_LOG_TYPE_ERROR, "Invalid token : %{public}@", buf, 0xCu);
          }
        }
        else
        {
          phToPhIdMap = v32->_phToPhIdMap;
          objc_msgSend(v12, "tokenName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](phToPhIdMap, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "unsignedIntegerValue");

          v19 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v38 = v18;
            v39 = 2114;
            v40 = v12;
            _os_log_impl(&dword_20D965000, v19, OS_LOG_TYPE_DEFAULT, "%tu, token = %{public}@", buf, 0x16u);
          }
          if (v18 >= objc_msgSend(v4, "count"))
          {
            v29 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v38) = v18;
              _os_log_error_impl(&dword_20D965000, v29, OS_LOG_TYPE_ERROR, "Unable to handle: %d", buf, 8u);
            }
          }
          else
          {
            objc_msgSend(v4, "objectAtIndex:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "triggerConfidence");
            v22 = v21;

            objc_msgSend(v12, "confidence");
            v24 = v23;
            objc_msgSend(v4, "objectAtIndexedSubscript:", v18);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v24 >= v22)
              v27 = v24;
            else
              v27 = v22;
            objc_msgSend(v25, "setTriggerConfidence:", v27);

          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v8);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phToPhIdMap, 0);
  objc_storeStrong((id *)&self->_syncRecognizer, 0);
}

+ (id)_phToPhIdMapFromTriggerTokensArray:(id)a3
{
  id v3;
  void *v4;
  unint64_t i;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v3, "count"); ++i)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("_"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v13, v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  return v4;
}

+ (void)dumpEARSpeechRecognitionResults:(id)a3
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSObject *v12;
  uint64_t v13;
  __int128 v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v3)
  {
    v16 = 0;
    v17 = *(_QWORD *)v24;
    *(_QWORD *)&v4 = 134217984;
    v14 = v4;
    do
    {
      v5 = 0;
      v18 = v3;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v5);
        v7 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          v29 = v16;
          _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "Res-%lu: ", buf, 0xCu);
          ++v16;
        }
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v6, "tokens", v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v20 != v10)
                objc_enumerationMutation(v8);
              v12 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
              {
                v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
                *(_DWORD *)buf = 138412290;
                v29 = v13;
                _os_log_impl(&dword_20D965000, v12, OS_LOG_TYPE_DEFAULT, "tok=%@", buf, 0xCu);
              }
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v18);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v3);
  }

}

@end
