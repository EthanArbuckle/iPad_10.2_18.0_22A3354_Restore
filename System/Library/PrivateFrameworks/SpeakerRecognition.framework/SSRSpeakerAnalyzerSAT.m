@implementation SSRSpeakerAnalyzerSAT

- (SSRSpeakerAnalyzerSAT)initWithVoiceRecognitionContext:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SSRSpeakerAnalyzerSAT *v9;
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
  OS_dispatch_queue *queue;
  dispatch_queue_t v26;
  OS_dispatch_queue *desRecordQueue;
  NSDictionary *v28;
  NSURL *v29;
  void *v30;
  uint64_t v31;
  NSArray *satScorers;
  NSArray *v33;
  uint64_t v34;
  id v35;
  id v36;
  int v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  SSRSpeakerAnalyzerSAT *v46;
  NSObject *v47;
  objc_super v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v49.receiver = self;
  v49.super_class = (Class)SSRSpeakerAnalyzerSAT;
  v9 = -[SSRSpeakerAnalyzerSAT init](&v49, sel_init);
  if (!v9)
    goto LABEL_21;
  objc_msgSend(v7, "modelsContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "expModelsContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v45 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v51 = "-[SSRSpeakerAnalyzerSAT initWithVoiceRecognitionContext:delegate:]";
      _os_log_impl(&dword_2117D4000, v45, OS_LOG_TYPE_DEFAULT, "%s ERR: modelContext is nil! - Bailing out", buf, 0xCu);
    }
    goto LABEL_16;
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
  objc_msgSend(MEMORY[0x24BE28488], "getSerialQueueWithQOS:name:fixedPriority:", 33, CFSTR("com.apple.ssr.satq"), *MEMORY[0x24BE284E0]);
  v24 = objc_claimAutoreleasedReturnValue();
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v24;

  v26 = dispatch_queue_create("com.apple.ssr.satq.desrecordq", 0);
  desRecordQueue = v9->_desRecordQueue;
  v9->_desRecordQueue = (OS_dispatch_queue *)v26;

  v28 = v9->_voiceProfilesModelFilePaths;
  v29 = v9->_configFilePath;
  objc_msgSend(v7, "resourceFilePath");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRSpeakerRecognitionScorer createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffsetsType:forRetraining:](SSRSpeakerRecognitionScorer, "createVoiceScorersWithVoiceProfiles:withConfigFile:withResourceFile:withOffsetsType:forRetraining:", v28, v29, v30, 0, 0);
  v31 = objc_claimAutoreleasedReturnValue();
  satScorers = v9->_satScorers;
  v9->_satScorers = (NSArray *)v31;

  v33 = v9->_satScorers;
  if (!v33 || !-[NSArray count](v33, "count"))
  {
    v44 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v51 = "-[SSRSpeakerAnalyzerSAT initWithVoiceRecognitionContext:delegate:]";
      _os_log_impl(&dword_2117D4000, v44, OS_LOG_TYPE_DEFAULT, "%s ERR: Cannot create Voice Scorers", buf, 0xCu);
    }
    objc_msgSend(v7, "logAggregator");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    v43 = 106;
    goto LABEL_13;
  }
  v9->_numSamplesProcessed = 0;
  v34 = nd_create();
  v9->_novDetect = (void *)v34;
  if (!v34)
  {
    v47 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v51 = "-[SSRSpeakerAnalyzerSAT initWithVoiceRecognitionContext:delegate:]";
      _os_log_impl(&dword_2117D4000, v47, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to create NovDetect", buf, 0xCu);
    }
    objc_msgSend(v7, "logAggregator");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    v43 = 105;
    goto LABEL_13;
  }
  -[NSURL path](v9->_configFilePath, "path");
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v35, "UTF8String");
  -[NSURL path](v9->_resourceFilePath, "path");
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v36, "UTF8String");
  v37 = nd_initialize();

  if (!v37)
  {

LABEL_21:
    v46 = v9;
    goto LABEL_22;
  }
  v38 = (void *)*MEMORY[0x24BE28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
  {
    v39 = v38;
    v40 = nd_error();
    *(_DWORD *)buf = 136315650;
    v51 = "-[SSRSpeakerAnalyzerSAT initWithVoiceRecognitionContext:delegate:]";
    v52 = 1026;
    v53 = v37;
    v54 = 2082;
    v55 = v40;
    _os_log_impl(&dword_2117D4000, v39, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to initialize _novDetect: err=[%{public}d]:%{public}s", buf, 0x1Cu);

  }
  objc_msgSend(v7, "logAggregator");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  v43 = 104;
LABEL_13:
  objc_msgSend(v41, "setSpeakerRecognitionSATProcessingStatus:", v43);

LABEL_16:
  v46 = 0;
LABEL_22:

  return v46;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  SSRSpeakerAnalyzerSAT *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[SSRSpeakerAnalyzerSAT dealloc]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s %@: dealloc", buf, 0x16u);
  }
  if (self->_novDetect)
  {
    nd_close();
    self->_novDetect = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRSpeakerAnalyzerSAT;
  -[SSRSpeakerAnalyzerSAT dealloc](&v4, sel_dealloc);
}

- (void)processAudioData:(id)a3 numSamples:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  SSRSpeakerAnalyzerSAT *v11;
  unint64_t v12;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SSRSpeakerAnalyzerSAT_processAudioData_numSamples___block_invoke;
  block[3] = &unk_24CC86490;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)endAudio
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SSRSpeakerAnalyzerSAT_endAudio__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)resetForNewRequest
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = nd_reset();
  self->_numSamplesProcessed = 0;
  self->_triggerPhraseDetectedOnTap = 0;
  if (!(_DWORD)v3)
    return 0;
  v4 = v3;
  -[SSRSpeakerRecognitionContext logAggregator](self->_context, "logAggregator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSpeakerRecognitionSATProcessingStatus:", 753);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed with errorcode : %d"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[SSRSpeakerAnalyzerSAT resetForNewRequest]";
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  v8 = (void *)MEMORY[0x24BDD1540];
  v12 = CFSTR("reason");
  v13 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 753, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)getVoiceRecognizerResults
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7216;
  v10 = __Block_byref_object_dispose__7217;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__SSRSpeakerAnalyzerSAT_getVoiceRecognizerResults__block_invoke;
  v5[3] = &unk_24CC864E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_updateScoreCardForFinalResult:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unint64_t numSamplesProcessed;
  float v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v3 = a3;
  v21[1] = *MEMORY[0x24BDAC8D0];
  -[SSRSpeakerAnalyzerSAT _getAnalyzedResult](self, "_getAnalyzedResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  numSamplesProcessed = self->_numSamplesProcessed;
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  if (v5)
  {
    v8 = v7;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("best_end"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRSpeakerAnalyzerSAT _getSuperVectorWithEndPoint:](self, "_getSuperVectorWithEndPoint:", objc_msgSend(v9, "integerValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "length"))
    {
      -[SSRSpeakerAnalyzerSAT _processSuperVector:withSize:processedAudioDurationMs:isFinal:](self, "_processSuperVector:withSize:processedAudioDurationMs:isFinal:", v10, objc_msgSend(v10, "length") >> 2, (uint64_t)((double)numSamplesProcessed * 1000.0 / v8), v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_scoreCard, v11);
      v12 = 0;
    }
    else
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      -[SSRSpeakerRecognitionContext sessionId](self->_context, "sessionId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("ERR: %@ failed to get valid supervector"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BDD0FC8];
      v21[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 743, v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[SSRSpeakerRecognitionContext logAggregator](self->_context, "logAggregator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSpeakerRecognitionSATProcessingStatus:", 743);

      v11 = 0;
    }

  }
  else
  {
    v12 = 0;
    v11 = 0;
  }

  return v12;
}

- (id)_getAnalyzedResult
{
  id v3;
  unsigned int *v4;
  unsigned int *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (self->_novDetect)
  {
    v4 = (unsigned int *)nd_getresults();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("samples_fed"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5[1]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("best_start"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5[3]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("best_phrase"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5[2]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("best_end"));

      LODWORD(v10) = v5[4];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("best_score"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v5 + 20));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("early_warning"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v5 + 21));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("is_rescoring"));

    }
  }
  return v3;
}

- (id)_getSuperVectorWithEndPoint:(unint64_t)a3
{
  unsigned int *novDetect;

  novDetect = (unsigned int *)self->_novDetect;
  if (novDetect)
  {
    novDetect = (unsigned int *)nd_getsupervector();
    if (novDetect)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)novDetect, 4 * novDetect[2]);
      novDetect = (unsigned int *)objc_claimAutoreleasedReturnValue();
    }
  }
  return novDetect;
}

