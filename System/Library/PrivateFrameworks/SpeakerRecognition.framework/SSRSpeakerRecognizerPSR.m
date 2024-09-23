@implementation SSRSpeakerRecognizerPSR

- (SSRSpeakerRecognizerPSR)initWithContext:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SSRSpeakerRecognizerPSR *v9;
  SSRSpeakerAnalyzerPSR *v10;
  SSRSpeakerAnalyzerPSR *psrAnalyzer;
  SSRSpeakerAnalyzerPSR *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unint64_t extraSamplesAtStart;
  unint64_t vtEndInSampleCount;
  float v20;
  SSRSpeakerRecognizerPSR *v21;
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
  v24.super_class = (Class)SSRSpeakerRecognizerPSR;
  v9 = -[SSRSpeakerRecognizerPSR init](&v24, sel_init);
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
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SSRSpeakerRecognizerPSR.m"), 54, CFSTR("Incorrect ctx for VTSpeakerRecognizer: %@"), v7);

  }
  -[SSRSpeakerRecognizerPSR _initializeWithContext:](v9, "_initializeWithContext:", v7);
  objc_storeWeak((id *)&v9->_delegate, v8);
  v10 = -[SSRSpeakerAnalyzerPSR initWithVoiceRecognitionContext:delegate:]([SSRSpeakerAnalyzerPSR alloc], "initWithVoiceRecognitionContext:delegate:", v9->_spIdCtx, v9);
  psrAnalyzer = v9->_psrAnalyzer;
  v9->_psrAnalyzer = v10;

  v12 = v9->_psrAnalyzer;
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
      vtEndInSampleCount = v9->_vtEndInSampleCount;
      objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
      *(_DWORD *)buf = 136316418;
      v26 = "-[SSRSpeakerRecognizerPSR initWithContext:delegate:]";
      v27 = 2112;
      v28 = v16;
      v29 = 2112;
      v30 = v17;
      v31 = 2048;
      v32 = extraSamplesAtStart;
      v33 = 2048;
      v34 = vtEndInSampleCount;
      v35 = 2048;
      v36 = (float)((float)((float)vtEndInSampleCount / v20) * 1000.0);
      _os_log_impl(&dword_2117D4000, v15, OS_LOG_TYPE_DEFAULT, "%s %@::uniqueUttTag: %@, extraSamplesAtStart: %lu, _tdEndInSampleCount: %lu(%f ms)", buf, 0x3Eu);

    }
    goto LABEL_9;
  }
  if (v14)
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[SSRSpeakerRecognizerPSR initWithContext:delegate:]";
    _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed to create SSRSpeakerRecognizerPSR", buf, 0xCu);
  }
  v21 = 0;
LABEL_13:

  return v21;
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

  self->_numSamplesProcessed = 0;
  self->_processingEnded = 0;
  self->_extraSamplesAtStart = 0;
  self->_vtEndInSampleCount = 0;
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
    self->_vtEndInSampleCount = (unint64_t)(v14 * v15);

  }
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
    v6 = "-[SSRSpeakerRecognizerPSR dealloc]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s CSSpIdVTSpeakerRecognizer dealloc", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSRSpeakerRecognizerPSR;
  -[SSRSpeakerRecognizerPSR dealloc](&v4, sel_dealloc);
}

- (void)processAudioData:(id)a3 numSamples:(unint64_t)a4
{
  self->_numSamplesProcessed += a4;
  -[SSRSpeakerAnalyzerPSR processAudioData:](self->_psrAnalyzer, "processAudioData:", a3);
}

- (void)endAudio
{
  self->_processingEnded = 1;
  -[SSRSpeakerAnalyzerPSR endAudio](self->_psrAnalyzer, "endAudio");
}

- (void)resetWithContext:(id)a3
{
  id v4;

  -[SSRSpeakerRecognizerPSR _initializeWithContext:](self, "_initializeWithContext:", a3);
  v4 = -[SSRSpeakerAnalyzerPSR resetForNewRequest](self->_psrAnalyzer, "resetForNewRequest");
}

- (NSDictionary)lastScoreCard
{
  NSDictionary *v3;
  NSDictionary *lastSpeakerInfo;

  -[SSRSpeakerAnalyzerPSR getVoiceRecognizerResults](self->_psrAnalyzer, "getVoiceRecognizerResults");
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  lastSpeakerInfo = self->_lastSpeakerInfo;
  self->_lastSpeakerInfo = v3;

  return self->_lastSpeakerInfo;
}

- (unint64_t)getSpeakerRecognizerProcessingTime
{
  return -[SSRSpeakerAnalyzerPSR getEARSyncPSRAudioProcessorProcessingTime](self->_psrAnalyzer, "getEARSyncPSRAudioProcessorProcessingTime");
}

