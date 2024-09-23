@implementation SRUIFSpeechSynthesisTask

- (SRUIFSpeechSynthesisTask)initWithText:(id)a3 audioData:(id)a4 identifier:(id)a5 sessionId:(id)a6 preferredVoice:(id)a7 language:(id)a8 gender:(id)a9 provisional:(BOOL)a10 eligibleAfterDuration:(double)a11 delayed:(BOOL)a12 preparation:(id)a13 completion:(id)a14 analyticsContext:(id)a15 speakableContextInfo:(id)a16 canUseServerTTS:(BOOL)a17 eligibilityChangedQueue:(id)a18
{
  void (**v24)(id, _QWORD *);
  id v25;
  id v26;
  NSObject *v27;
  SRUIFSpeechSynthesisTask *v28;
  uint64_t v29;
  NSString *text;
  uint64_t v31;
  NSString *identifier;
  uint64_t v33;
  NSString *sessionId;
  uint64_t v35;
  id completion;
  uint64_t v37;
  NSDictionary *analyticsContext;
  uint64_t v39;
  NSDictionary *speakableContextInfo;
  uint64_t v41;
  NSString *language;
  uint64_t v43;
  NSString *gender;
  uint64_t v45;
  SAUIAudioData *audioData;
  uint64_t v47;
  uint64_t v48;
  os_log_t *v49;
  void *v50;
  NSObject *v51;
  SRUIFSpeechSynthesisTask *v52;
  NSString *v53;
  uint64_t v54;
  NSObject *v55;
  dispatch_time_t v56;
  id v58;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  _QWORD block[4];
  SRUIFSpeechSynthesisTask *v68;
  id v69;
  _QWORD v70[4];
  NSObject *v71;
  id v72;
  id location;
  objc_super v74;
  uint8_t buf[4];
  const char *v76;
  __int16 v77;
  SRUIFSpeechSynthesisTask *v78;
  __int16 v79;
  double v80;
  __int16 v81;
  NSString *v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v63 = a3;
  v60 = a4;
  v65 = a5;
  v64 = a6;
  v58 = a7;
  v62 = a8;
  v61 = a9;
  v24 = (void (**)(id, _QWORD *))a13;
  v66 = a14;
  v25 = a15;
  v26 = a16;
  v27 = a18;
  v74.receiver = self;
  v74.super_class = (Class)SRUIFSpeechSynthesisTask;
  v28 = -[SRUIFSpeechSynthesisTask init](&v74, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v63, "copy");
    text = v28->_text;
    v28->_text = (NSString *)v29;

    v31 = objc_msgSend(v65, "copy");
    identifier = v28->_identifier;
    v28->_identifier = (NSString *)v31;

    v33 = objc_msgSend(v64, "copy");
    sessionId = v28->_sessionId;
    v28->_sessionId = (NSString *)v33;

    objc_storeStrong((id *)&v28->_preferredVoice, a7);
    v28->_canUseServerTTS = 1;
    v28->_provisional = a10;
    v28->_delayed = a12;
    v35 = MEMORY[0x220736DE0](v66);
    completion = v28->_completion;
    v28->_completion = (id)v35;

    v37 = objc_msgSend(v25, "copy");
    analyticsContext = v28->_analyticsContext;
    v28->_analyticsContext = (NSDictionary *)v37;

    v39 = objc_msgSend(v26, "copy");
    speakableContextInfo = v28->_speakableContextInfo;
    v28->_speakableContextInfo = (NSDictionary *)v39;

    v41 = objc_msgSend(v62, "copy");
    language = v28->_language;
    v28->_language = (NSString *)v41;

    v43 = objc_msgSend(v61, "copy");
    gender = v28->_gender;
    v28->_gender = (NSString *)v43;

    v45 = objc_msgSend(v60, "copy");
    audioData = v28->_audioData;
    v28->_audioData = (SAUIAudioData *)v45;

    v28->_shouldCache = 1;
    v28->_canUseServerTTS = a17;
    -[SRUIFSpeechSynthesisTask _setDurationHasElapsed:](v28, "_setDurationHasElapsed:", a11 <= 0.0);
    -[SRUIFSpeechSynthesisTask _setPreparationBlockCompleted:](v28, "_setPreparationBlockCompleted:", v24 == 0);
    if (-[SRUIFSpeechSynthesisTask preparationBlockCompleted](v28, "preparationBlockCompleted"))
      v47 = -[SRUIFSpeechSynthesisTask durationHasElapsed](v28, "durationHasElapsed");
    else
      v47 = 0;
    -[SRUIFSpeechSynthesisTask _setEligibleForProcessing:](v28, "_setEligibleForProcessing:", v47);
    if (-[SRUIFSpeechSynthesisTask preparationBlockCompleted](v28, "preparationBlockCompleted")
      && -[SRUIFSpeechSynthesisTask durationHasElapsed](v28, "durationHasElapsed"))
    {
      v48 = -[SRUIFSpeechSynthesisTask isDelayed](v28, "isDelayed") ^ 1;
    }
    else
    {
      v48 = 0;
    }
    -[SRUIFSpeechSynthesisTask _setEligibleForSynthesis:](v28, "_setEligibleForSynthesis:", v48);
    v49 = (os_log_t *)MEMORY[0x24BE08FB0];
    v50 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v51 = v50;
      v52 = (SRUIFSpeechSynthesisTask *)MEMORY[0x220736DE0](v24);
      v53 = v28->_identifier;
      *(_DWORD *)buf = 136315906;
      v76 = "-[SRUIFSpeechSynthesisTask initWithText:audioData:identifier:sessionId:preferredVoice:language:gender:provis"
            "ional:eligibleAfterDuration:delayed:preparation:completion:analyticsContext:speakableContextInfo:canUseServe"
            "rTTS:eligibilityChangedQueue:]";
      v77 = 2112;
      v78 = v52;
      v79 = 2048;
      v80 = a11;
      v81 = 2112;
      v82 = v53;
      _os_log_impl(&dword_219F26000, v51, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Preparaton: %@, Eligibility delay: %f - %@", buf, 0x2Au);

    }
    objc_initWeak(&location, v28);
    v54 = MEMORY[0x24BDAC760];
    if (v24)
    {
      v55 = *v49;
      if (os_log_type_enabled(*v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v76 = "-[SRUIFSpeechSynthesisTask initWithText:audioData:identifier:sessionId:preferredVoice:language:gender:prov"
              "isional:eligibleAfterDuration:delayed:preparation:completion:analyticsContext:speakableContextInfo:canUseS"
              "erverTTS:eligibilityChangedQueue:]";
        v77 = 2112;
        v78 = v28;
        _os_log_impl(&dword_219F26000, v55, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Executing preparation block for %@", buf, 0x16u);
      }
      v70[0] = v54;
      v70[1] = 3221225472;
      v70[2] = __246__SRUIFSpeechSynthesisTask_initWithText_audioData_identifier_sessionId_preferredVoice_language_gender_provisional_eligibleAfterDuration_delayed_preparation_completion_analyticsContext_speakableContextInfo_canUseServerTTS_eligibilityChangedQueue___block_invoke;
      v70[3] = &unk_24DC1B988;
      v71 = v27;
      objc_copyWeak(&v72, &location);
      v24[2](v24, v70);
      objc_destroyWeak(&v72);

    }
    if (a11 > 0.0)
    {
      v56 = dispatch_time(0, (uint64_t)(a11 * 1000000000.0));
      block[0] = v54;
      block[1] = 3221225472;
      block[2] = __246__SRUIFSpeechSynthesisTask_initWithText_audioData_identifier_sessionId_preferredVoice_language_gender_provisional_eligibleAfterDuration_delayed_preparation_completion_analyticsContext_speakableContextInfo_canUseServerTTS_eligibilityChangedQueue___block_invoke_2;
      block[3] = &unk_24DC1B9B0;
      v68 = v28;
      objc_copyWeak(&v69, &location);
      dispatch_after(v56, v27, block);
      objc_destroyWeak(&v69);

    }
    objc_destroyWeak(&location);
  }

  return v28;
}

void __246__SRUIFSpeechSynthesisTask_initWithText_audioData_identifier_sessionId_preferredVoice_language_gender_provisional_eligibleAfterDuration_delayed_preparation_completion_analyticsContext_speakableContextInfo_canUseServerTTS_eligibilityChangedQueue___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a2;
  v6 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __246__SRUIFSpeechSynthesisTask_initWithText_audioData_identifier_sessionId_preferredVoice_language_gender_provisional_eligibleAfterDuration_delayed_preparation_completion_analyticsContext_speakableContextInfo_canUseServerTTS_eligibilityChangedQueue___block_invoke_2;
  block[3] = &unk_24DC1A798;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v9 = v5;
  v11 = a3;
  v7 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
}

