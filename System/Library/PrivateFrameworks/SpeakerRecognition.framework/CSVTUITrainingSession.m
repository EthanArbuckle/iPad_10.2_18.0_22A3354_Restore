@implementation CSVTUITrainingSession

- (CSVTUITrainingSession)initWithUtteranceId:(int64_t)a3 sessionNumber:(int64_t)a4 Locale:(id)a5 audioSession:(id)a6 keywordDetector:(id)a7 speechRecognizer:(id)a8 speechRecognitionRequest:(id)a9 sessionDelegate:(id)a10 sessionDispatchQueue:(id)a11 zeroCounter:(id)a12 completion:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CSVTUITrainingSession *v23;
  CSVTUITrainingSession *v24;
  CSVTUITrainingSession *v25;
  SFSpeechRecognitionTask *speechRecognitionTask;
  NSTimer *masterTimer;
  NSMutableArray *v28;
  NSMutableArray *pcmBufArray;
  uint64_t v30;
  id trainingCompletion;
  id trainingCompletionWithResult;
  id obj;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;

  v41 = a5;
  obj = a6;
  v18 = a6;
  v37 = a7;
  v19 = a7;
  v40 = a8;
  v39 = a9;
  v20 = a10;
  v21 = a11;
  v38 = a12;
  v22 = a13;
  v42.receiver = self;
  v42.super_class = (Class)CSVTUITrainingSession;
  v23 = -[CSVTUITrainingSession init](&v42, sel_init);
  v24 = v23;
  v25 = 0;
  if (v18 && v19 && v20)
  {
    if (v23)
    {
      v23->_status = 1;
      v23->_utteranceId = a3;
      v23->_sessionNumber = a4;
      objc_storeStrong((id *)&v23->_locale, a5);
      objc_storeStrong((id *)&v24->_audioSession, obj);
      objc_storeStrong((id *)&v24->_speechRecognizer, a8);
      objc_storeStrong((id *)&v24->_speechRecognitionRequest, a9);
      speechRecognitionTask = v24->_speechRecognitionTask;
      v24->_speechRecognitionTask = 0;

      masterTimer = v24->_masterTimer;
      v24->_masterTimer = 0;

      v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      pcmBufArray = v24->_pcmBufArray;
      v24->_pcmBufArray = v28;

      *(_DWORD *)&v24->_resultReported = 0;
      objc_storeWeak((id *)&v24->_sessionDelegate, v20);
      v30 = MEMORY[0x212BE197C](v22);
      trainingCompletion = v24->_trainingCompletion;
      v24->_trainingCompletion = (id)v30;

      trainingCompletionWithResult = v24->_trainingCompletionWithResult;
      v24->_trainingCompletionWithResult = 0;

      objc_storeStrong((id *)&v24->_queue, a11);
      v24->_numRequiredTrailingSamples = 0;
      v24->_numTrailingSamples = 0;
      objc_storeStrong((id *)&v24->_continuousZeroCounter, a12);
      objc_storeStrong((id *)&v24->_keywordDetector, v37);
    }
    v25 = v24;
  }

  return v25;
}

- (CSVTUITrainingSession)initWithUtteranceId:(int64_t)a3 sessionNumber:(int64_t)a4 Locale:(id)a5 vtAssetConfigVersion:(id)a6 audioSession:(id)a7 keywordDetector:(id)a8 speechRecognizer:(id)a9 speechRecognitionRequest:(id)a10 sessionDelegate:(id)a11 sessionDispatchQueue:(id)a12 mhUUID:(id)a13 zeroCounter:(id)a14 completionWithResult:(id)a15
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  CSVTUITrainingSession *v24;
  CSVTUITrainingSession *v25;
  CSVTUITrainingSession *v26;
  SFSpeechRecognitionTask *speechRecognitionTask;
  NSTimer *masterTimer;
  NSMutableArray *v29;
  NSMutableArray *pcmBufArray;
  id trainingCompletion;
  uint64_t v32;
  id trainingCompletionWithResult;
  id obj;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v45;
  id v46;
  objc_super v47;

  v46 = a5;
  obj = a6;
  v45 = a6;
  v39 = a7;
  v18 = a7;
  v40 = a8;
  v19 = a8;
  v43 = a9;
  v42 = a10;
  v20 = a11;
  v41 = a12;
  v21 = a13;
  v22 = a14;
  v23 = a15;
  v47.receiver = self;
  v47.super_class = (Class)CSVTUITrainingSession;
  v24 = -[CSVTUITrainingSession init](&v47, sel_init);
  v25 = v24;
  v26 = 0;
  if (v18 && v19 && v20)
  {
    if (v24)
    {
      v24->_status = 1;
      v24->_utteranceId = a3;
      v24->_sessionNumber = a4;
      objc_storeStrong((id *)&v24->_locale, a5);
      objc_storeStrong((id *)&v25->_vtAssetConfigVersion, obj);
      objc_storeStrong((id *)&v25->_audioSession, v39);
      objc_storeStrong((id *)&v25->_speechRecognizer, a9);
      objc_storeStrong((id *)&v25->_speechRecognitionRequest, a10);
      speechRecognitionTask = v25->_speechRecognitionTask;
      v25->_speechRecognitionTask = 0;

      masterTimer = v25->_masterTimer;
      v25->_masterTimer = 0;

      v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      pcmBufArray = v25->_pcmBufArray;
      v25->_pcmBufArray = v29;

      *(_DWORD *)&v25->_resultReported = 0;
      objc_storeWeak((id *)&v25->_sessionDelegate, v20);
      trainingCompletion = v25->_trainingCompletion;
      v25->_trainingCompletion = 0;

      v32 = MEMORY[0x212BE197C](v23);
      trainingCompletionWithResult = v25->_trainingCompletionWithResult;
      v25->_trainingCompletionWithResult = (id)v32;

      objc_storeStrong((id *)&v25->_queue, a12);
      objc_storeStrong((id *)&v25->_mhUUID, a13);
      v25->_numRequiredTrailingSamples = 0;
      v25->_numTrailingSamples = 0;
      objc_storeStrong((id *)&v25->_continuousZeroCounter, a14);
      objc_storeStrong((id *)&v25->_keywordDetector, v40);
    }
    v26 = v25;
  }

  return v26;
}

