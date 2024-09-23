@implementation SSRSpeakerAnalyzerPSR

- (SSRSpeakerAnalyzerPSR)initWithVoiceRecognitionContext:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SSRSpeakerAnalyzerPSR *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSURL *configFilePath;
  uint64_t v18;
  NSURL *resourceFilePath;
  uint64_t v20;
  NSDictionary *voiceProfilesModelFilePaths;
  uint64_t v22;
  NSDictionary *voiceProfilesExpModelFilePaths;
  uint64_t v24;
  NSArray *psrScorers;
  NSArray *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *desRecordQueue;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  float v34;
  uint64_t v35;
  EARSyncPSRAudioProcessor *psrAudioProcessor;
  id v37;
  SSRSpeakerAnalyzerPSR *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v43;
  objc_super v44;
  uint8_t buf[4];
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)SSRSpeakerAnalyzerPSR;
  v9 = -[SSRSpeakerAnalyzerPSR init](&v44, sel_init);
  if (!v9)
    goto LABEL_6;
  objc_msgSend(v7, "modelsContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "expModelsContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v41 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[SSRSpeakerAnalyzerPSR initWithVoiceRecognitionContext:delegate:]";
      _os_log_impl(&dword_2117D4000, v41, OS_LOG_TYPE_DEFAULT, "%s modelContext is nil! - Bailing out", buf, 0xCu);
    }
    goto LABEL_12;
  }
  objc_storeWeak((id *)&v9->_delegate, v8);
  objc_msgSend(v12, "configFilePath");
  v16 = objc_claimAutoreleasedReturnValue();
  configFilePath = v9->_configFilePath;
  v9->_configFilePath = (NSURL *)v16;

  objc_msgSend(v7, "resourceFilePath");
  v18 = objc_claimAutoreleasedReturnValue();
  resourceFilePath = v9->_resourceFilePath;
  v9->_resourceFilePath = (NSURL *)v18;

  objc_msgSend(v12, "voiceProfilesModelFilePaths");
  v20 = objc_claimAutoreleasedReturnValue();
  voiceProfilesModelFilePaths = v9->_voiceProfilesModelFilePaths;
  v9->_voiceProfilesModelFilePaths = (NSDictionary *)v20;

  objc_msgSend(v15, "voiceProfilesModelFilePaths");
  v22 = objc_claimAutoreleasedReturnValue();
  voiceProfilesExpModelFilePaths = v9->_voiceProfilesExpModelFilePaths;
  v9->_voiceProfilesExpModelFilePaths = (NSDictionary *)v22;

  objc_storeStrong((id *)&v9->_context, a3);
  +[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffsetsType:forRetraining:](SSRSpeakerRecognitionScorer, "createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffsetsType:forRetraining:", v9->_voiceProfilesModelFilePaths, v9->_configFilePath, v9->_resourceFilePath, objc_msgSend(v7, "recognitionStyle") != 0, 0);
  v24 = objc_claimAutoreleasedReturnValue();
  psrScorers = v9->_psrScorers;
  v9->_psrScorers = (NSArray *)v24;

  v26 = v9->_psrScorers;
  if (!v26 || !-[NSArray count](v26, "count"))
  {
    v39 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[SSRSpeakerAnalyzerPSR initWithVoiceRecognitionContext:delegate:]";
      _os_log_impl(&dword_2117D4000, v39, OS_LOG_TYPE_DEFAULT, "%s ERR: Cannot create SAT analyzers", buf, 0xCu);
    }
    objc_msgSend(v7, "logAggregator");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setSpeakerRecognitionPSRProcessingStatus:", 106);

