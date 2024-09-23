@implementation CSVTUITrainingSessionWithPayload

- (void)startTraining
{
  float v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSVTUITrainingSessionWithPayload;
  -[CSVTUITrainingSession startTraining](&v4, sel_startTraining);
  self->_detectBOS = 0;
  self->_ASRResultReceived = 0;
  self->_reportedStopListening = 0;
  self->_utteranceStored = 0;
  self->_numSamplesFed = 0;
  self->_bestTriggerSampleStart = 0;
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  self->_extraSamplesAtStart = (unint64_t)(float)(v3 * 0.5);
}

- (BOOL)shouldHandleSession
{
  return self->super._sessionProcess && !self->super._sessionSuspended;
}

- (BOOL)shouldMatchPayload
{
  SFSpeechRecognizer *speechRecognizer;

  if (self->super._ASRErrorOccured)
  {
    LOBYTE(speechRecognizer) = 0;
  }
  else
  {
    speechRecognizer = self->super._speechRecognizer;
    if (speechRecognizer)
    {
      LODWORD(speechRecognizer) = -[SFSpeechRecognizer isAvailable](speechRecognizer, "isAvailable");
      if ((_DWORD)speechRecognizer)
        LOBYTE(speechRecognizer) = self->_ASRResultReceived;
    }
  }
  return (char)speechRecognizer;
}

- (void)_registerVoiceTriggerTimeout
{
  dispatch_time_t v3;
  NSObject *queue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 5000000000);
  queue = self->super._queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__CSVTUITrainingSessionWithPayload__registerVoiceTriggerTimeout__block_invoke;
  v5[3] = &unk_24CC85AB8;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_firedVoiceTriggerTimeout
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (-[CSVTUITrainingSessionWithPayload shouldHandleSession](self, "shouldHandleSession"))
  {
    v3 = (os_log_t *)MEMORY[0x24BE28368];
    v4 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSVTUITrainingSessionWithPayload _firedVoiceTriggerTimeout]";
      _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Fired VoiceTrigger Timeout", (uint8_t *)&v6, 0xCu);
    }
    if (-[CSVTUITrainingSessionWithPayload shouldMatchPayload](self, "shouldMatchPayload"))
    {
      -[CSVTUITrainingSession finishSpeechRecognitionTask](self, "finishSpeechRecognitionTask");
    }
    else
    {
      v5 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315138;
        v7 = "-[CSVTUITrainingSessionWithPayload _firedVoiceTriggerTimeout]";
        _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s Stop right now since ASR has issue", (uint8_t *)&v6, 0xCu);
      }
    }
    -[CSVTUITrainingSessionWithPayload closeSessionWithStatus:successfully:](self, "closeSessionWithStatus:successfully:", 1, 0);
  }
}

- (void)_registerForceEndPointTimeout
{
  dispatch_time_t v3;
  NSObject *queue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 1500000000);
  queue = self->super._queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__CSVTUITrainingSessionWithPayload__registerForceEndPointTimeout__block_invoke;
  v5[3] = &unk_24CC85AB8;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (float)_getSessionEOSTimeout
{
  SFSpeechRecognizer *speechRecognizer;
  BOOL v3;
  float result;

  speechRecognizer = self->super._speechRecognizer;
  if (!speechRecognizer)
    return 0.0;
  v3 = -[SFSpeechRecognizer isAvailable](speechRecognizer, "isAvailable");
  result = 1.5;
  if (!v3)
    return 0.0;
  return result;
}