- (void)startTraining
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CSVTUITrainingSession_startTraining__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)resultAlreadyReported
{
  return self->_resultReported;
}

- (void)closeSessionWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__CSVTUITrainingSession_closeSessionWithCompletion___block_invoke;
  v7[3] = &unk_24CC859A0;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)closeSessionWithStatus:(int)a3 successfully:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  os_log_t *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v7 = (os_log_t *)MEMORY[0x24BE28368];
  v8 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[CSVTUITrainingSession closeSessionWithStatus:successfully:]";
    v12 = 1026;
    v13 = v5;
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Called with status : %{public}d", (uint8_t *)&v10, 0x12u);
  }
  if (self->_trainingCompletion)
  {
    v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[CSVTUITrainingSession closeSessionWithStatus:successfully:]";
      _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s closeSession tracking BOOL, calling old completion", (uint8_t *)&v10, 0xCu);
    }
    -[CSVTUITrainingSession closeSessionWithStatus:successfully:complete:](self, "closeSessionWithStatus:successfully:complete:", v5, v4, 0);
  }
  else
  {
    -[CSVTUITrainingSession closeSessionWithStatus:successfully:voiceTriggerEventInfo:completeWithResult:](self, "closeSessionWithStatus:successfully:voiceTriggerEventInfo:completeWithResult:", v5, v4, self->_voiceTriggerEventInfo, 0);
  }
}

- (void)closeSessionWithStatus:(int)a3 successfully:(BOOL)a4 complete:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int v12;
  BOOL v13;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__CSVTUITrainingSession_closeSessionWithStatus_successfully_complete___block_invoke;
  v10[3] = &unk_24CC859C8;
  v12 = a3;
  v13 = a4;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[CSVTUITrainingSession closeSessionWithCompletion:](self, "closeSessionWithCompletion:", v10);

}

- (void)closeSessionWithStatus:(int)a3 successfully:(BOOL)a4 voiceTriggerEventInfo:(id)a5 completeWithResult:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int v17;
  BOOL v18;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __102__CSVTUITrainingSession_closeSessionWithStatus_successfully_voiceTriggerEventInfo_completeWithResult___block_invoke;
  v14[3] = &unk_24CC859F0;
  v17 = a3;
  v14[4] = self;
  v15 = v10;
  v18 = a4;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[CSVTUITrainingSession closeSessionWithCompletion:](self, "closeSessionWithCompletion:", v14);

}

- (void)suspendTraining
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSVTUITrainingSession suspendTraining]";
    v8 = 2082;
    v9 = "-[CSVTUITrainingSession suspendTraining]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}s Called", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__CSVTUITrainingSession_suspendTraining__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)resumeTraining
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSVTUITrainingSession resumeTraining]";
    v8 = 2082;
    v9 = "-[CSVTUITrainingSession resumeTraining]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}s Called", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__CSVTUITrainingSession_resumeTraining__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)setupPhraseSpotter
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[CSVTUITrainingSession setupPhraseSpotter]";
    v7 = 2082;
    v8 = "-[CSVTUITrainingSession setupPhraseSpotter]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}s called", (uint8_t *)&v5, 0x16u);
  }
  -[CSVTUIKeywordDetector reset](self->_keywordDetector, "reset");
  return 1;
}