- (void)voiceRecognitionPSRAnalyzer:(id)a3 hasVoiceRecognitionInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  float extraSamplesAtStart;
  float v10;
  float v11;
  float vtEndInSampleCount;
  float v13;
  float v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *lastSpeakerInfo;
  NSDictionary *v21;
  id WeakRetained;
  void *v23;
  SSRSpeakerRecognitionContext *spIdCtx;
  void *v25;
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sessionId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && !-[NSString isEqualToString:](self->_sessionId, "isEqualToString:", v6))
  {
    v23 = (void *)*MEMORY[0x24BE28360];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    spIdCtx = self->_spIdCtx;
    v8 = v23;
    -[SSRSpeakerRecognitionContext sessionId](spIdCtx, "sessionId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 136315650;
    v27 = "-[SSRSpeakerRecognizerPSR voiceRecognitionPSRAnalyzer:hasVoiceRecognitionInfo:]";
    v28 = 2114;
    v29 = v25;
    v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Discarded ScoreCard for mismatch session - {%{public}@, %{public}@}", (uint8_t *)&v26, 0x20u);

  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("psrContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");

    extraSamplesAtStart = (float)self->_extraSamplesAtStart;
    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    v11 = (float)(extraSamplesAtStart / v10) * 1000.0;
    vtEndInSampleCount = (float)self->_vtEndInSampleCount;
    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    v14 = (float)(vtEndInSampleCount / v13) * 1000.0;
    *(float *)&v15 = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v16, CFSTR("extraAudioAtStartInMs"));

    *(float *)&v17 = v14;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v18, CFSTR("tdEndInMs"));

    v19 = (NSDictionary *)objc_msgSend(v5, "mutableCopy");
    -[NSDictionary setObject:forKey:](v19, "setObject:forKey:", v8, CFSTR("psrContext"));
    lastSpeakerInfo = self->_lastSpeakerInfo;
    self->_lastSpeakerInfo = v19;
    v21 = v19;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "speakerRecognizer:hasSpeakerIdInfo:", self, v21);

  }
LABEL_5:

}

- (void)voiceRecognitionPSRAnalyzerFinishedProcessing:(id)a3 withVoiceRecognitionInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  float extraSamplesAtStart;
  float v10;
  float v11;
  float vtEndInSampleCount;
  float v13;
  float v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *lastSpeakerInfo;
  NSDictionary *v21;
  id WeakRetained;
  void *v23;
  SSRSpeakerRecognitionContext *spIdCtx;
  void *v25;
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sessionId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && !-[NSString isEqualToString:](self->_sessionId, "isEqualToString:", v6))
  {
    v23 = (void *)*MEMORY[0x24BE28360];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    spIdCtx = self->_spIdCtx;
    v8 = v23;
    -[SSRSpeakerRecognitionContext sessionId](spIdCtx, "sessionId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 136315650;
    v27 = "-[SSRSpeakerRecognizerPSR voiceRecognitionPSRAnalyzerFinishedProcessing:withVoiceRecognitionInfo:]";
    v28 = 2114;
    v29 = v25;
    v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Discarded ScoreCard for mismatch session - {%{public}@, %{public}@}", (uint8_t *)&v26, 0x20u);

  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("psrContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");

    extraSamplesAtStart = (float)self->_extraSamplesAtStart;
    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    v11 = (float)(extraSamplesAtStart / v10) * 1000.0;
    vtEndInSampleCount = (float)self->_vtEndInSampleCount;
    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    v14 = (float)(vtEndInSampleCount / v13) * 1000.0;
    *(float *)&v15 = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v16, CFSTR("extraAudioAtStartInMs"));

    *(float *)&v17 = v14;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v8, "setObject:forKey:", v18, CFSTR("tdEndInMs"));

    v19 = (NSDictionary *)objc_msgSend(v5, "mutableCopy");
    -[NSDictionary setObject:forKey:](v19, "setObject:forKey:", v8, CFSTR("psrContext"));
    lastSpeakerInfo = self->_lastSpeakerInfo;
    self->_lastSpeakerInfo = v19;
    v21 = v19;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "speakerRecognizerFinishedProcessing:withFinalSpeakerIdInfo:", self, v21);

  }
LABEL_5:

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

- (unint64_t)vtEndInSampleCount
{
  return self->_vtEndInSampleCount;
}

- (void)setVtEndInSampleCount:(unint64_t)a3
{
  self->_vtEndInSampleCount = a3;
}

- (unint64_t)endInSampleCount
{
  return self->_endInSampleCount;
}

- (void)setEndInSampleCount:(unint64_t)a3
{
  self->_endInSampleCount = a3;
}

- (unint64_t)numSamplesProcessed
{
  return self->_numSamplesProcessed;
}

- (void)setNumSamplesProcessed:(unint64_t)a3
{
  self->_numSamplesProcessed = a3;
}

- (BOOL)processingEnded
{
  return self->_processingEnded;
}

- (void)setProcessingEnded:(BOOL)a3
{
  self->_processingEnded = a3;
}

- (unint64_t)totalNumSamplesReceived
{
  return self->_totalNumSamplesReceived;
}

- (void)setTotalNumSamplesReceived:(unint64_t)a3
{
  self->_totalNumSamplesReceived = a3;
}

- (SSRSpeakerAnalyzerPSR)psrAnalyzer
{
  return self->_psrAnalyzer;
}

- (void)setPsrAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_psrAnalyzer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psrAnalyzer, 0);
  objc_storeStrong((id *)&self->_invocationStyleStr, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastSpeakerInfo, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_spIdCtx, 0);
}

@end