void __246__SRUIFSpeechSynthesisTask_initWithText_audioData_identifier_sessionId_preferredVoice_language_gender_provisional_eligibleAfterDuration_delayed_preparation_completion_analyticsContext_speakableContextInfo_canUseServerTTS_eligibilityChangedQueue___block_invoke_2(uint64_t a1)
{
  id *v2;
  _BYTE *WeakRetained;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _BOOL8 v10;
  int v11;
  const char *v12;
  __int16 v13;
  _BYTE *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[SRUIFSpeechSynthesisTask initWithText:audioData:identifier:sessionId:preferredVoice:language:gender:provis"
            "ional:eligibleAfterDuration:delayed:preparation:completion:analyticsContext:speakableContextInfo:canUseServe"
            "rTTS:eligibilityChangedQueue:]_block_invoke_2";
      v13 = 2112;
      v14 = WeakRetained;
      _os_log_impl(&dword_219F26000, v4, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Preparation complete for %@", (uint8_t *)&v11, 0x16u);
    }
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "_setText:", *(_QWORD *)(a1 + 32));

    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "_setPreparationBlockCompleted:", 1);

    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "_updateSynthesisEligibility");

    v8 = objc_loadWeakRetained(v2);
    v9 = v8;
    if (WeakRetained[21])
      v10 = *(_BYTE *)(a1 + 48) == 0;
    else
      v10 = 0;
    objc_msgSend(v8, "setCanUseServerTTS:", v10);

  }
}