- (void)handleAudioInput:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__CSVTUITrainingSession_handleAudioInput___block_invoke;
  v7[3] = &unk_24CC85A40;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)requestTriggeredUtterance:(id)a3
{
  return -[CSVTUIKeywordDetector triggeredUtterance:](self->_keywordDetector, "triggeredUtterance:", a3);
}

- (void)updateMeterAndForward
{
  int v3;
  int v4;
  CSVTUITrainingSessionDelegate **p_sessionDelegate;
  id WeakRetained;
  char v7;
  double v8;
  id v9;

  -[CSVTUIAudioSession updateMeters](self->_audioSession, "updateMeters");
  -[CSVTUIAudioSession averagePower](self->_audioSession, "averagePower");
  v4 = v3;
  p_sessionDelegate = &self->_sessionDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_sessionDelegate);
    LODWORD(v8) = v4;
    objc_msgSend(v9, "CSVTUITrainingSessionRMSAvailable:", v8);

  }
}

- (void)handleAudioBufferForVTWithAudioInput:(id)a3 withDetectedBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  float v23;
  double v24;
  void *v25;
  uint64_t v26;
  int v27;
  const char *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  -[CSVTUIKeywordDetector analyze:](self->_keywordDetector, "analyze:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE28580]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE285D8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE285B8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");

      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE285A8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedIntegerValue");

      v17 = *MEMORY[0x24BE28368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
      {
        v27 = 136316162;
        v28 = "-[CSVTUITrainingSession handleAudioBufferForVTWithAudioInput:withDetectedBlock:]";
        v29 = 2114;
        v30 = *(double *)&v8;
        v31 = 2050;
        v32 = v12;
        v33 = 2050;
        v34 = v14;
        v35 = 2050;
        v36 = v16;
        _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s Triggered! Event info: %{public}@\n%{public}9lld %{public}9lld %{public}9lld", (uint8_t *)&v27, 0x34u);
      }
      if (v6)
        v6[2](v6, v8);
    }
    v18 = handleAudioBufferForVTWithAudioInput_withDetectedBlock__counter++;
    if (__ROR8__(0x8F5C28F5C28F5C29 * v18 + 0x51EB851EB851EB8, 1) <= 0x51EB851EB851EB8uLL)
    {
      v19 = (void *)*MEMORY[0x24BE28368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
      {
        v20 = *MEMORY[0x24BE285D0];
        v21 = v19;
        objc_msgSend(v8, "objectForKeyedSubscript:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "floatValue");
        v24 = v23;
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE285A8]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "unsignedIntegerValue");
        v27 = 136315650;
        v28 = "-[CSVTUITrainingSession handleAudioBufferForVTWithAudioInput:withDetectedBlock:]";
        v29 = 2050;
        v30 = v24;
        v31 = 2050;
        v32 = v26;
        _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEFAULT, "%s analyzing.... score so far: %{public}5.3f (%{public}ld)", (uint8_t *)&v27, 0x20u);

      }
    }
  }

}

- (void)feedSpeechRecognitionTrailingSamplesWithCompletedBlock:(id)a3
{
  void (**v4)(_QWORD);
  int64_t v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  v5 = self->_numTrailingSamples + -[CSVTUITrainingSession numSamplesInPCMBuffer](self, "numSamplesInPCMBuffer");
  self->_numTrailingSamples = v5;
  v6 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CSVTUITrainingSession feedSpeechRecognitionTrailingSamplesWithCompletedBlock:]";
    v9 = 2050;
    v10 = v5;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s feeding tailing: [%{public}ld] samples", (uint8_t *)&v7, 0x16u);
  }
  -[CSVTUITrainingSession feedSpeechRecognitionWithPCMBuffer](self, "feedSpeechRecognitionWithPCMBuffer");
  if (v4 && self->_numTrailingSamples >= self->_numRequiredTrailingSamples)
    v4[2](v4);

}

- (void)feedSpeechRecognitionWithPCMBuffer
{
  void *v3;

  if (self->_speechRecognitionRequest)
  {
    while (-[NSMutableArray count](self->_pcmBufArray, "count"))
    {
      -[NSMutableArray objectAtIndex:](self->_pcmBufArray, "objectAtIndex:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSpeechAudioBufferRecognitionRequest appendAudioPCMBuffer:](self->_speechRecognitionRequest, "appendAudioPCMBuffer:", v3);
      -[NSMutableArray removeObjectAtIndex:](self->_pcmBufArray, "removeObjectAtIndex:", 0);

    }
  }
}

- (void)trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  NSObject **v17;
  NSObject *v18;
  os_log_t *v19;
  NSMutableArray *pcmBufArray;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE285D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE285A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v9 = v6 - v8;
  if (v8 >= v6)
    v9 = v8 - v6;
  if (v9 >= 80000)
    v10 = 80000;
  else
    v10 = v9;
  v11 = -[NSMutableArray count](self->_pcmBufArray, "count");
  v28 = v4;
  if (v11 - 1 < 0)
  {
    v14 = 0;
    v16 = 0;
    v27 = 0;
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v12 = v11;
    v13 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_pcmBufArray, "objectAtIndex:", --v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "frameLength");
      v13 += v15;
      v16 = v13 - v10;
      if (v13 >= v10)
        break;

      if (v12 <= 0)
      {
        v14 = 0;
        v16 = 0;
        v27 = 0;
        v12 = 0;
        goto LABEL_13;
      }
    }
    v27 = v15;
  }