LABEL_12:
    v38 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BE28488], "getSerialQueueWithQOS:name:fixedPriority:", 33, CFSTR("com.apple.ssr.psrq"), *MEMORY[0x24BE284E0]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = dispatch_queue_create("com.apple.ssr.satq.desrecordq", 0);
  desRecordQueue = v9->_desRecordQueue;
  v9->_desRecordQueue = (OS_dispatch_queue *)v27;

  v29 = objc_alloc(MEMORY[0x24BE2E6E8]);
  -[NSArray objectAtIndexedSubscript:](v9->_psrScorers, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "psrConfigFilePath");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](v9->_psrScorers, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "psrConfigRoot");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  v35 = objc_msgSend(v29, "initWithConfigFile:configRoot:sampleRate:delegate:queue:outputLastRowOnly:", v31, v33, (unint64_t)v34, v9, v43, 1);
  psrAudioProcessor = v9->_psrAudioProcessor;
  v9->_psrAudioProcessor = (EARSyncPSRAudioProcessor *)v35;

  v37 = -[SSRSpeakerAnalyzerPSR resetForNewRequest](v9, "resetForNewRequest");
LABEL_6:
  v38 = v9;
LABEL_13:

  return v38;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  SSRSpeakerAnalyzerPSR *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[SSRSpeakerAnalyzerPSR dealloc]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s %@: dealloc", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRSpeakerAnalyzerPSR;
  -[SSRSpeakerAnalyzerPSR dealloc](&v4, sel_dealloc);
}

- (void)processAudioData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_retainAutorelease(v4);
    if (objc_msgSend(v6, "bytes"))
    {
      if (objc_msgSend(v6, "length"))
      {
        -[EARSyncPSRAudioProcessor addAudio:](self->_psrAudioProcessor, "addAudio:", v6);
        self->_numSamplesProecssed += (unint64_t)objc_msgSend(v6, "length") >> 1;
      }
    }
  }

}

- (void)endAudio
{
  NSObject *v3;
  id v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SSRSpeakerAnalyzerPSR endAudio]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Calling endAudio on EARSyncPSRAudioProcessor", (uint8_t *)&v5, 0xCu);
  }
  -[EARSyncPSRAudioProcessor endAudio](self->_psrAudioProcessor, "endAudio");
  v4 = (id)-[EARSyncPSRAudioProcessor getLatestSuperVector](self->_psrAudioProcessor, "getLatestSuperVector");
}

- (id)resetForNewRequest
{
  void *v3;
  void *v4;
  NSObject *v5;
  EARSyncPSRAudioProcessor *psrAudioProcessor;
  double v7;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  EARSyncPSRAudioProcessor *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EARSyncPSRAudioProcessor resetForNewRequest](self->_psrAudioProcessor, "resetForNewRequest");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)*MEMORY[0x24BE28360];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    psrAudioProcessor = self->_psrAudioProcessor;
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    *(_DWORD *)buf = 136315650;
    v10 = "-[SSRSpeakerAnalyzerPSR resetForNewRequest]";
    v11 = 2114;
    v12 = psrAudioProcessor;
    v13 = 2050;
    v14 = v7 * 1000.0;
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s Successfully reset psrAnalyzer: %{public}@ in %{public}fms", buf, 0x20u);
  }

  return 0;
}