{
  NSObject *v2;
  uint64_t v3;
  id *v4;
  id WeakRetained;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 136315394;
    v8 = "-[SRUIFSpeechSynthesisTask initWithText:audioData:identifier:sessionId:preferredVoice:language:gender:provision"
         "al:eligibleAfterDuration:delayed:preparation:completion:analyticsContext:speakableContextInfo:canUseServerTTS:e"
         "ligibilityChangedQueue:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_219F26000, v2, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Eligibility delay elapsed %@", (uint8_t *)&v7, 0x16u);
  }
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_setDurationHasElapsed:", 1);

  v6 = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "_updateSynthesisEligibility");

}

- (void)setDelayed:(BOOL)a3
{
  if (self->_delayed != a3)
  {
    self->_delayed = a3;
    if (!a3)
      -[SRUIFSpeechSynthesisTask _updateSynthesisEligibility](self, "_updateSynthesisEligibility");
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  void *v22;

  if (-[SRUIFSpeechSynthesisTask canUseServerTTS](self, "canUseServerTTS"))
  {
    -[SRUIFSpeechSynthesisTask text](self, "text");
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = CFSTR("<private>");
  }
  -[SRUIFSpeechSynthesisTask identifier](self, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFSpeechSynthesisTask sessionId](self, "sessionId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAUIAudioData audioBuffer](self->_audioData, "audioBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v3, "length");

  -[SRUIFSpeechSynthesisTask language](self, "language");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFSpeechSynthesisTask gender](self, "gender");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFSpeechSynthesisTask isDelayed](self, "isDelayed");
  -[SRUIFSpeechSynthesisTask isProvisional](self, "isProvisional");
  -[SRUIFSpeechSynthesisTask canUseServerTTS](self, "canUseServerTTS");
  -[SRUIFSpeechSynthesisTask isEligibleForProcessing](self, "isEligibleForProcessing");
  -[SRUIFSpeechSynthesisTask isEligibleForSynthesis](self, "isEligibleForSynthesis");
  -[SRUIFSpeechSynthesisTask synthesisError](self, "synthesisError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFSpeechSynthesisTask _completion](self, "_completion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD17C8];
  v15 = objc_opt_class();
  NSStringFromBOOL();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x220736DE0](v14);
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@ %p; text=\"%@\"; identifier=%@; sessionId=%@; delayed=%@; provisional=%@; eligibleForProcessing=%@; eligibleForSynthesis=%@; canUseServerTTS=%@; language=%@; gender=%@; audioByteCount=%@; error=%@; completion=%p>"),
    v15,
    self,
    v21,
    v22,
    v20,
    v12,
    v4,
    v5,
    v6,
    v7,
    v16,
    v18,
    v8,
    v13,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)executeCompletion
{
  void *v3;
  int64_t synthesisResult;
  NSObject *v5;
  void *v6;
  NSError *synthesisError;
  void *v8;
  id completion;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  NSError *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_completion)
  {
    v3 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      synthesisResult = self->_synthesisResult;
      v5 = v3;
      SRUIFSpeechSynthesisResultGetName(synthesisResult);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      synthesisError = self->_synthesisError;
      -[SRUIFSpeechSynthesisTask identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315906;
      v11 = "-[SRUIFSpeechSynthesisTask executeCompletion]";
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = synthesisError;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s #tts [Post] Completion Result: %@ Error: %@, Task: %@", (uint8_t *)&v10, 0x2Au);

    }
    (*((void (**)(void))self->_completion + 2))();
    completion = self->_completion;
    self->_completion = 0;

  }
}