LABEL_13:
  v17 = (NSObject **)MEMORY[0x24BE28368];
  v18 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
    v31 = 2050;
    v32 = v10;
    _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s correctSampleSize:    [%{public}ld]", buf, 0x16u);
    v19 = v17;
    v18 = *v17;
  }
  else
  {
    v19 = v17;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
    v31 = 2050;
    v32 = v13;
    _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s accumSampleSize:      [%{public}ld]", buf, 0x16u);
    v18 = *v19;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
    v31 = 2050;
    v32 = v12;
    _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s startBufferIndex:     [%{public}ld]", buf, 0x16u);
    v18 = *v19;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
    v31 = 2050;
    v32 = v27;
    _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s startBufferSampleSize:[%{public}ld]", buf, 0x16u);
    v18 = *v19;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
    v31 = 2050;
    v32 = v16;
    _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s samplesToBeDeleted:   [%{public}ld]", buf, 0x16u);
    v18 = *v19;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    pcmBufArray = self->_pcmBufArray;
    v21 = v18;
    v22 = -[NSMutableArray count](pcmBufArray, "count");
    *(_DWORD *)buf = 136315394;
    v30 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
    v31 = 2050;
    v32 = v22;
    _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEFAULT, "%s Total Number of buffs:[%{public}ld]", buf, 0x16u);

  }
  if (v16 >= 1)
  {
    v23 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
      _os_log_impl(&dword_2117D4000, v23, OS_LOG_TYPE_DEFAULT, "%s Adjusting the start buffer", buf, 0xCu);
    }
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithCommonFormat:sampleRate:channels:interleaved:", 3, 1, 0, 16000.0);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1838]), "initWithPCMFormat:frameCapacity:", v24, v27 - v16);
    memcpy(*(void **)(objc_msgSend(v25, "mutableAudioBufferList") + 16), (const void *)(*(_QWORD *)(objc_msgSend(v14, "mutableAudioBufferList") + 16) + 2 * v16), 2 * (v27 - v16));
    *(_DWORD *)(objc_msgSend(v25, "mutableAudioBufferList") + 12) = v27 - v16;
    objc_msgSend(v25, "setFrameLength:", v27 - v16);
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_pcmBufArray, "replaceObjectAtIndex:withObject:", v12, v25);

  }
  if (v12)
  {
    v26 = *v19;
    if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[CSVTUITrainingSession trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:]";
      _os_log_impl(&dword_2117D4000, v26, OS_LOG_TYPE_DEFAULT, "%s Adjusting the array elements", buf, 0xCu);
    }
    -[NSMutableArray removeObjectsInRange:](self->_pcmBufArray, "removeObjectsInRange:", 0, v12, v27);
  }

}

- (void)computeRequiredTrailingSamples
{
  int64_t v3;

  v3 = -[CSVTUITrainingSession numSamplesInPCMBuffer](self, "numSamplesInPCMBuffer");
  self->_numRequiredTrailingSamples = 3200 * (v3 / 3200) - v3 + 3200;
}

- (void)pushAudioInputIntoPCMBuffer:(id)a3
{
  id v4;

  -[CSVTUITrainingSession createAVAudioPCMBufferWithNSData:](self, "createAVAudioPCMBufferWithNSData:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)-[NSMutableArray count](self->_pcmBufArray, "count") >= 0x3C)
    -[NSMutableArray removeObjectAtIndex:](self->_pcmBufArray, "removeObjectAtIndex:", 0);
  -[NSMutableArray addObject:](self->_pcmBufArray, "addObject:", v4);

}

- (id)createAVAudioPCMBufferWithNSData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x24BDB1818];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCommonFormat:sampleRate:channels:interleaved:", 3, 1, 0, 16000.0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1838]), "initWithPCMFormat:frameCapacity:", v5, objc_msgSend(v4, "length") >> 1);
  v7 = *(void **)(objc_msgSend(v6, "mutableAudioBufferList") + 16);
  v8 = objc_retainAutorelease(v4);
  memcpy(v7, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
  LODWORD(v7) = objc_msgSend(v8, "length");
  *(_DWORD *)(objc_msgSend(v6, "mutableAudioBufferList") + 12) = (_DWORD)v7;
  LODWORD(v7) = objc_msgSend(v8, "length");

  objc_msgSend(v6, "setFrameLength:", v7 >> 1);
  return v6;
}