- (id)getVoiceRecognizerResults
{
  NSArray **p_psrScorers;
  _BOOL8 v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *voiceProfilesExpModelFilePaths;
  void *v19;
  void *v20;
  BOOL v21;
  NSDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSDictionary *voiceProfilesModelFilePaths;
  void *v28;
  void *v29;
  NSObject *desRecordQueue;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  NSArray *obj;
  void *v38;
  void *v39;
  _QWORD block[4];
  id v41;
  SSRSpeakerAnalyzerPSR *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[2];
  _QWORD v51[2];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  p_psrScorers = &self->_psrScorers;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSArray count](self->_psrScorers, "count"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSArray count](*p_psrScorers, "count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSArray count](self->_psrScorers, "count"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SSRSpeakerRecognitionContext recognitionStyle](self->_context, "recognitionStyle") == 1
    && !self->_triggerPhraseDetectedOnTap;
  -[EARSyncPSRAudioProcessor getLatestSuperVector](self->_psrAudioProcessor, "getLatestSuperVector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  if (v6 > 3)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = self->_psrScorers;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v9)
    {
      v10 = v6 >> 2;
      v11 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v45 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v13, "scoreSpeakerVector:withDimensions:withThresholdType:", v5, v10, v4);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "profileID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v14, v15);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "getSATVectorCount"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "profileID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v16, v17);

          voiceProfilesExpModelFilePaths = self->_voiceProfilesExpModelFilePaths;
          if (voiceProfilesExpModelFilePaths)
          {
            objc_msgSend(v13, "profileID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKeyedSubscript:](voiceProfilesExpModelFilePaths, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20 == 0;

            if (!v21)
            {
              v22 = self->_voiceProfilesExpModelFilePaths;
              objc_msgSend(v13, "profileID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "resetScorerWithModelFilePath:", v24);

              objc_msgSend(v13, "scoreSpeakerVector:withDimensions:withThresholdType:", v5, v10, v4);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "profileID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v25, v26);

            }
          }
          voiceProfilesModelFilePaths = self->_voiceProfilesModelFilePaths;
          objc_msgSend(v13, "profileID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](voiceProfilesModelFilePaths, "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "resetScorerWithModelFilePath:", v29);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v9);
    }

    desRecordQueue = self->_desRecordQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__SSRSpeakerAnalyzerPSR_getVoiceRecognizerResults__block_invoke;
    block[3] = &unk_24CC861E0;
    v31 = v39;
    v41 = v31;
    v42 = self;
    v43 = v5;
    dispatch_async(desRecordQueue, block);
    v50[0] = CFSTR("configPath");
    -[NSURL path](self->_configFilePath, "path");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = CFSTR("numSpeakerVectors");
    v51[0] = v32;
    v51[1] = v38;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v48[0] = CFSTR("spIdKnownUserPSRScores");
    v48[1] = CFSTR("spIdKnownUserPSRExpScores");
    v49[0] = v31;
    v49[1] = v36;
    v48[2] = CFSTR("spIdUnknownUserScore");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0xFFFFFFFFLL);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = CFSTR("psrContext");
    v49[2] = v34;
    v49[3] = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SSRSpeakerRecognitionContext logAggregator](self->_context, "logAggregator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSpeakerRecognitionPSRProcessingStatus:", 743);

    v8 = 0;
  }

  return v8;
}

- (unint64_t)getEARSyncPSRAudioProcessorProcessingTime
{
  return -[EARSyncPSRAudioProcessor getAccmulatedProcessingTime](self->_psrAudioProcessor, "getAccmulatedProcessingTime");
}

- (id)_processSpeakerVector:(id)a3 withSize:(unint64_t)a4 processedAudioDurationMs:(unint64_t)a5
{
  void *v8;
  _BOOL8 v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  _QWORD v30[4];
  const __CFString *v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSArray count](self->_psrScorers, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SSRSpeakerRecognitionContext recognitionStyle](self->_context, "recognitionStyle") == 1
    && !self->_triggerPhraseDetectedOnTap;
  v23 = a5;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = self->_psrScorers;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "scoreSpeakerVector:withDimensions:withThresholdType:", v24, a4, v9);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "profileID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v16);

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v11);
  }

  v31 = CFSTR("configPath");
  -[NSURL path](self->_configFilePath, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v8;
  v29[0] = CFSTR("spIdKnownUserPSRScores");
  v29[1] = CFSTR("spIdUnknownUserScore");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0xFFFFFFFFLL);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v19;
  v29[2] = CFSTR("spIdAudioProcessedDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = CFSTR("psrContext");
  v30[2] = v20;
  v30[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)_isSpeakerVectorValid:(id)a3 speakerVectorSize:(unint64_t)a4 fromPsrAudioProcessor:(id)a5
{
  id v8;
  EARSyncPSRAudioProcessor *v9;
  EARSyncPSRAudioProcessor *psrAudioProcessor;
  NSObject *v11;
  BOOL v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  EARSyncPSRAudioProcessor *v22;
  __int16 v23;
  EARSyncPSRAudioProcessor *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (EARSyncPSRAudioProcessor *)a5;
  psrAudioProcessor = self->_psrAudioProcessor;
  if (psrAudioProcessor == v9)
  {
    if (v8)
    {
      if (a4)
      {
        v12 = 1;
        goto LABEL_12;
      }
      v17 = *MEMORY[0x24BE28360];
      v12 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v19 = 136315394;
      v20 = "-[SSRSpeakerAnalyzerPSR _isSpeakerVectorValid:speakerVectorSize:fromPsrAudioProcessor:]";
      v21 = 2050;
      v22 = 0;
      v13 = "%s Invalid speakerVectorSize=%{public}lu";
      v14 = v17;
      v15 = 22;
    }
    else
    {
      v16 = *MEMORY[0x24BE28360];
      v12 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v19 = 136315138;
      v20 = "-[SSRSpeakerAnalyzerPSR _isSpeakerVectorValid:speakerVectorSize:fromPsrAudioProcessor:]";
      v13 = "%s ERR: psrResult is nil";
      v14 = v16;
      v15 = 12;
    }
    goto LABEL_4;
  }
  v11 = *MEMORY[0x24BE28360];
  v12 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315650;
    v20 = "-[SSRSpeakerAnalyzerPSR _isSpeakerVectorValid:speakerVectorSize:fromPsrAudioProcessor:]";
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = psrAudioProcessor;
    v13 = "%s ERR: Reporting psrAudioProcessor(%@) != _psrAudioProcessor(%@)";
    v14 = v11;
    v15 = 32;
LABEL_4:
    _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
    v12 = 0;
  }
LABEL_12:

  return v12;
}

