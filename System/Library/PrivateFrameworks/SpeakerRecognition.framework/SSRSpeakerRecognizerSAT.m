@implementation SSRSpeakerRecognizerSAT

- (SSRSpeakerRecognizerSAT)initWithContext:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SSRSpeakerRecognizerSAT *v9;
  SSRSpeakerAnalyzerSAT *v10;
  SSRSpeakerAnalyzerSAT *satAnalyzer;
  SSRSpeakerAnalyzerSAT *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unint64_t extraSamplesAtStart;
  unint64_t tdEndInSampleCount;
  float v20;
  SSRSpeakerRecognizerSAT *v21;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SSRSpeakerRecognizerSAT;
  v9 = -[SSRSpeakerRecognizerSAT init](&v24, sel_init);
  if (!v9)
  {
LABEL_9:
    v21 = v9;
    goto LABEL_13;
  }
  if (objc_msgSend(v7, "recognitionStyle")
    && objc_msgSend(v7, "recognitionStyle") != 1
    && objc_msgSend(v7, "recognitionStyle") != 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SSRSpeakerRecognizerSAT.m"), 52, CFSTR("Incorrect ctx for VTSpeakerRecognizer: %@"), v7);

  }
  -[SSRSpeakerRecognizerSAT _initializeWithContext:](v9, "_initializeWithContext:", v7);
  objc_storeWeak((id *)&v9->_delegate, v8);
  v10 = -[SSRSpeakerAnalyzerSAT initWithVoiceRecognitionContext:delegate:]([SSRSpeakerAnalyzerSAT alloc], "initWithVoiceRecognitionContext:delegate:", v9->_spIdCtx, v9);
  satAnalyzer = v9->_satAnalyzer;
  v9->_satAnalyzer = v10;

  v12 = v9->_satAnalyzer;
  v13 = *MEMORY[0x24BE28360];
  v14 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      v15 = v13;
      +[SSRUtils stringForInvocationStyle:](SSRUtils, "stringForInvocationStyle:", objc_msgSend(v7, "recognitionStyle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSRSpeakerRecognitionContext sessionId](v9->_spIdCtx, "sessionId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      extraSamplesAtStart = v9->_extraSamplesAtStart;
      tdEndInSampleCount = v9->_tdEndInSampleCount;
      objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
      *(_DWORD *)buf = 136316418;
      v26 = "-[SSRSpeakerRecognizerSAT initWithContext:delegate:]";
      v27 = 2112;
      v28 = v16;
      v29 = 2112;
      v30 = v17;
      v31 = 2048;
      v32 = extraSamplesAtStart;
      v33 = 2048;
      v34 = tdEndInSampleCount;
      v35 = 2048;
      v36 = (float)((float)((float)tdEndInSampleCount / v20) * 1000.0);
      _os_log_impl(&dword_2117D4000, v15, OS_LOG_TYPE_DEFAULT, "%s %@::uniqueUttTag: %@, extraSamplesAtStart: %lu, _tdEndInSampleCount: %lu(%f ms)", buf, 0x3Eu);

    }
    goto LABEL_9;
  }
  if (v14)
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[SSRSpeakerRecognizerSAT initWithContext:delegate:]";
    _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed to create SSRSpeakerAnalyzerSAT", buf, 0xCu);
  }
  v21 = 0;
LABEL_13:

  return v21;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SSRSpeakerRecognizerSAT dealloc]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s SSRSpeakerRecognizerSAT dealloc", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRSpeakerRecognizerSAT;
  -[SSRSpeakerRecognizerSAT dealloc](&v4, sel_dealloc);
}