- (void)_updateSynthesisEligibility
{
  _BOOL4 eligibleForProcessing;
  _BOOL4 eligibleForSynthesis;
  _BOOL8 v5;
  uint64_t v6;
  id v7;

  eligibleForProcessing = self->_eligibleForProcessing;
  eligibleForSynthesis = self->_eligibleForSynthesis;
  if (-[SRUIFSpeechSynthesisTask preparationBlockCompleted](self, "preparationBlockCompleted"))
    v5 = -[SRUIFSpeechSynthesisTask durationHasElapsed](self, "durationHasElapsed");
  else
    v5 = 0;
  -[SRUIFSpeechSynthesisTask _setEligibleForProcessing:](self, "_setEligibleForProcessing:", v5);
  if (-[SRUIFSpeechSynthesisTask preparationBlockCompleted](self, "preparationBlockCompleted")
    && -[SRUIFSpeechSynthesisTask durationHasElapsed](self, "durationHasElapsed"))
  {
    v6 = -[SRUIFSpeechSynthesisTask isDelayed](self, "isDelayed") ^ 1;
  }
  else
  {
    v6 = 0;
  }
  -[SRUIFSpeechSynthesisTask _setEligibleForSynthesis:](self, "_setEligibleForSynthesis:", v6);
  if (eligibleForProcessing != self->_eligibleForProcessing || eligibleForSynthesis != self->_eligibleForSynthesis)
  {
    -[SRUIFSpeechSynthesisTask delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "taskEligibilityDidChange:", self);

  }
}