- (int64_t)numSamplesInPCMBuffer
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_pcmBufArray;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "frameLength", (_QWORD)v9);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)logTrainingSessionCompleteWithVoiceTriggerEventInfo:(id)a3
{
  uint64_t utteranceId_low;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  double v20;
  id v21;

  utteranceId_low = LODWORD(self->_utteranceId);
  v5 = *MEMORY[0x24BE28568];
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  v9 = CFSTR("Siri");
  if (!v8)
    v9 = CFSTR("Hey Siri");
  v10 = v9;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE285D0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE285D8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE285B8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE28580]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "BOOLValue");
  objc_msgSend(MEMORY[0x24BE28498], "sharedLogger");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = v13;
  objc_msgSend(v21, "logSiriSetupPHSEnrollmentUtteranceCompletedWithSiriSetupID:withPageNumber:withPhId:withTopScoreForUtterance:withStartSampleCount:withEndSampleCount:withHasSpeechDetected:", self->_mhUUID, utteranceId_low, v10, v15, v17, v19, v20);

}

- (id)createDigitalZeroReporterWithVoiceTriggerEventInfo:(id)a3 withSessionStatus:(int)a4
{
  uint64_t v4;
  uint64_t utteranceId_low;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  CSVTUISelfLoggingDigitalZeroReporter *v11;

  v4 = *(_QWORD *)&a4;
  utteranceId_low = LODWORD(self->_utteranceId);
  objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BE28568]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  v9 = CFSTR("Siri");
  if (!v8)
    v9 = CFSTR("Hey Siri");
  v10 = v9;

  v11 = -[CSVTUISelfLoggingDigitalZeroReporter initWithSiriSetupID:PageNumber:withPhId:withLocale:withVTAssetConfigVersion:withSessionStatus:]([CSVTUISelfLoggingDigitalZeroReporter alloc], "initWithSiriSetupID:PageNumber:withPhId:withLocale:withVTAssetConfigVersion:withSessionStatus:", self->_mhUUID, utteranceId_low, v10, self->_locale, self->_vtAssetConfigVersion, v4);
  return v11;
}

- (int)getTrainingAudioStatusWithVTEI:(id)a3 digitalZeroReporter:(id)a4
{
  id v5;
  int v6;
  void *v7;
  int v8;

  v5 = a3;
  if ((objc_msgSend(a4, "digitalZeroDetected") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE28580]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
      v6 = 0;
    else
      v6 = 2;
  }

  return v6;
}

- (void)audioSessionDidStopRecording:(int64_t)a3
{
  if (a3)
    -[CSVTUITrainingSession closeSessionWithStatus:successfully:](self, "closeSessionWithStatus:successfully:", 5, 0);
}

- (void)audioSessionErrorDidOccur:(id)a3
{
  -[CSVTUITrainingSession closeSessionWithStatus:successfully:](self, "closeSessionWithStatus:successfully:", 3, 0);
}

- (void)audioSessionUnsupportedAudioRoute
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVTUITrainingSession audioSessionUnsupportedAudioRoute]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Unsupported", (uint8_t *)&v4, 0xCu);
  }
  -[CSVTUITrainingSession closeSessionWithStatus:successfully:](self, "closeSessionWithStatus:successfully:", 4, 0);
}

- (void)didDetectBeginOfSpeech
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSVTUITrainingSession didDetectBeginOfSpeech]";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s Begin of speech detected", (uint8_t *)&v3, 0xCu);
  }
}

- (void)didDetectEndOfSpeech:(int64_t)a3
{
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[4];
  id v8[2];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[CSVTUITrainingSession didDetectEndOfSpeech:]";
    v11 = 2050;
    v12 = a3;
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s End of speech detected with endpoint type: %{public}ld", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__CSVTUITrainingSession_didDetectEndOfSpeech___block_invoke;
  v7[3] = &unk_24CC85A68;
  objc_copyWeak(v8, (id *)buf);
  v8[1] = (id)a3;
  dispatch_async(queue, v7);
  objc_destroyWeak(v8);
  objc_destroyWeak((id *)buf);
}

