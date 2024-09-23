@implementation SSRSpeakerRecognitionController

- (SSRSpeakerRecognitionController)initWithContext:(id)a3 withDelegate:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  SSRSpeakerRecognitionController *v11;
  SSRSpeakerRecognitionOrchestrator *v12;
  id v13;
  SSRSpeakerRecognitionOrchestrator *orchestrator;
  SSRSpeakerRecognitionController *v15;
  id v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SSRSpeakerRecognitionController;
  v11 = -[SSRSpeakerRecognitionController init](&v18, sel_init);
  if (!v11)
    goto LABEL_8;
  v17 = 0;
  v12 = -[SSRSpeakerRecognitionOrchestrator initWithContext:withDelegate:error:]([SSRSpeakerRecognitionOrchestrator alloc], "initWithContext:withDelegate:error:", v9, v11, &v17);
  v13 = v17;
  orchestrator = v11->_orchestrator;
  v11->_orchestrator = v12;

  if (!v13 && v11->_orchestrator)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    objc_storeStrong((id *)&v11->_context, a3);
LABEL_8:
    v15 = v11;
    goto LABEL_9;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v13);

  v15 = 0;
LABEL_9:

  return v15;
}

- (void)processAudio:(id)a3 withNumberOfSamples:(unint64_t)a4
{
  -[SSRSpeakerRecognitionOrchestrator processAudio:numSamples:](self->_orchestrator, "processAudio:numSamples:", a3, a4);
}

- (void)endAudio
{
  -[SSRSpeakerRecognitionOrchestrator endAudio](self->_orchestrator, "endAudio");
}

- (id)resetWithContext:(id)a3
{
  id v3;

  v3 = -[SSRSpeakerRecognitionOrchestrator resetWithContext:](self->_orchestrator, "resetWithContext:", a3);
  return 0;
}

- (id)getLatestSpeakerInfo
{
  return -[SSRSpeakerRecognitionOrchestrator getLatestVoiceRecognitionInfo](self->_orchestrator, "getLatestVoiceRecognitionInfo");
}

- (unint64_t)getPSRProcessingTime
{
  return -[SSRSpeakerRecognitionOrchestrator getPSRProcessingTime](self->_orchestrator, "getPSRProcessingTime");
}

- (void)voiceRecognitionOrchestrator:(id)a3 hasVoiceRecognitionInfo:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  float v14;
  double v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id WeakRetained;
  char v22;
  NSObject *v23;
  void *lastScoreCard;
  NSObject *v25;
  os_log_t v26;
  SSRSpeakerRecognitionContext *context;
  void *v28;
  NSDictionary *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  _BYTE v33[14];
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE28360];
  v9 = (void *)*MEMORY[0x24BE28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("segmentCounter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("segmentStartTime"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v15 = v14;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("spIdAudioProcessedDuration"));
    v16 = v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("spIdKnownUserScores"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v31 = "-[SSRSpeakerRecognitionController voiceRecognitionOrchestrator:hasVoiceRecognitionInfo:]";
    v32 = 1026;
    *(_DWORD *)v33 = v12;
    *(_WORD *)&v33[4] = 2050;
    *(double *)&v33[6] = v15;
    v34 = 1024;
    v35 = v18;
    v36 = 2114;
    v37 = v19;
    _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Scorecard for {%{public}d, %{public}.2fsec %dms} - %{public}@", buf, 0x2Cu);

    v6 = v16;
    v8 = (os_log_t *)MEMORY[0x24BE28360];

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("spIdKnownUserScores"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v22 = objc_opt_respondsToSelector();

    if ((v22 & 1) != 0)
    {
      v23 = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject speakerRecognitionController:hasSpeakerInfo:](v23, "speakerRecognitionController:hasSpeakerInfo:", self, v7);
    }
    else
    {
      v26 = *v8;
      if (!os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:
        v29 = (NSDictionary *)v7;
        lastScoreCard = self->_lastScoreCard;
        self->_lastScoreCard = v29;
        goto LABEL_12;
      }
      context = self->_context;
      v23 = v26;
      -[SSRSpeakerRecognitionContext sessionId](context, "sessionId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v31 = "-[SSRSpeakerRecognitionController voiceRecognitionOrchestrator:hasVoiceRecognitionInfo:]";
      v32 = 2114;
      *(_QWORD *)v33 = v28;
      _os_log_impl(&dword_2117D4000, v23, OS_LOG_TYPE_DEFAULT, "%s Discarded speaker scores for session - %{public}@", buf, 0x16u);

    }
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Scorecard not available in score dictionary - %@"), v7);
  lastScoreCard = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[SSRSpeakerRecognitionController voiceRecognitionOrchestrator:hasVoiceRecognitionInfo:]";
    v32 = 2112;
    *(_QWORD *)v33 = lastScoreCard;
    _os_log_impl(&dword_2117D4000, v25, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
LABEL_12:

}

- (void)voiceRecognitionOrchestratorFinishedProcessing:(id)a3 withFinalVoiceRecognitionInfo:(id)a4
{
  id v6;
  NSDictionary *v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id WeakRetained;
  char v13;
  NSObject *v14;
  os_log_t v15;
  SSRSpeakerRecognitionContext *context;
  void *v17;
  NSDictionary *lastScoreCard;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (NSDictionary *)a4;
  v8 = (os_log_t *)MEMORY[0x24BE28360];
  v9 = (void *)*MEMORY[0x24BE28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("spIdKnownUserScores"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136315394;
    v20 = "-[SSRSpeakerRecognitionController voiceRecognitionOrchestratorFinishedProcessing:withFinalVoiceRecognitionInfo:]";
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Final - %@", (uint8_t *)&v19, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject speakerRecognitionFinishedProcessing:withFinalSpeakerInfo:](v14, "speakerRecognitionFinishedProcessing:withFinalSpeakerInfo:", self, v7);
LABEL_7:

    goto LABEL_8;
  }
  v15 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    context = self->_context;
    v14 = v15;
    -[SSRSpeakerRecognitionContext sessionId](context, "sessionId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136315394;
    v20 = "-[SSRSpeakerRecognitionController voiceRecognitionOrchestratorFinishedProcessing:withFinalVoiceRecognitionInfo:]";
    v21 = 2114;
    v22 = v17;
    _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s Discarded speaker scores for session - %{public}@", (uint8_t *)&v19, 0x16u);

    goto LABEL_7;
  }
LABEL_8:
  lastScoreCard = self->_lastScoreCard;
  self->_lastScoreCard = v7;

}

- (SSRSpeakerRecognitionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (SSRSpeakerRecognitionControllerDelegate)delegate
{
  return (SSRSpeakerRecognitionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SSRSpeakerRecognitionOrchestrator)orchestrator
{
  return self->_orchestrator;
}

- (void)setOrchestrator:(id)a3
{
  objc_storeStrong((id *)&self->_orchestrator, a3);
}

- (NSDictionary)lastScoreCard
{
  return self->_lastScoreCard;
}

- (void)setLastScoreCard:(id)a3
{
  objc_storeStrong((id *)&self->_lastScoreCard, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastScoreCard, 0);
  objc_storeStrong((id *)&self->_orchestrator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