- (void)psrAudioProcessor:(id)a3 hasSpeakerVector:(id)a4 speakerVectorSize:(unint64_t)a5 processedAudioDurationMs:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id WeakRetained;
  char v15;
  id v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if (-[SSRSpeakerAnalyzerPSR _isSpeakerVectorValid:speakerVectorSize:fromPsrAudioProcessor:](self, "_isSpeakerVectorValid:speakerVectorSize:fromPsrAudioProcessor:", v11, a5, v10))
  {
    -[SSRSpeakerAnalyzerPSR _processSpeakerVector:withSize:processedAudioDurationMs:](self, "_processSpeakerVector:withSize:processedAudioDurationMs:", v11, a5, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315906;
      v19 = "-[SSRSpeakerAnalyzerPSR psrAudioProcessor:hasSpeakerVector:speakerVectorSize:processedAudioDurationMs:]";
      v20 = 2114;
      v21 = v10;
      v22 = 2050;
      v23 = a5;
      v24 = 2050;
      v25 = a6;
      _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s processing: psrAudioProcessor:%{public}@ speakerVectorSize:%{public}lu processedAudioDurationMs: %{public}lu", (uint8_t *)&v18, 0x2Au);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v16, "voiceRecognitionPSRAnalyzer:hasVoiceRecognitionInfo:", self, v12);

    }
  }
  else
  {
    v17 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v18 = 136315394;
      v19 = "-[SSRSpeakerAnalyzerPSR psrAudioProcessor:hasSpeakerVector:speakerVectorSize:processedAudioDurationMs:]";
      v20 = 1024;
      LODWORD(v21) = a5;
      _os_log_error_impl(&dword_2117D4000, v17, OS_LOG_TYPE_ERROR, "%s Invalid speaker vector with size %d - Skipping", (uint8_t *)&v18, 0x12u);
    }
  }

}