- (void)setupSpeechRecognitionTaskWithVoiceTriggerEventInfo:(id)a3
{
  SFSpeechAudioBufferRecognitionRequest *v4;
  SFSpeechAudioBufferRecognitionRequest *speechRecognitionRequest;
  SFSpeechAudioBufferRecognitionRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SFSpeechRecognitionTask *v11;
  SFSpeechRecognitionTask *speechRecognitionTask;
  id v13;

  v13 = a3;
  v4 = (SFSpeechAudioBufferRecognitionRequest *)objc_alloc_init(MEMORY[0x24BDE9E18]);
  speechRecognitionRequest = self->_speechRecognitionRequest;
  self->_speechRecognitionRequest = v4;

  v6 = self->_speechRecognitionRequest;
  +[CSVTUIASRGrammars sharedGrammars](CSVTUIASRGrammars, "sharedGrammars");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getLMEforLocale:", self->_locale);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSpeechAudioBufferRecognitionRequest setContextualStrings:](v6, "setContextualStrings:", v8);

  -[SFSpeechAudioBufferRecognitionRequest setTaskHint:](self->_speechRecognitionRequest, "setTaskHint:", 1001);
  if (self->_speechRecognizer && self->_speechRecognitionRequest)
  {
    v9 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%ld] VTUISession Number:[%ld]"), self->_utteranceId, self->_sessionNumber);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", CFSTR("PHS explicit training utterance"), v10);

    -[SFSpeechAudioBufferRecognitionRequest _setVoiceTriggerEventInfo:](self->_speechRecognitionRequest, "_setVoiceTriggerEventInfo:", v9);
    -[SFSpeechRecognizer recognitionTaskWithRequest:delegate:](self->_speechRecognizer, "recognitionTaskWithRequest:delegate:", self->_speechRecognitionRequest, self);
    v11 = (SFSpeechRecognitionTask *)objc_claimAutoreleasedReturnValue();
    speechRecognitionTask = self->_speechRecognitionTask;
    self->_speechRecognitionTask = v11;

  }
}

- (void)finishSpeechRecognitionTask
{
  SFSpeechAudioBufferRecognitionRequest *speechRecognitionRequest;
  SFSpeechRecognitionTask *speechRecognitionTask;

  speechRecognitionRequest = self->_speechRecognitionRequest;
  if (speechRecognitionRequest)
    -[SFSpeechAudioBufferRecognitionRequest endAudio](speechRecognitionRequest, "endAudio");
  speechRecognitionTask = self->_speechRecognitionTask;
  if (speechRecognitionTask)
    -[SFSpeechRecognitionTask finish](speechRecognitionTask, "finish");
}

- (void)startMasterTimerWithTimeout:(float)a3
{
  NSObject *v5;
  _QWORD v6[5];
  float v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[CSVTUITrainingSession startMasterTimerWithTimeout:]";
    v10 = 2082;
    v11 = "-[CSVTUITrainingSession startMasterTimerWithTimeout:]";
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}s CALLED", buf, 0x16u);
  }
  if (a3 != 0.0)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__CSVTUITrainingSession_startMasterTimerWithTimeout___block_invoke;
    v6[3] = &unk_24CC85FD8;
    v6[4] = self;
    v7 = a3;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);
  }
}

- (void)handleMasterTimeout:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CSVTUITrainingSession handleMasterTimeout:]";
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Master Timeout Fired", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__CSVTUITrainingSession_handleMasterTimeout___block_invoke;
  v6[3] = &unk_24CC85A90;
  objc_copyWeak(&v7, (id *)buf);
  v6[4] = self;
  dispatch_async(queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)stopMasterTimer
{
  NSObject *v3;
  NSTimer *masterTimer;
  NSTimer *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSVTUITrainingSession stopMasterTimer]";
    v8 = 2082;
    v9 = "-[CSVTUITrainingSession stopMasterTimer]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}s called", (uint8_t *)&v6, 0x16u);
  }
  masterTimer = self->_masterTimer;
  if (masterTimer)
  {
    -[NSTimer invalidate](masterTimer, "invalidate");
    v5 = self->_masterTimer;
    self->_masterTimer = 0;

  }
}

- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4
{
  id v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (os_log_t *)MEMORY[0x24BE28368];
  v8 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[CSVTUITrainingSession speechRecognitionTask:didHypothesizeTranscription:]";
    v15 = 2082;
    v16 = "-[CSVTUITrainingSession speechRecognitionTask:didHypothesizeTranscription:]";
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}s called", (uint8_t *)&v13, 0x16u);
  }
  objc_msgSend(v6, "formattedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (char *)objc_claimAutoreleasedReturnValue();

  v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[CSVTUITrainingSession speechRecognitionTask:didHypothesizeTranscription:]";
    v15 = 2114;
    v16 = v11;
    _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s recognized text = %{public}@", (uint8_t *)&v13, 0x16u);
  }

}

- (void)_registerEndPointTimeout
{
  dispatch_time_t v3;
  NSObject *queue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 500000000);
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__CSVTUITrainingSession__registerEndPointTimeout__block_invoke;
  v5[3] = &unk_24CC85AB8;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (void)setVoiceTriggerEventInfo:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_continuousZeroCounter, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_trainingCompletionWithResult, 0);
  objc_storeStrong(&self->_trainingCompletion, 0);
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_storeStrong((id *)&self->_pcmBufArray, 0);
  objc_storeStrong((id *)&self->_masterTimer, 0);
  objc_storeStrong((id *)&self->_speechRecognitionTask, 0);
  objc_storeStrong((id *)&self->_speechRecognitionRequest, 0);
  objc_storeStrong((id *)&self->_speechRecognizer, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_keywordDetector, 0);
  objc_storeStrong((id *)&self->_vtAssetConfigVersion, 0);
  objc_storeStrong((id *)&self->_mhUUID, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

void __49__CSVTUITrainingSession__registerEndPointTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "closeSessionWithStatus:successfully:", 7, 0);

}