- (void)_registerEndPointTimeout
{
  float v3;
  dispatch_time_t v4;
  NSObject *queue;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[CSVTUITrainingSessionWithPayload _getSessionEOSTimeout](self, "_getSessionEOSTimeout");
  v4 = dispatch_time(0, (uint64_t)(float)(v3 * 1000000000.0));
  queue = self->super._queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__CSVTUITrainingSessionWithPayload__registerEndPointTimeout__block_invoke;
  v6[3] = &unk_24CC85AB8;
  objc_copyWeak(&v7, &location);
  dispatch_after(v4, queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_firedEndPointTimeout
{
  int64_t status;
  os_log_t *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[CSVTUITrainingSessionWithPayload shouldHandleSession](self, "shouldHandleSession"))
  {
    status = self->super._status;
    v4 = (os_log_t *)MEMORY[0x24BE28368];
    v5 = *MEMORY[0x24BE28368];
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT);
    if (status == 3)
    {
      if (v6)
      {
        v9 = 136315138;
        v10 = "-[CSVTUITrainingSessionWithPayload _firedEndPointTimeout]";
        _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s EOS Timeout Fired", (uint8_t *)&v9, 0xCu);
      }
      if (-[CSVTUITrainingSessionWithPayload shouldMatchPayload](self, "shouldMatchPayload"))
      {
        -[CSVTUITrainingSession finishSpeechRecognitionTask](self, "finishSpeechRecognitionTask");
      }
      else
      {
        v8 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136315138;
          v10 = "-[CSVTUITrainingSessionWithPayload _firedEndPointTimeout]";
          _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Stop right now since ASR has issue", (uint8_t *)&v9, 0xCu);
        }
      }
      v7 = 1;
    }
    else
    {
      if (v6)
      {
        v9 = 136315138;
        v10 = "-[CSVTUITrainingSessionWithPayload _firedEndPointTimeout]";
        _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s Force endpoint fired", (uint8_t *)&v9, 0xCu);
      }
      v7 = 7;
    }
    -[CSVTUITrainingSessionWithPayload closeSessionWithStatus:successfully:](self, "closeSessionWithStatus:successfully:", v7, 0);
  }
}

- (void)_reportStopListening
{
  CSVTUITrainingSessionDelegate **p_sessionDelegate;
  id WeakRetained;
  char v4;
  id v5;

  if (!self->_reportedStopListening)
  {
    self->_reportedStopListening = 1;
    p_sessionDelegate = &self->super._sessionDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._sessionDelegate);
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)p_sessionDelegate);
      objc_msgSend(v5, "CSVTUITrainingSessionStopListen");

    }
  }
}

- (void)handleAudioInput:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CSVTUITrainingSessionWithPayload *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->super._queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__CSVTUITrainingSessionWithPayload_handleAudioInput___block_invoke;
  v7[3] = &unk_24CC85A40;
  objc_copyWeak(&v10, &location);
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)audioSessionDidStartRecording:(BOOL)a3 error:(id)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSVTUITrainingSessionWithPayload audioSessionDidStartRecording:error:]";
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s AudioSession Started", (uint8_t *)&v5, 0xCu);
  }
}

- (void)audioSessionDidStopRecording:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSVTUITrainingSessionWithPayload audioSessionDidStopRecording:]";
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s AudioSession Stopped", (uint8_t *)&v6, 0xCu);
  }
  if (a3)
    -[CSVTUITrainingSessionWithPayload closeSessionWithStatus:successfully:](self, "closeSessionWithStatus:successfully:", 5, 0);
}

- (void)audioSessionErrorDidOccur:(id)a3
{
  -[CSVTUITrainingSessionWithPayload closeSessionWithStatus:successfully:](self, "closeSessionWithStatus:successfully:", 3, 0);
}

- (void)audioSessionUnsupportedAudioRoute
{
  -[CSVTUITrainingSessionWithPayload closeSessionWithStatus:successfully:](self, "closeSessionWithStatus:successfully:", 4, 0);
}

- (void)didDetectBeginOfSpeech
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSVTUITrainingSessionWithPayload didDetectBeginOfSpeech]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Begin of speech detected", buf, 0xCu);
  }
  queue = self->super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CSVTUITrainingSessionWithPayload_didDetectBeginOfSpeech__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)didDetectEndOfSpeech:(int64_t)a3
{
  os_log_t *v5;
  NSObject *v6;
  NSObject *v7;
  id *v8;
  NSObject *queue;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD block[5];
  id v14;
  id location;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE28368];
  v6 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[CSVTUITrainingSessionWithPayload didDetectEndOfSpeech:]";
    v18 = 2050;
    v19 = a3;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s End of speech detected with endpoint type: %{public}ld", buf, 0x16u);
  }
  objc_initWeak(&location, self);
  if (a3 == 2)
  {
    queue = self->super._queue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__CSVTUITrainingSessionWithPayload_didDetectEndOfSpeech___block_invoke_2;
    v11[3] = &unk_24CC85AB8;
    objc_copyWeak(&v12, &location);
    dispatch_async(queue, v11);
    v8 = &v12;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    v7 = self->super._queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__CSVTUITrainingSessionWithPayload_didDetectEndOfSpeech___block_invoke;
    block[3] = &unk_24CC85A90;
    objc_copyWeak(&v14, &location);
    block[4] = self;
    dispatch_async(v7, block);
    v8 = &v14;
LABEL_7:
    objc_destroyWeak(v8);
    goto LABEL_10;
  }
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSVTUITrainingSessionWithPayload didDetectEndOfSpeech:]";
    _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, "%s unknown endpoint type", buf, 0xCu);
  }