- (void)psrAudioProcessor:(id)a3 finishedWithFinalSpeakerVector:(id)a4 speakerVectorSize:(unint64_t)a5 processedAudioDurationMs:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  unint64_t numSamplesProecssed;
  void *v14;
  id WeakRetained;
  char v16;
  id v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if (-[SSRSpeakerAnalyzerPSR _isSpeakerVectorValid:speakerVectorSize:fromPsrAudioProcessor:](self, "_isSpeakerVectorValid:speakerVectorSize:fromPsrAudioProcessor:", v11, a5, v10))
  {
    v12 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      numSamplesProecssed = self->_numSamplesProecssed;
      v19 = 136316162;
      v20 = "-[SSRSpeakerAnalyzerPSR psrAudioProcessor:finishedWithFinalSpeakerVector:speakerVectorSize:processedAudioDurationMs:]";
      v21 = 2114;
      v22 = v10;
      v23 = 2050;
      v24 = a5;
      v25 = 2050;
      v26 = a6;
      v27 = 2050;
      v28 = numSamplesProecssed;
      _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s FINISHED processing: psrAudioProcessor:%{public}@ finishedWithFinalSpeakerVector: speakerVectorSize:%{public}lu processedAudioDurationMs: %{public}lu %{public}lu", (uint8_t *)&v19, 0x34u);
    }
    -[SSRSpeakerAnalyzerPSR _processSpeakerVector:withSize:processedAudioDurationMs:](self, "_processSpeakerVector:withSize:processedAudioDurationMs:", v11, a5, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v17, "voiceRecognitionPSRAnalyzerFinishedProcessing:withVoiceRecognitionInfo:", self, v14);

    }
  }
  else
  {
    v18 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v19 = 136315394;
      v20 = "-[SSRSpeakerAnalyzerPSR psrAudioProcessor:finishedWithFinalSpeakerVector:speakerVectorSize:processedAudioDurationMs:]";
      v21 = 1024;
      LODWORD(v22) = a5;
      _os_log_error_impl(&dword_2117D4000, v18, OS_LOG_TYPE_ERROR, "%s Invalid speaker vector with size %d - Skipping", (uint8_t *)&v19, 0x12u);
    }
  }

}

- (SSRSpeakerAnalyzerPSRDelegate)delegate
{
  return (SSRSpeakerAnalyzerPSRDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EARSyncPSRAudioProcessor)psrAudioProcessor
{
  return self->_psrAudioProcessor;
}

- (void)setPsrAudioProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_psrAudioProcessor, a3);
}

- (NSURL)configFilePath
{
  return self->_configFilePath;
}

- (void)setConfigFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_configFilePath, a3);
}

- (NSURL)resourceFilePath
{
  return self->_resourceFilePath;
}

- (void)setResourceFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_resourceFilePath, a3);
}

- (SSRSpeakerRecognitionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSDictionary)voiceProfilesModelFilePaths
{
  return self->_voiceProfilesModelFilePaths;
}

- (void)setVoiceProfilesModelFilePaths:(id)a3
{
  objc_storeStrong((id *)&self->_voiceProfilesModelFilePaths, a3);
}

- (NSDictionary)voiceProfilesExpModelFilePaths
{
  return self->_voiceProfilesExpModelFilePaths;
}

- (void)setVoiceProfilesExpModelFilePaths:(id)a3
{
  objc_storeStrong((id *)&self->_voiceProfilesExpModelFilePaths, a3);
}

- (NSArray)psrScorers
{
  return self->_psrScorers;
}

- (void)setPsrScorers:(id)a3
{
  objc_storeStrong((id *)&self->_psrScorers, a3);
}

- (OS_dispatch_queue)desRecordQueue
{
  return self->_desRecordQueue;
}

- (void)setDesRecordQueue:(id)a3
{
  objc_storeStrong((id *)&self->_desRecordQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desRecordQueue, 0);
  objc_storeStrong((id *)&self->_psrScorers, 0);
  objc_storeStrong((id *)&self->_voiceProfilesExpModelFilePaths, 0);
  objc_storeStrong((id *)&self->_voiceProfilesModelFilePaths, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);
  objc_storeStrong((id *)&self->_psrAudioProcessor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __50__SSRSpeakerAnalyzerPSR_getVoiceRecognizerResults__block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  if (v2)
  {
    objc_msgSend(v2, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    v6 = v5;

  }
  else
  {
    v6 = -998637568;
  }
  v12[0] = CFSTR("assetConfigVersion");
  objc_msgSend(*(id *)(a1[5] + 56), "configVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v12[1] = CFSTR("satScore");
  LODWORD(v8) = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  v12[2] = CFSTR("modelType");
  +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[SSRDESRecordWriter createDESRecordWithSuperVector:withMetaInfo:](SSRDESRecordWriter, "createDESRecordWithSuperVector:withMetaInfo:", a1[6], v11);
}

@end