void __45__CSVTUITrainingSession_handleMasterTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD **)(a1 + 32);
    if (v3[12])
    {
      v4 = WeakRetained;
      objc_msgSend(v3, "stopMasterTimer");
      objc_msgSend(v4, "closeSessionWithStatus:successfully:", 7, 0);
      WeakRetained = v4;
    }
  }

}

void __53__CSVTUITrainingSession_startMasterTimerWithTimeout___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_handleMasterTimeout_, 0, 1, *(float *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

}

void __46__CSVTUITrainingSession_didDetectEndOfSpeech___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40) == 2)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_registerEndPointTimeout");
    WeakRetained = v3;
  }

}

void __42__CSVTUITrainingSession_handleAudioInput___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v4 + 113))
    {
      if (!*(_BYTE *)(v4 + 114))
      {
        v5 = *(_QWORD *)(v4 + 8);
        if (v5 == 2)
        {
          objc_msgSend(WeakRetained, "pushAudioInputIntoPCMBuffer:", *(_QWORD *)(a1 + 40));
          v8[0] = MEMORY[0x24BDAC760];
          v8[1] = 3221225472;
          v8[2] = __42__CSVTUITrainingSession_handleAudioInput___block_invoke_9;
          v8[3] = &unk_24CC864B8;
          v9 = v3;
          objc_msgSend(v9, "feedSpeechRecognitionTrailingSamplesWithCompletedBlock:", v8);
          v7 = v9;
          goto LABEL_8;
        }
        if (v5 == 1)
        {
          objc_msgSend(WeakRetained, "updateMeterAndForward");
          objc_msgSend(v3, "pushAudioInputIntoPCMBuffer:", *(_QWORD *)(a1 + 40));
          v10[0] = MEMORY[0x24BDAC760];
          v10[1] = 3221225472;
          v10[2] = __42__CSVTUITrainingSession_handleAudioInput___block_invoke_2;
          v10[3] = &unk_24CC85A18;
          v6 = *(_QWORD *)(a1 + 40);
          v10[4] = *(_QWORD *)(a1 + 32);
          v11 = v3;
          objc_msgSend(v11, "handleAudioBufferForVTWithAudioInput:withDetectedBlock:", v6, v10);
          v7 = v11;
LABEL_8:

        }
      }
    }
  }

}

void __42__CSVTUITrainingSession_handleAudioInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id WeakRetained;
  char v7;
  uint64_t v8;
  id v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), a2);
  objc_msgSend(*(id *)(a1 + 40), "requestTriggeredUtterance:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v7 = objc_opt_respondsToSelector();

  v8 = 2;
  if ((v7 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    v10 = objc_msgSend(v9, "CSVTUITrainingSession:hasTrainUtterance:languageCode:payload:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 0);

    if (v10)
      v8 = 0;
    else
      v8 = 2;
  }
  objc_msgSend(*(id *)(a1 + 40), "setupSpeechRecognitionTaskWithVoiceTriggerEventInfo:", v4);
  objc_msgSend(*(id *)(a1 + 40), "trimBeginingOfPCMBufferWithVoiceTriggerEventInfo:", v4);
  objc_msgSend(*(id *)(a1 + 40), "computeRequiredTrailingSamples");
  objc_msgSend(*(id *)(a1 + 40), "feedSpeechRecognitionWithPCMBuffer");
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(v11 + 160);
  if (v12 < 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "closeSessionWithStatus:successfully:", v8, 1);
  }
  else
  {
    v13 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315394;
      v15 = "-[CSVTUITrainingSession handleAudioInput:]_block_invoke_2";
      v16 = 2050;
      v17 = v12;
      _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Decide to delay ending ASR: [%{public}ld] samples", (uint8_t *)&v14, 0x16u);
      v11 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v11 + 8) = 2;
  }

}

uint64_t __42__CSVTUITrainingSession_handleAudioInput___block_invoke_9(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishSpeechRecognitionTask");
  return objc_msgSend(*(id *)(a1 + 32), "closeSessionWithStatus:successfully:", 0, 1);
}

uint64_t __39__CSVTUITrainingSession_resumeTraining__block_invoke(uint64_t a1)
{
  NSObject *v2;
  double v3;
  uint64_t result;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSVTUITrainingSession resumeTraining]_block_invoke";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s Will resume training", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "stopMasterTimer");
  LODWORD(v3) = 10.0;
  objc_msgSend(*(id *)(a1 + 32), "startMasterTimerWithTimeout:", v3);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeAllObjects");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 114) = 0;
  return result;
}