- (void)_setEligibleForProcessing:(BOOL)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  SRUIFSpeechSynthesisTask *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_eligibleForProcessing != a3)
  {
    self->_eligibleForProcessing = a3;
    if (a3)
    {
      v4 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315394;
        v6 = "-[SRUIFSpeechSynthesisTask _setEligibleForProcessing:]";
        v7 = 2112;
        v8 = self;
        _os_log_impl(&dword_219F26000, v4, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Processing eligibility updated %@", (uint8_t *)&v5, 0x16u);
      }
    }
  }
}

- (void)_setEligibleForSynthesis:(BOOL)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  SRUIFSpeechSynthesisTask *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_eligibleForSynthesis != a3)
  {
    self->_eligibleForSynthesis = a3;
    if (a3)
    {
      v4 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315394;
        v6 = "-[SRUIFSpeechSynthesisTask _setEligibleForSynthesis:]";
        v7 = 2112;
        v8 = self;
        _os_log_impl(&dword_219F26000, v4, OS_LOG_TYPE_DEFAULT, "%s #tts [Pre] Synthisis eligibility updated %@", (uint8_t *)&v5, 0x16u);
      }
    }
  }
}

- (NSString)text
{
  return self->_text;
}

- (void)_setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SAUIAudioData)audioData
{
  return self->_audioData;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (SAVoice)preferredVoice
{
  return self->_preferredVoice;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)gender
{
  return self->_gender;
}

- (BOOL)isPhonetic
{
  return self->_isPhonetic;
}

- (void)setIsPhonetic:(BOOL)a3
{
  self->_isPhonetic = a3;
}

- (BOOL)isEligibleForSynthesis
{
  return self->_eligibleForSynthesis;
}

- (BOOL)isEligibleForProcessing
{
  return self->_eligibleForProcessing;
}

- (BOOL)isProvisional
{
  return self->_provisional;
}

- (BOOL)isDelayed
{
  return self->_delayed;
}

- (BOOL)canUseServerTTS
{
  return self->_canUseServerTTS;
}

- (void)setCanUseServerTTS:(BOOL)a3
{
  self->_canUseServerTTS = a3;
}

- (SiriTTSBaseRequest)ttsSessionRequest
{
  return self->_ttsSessionRequest;
}

- (void)setTtsSessionRequest:(id)a3
{
  objc_storeStrong((id *)&self->_ttsSessionRequest, a3);
}

- (int64_t)synthesisResult
{
  return self->_synthesisResult;
}

- (void)setSynthesisResult:(int64_t)a3
{
  self->_synthesisResult = a3;
}

- (NSError)synthesisError
{
  return self->_synthesisError;
}

- (void)setSynthesisError:(id)a3
{
  objc_storeStrong((id *)&self->_synthesisError, a3);
}

- (SRUIFSpeechSynthesisTaskDelegate)delegate
{
  return (SRUIFSpeechSynthesisTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)analyticsContext
{
  return self->_analyticsContext;
}

- (NSDictionary)speakableContextInfo
{
  return self->_speakableContextInfo;
}

- (void)setSpeakableContextInfo:(id)a3
{
  objc_storeStrong((id *)&self->_speakableContextInfo, a3);
}

- (BOOL)shouldCache
{
  return self->_shouldCache;
}

- (void)setShouldCache:(BOOL)a3
{
  self->_shouldCache = a3;
}

- (id)_completion
{
  return self->_completion;
}

- (BOOL)preparationBlockCompleted
{
  return self->_preparationBlockCompleted;
}

- (void)_setPreparationBlockCompleted:(BOOL)a3
{
  self->_preparationBlockCompleted = a3;
}

- (BOOL)durationHasElapsed
{
  return self->_durationHasElapsed;
}

- (void)_setDurationHasElapsed:(BOOL)a3
{
  self->_durationHasElapsed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_speakableContextInfo, 0);
  objc_storeStrong((id *)&self->_analyticsContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_synthesisError, 0);
  objc_storeStrong((id *)&self->_ttsSessionRequest, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_preferredVoice, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_audioData, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