- (void)_initializeWithContext:(id)a3
{
  NSString *v5;
  NSString *sessionId;
  NSString *v7;
  NSString *invocationStyleStr;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  float v13;
  double v14;
  float v15;
  id v16;

  v16 = a3;
  objc_storeStrong((id *)&self->_spIdCtx, a3);
  -[SSRSpeakerRecognitionContext sessionId](self->_spIdCtx, "sessionId");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  sessionId = self->_sessionId;
  self->_sessionId = v5;

  self->_numTdTiSamplesProcessed = 0;
  self->_processingEnded = 0;
  self->_extraSamplesAtStart = 0;
  self->_tdEndInSampleCount = 0;
  +[SSRUtils stringForInvocationStyle:](SSRUtils, "stringForInvocationStyle:", -[SSRSpeakerRecognitionContext recognitionStyle](self->_spIdCtx, "recognitionStyle"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  invocationStyleStr = self->_invocationStyleStr;
  self->_invocationStyleStr = v7;

  if (!-[SSRSpeakerRecognitionContext recognitionStyle](self->_spIdCtx, "recognitionStyle"))
  {
    -[SSRSpeakerRecognitionContext vtEventInfo](self->_spIdCtx, "vtEventInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("extraSamplesAtStart"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    self->_extraSamplesAtStart = (unint64_t)v11;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("triggerEndSeconds"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = v13;

    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    self->_tdEndInSampleCount = (unint64_t)(v14 * v15);

  }
}

- (void)processAudioData:(id)a3 numSamples:(unint64_t)a4
{
  -[SSRSpeakerAnalyzerSAT processAudioData:numSamples:](self->_satAnalyzer, "processAudioData:numSamples:", a3, a4);
}

- (void)endAudio
{
  self->_processingEnded = 1;
  -[SSRSpeakerAnalyzerSAT endAudio](self->_satAnalyzer, "endAudio");
}

- (void)resetWithContext:(id)a3
{
  id v4;

  -[SSRSpeakerRecognizerSAT _initializeWithContext:](self, "_initializeWithContext:", a3);
  v4 = -[SSRSpeakerAnalyzerSAT resetForNewRequest](self->_satAnalyzer, "resetForNewRequest");
}

- (NSDictionary)lastScoreCard
{
  NSDictionary *v3;
  NSDictionary *lastSpeakerInfo;

  -[SSRSpeakerAnalyzerSAT getVoiceRecognizerResults](self->_satAnalyzer, "getVoiceRecognizerResults");
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  lastSpeakerInfo = self->_lastSpeakerInfo;
  self->_lastSpeakerInfo = v3;

  return self->_lastSpeakerInfo;
}

- (void)voiceRecognitionSATAnalyzer:(id)a3 hasVoiceRecognitionInfo:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  char v9;
  NSObject *v10;
  void *v11;
  SSRSpeakerRecognitionContext *spIdCtx;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && !-[NSString isEqualToString:](self->_sessionId, "isEqualToString:", v7))
  {
    v11 = (void *)*MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      spIdCtx = self->_spIdCtx;
      v10 = v11;
      -[SSRSpeakerRecognitionContext sessionId](spIdCtx, "sessionId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315650;
      v15 = "-[SSRSpeakerRecognizerSAT voiceRecognitionSATAnalyzer:hasVoiceRecognitionInfo:]";
      v16 = 2114;
      v17 = v13;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Discarded ScoreCard for mismatch session - {%{public}@, %{public}@}", (uint8_t *)&v14, 0x20u);

      goto LABEL_7;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_lastSpeakerInfo, a4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject speakerRecognizer:hasSpeakerIdInfo:](v10, "speakerRecognizer:hasSpeakerIdInfo:", self, v6);
LABEL_7:

    }
  }

}

- (void)voiceRecognitionSATAnalyzerFinishedProcessing:(id)a3 withVoiceRecognitionInfo:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  char v9;
  NSObject *v10;
  void *v11;
  SSRSpeakerRecognitionContext *spIdCtx;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sessionId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && !-[NSString isEqualToString:](self->_sessionId, "isEqualToString:", v7))
  {
    v11 = (void *)*MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      spIdCtx = self->_spIdCtx;
      v10 = v11;
      -[SSRSpeakerRecognitionContext sessionId](spIdCtx, "sessionId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315650;
      v15 = "-[SSRSpeakerRecognizerSAT voiceRecognitionSATAnalyzerFinishedProcessing:withVoiceRecognitionInfo:]";
      v16 = 2114;
      v17 = v13;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Discarded ScoreCard for mismatch session - {%{public}@, %{public}@}", (uint8_t *)&v14, 0x20u);

      goto LABEL_7;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_lastSpeakerInfo, a4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject speakerRecognizerFinishedProcessing:withFinalSpeakerIdInfo:](v10, "speakerRecognizerFinishedProcessing:withFinalSpeakerIdInfo:", self, v6);
LABEL_7:

    }
  }

}

- (SSRSpeakerRecognitionContext)spIdCtx
{
  return self->_spIdCtx;
}

- (void)setSpIdCtx:(id)a3
{
  objc_storeStrong((id *)&self->_spIdCtx, a3);
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (NSDictionary)lastSpeakerInfo
{
  return self->_lastSpeakerInfo;
}

- (void)setLastSpeakerInfo:(id)a3
{
  objc_storeStrong((id *)&self->_lastSpeakerInfo, a3);
}

- (SSRSpeakerRecognizerDelegate)delegate
{
  return (SSRSpeakerRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)invocationStyleStr
{
  return self->_invocationStyleStr;
}

- (void)setInvocationStyleStr:(id)a3
{
  objc_storeStrong((id *)&self->_invocationStyleStr, a3);
}

- (unint64_t)extraSamplesAtStart
{
  return self->_extraSamplesAtStart;
}

- (void)setExtraSamplesAtStart:(unint64_t)a3
{
  self->_extraSamplesAtStart = a3;
}

- (unint64_t)tdEndInSampleCount
{
  return self->_tdEndInSampleCount;
}

- (void)setTdEndInSampleCount:(unint64_t)a3
{
  self->_tdEndInSampleCount = a3;
}

- (unint64_t)totalNumSamplesReceived
{
  return self->_totalNumSamplesReceived;
}

- (void)setTotalNumSamplesReceived:(unint64_t)a3
{
  self->_totalNumSamplesReceived = a3;
}

- (unint64_t)numTdTiSamplesProcessed
{
  return self->_numTdTiSamplesProcessed;
}

- (void)setNumTdTiSamplesProcessed:(unint64_t)a3
{
  self->_numTdTiSamplesProcessed = a3;
}

- (BOOL)processingEnded
{
  return self->_processingEnded;
}

- (void)setProcessingEnded:(BOOL)a3
{
  self->_processingEnded = a3;
}

- (SSRSpeakerAnalyzerSAT)satAnalyzer
{
  return self->_satAnalyzer;
}

- (void)setSatAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_satAnalyzer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satAnalyzer, 0);
  objc_storeStrong((id *)&self->_invocationStyleStr, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastSpeakerInfo, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_spIdCtx, 0);
}

@end