uint64_t __40__CSVTUITrainingSession_suspendTraining__block_invoke(uint64_t a1)
{
  NSObject *v2;
  double v3;
  uint64_t result;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSVTUITrainingSession suspendTraining]_block_invoke";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s Will suspend training", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "stopMasterTimer");
  LODWORD(v3) = 20.0;
  result = objc_msgSend(*(id *)(a1 + 32), "startMasterTimerWithTimeout:", v3);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 114) = 1;
  return result;
}

void __102__CSVTUITrainingSession_closeSessionWithStatus_successfully_voiceTriggerEventInfo_completeWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  int v9;
  char v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "resultAlreadyReported") & 1) != 0
    || (v2 = *(_QWORD *)(a1 + 32), !*(_QWORD *)(v2 + 136)))
  {
    v5 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSVTUITrainingSession closeSessionWithStatus:successfully:voiceTriggerEventInfo:completeWithResult:]_block_invoke_2";
      _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s Already reported status or no callback", buf, 0xCu);
    }
  }
  else
  {
    v3 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)buf = 136315394;
      v12 = "-[CSVTUITrainingSession closeSessionWithStatus:successfully:voiceTriggerEventInfo:completeWithResult:]_block_invoke";
      v13 = 1026;
      v14 = v4;
      _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s returning status to UI : %{public}d", buf, 0x12u);
      v2 = *(_QWORD *)(a1 + 32);
    }
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __102__CSVTUITrainingSession_closeSessionWithStatus_successfully_voiceTriggerEventInfo_completeWithResult___block_invoke_3;
    v6[3] = &unk_24CC859F0;
    v6[4] = v2;
    v7 = *(id *)(a1 + 40);
    v9 = *(_DWORD *)(a1 + 56);
    v10 = *(_BYTE *)(a1 + 60);
    v8 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 1;
}

void __102__CSVTUITrainingSession_closeSessionWithStatus_successfully_voiceTriggerEventInfo_completeWithResult___block_invoke_3(uint64_t a1)
{
  CSVTUITrainingResult *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "createDigitalZeroReporterWithVoiceTriggerEventInfo:withSessionStatus:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "stopCountingZeroStatisticsWithReporter:", v6);
    objc_msgSend(v6, "logDigitalZeroDetectionComplete");
  }
  v2 = -[CSVTUITrainingResult initWithSessionId:sessionStatus:audioStatus:]([CSVTUITrainingResult alloc], "initWithSessionId:sessionStatus:audioStatus:", 0, *(unsigned int *)(a1 + 56), objc_msgSend(*(id *)(a1 + 32), "getTrainingAudioStatusWithVTEI:digitalZeroReporter:", *(_QWORD *)(a1 + 40), v6));
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) + 16))();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = 0;

  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(void))(v5 + 16))();
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "logTrainingSessionCompleteWithVoiceTriggerEventInfo:");

}

void __70__CSVTUITrainingSession_closeSessionWithStatus_successfully_complete___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  int v8;
  char v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "resultAlreadyReported") & 1) != 0
    || (v2 = *(_QWORD *)(a1 + 32), !*(_QWORD *)(v2 + 128)))
  {
    v5 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CSVTUITrainingSession closeSessionWithStatus:successfully:complete:]_block_invoke_2";
      _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s Already reported status or no callback", buf, 0xCu);
    }
  }
  else
  {
    v3 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      v11 = "-[CSVTUITrainingSession closeSessionWithStatus:successfully:complete:]_block_invoke";
      v12 = 1026;
      v13 = v4;
      _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s returning status to UI : %{public}d", buf, 0x12u);
      v2 = *(_QWORD *)(a1 + 32);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__CSVTUITrainingSession_closeSessionWithStatus_successfully_complete___block_invoke_1;
    block[3] = &unk_24CC859C8;
    block[4] = v2;
    v8 = *(_DWORD *)(a1 + 48);
    v9 = *(_BYTE *)(a1 + 52);
    v7 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 1;
}

uint64_t __70__CSVTUITrainingSession_closeSessionWithStatus_successfully_complete___block_invoke_1(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 128);
  *(_QWORD *)(v2 + 128) = 0;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __52__CSVTUITrainingSession_closeSessionWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 113) = 0;
  v4 = WeakRetained;
  if ((objc_msgSend(WeakRetained, "resultAlreadyReported") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "stopMasterTimer");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 1;

}

uint64_t __38__CSVTUITrainingSession_startTraining__block_invoke(uint64_t a1)
{
  double v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setupPhraseSpotter");
  LODWORD(v2) = 10.0;
  result = objc_msgSend(*(id *)(a1 + 32), "startMasterTimerWithTimeout:", v2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 113) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 114) = 0;
  return result;
}

@end