LABEL_10:
  objc_destroyWeak(&location);
}

- (void)closeSessionWithStatus:(int)a3 successfully:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  os_log_t *v7;
  NSObject *v8;
  _BOOL4 utteranceStored;
  void *v10;
  id WeakRetained;
  char v12;
  id v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v7 = (os_log_t *)MEMORY[0x24BE28368];
  v8 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    utteranceStored = self->_utteranceStored;
    v15 = 136315906;
    v16 = "-[CSVTUITrainingSessionWithPayload closeSessionWithStatus:successfully:]";
    v17 = 1026;
    v18 = v5;
    v19 = 1026;
    v20 = v4;
    v21 = 1026;
    v22 = utteranceStored;
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Called with status : %{public}d and success : %{public}d utteranceStored : %{public}d", (uint8_t *)&v15, 0x1Eu);
  }
  if (v5 <= 1 && !self->_utteranceStored)
  {
    -[CSVTUITrainingSession requestTriggeredUtterance:](self, "requestTriggeredUtterance:", self->_voiceTriggerEventInfo);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._sessionDelegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&self->super._sessionDelegate);
      self->_utteranceStored = objc_msgSend(v13, "CSVTUITrainingSession:hasTrainUtterance:languageCode:payload:", self, v10, self->super._locale, 1);

      if (!self->_utteranceStored)
      {
        v14 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        {
          v15 = 136315138;
          v16 = "-[CSVTUITrainingSessionWithPayload closeSessionWithStatus:successfully:]";
          _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s ERR: Failed to store utterance, overiding status", (uint8_t *)&v15, 0xCu);
        }
        v5 = 2;
      }
    }

  }
  if (self->super._trainingCompletion)
    -[CSVTUITrainingSession closeSessionWithStatus:successfully:complete:](self, "closeSessionWithStatus:successfully:complete:", v5, v4, 0);
  else
    -[CSVTUITrainingSession closeSessionWithStatus:successfully:voiceTriggerEventInfo:completeWithResult:](self, "closeSessionWithStatus:successfully:voiceTriggerEventInfo:completeWithResult:", v5, v4, self->_voiceTriggerEventInfo, 0);
}

- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4
{
  id v6;
  NSObject *queue;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v6 = a4;
  if (self->super._speechRecognitionTask == a3)
  {
    objc_initWeak(&location, self);
    queue = self->super._queue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __86__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didHypothesizeTranscription___block_invoke;
    v8[3] = &unk_24CC85A40;
    v8[4] = self;
    objc_copyWeak(&v10, &location);
    v9 = v6;
    dispatch_async(queue, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4
{
  id v6;
  NSObject *queue;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v6 = a4;
  if (self->super._speechRecognitionTask == a3)
  {
    objc_initWeak(&location, self);
    queue = self->super._queue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __79__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishRecognition___block_invoke;
    v8[3] = &unk_24CC85A40;
    v8[4] = self;
    objc_copyWeak(&v10, &location);
    v9 = v6;
    dispatch_async(queue, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[5];

  if (self->super._speechRecognitionTask == a3 && !a4)
  {
    queue = self->super._queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishSuccessfully___block_invoke;
    block[3] = &unk_24CC864B8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)matchRecognitionResult:(id)a3 withMatchedBlock:(id)a4 withNonMatchedBlock:(id)a5
{
  id v8;
  void (**v9)(void);
  void (**v10)(void);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  NSObject **v18;
  NSObject *v19;
  int64_t utteranceId;
  void (**v21)(void);
  int v22;
  const char *v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(void))a4;
  v10 = (void (**)(void))a5;
  if (v8)
  {
    +[CSVTUIASRGrammars sharedGrammars](CSVTUIASRGrammars, "sharedGrammars");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getTrailingPatternsForUtt:Locale:", self->super._utteranceId, self->super._locale);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[CSVTUIASRGrammars sharedGrammars](CSVTUIASRGrammars, "sharedGrammars");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getLeadingPatternsForUtt:Locale:", self->super._utteranceId, self->super._locale);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[CSVTUIASRGrammars sharedGrammars](CSVTUIASRGrammars, "sharedGrammars");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getRegexPatternsForUtt:Locale:", self->super._utteranceId, self->super._locale);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    if (v12 && v14 && v16)
      v17 = +[CSVTUIRegularExpressionMatcher matchWithString:TrailingStr:LeadingStr:Pattern:](CSVTUIRegularExpressionMatcher, "matchWithString:TrailingStr:LeadingStr:Pattern:", v8, v12, v14, v16);
    v18 = (NSObject **)MEMORY[0x24BE28368];
    v19 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      utteranceId = self->super._utteranceId;
      v22 = 136316162;
      v23 = "-[CSVTUITrainingSessionWithPayload matchRecognitionResult:withMatchedBlock:withNonMatchedBlock:]";
      v24 = 2114;
      v25 = (int64_t)v12;
      v26 = 2114;
      v27 = v14;
      v28 = 2050;
      v29 = utteranceId;
      v30 = 2114;
      v31 = v16;
      _os_log_impl(&dword_2117D4000, v19, OS_LOG_TYPE_DEFAULT, "%s %{public}@ %{public}@ %{public}ld %{public}@", (uint8_t *)&v22, 0x34u);
      v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315394;
      v23 = "-[CSVTUITrainingSessionWithPayload matchRecognitionResult:withMatchedBlock:withNonMatchedBlock:]";
      v24 = 2050;
      v25 = v17;
      _os_log_impl(&dword_2117D4000, v19, OS_LOG_TYPE_DEFAULT, "%s Recog Result: [%{public}ld]", (uint8_t *)&v22, 0x16u);
    }
    if (v9 && (v21 = v9, v17 == 1) || v10 && (v21 = v10, !v17))
      v21[2]();

  }
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
}

void __80__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishSuccessfully___block_invoke(uint64_t a1)
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
    v4 = "-[CSVTUITrainingSessionWithPayload speechRecognitionTask:didFinishSuccessfully:]_block_invoke";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s SPEECH RECOGNITION TASK FINISH UNSUCCESSFULLY", (uint8_t *)&v3, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 115) = 1;
}

void __79__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishRecognition___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "bestTranscription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "formattedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 193) = 1;
    v7 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[CSVTUITrainingSessionWithPayload speechRecognitionTask:didFinishRecognition:]_block_invoke";
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s Final: [%{public}@]", buf, 0x16u);
    }
    v8 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __79__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishRecognition___block_invoke_9;
    v12[3] = &unk_24CC864B8;
    v13 = WeakRetained;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __79__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishRecognition___block_invoke_10;
    v10[3] = &unk_24CC864B8;
    v11 = v13;
    v9 = v13;
    objc_msgSend(v9, "matchRecognitionResult:withMatchedBlock:withNonMatchedBlock:", v6, v12, v10);

  }
}

uint64_t __79__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishRecognition___block_invoke_9(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVTUITrainingSessionWithPayload speechRecognitionTask:didFinishRecognition:]_block_invoke";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s Final Matching", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishSpeechRecognitionTask");
  return objc_msgSend(*(id *)(a1 + 32), "closeSessionWithStatus:successfully:", 1, 1);
}

uint64_t __79__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didFinishRecognition___block_invoke_10(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVTUITrainingSessionWithPayload speechRecognitionTask:didFinishRecognition:]_block_invoke";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s Final Not Matching", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishSpeechRecognitionTask");
  return objc_msgSend(*(id *)(a1 + 32), "closeSessionWithStatus:successfully:", 2, 0);
}

void __86__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didHypothesizeTranscription___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "formattedString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 193) = 1;
    v6 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[CSVTUITrainingSessionWithPayload speechRecognitionTask:didHypothesizeTranscription:]_block_invoke";
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s Non Final: [%{public}@]", buf, 0x16u);
    }
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __86__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didHypothesizeTranscription___block_invoke_8;
    v8[3] = &unk_24CC864B8;
    v9 = WeakRetained;
    v7 = WeakRetained;
    objc_msgSend(v7, "matchRecognitionResult:withMatchedBlock:withNonMatchedBlock:", v5, v8, 0);

  }
}

uint64_t __86__CSVTUITrainingSessionWithPayload_speechRecognitionTask_didHypothesizeTranscription___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVTUITrainingSessionWithPayload speechRecognitionTask:didHypothesizeTranscription:]_block_invoke";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s NON Final Matching", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishSpeechRecognitionTask");
  return objc_msgSend(*(id *)(a1 + 32), "closeSessionWithStatus:successfully:", 1, 1);
}