- (id)_processSuperVector:(id)a3 withSize:(unint64_t)a4 processedAudioDurationMs:(unint64_t)a5 isFinal:(BOOL)a6
{
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
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
  NSDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSDictionary *voiceProfilesModelFilePaths;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v36;
  NSArray *obj;
  _BOOL4 v38;
  void *v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[2];
  _QWORD v49[2];
  _BYTE v50[128];
  uint64_t v51;

  v38 = a6;
  v51 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSArray count](self->_satScorers, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSArray count](self->_satScorers, "count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSArray count](self->_satScorers, "count"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SSRSpeakerRecognitionContext recognitionStyle](self->_context, "recognitionStyle") == 1
    && !self->_triggerPhraseDetectedOnTap;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = self->_satScorers;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v13, "analyzeSuperVector:withDimensions:withThresholdType:", v41, a4, v8);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "profileID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v14, v15);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "getSATVectorCount"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "profileID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v16, v17);

        if (v38)
        {
          voiceProfilesExpModelFilePaths = self->_voiceProfilesExpModelFilePaths;
          if (voiceProfilesExpModelFilePaths)
          {
            objc_msgSend(v13, "profileID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKeyedSubscript:](voiceProfilesExpModelFilePaths, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              v21 = self->_voiceProfilesExpModelFilePaths;
              objc_msgSend(v13, "profileID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "resetScorerWithModelFilePath:", v23);

              objc_msgSend(v13, "analyzeSuperVector:withDimensions:withThresholdType:", v41, a4, v8);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "profileID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v24, v25);

            }
          }
        }
        voiceProfilesModelFilePaths = self->_voiceProfilesModelFilePaths;
        objc_msgSend(v13, "profileID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](voiceProfilesModelFilePaths, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "resetScorerWithModelFilePath:", v28);

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v10);
  }

  v48[0] = CFSTR("configPath");
  -[NSURL path](self->_configFilePath, "path");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = CFSTR("numSpeakerVectors");
  v49[0] = v29;
  v49[1] = v39;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v46[0] = CFSTR("spIdKnownUserSATScores");
  v46[1] = CFSTR("spIdKnownUserSATExpScores");
  v47[0] = v40;
  v47[1] = v36;
  v46[2] = CFSTR("spIdUnknownUserScore");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0xFFFFFFFFLL);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v31;
  v46[3] = CFSTR("spIdAudioProcessedDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = CFSTR("satContext");
  v47[3] = v32;
  v47[4] = v30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (SSRSpeakerAnalyzerSATDelegate)delegate
{
  return (SSRSpeakerAnalyzerSATDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (NSArray)satScorers
{
  return self->_satScorers;
}

- (void)setSatScorers:(id)a3
{
  objc_storeStrong((id *)&self->_satScorers, a3);
}

- (NSDictionary)scoreCard
{
  return self->_scoreCard;
}

- (void)setScoreCard:(id)a3
{
  objc_storeStrong((id *)&self->_scoreCard, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
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
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_scoreCard, 0);
  objc_storeStrong((id *)&self->_satScorers, 0);
  objc_storeStrong((id *)&self->_voiceProfilesExpModelFilePaths, 0);
  objc_storeStrong((id *)&self->_voiceProfilesModelFilePaths, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_resourceFilePath, 0);
  objc_storeStrong((id *)&self->_configFilePath, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __50__SSRSpeakerAnalyzerSAT_getVoiceRecognizerResults__block_invoke(uint64_t a1)
{
  _QWORD v2[4];

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __50__SSRSpeakerAnalyzerSAT_getVoiceRecognizerResults__block_invoke_2;
  v2[3] = &unk_24CC864E8;
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 104), v2);
}

void __50__SSRSpeakerAnalyzerSAT_getVoiceRecognizerResults__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("spIdKnownUserSATScores"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("spIdKnownUserSATScores"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;

  }
  else
  {
    v7 = -998637568;
  }

  v17[0] = CFSTR("assetConfigVersion");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "configVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v17[1] = CFSTR("satScore");
  LODWORD(v9) = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  v17[2] = CFSTR("modelType");
  +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_getAnalyzedResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 32);
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("best_end"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_getSuperVectorWithEndPoint:", objc_msgSend(v15, "integerValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[SSRDESRecordWriter createDESRecordWithSuperVector:withMetaInfo:](SSRDESRecordWriter, "createDESRecordWithSuperVector:withMetaInfo:", v16, v12);
}

void __33__SSRSpeakerAnalyzerSAT_endAudio__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_updateScoreCardForFinalResult:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[SSRSpeakerAnalyzerSAT endAudio]_block_invoke";
      v9 = 2114;
      v10 = v2;
      _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s ERR: Failed to get score card with error: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
      objc_msgSend(v6, "voiceRecognitionSATAnalyzerFinishedProcessing:withVoiceRecognitionInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));

    }
  }

}

void __53__SSRSpeakerAnalyzerSAT_processAudioData_numSamples___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  char v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  if (v2 && objc_msgSend(objc_retainAutorelease(v2), "bytes") && objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
    nd_wavedata();
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) += *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "_updateScoreCardForFinalResult:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
      v5 = objc_opt_respondsToSelector();

      v3 = 0;
      if ((v5 & 1) != 0)
      {
        v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
        objc_msgSend(v6, "voiceRecognitionSATAnalyzer:hasVoiceRecognitionInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));

        v3 = 0;
      }
    }

  }
}

@end