void __57__CSVTUITrainingSessionWithPayload_didDetectEndOfSpeech___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 192))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_reportStopListening");
    objc_msgSend(v3, "_registerEndPointTimeout");
    WeakRetained = v3;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 192) = 0;
  }

}

void __57__CSVTUITrainingSessionWithPayload_didDetectEndOfSpeech___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reportStopListening");
  objc_msgSend(WeakRetained, "_registerForceEndPointTimeout");

}

uint64_t __58__CSVTUITrainingSessionWithPayload_didDetectBeginOfSpeech__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 192) = 1;
  return result;
}

void __53__CSVTUITrainingSessionWithPayload_handleAudioInput___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unint64_t v4;
  unsigned int v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  float v10;
  float v11;
  float v12;
  float v13;
  NSObject *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "shouldHandleSession"))
  {
    objc_msgSend(v3, "updateMeterAndForward");
    v4 = objc_msgSend(*(id *)(a1 + 32), "length");
    v5 = objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingBytesPerFrame");
    v6 = *(_QWORD **)(a1 + 40);
    v7 = v6[1];
    v8 = v4 / v5;
    if (v7 == 3)
    {
      v10 = (float)(v6[25] + v8 - v6[26]);
      objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingDurationInSecs");
      v12 = v11;
      objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
      if ((float)(v12 * v13) >= v10)
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200) += v8;
        objc_msgSend(v3, "handleAudioBufferForVTWithAudioInput:withDetectedBlock:", *(_QWORD *)(a1 + 32), 0);
      }
      else
      {
        v14 = *MEMORY[0x24BE28368];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD **)(a1 + 40);
          v16 = v15[25];
          v17 = v15[26];
          v18 = v15[27];
          *(_DWORD *)buf = 136316418;
          v22 = "-[CSVTUITrainingSessionWithPayload handleAudioInput:]_block_invoke";
          v23 = 2050;
          v24 = v8;
          v25 = 2050;
          v26 = v16 - v17;
          v27 = 2050;
          v28 = v16;
          v29 = 2050;
          v30 = v17;
          v31 = 2050;
          v32 = v18;
          _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s Discarding surplus audio of %{public}lu samples, audio sample available %{public}lu (%{public}lu, %{public}lu, %{public}lu)", buf, 0x3Eu);
        }
      }
      objc_msgSend(v3, "pushAudioInputIntoPCMBuffer:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v3, "feedSpeechRecognitionWithPCMBuffer");
    }
    else if (v7 == 1)
    {
      objc_msgSend(v3, "pushAudioInputIntoPCMBuffer:", *(_QWORD *)(a1 + 32));
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200) += v8;
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __53__CSVTUITrainingSessionWithPayload_handleAudioInput___block_invoke_2;
      v19[3] = &unk_24CC85A18;
      v9 = *(_QWORD *)(a1 + 32);
      v19[4] = *(_QWORD *)(a1 + 40);
      v20 = v3;
      objc_msgSend(v20, "handleAudioBufferForVTWithAudioInput:withDetectedBlock:", v9, v19);

    }
  }

}

void __53__CSVTUITrainingSessionWithPayload_handleAudioInput___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 224), a2);
  v10 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "objectForKeyedSubscript:", *MEMORY[0x24BE285D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = objc_msgSend(v4, "unsignedIntegerValue");

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 208);
  v7 = *(_QWORD *)(v5 + 216);
  v8 = v6 >= v7;
  v9 = v6 - v7;
  if (!v8)
    v9 = 0;
  *(_QWORD *)(v5 + 208) = v9;
  objc_msgSend(*(id *)(a1 + 40), "setupSpeechRecognitionTaskWithVoiceTriggerEventInfo:", v10);
  objc_msgSend(*(id *)(a1 + 40), "feedSpeechRecognitionWithPCMBuffer");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 3;
  objc_msgSend(*(id *)(a1 + 40), "_registerVoiceTriggerTimeout");

}

void __60__CSVTUITrainingSessionWithPayload__registerEndPointTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_firedEndPointTimeout");

}

void __65__CSVTUITrainingSessionWithPayload__registerForceEndPointTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_firedEndPointTimeout");

}

void __64__CSVTUITrainingSessionWithPayload__registerVoiceTriggerTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_firedVoiceTriggerTimeout");

}

@end
